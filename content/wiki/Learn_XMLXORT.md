---
title: "Learn XMLXORT"
---
# Learn XMLXORT

ok, first question is why xmlxort. because many information are not in
gff3.

second question is how.
<a href="http://www.acedb.org/" class="external text"
rel="nofollow">acedb</a> underlines wormbase and acedb is organized into
ace classes. the classes are
<a href="http://wormbase.org/db/misc/database_stats"
class="external text" rel="nofollow">here</a>. seems to me there are two
strategies: first, for each class in ace set up a procedure to migrate
its info into chado, this is like gff3 to chado, have to do a 'chain
reaction' on chado tables; the good news is that we don't need to do
'join' on the acedb side and once we are done, we know all data have
been migrated. second, for each module in chado get the required
information from acedb, we will do a lot of join on acedb side,
potential problem is we donnot know whether we have migrated all the
data. Which strategy to use?

steps: I will first try on the rudimental table, such as cv(?), biblio,
db(?).

  classes</span>](#wormbase_acedb_classes)
- [chado database
  ddl](#chado_database_ddl)
- [chadoxml
  dtd](#chadoxml_dtd)
- [chadoxml](#chadoxml)
- [migration](#migration)
  - [mapping
    wormbase info to chado](#mapping_wormbase_info_to_chado)
  - [extract
    info from wormbase using AcePerl (sample
    code)](#extract_info_from_wormbase_using_AcePerl_.28sample_code.29)
  - [write
    chadoxml (sample xml)](#write_chadoxml_.28sample_xml.29)
  - [validate
    xml file](#validate_xml_file)
  - [load xml
    file](#load_xml_file)
- [order is
  important for loading](#order_is_important_for_loading)
- [extend chado
  schema](#extend_chado_schema)
- [cvterm is most
  important for chado](#cvterm_is_most_important_for_chado)
- [strain from
  wormbase to stock from
  chado](#strain_from_wormbase_to_stock_from_chado)
- [transgene
  from wormbase to feature from
  chado](#transgene_from_wormbase_to_feature_from_chado)
- [variation
  from wormbase](#variation_from_wormbase)

## wormbase acedb classes

I started with class Paper. acedb classes are mixture of c structure and
database description. pointers are to other class object. class paper
points to class author, person, person_name, keyword?, address, role,
laboratory. some are weak reference (circular, back_ref, dealt in perl
module scalar::util, interesting it is here) obviously, a lot of *ad
hoc* reading script needed.

## chado database ddl

there is a file named chado.ddl in xmlxort/example/, schema/dat/. the
grammar can be found at
<a href="http://www.postgresql.org/docs/8.1/static/sql-createtable.html"
class="external text" rel="nofollow">postgresql create table command</a>.

## chadoxml dtd

## chadoxml

- chadoxml is a direct, fixed mapping of the chado schema;
- change to ddl will map to change to dtd by a program
  chado_dtd_creator.pl in xmlxort/examples
- can delete, update(alter), new(create), etc using XML.
- no module in xml
- table map to element, foreign table maps to nested element
    <pub>
       <pubprop>
          ....
       </pubprop>
    </pub>

- column map to nested element
    <pub>
       <uniquename>this paper</uniquename>
    </pub>

- xml attributes only a few, usually for database transaction, such as
  lookup, insert, delete, update, force. default is force, i.e,combining
  lookup/update/insert.
    <pub op='lookup'>

- macro_id for save space, since XML could be quite long
    <pub id='WBPaper000001'>
      <title>....
      <miniref>....
      <volumn>
    <stock_pub>
       <pub_id>
          <pub>WBPaper000001</pub>

- use \<pub_id\> instead of \<pub\> if the schema ask for a column of
  pub_id. this is always true in chado for foreign key. see above
  example.

## migration

I first wrote a read and a write part for migrating paper class object.
after I finished write subroutine with XML::Writer, I found it just
mimics the tree structure of chadoxml, so apparently a fixed DOM object
( a fixed-structured tree) for each table will do most of the writing
job. So I need to read acedb (multi classes) to extract info for a table
and represent it into a **DOM** object. this is what I think I will do
in the next several months.

### mapping wormbase info to chado

<a href="http://www.wormbase.org/db/misc/model?class=Paper"
class="external text" rel="nofollow">here</a> is the paper class model
in Wormbase.
<a href="http://search.cpan.org/~lds/AcePerl-1.91/Ace/Object.pm"
class="external text" rel="nofollow">AcePerl</a> is here. mapping from
Wormbase to chado is as following:

- paper-\>Cgc_name etc. --\> pub_dbxref (CGC/PubMed/Medline)
- paper-\>Merged_into --\> pub_relationship (makes obsolete)
- paper-\>Status --\> pub.is_obsolete=FALSE
- paper-\>Erratum --\> pub_relationship (corrects)
- paper-\>Journal ---\>pub_relationship (journal is another pub,
  type=journal)
- paper-\>Reference-\>title etc. ---\> pub (title, pages, volume, issue,
  year, publisher)
- paper-\>In_book pub_relationship (book is another pub, type=book)
- paper-\>journal and paper-\>Contained_in ---\>pub_relationship
  (published in)
- paper-\>author ----\>pubauthor
- paper-\>B rief_citation --\>pub.miniref (modified)
- paper-\>Abstract, paper-\>Keyword ---\> pubprop
  (type=abstract/keyword)
- paper-\>Type --\> pub.type_id
- pubprop (type=paper remark)

### extract info from wormbase using AcePerl (sample code)

     sub read_paper_pub {
       my $paper = shift;
       my %info;
       $info{uniquename} = $paper->name;
       ...........
       if (defined($paper->Page)) {
           my @pages = $paper->Page->row;
           if (scalar @pages == 1) {
               $info{pages} = $pages[0]->name;
           } elsif (scalar @pages == 2) {
               $info{pages} = join "-", ($pages[0]->name, $pages[1]->name);
           }
       }

### write chadoxml (sample xml)

    sub write_paper_pub {
       my $paper = shift;
       my $fh = shift;
       my $p_href = &read_paper_pub($paper);
       my $doc = new XML::DOM::Document;
       my $root = $doc->createElement("chado");
       my $pub_el = create_ch_pub(doc => $doc,
                                  no_lookup => 1,
                                  %$p_href);
       ........
       if (defined($paper->CGC_name)) {
           my $db = 'CGC';
           my $accession = substr($paper->CGC_name->name, 3);
           my $is_current = 't';
           my $pd_el = create_ch_pub_dbxref(doc => $doc,
                                            db => $db,
                                            accession => $accession,
                                            no_lookup => 1);
           $pub_el->appendChild($pd_el);
       }
       ........
       if (defined($paper->Abstract)) {
           my %abstract = ();
           $abstract{type} = 'pubmed_abstract';
           if ($paper->Abstract->right->name ne ) {
               $abstract{value} = $paper->Abstract->right->name;
               my $pp_el = create_ch_pubprop(doc => $doc,
                                             %abstract);
               $pub_el->appendChild($pp_el);
           }
       }
       .........

    sub write_paper_pub_relationship {
       .........
       if (defined($paper->In_book)) {
           my %pr = ();
           $pr{is_object} = 't';
           $pr{rtype} = 'published_in';
           if (defined($paper->In_book->at('Title'))) {
             $pr{uniquename} = $paper->In_book->at('Title')->right->name;
           } else {........
           }
           my $pr_el = create_ch_pub_relationship(doc => $doc;
                                                  %pr);
           $pub_el->appendChild($pr_el);
       }

### validate xml file

    xort_validator.pl -d wormbase_chado -f xml/paper/1.xml -v 1 -b 1

this will connect database to validate the xml file

### load xml file

    xort_loader.pl -d wormbase_chado -f xml/paper/1.xml

## order is important for loading

- load cvterm first, mapping wormbase paper/person type/proptype to
  chado cvterm
- load pub/pubauthor/pubprop, contact/contactprop first, extracting
  related paper/person info
- load pub_relationship/contact_relationship at last, since two
  pub/contact (a relationship)will not exist in xml/db before all
  pub/contact instance get populated.

## extend chado schema

- add a contactprop table rather than alter contact table (e.g, adding
  email column, etc.) this solution is fully extensible.
       1 -- ================================================
       2 -- TABLE: contactprop
       3 -- ================================================
       4
       5 -- contactprop models person/lab properties, such as email, phone, etc.
       6 -- the cvterms come from FOAF project, see the spec at http://xmlns.com/foaf/spec/
       7
       8 create table contactprop (
       9    contactprop_id serial not null,
      10    primary key (contactprop_id),
      11    contact_id int not null,
      12    foreign key (contact_id) references contact (contact_id) on delete cascade,
      13    type_id int not null,
      14    foreign key (type_id) references cvterm (cvterm_id) on delete cascade,
      15    value text,
      16
      17    unique (contact_id, type_id, value)
      18 );
      19 create index contactprop_idx1 on contactprop (contactprop_id);
      20 create index contactprop_idx2 on contactprop (type_id);

## cvterm is most important for chado

the power of chado relies on common and controlled cvterms,
<a href="http://www.foaf-project.org/" class="external text"
rel="nofollow">FOAF</a> cvterms will be reused as much as possible for
contact properties. Plus some terms from WormBase.

## strain from wormbase to stock from chado

straight forward mapping.

## transgene from wormbase to feature from chado

a transgene in wormbase will map to a feature in chado,
type_id=synthetic construct

## variation from wormbase

- variation type == allele will map to feature
- variation type == delete/ will map to ?

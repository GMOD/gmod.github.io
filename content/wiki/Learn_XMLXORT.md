---
title: "Learn XMLXORT"
---




<span id="top"></span>




# <span dir="auto">Learn XMLXORT</span>









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


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">wormbase acedb
  classes</span>](#wormbase_acedb_classes)
- [<span class="tocnumber">2</span> <span class="toctext">chado database
  ddl</span>](#chado_database_ddl)
- [<span class="tocnumber">3</span> <span class="toctext">chadoxml
  dtd</span>](#chadoxml_dtd)
- [<span class="tocnumber">4</span>
  <span class="toctext">chadoxml</span>](#chadoxml)
- [<span class="tocnumber">5</span>
  <span class="toctext">migration</span>](#migration)
  - [<span class="tocnumber">5.1</span> <span class="toctext">mapping
    wormbase info to chado</span>](#mapping_wormbase_info_to_chado)
  - [<span class="tocnumber">5.2</span> <span class="toctext">extract
    info from wormbase using AcePerl (sample
    code)</span>](#extract_info_from_wormbase_using_AcePerl_.28sample_code.29)
  - [<span class="tocnumber">5.3</span> <span class="toctext">write
    chadoxml (sample xml)</span>](#write_chadoxml_.28sample_xml.29)
  - [<span class="tocnumber">5.4</span> <span class="toctext">validate
    xml file</span>](#validate_xml_file)
  - [<span class="tocnumber">5.5</span> <span class="toctext">load xml
    file</span>](#load_xml_file)
- [<span class="tocnumber">6</span> <span class="toctext">order is
  important for loading</span>](#order_is_important_for_loading)
- [<span class="tocnumber">7</span> <span class="toctext">extend chado
  schema</span>](#extend_chado_schema)
- [<span class="tocnumber">8</span> <span class="toctext">cvterm is most
  important for chado</span>](#cvterm_is_most_important_for_chado)
- [<span class="tocnumber">9</span> <span class="toctext">strain from
  wormbase to stock from
  chado</span>](#strain_from_wormbase_to_stock_from_chado)
- [<span class="tocnumber">10</span> <span class="toctext">transgene
  from wormbase to feature from
  chado</span>](#transgene_from_wormbase_to_feature_from_chado)
- [<span class="tocnumber">11</span> <span class="toctext">variation
  from wormbase</span>](#variation_from_wormbase)



## <span id="wormbase_acedb_classes" class="mw-headline">wormbase acedb classes</span>

I started with class Paper. acedb classes are mixture of c structure and
database description. pointers are to other class object. class paper
points to class author, person, person_name, keyword?, address, role,
laboratory. some are weak reference (circular, back_ref, dealt in perl
module scalar::util, interesting it is here) obviously, a lot of *ad
hoc* reading script needed.

## <span id="chado_database_ddl" class="mw-headline">chado database ddl</span>

there is a file named chado.ddl in xmlxort/example/, schema/dat/. the
grammar can be found at
<a href="http://www.postgresql.org/docs/8.1/static/sql-createtable.html"
class="external text" rel="nofollow">postgresql create table command</a>.

## <span id="chadoxml_dtd" class="mw-headline">chadoxml dtd</span>

## <span id="chadoxml" class="mw-headline">chadoxml</span>

- chadoxml is a direct, fixed mapping of the chado schema;
- change to ddl will map to change to dtd by a program
  chado_dtd_creator.pl in xmlxort/examples
- can delete, update(alter), new(create), etc using XML.
- no module in xml
- table map to element, foreign table maps to nested element

<!-- -->

    <pub>
       <pubprop>
          ....
       </pubprop>
    </pub> 

- column map to nested element

<!-- -->

    <pub>
       <uniquename>this paper</uniquename>
    </pub>

- xml attributes only a few, usually for database transaction, such as
  lookup, insert, delete, update, force. default is force, i.e,combining
  lookup/update/insert.

<!-- -->

    <pub op='lookup'>

- macro_id for save space, since XML could be quite long

<!-- -->

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

## <span id="migration" class="mw-headline">migration</span>

I first wrote a read and a write part for migrating paper class object.
after I finished write subroutine with XML::Writer, I found it just
mimics the tree structure of chadoxml, so apparently a fixed DOM object
( a fixed-structured tree) for each table will do most of the writing
job. So I need to read acedb (multi classes) to extract info for a table
and represent it into a **DOM** object. this is what I think I will do
in the next several months.

### <span id="mapping_wormbase_info_to_chado" class="mw-headline">mapping wormbase info to chado</span>

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

### <span id="extract_info_from_wormbase_using_AcePerl_.28sample_code.29" class="mw-headline">extract info from wormbase using AcePerl (sample code)</span>

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

### <span id="write_chadoxml_.28sample_xml.29" class="mw-headline">write chadoxml (sample xml)</span>

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

### <span id="validate_xml_file" class="mw-headline">validate xml file</span>

    xort_validator.pl -d wormbase_chado -f xml/paper/1.xml -v 1 -b 1

this will connect database to validate the xml file

### <span id="load_xml_file" class="mw-headline">load xml file</span>

    xort_loader.pl -d wormbase_chado -f xml/paper/1.xml

## <span id="order_is_important_for_loading" class="mw-headline">order is important for loading</span>

- load cvterm first, mapping wormbase paper/person type/proptype to
  chado cvterm
- load pub/pubauthor/pubprop, contact/contactprop first, extracting
  related paper/person info
- load pub_relationship/contact_relationship at last, since two
  pub/contact (a relationship)will not exist in xml/db before all
  pub/contact instance get populated.

## <span id="extend_chado_schema" class="mw-headline">extend chado schema</span>

- add a contactprop table rather than alter contact table (e.g, adding
  email column, etc.) this solution is fully extensible.

<!-- -->

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

## <span id="cvterm_is_most_important_for_chado" class="mw-headline">cvterm is most important for chado</span>

the power of chado relies on common and controlled cvterms,
<a href="http://www.foaf-project.org/" class="external text"
rel="nofollow">FOAF</a> cvterms will be reused as much as possible for
contact properties. Plus some terms from WormBase.

## <span id="strain_from_wormbase_to_stock_from_chado" class="mw-headline">strain from wormbase to stock from chado</span>

straight forward mapping.

## <span id="transgene_from_wormbase_to_feature_from_chado" class="mw-headline">transgene from wormbase to feature from chado</span>

a transgene in wormbase will map to a feature in chado,
type_id=synthetic construct

## <span id="variation_from_wormbase" class="mw-headline">variation from wormbase</span>

- variation type == allele will map to feature
- variation type == delete/ will map to ?




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [XORT](Category%253AXORT "Category%253AXORT")
- [XML](Category%253AXML "Category%253AXML")
- [WormBase](Category%253AWormBase "Category%253AWormBase")






## Navigation menu









### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>




### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Learn_XMLXORT" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:52 on 23 January
  2008.</span>
<!-- - <span id="footer-info-viewcount">48,767 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





---
title: "Zheng's notes on wormbase migration"
---
# Zheng's notes on wormbase migration

 description](#description)
- [module-based
 migration](#module-based_migration)
- [bio-chaos and
 gmod_bulk_load_gff3](#bio-chaos_and_gmod_bulk_load_gff3)
- [first
 step](#first_step)
- [pain for
 loading](#pain_for_loading)
- [my experience
 with chromosome I](#my_experience_with_chromosome_I)

## description

this page is a record of my experience for migrating wormbase onto
chado. As far as I know, wormbase is based on the Acedb (an
object-oriented schema) mapping onto rmdbs (mysql/postgresql). Chado is
a new, more sophisticated, but generic schema. this page has been quite
long and I am moving from gff3 bulkload to xmlxort, so **I will just
keep this one here for record but not update it. the migration will
continue at** [learn XMLXORT](/wiki/Learn_XMLXORT)

## module-based migration

focus on sequence module first. using gff3 files as input.

| gff3 | chado table |
|----|----|
| seqid | featureloc.srcfeature_id, featureloc.rank=0 |
| source | feature_dbxref.dbxref_id, dbxref.db_id(db.name='GFF source')/accession/version |
| type | feature.type_id, cvterm.cvterm_id/dbxref_id, cv.cv_id, cvterm_dbxref.cvterm_id |
| start | featureloc.fmin |
| end | featureloc.fmax |
| score | strand |
| featureloc.strand | phase |
| featureloc.phase | attribute ID |
| feature.name, feature.uniquename if ID is unique otherwise 'auto'+feature.feature_id | attribute Name |
| feature.name | attribute Alias |
| feature_synonym.synonym_id, synonym.name/synonym_sgml type_id(cvterm.cvterm_id for syn) | attribute Dbxref |
| feature_dbxref, another dbxref, see column3(type) | attribute Gap |
| attribute Note | featureprop |
| custom tag(lower case) | db.name=null, cv.name=local, dbxref.accession='autocreated:xxx' |
| Ontology_term | feature_cvterm.cvterm_id, feature_cvterm_dbxref.feature_cvterm_id, feature_cvterm_pub, feature_cvtermprop |
| Parent | Target gff3 columns and chado table relationship |

feature.dbxref_id is nullable. Dbxref could be lower-case

## bio-chaos and gmod_bulk_load_gff3

both bio-chaos 0.02 and gmod_bulk_load_gff3 can theoretically work. btw,
bio-chaos 0.01 is included in the schema cvs download, but no
gff3-\>chaos script in it. so go to
<a href="http://www.fruitfly.org/chaos-xml/" class="external text"

read a book <a
href="http://www.amazon.com/Nutshell-Third-Elliotte-Rusty-Harold/dp/0596007647/ref=pd_bbs_sr_1/002-2233708-5183202?ie=UTF8&amp;s=books&amp;qid=1174502632&amp;sr=8-1"
class="external text" rel="nofollow">XML in a nutshell</a> helps a lot
for me to understand
<a href="http://www.fruitfly.org/chaos-xml/specification.html#DTD#DTD"
class="external text" rel="nofollow">chaos DTD</a>.

Now I know XMLXORT will be finally used not only for sequence-related
data but also for other data, I have to [learn
XMLXORT](/wiki/Learn_XMLXORT).

## first step

get the current release WS171 gff3 file from wormbase. total 1.07G.
split it by:

 grep -P /^I\t/
 [zha@localhost 1]$ ls -l chrI.gff3
 -rw-rw-r-- 1 zha zha 165530115 Mar 20 17:33 chrI.gff3

only two directive lines in ws171

 ##gff-version 3
 ##Index-subfeature 0

but adding the size of chr-based files does not (similarly) equal to the
original size of ws171, ??? I lost something here already?

## pain for loading

- first try load a sample gff3

a sample nGASP gff3 file has been successfully transformed to chadoXML
by bio-chaos.

 use Bio::Chaos;
 my $path = '/home/zha/gff3/phase2_confirmed.gff3';
 my $infmt = 'gff3';
 my $outfmt = 'chadoxml';
 my $c = Bio::Chaos->new;
 $c->parse($path, $infmt);
 print $c->transform_to($outfmt)->xml;

but I doubt it could load onto chado for the following test on
gmod-bulk-load-gff3.

 [zha@localhost gff3]$ gmod_bulk_load_gff3.pl --dbname zha --organism worm --gfffile \ phase2_confirmed.gff3
 Preparing data for inserting into the zha database
 (This may take a while ...)
 Unable to find srcfeature IV in the database.

sort it so that Parent of a feature (column 9 tag Parent) comes before
the feature line in file. sorted it by:

 gmod_sort_gff3 --infile chrI.gff3 > chrI.unresolved

two files are generated:

 chrI.sorted.gff3
 chrI.unresolved

but adding the size of them, much less than the size of chrI.gff3, I
definitely lost a lot here, abadon this is not what I expected from the
name of the file and perldoc.

## my experience with chromosome I

- chromosome definition line
 I Link chromosome 1 15072419 . + . Name=I

I manually changed it to

 I Link chromosome 1 15072419 . + . ID=I, Name=I

and put it at the top of the gff3 file, it is **NOT** a problem of gff3
file, i.e., the file is valid wherever this line is or even without this
line, but put it on top helps the bulk_load, or maybe
gmod_gff3_preprocessor will try to do this change.

- clone_end line
 I . clone_end 10038617 10038617 . . . Name=C03C11
 no cvterm for clone_end at /usr/lib/perl5/site_perl/5.8.8/Bio/GMOD/DB/Adapter.pm line 3445, <GEN0> line 12402.
 Issuing rollback() for database handle being DESTROY'd without explicit disconnect().

this **is** a valid line, i.e, clone_end is a valid SOFA term, according
to SOFA v2 (05-16-2005). what we loaded in chado installation is the SO
latest minor revision version v2.1 (08-16-2006). in this version
clone_end change to clone_insert_end.

- this is a known situation...
 Your GFF3 file uses a tag called 'confirmed_est', but this term is not
 already in the cvterm table so that it's value can be inserted
 into the featureprop table. The easiest way to rectify this is
 to execute the following SQL commands in the psql shell:
 INSERT INTO dbxref (db_id,accession)
 VALUES ((select db_id from db where name='null'),'autocreated:confirmed_est');
 INSERT INTO cvterm (cv_id,name,dbxref_id)
 VALUES ((select cv_id from cv where name='autocreated'), 'confirmed_est',
 (select dbxref_id from dbxref where accession='autocreated:confirmed_est'));
 and then rerun this loader. Your other option is to
 write a special handler for this tag so that it will
 go where you want it in the database.
 Died at /usr/lib/perl5/site_perl/5.8.8/Bio/GMOD/DB/Adapter.pm line 2834, <GEN0> line 13204.
 Issuing rollback() for database handle being DESTROY'd without explicit disconnect().

Noticed the above situation the cvterm is in column 3 (type), here the
term is in column 9, a tag, such as ID, NAME, Dbxref, etc. I encountered
a series of them, which **are good information**.

|-------------------------| confirmed_EST | confirmed_UTR | confirmed_Homology | confirmed_inconsistency | confirmed_false | used_for_training | predicted ncrna gene | count | transcript | pseudogene | Indexed | species | protein_matches | cds_matches | times_observed | amplified | rflp | prediction_status | gene | status |

**non-canonical tag used in WS171 chrI**

Scott suggests write a local ontology, such as wormbase ontology; Or as
Don suggests, automatically load it. **Notice this lower case column 9
tag may have some terms exactly the same as column 3 SOFA cvterm, but
they are treated as different ones.** I removed all lines like this one

 I ncRNA ncRNA 10010373 10010484 999.545 - . Name=Note;predicted ncrna gene=1;rnaz-512263=RNAz-512263:Note

also this one

 I Coding_transcript mRNA 11877789 11887256 .
 + . ID=Transcript:Y47H9C.5a.1;Name=Y47H9C.5a.1;Note=DnaJ domain%3BWo
 rmPep WP:CE20265%3BNote dnj-27%3BPrediction_status Partially_confirmed%3BGene WB
 Gene00001045%3BCDS Y47H9C.5a%3BThioredoxin;1=1

- several options

**--analysis** for file that has analysis (eg. blast) feature;
**--noexon**, this is a 'weird' option. Since chado treat CDS as
intersection between exons and transcript polypeptides, CDS and UTR
lines are converted to generate exon and polypeptide by default in
bulk_load. if gff file has exon lines, then you shall use this option,
which means do not generate exon (?, since you have exon lines, but the
option is named noexon, tricky). my command becomes:

 gmod_bulk_load_gff3.pl --dbname zha --organism worm --analysis --gfffile chrI_2.gff3.sorted --noexon

- non-central-dogma-feature

this is what I think: shall have at least 3 lines for compliance with
central dogma, a gene line, a mrna line and a cds line. the following
warning is actually caused by lacking a gene line. this is what I
observed:

 There is a CDS feature with no parent (ID:) I think that is wrong!
 This GFF file has CDS and/or UTR features that do not belong to a
 'central dogma' gene (ie, gene/transcript/CDS). The features of
 this type are being stored in the database as is.
 no parent CDS:B0019.1:wp90;

since the file has this two lines:

 I history mRNA 12759743 12764935 . - 2 ID=CDS:B0019.1:wp90;Name=B0019.1:wp90;Indexed=1
 I history CDS 12764810 12764935 . - 0 Parent=CDS:B0019.1:wp90

although the warning says 'CDS feature', but it could also be lacking a
gene line that trigger the warning. Infact, all the lines with 'history'
in column 2 do not have a corresponding line with 'gene' in column 3.

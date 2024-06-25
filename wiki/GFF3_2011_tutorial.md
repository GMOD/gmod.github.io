<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">GFF3 2011 tutorial</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

<table class="tutorialheader">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><span style="font-size: 160%; line-height: 120%"> <a
href="http://gmod.org/mediawiki/index.php?title=GMOD:GFF3&amp;action=edit&amp;redlink=1"
class="new" title="GMOD:GFF3 (page does not exist)">GFF3</a> <a
href="http://gmod.org/mediawiki/index.php?title=Category:Session&amp;action=edit&amp;redlink=1"
class="new"
title="Category:Session (page does not exist)">Session</a></span><br />
<br />
&#10;<p><a href="2011_GMOD_Spring_Training"
title="2011 GMOD Spring Training">2011 GMOD Spring Training</a><br />
8-12 March 2011<br />
<a href="User:Scott" title="User:Scott">Scott Cain</a></p></td>
<td style="text-align: right;"><a href="File:GMODAmericas2011Logo.png"
class="image"><img
src="../mediawiki/images/thumb/f/f5/GMODAmericas2011Logo.png/200px-GMODAmericas2011Logo.png"
srcset="../mediawiki/images/thumb/f/f5/GMODAmericas2011Logo.png/300px-GMODAmericas2011Logo.png 1.5x, ../mediawiki/images/thumb/f/f5/GMODAmericas2011Logo.png/400px-GMODAmericas2011Logo.png 2x"
width="200" height="200" alt="GMODAmericas2011Logo.png" /></a></td>
</tr>
</tbody>
</table>

  
**GFF** is a standard file format for storing genomic features in a text
file. GFF stands for *Generic Feature Format*. GFF files are plain text,
9 column, tab-delimited files. GFF *<a
href="http://gmod.org/mediawiki/index.php?title=GMOD:Databases_and_GMOD&amp;action=edit&amp;redlink=1"
class="new"
title="GMOD:Databases and GMOD (page does not exist)">databases</a>*
also exist. They use a [schema](Glossary#Schema "Glossary") custom built
to represent GFF data. GFF is [frequently used in GMOD](#GFF_in_GMOD)
for data exchange and representation of genomic data.

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span>
  <span class="toctext">Versions</span>](#Versions)
- [<span class="tocnumber">2</span>
  <span class="toctext">GFF3</span>](#GFF3)
  - [<span class="tocnumber">2.1</span> <span class="toctext">GFF3
    Annotation Section</span>](#GFF3_Annotation_Section)
    - [<span class="tocnumber">2.1.1</span> <span class="toctext">GFF3
      Format</span>](#GFF3_Format)
    - [<span class="tocnumber">2.1.2</span>
      <span class="toctext">Nesting Features</span>](#Nesting_Features)
    - [<span class="tocnumber">2.1.3</span>
      <span class="toctext">Discontinuous
      Features</span>](#Discontinuous_Features)
    - [<span class="tocnumber">2.1.4</span>
      <span class="toctext">Protein-Coding
      Genes</span>](#Protein-Coding_Genes)
    - [<span class="tocnumber">2.1.5</span>
      <span class="toctext">Alignments</span>](#Alignments)
    - [<span class="tocnumber">2.1.6</span>
      <span class="toctext">Quantitative
      Data</span>](#Quantitative_Data)
  - [<span class="tocnumber">2.2</span> <span class="toctext">GFF3
    Sequence Section</span>](#GFF3_Sequence_Section)
  - [<span class="tocnumber">2.3</span> <span class="toctext">GFF3
    Validation</span>](#GFF3_Validation)
- [<span class="tocnumber">3</span>
  <span class="toctext">GFF2</span>](#GFF2)
- [<span class="tocnumber">4</span>
  <span class="toctext">GTF</span>](#GTF)
- [<span class="tocnumber">5</span> <span class="toctext">GFF in
  GMOD</span>](#GFF_in_GMOD)
  - [<span class="tocnumber">5.1</span>
    <span class="toctext">Apollo</span>](#Apollo)
  - [<span class="tocnumber">5.2</span>
    <span class="toctext">Chado</span>](#Chado)
  - [<span class="tocnumber">5.3</span>
    <span class="toctext">CMap</span>](#CMap)
  - [<span class="tocnumber">5.4</span>
    <span class="toctext">GBrowse</span>](#GBrowse)
- [<span class="tocnumber">6</span> <span class="toctext">See
  Also</span>](#See_Also)

</div>

# <span id="Versions" class="mw-headline">Versions</span>

GFF has several versions, the most recent of which is *[GFF3](#GFF3)*.
GFF3 addresses several shortcomings in its predecessor, *[GFF2](#GFF2)*.
**GFF3 is the preferred format in GMOD**, but data is not always
available in GFF3 format, so you may have to use GFF2. The two versions
are similar but are not compatible and scripts usually only work with
one of the other format. This page discusses GFF3 in detail. GFF2
details are covered on a <a
href="http://gmod.org/mediawiki/index.php?title=GMOD:GFF2&amp;action=edit&amp;redlink=1"
class="new" title="GMOD:GFF2 (page does not exist)">separate page</a>.

Unfortunately, people, documentation, and even this web site are not
always clear about what version of GFF is being discussed. This web page
will always specify which version it is referring to.

Finally, *[GTF](#GTF)* is another file format that is very similar to
GFF and is sometimes referred to as GFF2.5.

# <span id="GFF3" class="mw-headline">GFF3</span>

The <a href="http://www.sequenceontology.org/gff3.shtml"
class="external text" rel="nofollow">formal specification of GFF3</a> is
on the <a href="http://www.sequenceontology.org/" class="external text"
rel="nofollow">Sequence Ontology</a> web site. It completely describes
the format, including column definitions, metadata and directives. It
also contains lengthy sections explaining how to represent different
situations in GFF3, including:

- canonical genes non-coding transcripts
- parent (part-of) relationships
- alignments
- ontology association and database cross references
- single exon genes
- polycistronic transcripts
- genes containing inteins
- trans-spliced transcripts
- programmed frameshifts
- operons

Some of these cases are covered on this page as well. If you want the
full and definitive explanation of GFF3 then see
<a href="http://www.sequenceontology.org/gff3.shtml"
class="external text" rel="nofollow">the standard</a>.

## <span id="GFF3_Annotation_Section" class="mw-headline">GFF3 Annotation Section</span>

This first describes the format of the annotation section, and then
provides explanations of how to represent several different types of
data.

### <span id="GFF3_Format" class="mw-headline">GFF3 Format</span>

GFF3 format is a flat tab-delimited file. The first line of the file is
a comment that identifies the file format and version. This is followed
by a series of data lines, each one of which corresponds to an
annotation.Here is a miniature GFF3 file:

    ##gff-version 3
    ctg123  .  exon  1300  1500  .  +  .  ID=exon00001
    ctg123  .  exon  1050  1500  .  +  .  ID=exon00002
    ctg123  .  exon  3000  3902  .  +  .  ID=exon00003
    ctg123  .  exon  5000  5500  .  +  .  ID=exon00004
    ctg123  .  exon  7000  9000  .  +  .  ID=exon00005

The `##gff-version 3` line is required and *must* be the first line of
the file. It introduces the annotation section of the file.

The 9 columns of the annotation section are as follows:

**Column 1:** "seqid"

The ID of the landmark used to establish the coordinate system for the
current feature. IDs may contain any characters, but must escape any
characters not in the set \[a-zA-Z0-9.:^\*\$@!+\_?-\|\]. In particular,
IDs may not contain unescaped whitespace and must not begin with an
unescaped "\>".

To escape a character in this, or any of the other GFF3 fields, replace
it with the percent sign followed by its hexadecimal representation. For
example, "\>" becomes "%E3". See
<a href="http://www.blooberry.com/indexdot/html/topics/urlencoding.htm"
class="external text" rel="nofollow">URL Encoding (or: 'What are those
"%20" codes in URLs?')</a> for details.

**Column 2:** "source"

The source is a free text qualifier intended to describe the algorithm
or operating procedure that generated this feature. Typically this is
the name of a piece of software, such as "Genescan" or a database name,
such as "Genbank." In effect, the source is used to extend the feature
ontology by adding a qualifier to the type creating a new composite type
that is a subclass of the type in the type column. It is not necessary
to specify a source. If there is no source, put a "." (a period) in this
field.

**Column 3:** "type"

The type of the feature (previously called the "method"). This is
constrained to be either: (a) a term from the "lite" sequence ontology,
SOFA; or (b) a SOFA accession number. The latter alternative is
distinguished using the syntax SO:000000. This field is required.

**Columns 4 & 5:** "start" and "end"

The start and end of the feature, in 1-based integer coordinates,
relative to the landmark given in column 1. Start is always less than or
equal to end.

For zero-length features, such as insertion sites, start equals end and
the implied site is to the right of the indicated base in the direction
of the landmark. These fields are required.

**Column 6:** "score"

The score of the feature, a floating point number. As in earlier
versions of the format, the semantics of the score are ill-defined. It
is strongly recommended that E-values be used for sequence similarity
features, and that P-values be used for ab initio gene prediction
features. If there is no score, put a "." (a period) in this field.

**Column 7:** "strand"

The strand of the feature. + for positive strand (relative to the
landmark), - for minus strand, and . for features that are not stranded.
In addition, ? can be used for features whose strandedness is relevant,
but unknown.

**Column 8:** "phase"

For features of type "CDS", the phase indicates where the feature begins
with reference to the reading frame. The phase is one of the integers 0,
1, or 2, indicating the number of bases that should be removed from the
beginning of this feature to reach the first base of the next codon. In
other words, a phase of "0" indicates that the next codon begins at the
first base of the region described by the current line, a phase of "1"
indicates that the next codon begins at the second base of this region,
and a phase of "2" indicates that the codon begins at the third base of
this region. This is NOT to be confused with the frame, which is simply
start modulo 3. If there is no phase, put a "." (a period) in this
field.

For forward strand features, phase is counted from the start field. For
reverse strand features, phase is counted from the end field.

The phase is **required** for all CDS features.

**Column 9:** "attributes"

A list of feature attributes in the format tag=value. Multiple tag=value
pairs are separated by semicolons. URL escaping rules are used for tags
or values containing the following characters: ",=;". Spaces are allowed
in this field, but tabs must be replaced with the %09 URL escape. This
field is not required.

<div class="indent">

**Column 9 Tags**

Column 9 tags have predefined meanings:

ID  
Indicates the unique identifier of the feature. IDs must be unique
within the scope of the GFF file.

<!-- -->

Name  
Display name for the feature. This is the name to be displayed to the
user. Unlike IDs, there is no requirement that the Name be unique within
the file.

<!-- -->

Alias  
A secondary name for the feature. It is suggested that this tag be used
whenever a secondary identifier for the feature is needed, such as locus
names and accession numbers. Unlike ID, there is no requirement that
Alias be unique within the file.

<!-- -->

Parent  
Indicates the parent of the feature. A parent ID can be used to group
exons into transcripts, transcripts into genes, and so forth. A feature
may have multiple parents. Parent can \*only\* be used to indicate a
partof relationship.

<!-- -->

Target  
Indicates the target of a nucleotide-to-nucleotide or
protein-to-nucleotide alignment. The format of the value is "target_id
start end \[strand\]", where strand is optional and may be "+" or "-".
If the target_id contains spaces, they must be escaped as hex
escape %20.

<!-- -->

Gap  
The alignment of the feature to the target if the two are not collinear
(e.g. contain gaps). The alignment format is taken from the CIGAR format
described in the Exonerate documentation. <a
href="http://cvsweb.sanger.ac.uk/cgi-bin/cvsweb.cgi/exonerate?cvsroot=Ensembl"
class="external free"
rel="nofollow">http://cvsweb.sanger.ac.uk/cgi-bin/cvsweb.cgi/exonerate?cvsroot=Ensembl</a>).
See the <a href="http://www.sequenceontology.org/gff3.shtml"
class="external text" rel="nofollow">GFF3 specification</a> for more
information.

<!-- -->

Derives_from  
Used to disambiguate the relationship between one feature and another
when the relationship is a temporal one rather than a purely structural
"part of" one. This is needed for polycistronic genes. See the
<a href="http://www.sequenceontology.org/gff3.shtml"
class="external text" rel="nofollow">GFF3 specification</a> for more
information.

<!-- -->

Note  
A free text note.

<!-- -->

Dbxref  
A database cross reference. See the
<a href="http://www.sequenceontology.org/gff3.shtml"
class="external text" rel="nofollow">GFF3 specification</a> for more
information.

<!-- -->

Ontology_term  
A cross reference to an ontology term. See the
<a href="http://www.sequenceontology.org/gff3.shtml"
class="external text" rel="nofollow">GFF3 specification</a> for more
information.

Multiple attributes of the same type are indicated by separating the
values with the comma "," character, as in:

    Parent=AF2312,AB2812,abc-3

Note that attribute names are case sensitive. "Parent" is not the same
as "parent".

All attributes that begin with an uppercase letter are reserved for
later use. Attributes that begin with a lowercase letter can be used
freely by applications. You can stash any semi-structured data into the
database by using one or more unreserved (lowercase) tags.

</div>

### <span id="Nesting_Features" class="mw-headline">Nesting Features</span>

Many genomic features are discontinuous and have multiple subparts. GFF3
represents such features by linking the parts together with the Parent
tag. For example, to represent an mRNA transcript that has five exons,
we could write this:

    ##gff-version 3
    ctg123 . mRNA            1300  9000  .  +  .  ID=mrna0001;Name=sonichedgehog
    ctg123 . exon            1300  1500  .  +  .  ID=exon00001;Parent=mrna0001
    ctg123 . exon            1050  1500  .  +  .  ID=exon00002;Parent=mrna0001
    ctg123 . exon            3000  3902  .  +  .  ID=exon00003;Parent=mrna0001
    ctg123 . exon            5000  5500  .  +  .  ID=exon00004;Parent=mrna0001
    ctg123 . exon            7000  9000  .  +  .  ID=exon00005;Parent=mrna0001

The first feature is an mRNA that extends from position 1300 to 9000 in
genomic coordinates. It has an ID of "mrna0001" and a human-readable
name of "sonichedgehog" (note that the ID and the Name are **not** the
same thing). This is followed by five exon features, each of which is
linked to the mRNA using a Parent tag. When
[GBrowse](GBrowse.1 "GBrowse") displays this transcript, it will display
each of the exons linked together by a solid line. The entire set can be
found by searching for the name "sonichedgehog."

The ID is really only important for linking features together. If a
feature does not have any subparts, then it does not formally need an
ID. Thus, we could simplify this by removing all the exon IDs:

    ##gff-version 3
    ctg123 . mRNA            1300  9000  .  +  .  ID=mrna0001;Name=sonichedgehog
    ctg123 . exon            1300  1500  .  +  .  Parent=mrna0001
    ctg123 . exon            1050  1500  .  +  .  Parent=mrna0001
    ctg123 . exon            3000  3902  .  +  .  Parent=mrna0001
    ctg123 . exon            5000  5500  .  +  .  Parent=mrna0001
    ctg123 . exon            7000  9000  .  +  .  Parent=mrna0001

Multiple levels of nesting are allowed. If this transcript is part of an
operon, then we can add another level of nesting:

    ##gff-version 3
    ctg123 . operon          1300 15000  .  +  .  ID=operon001;Name=superOperon
    ctg123 . mRNA            1300  9000  .  +  .  ID=mrna0001;Parent=operon001;Name=sonichedgehog
    ctg123 . exon            1300  1500  .  +  .  Parent=mrna0001
    ctg123 . exon            1050  1500  .  +  .  Parent=mrna0001
    ctg123 . exon            3000  3902  .  +  .  Parent=mrna0001
    ctg123 . exon            5000  5500  .  +  .  Parent=mrna0001
    ctg123 . exon            7000  9000  .  +  .  Parent=mrna0001
    ctg123 . mRNA           10000 15000  .  +  .  ID=mrna0002;Parent=operon001;Name=subsonicsquirrel
    ctg123 . exon           10000 12000  .  +  .  Parent=mrna0002
    ctg123 . exon           14000 15000  .  +  .  Parent=mrna0002

### <span id="Discontinuous_Features" class="mw-headline">Discontinuous Features</span>

In addition to nested features, another common type of genomic
annotation is the *discontinuous feature* in which a single feature
spans multiple discontinuous portions of the genome. The primary example
is an alignment, such as a cDNA sequence that has been aligned to
genomic sequence. GFF3 deals with these features by representing each
continuous segment as a distinct row, and then giving each segment the
same ID to tie them together. For example:

    ctg123 example match 26122 26126 . + . ID=match001
    ctg123 example match 26497 26869 . + . ID=match001
    ctg123 example match 27201 27325 . + . ID=match001
    ctg123 example match 27372 27433 . + . ID=match001
    ctg123 example match 27565 27565 . + . ID=match001

Note that this is distinct from the nested features we looked at in the
previous section. In the former case, there is a single parent feature
and multiple child features that are linked to the parent via a Parent
tag. The IDs of the children are distinct from each other (or absent
altogether). In the latter case, each segment of the discontinuous
feature has the same ID. There is no parent.

*Note that this method of grouping discontinuous features is not
currently supported by the GMOD Chado bulk GFF3 loader. Parent-child
grouping is required.*

### <span id="Protein-Coding_Genes" class="mw-headline">Protein-Coding Genes</span>

We'll now look at how to represent several common cases, starting with
protein-coding genes.

The most general way of representing a protein-coding gene is the
so-called "three-level gene." The top level is a feature of type "gene"
which bundles up the gene's transcripts and regulatory elements. Beneath
this level are one or more transcripts of type "mRNA". This level can
also accommodate promoters and other cis-regulatory elements. At the
third level are the components of the mRNA transcripts, most commonly
CDS coding segments and UTRs. This example shows how to represent a gene
named "EDEN" which has three alternatively-spliced mRNA transcripts:

    ctg123 example gene            1050 9000 . + . ID=EDEN;Name=EDEN;Note=protein kinase

    ctg123 example mRNA            1050 9000 . + . ID=EDEN.1;Parent=EDEN;Name=EDEN.1;Index=1
    ctg123 example five_prime_UTR  1050 1200 . + . Parent=EDEN.1
    ctg123 example CDS             1201 1500 . + 0 Parent=EDEN.1
    ctg123 example CDS             3000 3902 . + 0 Parent=EDEN.1
    ctg123 example CDS             5000 5500 . + 0 Parent=EDEN.1
    ctg123 example CDS             7000 7608 . + 0 Parent=EDEN.1
    ctg123 example three_prime_UTR 7609 9000 . + . Parent=EDEN.1

    ctg123 example mRNA            1050 9000 . + . ID=EDEN.2;Parent=EDEN;Name=EDEN.2;Index=1
    ctg123 example five_prime_UTR  1050 1200 . + . Parent=EDEN.2
    ctg123 example CDS             1201 1500 . + 0 Parent=EDEN.2
    ctg123 example CDS             5000 5500 . + 0 Parent=EDEN.2
    ctg123 example CDS             7000 7608 . + 0 Parent=EDEN.2
    ctg123 example three_prime_UTR 7609 9000 . + . Parent=EDEN.2

    ctg123 example mRNA            1300 9000 . + . ID=EDEN.3;Parent=EDEN;Name=EDEN.3;Index=1
    ctg123 example five_prime_UTR  1300 1500 . + . Parent=EDEN.3
    ctg123 example five_prime_UTR  3000 3300 . + . Parent=EDEN.3
    ctg123 example CDS             3301 3902 . + 0 Parent=EDEN.3
    ctg123 example CDS             5000 5500 . + 1 Parent=EDEN.3
    ctg123 example CDS             7000 7600 . + 1 Parent=EDEN.3
    ctg123 example three_prime_UTR 7601 9000 . + . Parent=EDEN.3

We start with a feature of type "gene" with the ID "EDEN". This has
three alternative splice forms named EDEN.1, EDEN.2 and EDEN.3. To tell
[GBrowse](GBrowse.1 "GBrowse") that each of these splice forms are part
of the same gene, we give each one a Parent attribute of "EDEN"
corresponding to the ID of the parent gene. Now consider mRNA EDEN.1. It
has a five_prime_UTR feature, a three_prime_UTR feature, and four CDS
features. To indicate that the CDS and UTR features belong to the mRNA,
we give the mRNA a unique ID of "EDEN.1" and give each of the
subfeatures a corresponding parent. This pattern repeats for each of the
other two splice forms. Note how the five_prime_UTR of EDEN.3 is split
in two parts.

We use "Name" to give the gene and its alternative splice forms a
human-readable name, and use Note to provide a description for the gene
as a whole (you can add notes to the individual mRNAs but they won't
display by default). The Index=1 attribute is a hint to some indexed
database to make the mRNAs searchable by name. This lets users find the
gene by searching for the mRNA names ("EDEN.1") as well as by the gene
name ("EDEN"). However, it is usually unnecessary to do this. Also
notice that we are using the Phase column for the CDS features to
describe how the CDS is translated into protein. See the description of
phase at the beginning of this section.

There are other ways of representing genes. Please see
<a href="http://www.sequenceontology.org/gff3.shtml"
class="external text" rel="nofollow">the GFF3 Specification</a> and <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/branches/stable/docs/tutorial/tutorial.html?content-type=text%2Fhtml"
class="external text" rel="nofollow">The GBrowse Administration
Tutorial</a> for more information.

### <span id="Alignments" class="mw-headline">Alignments</span>

Nucleotide to genome, and protein to genome alignments are a little
tricky because they involve two coordinate systems, the coordinates of
the alignment on the genome (known as the "source" coordinates), and the
coordinates of the cDNA, EST or protein (known as the "target"
coordinates). In GFF3, the target coordinates are specified using the
**Target** tag.

    ctg123 est EST_match 1050 1500 . + . ID=Match1;Name=agt830.5;Target=agt830.5 1 451
    ctg123 est EST_match 3000 3202 . + . ID=Match1;Name=agt830.5;Target=agt830.5 452 654

    ctg123 est EST_match 5410 5500 . - . ID=Match2;Name=agt830.3;Target=agt830.3 505 595
    ctg123 est EST_match 7000 7503 . - . ID=Match2;Name=agt830.3;Target=agt830.3 1 504

    ctg123 est EST_match 1050 1500 . + . ID=Match3;Name=agt221.5;Target=agt221.5 1 451
    ctg123 est EST_match 5000 5500 . + . ID=Match3;Name=agt221.5;Target=agt221.5 452 952
    ctg123 est EST_match 7000 7300 . + . ID=Match3;Name=agt221.5;Target=agt221.5 953 1253

This example shows three different alignment features of type
"EST_match". Each alignment has a distinct ID, and all the discontinuous
parts of the alignment have the same ID, as described earlier. In
addition to the ID and Name tags, each segment also has a Target tag
whose value has the format "\<target seqid\> \<target start\> \<target
end\>." For example, the very first line indicates that the EST named
agt830.5 aligns to genomic contig ctg123 such that positions 1 through
451 of agt830.5 aligns to bases 1050-1500 of ctg123.

Using the \##FASTA section of the GFF3 file, you can specify the
sequence of the ESTs as well as of the contig, and
[GBrowse](GBrowse.1 "GBrowse") will display the DNA and/or protein
sequences in the appropriate contexts.

See the <a href="http://www.sequenceontology.org/gff3.shtml"
class="external text" rel="nofollow">GFF3 specification</a> for
instructions on how to represent gapped alignments.

### <span id="Quantitative_Data" class="mw-headline">Quantitative Data</span>

GBrowse can plot quantitative data such as alignment scores, confidence
scores from gene prediction programs, and microarray intensity data.
There is a simple format that can be placed directly inside of a GFF3
file but does not scale to very large data sets, and a "WIG" format
designed for very high-density quantitative data such as tiling arrays.

We first look at the simple format:

    ctg123 affy microarray_oligo   1 100 281 . . Name=Expt1
    ctg123 affy microarray_oligo 101 200 183 . . Name=Expt1
    ctg123 affy microarray_oligo 201 300 213 . . Name=Expt1
    ctg123 affy microarray_oligo 301 400 191 . . Name=Expt1
    ctg123 affy microarray_oligo 401 500 288 . . Name=Expt1
    ctg123 affy microarray_oligo 501 600 184 . . Name=Expt1

In this format, which can be embedded directly in the GFF3 file, each
data point is a distinct feature with a start and end point. The
features are grouped together by giving them a common experimental name
so that they can be retrieved together. We use the **score** field
(column 6) to represent the quantitative information (e.g. hybridization
intensity).

In contrast, when using WIG format, the quantitative data is kept
outside of the main database in a special-purpose binary file that is
kept somewhere on the file system. In this case the GFF3 file contains a
single line per experiment like this one:

    ctg123 . microarray_oligo 1 50000 . . . Name=example;wigfile=/usr/data/ctg123.Expt1.wig

The .wig file is created and managed using a script called
`wiggle2gff3.pl` that comes with [GBrowse](GBrowse.1 "GBrowse").
Instructions on how to use this script is described in the <a
href="http://gmod.cvs.sourceforge.net/*checkout*/gmod/Generic-Genome-Browser/docs/tutorial/tutorial.html?pathrev=stable"
class="external text" rel="nofollow">GBrowse Administration Tutorial</a>.

## <span id="GFF3_Sequence_Section" class="mw-headline">GFF3 Sequence Section</span>

[GFF3](GFF3 "GFF3") files can also include sequence in FASTA format at
the end of the file. The FASTA sequences are preceded by a `##FASTA`
line. This sequence section is optional. If present, the sequence
section can define sequence for any landmark used in column 1 (the frame
of reference). For example: For example:

    ##gff-version 3
    ctg123 . exon            1300  1500  .  +  .  ID=exon00001
    ctg123 . exon            1050  1500  .  +  .  ID=exon00002
    ctg123 . exon            3000  3902  .  +  .  ID=exon00003
    ctg123 . exon            5000  5500  .  +  .  ID=exon00004
    ctg123 . exon            7000  9000  .  +  .  ID=exon00005
    ##FASTA
    >ctg123
    cttctgggcgtacccgattctcggagaacttgccgcaccattccgccttg
    tgttcattgctgcctgcatgttcattgtctacctcggctacgtgtggcta
    tctttcctcggtgccctcgtgcacggagtcgagaaaccaaagaacaaaaa
    aagaaattaaaatatttattttgctgtggtttttgatgtgtgttttttat
    aatgatttttgatgtgaccaattgtacttttcctttaaatgaaatgtaat
    cttaaatgtatttccgacgaattcgaggcctgaaaagtgtgacgccattc
    ...

When the GFF3 file is processed the IDs on the header line of FASTA
entries are matched with IDs used in column 1 in the annotation section
of the file.

You don't have to store the FASTA in the GFF file. You can also store
your sequences in a separate file containing only FASTA entries.

## <span id="GFF3_Validation" class="mw-headline">GFF3 Validation</span>

You can validate reasonably large GFF3 files at the following sites:

- <a href="http://modencode.oicr.on.ca/cgi-bin/validate_gff3_online"
  class="external text" rel="nofollow">modENCODE validator</a>
- <a
  href="http://public.ecolihub.net/cgi-bin/validate_gff3_online/validate_gff3_online"
  class="external text" rel="nofollow">EcoliHub validator</a>

The validator code can be found in the
<a href="http://gmod.svn.sourceforge.net/viewvc/gmod/gff-validator/"
class="external text" rel="nofollow">GMOD Sourceforge SVN repository</a>.

# <span id="GFF2" class="mw-headline">GFF2</span>

<a
href="http://gmod.org/mediawiki/index.php?title=GMOD:GFF2&amp;action=edit&amp;redlink=1"
class="new" title="GMOD:GFF2 (page does not exist)">GFF2</a> is a
supported format in GMOD, **but it is now deprecated and if you have a
choice you should use GFF3**. Unfortunately, data is sometimes only
available in GFF2 format. GFF2 has a number of shortcomings compared to
GFF3.

See <a
href="http://gmod.org/mediawiki/index.php?title=GMOD:GFF2&amp;action=edit&amp;redlink=1"
class="new" title="GMOD:GFF2 (page does not exist)">GFF2</a> for more on
this format.

# <span id="GTF" class="mw-headline">GTF</span>

<a href="http://mblab.wustl.edu/GTF2.html" class="external text"
rel="nofollow"><em>GTF</em></a>, is another file format that is very
similar to <a
href="http://gmod.org/mediawiki/index.php?title=GMOD:GFF2&amp;action=edit&amp;redlink=1"
class="new" title="GMOD:GFF2 (page does not exist)">GFF2</a> and is
sometimes referred to as GFF2.5. GTF is not a supported format in GMOD
so if you have a GTF file you'll need to convert it to [GFF3](#GFF3).
The <a
href="http://song.cvs.sourceforge.net/song/software/scripts/gtf2gff3/"
class="external text" rel="nofollow"><code>gft2gff3</code></a> script
does this conversion, with some caveats. See also
<a href="http://www.nabble.com/Hi-td17810093.html" class="external text"
rel="nofollow">this BioPerl-l posting</a>.

# <span id="GFF_in_GMOD" class="mw-headline">GFF in GMOD</span>

A number of <a
href="http://gmod.org/mediawiki/index.php?title=GMOD:GMOD_Components&amp;action=edit&amp;redlink=1"
class="new" title="GMOD:GMOD Components (page does not exist)">GMOD
Components</a> support GFF files. This section provides a brief
description of that support.

## <span id="Apollo" class="mw-headline">Apollo</span>

The [Apollo](Apollo.1 "Apollo") genome annotation editor can read and
write annotations in GFF3 format. You can also load GFF3 data into
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> and have
Apollo connect with the database.

## <span id="Chado" class="mw-headline">Chado</span>

GFF3 data can be loaded into and dumped from
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> databases.
See:

- <a
  href="http://gmod.org/mediawiki/index.php?title=GMOD:Load_GFF_Into_Chado&amp;action=edit&amp;redlink=1"
  class="new" title="GMOD:Load GFF Into Chado (page does not exist)">Load
  GFF Into Chado</a>
- <a
  href="http://gmod.org/mediawiki/index.php?title=GMOD:Load_BLAST_Into_Chado&amp;action=edit&amp;redlink=1"
  class="new"
  title="GMOD:Load BLAST Into Chado (page does not exist)">Load BLAST Into
  Chado</a> - by converting it to GFF3
- <a
  href="http://gmod.org/mediawiki/index.php?title=GMOD:Load_GenBank_into_Chado&amp;action=edit&amp;redlink=1"
  class="new"
  title="GMOD:Load GenBank into Chado (page does not exist)">Load GenBank
  into Chado</a> - by converting it to GFF3
- <a
  href="http://gmod.org/mediawiki/index.php?title=GMOD:Load_RefSeq_Into_Chado&amp;action=edit&amp;redlink=1"
  class="new"
  title="GMOD:Load RefSeq Into Chado (page does not exist)">Load RefSeq
  Into Chado</a> - by converting it to GFF3
- <a
  href="http://gmod.org/mediawiki/index.php?title=GMOD:Chado_Update_via_GFF&amp;action=edit&amp;redlink=1"
  class="new"
  title="GMOD:Chado Update via GFF (page does not exist)">Chado Update via
  GFF</a>
- <a
  href="http://gmod.org/mediawiki/index.php?title=GMOD:GMODTools&amp;action=edit&amp;redlink=1"
  class="new" title="GMOD:GMODTools (page does not exist)">GMODTools</a> -
  Generate [GFF3](GFF3 "GFF3") from a
  <a href="Chado" class="mw-redirect" title="Chado">Chado</a> database.

## <span id="CMap" class="mw-headline">CMap</span>

The <a
href="http://gmod.org/mediawiki/index.php?title=GMOD:CMap&amp;action=edit&amp;redlink=1"
class="new" title="GMOD:CMap (page does not exist)">CMap</a> comparative
mapping viewer can read data in GFF3 format.

## <span id="GBrowse" class="mw-headline">GBrowse</span>

The [GBrowse](GBrowse.1 "GBrowse") genome viewer supports data in <a
href="http://gmod.org/mediawiki/index.php?title=GMOD:GBrowse_Adaptors&amp;action=edit&amp;redlink=1"
class="new" title="GMOD:GBrowse Adaptors (page does not exist)">many
formats</a>, but in many ways GFF3 is its native data format. GBrowse
also supports <a
href="http://gmod.org/mediawiki/index.php?title=GMOD:GFF2&amp;action=edit&amp;redlink=1"
class="new" title="GMOD:GFF2 (page does not exist)">GFF2</a> data. See
the [GBrowse](GBrowse.1 "GBrowse") and <a
href="http://gmod.org/mediawiki/index.php?title=GMOD:GBrowse_Adaptors&amp;action=edit&amp;redlink=1"
class="new" title="GMOD:GBrowse Adaptors (page does not exist)">GBrowse
Adaptors</a> pages for details.

# <span id="See_Also" class="mw-headline">See Also</span>

- <a href="http://www.sequenceontology.org/gff3.shtml"
  class="external text" rel="nofollow">GFF3 Specification</a>
- <a href="http://www.sanger.ac.uk/Software/formats/GFF/GFF_Spec.shtml"
  class="external text" rel="nofollow">GFF2 Specification</a>
- <a
  href="http://gmod.org/mediawiki/index.php?title=GMOD:GFF2&amp;action=edit&amp;redlink=1"
  class="new" title="GMOD:GFF2 (page does not exist)">GFF2</a> - GFF2 in
  GMOD
- <a href="http://www.broad.mit.edu/annotation/argo/help/gff.html"
  class="external text" rel="nofollow">Broad Institute's Argo File Formats
  GFF page</a>
- <a href="http://www.bioperl.org/wiki/GFF" class="external text"
  rel="nofollow">BioPerl's GFF page</a>

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=GFF3_2011_tutorial&oldid=25310>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](Special:Categories "Special:Categories"):

- [Tutorials](Category:Tutorials "Category:Tutorials")
- [2011 Spring
  Training](Category:2011_Spring_Training "Category:2011 Spring Training")
- <a
  href="http://gmod.org/mediawiki/index.php?title=Category:GFF3&amp;action=edit&amp;redlink=1"
  class="new" title="Category:GFF3 (page does not exist)">GFF3</a>

</div>

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">



<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces


- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:GFF3_2011_tutorial&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>





</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>
- <span id="n-View-all-pages">[View all pages](Special:AllPages)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category:FAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category:HOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">


- <span id="t-smwbrowselink"><a href="Special:Browse/GFF3_2011_tutorial" rel="smw-browse">Browse
  properties</a></span>


</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 22:13 on 11 February
  2014.</span>
<!-- - <span id="footer-info-viewcount">17,361 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->






</div>

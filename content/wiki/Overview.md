---
title: "Overview"
---
# Overview

_... formerly titled "GMOD for the Biologist"._

This page provides an overview of the GMOD project. It does not assume
any particular background in computing.

  Introduction](#Introduction)
- [What is a
  GMOD?](#What_is_a_GMOD.3F)
  - [Is It Just
    for _Model_ Organisms?](#Is_It_Just_for_Model_Organisms.3F)
- [Technologies](#Technologies)
- [The Components
  of GMOD](#The_Components_of_GMOD)
  - [What is
    GBrowse?](#What_is_GBrowse.3F)
    - [JBrowse](#JBrowse)
  - [Relational
    Databases](#Relational_Databases)
    - [Chado
      and BioSQL](#Chado_and_BioSQL)
    - [GFF
      Databases](#GFF_Databases)
  - [What are
    WebApollo and Apollo?](#What_are_WebApollo_and_Apollo.3F)
  - [What are
    MAKER and DIYA?](#What_are_MAKER_and_DIYA.3F)
  - [What is
    Pathway Tools?](#What_is_Pathway_Tools.3F)
  - [What is
    CMap?](#What_is_CMap.3F)
    - [And
      SynView? or Sybil? or
      GBrowse_Syn?](#And_SynView.3F_or_Sybil.3F_or_GBrowse_Syn.3F)
  - [What is
    Tripal?](#What_is_Tripal.3F)
  - [What is
    Modware?](#What_is_Modware.3F)
  - [What is
    BioPerl?](#What_is_BioPerl.3F)
  - [And What
    Else is in GMOD?](#And_What_Else_is_in_GMOD.3F)
- [Case
  Studies](#Case_Studies)
  - [A Simple
    Sequence Browser](#A_Simple_Sequence_Browser)
    - [Recommendation](#Recommendation)
  - [A Simple
    Sequence Browser plus a Sequence
    Annotator](#A_Simple_Sequence_Browser_plus_a_Sequence_Annotator)
    - [Recommendation](#Recommendation_2)
  - [A Browser
    for a Stock Collection](#A_Browser_for_a_Stock_Collection)
    - [Recommendation](#Recommendation_3)
  - [A Browser
    for Microarray Data](#A_Browser_for_Microarray_Data)
    - [Recommendation](#Recommendation_4)
  - [A Browser
    for Map Data](#A_Browser_for_Map_Data)
    - [Recommendation](#Recommendation_5)
- [Computing](#Computing)
  - [Personnel,
    Hardware and Operating
    System](#Personnel.2C_Hardware_and_Operating_System)
  - [Software](#Software)
    - [Databases](#Databases)
    - [Programming
      Languages](#Programming_Languages)
      - [Perl](#Perl)
      - [Java](#Java)
    - [Apache, the Web
      Server](#Apache.2C_the_Web_Server)
  - [Glossary](#Glossary)
  - [Licenses](#Licenses)

## Introduction

With the amount of technical documentation available for GMOD, the
casual observer would be forgiven if they concluded that GMOD was a
project about software. But it's not: GMOD has been created _for
biologists_ and in the real world, it is used _by biologists_. However,
the creators of GMOD are mostly not practicing biologists and the look
and the feel of most GMOD documentation reflects this. What we will
attempt to do is discuss GMOD from the researchers' perspective. This
does not simply mean describe what the software does. If you look, for
example, at a typical [GBrowse](/wiki/GBrowse.1) page (e.g.
<a href="http://www.chr7.org/cgi-bin/gbrowse/gbrowse/chr7_v2/"
class="external text" rel="nofollow">GBrowse view of human chromosome
7</a>), you'll understand immediately what GBrowse is built to do, and a
few more minutes of clicking and scrolling will reveal all sorts of
useful ways to display and query the data. A modern biologist knows a
great deal about bioinformatics functionality already. This introduction
is more concerned with answering practical questions, such as _given the
data I have, what database should I use?", "do I even need a database?_,
or _how hard is this going to be?_.

In our experience we find that most biologists want to focus on the
science. They may have little knowledge of programming languages or
databases, and only passing interest in the IT minutiae. They have deep
knowledge of their own data and know how such data can be viewed and
analyzed. These biologists want to know how to efficiently create a
useful set of tools for their data, and to be assured that their
platform and tools can be easily maintained in an environment where
resources may be limited. We will attempt to address these sorts of
questions.

By the way, the word _we_ used here refers to the [GMOD Help
Desk](/wiki/GMOD_Help_Desk). The Help Desk is a good resource
for biologists who want to learn more about GMOD. Feel free to email us
at <a href="mailto:help@gmod.org" class="external text"
rel="nofollow">help@gmod.org</a>.

## What is a GMOD?

GMOD is a collection of interconnected applications and databases that
biologists use as repositories and as tools. That connectivity is really
the key here. Bioinformatics applications and databases are produced at
a steady rate and this output is described each month in a number of
different journals. There's no lack of tools, but many of these tools
will be little used as prospective users may not have the resources or
expertise required to install the tool and hook it up to their data.
What is generally lacking is a concerted effort to produce tools and
databases that will work together; GMOD fills this void by providing the
means to store data and a comprehensive set of tools for manipulating
that data.

GMOD also describes a community. Many of the GMOD software components
are mature software with many human-years of software development behind
them. The design, development, and testing has been driven by a diverse
group of software developers, scientists, and laboratories that use or
improve these software components every day. The demand for software
like this has been strong since genome sequence started to appear and
many of the first genome databases used GMOD components. GMOD database
and software components have developed and expanded with the massive
growth and development of genome projects and the changing needs of
users.

GMOD is also that specific thing that is installed on your computer. It
may be the private viewer to your latest data that a student set up over
the weekend. It may a terabyte-size database and suite of web
applications developed over many years at a central laboratory. It may a
database of experimental data accessible by script, or it may the
annotation tool that you use to describe your favorite genome.

GMOD does not claim to cover every potential data storage, analysis or
manipulation request that a biologist may have, but GMOD is a project
directed by its user base: the biologists lead and the software
developers follow, not the other way around. If you find your
predicament is not addressed, or is only partially addressed, by what's
available in GMOD, your first step should be to contact the [GMOD Help
Desk](/wiki/GMOD_Help_Desk) or one of the main mailing lists
like
<a href="https://lists.sourceforge.net/lists/subscribe/gmod-announce"
class="external text" rel="nofollow">gmod-announce</a> to make sure that
your understanding of the available GMOD resources is correct. When
you're in touch with some knowledgable person, try to get a sense of
what the solution might be, or its degree of difficulty. It may be that
your solution may entail something simple, or it may be that a project
may have to be created, complete with partnerships and grants. GMOD
participants are always interested in seeing GMOD take off in new
directions.

### Is It Just for _Model_ Organisms?

GMOD stands for **G**eneric **M**odel **O**rganism **D**atabase; it was
named back in the days when there were a handful of _model organisms_
and it appeared that obtaining the genomic sequence of an organism was a
prohibitively expensive proposition, taking months or years to
accomplish. With the ease and speed at which genomes can now be
sequenced, few scientists would consider their organism a 'model' in
this early sense of the word, so we suggest users think of the _M_ as
standing for _Myriad_ or _My_.

Any organism with any kind of sequence associated with it is a good
candidate as a subject for a GMOD database. There are GMOD databases
with just protein sequence in them like the
<a href="http://browse.yeastgenome.org/fgb2/gbrowse/scproteome/"
class="external text" rel="nofollow"><em>S. cerevisiae</em> Proteome
Browser</a>. There are GMOD databases with EST sequence only, such as
the <a href="http://128.206.12.216/cgi-bin/gbrowse/cattle_est_cluster/"
class="external text" rel="nofollow">Cattle EST Gene Family Database</a>.
There are GMOD databases that are concerned primarily with gene
expression, such as the
<a href="http://forest.mbl.edu/cgi-bin/site/emiliania04"
class="external text" rel="nofollow"><em>Emiliania huxleyi</em> Serial
Analysis of Gene Expression</a> database. We even find GMOD databases
dedicated to collections of RNA sequence like the _Leishmania
tarentolae_ RNA Editing database. We have also heard of GMOD databases
for oligonucleotides and plasmids. See [GMOD
Users](/wiki/GMOD_Users) for a list of other examples. The list
of GMOD databases demonstrates that GMOD is widely used, with many
organisms represented, and that these databases can hold sequences of
any kind.

## Technologies

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td></td>
<td></td>
</tr>
<tr class="even">
<td><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5c/Mini-arch-diagram.png" width="97"
height="237" alt="Mini-arch-diagram.png" /></td>
<td>Most GMOD installations have a general architecture in common. There
is a data source: the <a href="/wiki/Glossary#Database"
title="Glossary">database</a>. This does not have to be a relational
database; it could be a file or a set of files with or without some kind
of index. There's a lot of flexibility at the data level. Choosing this
database and loading it will be tasks you'll give a lot of thought to.
<p><br />
What the user will see is one or more applications. These may be a set
of web pages or a Java application. The choice of applications is
dictated by the nature of your data. Sometimes the choice of application
is easy or clear for a given kind of data. For some other data types
you'll have to take a careful look at a few different applications and
consider whether you want to invest more resources in order to create
complex data representations or whether you want to expend less effort
and offer something simpler.</p>
<p><br />
There will also be software mediating the flow of information between
the application and the database. Typically this is going to be a <a
href="#Apache:_The_Web_Server">Web server</a>: the Web server receives
<em>requests</em> from the application and translates them to database
queries, then receives data, formats it, and sends it back to the
application. This piece of software can be thought as performing routine
or mechanical tasks. It's important but you'll install it and typically
pay little attention to it.</p></td>
</tr>
</tbody>
</table>

## The Components of GMOD

GMOD is made up databases, applications, and adaptor software that
connects these components together. Some of the most popular packages
are discussed below.

### What is GBrowse?

[GBrowse](/wiki/GBrowse.1) is short for _Genome Browser_, or
_Generic Genome Browser_. GBrowse is probably GMOD's most popular
component and almost all of the databases listed in [GMOD
Users](/wiki/GMOD_Users) use GBrowse. It is fairly easy to
install, requiring only basic
<a href="http://en.wikipedia.org/wiki/Command_line" class="extiw"
title="wp:Command line">command-line</a> familiarity. GBrowse is popular
is because it is a supremely capable browser. The picture below is a
partial screenshot of a GBrowse page taken from the
<a href="http://www.chr7.org/cgi-bin/gbrowse/gbrowse/chr7_v2"
class="external text" rel="nofollow">Human chromosome 7 database at
TCAG</a>. A bit of jargon: the rows, each depicting one sort of data,
are called _tracks_ and tracks are populated by one or more images
called _glyphs_, plus text.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f7/Gbrowse-glyphs.png" width="946"
height="761" alt="Gbrowse-glyphs.png" />

GBrowse comes with a large library of glyphs, including pie charts, dot
plots, histograms, and X-Y plots suitable for quantitative data, as well
as the expected array of glyphs that describe sequences and sequence
annotation. It is also highly configurable, meaning you can do quite a
bit of customization of the glyphs, you can link glyphs to URLs of your
choice, you can _internationalize_ the application to display different
languages, you can connect and retrieve data from any database, and
more. This sort of work generally requires either modifying GBrowse's
configuration files or adding your own code. GBrowse is written in
<a href="http://en.wikipedia.org/wiki/Perl" class="extiw"
title="wp:Perl">Perl</a>; as GBrowse is designed to be customized,
extending its functionality with your own code should not require expert
coding skill.

#### JBrowse

[JBrowse](/wiki/JBrowse.1) is a genome browser with a fully dynamic
HTML5 user interface, being developed as the successor to GBrowse. It is
very fast and scales well to large datasets. JBrowse is javascript-based
and does almost all of its work directly in the user's web browser, with
minimal requirements for the server. JBrowse's features include:

- Fast, smooth scrolling and zooming. Explore your genome with
  unparalleled speed.
- Scales easily to multi-gigabase genomes and deep-coverage sequencing.
- Supports GFF3, BED, FASTA, Wiggle, BigWig, BAM, VCF (with tabix),
  REST, and more. BAM, BigWig, and VCF data are displayed directly from
  the compressed binary file with no conversion needed.
- Very light server resource requirements. JBrowse has no back-end
  server code, just tools for formatting data files to be read directly
  over HTTP. Serve huge datasets from a single low-cost cloud instance.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7e/JBrowse_alignment_and_coverage.png/600px-JBrowse_alignment_and_coverage.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7e/JBrowse_alignment_and_coverage.png/900px-JBrowse_alignment_and_coverage.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/7e/JBrowse_alignment_and_coverage.png 2x"
width="600" height="373" alt="JBrowse alignment and coverage" />

Screenshot of JBrowse in action

### Relational Databases

For those unfamiliar with databases, the [brief guide to
databases](/wiki/A_Brief_Guide_to_Databases)
provides a gentle introduction.

<a href="http://www.databasejournal.com/sqletc/article.php/1469521"
class="external text" rel="nofollow">Relational databases</a> are
today's tool of choice when faced with the problem of storing complex or
multifaceted data, assuming that the data is, or can be, broken down
into ever smaller bits of data. All atomized data will end up in one
_field_, analogous to the way that data can be organized as columns in a
spreadsheet. Fields describing aspects of a "thing" (an _entity_) are
organized together into _tables_. For example, a relational database may
have a table called _gene_ with _gene.name_ and _gene.geneid_ fields and
a _protein_ table with _protein.name_, _protein.proteinid_ and
_protein.sequence_ fields.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/43/Table-example.png" width="441"
height="129" alt="Table-example.png" />

The picture above shows these two tables, and explains the term
_relational_. The relation between the tables is the shared _geneid_ -
we add the _geneid_ field to the _protein_ table to indicate that the
CFTR_1 protein record relates back to a specific gene in the _gene_
table. This _geneid_ field in _protein_, which originates in _gene_ and
whose values are stored in _gene_, is an example of a _foreign key_, a
field from a table that is shared by one or more other tables.

For a given collection of data, genomic sequence and annotation for
example, there will be more than one way to represent the data
relationally. A given relational design, essentially tables and fields,
is called a _[schema](/wiki/Glossary#Database_Schema)_ (think of
the schema as a blueprint, empty, and the schema populated with data as
the database). Both
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> and
[BioSQL](/wiki/BioSQL) can store genomic data for example, but they
do it differently. The details of schema design are not relevant here
but one can say that the designer may think about some of these general
concerns:

- The degree of data abstraction, which is related to a database concept
  called <a href="http://en.wikipedia.org/wiki/Database_normalization"
  class="extiw" title="wp:Database normalization">normalization</a> and
  to the flexibility of the schema
- The legibility of the schema, which has to do with the ease of using
  it
- The breadth of the schema, in terms of the data types it could contain

From the scientific perspective one can ask related questions:

- How flexible is a given schema?
- Can it handle my data now and in the future?
- Will using a given schema be easier or harder to use than some other
  schema?

This last question relates mostly to the degree of abstraction of the
schema, not to the actual programming languages used.

All of today's relational databases are created and loaded and queried
using one language,
<a href="http://en.wikipedia.org/wiki/SQL" class="extiw"
title="wp:SQL">SQL</a>; programmers use their chosen language
(<a href="http://en.wikipedia.org/wiki/Perl" class="extiw"
title="wp:Perl">Perl</a>,
<a href="http://en.wikipedia.org/wiki/Java" class="extiw"
title="wp:Java">Java</a>,
<a href="http://en.wikipedia.org/wiki/Python" class="extiw"
title="wp:Python">Python</a>, etc.) to execute SQL queries and process
the results.

See also:

- [A Brief Guide to
  Databases](/wiki/A_Brief_Guide_to_Databases)
- [Databases and GMOD](/wiki/Databases_and_GMOD)
- [Database Tools](/wiki/Category%253ADatabase_Tools)

#### Chado and BioSQL

So when you choose to use a relational schema it will all really come
down to you and your data, not technical details.
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> is one of
the <a href="http://www.databasejournal.com/sqletc/article.php/1469521"
class="external text" rel="nofollow">relational databases</a> that are
used in GMOD, the other being
<a href="http://biosql.org" class="external text"
rel="nofollow">BioSQL</a>.

The differences are clear.
<a href="http://biosql.org" class="external text"
rel="nofollow">BioSQL</a> is quite focussed and is concerned with:

- Sequence
- Sequence annotation
- Phylogeny
- Publications

It is also a thoroughly modern schema in that it uses
<a href="http://obofoundry.org" class="external text"
rel="nofollow">OBO</a>-style ontologies, such as the
<a href="http://geneontology.org" class="external text"
rel="nofollow">Gene Ontology</a> (GO). This is a requirement, given the
ubiquity of ontologies and their ability to describe and organize data.

Chado's focus is broader. Its tables are broken down into groups called
_modules_; the modules are the following:

- [Audit](/wiki/Chado_Audit_Module) - for database audit
  trails
- [Companalysis](/wiki/Chado_Companalysis_Module) -
  for data from computational analysis
- [Contact](/wiki/Chado_Contact_Module) - for people,
  groups, and organizations
- [Controlled Vocabulary (cv)](/wiki/Chado_CV_Module) - for
  controlled vocabularies and ontologies
- [Expression](/wiki/Chado_Expression_Module) - for
  summaries of RNA and protein expression
- [General](/wiki/Chado_General_Module) - for
  identifiers
- [Genetic](/wiki/Chado_Genetic_Module) - for genetic
  data and genotypes
- [Library](/wiki/Chado_Library_Module) - for
  descriptions of molecular libraries
- [Mage](/wiki/Chado_Mage_Module) - for microarray data
- [Map](/wiki/Chado_Map_Module) - for maps without sequence
- [Natural Diversity
  (ND)](/wiki/Chado_Natural_Diversity_Module.1) -
  for multiple experiments, such as phenotyping and genotyping
- [Organism](/wiki/Chado_Organism_Module) - for
  taxonomic data
- [Phenotype](/wiki/Chado_Phenotype_Module) - for
  phenotypic data
- [Phylogeny](/wiki/Chado_Phylogeny_Module) - for
  organisms and phylogenetic trees
- [Publication
  (pub)](/wiki/Chado_Publication_Module) - for
  publications and references
- [Sequence](/wiki/Chado_Sequence_Module) - for
  sequences and sequence features
- [Stock](/wiki/Chado_Stock_Module) - for specimens and
  biological collections
- [WWW](/wiki/Chado_WWW_Module) -

It is also possible to _add_ modules to Chado. For instance, in early
2007 a module called [mage](/wiki/Chado_Mage_Module) was
added to addresses microarray data. Other possibilities that are being
discussed are modules for ecological data and additional work for
phenotypic data, extending the existing [phenotype
module](/wiki/Chado_Phenotype_Module). The real point
is that Chado has been designed to allow extensibility, and one can
either formally propose that Chado acquire some new functionality as a
module or you can add tables to Chado in the privacy of your own server.

Chado is also ontology-aware. One could state this even more forcefully:
Chado depends on ontologies. For example, in [Chado's Sequence
module](/wiki/Chado_Sequence_Module) it is expected
that all stored sequences are identified by one or more terms from the
<a href="http://sequenceontology.org" class="external text"
rel="nofollow">Sequence Ontology</a>. A quick scan of the [tables in
Chado](/wiki/Chado_Tables), more than 100, shows that about
half of the tables contain the field, foreign key, _cvterm_, referring
to an ontology term. The ontology used as source for a term could be one
of many but people in the field tend to rely on
<a href="http://obofoundry.org" class="external text"
rel="nofollow">OBO</a> ontologies. So the ontology could be a common and
general one like GO, the
<a href="http://geneontology.org" class="external text"
rel="nofollow">Gene Ontology</a>, or something highly specific to a
group of organisms like the
<a href="http://obo.sourceforge.net/cgi-bin/detail.cgi?fly_anatomy"
class="external text" rel="nofollow">Drosophila Anatomy ontology</a> or
the <a href="http://www.informatics.jax.org/searches/MP_form.shtml"
class="external text" rel="nofollow">Mammalian Phenotype ontology</a>.
In conjunction with Chado, these ontologies give you a database that is
extremely flexible, and as your ontologies expand, so does the
expressive capability of the system.

There is a cost to this flexibility and breadth: Chado is complex and it
is unlikely that someone unfamiliar with Chado would be able to install
it and then immediately set about loading it with biological data of
different sorts. Fortunately there are [mailing
lists](/wiki/GMOD_Mailing_Lists) you can contact, as well
as the [GMOD Help Desk](/wiki/GMOD_Help_Desk), and number of
pages on this Wiki discussing Chado (see [Getting Started with
Chado](/wiki/Chado_-_Getting_Started) and the [Chado
Manual](/wiki/Chado_Manual)).

#### GFF Databases

In addition to relational database schemas like
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> and
[BioSQL](/wiki/BioSQL) you will also encounter _GFF databases_.
[GFF](/wiki/GFF) is a compact format for describing sequence and
sequence annotations. GMOD installations like the
<a href="http://www.chr7.org/cgi-bin/gbrowse/gbrowse/chr7_v2"
class="external text" rel="nofollow">Human Chromosome 1 database</a>
described above are concerned solely with sequence and annotation and
the entire contents of such a database can be represented as GFF. For
small installations the entire database can be just a set of GFF text
files (in fact, you can install [GBrowse](/wiki/GBrowse.1) on your
personal computer and then browse _Saccharomyces_ and _Volvox_ genomic
sequence, reading directly from GFF files installed along with GBrowse -
_try it!_). But when the amount of GFF gets too large to be read into
memory all at once you have to store the GFF in some form that's indexed
for fast retrieval. The solution is to load the GFF into
[MySQL](/wiki/MySQL) or some other sort of database management system,
this assures good performance even if you have very large amounts of
data in GFF format. This is accomplished by using the Bio::DB::GFF or
Bio::DB::SeqFeature [GBrowse
Adaptors](/wiki/GBrowse_Adaptors).

### What are WebApollo and Apollo?

Unlike [JBrowse](/wiki/JBrowse.1) and
[GBrowse](/wiki/GBrowse.1), which only function as a sequence
browser, [WebApollo](/wiki/WebApollo.1) and its standalone
predecessor [Apollo](/wiki/Apollo.1), are for both viewing and
manually annotating genomes. WebApollo is a plugin for
[JBrowse](/wiki/JBrowse.1) that allows multiple users to annotate
genomes concurrently. Changes made by others are automatically and
immediately updated in the user's browser window, ensuring that there is
no duplication of effort, and allowing several users to annotate parts
of the same sequence at the same time. A full history of all edits is
kept, and the changes made in editing sessions can be approved or
rejected by an administrator before being saved. WebApollo shares
JBrowse's fast, flexible browsing interface, and users require only a
web browser to use it.

[Apollo](/wiki/Apollo.1) is a standalone [Java
application](/wiki/Category%253AJava) for manual sequence
annotation, and is the predecessor of WebApollo. Apollo can read and
write to Chado databases, but lacks the instant updates that WebApollo
features. We recommend using [WebApollo](/wiki/WebApollo.1) as it
is under active development and has a more full feature set than Apollo.

### What are MAKER and DIYA?

[GBrowse](/wiki/GBrowse.1) and [Apollo](/wiki/Apollo.1) both deal
with [genome annotations](/wiki/Category%253AAnnotation),
but where do these annotations come from? Frequently they come from a
_genome annotation pipeline_, a software package or series of software
packages that take an assembly (and other things) as input and produces
an annotated genome, often with gene models, ESTs, proteins, and almost
anything else that can be tied back to a genomic sequence.

[MAKER](/wiki/MAKER.1) is a genome annotation pipeline that produces
annotated eukaryotic genomes, and [DIYA](/wiki/DIYA) is a genome
annotation pipeline for prokaryotic genomes (and both do more than that
too). They both produce gene models in [GFF](/wiki/GFF), a file format
that can be directly loaded into [GBrowse](/wiki/GBrowse.1),
[Apollo](/wiki/Apollo.1), and
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>.

### What is Pathway Tools?

[Pathway Tools](/wiki/Pathway_Tools.1) is a software system
for creating organism-specific databases. It contains extensive
functionality that spans from genomes to pathways including a genome
browser, metabolic pathway predictor and viewer, and regulatory network
viewer, as well as a large number of interactive annotation tools.

### What is CMap?

[CMap](/wiki/CMap.1) is a popular
[comparative](/wiki/Category%253AComparative_Genomics)
map viewer. It was initially created for use at
<a href="http://gramene.org" class="external text"
rel="nofollow">Gramene</a> but was redesigned to be used for any
organism or set of organisms. It can display genetic maps or physical
maps and draw the relations between the two. It will also show synteny.
It is written in
<a href="http://en.wikipedia.org/wiki/Perl" class="extiw"
title="wp:Perl">Perl</a> and requires an underlying RDBMS such as
<a href="http://www.mysql.com" class="external text"
rel="nofollow">MySQL</a>. If you need to display maps or syntenic
relationships, you may need more than [GBrowse](/wiki/GBrowse.1).

#### And SynView? or Sybil? or GBrowse_Syn?

Yes, there are other [comparative
genomics](/wiki/Category%253AComparative_Genomics)
viewers. The alternatives to [CMap](/wiki/CMap.1) are
[GBrowse_syn](/wiki/GBrowse_syn.1), [Sybil](/wiki/Sybil), and
[SynView](/wiki/SynView). [Sybil](/wiki/Sybil) stores its data in
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> and
accommodates a variety of different analyses; go to the
<a href="http://sybil.sourceforge.net/" class="external text"
rel="nofollow">Sybil Web site</a> if you want to learn more.
[GBrowse_syn](/wiki/GBrowse_syn.1) and
[SynView](/wiki/SynView) build upon [GBrowse](/wiki/GBrowse.1),
and they can be considered a bit simpler than [Sybil](/wiki/Sybil) and
[CMap](/wiki/CMap.1). More information is available on their websites
to help you determine which is most suitable for you.

### What is Tripal?

[Tripal](/wiki/Tripal.1) is a web frontend for a Chado database that
provides both an attractive, slick website for accessing and
disseminating Chado data, and an interface for local users to upload and
edit data in the database. Tripal is based on the popular content
management system <a href="http://drupal.org" class="external text"
rel="nofollow">Drupal</a>, and creates a customisable website from the
Chado database. Tripal includes a number of analysis modules that allow
the incorporation of external data (for example, Gene Ontology
annotations), and tools such as [GBrowse](/wiki/GBrowse.1),
[Galaxy](/wiki/Galaxy.1), and [CMap](/wiki/CMap.1) can be integrated
into the site. Tripal is very customisable and, as it is based on
Drupal, extra website content can easily be added using the standard
Drupal functionality. For groups looking to avoid the substantial
investment of time and effort involved in creating a website for data
display and dissemination, Tripal offers a simple, stylish solution.

### What is Modware?

[Modware](/wiki/Modware) is a middleware package used in GMOD,
written in <a href="http://en.wikipedia.org/wiki/Perl" class="extiw"
title="wp:Perl">Perl</a>. Middleware is software that mediates the
exchange of information between applications, e.g. between web pages and
databases; please see the [GMOD
Middleware](/wiki/GMOD_Middleware) page for technical
details. GMOD developers have evaluated a number of Perl middleware
packages and decided that Modware is best suited to GMOD Perl
development. Like <a href="http://bioperl.org" class="external text"
rel="nofollow">Bioperl</a>, Modware may be a package that you may need
to install but won't need to understand in any detail.

### What is BioPerl?

<a href="http://bioperl.org" class="external text"
rel="nofollow">BioPerl</a> is a popular bioinformatics toolkit written
in <a href="http://en.wikipedia.org/wiki/Perl" class="extiw"
title="wp:Perl">Perl</a>. The reason we mention it here is because many
of the [GMOD Components](/wiki/GMOD_Components) use parts of
it. You will **not** have to learn BioPerl in order to use GMOD but you
may have to install it.

[BioPerl](/wiki/BioPerl) offers some attractive ways to store
genomic data without requiring a
[relational](/wiki/Glossary#Relational_Database_Management_System)
database. We discussed
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> and
[BioSQL](/wiki/BioSQL) above; these two relational
[schemas](/wiki/Glossary#Schema) require the prior installation of
some free, open source [RDBMS](/wiki/Glossary#RDBMS) like
[MySQL](/wiki/MySQL) or [PostgreSQL](/wiki/PostgreSQL).
Installing these pieces, schema plus RDBMS, is not necessarily
difficult, but if you only have sequence and sequence annotation, you
can set up a sequence or genome browser using BioPerl,
[GBrowse](/wiki/GBrowse.1), and an
<a href="http://apache.org" class="external text"
rel="nofollow">Apache</a> web server. You can use either the
<a href="http://search.cpan.org/perldoc?Bio::DB::GFF"
class="external text" rel="nofollow">Bio::DB::GFF</a> module from
BioPerl or the
<a href="http://search.cpan.org/perldoc?Bio::DB::SeqFeature"
class="external text" rel="nofollow">Bio::DB::SeqFeature</a> module. See
[A Simple Sequence Browser](#A_Simple_Sequence_Browser) below.

### And What Else is in GMOD?

A number of other software packages, listed below, classified by general
function. One might be tempted to think of this as a shopping list,
choosing one of each. But it may also be useful to think of what is
absolutely essential first and consider these other components as
_add-ons_. Some of these components are only _loosely coupled_ to some
of the more core components described above; an application might use
its own methods to store data and not use
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>. Or, a
component may be written in
<a href="http://en.wikipedia.org/wiki/Java" class="extiw"
title="wp:Java">Java</a> and not Perl, so it would not be able to
communicate with a Perl application. For something to be considered a
GMOD component it does not, at this time, have to connect to some other
component.

<table width="80%" data-align="center" data-cellpadding="10px">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><p><strong>Community Annotation</strong></p>
<p><a href="/wiki/Apollo.1" title="Apollo">Apollo</a></p>
<p><a href="/wiki/BioDIG.1" title="BioDIG">BioDIG</a></p>
<p><a href="/wiki/Canto" title="Canto">Canto</a></p>
<p><a href="/wiki/WebApollo.1" title="WebApollo">WebApollo</a></p>
<p>Wiki <a href="/wiki/TableEdit.1" title="TableEdit">TableEdit</a></p>
<p><br />
<strong>Comparative Genome Visualization</strong></p>
<p><a href="/wiki/CMap.1" title="CMap">CMap</a></p>
<p><a href="/wiki/GBrowse_syn.1" title="GBrowse syn">GBrowse_syn</a></p>
<p><a href="/wiki/Pathway_Tools.1" title="Pathway Tools">Pathway Tools</a></p>
<p><a href="/wiki/SynView" title="SynView">SynView</a></p>
<p><a href="/wiki/Sybil" title="Sybil">Sybil</a></p>
<p><br />
<strong>Database schema</strong></p>
<p><a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a></p>
<p><br />
<strong>Database tools</strong></p>
<p><a href="/wiki/Argos" title="Argos">Argos</a></p>
<p><a href="/wiki/BioMart" title="BioMart">BioMart</a></p>
<p><a href="/wiki/Genome_grid" title="Genome grid">Genome grid</a></p>
<p><a href="/wiki/GMODTools" title="GMODTools">GMODTools</a></p>
<p><a href="/wiki/InterMine" title="InterMine">InterMine</a></p>
<p><a href="/wiki/LuceGene" title="LuceGene">LuceGene</a></p>
<p><a href="/wiki/XORT.1" title="XORT">XORT</a></p>
<p><br />
</p></td>
<td data-valign="top"><p><strong>Gene Expression
Visualization</strong></p>
<p><a href="/wiki/Caryoscope" title="Caryoscope">Caryoscope</a></p>
<p><a href="/wiki/GeneXplorer" title="GeneXplorer">GeneXplorer</a></p>
<p><a href="/wiki/Pathway_Tools.1" title="Pathway Tools">Pathway Tools</a></p>
<p><br />
<strong>Genome Annotation</strong></p>
<p><a href="/wiki/Apollo.1" title="Apollo">Apollo</a></p>
<p><a href="/wiki/DIYA" title="DIYA">DIYA</a></p>
<p><a href="/wiki/MAKER.1" title="MAKER">MAKER</a></p>
<p><a href="/wiki/SOBA.1" title="SOBA">SOBA</a></p>
<p><a href="/wiki/WebApollo.1" title="WebApollo">WebApollo</a></p>
<p><br />
<strong>Genome Visualization &amp; Editing</strong></p>
<p><a href="/wiki/Apollo.1" title="Apollo">Apollo</a></p>
<p><a href="/wiki/Flash_GViewer" title="Flash GViewer">Flash GViewer</a></p>
<p><a href="/wiki/GBrowse.1" title="GBrowse">GBrowse</a></p>
<p><a href="/wiki/JBrowse.1" title="JBrowse">JBrowse</a></p>
<p><a href="/wiki/Pathway_Tools.1" title="Pathway Tools">Pathway Tools</a></p>
<p><a href="/wiki/WebGBrowse.1" title="WebGBrowse">WebGBrowse</a></p>
<p><a href="/wiki/WebApollo.1" title="WebApollo">WebApollo</a></p>
<p><br />
<strong>Literature and Curation Tools</strong></p>
<p><a href="/wiki/BioDIG.1" title="BioDIG">BioDIG</a></p>
<p><a href="/wiki/Canto" title="Canto">Canto</a></p>
<p><a href="/wiki/Textpresso" title="Textpresso">Textpresso</a></p></td>
<td data-valign="top"><p><strong>Molecular Pathway
Visualization</strong></p>
<p><a href="/wiki/Pathway_Tools.1" title="Pathway Tools">Pathway Tools</a></p>
<p><br />
<strong>Ontology Visualization</strong></p>
<p><a href="/wiki/GO_Graphic_Viewer.1" title="GO Graphic Viewer">Go Graphic
Viewer</a></p>
<p><br />
<strong>Workflow Management</strong></p>
<p><a href="/wiki/Galaxy.1" title="Galaxy">Galaxy</a></p>
<p><a href="/wiki/TIGR-Workflow_/_Ergatis"
title="TIGR-Workflow / Ergatis">Ergatis</a></p>
<p><a href="/wiki/DIYA" title="DIYA">DIYA</a></p>
<p><a href="/wiki/ISGA" title="ISGA">ISGA</a></p>
<p><br />
<strong>Middleware</strong></p>
<p><a href="/wiki/Modware" title="Modware">Modware</a></p>
<p><a href="/wiki/Chado%253A%253AAutoDBI"
title="Chado%253A%253AAutoDBI">Chado%253A%253AAutoDBI</a></p>
<p><a href="/wiki/Bio%253A%253AChado%253A%253ASchema"
title="Bio%253A%253AChado%253A%253ASchema">Bio%253A%253AChado%253A%253ASchema</a></p>
<p><br />
<strong>Tool Integration</strong></p>
<p><a href="/wiki/Galaxy.1" title="Galaxy">Galaxy</a></p>
<p><br />
<strong>Sequence Alignment</strong></p>
<p><a href="/wiki/BLAST_Graphic_Viewer.1" title="BLAST Graphic Viewer">Blast
Graphic</a></p>
<p><br />
<strong>Website front end for Chado DB</strong></p>
<p><a href="/wiki/Tripal.1" title="Tripal">Tripal</a></p></td>
</tr>
</tbody>
</table>

## Case Studies

What we are attempting to do here is anticipate some of the basic
requirements of the scientist. The classic situation is that he or she
has data of some type, or of many different types, and needs to set up
both a data repository and a viewer on this data. We are assuming that
the scientist is not a programmer or an IT expert but that he or she is
willing to learn the necessary skills or has a student available to do
the required work.

### A Simple Sequence Browser

- The data: sequence (genomic DNA or ESTs or proteins or cDNAs or some
  combination of these or ...)
- The goal: create a browser to query and view sequence and sequence
  annotations
- The core software: [GBrowse](/wiki/GBrowse.1), Apache Web server,
  and <a href="http://bioperl.org" class="external text"
  rel="nofollow">Bioperl</a>
- The hardware: a server running Unix (Linux or Mac) or Windows

1.  Figure out what the annotations should be (i.e. gene coordinates,
    motif matches, oligonucleotide matches, etc. You can try using
    annotation pipelines like [MAKER](/wiki/MAKER.1) to automatically
    build these.)
2.  Install core software
3.  Create or gather the annotations (BLAST results or HMMER results or
    GenBank files or ...)
4.  Transform all the annotations into a format suitable for loading
    ([GFF](/wiki/GFF) format)
5.  Load GFF into the GFF database
6.  Configure GBrowse

Possible challenge: Step 4, converting all the annotations to
[GFF](/wiki/GFF) (scripts may available to perform all the conversions,
or you may have to write some of the conversion code yourselves)

- Skills needed: basic command-line competence, perhaps basic Perl
  competence if you have to write any custom conversion code
- Resources available: documentation at GMOD.org, the [GMOD Help
  Desk](/wiki/GMOD_Help_Desk), the [GMOD Mailing
  Lists](/wiki/GMOD_Mailing_Lists)

#### Recommendation

Highly recommended. Setting this up will give you a good sense of how
the software pieces interoperate. Not only that, but
[GBrowse](/wiki/GBrowse.1) is fun and it comes with sample databases
so once it's installed you have actual genome sequence to play with. You
can even get GBrowse running nicely on a laptop.

### A Simple Sequence Browser plus a Sequence Annotator

- The data: sequence (genomic DNA or ESTs or cDNAs or some combination
  of these or ...)
- The goal: create a browser to query and view sequence and sequence
  annotations along with an editor to manually annotate the sequences
- The core software: [GBrowse](/wiki/GBrowse.1),
  [Apollo](/wiki/Apollo.1),
  <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> (plus
  [relational
  database](/wiki/Glossary#Relational_Database_Management_System)),
  Apache Web server, and [BioPerl](/wiki/BioPerl)
- The [hardware](/wiki/Computing_Requirements): a
  server running [Unix](/wiki/Glossary#Unix) (Linux or Mac) or
  Windows

1.  Figure out what the annotations should be (gene coordinates or motif
    matches or oligonucleotide matches or hand-made annotations or some
    combination of these or ...)
2.  Install core software
3.  Create or gather the annotations (BLAST results or HMMER results or
    GenBank files or ...)
4.  Transform all the annotations into a format suitable for loading
    ([GFF](/wiki/GFF) format)
5.  Load GFF into the Chado database
6.  Install and configure Gbrowse
7.  Install and configure Apollo

A challenge: Step 2, installing core software (with more components you
have a more complex system and more potential pitfalls, and Chado and
its relational database is a fairly detailed install)

Possible challenge: Step 4, converting all the annotations to
[GFF](/wiki/GFF) (scripts may available to perform all the conversions,
or you may have to write some of the conversion code yourselves)

Skills needed: basic command-line competence, perhaps basic Perl
competence if you have to write any custom conversion code. Some
understanding of relational databases for the Chado installation. Basic
Java competence for the Apollo installation.

Resources available: documentation at www.gmod.org, the GMOD Help Desk,
the GMOD mailing lists

#### Recommendation

If you're a GMOD novice, install GBrowse by itself first ([A Simple
Sequence Browser](#A_Simple_Sequence_Browser)), then consider this
system.

### A Browser for a Stock Collection

- The data: the stock collection data in some structured form (Excel or
  Word or ...)
- The goal: create a browser to query and view your laboratory's stock
  collection
- The core software:
  <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> (and its
  relational database), Apache Web server, and
  [Turnkey](/wiki/Turnkey)
- The hardware: a server running the Unix (Linux or Mac) or Windows
  [operating system](/wiki/Glossary#Operating_System).

1.  Install core software
2.  Load stock collection data into the Chado database
3.  Create a [Tripal](/wiki/Tripal.1)-based Web site

Challenges:

- Possible challenge: Step 1, installing core software (Chado and its
  relational database is a fairly detailed install)
- A challenge: Step 2, loading the stock collection data into Chado
  (scripts will not be available to perform this loading, you will have
  to create the code yourselves)
- Possible challenge: Step 2, loading the data. The Chado schema may not
  be properly configured for your data and may need to be modified.
- Possible challenge: Step 3, running Turnkey to automatically create
  your browser. Turnkey is a new tool. It has been used successfully in
  testing and at [ParameciumDB](/wiki/ParameciumDB) but not all
  possibilities have been tested.

Skills needed: General IT expertise (Turnkey automates the creation of
Web sites but it is an expert's tool) Basic programming competence to
write the custom conversion code.

Resources available: documentation at
[www.gmod.org](/wiki/Main_Page), the [GMOD Help
Desk](/wiki/GMOD_Help_Desk), the [GMOD Mailing
Lists](/wiki/GMOD_Mailing_Lists).

#### Recommendation

Consider whether you want to explore uncharted territory or not. Could
be fairly straightforward for the expert, or could be challenging.

### A Browser for Microarray Data

- The data: microarray data in Affymetrix format
- The goal: create a browser to query and view your laboratory's
  microarray
- The core software: Chado, Apache Web server, and ...
- The hardware: a server running Unix (Linux or Mac) or Windows

Challenge: Chado can hold the microarray data using its [Mage
module](/wiki/Chado_Mage_Module) and applications exist to
view raw microarray data (e.g. [Caryoscope](/wiki/Caryoscope),
[GeneXplorer](/wiki/GeneXplorer)) but these applications don't
connect to Chado.

Resources available: documentation at www.gmod.org, the GMOD Help Desk,
the GMOD mailing lists

#### Recommendation

Either wait for the connectors to be built to some application or form a
partnership with GMOD scientists and developers to see that the
connectors are built.

### A Browser for Map Data

- The data: map data (genetic map data or physical map data or visual
  map data or some combination of these)
- The goal: create a browser to query and view your maps, within a
  species or across species
- The core software: GBrowse, Apache Web server, and CMap or SynView or
  Sybil.
- The hardware: a server running Unix (Linux or Mac) or Windows

1.  Choose the right map software, based on your map data and resources.
2.  Install core software.
3.  Load map data.

Possible challenge: Step 2, the installation. This may tricky if you
choose one of the more fully featured packages ([CMap](/wiki/CMap.1) or
[Sybil](/wiki/Sybil)).

Possible challenge: Step 3, the loading. It is likely that some custom
coding would be required since map data comes in all sorts of different
forms.

Skills needed: Basic command-line competence. Some understanding of
relational databases for [CMap](/wiki/CMap.1) or
[Sybil](/wiki/Sybil). Basic programming competence to write the custom
loading code.

Resources available: documentation at www.gmod.org, the GMOD Help Desk,
the GMOD mailing lists

#### Recommendation

Choose one. GMOD offers good choices here, it comes down to your data
and your resources. [SynView](/wiki/SynView) is the easiest, and it
comes with [GBrowse](/wiki/GBrowse.1).

## Computing

### Personnel, Hardware and Operating System

[Computing
Requirements](/wiki/Computing_Requirements) discusses
the personnel, hardware, and [operating
system](/wiki/Glossary#Operating_System) requirements and choices
for implementing GMOD components.

### Software

GMOD software relies on other software to function. This section lists
some other key open source packages that you may need.

#### Databases

The [Relational Databases](#Relational_Databases) section above
introduced many relational database concepts. [Databases and
GMOD](/wiki/Databases_and_GMOD) discuses [database
management system](/wiki/Glossary#Database_Management_System)
choices in GMOD. It also introduces some additional terminology.

#### Programming Languages

Two programming languages are popular in GMOD: Perl and Java. For most
tasks you won't need to do any programming in either language. You will
just need to know how to install these languages and how to install
programs written in these languages. See [Computing
Requirements](/wiki/Computing_Requirements) for more.

##### Perl

The programming language most used in the bioinformatics realm. Also the
language most used by GMOD developers. It is well-suited to text and
data processing and is also characterized by an extensive open source
library, so it's highly functional. Many of GMOD components use
<a href="http://bioperl.org" class="external text"
rel="nofollow">BioPerl</a>, a bioinformatics toolkit written in Perl.

Some pieces of GMOD, like [GBrowse](/wiki/GBrowse.1), _can_ be
extended or customized using Perl but beginners' skills in Perl would be
sufficient for this work. Just installing and using
[GBrowse](/wiki/GBrowse.1) in a conventional way does not require
knowledge of Perl or <a href="http://bioperl.org" class="external text"
rel="nofollow">BioPerl</a>.

##### Java

Java is arguably the world's most popular programming language but it is
not as popular for command-line work on Unix as Perl. It's encountered
in GMOD primarily as a language to construct user interfaces (e.g.
[Apollo](/wiki/Apollo.1)).

#### Apache, the Web Server

If you want to set up an application that displays web pages, you will
need a web server on your computer. If you don't already have one
installed, you will want to use the
<a href="http://apache.org" class="external text" rel="nofollow">Apache
Web server</a> (also known as the _Apache HTTP Server_), which is free,
fast, secure, and reasonably simple to install on Unix or Windows.

### Glossary

The GMOD [Glossary](/wiki/Glossary) explains many terms related to
GMOD, bioinformatics, and the computing technologies used in GMOD.

### Licenses

Most [GMOD Components](/wiki/GMOD_Components) have no
restrictions on using them. Those few components that do impose
restrictions will clearly state that they have restricted licenses.

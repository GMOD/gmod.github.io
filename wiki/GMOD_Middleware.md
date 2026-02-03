



<span id="top"></span>




# <span dir="auto">GMOD Middleware</span>









This is a summary and detailed notes from the *Chado Middleware Bake
Off* held at the [January 2007 GMOD
Meeting](January_2007_GMOD_Meeting "January 2007 GMOD Meeting").

## <span id="Executive_Summary" class="mw-headline">Executive Summary</span>

Although GMOD uses the
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>
[schema](Glossary#Schema "Glossary") for its underlying database, each
group has developed a separate interface to their databases. This
meeting was designed to review the experiences each group has had with
its particular solution and to recommend a "best practice."

All participants had developed some type of [Object-Relational Mapping
(ORM)](Glossary#ORM "Glossary") tool. The tools fell into two general
classes. The first class, which includes Hibernate (Java), iBatis
(Java), and [Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI") (Perl)
examines the relational schema and configuration files to create the
middleware automatically, or create a relational schema and middleware
automatically from a data model ([InterMine](InterMine "InterMine")).
The second class involved hand-coding an API to create an
object-oriented interface to Chado. Of the tools presented,
[Modware](Modware "Modware"), built on top of
[Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI"), was the most mature
and feature-rich.

The consensus from the meeting was that while fully automatic tools are
convenient, that there is considerable value in creating a hand-crafted
predictable API that reflects the biological data closely. The approach
taken by Modware, which starts from an auto-generated interface and then
adds a hand-coded API layer, is both comprehensible and powerful. The
hand-edited layer will serve the common cases in detail while the
auto-generated layer retains the full flexibility of the Chado schema
for the cases that fall outside the hand-edited API. We recommend that
implementors of Perl-based GMOD tools seriously consider Modware for
their middleware interface to Chado, and that the implementors of
Java-based tools collaborate to create a Java API that parallels
Modwares.

  


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Executive
  Summary</span>](#Executive_Summary)
- [<span class="tocnumber">2</span> <span class="toctext">Middleware for
  Chado databases</span>](#Middleware_for_Chado_databases)
  - [<span class="tocnumber">2.1</span>
    <span class="toctext">Participants</span>](#Participants)
  - [<span class="tocnumber">2.2</span>
    <span class="toctext">Introduction</span>](#Introduction)
    - [<span class="tocnumber">2.2.1</span>
      <span class="toctext">General Evaluation
      Criteria</span>](#General_Evaluation_Criteria)
      - [<span class="tocnumber">2.2.1.1</span>
        <span class="toctext">Problem 1</span>](#Problem_1)
      - [<span class="tocnumber">2.2.1.2</span>
        <span class="toctext">Problem 2</span>](#Problem_2)
      - [<span class="tocnumber">2.2.1.3</span>
        <span class="toctext">Problem 3</span>](#Problem_3)
      - [<span class="tocnumber">2.2.1.4</span>
        <span class="toctext">Problem 4</span>](#Problem_4)
      - [<span class="tocnumber">2.2.1.5</span>
        <span class="toctext">Problem 5</span>](#Problem_5)
      - [<span class="tocnumber">2.2.1.6</span>
        <span class="toctext">Problem Results</span>](#Problem_Results)
- [<span class="tocnumber">3</span> <span class="toctext">The Middleware
  Packages</span>](#The_Middleware_Packages)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Java
    Middleware</span>](#Java_Middleware)
    - [<span class="tocnumber">3.1.1</span>
      <span class="toctext">Hibernate</span>](#Hibernate)
      - [<span class="tocnumber">3.1.1.1</span>
        <span class="toctext">Abstraction</span>](#Abstraction)
      - [<span class="tocnumber">3.1.1.2</span>
        <span class="toctext">Performance</span>](#Performance)
      - [<span class="tocnumber">3.1.1.3</span>
        <span class="toctext">Configuration</span>](#Configuration)
      - [<span class="tocnumber">3.1.1.4</span>
        <span class="toctext">Documentation</span>](#Documentation)
    - [<span class="tocnumber">3.1.2</span>
      <span class="toctext">iBatis</span>](#iBatis)
      - [<span class="tocnumber">3.1.2.1</span>
        <span class="toctext">Abstraction</span>](#Abstraction_2)
      - [<span class="tocnumber">3.1.2.2</span>
        <span class="toctext">Performance</span>](#Performance_2)
      - [<span class="tocnumber">3.1.2.3</span>
        <span class="toctext">Configuration</span>](#Configuration_2)
      - [<span class="tocnumber">3.1.2.4</span>
        <span class="toctext">Documentation</span>](#Documentation_2)
    - [<span class="tocnumber">3.1.3</span>
      <span class="toctext">InterMine</span>](#InterMine)
      - [<span class="tocnumber">3.1.3.1</span>
        <span class="toctext">Abstraction</span>](#Abstraction_3)
      - [<span class="tocnumber">3.1.3.2</span>
        <span class="toctext">Performance</span>](#Performance_3)
      - [<span class="tocnumber">3.1.3.3</span>
        <span class="toctext">Configuration</span>](#Configuration_3)
      - [<span class="tocnumber">3.1.3.4</span>
        <span class="toctext">Documentation</span>](#Documentation_3)
  - [<span class="tocnumber">3.2</span> <span class="toctext">Perl
    Middleware</span>](#Perl_Middleware)
    - [<span class="tocnumber">3.2.1</span>
      <span class="toctext">Chado%253A%253AAutoDBI</span>](#Chado%253A%253AAutoDBI)
      - [<span class="tocnumber">3.2.1.1</span>
        <span class="toctext">Abstraction</span>](#Abstraction_4)
      - [<span class="tocnumber">3.2.1.2</span>
        <span class="toctext">Performance</span>](#Performance_4)
      - [<span class="tocnumber">3.2.1.3</span>
        <span class="toctext">Configuration</span>](#Configuration_4)
      - [<span class="tocnumber">3.2.1.4</span>
        <span class="toctext">Documentation</span>](#Documentation_4)
    - [<span class="tocnumber">3.2.2</span>
      <span class="toctext">Modware</span>](#Modware)
      - [<span class="tocnumber">3.2.2.1</span>
        <span class="toctext">Abstraction</span>](#Abstraction_5)
      - [<span class="tocnumber">3.2.2.2</span>
        <span class="toctext">Performance</span>](#Performance_5)
      - [<span class="tocnumber">3.2.2.3</span>
        <span class="toctext">Configuration</span>](#Configuration_5)
      - [<span class="tocnumber">3.2.2.4</span>
        <span class="toctext">Documentation</span>](#Documentation_5)
    - [<span class="tocnumber">3.2.3</span>
      <span class="toctext">GBrowse (DasI)</span>](#GBrowse_.28DasI.29)
      - [<span class="tocnumber">3.2.3.1</span>
        <span class="toctext">Abstraction</span>](#Abstraction_6)
      - [<span class="tocnumber">3.2.3.2</span>
        <span class="toctext">Performance</span>](#Performance_6)
      - [<span class="tocnumber">3.2.3.3</span>
        <span class="toctext">Configuration</span>](#Configuration_6)
      - [<span class="tocnumber">3.2.3.4</span>
        <span class="toctext">Documentation</span>](#Documentation_6)
    - [<span class="tocnumber">3.2.4</span> <span class="toctext">The
      Bio::Chado API</span>](#The_Bio::Chado_API)
  - [<span class="tocnumber">3.3</span> <span class="toctext">Getting
    More Information</span>](#Getting_More_Information)
- [<span class="tocnumber">4</span>
  <span class="toctext">Object-Relational Mapping
  Principles</span>](#Object-Relational_Mapping_Principles)
  - [<span class="tocnumber">4.1</span>
    <span class="toctext">Presentation by Sohel
    Merchant</span>](#Presentation_by_Sohel_Merchant)
    - [<span class="tocnumber">4.1.1</span>
      <span class="toctext">Outline</span>](#Outline)
    - [<span class="tocnumber">4.1.2</span> <span class="toctext">The
      Problem</span>](#The_Problem)
    - [<span class="tocnumber">4.1.3</span>
      <span class="toctext">Solutions</span>](#Solutions)
    - [<span class="tocnumber">4.1.4</span>
      <span class="toctext">ORM</span>](#ORM)
    - [<span class="tocnumber">4.1.5</span> <span class="toctext">Perl -
      Class::DBI</span>](#Perl_-_Class::DBI)
    - [<span class="tocnumber">4.1.6</span>
      <span class="toctext">Class::DBI</span>](#Class::DBI)
    - [<span class="tocnumber">4.1.7</span>
      <span class="toctext">Class::DBI -
      CRUD</span>](#Class::DBI_-_CRUD)
    - [<span class="tocnumber">4.1.8</span> <span class="toctext">Java -
      Hibernate</span>](#Java_-_Hibernate)
    - [<span class="tocnumber">4.1.9</span> <span class="toctext">Java -
      iBatis</span>](#Java_-_iBatis)
    - [<span class="tocnumber">4.1.10</span>
      <span class="toctext">Summary</span>](#Summary)
  - [<span class="tocnumber">4.2</span>
    <span class="toctext">XORT</span>](#XORT)
    - [<span class="tocnumber">4.2.1</span>
      <span class="toctext">Background</span>](#Background)
    - [<span class="tocnumber">4.2.2</span>
      <span class="toctext">Technical
      Overview</span>](#Technical_Overview)
    - [<span class="tocnumber">4.2.3</span>
      <span class="toctext">Special topics</span>](#Special_topics)
      - [<span class="tocnumber">4.2.3.1</span>
        <span class="toctext">Comparing Hibernate &
        XORT</span>](#Comparing_Hibernate_.26_XORT)
    - [<span class="tocnumber">4.2.4</span>
      <span class="toctext">Limitations</span>](#Limitations)
    - [<span class="tocnumber">4.2.5</span>
      <span class="toctext">Presentation by Pinglei Zhou and Josh
      Goodman</span>](#Presentation_by_Pinglei_Zhou_and_Josh_Goodman)
  - [<span class="tocnumber">4.3</span>
    <span class="toctext">Chado%253A%253AAutoDBI</span>](#Chado%253A%253AAutoDBI_2)
    - [<span class="tocnumber">4.3.1</span>
      <span class="toctext">Background</span>](#Background_2)
    - [<span class="tocnumber">4.3.2</span>
      <span class="toctext">Technical
      Overview</span>](#Technical_Overview_2)
    - [<span class="tocnumber">4.3.3</span>
      <span class="toctext">Special topics</span>](#Special_topics_2)
    - [<span class="tocnumber">4.3.4</span>
      <span class="toctext">Limitations</span>](#Limitations_2)
    - [<span class="tocnumber">4.3.5</span>
      <span class="toctext">Presentation by Brian
      O'Connor</span>](#Presentation_by_Brian_O.27Connor)
  - [<span class="tocnumber">4.4</span>
    <span class="toctext">Modware</span>](#Modware_2)
    - [<span class="tocnumber">4.4.1</span>
      <span class="toctext">Background</span>](#Background_3)
    - [<span class="tocnumber">4.4.2</span>
      <span class="toctext">Technical
      Overview</span>](#Technical_Overview_3)
    - [<span class="tocnumber">4.4.3</span>
      <span class="toctext">Special topics</span>](#Special_topics_3)
    - [<span class="tocnumber">4.4.4</span>
      <span class="toctext">Limitations</span>](#Limitations_3)
    - [<span class="tocnumber">4.4.5</span>
      <span class="toctext">Presentation by Eric
      Just</span>](#Presentation_by_Eric_Just)
  - [<span class="tocnumber">4.5</span> <span class="toctext">GBrowse
    (DasI) Adaptor</span>](#GBrowse_.28DasI.29_Adaptor)
    - [<span class="tocnumber">4.5.1</span>
      <span class="toctext">Background</span>](#Background_4)
    - [<span class="tocnumber">4.5.2</span>
      <span class="toctext">Technical
      Overview</span>](#Technical_Overview_4)
    - [<span class="tocnumber">4.5.3</span>
      <span class="toctext">Special topics</span>](#Special_topics_4)
    - [<span class="tocnumber">4.5.4</span>
      <span class="toctext">Limitations</span>](#Limitations_4)
    - [<span class="tocnumber">4.5.5</span>
      <span class="toctext">Presentation by Scott
      Cain</span>](#Presentation_by_Scott_Cain)
  - [<span class="tocnumber">4.6</span> <span class="toctext">iBatis and
    Abator</span>](#iBatis_and_Abator)
    - [<span class="tocnumber">4.6.1</span>
      <span class="toctext">Background</span>](#Background_5)
    - [<span class="tocnumber">4.6.2</span>
      <span class="toctext">Technical
      Overview</span>](#Technical_Overview_5)
    - [<span class="tocnumber">4.6.3</span>
      <span class="toctext">Special topics</span>](#Special_topics_5)
    - [<span class="tocnumber">4.6.4</span>
      <span class="toctext">Limitations</span>](#Limitations_5)
    - [<span class="tocnumber">4.6.5</span>
      <span class="toctext">Presentation by Jeff
      Bowes</span>](#Presentation_by_Jeff_Bowes)
  - [<span class="tocnumber">4.7</span>
    <span class="toctext">Hibernate</span>](#Hibernate_2)
    - [<span class="tocnumber">4.7.1</span>
      <span class="toctext">Background</span>](#Background_6)
    - [<span class="tocnumber">4.7.2</span>
      <span class="toctext">Technical
      Overview</span>](#Technical_Overview_6)
    - [<span class="tocnumber">4.7.3</span>
      <span class="toctext">Limitations</span>](#Limitations_6)
    - [<span class="tocnumber">4.7.4</span>
      <span class="toctext">Presentation by Robert
      Bruggner</span>](#Presentation_by_Robert_Bruggner)
  - [<span class="tocnumber">4.8</span> <span class="toctext">PSU Chado
    Interface</span>](#PSU_Chado_Interface)
    - [<span class="tocnumber">4.8.1</span>
      <span class="toctext">Background</span>](#Background_7)
    - [<span class="tocnumber">4.8.2</span>
      <span class="toctext">Overview</span>](#Overview)
    - [<span class="tocnumber">4.8.3</span>
      <span class="toctext">iBatis</span>](#iBatis_2)
      - [<span class="tocnumber">4.8.3.1</span>
        <span class="toctext">Technical
        Overview</span>](#Technical_Overview_7)
      - [<span class="tocnumber">4.8.3.2</span>
        <span class="toctext">Advantages</span>](#Advantages)
      - [<span class="tocnumber">4.8.3.3</span>
        <span class="toctext">Limitations</span>](#Limitations_7)
    - [<span class="tocnumber">4.8.4</span>
      <span class="toctext">Hibernate</span>](#Hibernate_3)
      - [<span class="tocnumber">4.8.4.1</span>
        <span class="toctext">Technical
        Overview</span>](#Technical_Overview_8)
      - [<span class="tocnumber">4.8.4.2</span>
        <span class="toctext">Advantages</span>](#Advantages_2)
      - [<span class="tocnumber">4.8.4.3</span>
        <span class="toctext">Limitations</span>](#Limitations_8)
    - [<span class="tocnumber">4.8.5</span>
      <span class="toctext">Presentation by Chinmay
      Patel</span>](#Presentation_by_Chinmay_Patel)
  - [<span class="tocnumber">4.9</span> <span class="toctext">GUS Web
    Development Kit (WDK)</span>](#GUS_Web_Development_Kit_.28WDK.29)
    - [<span class="tocnumber">4.9.1</span>
      <span class="toctext">Background</span>](#Background_8)
    - [<span class="tocnumber">4.9.2</span>
      <span class="toctext">Technical
      Overview</span>](#Technical_Overview_9)
    - [<span class="tocnumber">4.9.3</span>
      <span class="toctext">Advantages</span>](#Advantages_3)
    - [<span class="tocnumber">4.9.4</span>
      <span class="toctext">Limitations</span>](#Limitations_9)
    - [<span class="tocnumber">4.9.5</span>
      <span class="toctext">Presentation by Steve
      Fischer</span>](#Presentation_by_Steve_Fischer)
  - [<span class="tocnumber">4.10</span>
    <span class="toctext">InterMine</span>](#InterMine_2)
    - [<span class="tocnumber">4.10.1</span>
      <span class="toctext">Background</span>](#Background_9)
    - [<span class="tocnumber">4.10.2</span>
      <span class="toctext">Technical
      Overview</span>](#Technical_Overview_10)
    - [<span class="tocnumber">4.10.3</span>
      <span class="toctext">Limitations</span>](#Limitations_10)
    - [<span class="tocnumber">4.10.4</span>
      <span class="toctext">Presentation by Gos
      Micklem</span>](#Presentation_by_Gos_Micklem)
- [<span class="tocnumber">5</span> <span class="toctext">Wiki
  Authors</span>](#Wiki_Authors)



## <span id="Middleware_for_Chado_databases" class="mw-headline">Middleware for Chado databases</span>

### <span id="Participants" class="mw-headline">Participants</span>

On January 19 2007, representatives of the major model organism
databases (MODs) and other interested parties met to discuss and compare
Middleware packages used by developers working for the MODs. The
workshop attendees were tasked to make specific recommendations. Such
recommendations will focus the efforts of the MODs on specific packages
and lead to code re-use and more feature-rich middleware.

After an introductory presentation attendees listened to a series of
presentations on the different Middleware packages. Each presenter
described the features of the package, both positive and negative, and
showed how the package would be used to address a specific set of test
problems. The attendees reassembled in a general discussion group to
discuss the presentations and to develop a consensus statement. This
document represents the consensus of the workshop and shows the
individual presentations.

  

### <span id="Introduction" class="mw-headline">Introduction</span>

A group of some 50 GMOD developers gathered at the annual meeting to
discuss middleware. This one day meeting had the following general
goals:

- To educate GMOD programmers on methods and practices for Middleware
- To facilitate discussion on the best methods
- To guide GMOD to a uniform Middleware layer
- To generate this central reference document for Middleware projects,
  including:
  - Platform information
  - Strengths & weaknesses of different Middleware packages
  - Specific examples of how one would use a given middleware package

One of the key characteristics of the GMOD software project is the
variety of approaches and components that it supports. This applies to
applications, database schemas, as well as to middleware, a software
*layer* that mediates the exchange of data between the applications and
the databases. Despite this diversity certain applications and schemas
have emerged as key supported components in GMOD, such as the GBrowse
application and the Chado schema, to name just two. However, a consensus
view has not emerged with respect to middleware, and there are certainly
a number of different middleware packages that have been used in the
GMOD world, coming from within this world and from the larger world of
open source.

In late 2006 the GMOD developers took note of the large number of
middleware packages in use and elected to embark on a short-term study
to evaluate and compare these packages. The primary motivation here was
to select or recommend certain packages over others specifically within
the GMOD context. The assumption is that making such recommendations
will serve to focus the developers' effort on a smaller number of
packages. Clearly it is also assumed that such a focus will inevitably
lead to greater support for and use of those recommended packages, and
that all within GMOD will benefit.

Another purpose of this study is to educate GMOD programmers on best
practices concerning the use and development of middleware. It is
expected that common agreement on these practices will lead to the
development of more effective software as well as the best use of the
software in practice. Finally, this study should generate a central
reference document on these different middleware packages used in GMOD.
This reference will contain platform- and language-specific information
as well as descriptions of the strengths and weaknesses of the packages
that can be used by GMOD developers when considering middleware.

  

#### <span id="General_Evaluation_Criteria" class="mw-headline">General Evaluation Criteria</span>

The GMOD developers proposed that each presenter provide some basic
information about each middleware package, both general and technical.
In addition each middleware application was asked to address a set of
sample problems, shown below. These example problems are thought to
typify some of the common functions that a scientist may need when
working with their own database. It was understood that not all software
would be able to handle all aspects of the sample problems and this
demonstration was not intended to be *live*.

  

##### <span id="Problem_1" class="mw-headline">Problem 1</span>

Enter the information about the following three novel genes, including
the associated mRNA structures, into your database. Print the assigned
`feature_id` for each inserted gene.

Note:

- The coordinates are given in exact coordinates.
- Use the `organism_id` for your organism
- Store description in the chado table `featureprop`
- A sequence in fasta format (see [Fake
  Chromosome](FakeChromosome "FakeChromosome")) should be loaded as
  genomic sequence, either chromosome or contig -- this will be used as
  a `srcfeature` in `featureloc`

Gene descriptions:

    symbol: xfile
    synonyms: mulder, scully
    description: A test gene for GMOD meeting
    mRNA Feature
         exon_1:
           start: 13691
           end: 13767
           strand: 1
           srcFeature_id: Id of genomic sample
         exon_2:
           start: 14687
           end: 14720
           strand: 1
           srcFeature_id: Id of genomic sample

    symbol: x-men
    synonyms: wolverine
      mRNA Feature
         exon_1:
           start: 12648
           end: 13136
           strand: 1
           srcFeature_id: Id of genomic sample

    symbol: x-ray
    synonyms: none
         exon:
           start: 1703
           end: 1900
           strand: 1
           srcFeature_id: Id of genomic sample

##### <span id="Problem_2" class="mw-headline">Problem 2</span>

Retrieve and print the following report for gene **xfile** (the coding
sequence and exon coordinates are derived from the associated mRNA
feature). The results should resemble the following:

    symbol: xfile
    synonyms: mulder, scully
    description: A test gene for GMOD meeting
    type: gene
    exon1 start: 13691
    exon1 end: 13767
    exon2 start: 14687
    exon2 end: 14720
    >xfile cds
    ATGGCGTTAGTATTCATGGTTACTGGTTTCGCTACTGATATCACCCAGCGTGTAGGCTGT
    GGAATCGAACACTGGTATTGTATAAATGTTTGTGAATACACTGAGAAATAA

##### <span id="Problem_3" class="mw-headline">Problem 3</span>

Update the gene **xfile**: change the name symbol to **x-file** and
retrieve the changed record. Regenerate the report from Problem 1. The
results should resemble the following:

    symbol: x-file
    synonyms: mulder, scully
    description: A test gene for GMOD meeting
    type: gene
    exon1 start: 13691
    exon1 end: 13767
    exon2 start: 14687
    exon2 end: 14720
    >x-file cds
    ATGGCGTTAGTATTCATGGTTACTGGTTTCGCTACTGATATCACCCAGCGTGTAGGCTGT
    GGAATCGAACACTGGTATTGTATAAATGTTTGTGAATACACTGAGAAATAA

##### <span id="Problem_4" class="mw-headline">Problem 4</span>

Search for all genes with symbols starting with *x-*. With the results
produce the following simple result list (organism will vary):

    1323    x-file     Xenopus laevis
    1324    x-men   Xenopus laevis
    1325    x-ray     Xenopus laevis

##### <span id="Problem_5" class="mw-headline">Problem 5</span>

Delete the gene **x-ray** using the `geneId`. Run the search and report
in Problem 4 again to show the delete has taken place, with a result
resembling the following:

    1323    x-file     Xenopus laevis
    1324    x-men   Xenopus laevis

  

##### <span id="Problem_Results" class="mw-headline">Problem Results</span>

All presenters paid attention to the assigned problems and all packages
could perform the required operations if appropriate: the
[GBrowse](GBrowse.1 "GBrowse") (DasI) Adaptor and
[InterMine](InterMine "InterMine"), being read-only packages, did not
carry out the edit/ delete tasks. Clearly one can see many differences
between packages in how the the problems were solved, please see the
presentations themselves for these details.

  

## <span id="The_Middleware_Packages" class="mw-headline">The Middleware Packages</span>

The one day meeting heard presentations from developers using both
[Perl](Category%253APerl "Category%253APerl") and
[Java](Category%253AJava "Category%253AJava") middleware and a number of
satisfactory solutions were described. The focus in almost all cases was
some sort of system that connected to the
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> relational
database. Although other databases are encountered in the GMOD world
(e.g. <a href="http://biosql.org" class="external text"
rel="nofollow">BioSQL</a>) the Chado schema is popular and serves as a
good test schema for this exercise given its complexity. The primary
focus in the talks was on functionality from the perspective of writing
code and extending the software and less attention was given to
performance. Each presenter focussed on their middleware and few
side-by-side comparisons were made (for one comparison please see
[Comparison of XORT and Hibernate for Chado
Reporting](Comparison_of_XORT_and_Hibernate_for_Chado_reporting "Comparison of XORT and Hibernate for Chado reporting")
by Josh Goodman, written before this meeting).

The [Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI") middleware package
is built on Perl's
<a href="http://search.cpan.org/perldoc?Class:DBI" class="external text"
rel="nofollow">Class:DBI</a>, a module that acts as an
[ORM](Glossary#ORM "Glossary") tool. The
[Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI") interface is
autogenerated directly from the Chado schema using a template adapted
from the <a href="http://turnkey.sf.net" class="external text"
rel="nofollow">Turnkey</a> project. This greatly reduces the amount of
time developers need to spend maintaining the API since the code can
just be regenerated when the schema changes.
[Modware](Modware "Modware") is built on top of
[Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI"). Both Chado%253A%253AAutoDBI
and Modware are built specifically for the Chado schema and aren't
general tools. However, the Turnkey project can be used to produce an
AutoDBI equivalent for other database schemas.

A key difference is that Modware uses [BioPerl](BioPerl "BioPerl") as
its programmatic interface whereas the Chado%253A%253AAutoDBI API resembles that
of Class::DBI. Furthermore Chado%253A%253AAutoDBI wraps the entire Chado schema
where Modware objects only address a subset of the Chado schema that
maps to Bioperl objects. Neither of these packages require
configuration, they are pre-configured for Chado and all one needs to do
is provide connection information (server, username, password, etc).
This schema, in theory, could be running on any popular
[RDBMS](Glossary#Database_Management_System "Glossary")
([PostgreSQL](PostgreSQL "PostgreSQL"), [MySQL](MySQL "MySQL"), Oracle,
etc.), this flexibility is built into
<a href="http://search.cpan.org/perldoc?Class:DBI" class="external text"
rel="nofollow">Class:DBI</a>.

The Java packages, Hibernate and iBatis, are far more general than the
two packages discussed above and one could use them with any relational
schema. One distinguishing feature is the languages that these packages
use: Hibernate tends to present more Java to the programmer whereas
iBatis presents both Java and XML. Both allow you to address the schema
with SQL should you choose to do so. Hibernate also introduces its own
language, HQL, a Java-SQL hybrid. Both would need some configuration to
connect to the Chado schema but this should not be considered a
significant barrier. Both packages can be used with any popular RDBMS
(Postgres, Mysql, Oracle, etc.).

[XORT](XORT.1 "XORT") is not a typical [ORM](Glossary#ORM "Glossary")
tool like these other packages but has been included here because of its
utility in bulk operations. This capability is one that the ORM tools
are thought not to do very well as the serial construction and
destruction of objects is typically not fast, and constructing very
large numbers of objects simultaneously consumes quite a bit of memory.
This is not to say that one shouldn't use an ORM tool for bulk
operations but that one should test the tool in question and not assume
its performance is adequate to the given task. Such a test may show an
entirely different approach, like that of XORT, is more appropriate.

InterMine is another Java-based generic ORM tool that differs from the
others by being tuned for read-only performance. It has been designed to
support large complex queries and bulk data production efficiently.
Performance of live databases can be tuned through the generation of
pre-computed tables: a query optimiser intercepts all queries and
re-writes them to make use of the available pre-computed tables. Like
the other ORM packages, maintenance is minimised through extensive
automatic code generation - when the database object model changes
recompilation updates Java classes, the relational schema, the web
application and mappings between them. Currently InterMine systems
require Postgres but could be extended to other platforms that support
the 'Explain' used by the query optimiser. Apart from Java and pilot
Perl APIs, a variant of OQL, IQL, is provided.

  

#### <span id="Java_Middleware" class="mw-headline">Java Middleware</span>

The Java packages all used Java plus XML, to some degree. In addition
iBatis exposes SQL to the developer and it was argued that this could be
viewed either as an advantage (allows tuning of underlying SQL) or a
disadvantage. Both Hibernate and iBatis are designed to operate with any
relational schema, not just Chado.

Both Abator and iBatis share one limitation which is that one can not
auto-generate higher level objects, such as Genes. In fairness one must
add that this would not really be possible to do accurately for any
system. There is not sufficient information present in the database
schema to derive all of the relationships necessary. In both packages
the auto-generation code only mimics the schema and it would have take
additional work to get a package to automatically create and relate
subsets of data based on "join tables" like feature_relationship
property. This mostly has to do with the circular nature of the schema.

  

##### <span id="Hibernate" class="mw-headline">Hibernate</span>

From the <a href="http://www.hibernate.org" class="external text"
rel="nofollow">Hibernate Web site</a>:

*Hibernate lets you develop persistent classes following object-oriented
idiom - including association, inheritance, polymorphism, composition,
and collections. Hibernate allows you to express queries in its own
portable SQL extension (HQL), as well as in native SQL, or with an
object-oriented Criteria and Example API. Unlike many other persistence
solutions, Hibernate does not hide the power of SQL from you and
guarantees that your investment in relational technology and knowledge
is as valid as always.*

Hibernate is thought to work best when used in conjunction with a schema
that's been designed with objects in mind, an *object-oriented schema*.

###### <span id="Abstraction" class="mw-headline">Abstraction</span>

Hibernate is the more abstracted of the 2 Java packages, it allows you
to work with the relational database with the least exposure to SQL if
you choose to do this. It is probably considered the more flexible of
the 2 with respect to language since one can program in Java or HBL
(Hibernate Query Language), a hybrid between SQL and Java.

###### <span id="Performance" class="mw-headline">Performance</span>

No pairwise comparisons between Hibernate and iBatis were made.

###### <span id="Configuration" class="mw-headline">Configuration</span>

Hibernate has the ability to read a database schema and generate Java
Code representing the database objects or tables. In this exercise the
developer chose not to use this method because one must create a file
telling the code auto-generation what to use for indexes, which fields
should be complex objects, and so on. It was judged to be less work to
just go ahead and make the code by hand.

For each object mapped to the database, one can create an XML file that
tells Hibernate which database fields to map to specific object
properties. Additionally, one can implement equals() and hashcode()
functions for each object based on the table unique constraints. After
doing that, Hibernate takes care of all the
Create-Retrieve-Update-Delete (CRUD) and transaction functionality.

###### <span id="Documentation" class="mw-headline">Documentation</span>

Hibernate is a popular and well-supported tool with extensive
documentation.

  

##### <span id="iBatis" class="mw-headline">iBatis</span>

From the <a href="http://ibatis.apache.org" class="external text"
rel="nofollow">iBatis Web site</a>:

*The Data Mapper framework (a.k.a. SQL Maps) will help to significantly
reduce the amount of Java and .NET code that is normally neededto access
a relational database. This framework maps classes to SQL statements
using a very simple XML descriptor. Simplicity is the biggest advantage
of iBATIS over other frameworks and object relational mapping tools. To
use iBATIS you need only be familiar with your own application domain
objects (basic JavaBeans or .NET classes), XML, and SQL. There is very
little else to learn. There is no complex scheme required to join tables
or execute complex queries. Using iBATIS you have the full power of real
SQL at your fingertips. The iBATIS Data Mapper framework can map nearly
any database to any object model and is very tolerant of legacy designs,
or even bad designs. This is all achieved without special database
tables, peer objects or code generation.*

###### <span id="Abstraction_2" class="mw-headline">Abstraction</span>

iBatis does not attempt to achieve abstraction in the way that other
Java [ORM](Glossary#ORM "Glossary") tools do and assumes that viewing
SQL is an advantage, not a disadvantage.

###### <span id="Performance_2" class="mw-headline">Performance</span>

No pairwise comparisons made between iBatis and Hibernate.

###### <span id="Configuration_2" class="mw-headline">Configuration</span>

The following general steps are performed:

1.  Create an XML file of tables the developer wants to create objects
    for
    - Including specifying the method for retrieving auto-generated
      sequence values from inserts
    - This file could also be easily auto-generated
2.  Make some type adjustments for some variables
    - For example, iBatis mapped some things to Java strings that should
      have been Integers

###### <span id="Documentation_2" class="mw-headline">Documentation</span>

iBatis is a popular and well-supported tool with extensive
documentation.

  

##### <span id="InterMine" class="mw-headline">InterMine</span>

From the <a href="http://www.intermine.org" class="external text"
rel="nofollow">InterMine Web site</a>:

*[InterMine](InterMine "InterMine") is an general-purpose
object-oriented data warehouse* system developed as part of the
<a href="http://www.flymine.org" class="external text"
rel="nofollow">FlyMine</a>: project and made available as stand-alone
open-source software. It is able to create a query-optimised data
warehouse with a powerful web interface for any data model.

InterMine.bio is an extension to InterMine that defines a biological
data model (based on the
<a href="http://song.sourceforge.net/" class="external text"
rel="nofollow">Sequence Ontology</a>) and is able to integrate data from
many standard formats and databases used in biology. Instances of
InterMine.bio are created by specifying the sources to load and
configuring the particular organisms and data files required. A
framework is provided for adding new sources to load custom data, and
each new source can easily extend the data model.

###### <span id="Abstraction_3" class="mw-headline">Abstraction</span>

An InterMine data model is defined at the object level and a database
schema is automatically generated. The database schema is entirely
hidden, queries are performed on the object model by a Java API, an
OQL-like query language (IQL), or a pilot Perl API.

###### <span id="Performance_3" class="mw-headline">Performance</span>

Following build, InterMine-based systems are read-only. In contrast to
transactional systems this makes it easier to focus on query
performance. In particular, InterMine makes it straightforward to manage
controlled denormalisation of data to enhance query performance: a
generic query optimiser intercepts queries and transparently re-writes
them to make use of precomputed tables. New precomputed tables can be
added at any time, allowing performance tuning of the live database.
Performance is also enhanced through the use of a large object cache in
the web application.

###### <span id="Configuration_3" class="mw-headline">Configuration</span>

An InterMine object model is defined as an XML file, Java business
objects and a relational schema are automatically generated from it. The
mapping between objects and the database is thus handled automatically
with no additional configuration. Generation of appropriate indexes is
also automatic. InterMine cannot access an existing database schema but
could import data from one by defining an object model and importing the
data.

###### <span id="Documentation_3" class="mw-headline">Documentation</span>

Documentation on [InterMine](InterMine "InterMine")'s functionality and
instructions for setting up a new instance are provided at
<a href="http://trac.flymine.org" class="external free"
rel="nofollow">http://trac.flymine.org</a>

  

#### <span id="Perl_Middleware" class="mw-headline">Perl Middleware</span>

The [Perl](Category%253APerl "Category%253APerl")\] approaches used only the
Perl language (the Java packages all used Java plus XML, to some
degree). The [XORT](XORT.1 "XORT") application is not, strictly
speaking, *middleware* but has proven to be very useful in bulk
operations using the Chado schema and Chado XML though in principle it
can be used with any relational schema.

  

##### <span id="Chado%253A%253AAutoDBI" class="mw-headline">Chado%253A%253AAutoDBI</span>

The [Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI") tool is based on
<a href="http://search.cpan.org/perldoc?Class::DBI"
class="external text" rel="nofollow">Class::DBI</a> and maps objects
directly to tables in the Chado schema. It provides a very easy perl
interface for low-level access to the database. It is currently used by
the [GMODWeb](GMODWeb "GMODWeb") project, as a bulk loader for the Chado
database, and as the underlying [ORM](Glossary#ORM "Glossary") tool in
[Modware](Modware "Modware"). Chado%253A%253AAutoDBI is automatically generated
from the Chado database schema which makes it very easy to update when
changes are made. This code autogeneration process was adapted from the
[Turnkey](Turnkey "Turnkey") project which is a generic ORM/website code
generation tool.

###### <span id="Abstraction_4" class="mw-headline">Abstraction</span>

Chado%253A%253AAutoDBI objects map directly to the Chado tables so it could be
said that Chado%253A%253AAutoDBI is as abstract as Chado itself. Therefore one
needs to become somewhat familiar with Chado itself in order to use
Chado%253A%253AAutoDBI.

###### <span id="Performance_4" class="mw-headline">Performance</span>

No pairwise comparisons of performance were done using Perl middleware.
All packages were deemed to give adequate performance when used to
connect UIs to underlying databases. On the other hand the presenters
were reluctant to recommend their packages for *bulk* operations.

###### <span id="Configuration_4" class="mw-headline">Configuration</span>

Chado%253A%253AAutoDBI requires no configuration, it is designed to interact
with the Chado schema out-of-the-box. If the schema changes then
Chado%253A%253AAutoDBI can be quickly autogenerated again to adjust to the
change.

###### <span id="Documentation_4" class="mw-headline">Documentation</span>

For more information see the <a
href="http://gmod.cvs.sourceforge.net/*checkout*/gmod/schema/chado/README.AutoDBI"
class="external text" rel="nofollow">schema/chado/README.AutoDBI</a>,
the [Wiki page](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI"), and the
[Chado%253A%253AAutoDBI
Presentation](Chado%253A%253AAutoDBI_Presentation "Chado%253A%253AAutoDBI Presentation").

##### <span id="Modware" class="mw-headline">Modware</span>

###### <span id="Abstraction_5" class="mw-headline">Abstraction</span>

[Modware](Modware "Modware") has higher level of abstraction than that
provided by [Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI"). The
critical point is that it can create [BioPerl](BioPerl "BioPerl") object
representations of features directly from
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>, this could
either be highly suitable or not at all appropriate for a given
environment.

###### <span id="Performance_5" class="mw-headline">Performance</span>

No pairwise comparisons of performance were done using Perl middleware.
All packages were deemed to give adequate performance when used to
connect UIs to underlying databases.

###### <span id="Configuration_5" class="mw-headline">Configuration</span>

Modware requires minimal configuration, it is designed to interact with
the Chado schema out-of-the-box. If the schema changes then the
underlying [Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI") should be
able to adjust to the change. Some convenience views are created when
installing Modware (i.e. V_MRNA_FEATURES).

###### <span id="Documentation_5" class="mw-headline">Documentation</span>

BioPerl-style documentation at
<a href="http://gmod-ware.sourceforge.net/doc/" class="external free"
rel="nofollow">http://gmod-ware.sourceforge.net/doc/</a>, written for
POD for all methods.

  

##### <span id="GBrowse_.28DasI.29" class="mw-headline">[GBrowse](GBrowse.1 "GBrowse") (DasI)</span>

###### <span id="Abstraction_6" class="mw-headline">Abstraction</span>

Since it implements the
<a href="http://search.cpan.org/perldoc?Bio::DasI" class="external text"
rel="nofollow">Bio::DasI</a> interface, the abstraction is similar to
what one would see with [BioPerl](BioPerl "BioPerl")/BioDas features.

###### <span id="Performance_6" class="mw-headline">Performance</span>

<a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a> performs
relatively well since it is designed to be a
<a href="GBrowse_adaptors" class="mw-redirect"
title="GBrowse adaptors">database adaptor</a> to drive a Generic Genome
Browser ([GBrowse](GBrowse.1 "GBrowse")) instance. Though it does not
perform as well as the
<a href="http://bioperl.org/wiki/Module:Bio::DB::GFF"
class="external text" rel="nofollow">Bio::DB::GFF</a> and
<a href="http://bioperl.org/wiki/Module:Bio::DB::SeqFeature"
class="external text" rel="nofollow">Bio::DB::SeqFeature</a> adaptors,
those are for databases designed specifically for quick retrieval of
data for GBrowse, whereas
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> is designed
as a complete data warehouse. The main way to get better performance for
the Chado GBrowse adaptor is to implement materialized views of the GFF
or SeqFeature schema inside Chado.

###### <span id="Configuration_6" class="mw-headline">Configuration</span>

This package needs no configuration, it is pre-configured for Chado.

###### <span id="Documentation_6" class="mw-headline">Documentation</span>

The DasI interface is well-documented, about a dozen methods and three
classes, all documented.

  

##### <span id="The_Bio::Chado_API" class="mw-headline">The Bio::Chado API</span>

The [ParameciumDB](ParameciumDB "ParameciumDB") group has created an API
for Chado based on the
<a href="http://www.ensembl.org/info/software/Pdoc/index.html"
class="external text" rel="nofollow">Bio::EnsEMBL API</a>. No one was
able to give a presentation on this API, more information can be found
here:

- <a href="http://paramecium.cgm.cnrs-gif.fr/chadoapi/"
  class="external free"
  rel="nofollow">http://paramecium.cgm.cnrs-gif.fr/chadoapi/</a>

### <span id="Getting_More_Information" class="mw-headline">Getting More Information</span>

The issues around using and developing middleware are of general
interest in GMOD. If you have questions about middleware we suggest that
you contact the GMOD Development list rather than contacting individual
developers. You can sign up for the list here:

<a href="https://lists.sourceforge.net/lists/listinfo/gmod-devel"
class="external free"
rel="nofollow">https://lists.sourceforge.net/lists/listinfo/gmod-devel</a>

## <span id="Object-Relational_Mapping_Principles" class="mw-headline">Object-Relational Mapping Principles</span>

#### <span id="Presentation_by_Sohel_Merchant" class="mw-headline">Presentation by Sohel Merchant</span>

Sohel Merchant, Bioinformatics Software Engineer at dictyBase, Center
for Genetic Medicine, Northwestern University, Chicago. This Wiki
section is an edited version of
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/24/Object_Relational_Mapping_Layer.pdf"
class="internal" title="Object Relational Mapping Layer.pdf">Sohel's
presentation</a>.

Also see
<a href="http://en.wikipedia.org/wiki/Object-relational_mapping"
class="external text" rel="nofollow">ORM (Wikipedia)</a>.

  

##### <span id="Outline" class="mw-headline">Outline</span>

- The Problem
- Solutions
- ORM
- Perl – Class::DBI
- Summary

##### <span id="The_Problem" class="mw-headline">The Problem</span>

- Developers need to perform Create, Retrieve, Update, Delete (aka CRUD)
  operations on data inside an application.
- The real world objects represented using a programming language needs
  to be stored in databases
- Using relational databases to store object-oriented data leads to a
  semantic gap
- RDBMS have fixed types, but OO can have more complicated user defined
  types.

##### <span id="Solutions" class="mw-headline">Solutions</span>

- Data Access Object (DAO)
- Developer writes a class which contains one attribute for each field
  in the table
- Methods for CRUD typically contains JDBC/DBI code with the necessary
  SQL statements.
- Object Relational Mapping ([ORM](Glossary#ORM "Glossary")), WikiPedia:
  - “ORM is a programming technique that links databases to
    object-oriented language concepts, creating (in effect) a virtual
    object database.“
- Developer needs to configure the ORM
- Less amount of manual coding
- CRUD methods are automatically generated by the ORM layer

##### <span id="ORM" class="mw-headline">ORM</span>

[ORM](Glossary#ORM "Glossary") solutions

- Perl
  - Class::DBI
- Java
  - EJB
  - Hibernate
  - JDO
  - iBatis

##### <span id="Perl_-_Class::DBI" class="mw-headline">Perl - Class::DBI</span>

- Provides a simple interfaces for wrapping Perl classes around a
  database tables
- Tables are mapped directly to objects
- The table column name are mapped to the get/set methods
- Can be used with transactions

##### <span id="Class::DBI" class="mw-headline">Class::DBI</span>

Defining a class in <a href="http://search.cpan.org/perldoc?Class::DBI"
class="external text" rel="nofollow">Class::DBI</a> to represent a
table:

      CVTERM
      cvterm_id
      cv_id
      name
      definition
      dbxref_id

Corresponding code:


``` de1
package Chado::Cvterm;
use base 'Chado::DBI';
Chado::Cvterm->set_up_table('Cvterm');
```


##### <span id="Class::DBI_-_CRUD" class="mw-headline">Class::DBI - CRUD</span>


``` de1
## Create
$term_dbobj = Chado::Cvterm->create({
                               name      => ”DUMMY TERM”,
                               cv_id     => 1,
                               dbxref_id => 125
                        });
## Retrieve
$term_dbobj = Chado::Cvterm->retrieve(2);
 
## Update
$term_dbobj->name( $term->name() );
$term_dbobj->definition( $term->definition );
 
## Delete
$term_dbobj->delete();
```


##### <span id="Java_-_Hibernate" class="mw-headline">Java - Hibernate</span>

- Hibernate maps Java Objects directly to database tables
- Scalable
- Works well for controlled Data model

##### <span id="Java_-_iBatis" class="mw-headline">Java - iBatis</span>

- iBATIS maps Java Objects to the results of SQL Queries
- XML definitions for queries
- Queries and managing Maps
- Transactions
- Good fit for existing database schema

##### <span id="Summary" class="mw-headline">Summary</span>

- [ORM](Glossary#ORM "Glossary") provides painless roundtrip of data
  between the application and database.
- Reduces the amount of SQL code and allows a programmatic style
  interface to the RDBMS
- Choice of ORM solution depends on the type of project
- Flybase examined iBatis and Hibernate, both use XML configuration
  files
  - Hibernate is better if you're building schema from scratch
  - Both auto-configure given a schema.
  - Both have strengths and weaknesses.
- Is Hibernate better when you're in the process of designing a schema?
  - Hibernate can assist you in making a *Hibernate-compatible* schema.

### <span id="XORT" class="mw-headline">[XORT](XORT.1 "XORT")</span>

#### <span id="Background" class="mw-headline">Background</span>

- Source:
  <a href="http://sourceforge.net/project/showfiles.php?group_id=27707"
  class="external free"
  rel="nofollow">http://sourceforge.net/project/showfiles.php?group_id=27707</a>
- Language: Perl
- Authors: Pinglei Zhou
- Users: Flybase
- Support: Pinglei Zhou
- Third party code: Uses
  <a href="http://search.cpan.org/perldoc?XML::Parser::PerlSAX"
  class="external text" rel="nofollow">XML::Parser::PerlSAX</a>,
  <a href="http://search.cpan.org/perldoc?Unicode::String"
  class="external text" rel="nofollow">Unicode::String</a>,
  <a href="http://search.cpan.org/perldoc?XML::DOM" class="external text"
  rel="nofollow">XML::DOM</a>, and
  <a href="http://search.cpan.org/perldoc?DBI" class="external text"
  rel="nofollow">DBI</a> from Perl (CPAN)

#### <span id="Technical_Overview" class="mw-headline">Technical Overview</span>

- Database connectivity:
- Transaction support:
- Code generation:

#### <span id="Special_topics" class="mw-headline">Special topics</span>

##### <span id="Comparing_Hibernate_.26_XORT" class="mw-headline">Comparing Hibernate & XORT</span>

Flybase tried Hibernate, but just creating simple print() statements in
the course of doing bulk operations they encountered performance issues.
Therer are many caching parameters available in Hibernate but the
problem is that Chado is recursive or cyclical. XORT does some simple,
and automatic, caching. With XORT you can handle recursive or cyclical
operations more easily. In common operations such as merging genes Chado
users will encounter this issue routinely.

Also see [Comparison of XORT and Hibernate for Chado
Reporting](Comparison_of_XORT_and_Hibernate_for_Chado_reporting "Comparison of XORT and Hibernate for Chado reporting").

#### <span id="Limitations" class="mw-headline">Limitations</span>

- Database schemas need to follow certain rules
  - All must have internal int primary key
  - All must have unique key(s)
- It may take a long path to retrieve certain type of data
  - Example: gene-\>allele-\>genotype-\>phenotype via
    feature_relationship
- Structure not stored in memory, you flush out data as it goes

#### <span id="Presentation_by_Pinglei_Zhou_and_Josh_Goodman" class="mw-headline">Presentation by Pinglei Zhou and Josh Goodman</span>

[XORT Presentation](XORT_Presentation "XORT Presentation")

  

### <span id="Chado%253A%253AAutoDBI_2" class="mw-headline">[Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI")</span>

#### <span id="Background_2" class="mw-headline">Background</span>

- Source:
  <a href="http://sourceforge.net/projects/gmod/" class="external free"
  rel="nofollow">http://sourceforge.net/projects/gmod/</a>
- Language: Perl
- Authors: Allen Day, Scott Cain, Brian O'Connor, & others
- Users:
- Support:
- Third party code: Based on Class::DBI by Michael Schwern & Tony Bowden

#### <span id="Technical_Overview_2" class="mw-headline">Technical Overview</span>

- Database connectivity:
- Transaction support:
- Code generation:

#### <span id="Special_topics_2" class="mw-headline">Special topics</span>

- Demonstrations of what your software does well

#### <span id="Limitations_2" class="mw-headline">Limitations</span>

- Performance
  - Can one read thousands of objects into memory? You could do this but
    it's not suited to bulk operations
- Joins & complex queries


``` de1
# Add the add_constructor for looking for name lengths
 
__PACKAGE__ ->add_constructor(long_names => qq{ length(name) > 15 });
 
# Custom SQL
 
__PACKAGE__->set_sql(xfiles => qq{
       SELECT FEATURE_ID
       FROM FEATURE
       WHERE NAME = 'xfiles' });
```


#### <span id="Presentation_by_Brian_O.27Connor" class="mw-headline">Presentation by Brian O'Connor</span>

[Chado%253A%253AAutoDBI
Presentation](Chado%253A%253AAutoDBI_Presentation "Chado%253A%253AAutoDBI Presentation")

  

### <span id="Modware_2" class="mw-headline">Modware</span>

[Modware](Modware "Modware") seeks to provide an object-oriented perl
interface to Chado to allow for rapid application development without
worrying about the complex details of the schema on a day-to-day basis.

#### <span id="Background_3" class="mw-headline">Background</span>

- Source:
  <a href="http://gmod-ware.sourceforge.net" class="external free"
  rel="nofollow">http://gmod-ware.sourceforge.net</a>
- Language: Perl
- Authors: Sohel Merchant, Eric Just
- Contact: e-just \[at\] northwestern.edu
- Users: dictyBase
- Support: Fully supported by authors. Sourceforge infrastructure (bug
  reports, mailing lists)
- Third party code: GMOD, BioPerl

#### <span id="Technical_Overview_3" class="mw-headline">Technical Overview</span>

- Database connectivity: Uses the
  [Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI") connection from
  GMOD. No connection configuration necessary since Modware is built on
  top of GMOD and the connection is configured on GMOD install.
- Transaction support: Transactions are fully supported. The database
  handle is available as a singleton through Modware::DBH. To rollback
  at any time, simply insert
  

  

  ``` de1
  new Modware::DBH->rollback()
  ```

  

  

  into script.
- Code generation: No automatic code generation.

#### <span id="Special_topics_3" class="mw-headline">Special topics</span>

- Features in Modware map to familiar Bioperl
  (<a href="http://search.cpan.org/perldoc?Bio::Seq" class="external text"
  rel="nofollow">Bio::Seq</a> and
  <a href="http://search.cpan.org/perldoc?Bio::SeqFeature"
  class="external text" rel="nofollow">Bio::SeqFeature</a>) objects that
  can be accessed through a 'bioperl' method.
- Modware internally links Bio::SeqFeature objects to the proper
  Bio::Seq objects to provide maximum functionality from the BioPerl
  libraries.
- Modware's API documentation is complete and easily browsed at
  <a href="http://gmod-ware.sourceforge.net/doc/" class="external free"
  rel="nofollow">http://gmod-ware.sourceforge.net/doc/</a>
- Plenty of other documentation (quick starts with simple use cases) at
  <a href="http://gmod-ware.sourceforge.net" class="external free"
  rel="nofollow">http://gmod-ware.sourceforge.net</a>

#### <span id="Limitations_3" class="mw-headline">Limitations</span>

- Currently Alpha release (hoping for user feedback to create Beta)
- Does not *cover* all of Chado
- Not enough users to get quality feedback yet
- Performance is slower by object-oriented nature
- Language dependent

#### <span id="Presentation_by_Eric_Just" class="mw-headline">Presentation by Eric Just</span>

[Modware Presentation](Modware_Presentation "Modware Presentation")

### <span id="GBrowse_.28DasI.29_Adaptor" class="mw-headline">GBrowse (DasI) Adaptor</span>

#### <span id="Background_4" class="mw-headline">Background</span>

- Source: <a
  href="http://sourceforge.net/project/showfiles.php?group_id=27707&amp;package_id=34513&amp;release_id=433523"
  class="external free"
  rel="nofollow">http://sourceforge.net/project/showfiles.php?group_id=27707&amp;package_id=34513&amp;release_id=433523</a>
- Language: Perl
- Authors: Scott Cain
- Users: Several through GBrowse, none that I know of as a scripting
  tool.
- Support:
  <a href="http://lists.sourceforge.net/lists/listinfo/gmod-gbrowse"
  class="external text" rel="nofollow">GBrowse mailing list</a>
- Third party code: None.

#### <span id="Technical_Overview_4" class="mw-headline">Technical Overview</span>

- Database connectivity: Connects *via* Perl's DBI
- Transaction support: N/A (read only adapter)
- Code generation: N/A

#### <span id="Special_topics_4" class="mw-headline">Special topics</span>

Clearly, <a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a> is designed
for use with [GBrowse](GBrowse.1 "GBrowse").

#### <span id="Limitations_4" class="mw-headline">Limitations</span>

- Read-only
- Not generic middleware but if you use Chado and GBrowse may be useful
- Incomplete implementation of Bio::DasI; just enough to make GBrowse
  work
- Also, despite the name, has never been tested with a Das server.

#### <span id="Presentation_by_Scott_Cain" class="mw-headline">Presentation by Scott Cain</span>

[GBrowse (DasI) Adaptor
Presentation](GBrowse_(DasI)_Presentation "GBrowse (DasI) Presentation")

  

### <span id="iBatis_and_Abator" class="mw-headline">iBatis and Abator</span>

#### <span id="Background_5" class="mw-headline">Background</span>

- Source: <a href="http://ibatis.apache.org/" class="external free"
  rel="nofollow">http://ibatis.apache.org/</a>
- Language: Java
- Authors: Apache group
- Users:
- Support:
- Third party code:

#### <span id="Technical_Overview_5" class="mw-headline">Technical Overview</span>

- Database connectivity:
- Transaction support:
- Code generation:

#### <span id="Special_topics_5" class="mw-headline">Special topics</span>

- Demonstrations of what your software does well

#### <span id="Limitations_5" class="mw-headline">Limitations</span>

- Does not hide SQL
- Does not create a whole object model of the database in memory
- Not as widely used as Hibernate
- No Perl version

#### <span id="Presentation_by_Jeff_Bowes" class="mw-headline">Presentation by Jeff Bowes</span>

[iBatis Presentation](IBatis_Presentation "IBatis Presentation")

  

### <span id="Hibernate_2" class="mw-headline">Hibernate</span>

#### <span id="Background_6" class="mw-headline">Background</span>

- Source: <a href="http://www.hibernate.org" class="external free"
  rel="nofollow">http://www.hibernate.org</a>
- Language: Java
- Authors: JBoss group
- Users: VectorBase
- Support: JBoss group
- Third party code:

#### <span id="Technical_Overview_6" class="mw-headline">Technical Overview</span>

- Database connectivity:
- Transaction support:
- Code generation:

#### <span id="Limitations_6" class="mw-headline">Limitations</span>

- Issue around Completeness
- Exception Handling
- Performance Tuning

#### <span id="Presentation_by_Robert_Bruggner" class="mw-headline">Presentation by Robert Bruggner</span>

[Hibernate
Presentation](Hibernate_Presentation "Hibernate Presentation")

  

### <span id="PSU_Chado_Interface" class="mw-headline">PSU Chado Interface</span>



*I think this eventually became what is described in the [Artemis-Chado
Integration
Tutorial](Artemis-Chado_Integration_Tutorial "Artemis-Chado Integration Tutorial").
[Dave C.](User%253AClements "User%253AClements")*



#### <span id="Background_7" class="mw-headline">Background</span>

- Source:
  <a href="http://www.sanger.ac.uk/pathogens" class="external text"
  rel="nofollow">Pathogen Sequencing Unit</a>, Sanger Institute
- Language: Java
- Authors: Chinmay Patel, Adrian Tivey, Tim Carver
- Users: In the future this will be freely available and used by
  <a href="http://www.genedb.org" class="external text"
  rel="nofollow">GeneDB</a> and
  <a href="http://www.sanger.ac.uk/Software/Artemis" class="external text"
  rel="nofollow">Artemis</a>
- Support: In development
- Third party code: iBatis and Spring/Hibernate

#### <span id="Overview" class="mw-headline">Overview</span>

We're using a common interface with two different implementations: an
iBatis and a Hibernate one. This gives us the ability to choose either
implementation depending upon the requirements of the application.

  

#### <span id="iBatis_2" class="mw-headline">iBatis</span>

See also [iBatis and Abator](#iBatis_and_Abator)

##### <span id="Technical_Overview_7" class="mw-headline">Technical Overview</span>

- Database connectivity:

Dynamically via Java code or properties file

- Transaction support:

Yes

- Code generation:

Using common interface which was originally automatically generated, but
mappings hand-generated

##### <span id="Advantages" class="mw-headline">Advantages</span>

- Direct access to SQL

##### <span id="Limitations_7" class="mw-headline">Limitations</span>

- Not completely pluggable between both engines
- Lazy loading is either on or off

#### <span id="Hibernate_3" class="mw-headline">Hibernate</span>

See also [Hibernate](#Hibernate_2)

##### <span id="Technical_Overview_8" class="mw-headline">Technical Overview</span>

- Database connectivity:

Via usual Spring configuration methods

- Transaction support:

Yes

- Code generation:

Interface and Hibernate implementation originally auto-generated, then
hand-edited

##### <span id="Advantages_2" class="mw-headline">Advantages</span>

- Complete coverage of core schema (except [Phenotype
  module](Chado_Phenotype_Module "Chado Phenotype Module"))
- Choice of writing in either object-level query language or SQL

##### <span id="Limitations_8" class="mw-headline">Limitations</span>

- Not completely pluggable between both engines
- Not currently using subclassing eg just a Feature, not Gene, Exon etc

#### <span id="Presentation_by_Chinmay_Patel" class="mw-headline">Presentation by Chinmay Patel</span>

[PSU Presentation](PSU_Presentation "PSU Presentation")

### <span id="GUS_Web_Development_Kit_.28WDK.29" class="mw-headline">GUS Web Development Kit (WDK)</span>

#### <span id="Background_8" class="mw-headline">Background</span>

- Source: <a href="http://www.gusdb.org/WDK" class="external free"
  rel="nofollow">http://www.gusdb.org/WDK</a>
- Language: XML/Java/JSP
- Authors: GUS WDK development team
- Users: PlasmoDB/ApiDB/CryptoDB/ToxoDB, others under development
- Support: GUS WDK development team
- Third party code: Struts/JSP/Ajax/Axis
- Platform requirements: any Oracle, PostgreSQL or MySQL database;
  Linux; Tomcat

#### <span id="Technical_Overview_9" class="mw-headline">Technical Overview</span>

- Database connectivity: JDBC
- Transaction support: read-only presentation layer object model
- Code generation: java classes generated from detailed object
  specification in XML

#### <span id="Advantages_3" class="mw-headline">Advantages</span>

- Configurable coarse grained layer tailored for the presentation layer
- Configurable in XML by non-programmers
- Seamless integration with front-end query engine and web page
  generator

#### <span id="Limitations_9" class="mw-headline">Limitations</span>

- read-only
- not designed as a general purpose ORT
- configuration is complicated

#### <span id="Presentation_by_Steve_Fischer" class="mw-headline">Presentation by Steve Fischer</span>

[GUS WDK Presentation](GUS_WDK_Presentation "GUS WDK Presentation")

  

### <span id="InterMine_2" class="mw-headline">InterMine</span>

#### <span id="Background_9" class="mw-headline">Background</span>

- Source: <a href="http://www.intermine.org" class="external free"
  rel="nofollow">http://www.intermine.org</a>
- Language: Java
- Authors: FlyMine/InterMine development team
- Users: FlyMine, StemCellMine, others under development
- Support: FlyMine/InterMine development team
- Third party code: Struts/JSP/Ajax

#### <span id="Technical_Overview_10" class="mw-headline">Technical Overview</span>

- Database connectivity: JDBC
- Transaction support: basic during build (doesn't support concurrent
  writes) as database is optimised for high read-only query performance
- Code generation: extensive use of automatic code generation

#### <span id="Limitations_10" class="mw-headline">Limitations</span>

- slow, but improving, build times (loads and integrates ~25m objects in
  ~36 hours)
- configuration complicated but being simplified
- deals well with overlapping features, but currently limited support
  for querying locations in DNA or protein sequences
- export still limited to tab or comma-delimited or FASTA formats though
  great flexibility in choice of output columns and their order
- sequences not handled very well
  - e.g. each chromosome sequence is stored in one big text field in
    PostgreSQL
- can't yet do queries involving sizes of collections of things
  - e.g. find the genes with only 1 transcript
- doesn't yet support left outer join behaviour (under development)

#### <span id="Presentation_by_Gos_Micklem" class="mw-headline">Presentation by Gos Micklem</span>

[InterMine
Presentation](InterMine_Presentation "InterMine Presentation")

  

## <span id="Wiki_Authors" class="mw-headline">Wiki Authors</span>

- Jeff Bowes, XenBase
- Robert Bruggner, VectorBase
- [Scott Cain](User%253AScott "User%253AScott"), GMOD
- [Steve Fischer](User%253AStevef "User%253AStevef"), PlasmoDB/GUS
- [Josh Goodman](User%253AJogoodma "User%253AJogoodma"),
  [FlyBase](Category%253AFlyBase "Category%253AFlyBase")
- Eric Just, [DictyBase](Category%253ADictyBase "Category%253ADictyBase")
- Sohel Merchant, DictyBase
- Brian O'Connor, UCLA
- [Brian Osborne](User%253ABosborne "User%253ABosborne"), GMOD
- Chinmay Patel, GeneDB
- Pinglei Zhou, FlyBase
- Gos Micklem, FlyMine/InterMine




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [InterMine](Category%253AInterMine "Category%253AInterMine")
- [Java](Category%253AJava "Category%253AJava")
- [Middleware](Category%253AMiddleware "Category%253AMiddleware")
- [Modware](Category%253AModware "Category%253AModware")
- [Perl](Category%253APerl "Category%253APerl")
- [XORT](Category%253AXORT "Category%253AXORT")
- [BioPerl](Category%253ABioPerl "Category%253ABioPerl")
- [Events](Category%253AEvents "Category%253AEvents")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GMOD_Middleware" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:27 on 15 August
  2013.</span>
<!-- - <span id="footer-info-viewcount">684,710 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





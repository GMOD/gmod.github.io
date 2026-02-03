---
title: "November 2007 GMOD Meeting"
---
# November 2007 GMOD Meeting

GMOD's November 2007 meeting was held November 5, 1:30PM to November 7,
12:00PM at
<a href="http://www.cshl.edu/" class="external text" rel="nofollow">Cold
Spring Harbor Laboratory</a> following the
<a href="http://meetings.cshl.edu/meetings/info07.shtml"
class="external text" rel="nofollow">Genome Informatics</a> meeting.

  Information</span>](#Pre-Meeting_Information)
  - [Possible
    topics](#Possible_topics)
  - [Registration](#Registration)
  - [Location](#Location)
- [Attendees](#Attendees)
- [Agenda](#Agenda)
  - [Discussion
    Topics](#Discussion_Topics)
  - [November
    5](#November_5)
  - [November
    6](#November_6)
  - [November
    7](#November_7)
- [Presentations](#Presentations)
- [Meeting
  Minutes](#Meeting_Minutes)
  - [Big
    Picture](#Big_Picture)
    - [GMOD's
      Role](#GMOD.27s_Role)
    - [Releases and
      Bundles](#Releases_and_Bundles)
    - [Comparative
      Genomics](#Comparative_Genomics)
  - [GMOD
    Components / Functions](#GMOD_Components_.2F_Functions)
    - [Apollo](#Apollo)
      - [New Development](#New_Development)
      - [ID
        Generation and JDBC
        Drivers](#ID_Generation_and_JDBC_Drivers)
    - [BioPerl, GFF](#BioPerl.2C_GFF)
    - [Chado](#Chado)
      - [Chado
        Documentation](#Chado_Documentation)
      - [Chado Validator](#Chado_Validator)
      - [DBMS Choice](#DBMS_Choice)
      - [Postgres
        Performance](#Postgres_Performance)
    - [CMap](#CMap)
    - [Community
      Annotation](#Community_Annotation)
      - [Community Annotation at
        ParameciumDB](#Community_Annotation_at_ParameciumDB)
      - [Community Annotation at
        JGI](#Community_Annotation_at_JGI)
      - [Community Annotation at
        SGN](#Community_Annotation_at_SGN)
    - [Community Annotation Server
      (CAS)](#Community_Annotation_Server_.28CAS.29)
    - [Distributed Annotation System/2
      (DAS/2)](#Distributed_Annotation_System.2F2_.28DAS.2F2.29)
    - [GBrowse](#GBrowse)
      - [Roadmap](#Roadmap)
      - [Performance](#Performance)
    - [Genome
      Grid](#Genome_Grid)
    - [Help
      Desk](#Help_Desk)
    - [Pathway Tools](#Pathway_Tools)
    - [SynView](#SynView)
    - [TableEdit](#TableEdit)
    - [Turnkey, GMODweb,
      DrupalFly](#Turnkey.2C_GMODweb.2C_DrupalFly)
  - [GMOD
    Participating
    Organizations](#GMOD_Participating_Organizations)
    - [ApiDB](#ApiDB)
      - [Synteny at
        ApiDB](#Synteny_at_ApiDB)
    - [Berkeley National
      Labs](#Berkeley_National_Labs)
    - [FlyBase](#FlyBase)
      - [Synteny at
        FlyBase](#Synteny_at_FlyBase)
    - [GeneDB, Sanger](#GeneDB.2C_Sanger)
    - [Imperial College
      London](#Imperial_College_London)
    - [JCVI
      (nee TIGR)](#JCVI_.28nee_TIGR.29)
    - [MaizeGDB](#MaizeGDB)
    - [ParameciumDB](#ParameciumDB)
    - [Riken](#Riken)
    - [University of Maryland Medical
      Center](#University_of_Maryland_Medical_Center)
    - [WormBase / CSHL](#WormBase_.2F_CSHL)
      - [GBrowse_Syn](#GBrowse_Syn)

## Pre-Meeting Information

### Possible topics

A list of suggested topics, raised in advance by GMOD community members.

- community annotation - FlyBase seconds this topic
- Chado standard on ortholog/paralog/synteny storage.
- The state of [GFF](/wiki/GFF) tools in [BioPerl](/wiki/BioPerl).
  Some of the auditing and examples are on a
  <a href="http://bioperl.org/wiki/GFF_code_audit" class="external text"
  rel="nofollow">Bioperl wiki page</a>.
- GMOD releases and packaging
  - How hard would it be to heap together specific releases of popular
    GMOD components into a named/numbered release that has gone through
    some level of compatibility testing?
  - How much pain does a lack of such a release currently cause users?
  - how much might the community annotation server help with this?

### Registration

There was a \$25 registration fee to cover meals and other costs
associated with the meeting. Please contact Scott Cain
<a href="mailto:cain@cshl.edu" class="external text"

### Location

The meeting was held at
<a href="http://www.cshl.edu/" class="external text" rel="nofollow">Cold
Spring Harbor Laboratory's</a> at the <a
href="http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;time=&amp;date=&amp;ttype=&amp;q=500+Sunnyside+Boulevard,+Woodbury+NY&amp;sll=40.800589,-73.468398&amp;sspn=0.007407,0.009849&amp;ie=UTF8&amp;ll=40.800556,-73.468881&amp;spn=0.007407,0.009849&amp;t=h&amp;z=16&amp;iwloc=addr&amp;om=1"
class="external text" rel="nofollow">Woodbury building</a>, which is not
on the main CSHL campus.

## Attendees

- James Abbott, Imperial College, London
- Sam Angiuoli, University of Maryland Medical School
- Tim Burgis, Imperial College, London
- [Scott Cain](/wiki/User:Scott), GMOD Coordinator
- [Mike Caudy](/wiki/User:Mcaudy), CSHL
- [Dave Clements](/wiki/User:Clements), [GMOD Help
  Desk](/wiki/GMOD_Help_Desk),
  <a href="http://nescent.org" class="external text"
  rel="nofollow">NESCent</a>
- Norie de la Cruz, WormBase
- Quenfen Dong, Indiana University
- Dave Emmert, <a href="http://flybase.org" class="external text"
  rel="nofollow">FlyBase</a>
- [Ben Faga](/wiki/User:Faga), CSHL
- Kathleen Falls, <a href="http://flybase.org" class="external text"
  rel="nofollow">FlyBase</a>
- [Steve Fischer](/wiki/User:Stevef),
  <a href="http://apidb.org" class="external text"
  rel="nofollow">ApiDB</a>
- [Don Gilbert](/wiki/User:Dongilbert)
- [Josh Goodman](/wiki/User:Jogoodma), FlyBase - Indiana
  University
- [Jay Hannah](/wiki/User:Jhannah), University of Nebraska
- [Todd Harris](/wiki/User:Tharris), WormBase - Cold Spring
  Harbor Laboratory
- Sven Heinicke, Princeton
- Kevin Galens, JCVI
- [Gregg Helt](/wiki/User:GreggHelt2), DAS/2
- [Chris Hemmerich](/wiki/User:Chemmeri),
  <a href="http://flybase.org" class="external text"
  rel="nofollow">FlyBase</a>
- Hideya Kiwaji, <a href="http://www.riken.go.jp/" class="external text"
  rel="nofollow">Riken</a>
- [Ed Lee](/wiki/User:Elee), Lawrence Berkeley Labs
- Suzi Lewis, <a href="http://bioontology.org/" class="external text"
  rel="nofollow">National Center for Biomedical Ontology</a>
- [Sheldon McKay](/wiki/User:Mckays), WormBase/modENCODE - Cold
  Spring Harbor Laboratory
- Lukas Mueller,
  <a href="http://soldb.cit.cornell.edu/" class="external text"
  rel="nofollow">Sol Genomics Network</a>
- [Joshua Orvis](/wiki/User:Jorvis), University of Maryland
  Medical Center
- Suzanne Paley, <a href="http://ecocyc.org" class="external text"
  rel="nofollow">EcoCyc</a>
- Chinmay Patel, GeneDB, Sanger Institute
- David Riley, University of Maryland Medical Center
- Andy Schroeder, <a href="http://flybase.org" class="external text"
  rel="nofollow">FlyBase</a>
- Taner Sen, <a href="http://maizegdb.org" class="external text"
  rel="nofollow">MaizeGDB</a>
- [Linda Sperling](/wiki/User:Sperling),
  [ParameciumDB](/wiki/ParameciumDB) - CNRS
- [Jason Stajich](/wiki/User:Stajich)
- [Lincoln Stein](/wiki/User:Lstein), CSHL
- Victor Strelets, <a href="http://flybase.org" class="external text"
  rel="nofollow">FlyBase</a>
- Haiming Wang <a href="http://apidb.org" class="external text"
  rel="nofollow">ApiDB.org</a>
- Robert Wilson, <a href="http://flybase.org" class="external text"
  rel="nofollow">FlyBase</a>
- Haiyan Zhang, <a href="http://flybase.org" class="external text"
  rel="nofollow">FlyBase</a>
- Pinglei Zhou, <a href="http://flybase.org" class="external text"
  rel="nofollow">FlyBase</a>

## Agenda

### Discussion Topics

We spent some time on our first day discussion what topics attendees
would like to discuss. This list of topics helped shape the meeting
agenda.

- Community Annotation
  - DAS, Apollo, genome-Wiki
- Comparative Genomics
  - Synteny viewers
  - Chado data storage
  - See [Chado Comparative
    Schema](/wiki/Chado_Comparative_Schema).
- BioPerl and [GFF(2/3)](/wiki/GFF)
  - [GFF](/wiki/GFF) Questions
- Postgres Tuning / [Materialized
  views](/wiki/Materialized_views)
  - Performance Strategies
- Apollo-Chado Connection
  - Performance - See [PostgreSQL Performance
    Tips](/wiki/PostgreSQL_Performance_Tips).
  - Too many JDBC Adaptors
- Chado
  - ID Generation
  - Moving away from Postgres
  - Missing Chado pieces (phylogenetics)
- What Should GMOD Focus On (What's Missing)
  - Genome Analysis ([Galaxy](/wiki/Galaxy.1),
    <a href="/wiki/Ergatis" class="mw-redirect" title="Ergatis">Ergatis</a>,
    ...)
    - Lightweight annotation
      <a href="http://www.yandell-lab.org/maker/index.html"
      class="external text" rel="nofollow">MAKER pipeline</a> from Mark
      Yandell
      (*2008/05/13: [MAKER](/wiki/MAKER.1) has since been folded in to
      GMOD.*)
  - MicroArrays
  - What is the GMOD Community and how best can we serve them?
  - Is there a need for individual MODs?
- What should [GMOD Help Desk](/wiki/GMOD_Help_Desk) do?
  - UIs: Picture Intensive
- What should be the outcome of this meeting?

### November 5

1:00 Shuttle from Grace Auditorium to Woodbury

1:30 Introductions

2:30 Coffee

5:30 Shuttle from Woodbury to Grace Auditorium

### November 6

8:50 Shuttle from Grace Auditorium to Woodbury

9:15 ? Scott

10:15 Community Annotation

- Linda Sperling - ParameciumDB
- Lukas Muller - SGN

10:30 Coffee

- Michael Caudy - FlyBase Drupal

12:00 Lunch

1:00 Standards and applications for storing comparative genome data

- [Steve Fisher](/wiki/User:Stevef) -
  [GBrowse](/wiki/GBrowse.1): [SynView](/wiki/SynView) and the
  Generic database adaptor
- Victor Strelets - FlyBase Orthoview (GBrowse)

2:30 Coffee

- Sheldon McKay - gbrowse_syn

5:30 Shuttle from Woodbury to Grace Auditorium

### November 7

8:50 Shuttle from Grace Auditorium to Woodbury

9:15 BioPerl

- [GFF3](/wiki/GFF3) tools
- SeqFeatures/FeatureIO
- Sequence Ontology

10:30 Coffee

12:00 Shuttle from Woodbury to Grace Auditorium

## Presentations

- <a href="http://eugenes.org/gmod/docs/gmod-update-07nov.ppt"
  class="external text" rel="nofollow">GMOD Indiana update</a> slides,
  Don Gilbert
- WormBase update, [Todd Harris](/wiki/User:Tharris); Slides:
  <a
  href="http://dev.wormbase.org/presentations/2007/2007.11-GMOD-WormBase/2007.11-GMOD-WormBase.key.tgz"
  class="external text" rel="nofollow">Keynote</a>, <a
  href="http://dev.wormbase.org/presentations/2007/2007.11-GMOD-WormBase/2007.11-GMOD-WormBase.ppt"
  class="external text" rel="nofollow">Powerpoint</a>, <a
  href="http://dev.wormbase.org/presentations/2007/2007.11-GMOD-WormBase/2007.11-GMOD-WormBase.pdf"
  class="external text" rel="nofollow">PDF</a>, <a
  href="http://dev.wormbase.org/presentations/2007/2007.11-GMOD-WormBase/2007.11-GMOD-WormBase.mov"
  class="external text" rel="nofollow">Mov</a>
- <a
  href="http://mango.ctegd.uga.edu/jkissingLab/presentations/GMOD_Nov_2007.ppt"
  class="external text" rel="nofollow">ApiDB GBrowse update</a> slides,
  Haiming Wang
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/38/2007_11_05_CMap_GMOD.ppt"
  class="internal" title="2007 11 05 CMap GMOD.ppt">CMap/CMAE Progress
  Report</a>, [Ben Faga](/wiki/User:Faga)
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/58/Gbrowse_syn.pdf" class="internal"
  title="Gbrowse syn.pdf">Gbrowse_syn</a> Sheldon McKay
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/ac/CommunityAnnotationNov2007.pdf"
  class="internal" title="CommunityAnnotationNov2007.pdf">Community
  Annotation</a> [Linda Sperling](/wiki/User:Sperling)
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/be/Workshop.pdf" class="internal"
  title="Workshop.pdf">Community Annotation</a> Chinmay Patel
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/19/SyntenyModeling.pdf" class="internal"
  title="SyntenyModeling.pdf">Modeling and Displaying Synteny w/
  SynView</a> [Steve Fischer](/wiki/User:Stevef)
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c8/GMOD-Nov-2007.ppt" class="internal"
  title="GMOD-Nov-2007.ppt">Recent Developments in Pathway Tools</a>,
  Suzanne Paley

## Meeting Minutes

The minutes here are based on Dave Clements' notes from the meeting.
They are far from complete and you are encouraged to expand and correct
them.

The minutes are not chronological. Rather they are broken up into 3
sections:

- [Big Picture](#Big_Picture)
- [GMOD Components / Functions](#GMOD_Components_.2F_Functions)
- [GMOD Participating Organizations](#GMOD_Participating_Organizations)

### Big Picture

We had several discussions about *the big picture.*

#### GMOD's Role

Don Gilbert pointed out that cheap short sequencers are now available.
Lots of people have inexpensive sequences, but there still is no way to
do cheap annotation.

Current GMOD clients are species or family centered. Want to make it
easy to integrate multiple species. ApiDB is at the point of opening new
species databases and web sites with relatively little effort.

Comparative genomics came up over and over again, both across species
and within species.

As data grows and is consolidated, issues of who owns the data and who's
responsible for the annotation become more problematic.

How does GMOD want to deal with integration issues?

How close to the sequencer does GMOD want to get? We don't want to pull
the data off the sequencer.

Should we position GMOD as something that can feed data into places like
Ensembl? Ensembl does not have curation expertise of the MODs. Even if
NCBI is wonderful at consolidation, they won't have quality curation.
GMOD sits right there, supporting curation. So, we doubt that Ensembl or
NCBI will swallow us whole.

#### Releases and Bundles

We need to figure out what components we want and what we are pushing.
If we focus on a core set of packages then life gets easier for the
project.

There was discussion of better release management for components, and
the VMWare Community Annotation Server package. Are GMOD bundles the way
of the future? Believe that binary packages are generally not going to
work for GMOD unless someone is willing to put a lot of time into
maintaining them.

#### Comparative Genomics

Comparative genomics came up over and over again, both across species
and within species. The GBrowse_syn talk in particular spawned a
discussion on this.

First, can Chado represent relationships that have more than two
members? Yes. Feature_loc has a rank column. Do we want collections in
Chado?

Jason suggested a working group on how to do this. Dave from UMD
volunteered to manage a wiki page on this, with the end goal of
establishing a document that defines how to store comparative genomes.

Talks on synteny are spread throughout this document.

### GMOD Components / Functions

#### Apollo

##### New Development

Work has resumed on developing [Apollo](/wiki/Apollo.1). [Ed
Lee](/wiki/User:Elee) formerly of TIGR/JCVI started working for
Suzi Lewis at Berkeley this fall and is working on it. Work is being
done on

- A [GFF3](/wiki/GFF3) adapter
- Speeding up Apollo when it uses
  <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> as a
  backend (or, just speeding up Chado).
- Communicating with more than one Chado instance.
- Undo/Redo support.

##### ID Generation and JDBC Drivers

Apollo can talk directly to a database or it can use XML files instead.
FlyBase, VectorBase, BeeBase, and BovineBase are all believed to take
the XML approach.

Apollo currently has two choices for database adaptors:

1.  One that uses Postgres database triggers to set IDs.
2.  One that does not.

The trigger version is used in the Community Annotation Server and on
the Dolan-Rice project. We could not think of anywhere else it was used.
The triggerless version is used everywhere else that we knew of.

The trigger version is Postgres specific. The triggerless version stores
multiple copies of shared exons.

Notes from Tuesday: Decided to actively discourage use of the trigger
version. Best thing may be to go through trigger code and externalize
the logic.

Notes from Wednesday: Apollo - Chado - No short term decision. Long term
probably move to Crabtree.

As you may have noticed, those notes disagree.

#### BioPerl, GFF

There was a discussion of [BioPerl](/wiki/BioPerl) and how it
relates to GMOD.

Jason Stajich created a slimmed down feature Perl package based on
arrays instead of hashes: Bio::SeqFeature::Slim. This is 70% faster for
reading a [GFF](/wiki/GFF) file. Bio::Feature::IO only supports
[GFF3](/wiki/GFF3). It is slow, uses heavy objects, and is strongly
typed. Jason wants to spend more time on middleware speed. He also wants
converter into a common object model and code to get it back out to any
supported format.

6 to 8 people are currently contributing to BioPerl.

[GFF3](/wiki/GFF3) has an ID field. ID is not clear in earlier
versions. [GFF2](/wiki/GFF2) supports arbitrary feature types. GFF3
requires SO types (but you can always ignore that). Keep detailed
alignment data in a separate database, not in GFF3. Indicate in GFF3
that data is stored elsewhere. Could store cigar strings in GFF3 and
spec supports that.

#### Chado

There was a request to make to Chado be more database neutral, rather
than Postgres-specific.

The slowness of Chado databases came up in several contexts. David from
UMD Medical Center started a Postgres performance page on the wiki.

Scott described a potential way to implement materialized views in Chado
that gets us most of the benefits of DBMS-supported materialized views.
Store

- the SQL to create it in a table,
- a run time schedule for when the table should be rebuilt,
- an enabled/disabled flag that is disabled by default.

Question was raised if genome metadata fits into the current Chado. The
belief was that it does not.

Jason Stajich wants a better idea of who is responsible for what in
terms of Chado modules. Dave C will take this on.

##### Chado Documentation

The table level and column level documentation for Chado is in a good
state. Enhanced basic, big picture documentation was requested. Josh
Goodman is thinking of providing a mapping from Chado DB columns to
FlyBase report columns. Mike Caudy pointed out we should have multiple
examples of implementation, not just FlyBase.

##### Chado Validator

We discussed if a
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> database
validator would be worthwhile. A validator would check a Chado database
to see if it conforms to the canonical model for a Chado database. There
was no consensus on the value or practicality of this. There was
consensus that no one was willing to volunteer to write it.

Ben suggested that if and when we do this, we use the
[GFF3](/wiki/GFF3) to Chado validator as a starting point.

##### DBMS Choice

There was a request to make to Chado be more database neutral, rather
than Postgres-specific. Someone also asked if there was an SQLite
adapter for GBrowse.

##### Postgres Performance

Slow performance of Chado Postgres implementations came up repeatedly.

Some bits:

- Specify locale. ASCII-US runs fast. UTF-8 is slow and that is the
  default. Specified for the server, at server start.
- A lot of time has been spent on making the queries go fast.
- RTree indexes are in the core.
- Allen's FRange functions are in the DB, but aren't used by default
  queries.

#### CMap

**Presentation:**
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/38/2007_11_05_CMap_GMOD.ppt"
class="internal" title="2007 11 05 CMap GMOD.ppt">CMap Progress
Report</a>, [Ben Faga](/wiki/User:Faga)

New CMap release (1.0) is on its way. Will have an assembly editor.
Includes a dot plot, new glyphs, and an install script based on the
GBrowse install script.

Ben will ask users to do beta testing, and hopes to start with that
before end of 2007. Ben is looking for a project that is doing large
scale assembly, to test CMap for doing assembly correction.

#### Community Annotation

This was a popular motif in the meeting.

##### Community Annotation at ParameciumDB

**Presentation:**
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/ac/CommunityAnnotationNov2007.pdf"
class="internal" title="CommunityAnnotationNov2007.pdf">Community
Annotation</a>, [Linda Sperling](/wiki/User:Sperling)

Linda Sperling discussed ParameciumDB. Paramecium is a small community
with few resources and no dedicated curators.

Paramecium curators are a small set of people that must do their
annotation from fixed IP addresses. Curator annotations are kept in
addition to existing Genoscope predictions. These annotation are not
validated when they are submitted. Annotators cannot change annotations
made by other people. There are two databases: one backing the website,
and one where annotation goes. Once a month the new annotation is pushed
to the web site. Validation happens prior to release.

They are also using ParameciumDB to teach annotation at two colleges,
and some annotation comes from that. The bulk of annotations come from 2
curators, with the other curators all making a small number of
annotations.

Uses Java WebStart version of Apollo. Annotators click on link and
Apollo starts up. Apollo talks directly to Chado, using the triggerless
database adapter.

##### Community Annotation at JGI

Don Gilbert briefly described community annotation at JGI. They have a
web interface for simple annotations and use Apollo for complex
annotations. Anyone can promote any gene model, but they can't delete
other models. Use the Wikipedia model: Whoever annotates last is
correct.

##### Community Annotation at SGN

Lukas Mueller discussed .

SGN has data for tomato, potato, eggplant, and many other species. SGN
is locus centric. Each locus has (or can have) a single person who is
the editor/owner of that locus. The locus editor can change anything
about that locus that they want. The name of the locus editor is
displayed on the locus page. Every locus has a "request editor
privileges" link, if that locus has been assigned or not.

All edits are logged, and nothing is ever truly deleted. 'Deleted' items
are retained but flagged as obsolete and are no longer shown.

SGN supports tagging of loci. Tags are free text that are rationalized
after they are created. The tagging metaphor for curation also came up
in several contexts during the Genome Informatics meeting.

#### Community Annotation Server (CAS)

Scott Cain spoke about this. It is almost ready to go. The Community
Annotation Server (CAS) is meant to be "GMOD in a box". Currently it
consists of:

- A VMWare image, containing
- Ubuntu Linux, version 6.10 LTS.
  - Picked Ubuntu LTS over CentOS because LTS stands for *long term
    service* and it will be supported for a while.
- Postgres
- A <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> database
  with DictyBase data in it.
- An empty Chado database
- [Modware](/wiki/Modware)
- [Apollo](/wiki/Apollo.1) - Uses the JDBC adaptor with triggers.
  This is a Java WebStart version.
- [GBrowse](/wiki/GBrowse.1)
- MediaWiki - includes Cite, ProcessCite and TableEdit extensions.
  - Cite extensions make it easy to provide literature annotations.
    Provide PubMed ID and it finds and grabs extract from PubMed.

Note that it does not include Turnkey and/or
[GMODWeb](/wiki/GMODWeb). [Lincoln](/wiki/User:Lstein) would
like to add GMODweb, [Textpresso](/wiki/Textpresso) and
[BioMart](/wiki/BioMart) to that list.

This can run on any Intel machine, including Apple. Very little
performance hit is caused by virtualization.

An online trial version of the Community Annotation Server was requested
and was already on the way.

#### Distributed Annotation System/2 (DAS/2)

Gregg Helt attended with the goal of bringing the [Distributed
Annotation
System](/wiki/Distributed_Annotation_System),
version 2 (DAS/2) into the GMOD family.

Preserving DAS/1 Strengths in DAS/2

- Keep focus on location-based annotation of biological sequences.
- Protocol, not an implementation.
  - HTTP for transport,
  - URLs for queries
  - XML for responses
  - REST-like style.
- No Required central authority.
- Couple XML response to URL request formats.
- XML has been shortened, but big gain comes from client-server content
  format negotiation, including binary. Empty elements dropped.
- Uses HTTP caching in the client.
- [IGB](/wiki/IGB) - reference client for DAS2. Integrated Genome
  Browser

Allen Day built a DAS2 server on top of
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>. That is in
CVS.

There is a validation suite for server responses to different queries.

Spec has not changed in over a year.

Scott would like that when someone installs Chado, they also get
[BioMart](/wiki/BioMart) and DAS2. That is, they get access by
default. Gregg would like to see GBrowse get a DAS/2 adapter.

#### GBrowse

##### Roadmap

[Lincoln Stein](/wiki/User:Lstein) talked about upcoming
releases of [GBrowse](/wiki/GBrowse.1).

- 1.69
  - Is in pre-release state.
  - Has
    - popups
    - drag tracks vertically
    - quantitative data
    - multiple alignment and conservation tracks.
- 1.7
  - Release by end of year
  - Rubberbanding (zoom by selecting a rectangle with mouse)
  - Autocomplete
- 2.0
  - Release in early 2008
  - Major performance and scalability enhancements.
    - e.g., each track can be drawn by different server or CPU.
- 3.0 *(subsequently renamed to [JBrowse](/wiki/JBrowse.1))*
  - Released sometime in 2008
  - Google maps type interface.
    - e.g., zooming and panning via mouse.

Version 3.0 (now called [JBrowse](/wiki/JBrowse.1)) is a fork of the
code and version 2 and 3 are expected to co-exist 'forever'. Some shops
won't have the horsepower to power version 3, and Lincoln wants to keep
it as an easy to install tool.

##### Performance

<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> is usually
too slow to run [GBrowse](/wiki/GBrowse.1) on top of. Consider using
Bio::DB:GFF instead. (Can't run GBrowse on top of
[BioMart](/wiki/BioMart). No adapter exists because of BioMart's
flexible schema.)

Jason S argues that GBrowse slows down when it does BioPerl object
creation. These are relatively heavyweight objects. He has just written
a Slim version that is up to 70% faster.

Browser speed was also the number one issue (with all browsers) at the
Genome Browsers Birds-of-a-Feather meeting at Genome Informatics.

#### Genome Grid

**Presentation:**
<a href="http://eugenes.org/gmod/docs/gmod-update-07nov.ppt"
class="external text" rel="nofollow">GMOD Indiana update</a> slides, Don
Gilbert

Don Gilbert spoke about [Genome grid](/wiki/Genome_grid).

Genome Grid is middleware to enable easy use of TeraGrid for genome
analysis tasks. Don is looking for genomes that need compute intensive
analysis. He also interested in applying [BioMart](/wiki/BioMart)
and <a href="/wiki/Ergatis" class="mw-redirect" title="Ergatis">Ergatis</a> to
these problems.

#### Help Desk

Dave Clements introduced himself and the goals of the [GMOD Help
Desk](/wiki/GMOD_Help_Desk) position.

Dave will make the help desk more visible on the web site, and add a
[GMOD News](/wiki/GMOD_News) column to the [home
page](/wiki/Main_Page).

#### Pathway Tools

**Presentation:**
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c8/GMOD-Nov-2007.ppt" class="internal"
title="GMOD-Nov-2007.ppt">Recent Developments in Pathway Tools</a>

Suzanne Paley talked about recent developments in [Pathway
Tools](/wiki/Pathway_Tools.1), including:

- Advanced Query Form
- Richer representation of regulation
- Pathlogic over-infers pathways. Pathways now have to be tagged to be
  shown.
- Dataset diffs and incremental updates.

#### SynView

**Presentation:**
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/19/SyntenyModeling.pdf" class="internal"
title="SyntenyModeling.pdf">Modeling and Displaying Synteny w/
SynView</a>, [Steve Fischer](/wiki/User:Stevef)

[Steve Fischer](/wiki/User:Stevef) of ApiDB (see below) spoke
about SynView. SynView is a synteny browser based on GBrowse. It is
described in a <a
href="http://bioinformatics.oxfordjournals.org/cgi/content/full/22/18/2308"
class="external text" rel="nofollow">Bioinformatics paper</a>.

His talked raised a number of issues that have come up with recent
extensions to SynView.

#### TableEdit

This is a MediaWiki extension by Jim Hu. It does two things. First, it
makes it easier to update tables in MediaWiki, by presenting a nicer
interface for altering wiki tables. Secondly, it supports synchronizing
MediaWiki tables from database tables and vice versa.

#### Turnkey, GMODweb, DrupalFly

These are all web interface layers that lay on top of Chado databases.

[GMODWeb](/wiki/GMODWeb) is currently not working, we think because
SQLTranslator has not been upgraded to deal with recent versions of
Postgres. [Ben Faga](/wiki/User:Faga) agreed to actively work on
this.

Michael Caudy argued that even if GMODWeb did work right now that it is
not extensible enough to support complex queries and presentation. Mike
presented Drupal, Drupal Views, and PHPTemplate as an alternative web
framework for providing a web interface to Chado databases. Mike
demonstrated a prototype called DrupalFly that presents FlyBase data in
an alternative organization.

[Lincoln](/wiki/User:Lstein) has an opening in Toronto for a
full time programmer. Lincoln will talk with Brian about
[GMODWeb](/wiki/GMODWeb)'s future. We will put something on web site
asking for volunteers to take on GMODweb.

### GMOD Participating Organizations

A number of organizations talked about their recent work.

#### ApiDB

**Presentation:** <a
href="http://mango.ctegd.uga.edu/jkissingLab/presentations/GMOD_Nov_2007.ppt"
class="external text" rel="nofollow">ApiDB GBrowse update</a>, Haiming
Wang

[Steve Fischer](/wiki/User:Stevef) talked about ApiDB. ApiDB
uses GUS as their schema. They do multispecies comparative analysis.
They have a database adapter link from GBrowse to GUS. It is based on
the Chado adapter. They use materialized views in Oracle 10G and it is
still relatively slow.

##### Synteny at ApiDB

See [SynView](#Synview) above for details on SynView.

Syntenic maps at ApiDB are produced with Mercator. The maps are based on
gene orthology. Gene orthologs are generated using OrthoMCL. All
alignments are pairwise, rather than multiple. Orthology is represented
outside standard GUS schema. In the synteny schema, everything is
defined relative to the reference sequence. Also need a table to define
anchors.

[Steve Fischer](/wiki/User:Stevef) showed an 11 track page,
which has about 5000 popups in it.

ApiDB has a release cycle. They discard and recalculate synteny with
every new release.

#### Berkeley National Labs

The Berkeley group is actively involved in supporting and developing
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>, GO, SO,
OBO-Edit, [Phenote](/wiki/Phenote), [Apollo](/wiki/Apollo.1), and
the new [AJAX](/wiki/Glossary#AJAX) [GBrowse](/wiki/GBrowse.1).

#### FlyBase

 has migrated their
production databases to the
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> [database
schema](/wiki/Glossary#Database_Schema). FlyBase uses:

- <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>
- GMOD [XORT](/wiki/XORT.1)
- [Chado XML](/wiki/Chado_XML)
- [Apollo](/wiki/Apollo.1)
- [BioMart](/wiki/BioMart)

##### Synteny at FlyBase

Victor Strelets talked about OrthoView, an extension to
[GBrowse](/wiki/GBrowse.1) for viewing
<a href="/wiki/Synteny" class="mw-redirect" title="Synteny">synteny</a>.

Victor also presented the genetic interactions viewer, a fast way of
visualizing gene interactions. It does not run directly off of the
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> database.

#### GeneDB, Sanger

**Presentation:**
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/be/Workshop.pdf" class="internal"
title="Workshop.pdf">Community Annotation</a>, Chinmay Patel

Chinmay Patel spoke about a week-long annotation project at Sanger
involving 40 people all annotating the same genome.

They used the [Artemis](/wiki/Artemis) annotation editor (instead of
[Apollo](/wiki/Apollo.1)), but Artemis was talking to a
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> database
using an Artemis-Chado Ibatis-based (instead of Hibernate-based)
adapter. The adapter is not yet released. (*But it is now: see
[Artemis-Chado Integration
Tutorial](/wiki/Artemis-Chado_Integration_Tutorial).*)

#### Imperial College London

Using GMOD to support a fungal sequencing project. Using:

- Chado
- GBrowse
- Apollo

#### JCVI (nee TIGR)

Using Chado as database schema.

#### MaizeGDB

Taner Sen from MaizeGDB was at the meeting. Maize has multiple groups
generating different gene models. It would be nice to display each groun
in a separate track. MaizeGDB is evaluating genome browsers and is
considering using GBrowse.

#### ParameciumDB

**Presentation:**
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/ac/CommunityAnnotationNov2007.pdf"
class="internal" title="CommunityAnnotationNov2007.pdf">Community
Annotation</a>, [Linda Sperling](/wiki/User:Sperling)

Use GMOD for almost everything:

- Chado
- Apollo
- Turnkey
- GBrowse

Paramecium is an odd critter (unicellular eukaryote, ciliate clade):

- 72 Mbp
- 40K gene models
  - 12,500 computationally identified potential errors.
- At least 3 whole genome duplication events.
- Nuclear dimorphism. Germline nucleus (not yet sequenced) and somatic
  nucleus (sequenced) which is a rearranged version of the germline
  nucleus, streamlined for gene expression.

Fewer than 20 paramecium molecular biology labs in the world. Database
supported with 1.5 staff.

It is important that people be able to click on a link, launch Apollo,
add some curation and save it. Their Apollo talks directly to Chado (no
triggers). See Community Annotation above for more.

#### Riken

Riken uses GBrowse.

#### University of Maryland Medical Center

Use <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> as a
backend, a lot. Use [Sybil](/wiki/Sybil) for ,
and are a mix of [PostgreSQL](/wiki/PostgreSQL) and Oracle.

#### WormBase / CSHL

**Presentation:** <a
href="http://dev.wormbase.org/presentations/2007/2007.11-GMOD-WormBase/2007.11-GMOD-WormBase.key.tgz"
class="external text" rel="nofollow">Keynote</a>, <a
href="http://dev.wormbase.org/presentations/2007/2007.11-GMOD-WormBase/2007.11-GMOD-WormBase.ppt"
class="external text" rel="nofollow">Powerpoint</a>, <a
href="http://dev.wormbase.org/presentations/2007/2007.11-GMOD-WormBase/2007.11-GMOD-WormBase.pdf"
class="external text" rel="nofollow">PDF</a>, <a
href="http://dev.wormbase.org/presentations/2007/2007.11-GMOD-WormBase/2007.11-GMOD-WormBase.mov"
class="external text" rel="nofollow">Mov</a>, [Todd
Harris](/wiki/User:Tharris)

Wormbase is migrating to Chado slowly. There is currently very little
Chado there.

##### GBrowse_Syn

**Presentation:**
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/58/Gbrowse_syn.pdf" class="internal"
title="Gbrowse syn.pdf">Gbrowse_syn</a>, [Sheldon
McKay](/wiki/User:Mckays)

Sheldon McKay talked about [GBrowse_syn](/wiki/GBrowse_syn.1), a
prototype extension to [GBrowse](/wiki/GBrowse.1) for viewing
<a href="/wiki/Synteny" class="mw-redirect" title="Synteny">synteny</a>. Goal
is to have a *sequence* alignment viewer that can look at more than two
species at a time. GBrowse_syn is based purely on sequence alignments.
It does not know about genes or orthologs per se.

Used PECAN for the alignments. Maps are precomputed in a very
CPU-intensive step.

<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> may or may
not support multiple alignments.

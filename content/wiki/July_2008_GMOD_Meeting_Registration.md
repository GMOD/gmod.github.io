---
title: "July 2008 GMOD Meeting"
---
# July 2008 GMOD Meeting | Scott Cain, Lincoln Stein                          | <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/80/Common_gene_page.ppt" class="internal" | title="Common gene page.ppt">PPT</a> | 11:30                                | Lunch                                                                                                      | 1:30                                 | More Show and Tell or a mini hackathon or go see Toronto                                                   |                                      | Traits at SGN                                                                                              | Lukas Mueller                                      | CellFrame                                                                                                  | Yunchen Gong                                       | Matching Gene Names to Articles at Xenbase                                                                 | Jeff Bowes                                         | [Django and Chado](/wiki/Chado_Django_HOWTO) - A user interface exploration                 | Victor de Jager                                    # Attendees

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3d/GMOD2008Attendees.JPG" width="400"
height="148" alt="GMOD2008Attendees.JPG" />

1.  David Arcoleo -
    <a href="http://beespace.uiuc.edu" class="external text"
    rel="nofollow">BeeSpace</a>, University of Illinois
2.  Brad Arshinoff -
    <a href="http://xanthusbase.org" class="external text"
    rel="nofollow">XanthusBase</a>
3.  Jeff Bowes - <a href="http://xenbase.org" class="external text"
    rel="nofollow">Xenbase</a>
4.  [Robert Buels](/wiki/User%253ARobertBuels) -
    <a href="http://www.sgn.cornell.edu" class="external text"
    rel="nofollow">Sol Genomics Network</a>
    ([SGN](/wiki/Category%253ASGN))
5.  [Scott Cain](/wiki/User%253AScott) - GMOD
6.  [Dave Clements](/wiki/User%253AClements) -
    <a href="http://nescent.org" class="external text"
    rel="nofollow">NESCent</a>, GMOD
7.  Sean Davey - BirdBase, U of Arizona
8.  Victor de Jager
    <a href="http://www.cmbi.ru.nl" class="external text"
    rel="nofollow">University of Nijmegen, The Netherlands &amp; Centre for
    Molecular and Biomolecular Informatics</a>
9.  Mary E Dolan
    <a href="http://www.informatics.jax.org/" class="external text"
    rel="nofollow">Mouse Genome Informatics, The Jackson Laboratory</a>
10. [Ben Faga](/wiki/User%253AFaga) - CSHL
11. Yunchen Gong - <a href="http://utoronto.ca" class="external text"
    rel="nofollow">University of Toronto</a>
12. [Josh Goodman](/wiki/User%253AJogoodma) -
    [FlyBase](/wiki/Category%253AFlyBase)
13. [Todd Harris](/wiki/User%253ATharris) -
    <a href="http://www.wormbase.org/" class="external text"
    rel="nofollow">WormBase</a>
14. [Chris Hemmerich](/wiki/User%253AChemmeri) - Center for
    Genomics and Bioinformatics, Indiana U.
15. <a href="http://biowiki.org/IanHolmes" class="external text"
    rel="nofollow">Ian Holmes</a> - UC Berkeley
16. [Jim Hu](/wiki/User%253AJimHu.1) -
    <a href="http://ecoliwiki.net/" class="external text"
    rel="nofollow">EcoliWiki</a>, Texas A&M
17. Thomas Keane -
    <a href="http://www/sanger.ac.uk" class="external text"
    rel="nofollow">Wellcome Trust Sanger Institute</a>
18. [Ed Lee](/wiki/User%253AElee) -
    <a href="http://www.berkeleybop.org" class="external text"
    rel="nofollow">BBOP</a> and [Apollo](/wiki/Apollo.1)
19. Suzi Lewis - BBOP
20. Margie Manker -
    <a href="http://populargenetics.ca" class="external text"
    rel="nofollow">The Centre for Applied Genomics, Toronto</a>
21. [Sheldon McKay](/wiki/User%253AMckays) -
    <a href="http://modencode.org" class="external text"
    rel="nofollow">modENCODE</a>,
    [WormBase](/wiki/Category%253AWormBase)
22. Lukas Mueller
    <a href="http://www.sgn.cornell.edu" class="external text"
    rel="nofollow">Sol Genomics Network</a>
    ([SGN](/wiki/Category%253ASGN))
23. Brian O'Connor -
    <a href="http://ucla.edu" class="external text" rel="nofollow">UCLA</a>
24. [Joshua Orvis](/wiki/User%253AJorvis) -
    <a href="http://www.igs.umaryland.edu" class="external text"
    rel="nofollow">Institute for Genome Sciences</a>, University of
    Maryland
25. Barry Sanders -
    <a href="http://beespace.uiuc.edu" class="external text"
    rel="nofollow">BeeSpace</a>, University of Illinois
26. Stéphanie Sidibe Bocs -
    <a href="http://cirad.fr" class="external text" rel="nofollow">CIRAD</a>
27. [Richard Smith](/wiki/User%253ARsmith) -
    <a href="http://www.intermine.org" class="external text"
    rel="nofollow">InterMine</a> (and
    [InterMine](/wiki/InterMine))
28. Kevin Snyder -
    <a href="http://www.xenbase.org" class="external text"
    rel="nofollow">Xenbase</a>; University Of Calgary
29. Jason Stajich - UC Berkeley
30. Haiyan Zhang - [FlyBase](/wiki/Category%253AFlyBase)
31. [Junjun Zhang](/wiki/User%253AJunjun) -
    <a href="http://www.tcag.ca" class="external text" rel="nofollow">The
    Hospital for Sick Children, Toronto</a>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/31/GMOD2008Discussion.JPG" width="245"
height="148" alt="GMOD2008Discussion.JPG" />

# GMOD Components

This section covers discussion about the [software
components](/wiki/GMOD_Components) in GMOD. For a summary of
talks and discussion on how those components are used at particular
databases, see the [GMOD User Community](#GMOD_User_Community) section.

## Chado

[Scott Cain](/wiki/User%253AScott) spoke on
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>.

The GMOD 1.1 release is in the works. There are no schema changes yet.

### Companalysis Module

Joshua Orvis requested better typing / the use of controlled
vocabularies in the [Chado Companalysis
Module](/wiki/Chado_Companalysis_Module) to better
represent scores that are currently in the [analysisfeature
table](/wiki/Chado_Companalysis_Module#Table:_analysisfeature).
Without it there is no way to keep track of what the scores mean. This
issue was also raised by Brett Whitty at the [2008 GMOD Summer
School](/wiki/2008_GMOD_Summer_School) the week
before.

Also, Joshua (again) proposed the addition of a type_id field to the
analysisfeature table. The use case for this is to allow the distinction
between types of features involved in an analysis. The most direct
examples are 'input_of' and 'created_by' which allow the user to perform
queries of a features role in the analysis. This has been brought up in
previous meetings and in the GMOD mailing list and seems to have had
general approval.

**Action Items**

- get Chris Mungall's input on these issues.

### Natural Diversity Module

[Dave Clements](/wiki/User%253AClements) discussed the Chado
Natural Diversity Module. It was developed at
<a href="http://nescent.org" class="external text"
rel="nofollow">NESCent</a> and NCSU to enable
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> to better
support natural diversity studies. This has been laying dormant for a
while and it would be nice to get it in use by more groups so that we
can better generalize it and make it an official Chado module. Lincoln
pointed out there was grant money to do exactly this.

**Action Items:**

- Dave will follow up with Lincoln.

## Community Annotation System

[Scott Cain](/wiki/User%253AScott) also spoke about his work on the
[Community Annotation
System](/wiki/Community_Annotation_System)
(CAS). The next release of CAS, 1.1, will feature

- Switch from Ubuntu to CentOS.
- [GMODWeb](/wiki/GMODWeb) will be included.
- cas-utils 0.1

### cas-utils 0.1

cas-utils is a set of tools that tie together
[GBrowse](/wiki/GBrowse.1), [Apollo](/wiki/Apollo.1) and
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>. This
includes

- A CGI for selecting a region in GBrowse, extracting the data for that
  region from Apollo and creating an [XML](/wiki/Category%253AXML)
  file and a jnlp (webstart) file for Apollo.
- A CGI for accepting uploads of edited XML files to either be
  immediately loaded into Chado or to be held for validation.
- A configuration Perl module to make modifying the CGI's behavior easy.
- A Module::Build based installer that queries the user for needed setup
  data.

cas-utils is now available for <a
href="http://sourceforge.net/project/showfiles.php?group_id=27707&amp;package_id=284978"
class="external text" rel="nofollow">download</a>.

## TableEdit

[Jim Hu](/wiki/User%253AJimHu.1) spoke about progress on
[TableEdit](/wiki/TableEdit.1), currently at release 0.8.

- Now refuses edits until user entered HTML tags are closed, thus
  avoiding nasty side effects.
- Round trip between MediaWiki and
  <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> is not yet
  done.
  - Chado to MediaWiki is done, vice versa is not.

## Apollo

Ed Lee, lead developer for [Apollo](/wiki/Apollo.1) spoke about
enhancements to Apollo that have happened since he started working on it
last September:

- undo function
- preferences editor
- Chado adapter enhancements
- Improved graph and GFF3 support

## InterMine

Richard Smith spoke about [InterMine](/wiki/InterMine), a query
optimized data warehouse system for biological data. Has the ability to
create precomputed tables (a la materialized views) at any time (and do
this from the GUI) in response to popular query patterns. Also supports
query templates, which are fill-in-the blank versions of popular
queries.

InterMine is written in [Java](/wiki/Category%253AJava). It has
one class per Sequence Ontology (SO) term, and use Java class
inheritance for _is_a_ relationships. _part_of_ relationships are
implemented with Java references and collections.

## CMap

[Ben Faga](/wiki/User%253AFaga) gave a talk on what's new in
[CMap](/wiki/CMap.1). Some highlights:

- CMap 1.0 came out in March 2008.
- ribbon displays for syntenic blocks
- dotplot displays
- new feature glyphs
- embeddable image generation
- directory guessing for easier installation.

## GBrowse

Three talks gave us the [GBrowse](/wiki/GBrowse.1) roadmap. Talks
covered the next incremental release (1.69), and the next two major
releases (2 and 3).

### GBrowse 1.69

[Sheldon McKay](/wiki/User%253AMckays) and [Lincoln
Stein](/wiki/User%253ALstein) spoke about recent enhancements to
[GBrowse](/wiki/GBrowse.1). These features are available in the
current development version ("stable") of GBrowse and will be included
in the upcoming (some would say imminent) 1.69 release of GBrowse.

- Wiggle - Dense quantitative tracks, density can have colored peaks,
  and go below 0.
- Quantitative (BP resolution) data.
- Inline track configuration.
- Design Primers
- Rubberbanding
- Popup windows (with a nice example showing
  [WormBase](/wiki/Category%253AWormBase) anatomy cartoons)
- Draggable tracks
- Easy-share tracks
  - DAS server is inside GBrowse. Also a web service.
  - Can now have one GBrowse server share a track with another GBrowse
    server.
  - Data is transferred on the fly, as the user naviages the genome.
  - Can form chains of sharing.
- [Galaxy](/wiki/Galaxy.1) Integration.
  - Within Galaxy click on the get data link.
  - Lists data sources including BioMart and WormBase GBrowse.
- Multiple Alignment Format (MAF) and conservation tracks.

### GBrowse 2

[Lincoln Stein](/wiki/User%253ALstein) talked about GBrowse 2, the
next major release of GBrowse. This release focuses on performance and
stability. GBrowse 2 will be cluster aware:

- Tracks can be assigned to read data from specific data servers, and
  render tracks using specific render servers.
- Assignment of machines as data and/or render servers is configurable.
  - A server can be a data server or a render server or both,
  - A track may have multiple data and render servers.
  - A single node can serve data and rendering for one or more tracks.
- Tracks loaded with [AJAX](/wiki/Category%253AAJAX). Grayed out
  until they load.
- Turning tracks on and off no longer requires a reload.

Our experience is that the database is usually the bottleneck with
existing GBrowse installations.

- Can also enable editing of feature comments.

### GBrowse 3

_GBrowse 3 was renamed [JBrowse](/wiki/JBrowse.1) after this
meeting._

Ian Holmes presented his group's work on [GBrowse
3](/wiki/JBrowse.1), a complete rewrite of
[GBrowse](/wiki/GBrowse.1) using a Web 2.0 style interface. Mitch
Skinner has done most of the coding work on this.

Most tracks are now rendered in client using JavaScript. Tracks such as
wiggle tracks can also still be rendered on the server.

GBrowse 3 uses nested containment lists to quickly determine what
features to display. These are 5 to 500x faster than R-trees. The group
is using the <a href="http://modencode.org" class="external text"
rel="nofollow">modENCODE project</a> as a target test audience.

Ian made the observation that when you are asking for guidance on GUIs,
you need large sample sizes. Small sample sizes lead to a large set of
suggestions with very little overlap between users. Large sample sizes
enables you to identify a core set of requests.

#### Genome Wiki

Ian would like to move GBrowse 3 in the direction of being a _genome
wiki_

- Upload tracks and track sharing
- Ability to add comments, ratings, ...
- Requires user management

Genome Wiki is about people sharing tracks, not so much about individual
genes.

#### Approximate Schedule

- 2008?: A Lightweight AJAX Genome Browser
- 2009?: An AJAX Genome Wiki

They are not currently working on a
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> adaptor.
They hope to do that, but probably not soon.

### GBrowse Glyphs Page

At the [2008 GMOD Summer
School](/wiki/2008_GMOD_Summer_School) there were
several requests for a GBrowse glyphs page that

- shows what the glyphs look like,
- what track you might use it with,
- links to any other documentation on the glyph.

Lincoln believes that there is already similar documentation in the
GBrowse distribution.

**Action Items:**

- Dave will investigate further.

## Common Gene Page

[Scott Cain](/wiki/User%253AScott) eerily yet effectively channeled
[Don Gilbert](/wiki/User%253ADongilbert) on the topic of a
[Common Gene Page](/wiki/Common_Gene_Page).

This not the gene page that people see when they come to your web site.
Rather, it is some minimal set of information about a gene in your
organism, stored in XML format, that can be easily accessed and parsed
by other organizations. It is meant to enable easy sharing of
information about genes between GMOD users.

If you've been around GMOD for a while you know that the concept of a
common gene page is almost as old as GMOD itself. We _might_ have
actually moved forward on this at this meeting.

There was discussion on what should be included in the gene page. The
consensus was to keep track of only the minimal amount of information,
See
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/80/Common_gene_page.ppt" class="internal"
title="Common gene page.ppt">Scott's presentation</a> for the list we
settled on.

Uniprot [XML](/wiki/Glossary#XML) may be suitable for this.

### Now What?

Lincoln proposed a CGI script that has a set of predefined hooks for
populating the XML. This could be a Perl program with methods for
fetching data and then passing it to another routine for placing the
data into an XML format. Each organization would write the classes
called by the hooks to get the data from wherever they keep it. Provides
a framework that can be used across multiple organizations and that will
always produce structurally identical XML, no matter how it is
originally stored.

Rob Buells from [SGN](/wiki/Category%253ASGN) produced a prototype
of this program while at the meeting.

**Action Items:**

- ?

### Gene Wiki

We also discussed the
<a href="http://en.wikipedia.org/wiki/Gene_Wiki" class="extiw"
title="wp:Gene Wiki">Gene Wiki project</a>. This project has created
around 7,000 human gene pages in Wikipedia. Wikipedia asked

- Only _interesting_ genes have pages. Interesting was defined as any
  gene with at least one PubMed reference.
- The pages be easy to edit. Moved some nasty tables to the end of the
  page.

Someone might eventually be able to create a MODGeneWiki from GMOD
Common Web Pages.

## MediaWiki Enhancements

[Sheldon McKay](/wiki/User%253AMckays) spoke about MediaWiki related
work he's been doing for the
<a href="http://www.modencode.org" class="external text"
rel="nofollow">modENCODE project</a>.

### FCKEditor

<a href="http://mediawiki.fckeditor.net/" class="external text"
rel="nofollow">FCKEditor</a> is a WYSIWIG editor for MediaWiki, but if
you use it off the shelf it becomes hard for your users to use any other
editor, including the default MediaWiki editor, which they may already
be familiar with. Sheldon has extended FCKEditor to make it optional.
Users now see "edit" "rich edit" links and tabs.

**Action Items:**

- Dave will investigate FCKEditor and the modified version for use in
  the GMOD web site.

### Popup Balloons

Sheldon has also created an extension for creating popup balloons in a
MediaWiki Web Site. See [Popup
Balloons](/wiki/Popup_Balloons) for details. This extension
is installed on the GMOD web site.

### Collapsible Sections Extension

Does what it says - enables users to collapse and expand sections on
pages in MediaWiki.

### Predefined Page Creation Extensions

A set of extensions were created to

- automatically populate pages based on what type of page is being
  created
- generate forms to help users fully populate pages with required
  fields.

These use the Yahoo autocomplettion library.

## APIs

### Perl based Schema Abstraction Layer for Chado

Brad Arshinoff from
<a href="http://xanthusbase.org" class="external text"
rel="nofollow">XanthusBase</a>, (soon to be
<a href="http://wikimods.org" class="external text"
rel="nofollow">WikiMods</a>, [see below](#WikiMods.org)) gave a talk
titled _Perl based Schema Abstraction Layer for
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>_. Brad's
talk (slides unavailable) gave an overview of a
[Perl](/wiki/Category%253APerl)
[middleware](/wiki/Category%253AMiddleware) package for
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> that was
developed at XanthusBase.

#### Discussion

**Q:** [Modware](/wiki/Modware) is a Perl-based Chado API that
already exists. Why not use it?

**A:** Thought this would be less work and a lot less
[SQL](/wiki/Glossary#SQL) than Modware. May or may not have worked
out that way.

Eric Just, the developer of Modware, is no longer at
[DictyBase](/wiki/Category%253ADictyBase). Someone has
replaced him, but we don't know if that person is supporting Modware.

It seems that we have a lot of Perl and Java APIs to Chado, perhaps too
many. What should we do about that? [Lincoln
Stein](/wiki/User%253ALstein) suggested that we document them all
and provide a list of pros and cons for each. That will allow new users
to make the best informed choice about what they want to do.

**Action Items:**

- Dave will create a Chado APIs page.
- Dave will work with Brad to make the middleware available and
  documented.
- Dave will Contact Eric and/or DictyBase about the status of Modware.
  - 2008/08 - Done. Modware is actively being worked on by DictyBase
    staff.

### Chado Java API

Ed Lee presented a talk on the need for a Java interface to to the Chado
schema. He's going to be rewriting the Apollo data model to clearly
define biological concepts and to map well to any of Apollo's potential
data sources, including Chado.

This could be a way to enforce/encourage [Chado Best
Practices](/wiki/Chado_Best_Practices). A current
problem for tool developers (such as the Apollo team) is writing code to
work with Chado, when not all Chado users represent the same biological
concepts in similar ways.

Having a cleanly designed, biological level (as opposed to DBMS table
level) API for Java would help organizations follow best practices when
using Chado. It also would make tool development much easier.

# GMOD User Community

## SGN

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d6/GMOD2008Lukas.JPG" width="120"
height="148" alt="GMOD2008Lukas.JPG" />

Lukas Mueller from [SGN](/wiki/Category%253ASGN) spoke about
community annotation at the
<a href="http://www.sgn.cornell.edu/" class="external text"
rel="nofollow">Sol Genomics Network</a>.

- SGN does annotation on genotype and phenotype.
- Have about 60 community annotators.
- ~130 loci have been edited at least once by community members.
- Easy to use interface. Updates go directly to main database.
- Have assigned some entire gne families to people.
- Lukas actively recruits volunteer editors at meetings.

Lukas also takled about SGN's traits (phenotypes) database. SGN uses a
custom database design for their phenotypic data. (They do not use the
[Chado Phenotype
Module](/wiki/Chado_Phenotype_Module). Suzi Lewis
indicated that her group is working on a new phenotype module for Chado
which will address issues with the current design.)

## WikiMods.org

Brad Arshinoff from
<a href="http://xanthusbase.org" class="external text"
rel="nofollow">XanthusBase</a>, introduced the
<a href="http://wikimods.org" class="external text"
rel="nofollow">WikiMods</a> web site, a collection of MODS for
prokaryotes with small research scommunites. This will replace the
existing XanthusBase site and add an additional organism in the process.
It is scheduled to launch on July 30 2008 with these sites:

- <a href="http://xanthus.wikimods.org" class="external free"
  rel="nofollow">http://xanthus.wikimods.org</a>
- <a href="http://xeno.wikimods.org" class="external free"
  rel="nofollow">http://xeno.wikimods.org</a>
- <a href="http://demo.wikimods.org" class="external free"
  rel="nofollow">http://demo.wikimods.org</a>

They have migrated Chado from Oracle to
[MySQL](/wiki/Category%253AMySQL).

## CellFrame

Yunchen Gong gave a talk about
<a href="http://cellframe.bioknowledge.org/" class="external text"
rel="nofollow">CellFrame</a>, a web site about cell biology and
construction of cell perturbation networks

## Xenbase

Jeff Bowes of <a href="http://xenbase.org" class="external text"
rel="nofollow">Xenbase</a> talked about automatic loading, linking, and
indexing publication abstracts. Xenbase downloads information for every
_Xenopus_ related publication. The abstract is then scanned for gene
names/symbols and other controlled vocabulary terms. The publication is
then associated with those terms and genes in Xenbase.

Xenbase has extended the schema to support this indexing scheme and uses
DB2 Net Extender for indexing (but any indexing tool could be used).
Xenbase also scrapes images from each journal they have an agreement
with. They use a Java class for journals, and every journal has its own
subclass.

## Centre for Molecular and Biomolecular Informatics

Victor de Jager of the University of Nijmegen and the Centre for
Molecular and Biomolecular Informatics, gave a talk on using the Django
web framework with Chado (see [Chado Django
HOWTO](/wiki/Chado_Django_HOWTO) for more). A Django
based web site could be layered on top of the BioObjects proposed by Ed
Lee in his talk.

# GMOD Project

## Google Summer of Code

Last year a Google Summer of Code student worked with Lincoln, and
Hilmar Lapp (at NESCent) on a Google Summer of Code project to add
phyogenetic information to GBrowse. Lincoln and Hilmar liked it enough
that they recommend the program. Lincoln cautions that it is a lot of
work to be a mentor in the program.

**Action Items:**

- Dave will investigate further and encourage the GMOD community to
  participate in the program during the summer of 2009.

## Packages

At the end of the [GMOD Help Desk talk (see below)](#GMOD_Help_Desk),
Dave asked for what else he should be working on. The number one
response was creating GMOD packages that could be installed with Linux
package installers.

Everyone agreed this was an excellent idea, and that it was hard to do,
particularly to keep the packages up to date for all the distributions
you want to support. BioPackages.net would be the place to put them, if
we did this.

Lincoln mentioned that there are 1 year infrastructure grants for this
sort of thing. That would get us where we want to be for a year, but not
after that.

**Action Items:**

- No solution or action item was settled on.

## GMOD Help Desk

[Dave Clements](/wiki/User%253AClements) gave a talk on his first
10 months at the [GMOD Help Desk](/wiki/GMOD_Help_Desk), and
what he is planning doing in the coming months.

### What's Been Done

- [Web
  Site](/wiki/News/Ten_Recent_Web_Site_Changes)
- Outreach - Posters, talks, representation, and promotion
- Education
  - <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/4a/ChadoWorkshopArthopod2008.pdf"
    class="internal" title="ChadoWorkshopArthopod2008.pdf">Chado
    Workshop</a> with Scott @ Arthropod Genomics, ~35 people
  - [2008 GMOD Summer
    School](/wiki/2008_GMOD_Summer_School) with
    Scott, Ed, Ben, 25 students for 2 1/2 days
- Components
  - [MAKER](/wiki/MAKER.1) now part of GMOD.
  - [Phenote](/wiki/Phenote) is on its way.

### What's Planned

#### GMOD User Directory

Planning to [TableEdit](/wiki/TableEdit.1) to make parts of the
GMOD web site be database driven. Plan on having the same core set of
data and a web page for each user. The core data set will describe what
components they use and how, and be implemented in TableEdit tables.
We'll then be able to use that information to also show which users use
a component on each component page, as well as a complete list of users.

This is a continuation of the _community portal_ idea that was started
in the past 10 months. This will help new and existing users get a
handle on who is using which components for what kind of biology.

#### User Experience Logs

We can't possibly describe or maintain HOWTO pagess for all possible
combinations of operating system (in all their versions), external
software (BioPerl, Java, libgd,... - in all their versions), and GMOD
Components (in all their possible versions and combinations).

However, if we made it easy for GMOD users to record their experiences
installing whatever combination they are using then that might be a
useful approximation. New users would then be able to find several
possible workarounds when they, for example, can't get libgd to work.
Maybe one of the workarounds will even be for there Linux distribution.

We already have several such logs on the web site.

Dave will create a plan for

- organizing user logs in the web site,
- making it easy to do so, and
- encourage users to do this.

#### Documentation

- Components
  - [Chado Documentation
    Reorganization](/wiki/Chado_Documentation_Reorganization)
    - Chado API doc
  - [GBrowse](/wiki/GBrowse.1) doc, including cookbook and glyphs
    page.
  - [Community Annotation
    System](/wiki/Community_Annotation_System)
  - [TableEdit](/wiki/TableEdit.1)
  - Better document (and encourage tighter) integration between
    [Galaxy](/wiki/Galaxy.1), [InterMine](/wiki/InterMine),
    [BioMart](/wiki/BioMart) and the other GMOD components.
  - Tutorials - screencasts for sophisticad user interfaces, perhaps
    [GBrowse](/wiki/GBrowse.1), [Apollo](/wiki/Apollo.1) and
    [CMap](/wiki/CMap.1)
- Web site upgrade
  - New MediaWiki
  - TableEdit
  - Better searching
  - New skin.

#### [GMOD Logo Service](/wiki/GMOD_Logo_Program)

<a href="http://zfin.org" class="external text"
rel="nofollow">ZFIN's</a> current logo was designed several years ago by
Kari Pape, a student in a University of Oregon design class. Judy
Sprague, ZFIN's manager, worked with the professor and the students to
communicate what ZFIN was all about and at the end of the quarter we had
about 20 designs to pick from, and most of them were spectacularly good.

Many GMOD user databases, web sites, and GMOD components don't have
snazzy logos. [Dave](/wiki/User%253AClements) offered to contact
the same department and the local community college as well, and ask if
they would be interested in doing something similar GMOD community. This
time around I would propose that each student or team get a different
database/web site/component.

This was clearly the most popular idea Dave has ever had during his time
at GMOD. I'll investigate ASAP. (_See [GMOD Logo
Program](/wiki/GMOD_Logo_Program)._)

#### [Education and Outreach](/wiki/Training_and_Outreach)

- [2009 Summer
  School](/wiki/2009_GMOD_Summer_School_-_Americas)
- [GMOD Course in
  Europe?](/wiki/2009_GMOD_Summer_School_-_Europe)
- [Conferences](/wiki/Training_and_Outreach#Workshops.2C_Presentations_and_Posters)
  - [PAG](/wiki/PAG_2009), Arthropod Genomics, IPlant
- Special emphasis on [comparative
  genomics](/wiki/Comparative_Genomics) and community
  annotation.

#### Grants

The Help Desk now offers to review grant proposal prior to submission to
help them fully state how much they can use GMOD components, and thus
avoid reinventing the wheel for their project.

We will also start suggesting that grants that propose using GMOD
components also include a limited amount of funding for GMOD in the
grant. This could either be core project funding, funding for existing
components or funding for new components to become part of GMOD.

# Agenda Proposals

If you have something you want to be on the agenda at this meeting
please add it below.

- The AJAX-GBrowse project, as demo'd at
  <a href="http://genome.biowiki.org/" class="external free"
  rel="nofollow">http://genome.biowiki.org/</a> - Ian Holmes
- [InterMine](/wiki/InterMine) and
  <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> Richard
  Smith ([Scott](/wiki/User%253AScott) 14:04, 6 June 2008 (EDT))
- Advances in the [Common Gene
  Page](/wiki/Common_Gene_Page) effort (see also here an
  old page at blog.gmod.org:
  <a href="http://blog.gmod.org/common_gene_pages" class="external free"
  rel="nofollow">http://blog.gmod.org/common_gene_pages</a> , as well as
  Don Gilbert's page on the topic on his server:
  <a href="http://eugenes.org/gmod/gene-report-examples/"
  class="external free"
  rel="nofollow">http://eugenes.org/gmod/gene-report-examples/</a> )
  ([Scott](/wiki/User%253AScott) 14:04, 6 June 2008 (EDT))
- TableEdit round trip/integration progress and plans
  --[JimHu](/wiki/User%253AJimHu.1) 18:35, 6 June 2008 (EDT)
- Java Chado data model API with higher level, user friendly
  "Biological" layer [Ed](/wiki/User%253AElee)
- GBrowse 1.69 show and tell [Sheldon McKay](/wiki/User%253AMckays)
- MediaWiki enhancements [Sheldon McKay](/wiki/User%253AMckays)
- [GMOD Help Desk](/wiki/GMOD_Help_Desk) - [Dave
  Clements](/wiki/User%253AClements)
  - priorities for 2008-2009
  - Evaluation - Has the Help Desk been helpful? -
    [Dave](/wiki/User%253AClements) and [Don
    Gilbert](/wiki/User%253ADongilbert)
  - Grant review service
  - Funding GMOD
  - GMOD and the Google Summer of Code in 2009?
  - The Chado Natural Diversity module
  - [Galaxy](/wiki/Galaxy.1) Integration. [Galaxy](/wiki/Galaxy.1)
    already integrates with [BioMart](/wiki/BioMart), and the
    current (May 2008) development version of
    [Galaxy](/wiki/Galaxy.1) integrates with the current (May 2008,
    1.69 Beta, e.g. "stable") development version of
    [GBrowse](/wiki/GBrowse.1). Once this goes to production in both
    Galaxy and GBrowse, should Galaxy work on integrating with other
    GMOD components such as
    <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> or
    [InterMine](/wiki/InterMine)?

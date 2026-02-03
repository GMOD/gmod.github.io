---
title: "June 2007 Progress Report"
---
# June 2007 Progress Report

  Overview](#Overview)
  - [Meetings](#Meetings)
  - [New GMOD
    homepage and better
    documentation](#New_GMOD_homepage_and_better_documentation)
  - [Software
    releases](#Software_releases)
  - [Users](#Users)
- [Chado/FlyBase](#Chado.2FFlyBase)
- [GBrowse](#GBrowse)
- [Textpresso](#Textpresso)
- [CMap](#CMap)
- [Pathway
  Tools/BioCyc](#Pathway_Tools.2FBioCyc)
- [Apollo](#Apollo)
  - [Specific
    Aims](#Specific_Aims)
  - [Studies
    and Results](#Studies_and_Results)
  - [Significance](#Significance)
  - [Plans](#Plans)
  - [Project
    Generated Resources](#Project_Generated_Resources)
- [RGD](#RGD)
- [dictyBase/Modware](#dictyBase.2FModware)
  - [dictyBase](#dictyBase)
  - [Modware](#Modware)
- [Genome
  Informatics Lab, Indiana
  U.](#Genome_Informatics_Lab.2C_Indiana_U.)
  - [Model
    Organism/Genome Database
    efforts](#Model_Organism.2FGenome_Database_efforts)
  - [GMOD User
    Interface Caucus](#GMOD_User_Interface_Caucus)
  - [GMODTools
    updates](#GMODTools_updates)
  - [Genome
    Data Grid Tools](#Genome_Data_Grid_Tools)
  - [Publications and
    outreach](#Publications_and_outreach)
- [TAIR](#TAIR)

## Overview

Progress report submitted by Scott Cain, GMOD Coordinator.

In the past nine months since the last progress report (see the 2006
progress report at
<a href="http://blog.gmod.org/files/GMOD_2006_update.doc"
class="external free"
rel="nofollow">http://blog.gmod.org/files/GMOD_2006_update.doc</a>), the
GMOD project has show significant progress in several areas. There have
been meetings, software releases and the GMOD website was revamped to
make it more useful and intuitive to users.

### Meetings

Since the last progress report, there was a meeting held in conjunction
with the Plant and Animal Genome meeting in San Diego in January of
2007. Full reports were written and are available on the GMOD website;
see <a href="http://www.gmod.org/wiki/index.php/MOD_Face_Summary"
class="external free"
rel="nofollow">http://www.gmod.org/wiki/index.php/MOD_Face_Summary</a>
for the summary of what was covered the first day when model organism
database user interfaces was discussed, and
<a href="http://www.gmod.org/wiki/index.php/GMOD_Middleware"
class="external free"
rel="nofollow">http://www.gmod.org/wiki/index.php/GMOD_Middleware</a>
for the summary of the second day of the meeting, when software
interfaces (i.e., middleware) for Chado were discussed. The meeting was
well attended by approximately 60 people representing more than 25
database projects and organizations.

Two meetings are planned for the remainder of the year. The first, to be
held August 23 and 24 at DictyBase at Northwestern University in Chicago
will be a GMOD 'Hackathon', where a small group of developers will
gather to address pressing development needs for core GMOD software
functionality. A larger GMOD meeting will be held following the Genome
Informatics meeting at Cold Spring Harbor Laboratory on November 5-7.

### New GMOD homepage and better documentation

Based on a documentation requirements analysis conducted by Brian
Osborne within the context of the GMOD documentation and helpdesk
initiative spearheaded by NESCent
(<a href="http://www.nescent.org/" class="external free"
rel="nofollow">http://www.nescent.org/</a>), it became apparent at the
GMOD meeting in January that the GMOD homepage and the on-line
documentation needed to be revamped to make it more accessible to the
user community. As one of the results, the GMOD website was moved from a
Drupal-based content management system to the wiki format (based on the
open source MediaWiki software), which is much more familiar to many
developers, and allows for better and easier structuring of the
documentation. Spearheaded by Brian Osborne and NESCent, considerable
effort was put into collecting, organizing, and where necessary,
creating documentation for various GMOD components. The old GMOD website
remains as <a href="http://blog.gmod.org/" class="external free"
rel="nofollow">http://blog.gmod.org/</a>, where it is used as a weekly
project update tool for several of the developers working on GMOD
projects.

### Software releases

Several GMOD software packages have been released since the last
progress report, the details of some of them are outlined in sections
below. The packages include:

- GBrowse 1.66, 1.67, and 1.68
- GMODWeb 1.1
- XML-XORT-0.007
- Textpresso 2.0

Also of interest in this area is the preparation for the next release of
the core GMOD software, comprising and updated Chado schema and tools
for interacting with the database. The scheduled release is timed to
correspond to the August Hackathon at DictyBase.

### Users

While it is difficult to have an accurate accounting of how many users
an open source prioject has, GMOD has been quite successful as far as we
can tell in attracting users for its software. There are approximately
15-20 known users of Chado, including new users at BeetleBase, SmedDB (a
planaria database) and Sol Genomics Network (a Solanaceae genome
database) and VectorBase (a database for Invertebrate Vectors of Human
Pathogens). A list of known GMOD users is at
<a href="/wiki/GMOD_Users"
class="external free"
rel="nofollow">http://gmod.org/wiki/index.php/GMOD_Users</a>.


Several GMOD projects submitted project reports to be included with the
report and follow below.

## Chado/FlyBase

All FlyBase data is now being managed in chado. The vast majority of
curated and bulk data is processed into chadoXML using WriteChadoMac.pm,
and loaded using XORT. XORT is also used for all data dumping for
generating public web pages as well as data for curation support.

1.  Chado schema work:
    - Modifications of chado schema to improve support of
      genetic/phenotypic data.
    - Continued work on integration of genetic/phenotypic data with
      genome data in chado.
    - Published paper (Bioinformatics - In Press):

      Title: A Chado Case Study: An Ontology-based Modular Schema for
      Representing Genome-Associated Biological Information
      Author(s): Christopher J Mungall, David B Emmert and The FlyBase
      Consortium
      Suzanna Lewis will present this paper at ISMB/ECCB, July 21-25,
      2007, Vienna, Austria.
2.  Perl module for generating chadoXML XML::DOM elements:
    WriteChadoMac.pm
    This module provides methods for writing chadoXML elements for most
    types of chado data, which can then be loaded using XORT.
3.  XORT:
    - Performance improvements:
      - Redesign of dumping methods to handle large data output and
        significantly reduce dump time.
      - Implementation of entity declarations to support non-ASCII
        characters in chadoXML.
      - Add functionality to support "limit", "distinct on", "group by",
        and "order by" SQL query operations.
    - Bug fixes:
      - Fix bugs for regular expression in parsing dumpspec files.
      - Fix warning messages.
    - Development of XORT dumpspecs for dumping various aspects of
      FlyBase data
4.  Development of a suite of XSL templates which translate chadoXML
    into HTML reports, GFF, FASTA files, and FlyBase search optimized
    database.
5.  Continued work on improving FlyBase search-optimized database and
    investigation of implementing BioMart.
6.  GBrowse:
    - Further development of PureGFF adaptor.
    - Plan is to submit this to GMOD later this summer after further
      testing by external testers to ensure that it works outside of FB
      environment.
7.  Active chado databases at FlyBase:
    Currently in chado

    - D. melanogaster genome, annotations, genetic & phenotypic data.
    - D. pseudoobscura genome and annotations

    Additional genomes in the process of being implemented in chado at FlyBase

    - D. simulans genome and annotations
    - D. sechelia genome and annotations
    - D. yakuba genome and annotations
    - D. erecta genome and annotations
    - D. ananassae genome and annotatons
    - D. persimilis genome and annotations
    - D. willistoni genome and annotations
    - D. mojavensis genome and annotations
    - D. virilis genome and annotations
    - D. grimshawi genome and annotations
8.  In development:
    CHIA - Chado Interface Application
    A java user interface integrating XORT dumper and loader
    functionality, pre-defined chado SQL query execution, ad hoc chado
    SQL queries execution, and simple reports of chado data.

## GBrowse

Report submitted by Lincoln Stein

Over the past year we have begun major rearchitecture work on GBrowse to
make it faster and more scalable. The chief of these rearchitecture
steps has been to make it possible for individual GBrowse tracks to be
rendered in parallel on a compute cluster. This will avoid the current
penalty of rendering slowing down as additional tracks are added. This
version is currently under active development and is not sufficiently
stable for production use.

Other GBrowse enhancements are more incremental and are available on the
production branch. These include "balloon tips", a "lensing" interface
that allows additional detail to be added to a displayed feature without
cluttering the screen. Balloon tips can also be used to attach HTML
menus and query forms to a feature. We've also created glyphs
specialized for displaying high-density data, such as DNA tiling array
data.

## Textpresso

*a text mining system for scientific literature*

Report submitted by Hans-Michael Muller.

The new version Textpresso 2.0 is now the official version used for
running the website. Its functionality has been expanded in many ways;
we have introduced a filter function for the initial search result,
which can be used to tailor the output further, such as restricting the
results to certain years of publication. Search results can now be
requested in XML format, which can be used for further computational
processing by the user. The new system has been packaged and documented,
so users can download the software and install it on their own machines.
It will be released Mid June 2007.

We are now running Textpresso sites for three different literatures and
have expanded the corpora for each site. As of June 2007, the C. elegans
site had 8700 full text papers and 23000 abstracts and the D.
melanogaster site contains 27500 full text papers and 54500 abstracts.
Our neuroscience site has 15800 full text papers and 17300 abstracts. We
have improved our full text and bibliography acquisition routines to
automate as many steps as possible, and we will periodically update the
corpora to include more papers.

As part of implementing the D. melanogaster site, we were faced with the
problem of word sense disambiguation. Textpresso marks up biological
entities such as gene names so they can subsequently be searched for in
the full text to make searches more specific. Many D. melanogaster gene
names are shared with common English names such as 'a', 'for',
'wingless', and 'we'. We therefore developed a machine learning
algorithm to disambiguate the meaning of a word of phrase. Even though
we achieve an disambiguation accuracy of 90%, the overwhelming frequency
of words such as prepositions and pronouns requires the inclusion of
further information such as font type to identify gene names, as many
gene names are written in italics in literature. This has improved the
identification significantly.

## CMap

Report submitted by Ben Faga.

We continue to optimize CMap for speed and useability. A major new
feature over the past year has been the ability to stack maps on top of
each other. This is particularly suitable for comparing a large-scale
map, such as a genetic map, with many smaller-scale maps, such as BAC
contigs. Another important feature is the interface for adding
comparative maps. We now use AJAX technology to dynamically update the
page, giving the user a more intuitive and interactive interface to this
key function. A new view has been added to display correspondences in
dot plot format. The installation process was modified to better
identify directories where CMap components should be installed. The
installation script can now set up a demo CMap data source which will
allow a new user to see CMap with data immediately after installation. A
network install script was created (modified from the GBrowse network
install script). This script will download the CMap distribution and any
prerequisites not found on the machine. When that is done, it installs
CMap. Other minor enhancements have been made.

Work on the CMap Application Editor has continued. The CMap Assembly
Editor (CMAE) is a desktop application being developed to assist in
visualizing and editing large scale sequence assemblies for the maize
sequencing project. CMAE will display sequence assemblies together with
diverse mapping data in a tiered manor, giving a finisher a fuller
context when making decisions. CMAE allows the finisher to move, merge
and break maps. These changes can then be saved to the CMap database and
exported to an external script which can modify the source data. CMAE
can access data on the local machine or remotely using a web server
running a specially configured CMap. CMAE can also interpret an XML
document with specific maps to view which lets a script, designed to
look for problem sections, to create specific views for a finisher to
examine.

## Pathway Tools/BioCyc

Report submitted by Peter D. Karp

Please note that the full history of updates to Pathway Tools can be
found at URL
<a href="http://bioinformatics.ai.sri.com/ptools/release-notes.html"
class="external free"
rel="nofollow">http://bioinformatics.ai.sri.com/ptools/release-notes.html</a>.

Significant updates funded under this grant since the last report in
August 2006 are as follows.

- Versions 10.5 and 11.0 of Pathway Tools have been released in this
  period.
- 1177 groups have licensed Pathway Tools to date.

During this grant period we we made several extremely significant
bioinformatics advances. We developed a novel method of displaying,
interrogating, and superimposing omics data on the full transcriptional
regulatory network of an organism. We developed a novel method of
viewing omics data in the context of the full genome map of an organism.
We developed a graphical tool for interactively tracing metabolites
through the metabolic network of an organism. And we developed a
completely new database query language, and an associated graphical
interface that allows biologists to intuitively compose database
queries, which are automatically translated by the system into that
database query language.

Significant software enhancements funded by the Pathway Tools grant
during this period include the following.

- **New Genome Overview.** This tool provides a one-screen view of every
  gene on one or more chromosomes and plasmids, and can display omics
  data across those entire replicons. The current version works in
  desktop mode only; in the next release of Pathway Tools, the Genome
  Overview will work through the Web as well. To see the Genome
  Overview, go to <a
  href="http://biocyc.org/desktop-vs-web-mode.shtml#genome-ov#genome-ov"
  class="external free"
  rel="nofollow">http://biocyc.org/desktop-vs-web-mode.shtml#genome-ov</a>.
- **New Regulatory Overview.** This tool displays the transcriptional
  regulatory network of an organism that is defined in a PGDB. The
  network can be interrogated in several ways, such as highlighting all
  genes under a specified Gene Ontology class, and highlighting all
  genes regulated by a specified transcription factor. The current
  version works in desktop mode only; in the next release of Pathway
  Tools, the Regulatory Overview will work through the Web as well. To
  see the Regulatory Overview, go to
  <a href="http://biocyc.org/desktop-vs-web-mode.shtml#reg-ov#reg-ov"
  class="external free"
  rel="nofollow">http://biocyc.org/desktop-vs-web-mode.shtml#reg-ov</a>.

  The Regulatory Overview depends for its operation on an encoding of
  the organism's transcriptional regulatory network within a PGDB.
  Currently, EcoCyc is the only BioCyc PGDB that contains such a
  regulatory network. PGDB authors can define such a network manually
  using the interactive editors within Pathway Tools.

- **Metabolite tracing.** A new metabolite tracing tool allows users to
  visually trace the path of substrates through the metabolic network
  within a PGDB, using the Cellular Overview diagram. To see an example
  of metabolite tracing, go to <a
  href="http://biocyc.org/desktop-vs-web-mode.shtml#metab-trace#metab-trace"
  class="external free"
  rel="nofollow">http://biocyc.org/desktop-vs-web-mode.shtml#metab-trace</a>.
- **New BioVelo Query Language.** We introduce a new advanced query
  language for querying PGDBs called BioVelo. BioVelo is a
  query-by-example system that allows users to construct extremely
  powerful queries using an intuitive graphical interface. BioVelo
  replaces the old Advanced Query Page. Users can construct BioVelo
  queries interactively through the BioCyc
  <a href="http://biocyc.org/query.html" class="external text"
  rel="nofollow">Advanced Query Page</a>,
  <a href="http://biocyc.org/webQueryDoc.html" class="external free"
  rel="nofollow">http://biocyc.org/webQueryDoc.html</a>
  (documentation)\], and they can construct textual queries using
  BioVelo language
  <a href="http://biocyc.org/bioveloLanguage.html" class="external text"
  rel="nofollow">(documentation)</a>.
- Gene ontology assignments (both GO and MultiFun) are now displayed on
  gene-product pages in addition to gene pages.
- New commands Proteins-\>Search by GO Term and Proteins-\>Search by
  MultiFun Term are available.
- **External databases.** The editors now contain a command for creating
  or editing the descriptions of external databases for use in PGDB
  links to those databases.
- The **Pathway Hole Filler** is now fully functional under the Windows
  operating system.
- **Monitor sizing.** Through both the desktop and Web versions, Pathway
  Tools now knows the size of the user's monitor. For example, this
  users to create very large genome browserdisplays by reshaping their
  Web browser to the full screen of a wide-screen monitor.
- **Automatic patch loading.** Whenever Pathway Tools starts up, it now
  performs its Instant Patch command automatically, so that users will
  always be running the latest set of patches.

The following additional enhancements to Pathway Tools were funded by
other projects, but are available to all Pathway Tools users.

- Display of protein features on protein pages has been improved.
- **Google searching.** The Navigator query page now contains a section
  for performing a Google-based search of the PGDB, which uses Google's
  index of a PGDB to perform arbitrary text searches against the PGDB.
- **New All-Search box.** An All-Search box is now present at the bottom
  of every PGDB web page to allow users to perform a new search without
  first clicking to the query page.
- **Name mouse-overs.** Mouseover of compounds, genes, and proteins will
  additionally show all object synonyms.
- **Compound duplicate checking:** The Compound Editor now checks if a
  newly created chemical compound is a duplicate of an existing compound
  in either the current PGDB or in MetaCyc, by searching both the names
  and chemical structure of the new compound.

## Apollo

Report submitted by Suzanna Lewis.

### Specific Aims

The primary aim of the Apollo group over the past year was two-fold: To
sustain our existing users by voluntarily contributing to documentation
and user support; and to secure funding to buttress this minimal support
and extend the capabilities of Apollo.

### Studies and Results

We have assisted and interacted with a number of different groups over
the past year. One of the most interesting examples is with the INRA,
Unite de Biometrie et Intelligence Artificielle (Marie-Josie Cross). This
group is interested in non protein coding RNA (ncRNA) identification in
bacteria and archaea. They were looking for an open source solution that
they could extend for annotating such things as the terminator of
transcription, repeated regions, conserved regions, predicted ncRNA, and
so forth. They used the QSOS method 1.5
(<a href="http://www.qsos.org" class="external free"
rel="nofollow">http://www.qsos.org</a>) for this evaluation, and based
on the metrics of industrialization (documentation, quality method,
installation, easy to use), adaptability (modularity, modification and
extension of code) and data input/output formats allowed, Apollo was
chosen over other commonly used genomic browsing software. We are
planning on working with them to incorporate into the main code base the
following extensions that they have developed:

- Prediction and visualization of the secondary structure of a
  subsequence (item of a new menu RNA)
- Prediction and visualization of RNA/RNA interactions (item of a new
  menu RNA)
- Visualization (graph) of quantitative variables
- Export of chained views

Apollo is being used for teaching purposes at the Dolan Learning Center
in Cold Spring Harbor, Washington University, and most recently at San
Francisco State University. The number of user groups continues to
expand as new genomes are finished. For example, Apollo was used for the
annotation of the honeybee genome.

We are also pleased to report that we have succeeding in our second
goal. Through the National Institute of General Medicine, grant R01
GM080203-01, we will begin new work on July 1, 2007.

### Significance

The highest-quality annotation is obtained by combining automated
sequence analysis results with the expert knowledge of biologists.
Apollo is a cross-platform annotation editing tool that streamlines this
process by providing an interactive graphical display that allows
biologists to view many different computational analyses of a genomic
region and use them, together with their knowledge of direct
experimental results, to create and refine detailed annotations.

### Plans

Our new work is focused on the following specific aims:

1.  We will enable Apollo to annotate a wider range of sequence feature
    by using the Sequence Ontology. This will also improve Apollo's
    interoperability with other biological data sources.
2.  We will implement a configuration interfaces to make it easier for
    researchers to set preferences and display new data sources.
3.  We will develop additional editors. One that will allow gene models
    to be modified in direct reference to multiple alignment data, and
    another to edit repetitive elements in detail.
4.  We will improve the analysis import code, documentation, and user
    interface to increase its ease of use, to enable biologists to more
    easily add on-demand analyses of their sequence of interest to the
    data being displayed.
5.  We will continue our Apollo support and outreach efforts, including
    including workshops and on-site visitsand training curricula for
    both biologists and software developers.

The work will be done in collaboration with The Arabidopsis Information
Resource (TAIR) at the Carnegie Institution.



### Project Generated Resources

This work has generated software and associated documentation that is
freely available to other investigators. These can be accessed in from
the GMOD web site at <a href="http://www.gmod.org/wiki/index.php/Apollo"
class="external free"
rel="nofollow">http://www.gmod.org/wiki/index.php/Apollo</a>.

## RGD

Report submitted by Simon Twigger

RGD continues to use the GMOD GBrowse to provide genome browser
functionality at RGD. We are using our GMOD Flash GViewer as part of our
disease portals and will be replacing our older SVG-based GViewer use on
our ontology report pages with the Flash GViewer in the coming year.
Flash GViewer has been a popular download and is in use by a number of
sites, for example:

- Horse Genome
  <a href="http://www.biokao.com/gviewer.html" class="external free"
  rel="nofollow">http://www.biokao.com/gviewer.html</a>
- Boston University
  [Phenotype](/wiki/Category%253APhenotypes) Browser
  <a href="http://gmed.bu.edu/" class="external free"
  rel="nofollow">http://gmed.bu.edu/</a>
- Apropos annotation tool
  <a href="http://apropos.rubyforge.org" class="external free"
  rel="nofollow">http://apropos.rubyforge.org</a>

We will be working on improving the rendering of larger datasets in
GViewer, particularly on the zoomed view of a chromosome. The layout
function works effectively for smaller numbers of features but becomes
unwieldy at larger numbers of features. We would also like to increase
the link out options to provide access to more than one external link
for a feature or region.

## dictyBase/Modware

### dictyBase

- Incorporated phenotype annotations
- Wrote and deployed Ajax based phenotype curation tool
- Added annotations for tRNAs, Pseudogenes and ncRNA genes in Chado
- Added community annotation site (Mediawiki page) for each gene
- Rewrote search engine and display code for website



### Modware

- First release May, 2006
- Second release Jan, 2007
- Last year was primarily concerned with launching Modware
- We are applying for funding expand Modware to cover more use cases and
  to train users

## Genome Informatics Lab, Indiana U.

*Progress report, 2006/July - 2007/June, Don Gilbert*

### Model Organism/Genome Database efforts

Significant effort during this 2006/2007 period was devoted to data
updates and management efforts for wFleaBase (Daphnia), DroSpeGe
(Drosophila) and Bionet news groups.

The Daphnia genome database
(<a href="http://wFleaBase.org/" class="external free"
rel="nofollow">http://wFleaBase.org/</a>) has been updated with several
new genome data components for this emerging model organism's public
genome release in July 2007. These include gene predictions including
NCBI's Gnomon, JGI's models, and GIL contributions, EST/cDNA assemblies
with a gene validation assessment (using TIGR's PASA pipeline), BioMart,
GBrowse, and Blast updates.

The DroSpeGe comparative genome database of twelve Drosophila species
(<a href="http://insects.eugenes.org/DroSpeGe/" class="external free"
rel="nofollow">http://insects.eugenes.org/DroSpeGe/</a>) has been
updated with several annotation contributions from the genome
informatics community, and efforts from GIL for various genome
summaries, phylogenetic identification of 1000's of new D.melanogaster
genes, analysis of gene gain/loss in GO groups,

Bionet/BIOSCI news and discussion groups
(<a href="http://www.bio.net/" class="external free"
rel="nofollow">http://www.bio.net/</a>) provides world-wide public
discussion in several areas of biosciences. These include several model
organism communities (arabidopsis, yeast, celegans, drosophila,
zebrafish, chlamydomonas).

### GMOD User Interface Caucus

Organization and introduction was prepared for the MOD Face caucus, Jan
2007. The user interface (UI) arguably has the most direct impact on the
satisfaction of its users. On the first day of the January 2007 GMOD
meeting, we shared experiences, discussed lessons learned, and
identified unsolved problems in the field of MOD user interface design.
Representatives of several MODs (including both model and multi-organism
databases) presented aspects of their UI that related to a common set of
use cases. This brought to light several useful topics that that are not
widely known, and that new and old MODs can benefit from. See
<a href="http://www.gmod.org/MOD_Face_Summary" class="external free"
rel="nofollow">http://www.gmod.org/MOD_Face_Summary</a>

### GMODTools updates

Genbank to Chado worked example: This package provides updates for GMOD
and Bioperl tools, to simplify creating Chado genome databases using
NCBI GenBank genomes. This includes contributions to GMOD and BioPerl
shared code base. GBrowse Chado Editor: This May 2007 addition is a
simple way to add community annotations to Chado database. See
<a href="http://iubio.bio.indiana.edu/gmod/genbank2chado/"
class="external free"
rel="nofollow">http://iubio.bio.indiana.edu/gmod/genbank2chado/</a>

### Genome Data Grid Tools

Software tools to fully assembly, analyze and compare these genomes are
available, but the ability to employ them is limited to those with
extensive computational resources and engineering talent. In this
project, methods are being developed for use by existing and emerging
model organism databases that will address genome database access needs
and middleware for comparative analyses. Effective use of shared
cyberinfrastructure, such as NSF-sponsored TeraGrid and other Grid
systems, is a problem today for bioinformatics. The planned work in this
area addresses these problems with data grid methods that partition
large genome database sets for effective use of Grid systems.
PRELIMINARY: <a href="http://gmod.cvs.sourceforge.net/gmod/genogrid/"
class="external free"
rel="nofollow">http://gmod.cvs.sourceforge.net/gmod/genogrid/</a>

### Publications and outreach

- Gilbert, D.G., 2007. DroSpeGe: rapid access database for new
  Drosophila species genomes. Nucleic Acids Research, Vol. 35, Database
  issue D480-D485 doi:10.1093/nar/gkl997
- Gilbert, D.G., 2007. Drosophila species genome analyses. <a
  href="http://insects.eugenes.org/species/about/analysis-doc/drospege-analysis.doc.pdf"
  class="external free"
  rel="nofollow">http://insects.eugenes.org/species/about/analysis-doc/drospege-analysis.doc.pdf</a>
- Talk, May 2007. Daphnia Genome Annotation, Indiana University.
  <a href="http://wfleabase.org/docs/daph-annot-07may.pdf"
  class="external free"
  rel="nofollow">http://wfleabase.org/docs/daph-annot-07may.pdf</a>
- Poster, May 2007. "Genome Database Construction with GMOD". at
  Bioinformatics Indiana'07 conference
  <a href="http://iubio.bio.indiana.edu/gmod/docs/gmod-bindy07-poster.pdf"
  class="external free"
  rel="nofollow">http://iubio.bio.indiana.edu/gmod/docs/gmod-bindy07-poster.pdf</a>
- GMOD.org documentation. MOD User Interface Caucus, MOD Face Summary,
  MOD Face Talks, MOD, Load BLAST Into Chado, Sample Chado SQL, Sample
  Chado gene report, and miscellaneous. See
  <a href="http://www.gmod.org/" class="external free"
  rel="nofollow">http://www.gmod.org/</a>



## TAIR

During the past year, TAIR has begun to expand its use of GMOD tools:

We used Apollo extensively as a curation tool in preparing our recent
Arabidopsis genome release, TAIR7. We will continue to work with Apollo
for our next genome release and will also participate in a newly funded
project to develop a new transcript editor and other enhancements in
collaboration with Suzi Lewis.

In addition, we are in the process of deploying GBrowse on the
<a href="http://www.arabidopsis.org" class="external text"
rel="nofollow">TAIR site</a>.

---
title: "September 2003 GMOD Meeting"
---
# September 2003 GMOD Meeting

Generic Model Organism Database Construction Set

  3</span>](#Meeting_3)
- [Progress
  Report](#Progress_Report)
  - [PubSearch
    Status Update](#PubSearch_Status_Update)
  - [Pathway
    Tools Status Report](#Pathway_Tools_Status_Report)

## Meeting 3

September 15-16, 2003

The third GMOD working group meeting was held at Lawrence Berkeley
National Laboratory on September 15th and 16th. Below are the
presentations given by the groups represented, and below that is the
text of progress reports they submitted.

- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/71/Chado_pub.ppt" class="internal"
  title="Chado pub.ppt">Chado_pub.ppt</a>
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/be/Cmap_update_sept_03.ppt"
  class="internal"
  title="Cmap update sept 03.ppt">Cmap_update_sept_03.ppt</a>
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ed/Apollo.GMOD.ppt" class="internal"
  title="Apollo.GMOD.ppt">Apollo.GMOD.ppt</a>
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e3/Argos_Lucegene_GDS.ppt"
  class="internal"
  title="Argos Lucegene GDS.ppt">Argos_Lucegene_GDS.ppt</a>
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e6/Gbrowse_update_sept_12_2003.ppt"
  class="internal"
  title="Gbrowse update sept 12 2003.ppt">Gbrowse_update_sept_12_2003.ppt</a>
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f3/Mgi.ppt" class="internal"
  title="Mgi.ppt">Mgi.ppt</a>
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/63/Pathways.ppt" class="internal"
  title="Pathways.ppt">Pathways.ppt</a>
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f8/PubFetch_Vijay.ppt" class="internal"
  title="PubFetch Vijay.ppt">PubFetch_Vijay.ppt</a>
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/0e/PubSearch_09062003.ppt"
  class="internal"
  title="PubSearch 09062003.ppt">PubSearch_09062003.ppt</a>
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b7/Textpresso_GMOD_0903.ppt"
  class="internal"
  title="Textpresso GMOD 0903.ppt">Textpresso_GMOD_0903.ppt</a>
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e8/Turnkey_sept_2003.ppt"
  class="internal" title="Turnkey sept 2003.ppt">Turnkey_sept_2003.ppt</a>



## Progress Report

### PubSearch Status Update

[PubSearch](/wiki/PubSearch) status as 0f 9/05/2003)

Upgrades made to the PubSearch software are as follows:

- Search Interface Cleanup For:
  - Genes
  - Hits
  - Articles
  - Terms
- Cleanup & Finalization of Installation Scripts
  - GUI Interface -- migrated to Java Swing
  - Validating DB connection between PubSearch (Java Servlets) & DB.
  - Automatic Installation of Schema into DB (code re-organization
    required -- In Progress)
  - Auxiliary PubSearch DataFiles
    - Includes Indexing Directories
    - Cached DTD's (from GeneOntology & PubMed)
  - Testing (To Be Performed)
- Generic Schema (generic_pub)
  - Completed (includes: data associated with the Pub database, Table
    name adjustments, Field name adjustments, Data Type Adjustments).
    This effort does not include \`update_history' table (in progress).
  - Installed MySQL 4.0 (to address referential Integrity)
- Development of Data parsers for Bulk Loading
  - Articles (Using Medline Format)
  - Genes
  - Terms
- Schema Documentation
  - Completed the 1st version (addresses \`pub database', documentation
    for \`generic_pub' is yet to be completed)
- Software Documentation
  - In progress

### Pathway Tools Status Report

[Pathway Tools](/wiki/Pathway_Tools.1) status report, by Peter
Karp, September 1, 2003

Please note that the full history of updates to Pathway Tools can be
found at URL

<a href="http://bioinformatics.ai.sri.com/ptools/release-notes.html"
class="external free"
rel="nofollow">http://bioinformatics.ai.sri.com/ptools/release-notes.html</a>

Significant updates funded under this grant since the last report are as
follows.

- A new release of Pathway Tools occurred on August 29, 2003.
- A general import/export facility for frames (DB objects) has been
  added. Sets of frames can be exported to and imported from
  character-delimited files, which can be imported into a spreadsheet
  program, edited, and re-imported. Frames can also be exported to an
  attribute-value format similar to MEDLINE format, and re-imported into
  a different DB.
- An ontology of evidence codes has been added to the Pathway Tools
  schema, in order to capture the evidence (computational, experimental,
  type of experiment, etc.) for the existence of various entities
  (pathways, protein functions, transcription units, etc.) in an
  organism. Pathway Tools has been extended so that the pathway and
  operon predictors within PathoLogic decorate the pathway and operon
  PGDB objects that they create with evidence-code information,
  indicating computationally predicted objects as such. The Editors have
  been extended to include functionality that allows users to
  interactively enter and modify evidence codes within PGDB objects. The
  Navigator has also been extended to display evidence information.
- Changes to the Pathway/Genome Navigator
  - Desktop mode (not Web mode): Several new types of queries have been
    added:
    - Query pathways by reactants and products.
    - Query proteins by molecular weight and pI.
    - Query compounds by conjunctions of name, molecular weight,
      chemical formula, and substructure properties.
- Displays of the parent classes of an instance have been reworked to be
  more intuitive; they now show the complete class inheritance path back
  to the roots of the class hierarchy.
- It is now possible to install Pathway Tools with any of the buttons on
  the main query page (help, pathway tools home, etc.) redirected to a
  custom user-specified URL.
- The list of reactions in the compound display is sorted according to
  the role that the compound plays in each reaction.
- Changes to the Pathway/Genome Editors
  - There is now an editor for RNAs, which also allows the creation of
    RNAs for genes.
  - The compound structure editor now allows charges to be entered along
    with each atom.
- 37 groups have licensed Pathway Tools to date.
- Pathway/Genome Databases available through the web include:
  - *<a href="http://pathway.yeastgenome.org/biocyc/" class="external text"
    rel="nofollow">Saccharomyces cerevisiae</a>*, Stanford University
  - *<a href="http://plasmocyc.stanford.edu" class="external text"
    rel="nofollow">Plasmodium falciparum</a>*, Stanford University
  - *<a href="http://biocyc.org" class="external text"
    rel="nofollow">Mycobacterium tuberculosis</a>*, Stanford University
  - *<a href="http://arabidopsis.org:1555" class="external text"
    rel="nofollow">Arabidopsis thaliana and Synechosistis</a>*, Carnegie
    Institution of Washington
  - *<a href="http://maine.ebi.ac.uk:1555" class="external text"
    rel="nofollow">Methanococcus janaschii</a>*, EBI (availability
    intermittent)
    Chado progress report

     * Schema development (Colin Wiel, Chris Mungall, David Emmert, Stan
       Letovsky)
       * The first production version, tagged �chado_1_01�, released in July,
         2003.
         * This version is sufficient for managing genome sequence and annotation
           data.  The sequence, cv, dbxref, and companalysis modules are
           effectively finished.
       * Plans for FlyBase genetic module review
         * FlyBase developers will meet for four days at the end of October to
           review the genetic and map modules preliminary to integrating FlyBase
           genetic/phenotypic data with genome sequence and annotation already
           in chado.
       * Current development of expression module
         * Allen Day has been working on the expression module in his own branch
           of chado.
       * Current development of pub module
         * Peili Zhang has been working on migrating FlyBase publications data
           into the pub module

     * ChadoXML DTD and related tools (Pinglei Zhou, Stan Letovsky)
       * DTD for ChadoXML and tools which convert database ddl into DTD are
         released on GMOD.

     * XORT- XML Object to Relational Translator (Pinglei Zhou, Stan
       Letovsky)
       * XORT exchanges data between XML file and database. XORT is generic
         enough to handle any relational database as long as schema follows certain
         fairly broad design rules.
       * It includes validator, loader, dumper and XORTDiff.  Dumper is driven
         by dump spec to meet different projects� requirements. XORTDiff, which is
         schema-aware, can compare ChadoXML objects and is very useful in testing.

     * GAME2ChadoXML/ChadoXML2GAME translator (Frank Smutniak, Stan Letovsky)
       * Final debugging is in process as we use this software in the creation
         of D. melanogaster release 3.2.
         * Round-tripping of annotation data is essentially finished
         * Round-tripping of computational analysis data will need additional
           debugging

     * GenBank flat-file format to chadoXML converter (Peili Zhang, Chris
       Mungall)
       * A bioperl module,  chadoxml.pm, is being developed to convert sequence
         and annotation data from whole genome projects deposited in GenBank into
         chadoXML.
       * The module makes use of the Unflattener.pm bioperl module by Chris
         Mungall, which generates chado gene models out of properly formatted
         GenBank gene model features (gene, mRNA and CDS).
       * The converter  is working well for D.melanogaster data, and work is in
         progress to make it able to handle other genome data sets.

    Textpresso: A progress report

    Eimear Kenny, Hans-Michael Mueller and Paul Sternberg

    In April, 2003, we reported our progress on Textpresso, an information
    retrieval and extraction system for C. elegans literature. The Textpresso
    system is based on shallow text parsing to identify terms of interest,
    which have been organized into ontologies, in a corpus of ASCII journal
    abstract and article text. The parsed text is outputted as XML and
    search-able by either keywords and/or ontology categories via a
    user-friendly interfaces (www.textpresso.org). This tool is being
    generated for use at both a general user-level and a curator-level,
    and ultimately, for automatic extraction of biological facts from text. We
    would like to report the following progress since April:

    Installed Textpresso on a new Server
    Textpresso has a new home on a 2.8 GHz Pentium Xeon dual processor, 3GB
    RAM, 280GB SCSI HD server!

    Added Endnote export functionality
    Citation information for returned abstracts can now be exported in Endnote
    format (with or without including the abstract)

    Added 700 full text articles
    The full text of ~700 journal articles from the CGC bibliography
    (primarily from the last two years) have been added to the Textpresso
    corpus. This is the result of the implementation of a novel software for
    converting PDF to text (see below). We plan to add another ~900 C.
    elegans information-rich articles from PubMed by mid-October.

    Imminent release of pdf2text software for Journal articles
    We have developed and implemented on novel software, written by Robert Li
    at Caltech, for converting biological journal articles in PDF format to
    correctly flowing ASCII text. The software is written in python and
    relies on journal specific templates. We plan to release this software on
    sourceforge very soon, including a library of ~100 Journal templates
    (generated by Daniel Wang at Caltech) and full documentation on how to
    construct new templates.

    Textpresso paper ... in progress
    We are busy writing and hope to publish in the coming months.

    First foray into Fact Extraction using Textpresso
    We have automatically extracted ~14,000 unique locus<->allele<->reference
    relationships from the full text of ~2000 C. elegans journal articles.

    Mouse Genome Informatics

    In our grant supplement, we proposed four specific projects
    to contribute to the GMOD software libraries: a tool for building
    and maintaining customized sets of blastable sequence databases; a
    laboratory notebook for capturing expression data, with facilities for
    electronic data submission; a web-based browser interface designed
    for exploring structured vocabularies (ontologies); and a tool for
    displaying summarized orthology data against a reference genome background.
    These projects were selected from the many already underway or planned
    at MGI at the time of the application. Our overall plan is to
    develop and use the tools first in the context of the MGI project and then
    to package them for release to external groups. In the past year, we have
    made significant progress toward our goals.

    SeqDB Engine is a tool to support the construction and maintenance of
    customized sets of blastable databases.  It allows us to deal with
    multiple sources of sequence data; differing release schedules and
    formats; the need to "filter" the incoming sequences according to
    organism and/or sequence type; the need to "route" sequences to one
    or more output databases; the need to manage large numbers of intermediate
    result files; and the need to deal efficiently with very large data sizes.
    Seqdb_engine is used at MGI to build the databases served by MouseBLAST
    (http://mouseblast.informatics.jax.org).  This includes 18 separate
    blastable databases derived from 6 different data providers.  SeqDB
    Engine is also used to maintain an even larger set of databases for
    MGI curatorial use.

    During the past several months, seqdb_engine has been modified to
    handle GenBank incremental updates. As well, because seqdb_engine
    depends on several other MGI components, we have developed an automated
    process for rebundling seqdb_engine for external distribution.
    Seqdb_engine has been submitted to the GMOD web site.

    The Gene Expression Notebook (GEN) is an Excel spreadsheet designed to
    be a laboratory notebook for recording gene expression data.
    It was designed to meet the needs of small to medium size labs
    performing the traditional expression assays (blot assays and in situs).
    It provides a large number of controlled vocabularies and provides
    a structured, standardized way to describe assays, reagents, and
    specific results. GEN supports images as well as text and numeric data.
    GEN also provides facilities for electronic data
    submission, currently to the GXD Database.

    GEN is currently available from the GMOD site. During the past several
    months, we have been porting GEN to Windows 2000 and to Mac OS/X. (Despite
    being an Excel application, differences in Excel across platforms and
    versions cause GEN not to run reliably in all cases.) W2000 and
    OS/X versions of GEN will be released as soon as they are validated.

    In the GMOD grant supplement, we proposed contributing MGI's ontology
    browser software, which provides a HTML-based interface for
    exploring the GO ontologies and other vocabularies. Developments in
    the intervening months warrant a change in direction. We have recently
    developed a prototype graphical viewer based on the GraphViz package
    from AT&T. This viewer is similar to, but developed independently from,
    SGD's GO Term Finder. It is written in Python and comprises several
    general, reusable software components, including libraries for general
    directed graphs, customizable graph traversals, and creating graph
    visualizations via GraphViz. We will soon submit the core
    libraries to GMOD, and follow up with the viewer application
    itself after another round of refinement.

    The Orthology Map Viewer was originally developed for MGD as a
    way to display a global overview of the mouse/human and mouse/rat
    orthology data.  Rather than display conserved segments (which requires
    deciding where the boundaries are), we show histograms indicating the number
    of data points (i.e., orthologies) at the corresponding mouse genetic
    location.  Multiple histograms are displayed along each mouse chromosome,
    corresponding to the orthologs' chromosomes.  There is no progress on the
    viewer to report at this time.

    Apollo progress:

    Since May 2003, we have fixed various bugs and added some new
    functionality to Apollo, including:
    - Apollo now has an alignment viewer (an adapted version of Jalview) that
    lets you view DNA and/or protein features aligned with a three-frame
    genomic translation.
    - BOP has been merged into Apollo so you can now load and filter raw
    analysis results directly into Apollo.  Current analysis types supported
    are BLAST, sim4, Genscan, and FgenesH.  You can load the analysis results
    into a fresh Apollo session or layer them on top of the currently
    displayed region.
    - More support for non-gene annotations.
    - The GFF adapter now lets you specify a FASTA sequence file to load
    along with the GFF file (either in the GUI or from the command line).
    - Ported Apollo to JDK1.4 and fixed all the issues caused by the switch.
    - Window around requested genes now configurable.
    - Find by name now adds implicit final wildcard (full regular expression
    support coming soon).
    - More debugging of annotation info window.  Also, you can now have
    multiple annotation info windows open at once.
    - Did a lot of testing and validation of XML saving, to make sure
    curators using Apollo don't lose any information and that the XML
    survives a round trip through Chado.

    We are currently discussing specifications for an improved synteny viewer
    that will let users look at detailed cross-genome comparisons and use
    them to refine and edit annotations, and also to look at comparisons
    between multiple genomes rather than just two.

    BOP progress:

    BOP has been merged into the Apollo codebase, so you can now run BOP
    either standalone from the command line or interactively from within
    Apollo.  The Apollo interface currently supports parsing and filtering of
    results from BLAST, sim4, Genscan, and FgenesH.  GUIs let the user
    control the filtering parameters.  Additional parsers are in progress.

    BOP can now generate cigar strings to represent gapped alignments in a
    compact format.  This allows the alignments to be viewed in Apollo's
    alignment viewer.

    GBrowse

    Contact: Lincoln Stein, lstein@cshl.edu

    During the period from May to September 2003 we did not add many new
    features to GBrowse, but have worked steadily to improve its
    documentation and the install experience.  All the documentation for
    GBrowse has now been put into Perl .pod format, and it is now
    automatically converted into HTML and installed on the user's web
    site.  The installation procedure also creates a sample in-memory
    database (yeast chromosome 1), so that the new user can begin
    interacting with the browser immediately after installing it.

    There are new import filters for GenBank, EMBL and UCSC data files.
    This means that one can new initialize GBrowse databases using flat
    files in one of these formats.  There is also support for the proposed
    GFF3 format. Plugins for FGENESH and GENSCAN have now been released.
    These plugins allow de novo gene predictions to be applied to genomes
    while the user is browsing.

    In terms of data sets, Nathan Siemers and Donald Jackson of Bristoll
    Myers Squibb has graciously donated a GBrowse-compatible file of
    TBLATSX annotations comparing fly, mouse, human worm and zebrafish.
    These annotations are available for download on the Sourceforge web
    site, along with their tool for converting blast hit files into
    compatible GFF files.  Xiaokang Pan of Iowa State has donated a GFF
    load file for Arabidopsis.  We still are missing load files for mouse
    and human, and seek volunteers to generate these data sets.

    At the back end, Chado support seems pretty solid, and a variety of
    index optimizations now make the experience of browsing a fully
    populated Chado database nearly as good as browsing the simple
    Bio::DB::GFF databases.  Bio::DB::GFF, meanwhile, has been enhanced to
    support live updates and deletes.  This has made it possible to write
    plugins for GBrowse that allow for interactive updating of the
    database.

    In other news, Nat Goodman's group at Integrated Systems Biology has
    released "ISB GBrowse," a version of GBrowse that has been modified to
    use multiple datasources, including DAS sources.  Because ISB GBrowse
    involves changes both to GBrowse and to Bioperl, it will take some
    time to bring these desirable modifications into the main GBrowse
    branch.

    Mark Wilkinson and Sheldon McKay, under a CSHL-administered USDA
    contract, have created a GBrowse-based genome curation system for use
    at the Meat Animal Research Center (MARC) in Nebraska.  The system
    allows MARC scientists to maintain annotations across a large number
    of variant foot & mouth disease and chicken influenza virus genomes.
    The front end uses the Sanger Center's Artemis as the editor, and
    communicates with an Oracle-based Bio::DB::GFF database at the back
    end via a GBrowse plugin. The initial plan was quite different: to use
    Ensembl as the backend and Apollo as the front end.  At the meeting,
    Sheldon McKay will discuss the evolution of the MARC project, a story
    that will illustrate the difficulties we face in taking GMOD from a
    collection of useful tools to a working integrated architecture.

    PubFetch/PubTrack Progress Report (September 2003)

    PubFetch
    Created initial public PubFetch webservice using BioMOBY protocol to provide
    access to PubMed literature database. The service can be tested at

      http://prometheus.brc.mcw.edu/pubfetch-bin/MOBY-Client05.cgi

    and is also available via MOBY Central:

      http://mobycentral.cbr.nrc.ca/cgi-bin/Client/MOBY-Client05.cgi

    and as a MOBY service available via MOBY Central for MOBY clients.

    Two services are currently available: the first runs a keyword search at
    PubMed and returns the PubMed Ids of matching articles, the second uses a
    PubMed ID and returns the PubMed record in MEDLINE format. The PubMed service
    uses Perl and existing RGD code with a MOBY wrapper.

    A second prototype service has been developed to access the Agricola
    literature database in a similar fashion. Unfortunately Agricola provides a
    web/CGI interface to its literature data requiring a somewhat crude approach
    to running searchers and retrieving results from the database. This service is
    not yet available as a public MOBY service. The Agricola service was developed
    as a java application with a MOBY wrapper.

    Our next step is to connect the PubFetch service with PubSearch via BioMOBY to
    enable PubSearch to use PubFetch as its literature data source.

    Implementation of PubSearch at RGD

    We have been working with the TAIR developers to install and populate at
    PubSearch database at RGD. This process has turned up a variety of
    dependencies that existed in the TAIR software that we have been working to
    remove to create a generic PubSearch database and tool. Currently RGD genes
    and curated literature has been loaded to PubSearch along with the GO terms.
    Based on these experiences a more robust loading script is being developed by
    TAIR that will greatly simplify data loading for new users of the tool.
    Automatic hit generation between articles and GO terms is fully functioning,
    we are working with TAIR to resolve some issues related to Gene-Article hit
    generation. Once the features of PubSearch are fully functioning we will begin
    to test the tool as part of the general RGD curation process. It is
    anticipated this will lead to a variety of suggested modifications that will
    further the flexibility of the PubSearch tool for use by other MODs.

    PubTrack

    We have continued to collect use cases for PubTrack and discuss the utility
    for TAIR and RGD use of PubSearch. Review of similar projects has lead us to
    discover a wide variety of related software (both within GMOD � BioPipe, GUS
    Workflow, and in the commercial arena) that we are now evaluating to see if
    they can be used as is or to learn more about alternative approaches to this
    problem of tracking information (data) within an organization (MOD). It is
    anticipated that significant progress will be made towards an initial
    prototype for PubTrack in the next quarter.

    GMOD project update, Sept 2003, Don Gilbert
    ------------------------------------------

    Project goals
    -------------
    Two proposed and one unproposed projects are in development as generic
    model organism database components for GMOD:

    A Genome Information Search and Retrieval module (GISR) of
    flexible data and text search software is an efficient and
    responsive tool for high-volume genome data of diverse source and
    content.

    A Data Grid Distribution module (DGD) uses emerging Science
    Grid technology to let organism databases provide computable
    directories and access to their high volumes of data.

    Additionally, A Replicable Genome infOrmation System (ARGOS)
    is being developed in conjunction with FlyBase project needs,
    to evolve the current FlyBase distributable server system into
    a generic framework for organism databases.

    Recent progress
    ---------------

    ARGOS A Replicable Genome infOrmation System
    ~~~~~
    Argos provides automated replication for a framework genome data system,
    including  common genome tools and Internet information services, with
    flexible project web look and functions, data mining methods. This is
    nearing production use for building and distributing genome db systems,
    including for FlyBase and euGenes genome systems.  It has a new Daphnia
    organism genome project, and a sample organism project (CentaurBase) for
    testing.

    Recent functional updates include common Perl (including BioPerl, XML
    tools and others) and Java libraries; load balancing for a cluster of
    replicated servers; fuller integration of NCBI BLAST; addition of a
    secure WebDav web-editing interface; addition of LuceGene for XML,
    biosequence and data searching; Axis for web services and JavaLDAP for
    data access (in test mode).   The reference service is at
    http://flybase.net/flybase-ng or http://eugenes.org/argos with project
    documentation at http://www.gmod.org/argos

    The Daphnia Genome Consortium will have a full genome sequence in the
    coming 6 months, funded by DOE-JGI and various NSF and EPA projects.
    I've been advising them on genome databases, leaning toward using GMOD
    and related genome tools, including GBrowse, CMap, Apollo, with some
    dithering between choices of Chado-Postgres or EnsEMBL for a data
    management system.

    We have fashioned a proto-Daphnia database (wFleaBase) based on Argos,
    at http://iubio.bio.indiana.edu/daphnia with details in its documents
    section. Developments in this include tests of LuceGene, WebDav access
    for secure editing of project documents, and other parts which are being
    folded into GMOD source distributions.

    GISR Genome Information Search and Retrieval module
    ~~~~
    Originally proposed to use the well-known SRS bioinformatics
    data system, we now are focusing on Lucene  open-source text indexing
    tool for this GMOD project. Both SRS and Lucene provide for efficient
    search/retrieval of high-volume, semi-structured and complexly
    structured data that doesn't always fit easily a relational database
    structure, allowing organism/genome databases to more easily offer
    access to a wider range of information at lower personnel costs.

    We recently developed this into LuceGene (pronounced as 'Lucy Jean')
    using Lucene (jakarta.apache.org/lucene). Initial testing has proven its
    recognized abilities as an efficient, high-volume IR program.  It is
    capable at handling gigabyte data sets of millions of objects, at levels
    similar to the SRS system.  It can, with appropriate data parsing
    adaptors, index and search all fields of objects, and includes a common
    set text search features (booleans, phrases, fuzzy searches, word
    stemming, field range searches) common in Google and related Internet
    web search systems.

    LuceGene additions to Lucene include adaptors for parsing FlyBase
    data, XML (including Medline XML), GenBank and related biosequence data.
    Test cases include all of data in FlyBase.net and  euGenes.org projects,
    samples from Medline, GenBank, and others.  Performance has been good,
    but further development will be needed before it can be used as a replacement
    for current FlyBase functions.

    The original proposal for this GMOD project was to use SRS, as now used
    in FlyBase.  This software is copyrighted by Thure Etzold and colleagues
    (originally developed at EMBL/EBI) and newer versions are owned by Lion
    Biosciences, who provide for free academic uses.  Though we had initial
    agreements to use SRS w/in the GMOD project, over the past year Lion
    Biosciences has become more restrictive in its academic licensing of
    SRS, and our current agreement is to remove SRS in its current version
    from FlyBase, and not include it in GMOD project as envisioned.

    For a well-described example of using SRS with related bioinformatics
    systems, see http://www.be.gbif.net/services/Documents/DADI_Text by
    Robert Herzog for the GBIF (global biodiversity information facility).
    Because of its established high value for processing biology
    databases, we plan to keep SRS as an alternate in GISR, and work out
    FlyBase-specific uses over the coming year, while developing an
    open-source GISR module based on Lucene.

    Some final organization is needed and it will be added to www.gmod.org's
    project bestiary.

    DGD  Data Grid Distribution module
    ~~~
    Progress has been primarily in testing Web Services and LDAP interfaces
    for distributed search/retrieval from  database backend systems. Initial
    development has been using SRS for backend data access; a Lucene adaptor
    is under construction for use with the above parts.  The primary results
    of testing show (a) Web Services and LDAP methods are equally capable
    for retrieving files of data (bulk data transfer), (b) LDAP is 10 to 100
    times more efficient than Web Services methods for retrieving objects
    (e.g. data records with fields that the client can use directly), (c)
    LDAP has a well defined distributed search/retrieval protocol API,
    general Web Services lack this, but the developing Grid Services
    (OGSA-DAI project, www.ogsa-dai.org) which we still need to test are
    heading toward a standard for distributed search API. Delivery of a
    functional prototype for this module is planned for the coming quarter
    of work.

    Recent hires under this GMOD grant include Paul Poole
    (pppoole@indiana.edu, 1/2 time since july03, a recent bioinformatics
    masters graduate) to update euGenes.org data, now a project within
    Argos, and a bioinformatics masters student as an assistant working on
    GMOD tools (Vasanth Singan, vsingan@indiana.edu, start sept 03)

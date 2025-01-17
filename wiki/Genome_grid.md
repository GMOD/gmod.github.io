



<span id="top"></span>




# <span dir="auto">Genome grid</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Genome Grid
  Aims</span>](#Genome_Grid_Aims)
- [<span class="tocnumber">2</span> <span class="toctext">Genome
  analysis and annotation via Grid
  computing</span>](#Genome_analysis_and_annotation_via_Grid_computing)
- [<span class="tocnumber">3</span> <span class="toctext">Target
  customer and tasks</span>](#Target_customer_and_tasks)
- [<span class="tocnumber">4</span> <span class="toctext">Genome Grid
  components</span>](#Genome_Grid_components)
- [<span class="tocnumber">5</span>
  <span class="toctext">Downloads</span>](#Downloads)
- [<span class="tocnumber">6</span>
  <span class="toctext">References</span>](#References)
- [<span class="tocnumber">7</span>
  <span class="toctext">Contact</span>](#Contact)



# <span id="Genome_Grid_Aims" class="mw-headline">Genome Grid Aims</span>

This project aims to create a usable package of genome data analysis
with cyberinfrastructure: methods, protocols, documentation, suited for
genome informaticians.

The thrust of this work is parallelizing genome data, not software, to
run as many separate 1-cpu jobs as is suitable to the task and
resources. It focuses on data management, transport to/from, indexing,
and splitting data transparently from several source data sets to
compute sites, and collating results to return to the scientist.

The poster-child task is a gene homology Blast analysis of any genome,
but use of several other genomics programs from gene predictors, EST
assemblers, phylogeny analyses, etc. are part of the project goal. Most
of these work fine on any size of data set, and subset results can be
added together.

One way to do this is as a kind
<a href="http://teragrid.org/programs/sci_gateways/"
class="external text" rel="nofollow">Teragrid science gateway
project</a>, where the authenication, admin., grid resource finding are
contained in the gateway components. Parts that the user genomicist sees
are for data and analysis tool selection. Many desired genome tools are
available at some Teragrid sites, but methods to transparently copy and
parallelize data sets are not.

Find more background in the References, or
<a href="http://www.google.com/search?q=genome+teragrid"
class="external text" rel="nofollow">Google: genome teragrid</a>

# <span id="Genome_analysis_and_annotation_via_Grid_computing" class="mw-headline">Genome analysis and annotation via Grid computing</span>

This subproject builds re-usable tools and workflows for [genome
analyses](Category%253AAnalysis "Category%253AAnalysis") and
[annotation](Category%253AAnnotation "Category%253AAnnotation"), using shared
cyberinfrastructure (Grids or clusters). Here within are collections of
scripts, documents and workflows for employing existing genome analysis
tools (BLAST, homology tools, predictors, comparative and phylogenetic
analyses) on available cyberinfrastructure. One emphasis here is on
simplified use of grids and genome tools, to make it feasible for new
genome projects to take advantage of these readily.

  

# <span id="Target_customer_and_tasks" class="mw-headline">Target customer and tasks</span>

The customers for this project are small to medium genome database
projects, and individual bioscience research labs. We expect some
familiarity with bioinformatics data and analyses. The customers
generally have genome data in hand, in common formats of which Fasta
(sequence) and [GFF](GFF "GFF") (annotation) are most common. Customers
also will need to draw on public bio-data from the usual suspects (NCBI,
EBI, Uniprot, UCSC, common genome databases). Often the project will
need a one-time set of analyses on a new genome, or to test a new idea
with existing genomes. Other times projects want to update analyses,
re-running them with current data sets a few times per year. The
customer often has skills with Unix command line systems, Perl and/or
Java languages (with python, ruby and others mixed in). Moving data
around by FTP, http, rsync and such are common skills. Using available
bio-packages for parsing data, such as BioPerl (lesser BioJava), EMBOSS,
some commercial products, is also a common skill. Sometimes the customer
has access to a local computer cluster, or a university managed one, and
would spend effort toward his/her analyses on these systems. Analysis
pipelines may be involved (more common at large sequencing centers), but
are often home-grown creations without a standard operation.

A genome grid gateway would support the common usage of these customers
by offering access to grid resources for the same computations, with
Unix command-line, Perl and Java bindings at least. Web-based front-ends
are an option, but often the user data resides on unix systems along
with data parsing and application tools that we would like to integrate
with remote grid access.

# <span id="Genome_Grid_components" class="mw-headline">Genome Grid components</span>

Most of the potential parts of this package are available, and need to
be assessed and combined. Our goal is not to develop new components, but
to combine existing methods of genome data analyses and grid usage,
adding middleware (perl, java, python, etc.) code where needed.
Collecting and documenting the best practices, with working examples for
genome analyses is a goal. These include in no particular order

- <a
  href="http://www.teragridforum.org/mediawiki/index.php?title=TG07_Gateway_Tutorial"
  class="external text" rel="nofollow">TeraGrid Science Gateway</a>
  tutorials and simple gateway code sources
- <a href="http://evidencemodeler.sourceforge.net/" class="external text"
  rel="nofollow">EvidenceModeler</a> : Perl package with good basic
  genome data splitting methods
- <a href="http://www.biomart.org" class="external text"
  rel="nofollow">BioMart</a> : a transaction oriented bio-datatabase
  ([MySQL](MySQL "MySQL"), others) that understands range of biodata,
  selecting subsets, and has interfacing with the Taverna workflow
  project (Taverna is java-based; BioMart a mix of perl, java and
  various RDBMS methods).
- Lucene and
  <a href="http://www.gmod.org/LuceGene" class="external text"
  rel="nofollow">Lucegene</a> : Bio-data indexer that understands
  various genome data formats, now in use for grid data splitting.
  Lucene/Lucegene are in java. Advantange is that nothing needs be
  compiled, indices and software can be distributed with data to compute
  nodes rather easily.
- SDSC <a href="http://www.sdsc.edu/srb/index.php/Main_Page"
  class="external text" rel="nofollow">Storage Resource Broker</a>:
  file-oriented database with metadata, already part of TeraGrid
  standard services. Has some workflow methods for data selection.
- <a href="http://www.ogsadai.org.uk/" class="external text"
  rel="nofollow">OGSA-DAI</a> : a Grid data access project, mostly
  revolving around relational data access, and maybe too heavy-weight
  for genome informatics needs.
- A <a href="http://www.realitygrid.org/AHE/" class="external text"
  rel="nofollow">Grid Application Hosting Environment</a> : This looked
  like an interesting and practical package for a grid gateway suited to
  bioinformaticians when I saw it in 2006, but haven't evaluated it in
  detail.

<!-- -->

- <a href="Ergatis" class="mw-redirect" title="Ergatis">Ergatis</a> and
  [Galaxy](Galaxy.1 "Galaxy") are GMOD related projects with genome
  analysis workflow systems that are relevant to this.

# <span id="Downloads" class="mw-headline">Downloads</span>

See starter project in
<a href="http://gmod.svn.sourceforge.net/viewvc/gmod/genogrid"
class="external text" rel="nofollow">SourceForge</a> or in package form
at <a href="http://eugenes.org/gmod/genogrid/" class="external text"
rel="nofollow">euGenes</a>.

This package includes scripts for genome data partitioning, running
parallel genome analysis jobs and collating partial results. It is being
used successfully on TeraGrid clusters for analyzing several arthropod
genomes (Daphnia, Pea aphid, 12 Drosophila, and others). It should work
"as-is" on computer clusters with PBS or LoadLeveler batch queues
(TeraGrid is not required).
[Dongilbert](User%253ADongilbert "User%253ADongilbert") 19:56, 26 June 2008
(EDT)

# <span id="References" class="mw-headline">References</span>

- Gilbert, D. 2008. <a
  href="http://insects.eugenes.org/species/about/genome-grid-ismb08-poster.pdf"
  class="external text" rel="nofollow">A Genome Grid for Finding new Bug
  Genes</a>, Poster,
  <a href="http://www.iscb.org/ismb2008/poster_list.php?cat=I"
  class="external text" rel="nofollow">ISMB 2008</a>
- Gilbert, D. 2006. <a
  href="http://iubio.bio.indiana.edu/biogrid/genome-on-teragrid-poster.html"
  class="external text" rel="nofollow">Using TeraGrid for Genome Assembly,
  Annotation and Analysis</a>, Poster, Indy Bioinformatics Conference.

# <span id="Contact" class="mw-headline">Contact</span>

[Don Gilbert](User%253ADongilbert "User%253ADongilbert")

Support provided by a grant from <a
href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0640462"
class="external text" rel="nofollow">NSF BIO Database Activities</a>




[Categories](Special%253ACategories "Special%253ACategories"):

- [Annotation](Category%253AAnnotation "Category%253AAnnotation")
- [Analysis](Category%253AAnalysis "Category%253AAnalysis")
- [GMOD Components](Category%253AGMOD_Components "Category%253AGMOD Components")
- [WFleaBase](Category%253AWFleaBase "Category%253AWFleaBase")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Genome_grid" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:42 on 15 September
  2009.</span>
<!-- - <span id="footer-info-viewcount">99,196 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





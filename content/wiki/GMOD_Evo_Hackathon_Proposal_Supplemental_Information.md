---
title: "GMOD Evo Hackathon Proposal Supplemental Information"
---




<span id="top"></span>




# <span dir="auto">GMOD Evo Hackathon Proposal Supplemental Information</span>









  

<table style="vertical-align: middle; border: 2px solid #A6A6BC"
data-cellpadding="10">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/a8/EvoHackathonLogo.png/200px-EvoHackathonLogo.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/a8/EvoHackathonLogo.png/300px-EvoHackathonLogo.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/a8/EvoHackathonLogo.png/400px-EvoHackathonLogo.png 2x"
width="200" height="200" alt="EvoHackathonLogo.png" />

</td>
<td><span style="font-size: 200%; line-height: 120%"><strong><a
href="GMOD_Evo_Hackathon" title="GMOD Evo Hackathon">Tools for
Evolutionary Biology Hackathon</a></strong><br />
November 8-12, 2010<br />
<a href="http://nescent.org/" class="external text"
rel="nofollow">NESCent</a>, Durham, North Carolina, USA</span></td>
</tr>
</tbody>
</table>

  
On this page you will find additional information related to the [GMOD
Evo Hackathon
Proposal](GMOD_Evo_Hackathon_Proposal "GMOD Evo Hackathon Proposal").


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Other topics
  of Secondary Importance</span>](#Other_topics_of_Secondary_Importance)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Natural
    Diversity / Population Genetics / Multidimensional Data
    Visualization in a Genomic
    Context</span>](#Natural_Diversity_.2F_Population_Genetics_.2F_Multidimensional_Data_Visualization_in_a_Genomic_Context)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Web-based
    display of Chado Phenotype/Natural Diversity
    data</span>](#Web-based_display_of_Chado_Phenotype.2FNatural_Diversity_data)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Support
    for pangenomes and core
    genomes</span>](#Support_for_pangenomes_and_core_genomes)
  - [<span class="tocnumber">1.4</span> <span class="toctext">Support
    for annotation tools based on phylogenetic analysis, such as
    PAINT</span>](#Support_for_annotation_tools_based_on_phylogenetic_analysis.2C_such_as_PAINT)
  - [<span class="tocnumber">1.5</span> <span class="toctext">Linking
    xrate (and other phylo-aware annotation tools) to
    jbrowse</span>](#Linking_xrate_.28and_other_phylo-aware_annotation_tools.29_to_jbrowse)
- [<span class="tocnumber">2</span> <span class="toctext">Discussion /
  Development Topics</span>](#Discussion_.2F_Development_Topics)
  - [<span class="tocnumber">2.1</span>
    <span class="toctext">Post-Reference Genome
    Tools</span>](#Post-Reference_Genome_Tools)
  - [<span class="tocnumber">2.2</span>
    <span class="toctext">High-throughput Imaging /
    Phenotyping</span>](#High-throughput_Imaging_.2F_Phenotyping)
  - [<span class="tocnumber">2.3</span>
    <span class="toctext">Third-generation
    Sequencing</span>](#Third-generation_Sequencing)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Evo-Devo
    Support</span>](#Evo-Devo_Support)
  - [<span class="tocnumber">2.5</span> <span class="toctext">Tree /
    Graph Visualization</span>](#Tree_.2F_Graph_Visualization)



### <span id="Other_topics_of_Secondary_Importance" class="mw-headline">Other topics of Secondary Importance</span>

#### <span id="Natural_Diversity_.2F_Population_Genetics_.2F_Multidimensional_Data_Visualization_in_a_Genomic_Context" class="mw-headline">Natural Diversity / Population Genetics / Multidimensional Data Visualization in a Genomic Context</span>

The Barley1K project (Eyal Fridman group, The Hebrew University) is an
example dataset that should be supportable by GMOD. They gathered a
thousand wild samples of barley in a hierarchical mode of collection (51
sites that include 5 microsite on different slopes or niches within the
site). They also recorded many local environmental conditions and
collected detailed phenotype data on portion of this collection,
including that of a diverse set of interspecifc hybrids derived from a
genetically well-defined core collection (by Illumina Golden Gate
platform, the Barley OPA array\[BOPA1\]). The Natural Diversity module
will allow us to store this type of data including also accumulated
allelic variation obtained from the microsatellites (SSRs) and BOPA1
array, as well as from next generation sequencing of cDNA libraries .
However, we lack tools to visualize such multi-dimensional data in a
genomic context (e.g., in GBrowse, JBrowse, and GBrowse_syn) including
the association of genome-phenotype (phenome). This could be solved
either with specific new glyphs and plugins, or with generic interfaces
to statistical/geolocation/image based visualization packages.

There is also work currently under way to extend [GFF3](GFF3 "GFF3") to
handle variant information. Several existing GMOD tools will need to be
modified to recognize this data.

#### <span id="Web-based_display_of_Chado_Phenotype.2FNatural_Diversity_data" class="mw-headline">Web-based display of Chado Phenotype/Natural Diversity data</span>

[Tripal](Tripal.1 "Tripal") is a
<a href="http://drupal.org" class="external text"
rel="nofollow">Drupal</a>-based web interface to Chado databases. It
supports interfaces for several popular data types, but does not
currently support phylogenies, phenotypes, expression, or natural
diversity data. We could extend it to evolutionary data types as part of
the hackathon.

  

#### <span id="Support_for_pangenomes_and_core_genomes" class="mw-headline">Support for pangenomes and core genomes</span>

The concept of the pangenome and core genomes is becoming common in the
analysis of bacterial genomes, but is more broadly applicable. The
pangenome is the union of all genes found in all strains of a species,
while the core genome is the intersection of those sets. In both cases,
a gene or feature is a generalization of the instances of the feature in
multiple genomes. The gene in a pangenome, like a gene in an inferred
ancestor, does not have a physical location, but it may have one or more
contextual locations in a syntenic block of sequence found in some or
all of the strains.

#### <span id="Support_for_annotation_tools_based_on_phylogenetic_analysis.2C_such_as_PAINT" class="mw-headline">Support for annotation tools based on phylogenetic analysis, such as PAINT</span>

The RefGenome project of the GO consortium is working on
<a href="http://wiki.geneontology.org/index.php/PAINT"
class="external text" rel="nofollow">PAINT</a>, a system for doing
inference of GO annotations based on the distribution of curated
annotations within clades and outgroups. GMOD tools and schemas need to
be prepared to handle this kind of annotation. For example, ancestor
nodes in PANTHER trees will have accessions; these will require
versioning to deal with changes in the analysis as annotations to
descendants and the addition/placement of descendants changes with the
addition of new genomes or revision of the orthology analysis.

#### <span id="Linking_xrate_.28and_other_phylo-aware_annotation_tools.29_to_jbrowse" class="mw-headline">Linking xrate (and other phylo-aware annotation tools) to jbrowse</span>

The conservation track is a staple of the UCSC browser. Evofold
predictions form another useful track. Tools like xrate
(<a href="http://biowiki.org/XRATE" class="external free"
rel="nofollow">http://biowiki.org/XRATE</a>) allow automation and
generalization of these kinds of phylogenetic HMM or SCFG model.
Development would focus on linking these into existing GMOD browsers
(e.g. JBrowse).

## <span id="Discussion_.2F_Development_Topics" class="mw-headline">Discussion / Development Topics</span>

This section contains early-stage ideas that merit discussion and
serious consideration by the attendees of the hackathon, but are not yet
developed enough for specific implementation objectives.

### <span id="Post-Reference_Genome_Tools" class="mw-headline">Post-Reference Genome Tools</span>

This is a great example of how evolutionary biology can help lead the
rest of the GMOD community.

The concept of a reference genome has been an extremely valuable tool in
model organisms. The importance of a reference genome is not
diminishing, but the need for an additional framework is on the rise.

To explain this, lets contrast evolutionary and developmental
biologists. Developmental biologists embrace and strive for similarity
as a means of controlling experimental conditions. Inbred lines of
organisms do not usually occur in nature, but are usually preferred for
developmental biology work. Developmental biology has anatomy ontologies
and staging series based on stereotypic progression of anatomical
development in single inbred lines. Developmental biologists strive to
eliminate genetic and environmental diversity in order to create
controlled experimental conditions. The concept of a reference genome
historically has fit very well into this paradigm.

In contrast, evolutionary biologists embrace and study genetic and
environmental diversity. Evolutionary biologists typically study
populations rather than individual lines. They characterize and analyze
differences, rather than eliminate them. For evolutionary biologists, a
reference genome is much less of a central tool than it is for
developmental biologists.

Second-generation sequencing now allows evolutionary biologists to
exploit *genomic* data for populations or large numbers of individuals.
It also allows every other kind of biologist to do the same. We
currently have tools to show linkage disequilibrium, and genotype and
allele frequencies, but these still typically show data in the context
of a reference genome.

By some estimates, three years from now many projects will have
thousands of full genomes. In such an environment, does the concept of a
reference genome still remain relevant? How should GMOD tools change,
grow, and adapt?

### <span id="High-throughput_Imaging_.2F_Phenotyping" class="mw-headline">High-throughput Imaging / Phenotyping</span>

Adoption of high-throughput imaging and phenotyping technologies is
increasing. What software exists for working with this type of data, and
how should the GMOD community participate?

### <span id="Third-generation_Sequencing" class="mw-headline">Third-generation Sequencing</span>

What challenges will the GMOD community face in handling
third-generation (single-molecule) sequencing data, and how can we
prepare for them? Second generation sequencing technologies typically
produce many short reads at very high coverage. The high coverage is
necessary to compensate for lower accuracy. Challenges with 2nd gen data
include 1) dealing with the huge amount of data that comes with the high
coverage, 2) distinguishing read and amplification errors from signal,
and 3) assembling short reads.

Third generation technologies will have some commonalities and some key
differences. First, they will continue to produce large volumes of data.
The nature of the data will change significantly, though. Third
generation technologies are expected to be significantly less
error-prone, thus reducing the need for high coverage. This will also
reduce cost and turnaround time. While the average *depth* of the data
will decrease, the *width* of the data will greatly increase. The
technology will enable more samples to be sequenced, and at greater
accuracy. The improved accuracy and longer read length will also make
assembly easier.

Areas of discussion include:

- data modeling and storage
- graphical visualization
- online display and searching

### <span id="Evo-Devo_Support" class="mw-headline">Evo-Devo Support</span>

Add the ability to compare the developmental programs between organisms
at different levels: anatomy, genomics, expression patterns, gene
regulatory networks and their architecture, and phenotypes. This
objective, with the exception of gene regulatory networks, overlaps with
several others.

  

### <span id="Tree_.2F_Graph_Visualization" class="mw-headline">Tree / Graph Visualization</span>

GMOD's Chado database schema already includes strong support for storing
trees and graphs. This capability has been in Chado since its beginning.
GMOD, however, lacks visualization support for tree and graph based
data. This includes phylogeny, gene orthology, lineage (anatomy and
breeding), ontologies, and breeding data. Several GMOD users have
developed their own visualization tools for this type of data. We could
integrate one of those solutions, or an outside solution, for
visualization.




[Category](Special%253ACategories "Special%253ACategories"):

- [GMOD Evo
  Hackathon](Category%253AGMOD_Evo_Hackathon "Category%253AGMOD Evo Hackathon")






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

- <span id="t-smwbrowselink"><a
  href="Special%253ABrowse/GMOD_Evo_Hackathon_Proposal_Supplemental_Information"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:44 on 7 July
  2010.</span>
<!-- - <span id="footer-info-viewcount">12,487 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





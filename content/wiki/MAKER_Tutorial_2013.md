---
title: "MAKER Tutorial 2013"
---




<span id="top"></span>




# <span dir="auto">MAKER Tutorial 2013</span>









<a href="http://www.cafepress.com/+maker-genome-annotation+gifts"
class="external text" rel="nofollow">Get MAKER Bling!</a>

  


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">About
  MAKER</span>](#About_MAKER)
- [<span class="tocnumber">2</span> <span class="toctext">Introduction
  to Genome Annotation</span>](#Introduction_to_Genome_Annotation)
  - [<span class="tocnumber">2.1</span> <span class="toctext">What Are
    Annotations?</span>](#What_Are_Annotations.3F)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Importance
    of Genome Annotations</span>](#Importance_of_Genome_Annotations)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Effect of
    NextGen Sequencing on the Annotation
    Process</span>](#Effect_of_NextGen_Sequencing_on_the_Annotation_Process)
- [<span class="tocnumber">3</span> <span class="toctext">MAKER
  Overview</span>](#MAKER_Overview)
  - [<span class="tocnumber">3.1</span> <span class="toctext">What does
    MAKER do?</span>](#What_does_MAKER_do.3F)
  - [<span class="tocnumber">3.2</span> <span class="toctext">What sets
    MAKER apart from other tools (*ab initio* gene predictors
    etc.)?</span>](#What_sets_MAKER_apart_from_other_tools_.28ab_initio_gene_predictors_etc..29.3F)
  - [<span class="tocnumber">3.3</span> <span class="toctext">Emerging
    vs. Classic Model
    Genomes</span>](#Emerging_vs._Classic_Model_Genomes)
  - [<span class="tocnumber">3.4</span> <span class="toctext">Comparison
    of Algorithm Performance on Model vs. Emerging
    Genomes</span>](#Comparison_of_Algorithm_Performance_on_Model_vs._Emerging_Genomes)
- [<span class="tocnumber">4</span>
  <span class="toctext">Installation</span>](#Installation)
  - [<span class="tocnumber">4.1</span>
    <span class="toctext">Prerequisites</span>](#Prerequisites)
  - [<span class="tocnumber">4.2</span> <span class="toctext">The MAKER
    Package</span>](#The_MAKER_Package)
- [<span class="tocnumber">5</span> <span class="toctext">Getting
  Started with MAKER</span>](#Getting_Started_with_MAKER)
  - [<span class="tocnumber">5.1</span>
    <span class="toctext">Note</span>](#Note)
  - [<span class="tocnumber">5.2</span> <span class="toctext">Running
    MAKER with example data</span>](#Running_MAKER_with_example_data)
- [<span class="tocnumber">6</span> <span class="toctext">Details of
  What is Going on Inside of
  MAKER</span>](#Details_of_What_is_Going_on_Inside_of_MAKER)
  - [<span class="tocnumber">6.1</span> <span class="toctext">Repeat
    Masking</span>](#Repeat_Masking)
  - [<span class="tocnumber">6.2</span> <span class="toctext">*Ab
    Initio* Gene Prediction</span>](#Ab_Initio_Gene_Prediction)
  - [<span class="tocnumber">6.3</span> <span class="toctext">RNA and
    Protein Evidence
    Alignment</span>](#RNA_and_Protein_Evidence_Alignment)
  - [<span class="tocnumber">6.4</span> <span class="toctext">Polishing
    Evidence Alignments</span>](#Polishing_Evidence_Alignments)
  - [<span class="tocnumber">6.5</span>
    <span class="toctext">Integrating Evidence to Synthesize
    Annotations</span>](#Integrating_Evidence_to_Synthesize_Annotations)
  - [<span class="tocnumber">6.6</span> <span class="toctext">Selecting
    and Revising the Final Gene
    Model</span>](#Selecting_and_Revising_the_Final_Gene_Model)
  - [<span class="tocnumber">6.7</span> <span class="toctext">Quality
    Control</span>](#Quality_Control)
- [<span class="tocnumber">7</span> <span class="toctext">MAKER's
  Output</span>](#MAKER.27s_Output)
- [<span class="tocnumber">8</span> <span class="toctext">Viewing MAKER
  Annotations</span>](#Viewing_MAKER_Annotations)
  - [<span class="tocnumber">8.1</span>
    <span class="toctext">Apollo</span>](#Apollo)
- [<span class="tocnumber">9</span> <span class="toctext">Advanced MAKER
  Configuration, Re-annotation Options, and Improving Annotation
  Quality</span>](#Advanced_MAKER_Configuration.2C_Re-annotation_Options.2C_and_Improving_Annotation_Quality)
  - [<span class="tocnumber">9.1</span>
    <span class="toctext">Configuration Files in
    Detail</span>](#Configuration_Files_in_Detail)
    - [<span class="tocnumber">9.1.1</span> <span class="toctext">Genome
      Options (Required)</span>](#Genome_Options_.28Required.29)
    - [<span class="tocnumber">9.1.2</span>
      <span class="toctext">Re-annotation Using MAKER Derived
      GFF3</span>](#Re-annotation_Using_MAKER_Derived_GFF3)
    - [<span class="tocnumber">9.1.3</span> <span class="toctext">RNA
      (EST) Evidence</span>](#RNA_.28EST.29_Evidence)
    - [<span class="tocnumber">9.1.4</span>
      <span class="toctext">Protein Homology
      Evidence</span>](#Protein_Homology_Evidence)
    - [<span class="tocnumber">9.1.5</span> <span class="toctext">Repeat
      Masking</span>](#Repeat_Masking_2)
    - [<span class="tocnumber">9.1.6</span> <span class="toctext">Gene
      Prediction</span>](#Gene_Prediction)
    - [<span class="tocnumber">9.1.7</span> <span class="toctext">Other
      Annotation Feature Types</span>](#Other_Annotation_Feature_Types)
    - [<span class="tocnumber">9.1.8</span>
      <span class="toctext">External Application Behavior
      Options</span>](#External_Application_Behavior_Options)
    - [<span class="tocnumber">9.1.9</span> <span class="toctext">MAKER
      Behavior Options</span>](#MAKER_Behavior_Options)
  - [<span class="tocnumber">9.2</span> <span class="toctext">Training
    *ab initio* Gene
    Predictors</span>](#Training_ab_initio_Gene_Predictors)
  - [<span class="tocnumber">9.3</span> <span class="toctext">MAKER Web
    Annotation Service</span>](#MAKER_Web_Annotation_Service)
  - [<span class="tocnumber">9.4</span>
    <span class="toctext">mRNAseq</span>](#mRNAseq)
  - [<span class="tocnumber">9.5</span> <span class="toctext">Improving
    Annotation Quality with MAKER's AED
    score</span>](#Improving_Annotation_Quality_with_MAKER.27s_AED_score)
  - [<span class="tocnumber">9.6</span>
    <span class="toctext">Merge/Resolve Legacy
    Annotations</span>](#Merge.2FResolve_Legacy_Annotations)
  - [<span class="tocnumber">9.7</span> <span class="toctext">MPI
    Support</span>](#MPI_Support)
  - [<span class="tocnumber">9.8</span> <span class="toctext">User
    Interface for Local MAKER
    Installation</span>](#User_Interface_for_Local_MAKER_Installation)
  - [<span class="tocnumber">9.9</span> <span class="toctext">MAKER
    Accessory Scripts</span>](#MAKER_Accessory_Scripts)



## <span id="About_MAKER" class="mw-headline">About MAKER</span>

MAKER is an easy-to-use genome annotation pipeline designed for small
research groups with little bioinformatics experience. However, MAKER is
also designed to be scalable and is thus appropriate for projects of any
size including use by large sequence centers. MAKER can be used for *de
novo* annotation of newly sequenced genomes, for updating existing
annotations to reflect new evidence, or just to combine annotations,
evidence, and quality control statistics for use with other GMOD
programs like [GBrowse](GBrowse.1 "GBrowse"),
[JBrowse](JBrowse.1 "JBrowse"),
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>, and
[Apollo](Apollo.1 "Apollo").

MAKER has been used in many genome annotation projects:

- *Schmidtea mediterranea* - planaria (A Alvarado, Stowers Institute)
  <a href="http://www.ncbi.nlm.nih.gov/pubmed/18025269"
  class="external text" rel="nofollow">PubMed</a>
- *Pythium ultimum* oomycete (R Buell, Michigan State Univ.)
  <a href="http://www.ncbi.nlm.nih.gov/pubmed/20626842"
  class="external text" rel="nofollow">PubMed</a>
- *Pinus taeda* - Loblolly pine (A Stambolia-Kovach, Univ. California
  Davis) <a href="http://www.ncbi.nlm.nih.gov/pubmed/20609256"
  class="external text" rel="nofollow">PubMed</a>
- *Atta cephalotes* - leaf-cutter ant (C Currie, Univ. Wisconsin,
  Madison) <a href="http://www.ncbi.nlm.nih.gov/pubmed/21347285"
  class="external text" rel="nofollow">PubMed</a>
- *Linepithema humile* - Argentine ant (CD Smith, San Francisco State
  Univ.) <a href="http://www.ncbi.nlm.nih.gov/pubmed/21282631"
  class="external text" rel="nofollow">PubMed</a>
- *Pogonomyrmex barbatus* - red harvester Ant (J Gadau, Arizona State
  Univ.) <a href="http://www.ncbi.nlm.nih.gov/pubmed/21282651"
  class="external text" rel="nofollow">PubMed</a>
- *Conus bullatus* - cone snail (B Olivera Univ. Utah)
  <a href="http://www.ncbi.nlm.nih.gov/pubmed/21266071"
  class="external text" rel="nofollow">PubMed</a>
- *Petromyzon marinus* - Sea lamprey (W Li, Michigan State)
  <a href="http://www.ncbi.nlm.nih.gov/pubmed/23435085"
  class="external text" rel="nofollow">PubMed</a>
- *Fusarium circinatum* - pine pitch canker (B Wingfield, Univ.
  Pretoria) - Manuscript in preparation
- *Cardiocondyla obscurior* - tramp ant (J Gadau, Arizona State Univ.) -
  Manuscript in preparation
- *Columba livia* - pigeon (M Shapiro, Univ. Utah) - Manuscript in
  preparation
- *Megachile routundata* alfalfa leafcutter bee () - Manuscript in
  preparation
- *Latimeria menadoensis* - african coelacanth () -
  <a href="http://www.ncbi.nlm.nih.gov/pubmed/23598338"
  class="external text" rel="nofollow">PubMed</a>
- *Nannochloropsis* - micro algae (SH Shiu, Michigan State Univ.)
  <a href="http://www.ncbi.nlm.nih.gov/pubmed/23166516"
  class="external text" rel="nofollow">PubMed</a>
- *Arabidopsis* thale cress re-annotation (E Huala, TAIR) - Manuscript
  in preparation
- *Cronartium quercuum* - rust fungus (JM Davis, Univ. Florida) -
  Annotation in progress
- *Ophiophagus hannah* - King cobra (T. Castoe, Univ. Colorado) -
  Annotation in progress
- *Python molurus* - Burmese python (T. Castoe, Univ. Colorado) -
  Annotation in progress
- *Lactuca sativa* - Lettuce (RW Michelmore) - Annotation in progress
- parasitic nematode genomes (M Mitreva, Washington Univ)
- *Diabrotica virgifera* - corn rootworm beetle (H Robertson, Univ.
  Illinois)
- *Oryza sativa* - rice re-annotation (R Buell, MSU)
- *Zea mays* - maize re-annotation (C Lawrence, MaizeGDP)
- *Cephus cinctus* - wheat stem sawfly (H Robertson, Univ. Illinois)
- *Rhagoletis pomonella* - apple maggot fly (H Robertson, Univ.
  Illinois)

## <span id="Introduction_to_Genome_Annotation" class="mw-headline">Introduction to Genome Annotation</span>

### <span id="What_Are_Annotations.3F" class="mw-headline">What Are Annotations?</span>

Annotations are descriptions of different features of the genome, and
they can be structural or functional in nature.

Examples:

- Structural Annotations: exons, introns, UTRs, splice forms
  (<a href="http://www.sequenceontology.org/" class="external text"
  rel="nofollow">Sequence Onotology</a>)





Genome project from sequencing to experimental application of
annotations




  
Genome sequence itself is not very useful. The first question that
occurs to most of us when a genome is sequenced is, "where are the
genes?" To identify the genes we need to annotate the genome. And while
most researchers probably don't give annotations a lot of thought, they
use them everyday.

  
Examples of Annotation Databases:


- [GMOD Schools](Category%253AGMOD_Schools "Category%253AGMOD Schools")
- [Tutorials](Category%253ATutorials "Category%253ATutorials")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/MAKER_Tutorial_2013" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:47 on 29 July
  2013.</span>
<!-- - <span id="footer-info-viewcount">125,259 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





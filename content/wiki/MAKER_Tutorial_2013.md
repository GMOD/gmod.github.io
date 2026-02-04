---
title: "MAKER Tutorial 2013"
---
# MAKER Tutorial 2013

<a href="http://www.cafepress.com/+maker-genome-annotation+gifts"
class="external text" rel="nofollow">Get MAKER Bling!</a>

 MAKER</span>](#About_MAKER)
- [Introduction
 to Genome Annotation](#Introduction_to_Genome_Annotation)
 - [What Are
 Annotations?](#What_Are_Annotations.3F)
 - [Importance
 of Genome Annotations](#Importance_of_Genome_Annotations)
 - [Effect of
 NextGen Sequencing on the Annotation
 Process](#Effect_of_NextGen_Sequencing_on_the_Annotation_Process)
- [MAKER
 Overview](#MAKER_Overview)
 - [What does
 MAKER do?](#What_does_MAKER_do.3F)
 - [What sets
 MAKER apart from other tools (*ab initio* gene predictors
 etc.)?](#What_sets_MAKER_apart_from_other_tools_.28ab_initio_gene_predictors_etc..29.3F)
 - [Emerging
 vs. Classic Model
 Genomes](#Emerging_vs._Classic_Model_Genomes)
 - [Comparison
 of Algorithm Performance on Model vs. Emerging
 Genomes](#Comparison_of_Algorithm_Performance_on_Model_vs._Emerging_Genomes)
- [Installation](#Installation)
 - [Prerequisites](#Prerequisites)
 - [The MAKER
 Package](#The_MAKER_Package)
- [Getting
 Started with MAKER](#Getting_Started_with_MAKER)
 - [Note](#Note)
 - [Running
 MAKER with example data](#Running_MAKER_with_example_data)
- [Details of
 What is Going on Inside of
 MAKER](#Details_of_What_is_Going_on_Inside_of_MAKER)
 - [Repeat
 Masking](#Repeat_Masking)
 - [*Ab
 Initio* Gene Prediction](#Ab_Initio_Gene_Prediction)
 - [RNA and
 Protein Evidence
 Alignment](#RNA_and_Protein_Evidence_Alignment)
 - [Polishing
 Evidence Alignments](#Polishing_Evidence_Alignments)
 - [Integrating Evidence to Synthesize
 Annotations](#Integrating_Evidence_to_Synthesize_Annotations)
 - [Selecting
 and Revising the Final Gene
 Model](#Selecting_and_Revising_the_Final_Gene_Model)
 - [Quality
 Control](#Quality_Control)
- [MAKER's
 Output](#MAKER.27s_Output)
- [Viewing MAKER
 Annotations](#Viewing_MAKER_Annotations)
 - [Apollo](#Apollo)
- [Advanced MAKER
 Configuration, Re-annotation Options, and Improving Annotation
 Quality](#Advanced_MAKER_Configuration.2C_Re-annotation_Options.2C_and_Improving_Annotation_Quality)
 - [Configuration Files in
 Detail](#Configuration_Files_in_Detail)
 - [Genome
 Options (Required)](#Genome_Options_.28Required.29)
 - [Re-annotation Using MAKER Derived
 GFF3](#Re-annotation_Using_MAKER_Derived_GFF3)
 - [RNA
 (EST) Evidence](#RNA_.28EST.29_Evidence)
 - [Protein Homology
 Evidence](#Protein_Homology_Evidence)
 - [Repeat
 Masking](#Repeat_Masking_2)
 - [Gene
 Prediction](#Gene_Prediction)
 - [Other
 Annotation Feature Types](#Other_Annotation_Feature_Types)
 - [External Application Behavior
 Options](#External_Application_Behavior_Options)
 - [MAKER
 Behavior Options](#MAKER_Behavior_Options)
 - [Training
 *ab initio* Gene
 Predictors](#Training_ab_initio_Gene_Predictors)
 - [MAKER Web
 Annotation Service](#MAKER_Web_Annotation_Service)
 - [mRNAseq](#mRNAseq)
 - [Improving
 Annotation Quality with MAKER's AED
 score](#Improving_Annotation_Quality_with_MAKER.27s_AED_score)
 - [Merge/Resolve Legacy
 Annotations](#Merge.2FResolve_Legacy_Annotations)
 - [MPI
 Support](#MPI_Support)
 - [User
 Interface for Local MAKER
 Installation](#User_Interface_for_Local_MAKER_Installation)
 - [MAKER
 Accessory Scripts](#MAKER_Accessory_Scripts)

## About MAKER

MAKER is an easy-to-use genome annotation pipeline designed for small
research groups with little bioinformatics experience. However, MAKER is
also designed to be scalable and is thus appropriate for projects of any
size including use by large sequence centers. MAKER can be used for *de
novo* annotation of newly sequenced genomes, for updating existing
annotations to reflect new evidence, or just to combine annotations,
evidence, and quality control statistics for use with other GMOD
programs like [GBrowse](/wiki/GBrowse),
[JBrowse](/wiki/JBrowse),
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>, and
[Apollo](/wiki/Apollo).

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

## Introduction to Genome Annotation

### What Are Annotations?

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

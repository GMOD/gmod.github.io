---
title: "MWAS Tutorial"
---
# MWAS Tutorial

  Annotation Service</span>](#Maker_Web_Annotation_Service)
- [Understanding
  MWAS](#Understanding_MWAS)
  - [Introduction to Genome
    Annotation](#Introduction_to_Genome_Annotation)
    - [What
      Are Annotations?](#What_Are_Annotations.3F)
    - [Importance of Genome
      Annotations](#Importance_of_Genome_Annotations)
    - [Effect
      of Next Generation Sequencing on the Annotation
      Process](#Effect_of_Next_Generation_Sequencing_on_the_Annotation_Process)
  - [What does
    MWAS do?](#What_does_MWAS_do.3F)
  - [What sets
    MAKER and MWAS apart from other tools (_ab initio_ gene predictors
    etc.)?](#What_sets_MAKER_and_MWAS_apart_from_other_tools_.28ab_initio_gene_predictors_etc..29.3F)
    - [Emerging vs. Model
      Genomes](#Emerging_vs._Model_Genomes)
    - [Comparison of Algorithm Performance on Model
      vs. Emerging
      Genomes](#Comparison_of_Algorithm_Performance_on_Model_vs._Emerging_Genomes)
- [Getting
  Started with MWAS](#Getting_Started_with_MWAS)
  - [Registration](#Registration)
  - [Running
    MWAS with Example Data](#Running_MWAS_with_Example_Data)
  - [Details of
    What is Going on Inside of
    MWAS](#Details_of_What_is_Going_on_Inside_of_MWAS)
    - [Repeat
      Masking](#Repeat_Masking)
    - [_Ab
      Initio_ Gene Prediction](#Ab_Initio_Gene_Prediction)
    - [EST
      and Protein Evidence
      Alignment](#EST_and_Protein_Evidence_Alignment)
    - [Polishing Evidence
      Alignments](#Polishing_Evidence_Alignments)
    - [Integrating Evidence to Synthesize Final
      Annotations](#Integrating_Evidence_to_Synthesize_Final_Annotations)
  - [Running
    MWAS with your Own Data](#Running_MWAS_with_your_Own_Data)
  - [MWAS Job
    Configuration](#MWAS_Job_Configuration)
    - [Basic
      Input Files](#Basic_Input_Files)
    - [Repeat
      Masking Options](#Repeat_Masking_Options)
    - [Gene
      Prediction Options](#Gene_Prediction_Options)
    - [Other
      MAKER Options](#Other_MAKER_Options)
  - [MWAS
    Results](#MWAS_Results)
  - [Viewing
    MAKER Annotations](#Viewing_MAKER_Annotations)
    - [Apollo](#Apollo)
  - [Training
    _ab initio_ Gene
    Predictors](#Training_ab_initio_Gene_Predictors)
  - [GFF3
    Pass-through](#GFF3_Pass-through)
  - [mRNAseq](#mRNAseq)
  - [Merge/Resolve Legacy
    Annotations](#Merge.2FResolve_Legacy_Annotations)

## Maker Web Annotation Service

The MAKER Web Annotation Service (MWAS) is an easily configurable
web-accessible genome annotation pipeline. It's purpose is to allow
research groups with small to intermediate amounts of eukaryotic and
prokaryotic genome sequence (i.e. BAC clones, small whole genomes,
preliminary sequencing data, etc.) to independently annotate and analyse
their data and produce output that can be loaded into a genome database.
MWAS is build on the stand alone genome annotation pipeline
[MAKER](MAKER.1 "MAKER"), and users who wish to annotate datasets that
are too large to submit to MWAS are free to
<a href="http://www.yandell-lab.org/software/" class="external text"
rel="nofollow">download MAKER</a> for use on their own systems.

## Understanding MWAS

The first half of this page gives general background to genome
annotation as well as describes validation data for the
[MAKER](MAKER.1 "MAKER") Web Annotation Service, MWAS. The stand alone
annotation pipeline MAKER is at the heart of MWAS, and MWAS has been
configured to present the user with configuration options that match
those of the command line program MAKER as closely as possible.

### Introduction to Genome Annotation

#### What Are Annotations?

Annotations are descriptions of different features of the genome, and
they can be both structural or functional in nature.

Examples:

- Structural Annotations: exons, introns, UTRs, splice forms etc.
- Functional Annotations: process a gene is involved in (metabolism),
  molecular function (hydrolase), location of expression (expressed in
  the mitochondria), etc.

It is especially important that all genome annotations include with
themselves an evidence trail that describes in detail the evidence that
was used to both suggest and support each annotation. This assists in
quality control and downstream management of genome annotations.

Examples of evidence supporting a structural annotation:

- _Ab initio_ gene predictions
- ESTs
- Protein homology

#### Importance of Genome Annotations

Why should the average biologist care about genome annotations? Genome
sequence itself is not very useful. The main question when any genome is
sequenced is, "where are the genes?" To identify the genes we need to
annotate the genome. And while most researchers probably don't give
annotations a lot of thought, they use them everyday.

Examples of Annotation Databases:

- [FlyBase](Category%253AFlyBase "Category%253AFlyBase")
- [WormBase](Category%253AWormBase "Category%253AWormBase")
- [Mouse Genome Informatics Group](Category%253AMGI "Category%253AMGI")

Every time we use techniques such as RNAi, PCR, gene expression arrays,
targeted gene knockout, or CHIP we are basing our experiments on the
information derived from a digitally stored genome annotation. If the
annotation is correct, then these experiments should succeed; however,
if an annotation is incorrect these experiments are bound to fail. Which
brings up a major point:

- **Incorrect and incomplete genome annotations poison every experiment
  that uses them.**

Quality control and evidence management are therefore essential
components to any annotation process.

#### Effect of [Next Generation Sequencing](Next_Generation_Sequencing "Next Generation Sequencing") on the Annotation Process

It’s generally accepted that within the next few years it will be
possible to sequence even human sized genomes for as little as \$1,000
and in a short time frame. When these expectations finally become
reality, then whole genome sequencing will likely become _routine_ for
even small laboratories. Unfortunately, advances in annotation
technology have not kept pace with genome sequencing, and annotation is
rapidly becoming a major bottleneck affecting modern genomics research.

For example:

- As of October 2009, 222 eukaryotic genomes were fully sequenced yet
  unpublished (this is an ever growing backlog).
- Currently _(Jan 2010)_ there are over 900 eukaryotic genome projects
  underway, assuming 10,000 genes per genome, that’s 9,000,000 new
  annotations (with this many new annotations, quality control and
  maintenance become an issue).
- While there are organizations dedicated to producing and distributing
  genome annotations (i.e ENSEMBL and VectorBase), the shear volume of
  newly sequenced genomes exceeds both their capacity and stated
  purview.
- Many small research groups (which often lack bioinformatics
  experience) must therefore confront the difficulties associated with
  genome annotation on their own.

The MAKER Web Annotation Service is a tool to assist research groups in
converting the mountain of genomic data provided by next generation
sequencing technologies into a usable resource, and for larger datasets,
research groups can use a local installation of the annotation pipeline
MAKER.

### What does MWAS do?

- Identifies and masks out repeat elements
- Aligns ESTs to the genome
- Aligns proteins to the genome
- Produces _ab initio_ gene predictions
- Synthesizes these data into final annotations
- Produces evidence-based quality values for downstream annotation
  management

MAKER generated annotations, shown in [Apollo](Apollo.1 "Apollo").

### What sets MAKER and MWAS apart from other tools (_ab initio_ gene predictors etc.)?

MAKER is an annotation pipeline, not a gene predictor. MAKER does not
predict genes, rather MAKER leverages existing software tools (some of
which are gene predictors) and integrates their output to produce what
MAKER believes to be the best possible gene model for a given location
based on evidence alignments.

gene prediction ≠ gene annotation

- gene predictions are gene models.
- gene annotations are gene models but should include a documented
  evidence trail supporting the model in addition to quality control
  metrics.

This may seem like just a matter of semantics since the primary output
for both _ab initio_ gene predictors and the MAKER pipeline is the same,
a collection of gene models. However there are a few very significant
consequences to the differences between these programs that I will
explain shortly.

#### Emerging vs. Model Genomes

Emerging model organism genomes each come with there own set of issues
that are not necessarily found in classic model genomes. These include
difficulties associated with Repeat identification, gene finder
training, and other complex analyses. Unfortunately emerging model
organisms are often studied by very small research communities which
often lack the resources and bioinformatics experience necessary to
tackle these issues.

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Classic Model Organisms</th>
<th>Emerging Model Organisms</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td data-valign="top"><p>Well developed experimental systems</p></td>
<td><p>New experimental systems</p>
<ul>
<li>Genome will be the central resource for work in these systems</li>
</ul></td>
</tr>
<tr class="even">
<td data-valign="top"><p>Much prior knowledge about genome</p></td>
<td><p>Little prior knowledge about genome</p>
<ul>
<li>Usually no genetics</li>
</ul></td>
</tr>
<tr class="odd">
<td>Large community</td>
<td>Small communities</td>
</tr>
<tr class="even">
<td>Big $</td>
<td>Less $</td>
</tr>
<tr class="odd">
<td>Examples: <em>D. melanogaster</em>, <em>C. elegans</em>, human,
etc.</td>
<td>Examples: oomycetes, flat worms, cone snail, etc.</td>
</tr>
</tbody>
</table>

#### Comparison of Algorithm Performance on Model vs. Emerging Genomes

If you have ever looked at comparisons of gene predictor performance on
classic model organisms such as _C. elegans_ you would conclude that _ab
initio_ gene predictors match or even outperform state of the art
annotation pipelines, and the truth is that, with enough training data,
they do. However, it is important to keep in mind that _ab initio_ gene
predictors have been specifically optimized to perform well on model
organisms such as _Drosophila_ and _C. elegans_, organisms for which we
have large amount of pre-existing data to both train and tweak the
prediction parameters.

<table class="wikitable">
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="5">Table: MAKER's Performance on the <em>C. elegans</em>
genome</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<th rowspan="2"><p>Performance</p>
<p>Category</p></th>
<th colspan="2">Ab initio</th>
<th colspan="2">Evidence Based</th>
</tr>
<tr class="header">
<th>SNAP</th>
<th>Augustus</th>
<th>MAKER</th>
<th>Gramene</th>
</tr>
&#10;<tr class="odd">
<td colspan="5"><em>Genomic Overlap (gene)</em></td>
</tr>
<tr class="even">
<td>SP</td>
<td>82.48</td>
<td>88.09</td>
<td>91.69</td>
<td>93.49</td>
</tr>
<tr class="odd">
<td>SN</td>
<td>95.44</td>
<td>96.78</td>
<td>89.81</td>
<td>88.74</td>
</tr>
<tr class="even">
<td colspan="5"><em>Exon Overlap</em></td>
</tr>
<tr class="odd">
<td>SP</td>
<td>18.88</td>
<td>22.87</td>
<td>25.58</td>
<td>27.38</td>
</tr>
<tr class="even">
<td>SN</td>
<td>87.63</td>
<td>93.09</td>
<td>91.17</td>
<td>94.84</td>
</tr>
</tbody>
</table>

What about emerging model organisms for which little data is available?
Gene prediction in classic model organisms is relatively simple because
there are already a large number of experimentally determined and
verified gene models, but with emerging model organisms, we are lucky to
have a handful of gene models to train with. As a result _ab initio_
gene predictors generally perform very poorly on emerging genomes.

MAKER will:

- Identify legacy annotation most consistent with new data
- Automatically revise it in light of new data
- If no existing annotation, create new one

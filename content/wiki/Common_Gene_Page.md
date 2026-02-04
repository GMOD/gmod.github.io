---
title: "Common Gene Page"
---
# Common Gene Page

 Page Rationale</span>](#Common_Gene_Page_Rationale)
 - [Gene Page
 Sections](#Gene_Page_Sections)
- [Implementation](#Implementation)
- [Notes for
 Discussion 2008](#Notes_for_Discussion_2008)
 - [Notes from
 the July 2008 GMOD
 Meeting](#Notes_from_the_July_2008_GMOD_Meeting)
- [Example
 uses](#Example_uses)
 - [Early
 documents and samples](#Early_documents_and_samples)
 - [More
 discussion and samples](#More_discussion_and_samples)
 - [Daphnia
 genome database use case](#Daphnia_genome_database_use_case)
 - [Pea aphid
 genome annotation case](#Pea_aphid_genome_annotation_case)

# Common Gene Page Rationale

Model organism/genome databases (MODs) produce gene pages of similar
gene data, and may benefit from looking at unifying these to common
structure, labelling, etc.

Gene page attributes that have been discussed for inclusion in include
Names, symbols/IDs, synonyms; Map locations; Sequences and Reagents;
Gene ontology; Similar Genes; Database cross-refs and external links;
Alleles and Transcripts; Proteins, Structure and Domains; Expression and
Mutant Phenotypes; Gene Interactions; Literature references; and Summary
Text

## Gene Page Sections

One outline for these attributes is to have main sections as:

 BASIC_INFORMATION, LOCATION, GENE_PRODUCT, GENE_ONTOLOGY,
 SIMILAR_GENES, FUNCTION, REAGENTS, VARIANTS, LITERATURE,
 SUMMARY, ADDITIONAL_INFORMATION

- BASIC_INFORMATION: primary gene info, including Symbol Full_name
 Synonyms GeneID Species
- LOCATION: location in genome, including Chromosome Scaffold Genome_map
- GENE_PRODUCT: products of genes at sequence and above levels,
 including Polypeptides Transcripts Gene_type Sequence
- GENE_ONTOLOGY: standardized Gene Ontology parts, including GO term,
 evidence Molecular_function, Biological_process, Cellular_component
- FUNCTION: higher level gene actions, including Protein_domains
 External_links Expressions Phenotypes Interactions
- REAGENTS: Including PCR, cDNA, EST
- VARIANTS: mutant alleles, genetic and phenotypic variants, SNPs
- SIMILAR_GENES: list of related organism genes, generally
 blast-computed, including Similarity Evalue Percent
- LITERATURE: relevant experimental references (Dublin Core fields)
- SUMMARY: a human-readable text summary of gene information
- ADDITIONAL_INFORMATION: unstructured, suited for project additions

# Implementation

[Discussion](/wiki/July_2008_GMOD_Meeting#Common_Gene_Page)
at the [July 2008 GMOD
Meeting](/wiki/July_2008_GMOD_Meeting) resulted in
the
[Bio::GMOD::GenericGenePage](/wiki/Bio_GMOD_GenericGenePage)
Perl abstract class that can be used by organizations to generate common
gene pages in XML format.

# Notes for Discussion 2008

From Dongilbert 13:15, 14 July 2008
(EDT) :

In hopes there will be a lively discussion on this topic at the [July
2008 GMOD Meeting](/wiki/July_2008_GMOD_Meeting) here
are some thoughts. I would like to attend, but instead will be later in
the week at the [ISMB 2008](/wiki/ISMB_2008) Toronto meeting, and
hope to hear some outcomes of this.

It seems to me the only real issue in moving forward with a common gene
page, is how to convince MOD projects to adopt the same gene summary
format for our many shared customers. I'd like to see an agreement among
2+ genome data providers to actually produce and deploy a common gene
report (or such data files) within the coming year.

There is a history in genome informatics of everyone doing their own
thing across projects with common genome data and common customer needs.
Some efforts do achieve common usage and consensus: [GFF(3)](/wiki/GFF)
format, [GBrowse](/wiki/GBrowse),
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> schema/db,
[Apollo](/wiki/Apollo) annotator among others.

This common gene report concept to date is to provide consumers of
genome data with the format across projects, both for web display and
for simple computing. It is aimed at simple summaries of gene data,
structured in a common way for many organisms, suitable bioscientists
and students to read and use as web pages and data files (XML) and do
simple computing on if desired. One can see it as alternate option to a
MOD project's full, project-specific documents. It isn't aimed at full,
complex data exchange among databases. Other formats/methods exist for
that.

Although there are engineering details for implementing this for any
project, this isn't likely to be a large effort. We were able to use
simple web-page scraping software to convert existing MOD gene reports
into a common format (see
<a href="http://eugenes.org/gmod/gene-report-examples/"

User-interface and web page design aspects can be tuned to each MOD's
desires. The main thrust is of a common gene page is having common data
labelled in a similar way. Agreement on an XML notation should follow in
a straightforward way from common data fields. I (dgg) will be happy to
work on this with any group of MODs who agree to deploy a common gene
report. Prior software and example UGP-XML cases can be adapted to help
with this.

## Notes from the July 2008 GMOD Meeting

See the [Common Gene
Page](/wiki/July_2008_GMOD_Meeting#Common_Gene_Page)
section of the [July 2008 GMOD
Meeting](/wiki/July_2008_GMOD_Meeting) notes. This
discussion resulted in implementation of the
[Bio::GMOD::GenericGenePage](/wiki/Bio_GMOD_GenericGenePage)
Perl abstract class.

# Example uses

## Early documents and samples

See this folder for some discussion, documents and examples for MOD gene
pages from 2004: <a href="http://eugenes.org/gmod/gene-report-examples/"

## More discussion and samples

See this blog entry on a 2005 meeting discussion,
<a href="http://blog.gmod.org/common_gene_pages" class="external free"

## Daphnia genome database use case

There is an implementation of how this can be used at
<a href="http://wfleabase.org/" class="external text"

XML, with a style sheet to display. For example, see this gene page,
<a href="http://wfleabase.org/lucegene/lookup?id=NCBI_GNO_292134"

(view the page source to see structured gene page XML). Or see these
screen shots
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e3/Daphnia-genepage.png" class="internal"
title="Daphnia-genepage.png">daphnia gene page</a> and
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/96/Daphnia-genepage-xml.png"
class="internal" title="Daphnia-genepage-xml.png">gene page xml</a>.

There is a simple perl tool to turn annotated [GFF](/wiki/GFF) data into
this gene page XML, suitable for search and display, in
<a href="http://gmod.svn.sourceforge.net/viewvc/gmod/genepages"
class="external text" rel="nofollow">GMOD genepages in SVN</a> or
<a href="http://eugenes.org/gmod/gene-report-examples/"

`bin/gff2ugpxml.pl`.

Search and display is then provided by the GMOD
[LuceGene](/wiki/LuceGene) tool, detailed at
[LuceGene_for_Daphnia_genome](/wiki/LuceGene_for_Daphnia_genome).

## Pea aphid genome annotation case

A new Pea aphid genome annotation at
<a href="http://insects.eugenes.org/aphid/" class="external free"

to computed gene models, putative functions and database accession
matches.

Automated annotation of new genomes generates much useful information.
Biologists need to sift through and making sense of these annotations,
to learn what makes sense and is new or specific to that species.
However the computed annotations often generate a large amount of
heterogenous data, from BLAST matches to homologous proteins, to EST
data, several gene predictions, and associated genome features. It takes
a significant bioinformatics effort to arrange these into a common
database structure for management. In the mean time, the biologists who
can most benefit from the details are often left waiting for
computational details.

One option for rapid access to computed gene annotations is to collect
these into a common gene page structure. Within a common gene page
framework the various sequence accessions, gene model evidence, protein
function annotations, and such can be stored and presented for searching
and reports. Biological discovery can proceed using such draft
annotations.

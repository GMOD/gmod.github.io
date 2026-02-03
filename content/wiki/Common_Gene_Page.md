---
title: "Common Gene Page"
---




<span id="top"></span>




# <span dir="auto">Common Gene Page</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Common Gene
  Page Rationale</span>](#Common_Gene_Page_Rationale)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Gene Page
    Sections</span>](#Gene_Page_Sections)
- [<span class="tocnumber">2</span>
  <span class="toctext">Implementation</span>](#Implementation)
- [<span class="tocnumber">3</span> <span class="toctext">Notes for
  Discussion 2008</span>](#Notes_for_Discussion_2008)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Notes from
    the July 2008 GMOD
    Meeting</span>](#Notes_from_the_July_2008_GMOD_Meeting)
- [<span class="tocnumber">4</span> <span class="toctext">Example
  uses</span>](#Example_uses)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Early
    documents and samples</span>](#Early_documents_and_samples)
  - [<span class="tocnumber">4.2</span> <span class="toctext">More
    discussion and samples</span>](#More_discussion_and_samples)
  - [<span class="tocnumber">4.3</span> <span class="toctext">Daphnia
    genome database use case</span>](#Daphnia_genome_database_use_case)
  - [<span class="tocnumber">4.4</span> <span class="toctext">Pea aphid
    genome annotation case</span>](#Pea_aphid_genome_annotation_case)



# <span id="Common_Gene_Page_Rationale" class="mw-headline">Common Gene Page Rationale</span>

Model organism/genome databases (MODs) produce gene pages of similar
gene data, and may benefit from looking at unifying these to common
structure, labelling, etc.

Gene page attributes that have been discussed for inclusion in include
Names, symbols/IDs, synonyms; Map locations; Sequences and Reagents;
Gene ontology; Similar Genes; Database cross-refs and external links;
Alleles and Transcripts; Proteins, Structure and Domains; Expression and
Mutant Phenotypes; Gene Interactions; Literature references; and Summary
Text

## <span id="Gene_Page_Sections" class="mw-headline">Gene Page Sections</span>

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

# <span id="Implementation" class="mw-headline">Implementation</span>

[Discussion](July_2008_GMOD_Meeting#Common_Gene_Page "July 2008 GMOD Meeting")
at the [July 2008 GMOD
Meeting](July_2008_GMOD_Meeting "July 2008 GMOD Meeting") resulted in
the
[Bio%253A%253AGMOD::GenericGenePage](Bio_GMOD_GenericGenePage "Bio GMOD GenericGenePage")
Perl abstract class that can be used by organizations to generate common
gene pages in XML format.

# <span id="Notes_for_Discussion_2008" class="mw-headline">Notes for Discussion 2008</span>

From [Dongilbert](User%253ADongilbert "User%253ADongilbert") 13:15, 14 July 2008
(EDT) :

In hopes there will be a lively discussion on this topic at the [July
2008 GMOD Meeting](July_2008_GMOD_Meeting "July 2008 GMOD Meeting") here
are some thoughts. I would like to attend, but instead will be later in
the week at the [ISMB 2008](ISMB_2008 "ISMB 2008") Toronto meeting, and
hope to hear some outcomes of this.

It seems to me the only real issue in moving forward with a common gene
page, is how to convince MOD projects to adopt the same gene summary
format for our many shared customers. I'd like to see an agreement among
2+ genome data providers to actually produce and deploy a common gene
report (or such data files) within the coming year.

There is a history in genome informatics of everyone doing their own
thing across projects with common genome data and common customer needs.
Some efforts do achieve common usage and consensus: [GFF(3)](GFF "GFF")
format, [GBrowse](GBrowse.1 "GBrowse"),
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> schema/db,
[Apollo](Apollo.1 "Apollo") annotator among others.

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
class="external free"
rel="nofollow">http://eugenes.org/gmod/gene-report-examples/</a>)

User-interface and web page design aspects can be tuned to each MOD's
desires. The main thrust is of a common gene page is having common data
labelled in a similar way. Agreement on an XML notation should follow in
a straightforward way from common data fields. I (dgg) will be happy to
work on this with any group of MODs who agree to deploy a common gene
report. Prior software and example UGP-XML cases can be adapted to help
with this.

## <span id="Notes_from_the_July_2008_GMOD_Meeting" class="mw-headline">Notes from the July 2008 GMOD Meeting</span>

See the [Common Gene
Page](July_2008_GMOD_Meeting#Common_Gene_Page "July 2008 GMOD Meeting")
section of the [July 2008 GMOD
Meeting](July_2008_GMOD_Meeting "July 2008 GMOD Meeting") notes. This
discussion resulted in implementation of the
[Bio%253A%253AGMOD::GenericGenePage](Bio_GMOD_GenericGenePage "Bio GMOD GenericGenePage")
Perl abstract class.

# <span id="Example_uses" class="mw-headline">Example uses</span>

## <span id="Early_documents_and_samples" class="mw-headline">Early documents and samples</span>

See this folder for some discussion, documents and examples for MOD gene
pages from 2004: <a href="http://eugenes.org/gmod/gene-report-examples/"
class="external free"
rel="nofollow">http://eugenes.org/gmod/gene-report-examples/</a>

## <span id="More_discussion_and_samples" class="mw-headline">More discussion and samples</span>

See this blog entry on a 2005 meeting discussion,
<a href="http://blog.gmod.org/common_gene_pages" class="external free"
rel="nofollow">http://blog.gmod.org/common_gene_pages</a>

## <span id="Daphnia_genome_database_use_case" class="mw-headline">Daphnia genome database use case</span>

There is an implementation of how this can be used at
<a href="http://wfleabase.org/" class="external text"
rel="nofollow">Daphnia-base</a>, where the gene reports are structured
XML, with a style sheet to display. For example, see this gene page,
<a href="http://wfleabase.org/lucegene/lookup?id=NCBI_GNO_292134"
class="external free"
rel="nofollow">http://wfleabase.org/lucegene/lookup?id=NCBI_GNO_292134</a>
(view the page source to see structured gene page XML). Or see these
screen shots
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e3/Daphnia-genepage.png" class="internal"
title="Daphnia-genepage.png">daphnia gene page</a> and
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/96/Daphnia-genepage-xml.png"
class="internal" title="Daphnia-genepage-xml.png">gene page xml</a>.

There is a simple perl tool to turn annotated [GFF](GFF "GFF") data into
this gene page XML, suitable for search and display, in
<a href="http://gmod.svn.sourceforge.net/viewvc/gmod/genepages"
class="external text" rel="nofollow">GMOD genepages in SVN</a> or
<a href="http://eugenes.org/gmod/gene-report-examples/"
class="external free"
rel="nofollow">http://eugenes.org/gmod/gene-report-examples/</a> for
`bin/gff2ugpxml.pl`.

Search and display is then provided by the GMOD
[LuceGene](LuceGene "LuceGene") tool, detailed at
[LuceGene_for_Daphnia_genome](LuceGene_for_Daphnia_genome "LuceGene for Daphnia genome").

## <span id="Pea_aphid_genome_annotation_case" class="mw-headline">Pea aphid genome annotation case</span>

A new Pea aphid genome annotation at
<a href="http://insects.eugenes.org/aphid/" class="external free"
rel="nofollow">http://insects.eugenes.org/aphid/</a> offers rapid access
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




[Categories](Special%253ACategories "Special%253ACategories"):

- [Presentations](Category%253APresentations "Category%253APresentations")
- [WFleaBase](Category%253AWFleaBase "Category%253AWFleaBase")
- [Meetings](Category%253AMeetings "Category%253AMeetings")
- [MOD User
  Interfaces](Category%253AMOD_User_Interfaces "Category%253AMOD User Interfaces")







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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Common_Gene_Page" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 19:24 on 4 September
  2013.</span>
<!-- - <span id="footer-info-viewcount">63,583 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





---
title: "Store an unigene in Chado HOWTO"
---




<span id="top"></span>




# <span dir="auto">Store an unigene in Chado HOWTO</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">How to store
  an unigene in a Chado
  database</span>](#How_to_store_an_unigene_in_a_Chado_database)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Chado
    layout</span>](#Chado_layout)
    - [<span class="tocnumber">1.1.1</span>
      <span class="toctext">Analysis</span>](#Analysis)
    - [<span class="tocnumber">1.1.2</span>
      <span class="toctext">ESTs</span>](#ESTs)
    - [<span class="tocnumber">1.1.3</span>
      <span class="toctext">Unigene</span>](#Unigene)
      - [<span class="tocnumber">1.1.3.1</span>
        <span class="toctext">Note</span>](#Note)
    - [<span class="tocnumber">1.1.4</span> <span class="toctext">ESTs
      and assembly alignments</span>](#ESTs_and_assembly_alignments)



# <span id="How_to_store_an_unigene_in_a_Chado_database" class="mw-headline">How to store an unigene in a Chado database</span>

We have an EST set. We have done a clustering and an assembly, so we
have now a set of contigs (assemblies composed by more than one EST) and
singletons (composed by just one EST). In the
<a href="http://www.sequenceontology.org/" class="external text"
rel="nofollow">Sequence ontology</a> an EST is the term <a
href="http://www.sequenceontology.org/miso/current_cvs/term/SO:0000345"
class="external text" rel="nofollow">EST</a> (SO:0000345) ('A tag
produced from a single sequencing read from a cDNA clone or PCR product;
typically a few hundred base pairs long.').

An unigene is the clustering of several ESTs, without taking into
account the assembly. So an unigene would indicate just that the EST1
and EST2 are related, so they belong to the same unigene. But an unigene
does not have any information about how these ESTs are aligned and
assembled. In the
<a href="http://www.sequenceontology.org/" class="external text"
rel="nofollow">Sequence ontology</a> the unigene is named <a
href="http://www.sequenceontology.org/miso/current_cvs/term/SO:0001457"
class="external text" rel="nofollow">transcribed_cluster</a>
(SO:0001457) ('A region defined by a set of transcribed sequences from
the same gene or expressed pseudogene.').

The sequence assembly consensus exists is represented as de residues in
the transcribed_cluster feature.

## <span id="Chado_layout" class="mw-headline">Chado layout</span>

Let's store an unigene in the database:

    transcribed_cluster
    EST1       --------->     (EST) 
    EST2           <--------- (EST)
    consensus  -------------> (stored in the transcribed_cluster residues)

This schema would also work with the NCBI unigenes that do not have
consensus.

We have to store several items in the chado database:

1.  The analysis that has clustered and assembled the ESTs.
2.  The ESTs.
3.  The consensus assembly.
4.  The relationship graph between the ESTs and the consensus (aka the
    unigene cluster)
5.  The alignments between each EST and the consensus.

### <span id="Analysis" class="mw-headline">Analysis</span>

The analysis is stored in the [analysis
table](Chado_Tables#Table:_analysis "Chado Tables"):

- **name**: A way of grouping analyses. This should be a handy short
  identifier that can help people find an analysis they want. For
  instance "unigene clustering", and it should not be assumed to be
  unique. For instance, there may be lots of separate analyses done
  against a cDNA database.
- **description**: Some description of this clustering and assembly
  analysis.
- **program**: Program used, like CAP3 or mira.
- **programversion**:
- **algorithm**:

### <span id="ESTs" class="mw-headline">ESTs</span>

Each EST is stored in the [feature
table](Chado_Tables#Table:_feature "Chado Tables").

- **dbxref_id**: public stable identifier for this EST.
- **name**: Human readable.
- **uniquename**: Unique for this EST in this organism.
- **residues**: The sequence of nucleotides.
- **seqlen**: The sequence length.
- **md5checksum**: The sequence md5checksum.
- **type_id**: 345
- **is_analysis**: False

| dbxref_id  | organism    | name   | uniquename | type_id   | is_analysis |
|------------|-------------|--------|------------|-----------|-------------|
| CMV:EST001 | organism id | EST001 | CMV:EST001 | SO:345 id | False       |
| CMV:EST002 | organism id | EST002 | CMV:EST002 | SO:345 id | False       |

### <span id="Unigene" class="mw-headline">Unigene</span>

The unigene is the set of ESTs and the consensus. It is represented by a
feature and by a feature graph. This graph defines which ESTs and
assemblies belong to which unigenes. Each EST is part of the unigene
cluster.

If there is a consensus sequence it should be stored in this feature
residues.

The feature entry for the unigene.

| dbxref_id  | organism | name   | uniquename | type_id    | is_analysis |
|------------|----------|--------|------------|------------|-------------|
| CMV:UNI001 | ?        | UNI001 | CMV:UNI001 | SO:1457 id | True        |

The feature relationships (feature graph).

| subject_id | object_id | type_id    | rank |
|------------|-----------|------------|------|
| EST001 id  | UNI001 id | part_of id | 0    |
| EST002 id  | UNI000 id | part_of id | 0    |

#### <span id="Note" class="mw-headline">Note</span>

A unigene_cluster is a subtype of transcribed_cluster and represents a
specific clustering methodology used by the NCBI to produce UniGenes
(<a href="http://www.ncbi.nlm.nih.gov/unigene" class="external free"
rel="nofollow">http://www.ncbi.nlm.nih.gov/unigene</a>). If the
clustering algorithm used was not Unigene you would use
transcribed_cluster.

### <span id="ESTs_and_assembly_alignments" class="mw-headline">ESTs and assembly alignments</span>

The ESTs are all aligned with the assembly consensus. For each EST there
is an alignment. For each alignment there is:

- a feature (type <a
  href="http://www.sequenceontology.org/miso/current_cvs/term/SO:0000668"
  class="external text" rel="nofollow">EST_match</a> (SO:0000668))
- an entry in the analysis feature table.
- two feature_locs, one for the consensus assembly and another for the
  EST.

Additional features for the alignments.

| organism | uniquename      | type_id   | is_analysis |
|----------|-----------------|-----------|-------------|
| ?        | CMV:UNI001_EST1 | SO:668 id | True        |
| ?        | CMV:UNI001_EST2 | SO:668 id | True        |

An [analysisfeature](Chado_Tables#Table:_analysisfeature "Chado Tables")
for each of the previous features with the alignment scores. If we don't
need to store these scores, maybe be this table could be optional.

| feature_id         | analysis_id                | identity       |
|--------------------|----------------------------|----------------|
| CMV:UNI001_EST1 id | EST clustering analysis id | The identity % |
| CMV:UNI001_EST2 id | EST clustering analysis id | The identity % |

The alignment coordinates are stored in two featurelocs in the
[featureloc table](Chado_Tables#Table:_featureloc "Chado Tables").

| feature_id | srcfeature_id | fmin | fmax | strand | residue_info | rank |
|----|----|----|----|----|----|----|
| CMV:UNI001_EST1 id | UNI001 id | leftmost boundary | rightmost boundary | strand | CIGAR | 0 |
| CMV:UNI001_EST1 id | EST001 id | leftmost boundary | rightmost boundary | strand | CIGAR | 1 |
| CMV:UNI001_EST2 id | UNI001 id | leftmost boundary | rightmost boundary | strand | CIGAR | 0 |
| CMV:UNI001_EST2 id | EST002 id | leftmost boundary | rightmost boundary | strand | CIGAR | 1 |




[Categories](Special%253ACategories "Special%253ACategories"):

- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")
- [Chado](Category%253AChado "Category%253AChado")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Store_an_unigene_in_Chado_HOWTO"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 04:42 on 22 May
  2009.</span>
<!-- - <span id="footer-info-viewcount">13,954 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





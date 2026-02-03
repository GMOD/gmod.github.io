---
title: "Introduction to Chado"
---




<span id="top"></span>




# <span dir="auto">Introduction to Chado</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">What's a
  chado?</span>](#What.27s_a_chado.3F)
- [<span class="tocnumber">2</span> <span class="toctext">Chado - the
  way of tea</span>](#Chado_-_the_way_of_tea)
- [<span class="tocnumber">3</span> <span class="toctext">What
  Documentation Exists for
  chado?</span>](#What_Documentation_Exists_for_chado.3F)
- [<span class="tocnumber">4</span> <span class="toctext">A Modular
  Schema</span>](#A_Modular_Schema)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Chado
    Module List</span>](#Chado_Module_List)
- [<span class="tocnumber">5</span> <span class="toctext">The Sequence
  Module and Features</span>](#The_Sequence_Module_and_Features)
  - [<span class="tocnumber">5.1</span>
    <span class="toctext">Definition</span>](#Definition)
  - [<span class="tocnumber">5.2</span> <span class="toctext">Feature
    Types: an *Ontology*</span>](#Feature_Types:_an_Ontology)
  - [<span class="tocnumber">5.3</span> <span class="toctext">Some other
    feature types</span>](#Some_other_feature_types)
- [<span class="tocnumber">6</span> <span class="toctext">Feature
  Graphs</span>](#Feature_Graphs)
- [<span class="tocnumber">7</span> <span class="toctext">Feature Graph
  Transformations</span>](#Feature_Graph_Transformations)
- [<span class="tocnumber">8</span> <span class="toctext">Representing
  Graphs in a Relational
  Database</span>](#Representing_Graphs_in_a_Relational_Database)
- [<span class="tocnumber">9</span> <span class="toctext">Representing
  Ontology Graphs in
  Chado</span>](#Representing_Ontology_Graphs_in_Chado)
- [<span class="tocnumber">10</span> <span class="toctext">Representing
  Feature Graphs in Chado</span>](#Representing_Feature_Graphs_in_Chado)
  - [<span class="tocnumber">10.1</span> <span class="toctext">Features
    are typed</span>](#Features_are_typed)
- [<span class="tocnumber">11</span> <span class="toctext">Querying
  Graphs</span>](#Querying_Graphs)
- [<span class="tocnumber">12</span> <span class="toctext">Using views
  to simplify queries</span>](#Using_views_to_simplify_queries)
- [<span class="tocnumber">13</span> <span class="toctext">Extensible
  Attributes</span>](#Extensible_Attributes)
- [<span class="tocnumber">14</span> <span class="toctext">Localising
  Features in Sequence
  Coordinates</span>](#Localising_Features_in_Sequence_Coordinates)
- [<span class="tocnumber">15</span> <span class="toctext">Interbase
  Coordinates</span>](#Interbase_Coordinates)
- [<span class="tocnumber">16</span> <span class="toctext">Basic
  example - with locations</span>](#Basic_example_-_with_locations)
- [<span class="tocnumber">17</span> <span class="toctext">Locations can
  be nested</span>](#Locations_can_be_nested)
- [<span class="tocnumber">18</span> <span class="toctext">Computational
  analysis: Predictions</span>](#Computational_analysis:_Predictions)
- [<span class="tocnumber">19</span> <span class="toctext">Computational
  analysis: Similarity
  results</span>](#Computational_analysis:_Similarity_results)
- [<span class="tocnumber">20</span> <span class="toctext">Computational
  analysis: Multiple
  alignments</span>](#Computational_analysis:_Multiple_alignments)
- [<span class="tocnumber">21</span> <span class="toctext">Variation
  features</span>](#Variation_features)
- [<span class="tocnumber">22</span> <span class="toctext">Bioperl and
  chado mapping</span>](#Bioperl_and_chado_mapping)
- [<span class="tocnumber">23</span>
  <span class="toctext">Acknowledgements</span>](#Acknowledgements)
  - [<span class="tocnumber">23.1</span> <span class="toctext">Schema
    design</span>](#Schema_design)
  - [<span class="tocnumber">23.2</span> <span class="toctext">Chado
    beta testers and other
    feedback</span>](#Chado_beta_testers_and_other_feedback)
- [<span class="tocnumber">24</span> <span class="toctext">About this
  Page</span>](#About_this_Page)



## <span id="What.27s_a_chado.3F" class="mw-headline">What's a chado?</span>

- At first, a database for FlyBase: incredibly interesting dataset
- A database for **very** deep curation
- An integrated database
- A database that is generic enough to use for any organism

  

## <span id="Chado_-_the_way_of_tea" class="mw-headline">Chado - the way of tea</span>

Why the reference to tea? According to ancient GMOD lore, legend has it
that creators Chris Mungall and Dave Emmert were drinking tea in a tea
house when they developed the first design that eventually became Chado.

  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/31/Chado.jpg" width="417" height="273"
alt="Chado.jpg" />

  

## <span id="What_Documentation_Exists_for_chado.3F" class="mw-headline">What Documentation Exists for chado?</span>

This Wiki is currently the best source of documentation for Chado. Here
are more useful pages in the Wiki:

- [Getting Started](Chado_-_Getting_Started "Chado - Getting Started")
- [Chado Manual](Chado_Manual "Chado Manual")
- [Best Practices](Chado_Best_Practices "Chado Best Practices")

  

## <span id="A_Modular_Schema" class="mw-headline">A Modular Schema</span>

### <span id="Chado_Module_List" class="mw-headline">Chado Module List</span>

- [Audit](Chado_Audit_Module "Chado Audit Module") - for database audit
  trails
- [Companalysis](Chado_Companalysis_Module "Chado Companalysis Module") -
  for data from computational analysis
- [Contact](Chado_Contact_Module "Chado Contact Module") - for people,
  groups, and organizations
- [Controlled Vocabulary (cv)](Chado_CV_Module "Chado CV Module") - for
  controlled vocabularies and ontologies
- [Expression](Chado_Expression_Module "Chado Expression Module") - for
  summaries of RNA and protein expression
- [General](Chado_General_Module "Chado General Module") - for
  identifiers
- [Genetic](Chado_Genetic_Module "Chado Genetic Module") - for genetic
  data and genotypes
- [Library](Chado_Library_Module "Chado Library Module") - for
  descriptions of molecular libraries
- [Mage](Chado_Mage_Module "Chado Mage Module") - for microarray data
- [Map](Chado_Map_Module "Chado Map Module") - for maps without sequence
- [Natural Diversity
  (ND)](Chado_Natural_Diversity_Module.1 "Chado Natural Diversity Module") -
  for multiple experiments, such as phenotyping and genotyping
- [Organism](Chado_Organism_Module "Chado Organism Module") - for
  taxonomic data
- [Phenotype](Chado_Phenotype_Module "Chado Phenotype Module") - for
  phenotypic data
- [Phylogeny](Chado_Phylogeny_Module "Chado Phylogeny Module") - for
  organisms and phylogenetic trees
- [Publication
  (pub)](Chado_Publication_Module "Chado Publication Module") - for
  publications and references
- [Sequence](Chado_Sequence_Module "Chado Sequence Module") - for
  sequences and sequence features
- [Stock](Chado_Stock_Module "Chado Stock Module") - for specimens and
  biological collections
- [WWW](Chado_WWW_Module "Chado WWW Module") -

There are *dependencies* between the modules.

This page is focused on the [sequence
module](Chado_Sequence_Module "Chado Sequence Module"); we will also
discuss parts of the [cv module](Chado_CV_Module "Chado CV Module") as
ontologies are crucial to how chado represents all data.

The actual chado tables themselves are not discussed in
attribute-by-attribute detail; this can be browsed by checking out the
[Chado Manual](Chado_Manual "Chado Manual").

One of the main strengths of chado is that it brings the sequence and
genetics views of the world together.

Let's look at the chado conceptualisation of the world before diving in
to the schema design.

## <span id="The_Sequence_Module_and_Features" class="mw-headline">The Sequence Module and Features</span>

### <span id="Definition" class="mw-headline">Definition</span>

- A feature is a *thingy*
- A feature is a *potentially localisable*
- A feature is further defined by an ontology

### <span id="Feature_Types:_an_Ontology" class="mw-headline">Feature Types: an *Ontology*</span>

One way of representing ontologies is through a graph model, with nodes
representing concepts and edges representing *relationship types*
between the concepts.

**Simplified Sequence Ontology**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/16/So-slim-example.png" width="705"
height="558" alt="So-slim-example.png" />  

**is_a**: subtypes, specialisation/generalization  
**part_of**: compositional

### <span id="Some_other_feature_types" class="mw-headline">Some other feature types</span>

- HSP
- protein domain
- chromosome arm
- contig
- scaffold
- regulatory region
- variation features: insertions, deletions, SNPs

  

## <span id="Feature_Graphs" class="mw-headline">Feature Graphs</span>

<table data-border="2" data-cellpadding="4" data-cellspacing="0"
style="margin: 1em 1em 1em 0; background: #ffaaaa; border: 2px #aaa solid; border-collapse: collapse;"
data-align="right" width="200px">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><span class="small"><strong>Problem/Question</strong></span>:<br />
&#10;<p>The compositional relationships are a subset of the relationships
from gene to CDS in SO. How does one decide where to simplify the
graph?</p></td>
</tr>
</tbody>
</table>

The nodes in the graph represent instances of features - the arcs in
these cases represent compositional relationships (although other
relationship types are possible). Feature graphs do **not** represent
positional or spatial relationships - we will get to that later. For
more on representing genes also see [Chado Best
Practices](Chado_Best_Practices "Chado Best Practices").

**Basic Central Dogma Example**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/62/Basic-central-dogma.png" width="350"
height="376" alt="Basic-central-dogma.png" />  
One gene, one transcript, one exon, one protein

**Alternate Splicing**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a0/Alt-splicing.png" width="494" height="376"
alt="Alt-splicing.png" />  

**Dicistronic Gene**

A dicistronic gene is a gene with a mRNA that codes for two distinct
non-overlapping CDSs. Dicistronic genes (see for example, the
\[Drosophila Adh and Adhr genes
<a href="http://www.flybase.org/reports/FBgn0000056.html"
class="external free"
rel="nofollow">http://www.flybase.org/reports/FBgn0000056.html</a>\])
have totally distinct gene products deriving from the same transcript.
To confuse matters, the two polypeptides are commonly referred to as
being derived from two distinct genes (e.g. Adh and Adhr). In a database
such as \[FlyBase <a href="http://flybase.org/" class="external free"
rel="nofollow">http://flybase.org/</a>\], there are 3 gene IDs stored in
the database - one for each of the two non-overlapping genes, and one
for the gene cassette.

Dicistronic genes make it difficult to have a formal definition of gene
that corresponds nicely with how biologists use the term.  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/da/Dicistronic-gene.png" width="449"
height="472" alt="Dicistronic-gene.png" />  

**Trans-splicing**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/67/Transsplicing.png" width="646"
height="376" alt="Transsplicing.png" />  

Other cases of trans-splicing may involve spatially distributed primary
transcripts.

## <span id="Feature_Graph_Transformations" class="mw-headline">Feature Graph Transformations</span>

**CDS boundaries + exons IMPLIES CDS exons**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f1/Inferred_cds_exons.png" width="653"
height="376" alt="Inferred cds exons.png" />  

**exons IMPLIES introns**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b7/Inferred_introns.png" width="665"
height="376" alt="Inferred introns.png" />  

## <span id="Representing_Graphs_in_a_Relational_Database" class="mw-headline">Representing Graphs in a Relational Database</span>

A graph can be defined as a collection of **Edges** (arcs) and
**Vertices** (nodes).

  
**Two table structure required for representing graphs**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/54/Rel-graph.png" width="236" height="138"
alt="Rel-graph.png" />  

## <span id="Representing_Ontology_Graphs_in_Chado" class="mw-headline">Representing Ontology Graphs in Chado</span>

**cvterms (controlled vocabulary terms) connected by cvrelationships**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ed/Chado-ont.png" width="363" height="138"
alt="Chado-ont.png" />  

  
The relationship type is a controlled term in itself. Each
cvrelationship can be thought of as a SUBJECT PREDICATE OBJECT statement
(eg "GPCR *is-a* transmembrane_receptor).

The structure above is exactly the same as the RDF datamodel - many
modern ontology languages (eg DAML, OWL) are layered on top of RDF, so
the above structure ensures we will be able to represent all the most
advanced ontological concepts.

## <span id="Representing_Feature_Graphs_in_Chado" class="mw-headline">Representing Feature Graphs in Chado</span>

**features are the nodes - feature_relationships are the arcs**  

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/9d/Fgraph.png" width="597" height="138"
alt="Fgraph.png" />  

Note: the different classes of features could be modeled relationally;
the principle is to keep the stable stuff modeled relationally, and the
fluid/extensible stuff modeled in an ontology that sits in a generic
database structure.

  

### <span id="Features_are_typed" class="mw-headline">Features are typed</span>

  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3d/Chado-feat.png" width="260" height="98"
alt="Chado-feat.png" />  

## <span id="Querying_Graphs" class="mw-headline">Querying Graphs</span>

Most implementations of SQL are *non-recursive*.

Problem: find all genes; find all genes (generic) find all noncoding
genes find all protein coding genes find all tRNA genes find all snRNA
genes find all snoRNA genes ...etc eek!

**Solution: pre-compute
<a href="http://en.wikipedia.org/wiki/Transitive_closure"
class="external text" rel="nofollow"><em>transitive closure</em></a>**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/89/Chado-Go.png" width="625" height="366"
alt="Chado-Go.png" />  
GO Ontology subgraph

**Transitive closure of graph:**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/36/Transitive_closure.png" width="741"
height="532" alt="Transitive closure.png" />  
Solid lines represent the actual relationships. The collection of dotted
lines is the closure of the relationships.

  

    forall x      ALWAYS TRUE:     x R* x

    x R y             IMPLIES:     x R* y

    x R y,  y R* z    IMPLIES:     x R* z

## <span id="Using_views_to_simplify_queries" class="mw-headline">Using views to simplify queries</span>

The following view uses the
[cvpath](Chado_Tables#Table:_cvpath "Chado Tables") table, which
includes the closure of the *is_a* relationship.


``` de1
 CREATE VIEW fgene AS
   SELECT
     feature.*
   FROM
     feature INNER JOIN cvpath ON (feature.ftype_id = cvpath.subjterm_id)
     INNER JOIN cvterm ON (cvpath.objterm_id = cvterm.cvterm_id)
   WHERE cvterm.termname = 'gene';
```


At Flybase we will mostly be using chado in *data-mining* mode - i.e. we
will be querying, not updating. This means we can *materialize* views
for speed.

## <span id="Extensible_Attributes" class="mw-headline">Extensible Attributes</span>

The chado relational model defines a fixed set of attributes for a
[feature](Chado_Tables#Table:_feature "Chado Tables"):

| Field | Required | Description |
|----|----|----|
| dbxref_id | no | namespaced identifier (foreign key) |
| name | no | A not-guaranteed-unique identifier that is useful to a human |
| uniquename | yes | name or identifier that is unique in the database |
| residues | no | DNA, RNA or protein sequence |
| md5checksum | no | signature of sequence |
| seqlen | no | length of sequence (may be present even if residues is absent) |
| type_id | yes | <a href="http://sequenceontology.org" class="external text"
rel="nofollow">Sequence Ontology</a> feature type (foreign key) |

  
What happens if we want to include other attributes specific to certain
projects, or specific to certain feature types? We can use an extensible
feature property paradigm:

  
**We can attach any properties we like to feature:**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/ff/Fprop.png" width="500" height="129"
alt="Fprop.png" />  

## <span id="Localising_Features_in_Sequence_Coordinates" class="mw-headline">Localising Features in Sequence Coordinates</span>

All sequence localisations are with respect to another feature.

A feature can have multiple locations - however, "split" locations are
**not** used (for an example of a split location, look at how Genbank
represents a transcript).

**Any feature can have 0 to many locations:**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/42/Floc.png" width="479" height="137"
alt="Floc.png" />  
Each location is relative to another feature (the **srcfeature**)

The **featureloc** table includes the following attributes:

- fmin - 5' boundary of features
- fmax - 3' boundary of features
- strand: the direction of the feature, relative to srcfeature

locations have *directional semantics* (like mathematical vectors). this
is different from the min/max semantics used by e.g.
<a href="http://bioperl.org" class="external text"
rel="nofollow">Bioperl</a>, genbank

## <span id="Interbase_Coordinates" class="mw-headline">Interbase Coordinates</span>

**Chado uses *interbase* coordinates.**

Interbase counts spaces, not bases. It is a 0-based coordinate system;
counting starts at zero. This coordinate system is appealing for a
variety of mathematical reasons. Standard (eg genbank, blast) coordinate
systems do not allow for a natural representation of zero-length
features. An example of a zero-length feature is a cleavage site that is
between, but does not include, 2 amino acids. Using interbase
coordinates the total number of base pairs in a feature is calculated by
subtracting the starting coordinate from the ending coordinate, without
the need for an off-by-1 addition required by other coordinate systems.
(In general, much mathematical utility is enabled by the number zero.)

**Interbase coordinates (top) and base-oriented (below)**  
  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a0/Interbase.png" width="352" height="296"
alt="Interbase.png" />  
  
The position of the ATG in interbase is \[3, 6\] (between the 3rd and
6th gaps)  
The position of the ATG in base coordinates is \[4, 6\] (between 4th and
6th bases inclusive)

Note the different arithmetic for calculating length in these two
systems.

Unlike mathematical vectors, we must also explicitly store the
directionality (strand). Even though this is surplus to requirements
most of the time, it is required for zero-length features, and for
circular chromosomes.

## <span id="Basic_example_-_with_locations" class="mw-headline">Basic example - with locations</span>

**Central dogma - with exons and CDSs localised**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/32/Bcd-loc.png" width="314" height="403"
alt="Bcd-loc.png" />  
Using the principle of minimal storage (do not store anything that does
not increase the *information content* of the database - i.e. nothing
redundant), we store only exon and CDS boundary localisations. In the
<a href="http://www.fruitfly.org/" class="external text"
rel="nofollow">Berkeley Drosophila Genome Project (BDGP)</a> data
warehouse instantiation of Chado, we may choose to store locations for
all features where known - this can vastly simplify some queries, but
care must be taken to make sure we don't end up with inconsistent data.

For the most part, inferring the boundaries of composite features
requires fairly simple graph transformations, although care must be
taken for the genes that break central dogma rules.

## <span id="Locations_can_be_nested" class="mw-headline">Locations can be nested</span>

**A repeat localised to a contig, itself on a chromosome arm**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/52/Nested-loc.png" width="188" height="323"
alt="Nested-loc.png" />  
**featureloc**s are represented by dashed lines.

Note that the position of the repeat on the chromosome arm is implicit,
and can be calculated with a simple graph transform, but following the
principle of minimal storage, we do not store this in the management
database.

If we wish to store the redundant position in a for-querying copy of the
db, chado allows us this option - we can have as many locations as we
like for a feature. We use an extra attribute called **locgroup** to
distinguish locations. locgroup=0 is conventionally used for the
non-redundant location.

**The repeat feature now has two locations**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/58/Nested-loc-redundant.png" width="260"
height="323" alt="Nested-loc-redundant.png" />  
If you look at the underlying data, you will see that the featureloc
that locates the repeat on the arm has a locgroup values of **1**.

## <span id="Computational_analysis:_Predictions" class="mw-headline">Computational analysis: Predictions</span>

All predictions are handled analagously to standard central dogma cases.
Compute results have scores, and are attached to tuples in the analysis
table - this is what distinguishes them from "annotations".

<a href="http://www.bioperl.org/wiki/Genscan" class="extiw"
title="bp:Genscan">Genscan</a> predicts CDSs and CDS exons (not genes in
the Sequence Ontology sense). A typical Genscan prediction may look like
this:

**Genscan 3-exon 'gene' prediction**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/6c/Genscan.png" width="589" height="206"
alt="Genscan.png" />  

## <span id="Computational_analysis:_Similarity_results" class="mw-headline">Computational analysis: Similarity results</span>

Pairwise similarities (e.g. BLAST) and multiple alignments (e.g.
CLUSTAL) are represented differently.

Pairwise alignments produce **HSP**s. HSPs are scored features with two
locations - one on the query, one on the subject.

**Blast hit with 3 HSPs**  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e7/Blast.png" width="904" height="206"
alt="Blast.png" />  
Each HSP has two featurelocs. featureloc has an attribute *rank* to
order the locations; by convention 0 is the query rank and 1 is the
subject rank.

## <span id="Computational_analysis:_Multiple_alignments" class="mw-headline">Computational analysis: Multiple alignments</span>

These are treated analagously to pairwise alignments - just add more
locations.

  

## <span id="Variation_features" class="mw-headline">Variation features</span>

Variation features (e.g. SNPs, insertions, deletions) are treated in a
similar fashion to pairwise alignments.

  

## <span id="Bioperl_and_chado_mapping" class="mw-headline">Bioperl and chado mapping</span>

There are important differences between the Bioperl and chado models.

Bioperl allows a feature to have multiple non-contiguous locations. Even
though the chado schema allows multiple locations, attaching multiple
non-contiguous locations is a violation of the chado semantics. To cope
with this, we create extra features for the sublocations. For instance,
for a transcript, we would create an exon for each of the sublocations.

If you parse a genbank file including variations (e.g. SNPs) into
Bioperl objects, you will get a feature with two properties of type
"allele". This can be represented using chado; however, the chado
semantics state that these variations should be represented using
multiple locations.

## <span id="Acknowledgements" class="mw-headline">Acknowledgements</span>

### <span id="Schema_design" class="mw-headline">Schema design</span>

- Dave Emmert
- Colin Wiel
- Stan Letovsky
- ShengQuiang Shu
- Pinglei Zhou
- Suzanna Lewis

### <span id="Chado_beta_testers_and_other_feedback" class="mw-headline">Chado beta testers and other feedback</span>

- Mark Yandell
- Aubrey de Grey

  

## <span id="About_this_Page" class="mw-headline">About this Page</span>

- This page is a Wikified version of a
  <a href="http://archive.is/ENOJk" class="external text"
  rel="nofollow">presentation by Chris Mungall</a>.




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado Modules](Category%253AChado_Modules "Category%253AChado Modules")
- [Pages with problems or
  questions](Category%253APages_with_problems_or_questions "Category%253APages with problems or questions")
- [Chado](Category%253AChado "Category%253AChado")






## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AIntroduction_to_Chado" accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>





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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Introduction_to_Chado" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:45 on 11 January
  2019.</span>
<!-- - <span id="footer-info-viewcount">321,200 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





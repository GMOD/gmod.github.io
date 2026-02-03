---
title: "Introduction to Chado"
---
# Introduction to Chado

  chado?</span>](#What.27s_a_chado.3F)
- [Chado - the
  way of tea](#Chado_-_the_way_of_tea)
- [What
  Documentation Exists for
  chado?](#What_Documentation_Exists_for_chado.3F)
- [A Modular
  Schema](#A_Modular_Schema)
  - [Chado
    Module List](#Chado_Module_List)
- [The Sequence
  Module and Features](#The_Sequence_Module_and_Features)
  - [Definition](#Definition)
  - [Feature
    Types: an *Ontology*](#Feature_Types:_an_Ontology)
  - [Some other
    feature types](#Some_other_feature_types)
- [Feature
  Graphs](#Feature_Graphs)
- [Feature Graph
  Transformations](#Feature_Graph_Transformations)
- [Representing
  Graphs in a Relational
  Database](#Representing_Graphs_in_a_Relational_Database)
- [Representing
  Ontology Graphs in
  Chado](#Representing_Ontology_Graphs_in_Chado)
- [Representing
  Feature Graphs in Chado](#Representing_Feature_Graphs_in_Chado)
  - [Features
    are typed](#Features_are_typed)
- [Querying
  Graphs](#Querying_Graphs)
- [Using views
  to simplify queries](#Using_views_to_simplify_queries)
- [Extensible
  Attributes](#Extensible_Attributes)
- [Localising
  Features in Sequence
  Coordinates](#Localising_Features_in_Sequence_Coordinates)
- [Interbase
  Coordinates](#Interbase_Coordinates)
- [Basic
  example - with locations](#Basic_example_-_with_locations)
- [Locations can
  be nested](#Locations_can_be_nested)
- [Computational
  analysis: Predictions](#Computational_analysis:_Predictions)
- [Computational
  analysis: Similarity
  results](#Computational_analysis:_Similarity_results)
- [Computational
  analysis: Multiple
  alignments](#Computational_analysis:_Multiple_alignments)
- [Variation
  features](#Variation_features)
- [Bioperl and
  chado mapping](#Bioperl_and_chado_mapping)
- [Acknowledgements](#Acknowledgements)
  - [Schema
    design](#Schema_design)
  - [Chado
    beta testers and other
    feedback](#Chado_beta_testers_and_other_feedback)
- [About this
  Page](#About_this_Page)

## What's a chado?

- At first, a database for FlyBase: incredibly interesting dataset
- A database for **very** deep curation
- An integrated database
- A database that is generic enough to use for any organism

## Chado - the way of tea

Why the reference to tea? According to ancient GMOD lore, legend has it
that creators Chris Mungall and Dave Emmert were drinking tea in a tea
house when they developed the first design that eventually became Chado.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/31/Chado.jpg" width="417" height="273"
alt="Chado.jpg" />

## What Documentation Exists for chado?

This Wiki is currently the best source of documentation for Chado. Here
are more useful pages in the Wiki:

- [Getting Started](/wiki/Chado_-_Getting_Started)
- [Chado Manual](/wiki/Chado_Manual)
- [Best Practices](/wiki/Chado_Best_Practices)

## A Modular Schema

### Chado Module List

- [Audit](/wiki/Chado_Audit_Module) - for database audit
  trails
- [Companalysis](/wiki/Chado_Companalysis_Module) -
  for data from computational analysis
- [Contact](/wiki/Chado_Contact_Module) - for people,
  groups, and organizations
- [Controlled Vocabulary (cv)](/wiki/Chado_CV_Module) - for
  controlled vocabularies and ontologies
- [Expression](/wiki/Chado_Expression_Module) - for
  summaries of RNA and protein expression
- [General](/wiki/Chado_General_Module) - for
  identifiers
- [Genetic](/wiki/Chado_Genetic_Module) - for genetic
  data and genotypes
- [Library](/wiki/Chado_Library_Module) - for
  descriptions of molecular libraries
- [Mage](/wiki/Chado_Mage_Module) - for microarray data
- [Map](/wiki/Chado_Map_Module) - for maps without sequence
- [Natural Diversity
  (ND)](/wiki/Chado_Natural_Diversity_Module.1) -
  for multiple experiments, such as phenotyping and genotyping
- [Organism](/wiki/Chado_Organism_Module) - for
  taxonomic data
- [Phenotype](/wiki/Chado_Phenotype_Module) - for
  phenotypic data
- [Phylogeny](/wiki/Chado_Phylogeny_Module) - for
  organisms and phylogenetic trees
- [Publication
  (pub)](/wiki/Chado_Publication_Module) - for
  publications and references
- [Sequence](/wiki/Chado_Sequence_Module) - for
  sequences and sequence features
- [Stock](/wiki/Chado_Stock_Module) - for specimens and
  biological collections
- [WWW](/wiki/Chado_WWW_Module) -

There are *dependencies* between the modules.

This page is focused on the [sequence
module](/wiki/Chado_Sequence_Module); we will also
discuss parts of the [cv module](/wiki/Chado_CV_Module) as
ontologies are crucial to how chado represents all data.

The actual chado tables themselves are not discussed in
attribute-by-attribute detail; this can be browsed by checking out the
[Chado Manual](/wiki/Chado_Manual).

One of the main strengths of chado is that it brings the sequence and
genetics views of the world together.

Let's look at the chado conceptualisation of the world before diving in
to the schema design.

## The Sequence Module and Features

### Definition

- A feature is a *thingy*
- A feature is a *potentially localisable*
- A feature is further defined by an ontology

### Feature Types: an *Ontology*

One way of representing ontologies is through a graph model, with nodes
representing concepts and edges representing *relationship types*
between the concepts.

**Simplified Sequence Ontology**
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/16/So-slim-example.png" width="705"
height="558" alt="So-slim-example.png" />

**is_a**: subtypes, specialisation/generalization
**part_of**: compositional

### Some other feature types

- HSP
- protein domain
- chromosome arm
- contig
- scaffold
- regulatory region
- variation features: insertions, deletions, SNPs

## Feature Graphs

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
Practices](/wiki/Chado_Best_Practices).

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

have totally distinct gene products deriving from the same transcript.
To confuse matters, the two polypeptides are commonly referred to as
being derived from two distinct genes (e.g. Adh and Adhr). In a database
such as \[FlyBase <a href="http://flybase.org/" class="external free"

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

## Feature Graph Transformations

**CDS boundaries + exons IMPLIES CDS exons**
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f1/Inferred_cds_exons.png" width="653"
height="376" alt="Inferred cds exons.png" />

**exons IMPLIES introns**
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b7/Inferred_introns.png" width="665"
height="376" alt="Inferred introns.png" />

## Representing Graphs in a Relational Database

A graph can be defined as a collection of **Edges** (arcs) and
**Vertices** (nodes).

**Two table structure required for representing graphs**
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/54/Rel-graph.png" width="236" height="138"
alt="Rel-graph.png" />

## Representing Ontology Graphs in Chado

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

## Representing Feature Graphs in Chado

**features are the nodes - feature_relationships are the arcs**

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/9d/Fgraph.png" width="597" height="138"
alt="Fgraph.png" />

Note: the different classes of features could be modeled relationally;
the principle is to keep the stable stuff modeled relationally, and the
fluid/extensible stuff modeled in an ontology that sits in a generic
database structure.

### Features are typed

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3d/Chado-feat.png" width="260" height="98"
alt="Chado-feat.png" />

## Querying Graphs

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

## Using views to simplify queries

The following view uses the
[cvpath](/wiki/Chado_Tables#Table:_cvpath) table, which
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

## Extensible Attributes

The chado relational model defines a fixed set of attributes for a
[feature](/wiki/Chado_Tables#Table:_feature):

| Field | Required | Description |
|----|----|----|
| dbxref_id | no | namespaced identifier (foreign key) |
| name | no | A not-guaranteed-unique identifier that is useful to a human |
| uniquename | yes | name or identifier that is unique in the database |
| residues | no | DNA, RNA or protein sequence |
| md5checksum | no | signature of sequence |
| seqlen | no | length of sequence (may be present even if residues is absent) |
| type_id | yes | <a href="http://sequenceontology.org" class="external text" |

What happens if we want to include other attributes specific to certain
projects, or specific to certain feature types? We can use an extensible
feature property paradigm:

**We can attach any properties we like to feature:**
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/ff/Fprop.png" width="500" height="129"
alt="Fprop.png" />

## Localising Features in Sequence Coordinates

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

## Interbase Coordinates

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

## Basic example - with locations

**Central dogma - with exons and CDSs localised**
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/32/Bcd-loc.png" width="314" height="403"
alt="Bcd-loc.png" />
Using the principle of minimal storage (do not store anything that does
not increase the *information content* of the database - i.e. nothing
redundant), we store only exon and CDS boundary localisations. In the
<a href="http://www.fruitfly.org/" class="external text"

warehouse instantiation of Chado, we may choose to store locations for
all features where known - this can vastly simplify some queries, but
care must be taken to make sure we don't end up with inconsistent data.

For the most part, inferring the boundaries of composite features
requires fairly simple graph transformations, although care must be
taken for the genes that break central dogma rules.

## Locations can be nested

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

## Computational analysis: Predictions

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

## Computational analysis: Similarity results

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

## Computational analysis: Multiple alignments

These are treated analagously to pairwise alignments - just add more
locations.

## Variation features

Variation features (e.g. SNPs, insertions, deletions) are treated in a
similar fashion to pairwise alignments.

## Bioperl and chado mapping

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

## Acknowledgements

### Schema design

- Dave Emmert
- Colin Wiel
- Stan Letovsky
- ShengQuiang Shu
- Pinglei Zhou
- Suzanna Lewis

### Chado beta testers and other feedback

- Mark Yandell
- Aubrey de Grey

## About this Page

- This page is a Wikified version of a
  <a href="http://archive.is/ENOJk" class="external text"
  rel="nofollow">presentation by Chris Mungall</a>.

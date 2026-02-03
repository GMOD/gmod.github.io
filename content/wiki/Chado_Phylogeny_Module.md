---
title: "Chado Phylogeny Module"
---
# Chado Phylogeny Module

  Introduction](#Introduction)
  - [Annotating
    nodes](#Annotating_nodes)
  - [Open
    Issues](#Open_Issues)
- [More
  Information](#More_Information)
- [Tables](#Tables)
  - [Table:
    phylonode](#Table:_phylonode)
  - [Table:
    phylonode_dbxref](#Table:_phylonode_dbxref)
  - [Table:
    phylonode_organism](#Table:_phylonode_organism)
  - [Table:
    phylonode_pub](#Table:_phylonode_pub)
  - [Table:
    phylonode_relationship](#Table:_phylonode_relationship)
  - [Table:
    phylonodeprop](#Table:_phylonodeprop)
  - [Table:
    phylotree](#Table:_phylotree)
  - [Table:
    phylotree_pub](#Table:_phylotree_pub)

# Introduction

For representing phylogenetic trees; the trees represent the phylogeny
of some some kind of sequence feature, protein or nucleotide, or actual
organism taxonomy trees.

This module also has the ability to easily create multiple trees, to
easily create super trees, to retrieve nodes easily from different
levels in a tree without recursion (nested sets), and the ability to
associate trees with algorithms (referencing the [Chado Companalysis
Module](/wiki/Chado_Companalysis_Module)).

This module relies heavily on the [Sequence
module](/wiki/Chado_Sequence_Module). In particular,
all the leaf nodes in a tree correspond to features; these will usually
be features of type SO:protein or SO:polypeptide (but other trees are
possible - e.g. intron trees). If it is desirable to store multiple
alignments for each non-leaf node, then each node can be mapped to a
feature of type SO:match. Please refer to the [sequence module
docs](/wiki/Chado_Sequence_Module) for details on
storing multiple alignments.

### Annotating nodes

Each node can have a feature attached; this 'feature' is the multiple
alignment for non-leaf nodes. It is these features that are annotated
rather than annotating the nodes themselves. This has lots of
advantages - we can piggyback off of the sequence module and reuse the
tables there the leaf nodes may have annotations already attached - for
example, GO associations. In fact, it is even possible to annotate
ranges along an alignment - this would entail creating a new feature
which has a featureloc on the alignment feature.

The nested set tree implementation by way of Joe Celko; see the
excellent introduction by Aaron Mackey at <a
href="http://www.oreillynet.com/pub/a/network/2002/11/27/bioconf.html"

### Open Issues

Should there be an additional table, phylonode_relationshipprop? This
table would Increase the detail with which one can describe the edges
between phylonodes, and these details could include such things as
bootstrapping details or divergence times. The current thinking is that
such a table should be created but input from the Chado designers would
be useful here.

# More Information

See the page on the related [Organism
module](/wiki/Chado_Organism_Module).

# Tables

## Table: phylonode

This is the most pervasive element in the phylogeny module, cataloging
the "phylonodes" of tree graphs. Edges are implied by the
parent_phylonode_id reflexive closure. For all nodes in a nested set
implementation the left and right index will be \*between\* the parents
left and right indexes. See <a
href="http://www.oreillynet.com/pub/a/network/2002/11/27/bioconf.html"

for details on a method of assigning values to the left and right
indices.

<table data-border="1" data-cellpadding="3">
<caption>phylonode Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phylonode_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_phylotree"
title="Chado Tables">phylotree</a></p></td>
<td>phylotree_id</td>
<td>integer</td>
<td><em>UNIQUE#1 UNIQUE#2 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_phylonode"
title="Chado Tables">phylonode</a></p></td>
<td>parent_phylonode_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Root phylonode can have null parent_phylonode_id value.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>left_idx</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>right_idx</td>
<td>integer</td>
<td><em>UNIQUE#2 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Type: e.g. root, interior, leaf.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Phylonodes can have optional features attached to them e.g. a protein or
nucleotide sequence usually attached to a leaf of the phylotree for
non-leaf nodes, the feature may be a feature that is an instance of
SO:match; this feature is the alignment of all leaf features beneath
it.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>label</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>distance</td>
<td>double precision</td>
<td><em></em></td>
</tr>
</tbody>
</table>

phylonode Structure

Tables referencing this one via Foreign Key Constraints:

- [phylonode](/wiki/Chado_Tables#Table:_phylonode)
- [phylonode_dbxref](/wiki/Chado_Tables#Table:_phylonode_dbxref)
- [phylonode_organism](/wiki/Chado_Tables#Table:_phylonode_organism)
- [phylonode_pub](/wiki/Chado_Tables#Table:_phylonode_pub)
- [phylonode_relationship](/wiki/Chado_Tables#Table:_phylonode_relationship)
- [phylonodeprop](/wiki/Chado_Tables#Table:_phylonodeprop)

---

## Table: phylonode_dbxref

For example, for orthology, paralogy group identifiers; could also be
used for NCBI taxonomy; for sequences, refer to phylonode_feature,
feature associated dbxrefs.

| FK                                                        | Name                | Type    | Description         | --------------------------------------------------------- | ------------------- | ------- | ------------------- |                                                           | phylonode_dbxref_id | serial  | _PRIMARY KEY_       | [phylonode](/wiki/Chado_Tables#Table:_phylonode) | phylonode_id        | integer | _UNIQUE#1 NOT NULL_ | [dbxref](/wiki/Chado_Tables#Table:_dbxref)       | dbxref_id           | integer | _UNIQUE#1 NOT NULL_ |

phylonode_dbxref Structure

---

## Table: phylonode_organism

This linking table should only be used for nodes in taxonomy trees; it
provides a mapping between the node and an organism. One node can have
zero or one organisms, one organism can have zero or more nodes
(although typically it should only have one in the standard NCBI
taxonomy tree).

<table data-border="1" data-cellpadding="3">
<caption>phylonode_organism Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phylonode_organism_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_phylonode"
title="Chado Tables">phylonode</a></p></td>
<td>phylonode_id</td>
<td>integer</td>
<td><em>UNIQUE NOT NULL</em><br />
<br />
One phylonode cannot refer to &gt;1 organism.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_organism"
title="Chado Tables">organism</a></p></td>
<td>organism_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
</tbody>
</table>

phylonode_organism Structure

---

## Table: phylonode_pub

| FK                                                        | Name             | Type    | Description         | --------------------------------------------------------- | ---------------- | ------- | ------------------- |                                                           | phylonode_pub_id | serial  | _PRIMARY KEY_       | [phylonode](/wiki/Chado_Tables#Table:_phylonode) | phylonode_id     | integer | _UNIQUE#1 NOT NULL_ | [pub](/wiki/Chado_Tables#Table:_pub)             | pub_id           | integer | _UNIQUE#1 NOT NULL_ |

phylonode_pub Structure

---

## Table: phylonode_relationship

This is for relationships that are not strictly hierarchical; for
example, horizontal gene transfer. Most phylogenetic trees are strictly
hierarchical, nevertheless it is here for completeness.

| FK                                                        | Name                      | Type    | Description         | --------------------------------------------------------- | ------------------------- | ------- | ------------------- |                                                           | phylonode_relationship_id | serial  | _PRIMARY KEY_       | [phylonode](/wiki/Chado_Tables#Table:_phylonode) | subject_id                | integer | _UNIQUE#1 NOT NULL_ | [phylonode](/wiki/Chado_Tables#Table:_phylonode) | object_id                 | integer | _UNIQUE#1 NOT NULL_ | [cvterm](/wiki/Chado_Tables#Table:_cvterm)       | type_id                   | integer | _UNIQUE#1 NOT NULL_ |                                                           | rank                      | integer | [phylotree](/wiki/Chado_Tables#Table:_phylotree) | phylotree_id              | integer | _NOT NULL_          |

phylonode_relationship Structure

---

## Table: phylonodeprop

<table data-border="1" data-cellpadding="3">
<caption>phylonodeprop Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phylonodeprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_phylonode"
title="Chado Tables">phylonode</a></p></td>
<td>phylonode_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
type_id could designate phylonode hierarchy relationships, for example:
species taxonomy (kingdom, order, family, genus, species),
"ortholog/paralog", "fold/superfold", etc.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>text</td>
<td><em>UNIQUE#1 NOT NULL DEFAULT ''::text</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
</tbody>
</table>

phylonodeprop Structure

---

## Table: phylotree

Global anchor for phylogenetic tree.

<table data-border="1" data-cellpadding="3">
<caption>phylotree Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phylotree_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_dbxref"
title="Chado Tables">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Type: protein, nucleotide, taxonomy, for example. The type should be any
SO type, or "taxonomy".</td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_analysis"
title="Chado Tables">analysis</a></p></td>
<td>analysis_id</td>
<td>integer</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>comment</td>
<td>text</td>
<td><em></em></td>
</tr>
</tbody>
</table>

phylotree Structure

Tables referencing this one via Foreign Key Constraints:

- [phylonode](/wiki/Chado_Tables#Table:_phylonode)
- [phylonode_relationship](/wiki/Chado_Tables#Table:_phylonode_relationship)
- [phylotree_pub](/wiki/Chado_Tables#Table:_phylotree_pub)

---

## Table: phylotree_pub

Tracks citations global to the tree e.g. multiple sequence alignment
supporting tree construction.

| FK                                                        | Name             | Type    | Description         | --------------------------------------------------------- | ---------------- | ------- | ------------------- |                                                           | phylotree_pub_id | serial  | _PRIMARY KEY_       | [phylotree](/wiki/Chado_Tables#Table:_phylotree) | phylotree_id     | integer | _UNIQUE#1 NOT NULL_ | [pub](/wiki/Chado_Tables#Table:_pub)             | pub_id           | integer | _UNIQUE#1 NOT NULL_ |

phylotree_pub Structure

---

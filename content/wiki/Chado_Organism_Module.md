---
title: "Chado Organism Module"
---
# Chado Organism Module

 Introduction](#Introduction)
- [More
 Information](#More_Information)
- [Tables](#Tables)
 - [Table:
 organism](#Table:_organism)
 - [Table:
 organism_dbxref](#Table:_organism_dbxref)
 - [Table:
 organismprop](#Table:_organismprop)

# Introduction

The organism module is designed to hold information about a given
species, as such it is fairly simple.

# More Information

See the page on the related [Phylogeny
module](/wiki/Chado_Phylogeny_Module). The phylogeny
module is designed for phylogenetic trees and taxonomies.

# Tables

## Table: organism

The organismal taxonomic classification. Note that phylogenies are
represented using the phylogeny module, and taxonomies can be
represented using the cvterm module or the phylogeny module.

<table data-border="1" data-cellpadding="3">
<caption>organism Structure</caption>
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
<td>organism_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>abbreviation</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>genus</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>species</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
A type of organism is always uniquely identified by genus and species.
When mapping from the NCBI taxonomy names.dmp file, this column must be
used where it is present, as the common_name column is not always unique
(e.g. environmental samples). If a particular strain or subspecies is to
be represented, this is appended onto the species name. Follows standard
NCBI taxonomy pattern.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>common_name</td>
<td>character varying(255)</td>
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

organism Structure

Tables referencing this one via Foreign Key Constraints:

- [biomaterial](/wiki/Chado_Tables#Table:_biomaterial)
- [feature](/wiki/Chado_Tables#Table:_feature)
- [library](/wiki/Chado_Tables#Table:_library)
- [organism_dbxref](/wiki/Chado_Tables#Table:_organism_dbxref)
- [organismprop](/wiki/Chado_Tables#Table:_organismprop)
- [phylonode_organism](/wiki/Chado_Tables#Table:_phylonode_organism)
- [stock](/wiki/Chado_Tables#Table:_stock)
- [wwwuser_organism](/wiki/Chado_Tables#Table:_wwwuser_organism)

------------------------------------------------------------------------

## Table: organism_dbxref

| FK | Name | Type | Description |
|----|----|----|----|
| | organism_dbxref_id | serial | *PRIMARY KEY* |
| [organism](/wiki/Chado_Tables#Table:_organism) | organism_id | integer | *UNIQUE#1 NOT NULL* |
| [dbxref](/wiki/Chado_Tables#Table:_dbxref) | dbxref_id | integer | *UNIQUE#1 NOT NULL* |

organism_dbxref Structure

------------------------------------------------------------------------

## Table: organismprop

Tag-value properties - follows standard chado model.

| FK | Name | Type | Description |
|----|----|----|----|
| | organismprop_id | serial | *PRIMARY KEY* |
| [organism](/wiki/Chado_Tables#Table:_organism) | organism_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* | | |

organismprop Structure

------------------------------------------------------------------------

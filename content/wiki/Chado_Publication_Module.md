---
title: "Chado Publication Module"
---
# Chado Publication Module

  Introduction](#Introduction)
- [Tables](#Tables)
  - [Table:
    pub](#Table:_pub)
  - [Table:
    pub_dbxref](#Table:_pub_dbxref)
  - [Table:
    pub_relationship](#Table:_pub_relationship)
  - [Table:
    pubauthor](#Table:_pubauthor)
  - [Table:
    pubprop](#Table:_pubprop)

# Introduction

The Publication module describes references to sources of knowledge.
Usually these are published articles but can also include conferences,
Web pages, and so on.

# Tables

## Table: pub

A documented provenance artefact - publications, documents, personal
communication.

<table data-border="1" data-cellpadding="3">
<caption>pub Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>F-Key</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>pub_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>title</td>
<td>text</td>
<td><em></em><br />
<br />
Descriptive general heading.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>volumetitle</td>
<td>text</td>
<td><em></em><br />
<br />
Title of part if one of a series.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>volume</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>series_name</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
Full name of (journal) series.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>issue</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>pyear</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>pages</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
Page number range[s], e.g. 457--459, viii + 664pp, lv--lvii.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>miniref</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
The type of the publication (book, journal, poem, graffiti, etc). Uses
pub cv. See <a
href="http://www.ebi.ac.uk/ontology-lookup/browse.do?ontName=FBcv"
class="external text" rel="nofollow">FBcv</a> for publication
descriptor, or <a
href="http://obo.cvs.sourceforge.net/obo/obo/ontology/vocabularies/flybase_controlled_vocabulary.obo"
class="external text" rel="nofollow">FBcv.obo</a></td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_obsolete</td>
<td>boolean</td>
<td><em>DEFAULT false</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>publisher</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>pubplace</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
</tbody>
</table>

pub Structure

Tables referencing this one via Foreign Key Constraints:

- [expression_pub](/wiki/Chado_Tables#Table:_expression_pub)
- [feature_cvterm](/wiki/Chado_Tables#Table:_feature_cvterm)
- [feature_cvterm_pub](/wiki/Chado_Tables#Table:_feature_cvterm_pub)
- [feature_expression](/wiki/Chado_Tables#Table:_feature_expression)
- [feature_pub](/wiki/Chado_Tables#Table:_feature_pub)
- [feature_relationship_pub](/wiki/Chado_Tables#Table:_feature_relationship_pub)
- [feature_relationshipprop_pub](/wiki/Chado_Tables#Table:_feature_relationshipprop_pub)
- [feature_synonym](/wiki/Chado_Tables#Table:_feature_synonym)
- [featureloc_pub](/wiki/Chado_Tables#Table:_featureloc_pub)
- [featuremap_pub](/wiki/Chado_Tables#Table:_featuremap_pub)
- [featureprop_pub](/wiki/Chado_Tables#Table:_featureprop_pub)
- [library_cvterm](/wiki/Chado_Tables#Table:_library_cvterm)
- [library_pub](/wiki/Chado_Tables#Table:_library_pub)
- [library_synonym](/wiki/Chado_Tables#Table:_library_synonym)
- [phendesc](/wiki/Chado_Tables#Table:_phendesc)
- [phenotype_comparison](/wiki/Chado_Tables#Table:_phenotype_comparison)
- [phenstatement](/wiki/Chado_Tables#Table:_phenstatement)
- [phylonode_pub](/wiki/Chado_Tables#Table:_phylonode_pub)
- [phylotree_pub](/wiki/Chado_Tables#Table:_phylotree_pub)
- [protocol](/wiki/Chado_Tables#Table:_protocol)
- [pub_dbxref](/wiki/Chado_Tables#Table:_pub_dbxref)
- [pub_relationship](/wiki/Chado_Tables#Table:_pub_relationship)
- [pubauthor](/wiki/Chado_Tables#Table:_pubauthor)
- [pubprop](/wiki/Chado_Tables#Table:_pubprop)
- [stock_cvterm](/wiki/Chado_Tables#Table:_stock_cvterm)
- [stock_pub](/wiki/Chado_Tables#Table:_stock_pub)
- [stock_relationship_pub](/wiki/Chado_Tables#Table:_stock_relationship_pub)
- [stockprop_pub](/wiki/Chado_Tables#Table:_stockprop_pub)
- [study](/wiki/Chado_Tables#Table:_study)
- [wwwuser_pub](/wiki/Chado_Tables#Table:_wwwuser_pub)

------------------------------------------------------------------------

## Table: pub_dbxref

Handle links to repositories, e.g. Pubmed, Biosis, zoorec, OCLC,
Medline, ISSN, coden...

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | pub_dbxref_id | serial | *PRIMARY KEY* |
| [pub](/wiki/Chado_Tables#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |
| [dbxref](/wiki/Chado_Tables#Table:_dbxref) | dbxref_id | integer | *UNIQUE#1 NOT NULL* |
|  | is_current | boolean | *NOT NULL DEFAULT true* |

pub_dbxref Structure

------------------------------------------------------------------------



## Table: pub_relationship

Handle relationships between publications, e.g. when one publication
makes others obsolete, when one publication contains errata with respect
to other publication(s), or when one publication also appears in another
pub.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | pub_relationship_id | serial | *PRIMARY KEY* |
| [pub](/wiki/Chado_Tables#Table:_pub) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](/wiki/Chado_Tables#Table:_pub) | object_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |

pub_relationship Structure

------------------------------------------------------------------------



## Table: pubauthor

An author for a publication. Note the denormalisation (hence lack of \_
in table name) - this is deliberate as it is in general too hard to
assign IDs to authors.

<table data-border="1" data-cellpadding="3">
<caption>pubauthor Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>F-Key</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>pubauthor_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_pub"
title="Chado Tables">pub</a></p></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Order of author in author list for this pub - order is important.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>editor</td>
<td>boolean</td>
<td><em>DEFAULT false</em><br />
<br />
Indicates whether the author is an editor for linked publication. Note:
this is a boolean field but does not follow the normal chado convention
for naming booleans.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>surname</td>
<td>character varying(100)</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>givennames</td>
<td>character varying(100)</td>
<td><em></em><br />
<br />
First name, initials</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>suffix</td>
<td>character varying(100)</td>
<td><em></em><br />
<br />
Jr., Sr., etc</td>
</tr>
</tbody>
</table>

pubauthor Structure

------------------------------------------------------------------------



## Table: pubprop

Property-value pairs for a pub. Follows standard chado pattern.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | pubprop_id | serial | *PRIMARY KEY* |
| [pub](/wiki/Chado_Tables#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | *NOT NULL* |
|  | rank | integer | *UNIQUE#1* |

pubprop Structure

------------------------------------------------------------------------

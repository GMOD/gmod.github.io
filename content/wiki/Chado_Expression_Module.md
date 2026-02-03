---
title: "Chado Expression Module"
---
# Chado Expression Module

  Introduction](#Introduction)
  - [Mage and
    Expression](#Mage_and_Expression)
- [Tables](#Tables)
  - [Table:
    eimage](#Table:_eimage)
  - [Table:
    expression](#Table:_expression)
  - [Table:
    expression_cvterm](#Table:_expression_cvterm)
  - [Table:
    expression_image](#Table:_expression_image)
  - [Table:
    expression_pub](#Table:_expression_pub)
  - [Table:
    feature_expression](#Table:_feature_expression)

# Introduction

This module is for how curated expression data is stored in Chado. This
module is totally dependent on the [sequence
module](Chado_Sequence_Module "Chado Sequence Module"). Objects in the
[genetic module](Chado_Genetic_Module "Chado Genetic Module") cannot
connect to expression data except by going *via* the sequence module. We
assume that we'll **always** have a controlled vocabulary for expression
data.

Here is an example of a simple case of the sort of data that
<a href="http://flybase.org" class="external text"
rel="nofollow">FlyBase</a> curates. The *dpp* transcript is expressed in
embryonic stage 13-15 in the cephalic segment as reported in a
<a href="http://flybase.bio.indiana.edu/reports/FBrf0053806.html"
class="external text" rel="nofollow">paper by Blackman <em>et al.</em>
in 1991</a>. This would be implemented in the expression module by
linking the *dpp* transcript feature to expression via
[feature_expression](Chado_Tables#Table:_feature_expression "Chado Tables")
(we would add a *pub_id* column to
[feature_expression](Chado_Tables#Table:_feature_expression "Chado Tables")
to link to the publication in the [pub
table](Chado_Tables#Table:_pub "Chado Tables")). We would then link the
following cvterms to the expression using
[expression_cvterm](#Table:_expression_cvterm):

- *embryonic stage 13* where the cvterm_type would be stage and the
  rank=0
- *embryonic stage 14* where the cvterm_type would be stage and the
  rank=1
- *embryonic stage 15* where the cvterm_type would be stage and the
  rank=1
- *cephalic segment* where the cvterm_type would be anatomy and the
  rank=0
- *in situ hybridization* where the cvterm_type would be assay and the
  rank=0

Note that we would change the *cvterm_type* column to *cvterm_type_id*
and use a *cvterm_id* for a particular expression slot (i.e. stage,
anatomy, assay, 'subcellular location' and that cvterms from different
<a href="http://www.obofoundry.org" class="external text"
rel="nofollow">OBO</a> ontologies can share the same *cvterm_type*.

### Mage and Expression

The [Mage module](Chado_Mage_Module "Chado Mage Module") and the
Expression module can be considered overlapping but complementary. The
Mage module can store data taken directly from the experimental results
whereas the Expression module is typically used to store summary data
taken from the biological literature, or extracted from the microarray
data stored in Mage. The Mage module handles details about experiments
that the Expression module does not whereas the Expression module can be
thought of a simpler set of tables designed to tie ontologies concerned
with expression to sequence features.

# Tables

## Table: eimage

<table data-border="1" data-cellpadding="3">
<caption>eimage Structure</caption>
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
<td>eimage_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>eimage_data</td>
<td>text</td>
<td><em></em><br />
<br />
We expect images in eimage_data (e.g. JPEGs) to be uuencoded.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>eimage_type</td>
<td>character varying(255)</td>
<td><em>NOT NULL</em><br />
<br />
Describes the type of data in eimage_data.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>image_uri</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
</tbody>
</table>

eimage Structure

Tables referencing this one via Foreign Key Constraints:

- [expression_image](Chado_Tables#Table:_expression_image "Chado Tables")

------------------------------------------------------------------------



## Table: expression

The expression table is essentially a bridge table.

| F-Key | Name          | Type          | Description |
|-------|---------------|---------------|-------------------|
|  | expression_id | serial | *PRIMARY KEY* |
|  | uniquename | text | *UNIQUE NOT NULL* |
|  | md5checksum | character(32) | description |
| text          expression Structure |  |  |  |

Tables referencing this one via Foreign Key Constraints:

- [expression_cvterm](Chado_Tables#Table:_expression_cvterm "Chado Tables")
- [expression_image](Chado_Tables#Table:_expression_image "Chado Tables")
- [expression_pub](Chado_Tables#Table:_expression_pub "Chado Tables")
- [expressionprop](Chado_Tables#Table:_expressionprop "Chado Tables")
- [feature_expression](Chado_Tables#Table:_feature_expression "Chado Tables")
- [wwwuser_expression](Chado_Tables#Table:_wwwuser_expression "Chado Tables")

------------------------------------------------------------------------



## Table: expression_cvterm

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | expression_cvterm_id | serial | *PRIMARY KEY* |
| [expression](Chado_Tables#Table:_expression "Chado Tables") | expression_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | cvterm_id | integer | *UNIQUE#1 NOT NULL* |
|  | rank | integer | *NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | cvterm_type_id | integer | *UNIQUE#1 NOT NULL* |

expression_cvterm Structure

Tables referencing this one via Foreign Key Constraints:

- [expression_cvtermprop](Chado_Tables#Table:_expression_cvtermprop "Chado Tables")

------------------------------------------------------------------------



## Table: expression_image

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | expression_image_id | serial | *PRIMARY KEY* |
| [expression](Chado_Tables#Table:_expression "Chado Tables") | expression_id | integer | *UNIQUE#1 NOT NULL* |
| [eimage](Chado_Tables#Table:_eimage "Chado Tables") | eimage_id | integer | *UNIQUE#1 NOT NULL* |

expression_image Structure

------------------------------------------------------------------------



## Table: expression_pub

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | expression_pub_id | serial | *PRIMARY KEY* |
| [expression](Chado_Tables#Table:_expression "Chado Tables") | expression_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |

expression_pub Structure

------------------------------------------------------------------------



## Table: feature_expression

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | feature_expression_id | serial | *PRIMARY KEY* |
| [expression](Chado_Tables#Table:_expression "Chado Tables") | expression_id | integer | *UNIQUE#1 NOT NULL* |
| [feature](Chado_Tables#Table:_feature "Chado Tables") | feature_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |

feature_expression Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_expressionprop](Chado_Tables#Table:_feature_expressionprop "Chado Tables")

------------------------------------------------------------------------

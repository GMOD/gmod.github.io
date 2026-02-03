---
title: "Chado Map Module"
---
# Chado Map Module

  Introduction](#Introduction)
  - [To
    Do](#To_Do)
  - [Tables](#Tables)
  - [Table:
    featuremap](#Table:_featuremap)
  - [Table:
    featuremap_pub](#Table:_featuremap_pub)
  - [Table:
    featurepos](#Table:_featurepos)
  - [Table:
    featurerange](#Table:_featurerange)

# Introduction

Note: this module is all due for revision.

A possibly problematic case is where we want to localize an object to
the left or right of a feature (but not within it):

|---------|
| feature-to-map |
           ------------------------------------------------- map
|------|----------|
| features to map wrt |  |

### To Do

- Determine how we would map the 3' end of the feature-to-map.
- Get a comprehensive set of mapping use-cases.
  - One set of use-cases is aberrations (which will all be involved with
    this module). Simple aberrations should be do-able, but what about
    cases where a breakpoint interrupts a gene? Would this be an example
    of the problematic case above?

## Tables

## Table: featuremap

| F-Key                                               | Name          | Type                   | Description   | --------------------------------------------------- | ------------- | ---------------------- | ------------- |                                                     | featuremap_id | serial                 | _PRIMARY KEY_ |                                                     | name          | character varying(255) | _UNIQUE_      |                                                     | description   | text                   | [cvterm](/wiki/Chado_Tables#Table:_cvterm) | unittype_id   | integer                featuremap Structure

Tables referencing this one via Foreign Key Constraints:

- [featuremap_pub](/wiki/Chado_Tables#Table:_featuremap_pub)
- [featurepos](/wiki/Chado_Tables#Table:_featurepos)
- [featurerange](/wiki/Chado_Tables#Table:_featurerange)

---

## Table: featuremap_pub

| F-Key                                                       | Name              | Type    | Description   | ----------------------------------------------------------- | ----------------- | ------- | ------------- |                                                             | featuremap_pub_id | serial  | _PRIMARY KEY_ | [featuremap](/wiki/Chado_Tables#Table:_featuremap) | featuremap_id     | integer | _NOT NULL_    | [pub](/wiki/Chado_Tables#Table:_pub)               | pub_id            | integer | _NOT NULL_    |

featuremap_pub Structure

---

## Table: featurepos

<table data-border="1" data-cellpadding="3">
<caption>featurepos Structure</caption>
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
<td>featurepos_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_featuremap"
title="Chado Tables">featuremap</a></p></td>
<td>featuremap_id</td>
<td>serial</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>map_feature_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
map_feature_id links to the feature (map) upon which the feature is
being localized.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>mappos</td>
<td>double precision</td>
<td><em>NOT NULL</em></td>
</tr>
</tbody>
</table>

featurepos Structure

---

## Table: featurerange

In cases where the start and end of a mapped feature is a range,
leftendf and rightstartf are populated. leftstartf_id, leftendf_id,
rightstartf_id, rightendf_id are the ids of features with respect to
which the feature is being mapped. These may be cytological bands.

<table data-border="1" data-cellpadding="3">
<caption>featurerange Structure</caption>
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
<td>featurerange_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_featuremap"
title="Chado Tables">featuremap</a></p></td>
<td>featuremap_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
featuremap_id is the id of the feature being mapped.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>leftstartf_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>leftendf_id</td>
<td>integer</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>rightstartf_id</td>
<td>integer</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>rightendf_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>rangestr</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
</tbody>
</table>

featurerange Structure

---

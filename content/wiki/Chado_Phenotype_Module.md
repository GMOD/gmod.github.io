---
title: "Chado Phenotype Module"
---
# Chado Phenotype Module

  Introduction](#Introduction)
- [Tables](#Tables)
  - [Table:
    feature_phenotype](#Table:_feature_phenotype)
  - [Table:
    phenotype](#Table:_phenotype)
  - [Table:
    phenotype_cvterm](#Table:_phenotype_cvterm)

# Introduction

Chris Mungall's 2006
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/6b/02-chado-for-nescent-2006.pdf"
class="internal" title="02-chado-for-nescent-2006.pdf">Chado for
evolutionary science</a> presentation discusses the Phenotype module.

# Tables

## Table: feature_phenotype

| F-Key                                                     | Name                 | Type    | Description         | --------------------------------------------------------- | -------------------- | ------- | ------------------- |                                                           | feature_phenotype_id | serial  | _PRIMARY KEY_       | [feature](Chado_Tables#Table:_feature "Chado Tables")     | feature_id           | integer | _UNIQUE#1 NOT NULL_ | [phenotype](Chado_Tables#Table:_phenotype "Chado Tables") | phenotype_id         | integer | _UNIQUE#1 NOT NULL_ |

feature_phenotype Structure

---

## Table: phenotype

A phenotypic statement, or a single atomic phenotypic observation, is a
controlled sentence describing observable effects of non-wild type
function. E.g. Obs=eye, attribute=color, cvalue=red.

<table data-border="1" data-cellpadding="3">
<caption>phenotype Structure</caption>
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
<td>phenotype_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>observable_id</td>
<td>integer</td>
<td><em></em><br />
<br />
The entity: e.g. anatomy_part, biological_process.</td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>attr_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Phenotypic attribute (quality, property, attribute, character) - drawn
from PATO.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>value</td>
<td>text</td>
<td><em></em><br />
<br />
Value of attribute - unconstrained free text. Used only if cvalue_id is
not appropriate.</td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>cvalue_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Phenotype attribute value (state).</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>assay_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Evidence type</td>
</tr>
</tbody>
</table>

phenotype Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_phenotype](Chado_Tables#Table:_feature_phenotype "Chado Tables")
- [phenotype_comparison](Chado_Tables#Table:_phenotype_comparison "Chado Tables")
- [phenotype_cvterm](Chado_Tables#Table:_phenotype_cvterm "Chado Tables")
- [phenstatement](Chado_Tables#Table:_phenstatement "Chado Tables")
- [wwwuser_phenotype](Chado_Tables#Table:_wwwuser_phenotype "Chado Tables")

---

## Table: phenotype_cvterm

| F-Key                                                     | Name                | Type    | Description         | --------------------------------------------------------- | ------------------- | ------- | ------------------- |                                                           | phenotype_cvterm_id | serial  | _PRIMARY KEY_       | [phenotype](Chado_Tables#Table:_phenotype "Chado Tables") | phenotype_id        | integer | _UNIQUE#1 NOT NULL_ | [cvterm](Chado_Tables#Table:_cvterm "Chado Tables")       | cvterm_id           | integer | _UNIQUE#1 NOT NULL_ |

phenotype_cvterm Structure

---

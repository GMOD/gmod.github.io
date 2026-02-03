---
title: "Chado Contact Module"
---
# Chado Contact Module

  Introduction](#Introduction)
- [Tables](#Tables)
  - [Table:
    contact](#Table:_contact)
  - [Table:
    contact_relationship](#Table:_contact_relationship)

# Introduction

The contact module is used to store information about people, groups,
and organizations.

# Tables

## Table: contact

Model persons, institutes, groups, organizations, etc.

<table data-border="1" data-cellpadding="3">
<caption>contact Structure</caption>
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
<td>contact_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em></em><br />
<br />
What type of contact is this? E.g. "person", "lab".</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em>UNIQUE NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>description</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
</tbody>
</table>

contact Structure

Tables referencing this one via Foreign Key Constraints:

- [arraydesign](/wiki/Chado_Tables#Table:_arraydesign)
- [assay](/wiki/Chado_Tables#Table:_assay)
- [biomaterial](/wiki/Chado_Tables#Table:_biomaterial)
- [contact_relationship](/wiki/Chado_Tables#Table:_contact_relationship)
- [quantification](/wiki/Chado_Tables#Table:_quantification)
- [stockcollection](/wiki/Chado_Tables#Table:_stockcollection)
- [study](/wiki/Chado_Tables#Table:_study)

------------------------------------------------------------------------

## Table: contact_relationship

Model relationships between contacts

<table data-border="1" data-cellpadding="3">
<caption>contact_relationship Structure</caption>
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
<td>contact_relationship_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Relationship type between subject and object. This is a cvterm,
typically from the OBO relationship ontology, although other
relationship types are allowed.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_contact"
title="Chado Tables">contact</a></p></td>
<td>subject_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The subject of the subj-predicate-obj sentence. In a DAG, this
corresponds to the child node.</td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_contact"
title="Chado Tables">contact</a></p></td>
<td>object_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The object of the subj-predicate-obj sentence. In a DAG, this
corresponds to the parent node.</td>
</tr>
</tbody>
</table>

contact_relationship Structure

------------------------------------------------------------------------

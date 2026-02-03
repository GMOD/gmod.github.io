---
title: "Databases: Primary, Foreign and Alternate Keys"
---
# Databases: Primary, Foreign and Alternate Keys


This introduces some terminology frequently used in relations databases.

In a database table, certain columns are *keys*. Keys help identify rows
/ records and link records together.

## Primary Key

Uniquely identifies a record/row/object/person.

## Alternate Key

Also uniquely identifies a record/row/object/person

## Foreign Key

Related tables are linked together by taking the *primary key* from one
table and placing in the related table. The primary key then becomes a
*foreign* key.

In this case, if we had another table that described **Institutions'*,
then the* Institution** column in the **Instructors** table would be a
*foreign key*.

## Example

The Instructors table, again.


Instructor Table


<table data-cellpadding="10" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th style="width: 7em"><em>Primary Key</em></th>
<th style="width: 14em"><em>Foreign Key?</em></th>
<th style="width: 13em"><em>Alternate Key</em></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td colspan="3"><table class="wikitable sortable">
<thead>
<tr class="header">
<th>Participant</th>
<th>Affiliation</th>
<th>Email</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Scott Cain</td>
<td>Ontario Institute for Cancer Research</td>
<td>scott@scottcain.net</td>
</tr>
<tr class="even">
<td>Tim Carver</td>
<td>Sanger Institute</td>
<td>tjc@sanger.ac.uk</td>
</tr>
<tr class="odd">
<td>Dave Clements</td>
<td>NESCent</td>
<td>clements@nescent.org</td>
</tr>
<tr class="even">
<td>Stephen Ficklin</td>
<td>Clemson University</td>
<td>ficklin@clemson.edu</td>
</tr>
<tr class="odd">
<td>Syed Haider</td>
<td>EBI</td>
<td>syed@ebi.ac.uk</td>
</tr>
<tr class="even">
<td>Ian Holmes</td>
<td>UC Berkeley</td>
<td>ihh@berkeley.edu</td>
</tr>
<tr class="odd">
<td>Carson Holt</td>
<td>University of Utah</td>
<td>carson.holt@utah.ed</td>
</tr>
<tr class="even">
<td>Robin Houston</td>
<td>Sanger Institute</td>
<td>rh11@sanger.ac.uk</td>
</tr>
<tr class="odd">
<td>Ed Lee</td>
<td>Lawrence Berkeley National Lab</td>
<td>elee@berkeleybop.org</td>
</tr>
<tr class="even">
<td>Sheldon McKay</td>
<td>Cold Spring Harbor Laboratory</td>
<td>mckays@cshl.edu</td>
</tr>
<tr class="odd">
<td>Joshua Orvis</td>
<td>Institute for Genome Sciences</td>
<td>jorvis@som.umaryland.edu</td>
</tr>
<tr class="even">
<td>Mitch Skinner</td>
<td>UC Berkeley</td>
<td>mitch_skinner@berkeley.edu</td>
</tr>
<tr class="odd">
<td>Giles Velarde</td>
<td>Wellcome Trust Sanger Institute</td>
<td>gv1@sanger.ac.uk</td>
</tr>
<tr class="even">
<td>Junjun Zhang</td>
<td>Ontario Institute for Cancer Research</td>
<td>Junjun.Zhang@oicr.on.ca</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>


## Note

This simplified table contains a number of bad practices, such as the
primary and foreign key values used, and naming conventions. We'll get
to those.

Back to <a href="Chado_Tutorial" class="mw-redirect"
title="Chado Tutorial">Chado Tutorial</a>.

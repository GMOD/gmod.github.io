---
title: "Chado Contact Module"
---




<span id="top"></span>




# <span dir="auto">Chado Contact Module</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
- [<span class="tocnumber">2</span>
  <span class="toctext">Tables</span>](#Tables)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Table:
    contact</span>](#Table:_contact)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Table:
    contact_relationship</span>](#Table:_contact_relationship)



# <span id="Introduction" class="mw-headline">Introduction</span>

The contact module is used to store information about people, groups,
and organizations.

  

# <span id="Tables" class="mw-headline">Tables</span>

## <span id="Table:_contact" class="mw-headline">Table: contact</span>

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
<td><p><a href="Chado_Tables#Table:_cvterm"
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

- [arraydesign](Chado_Tables#Table:_arraydesign "Chado Tables")

<!-- -->

- [assay](Chado_Tables#Table:_assay "Chado Tables")

<!-- -->

- [biomaterial](Chado_Tables#Table:_biomaterial "Chado Tables")

<!-- -->

- [contact_relationship](Chado_Tables#Table:_contact_relationship "Chado Tables")

<!-- -->

- [quantification](Chado_Tables#Table:_quantification "Chado Tables")

<!-- -->

- [stockcollection](Chado_Tables#Table:_stockcollection "Chado Tables")

<!-- -->

- [study](Chado_Tables#Table:_study "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_contact_relationship" class="mw-headline">Table: contact_relationship</span>

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
<td><p><a href="Chado_Tables#Table:_cvterm"
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
<td><p><a href="Chado_Tables#Table:_contact"
title="Chado Tables">contact</a></p></td>
<td>subject_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The subject of the subj-predicate-obj sentence. In a DAG, this
corresponds to the child node.</td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_contact"
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




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado Modules](Category%253AChado_Modules "Category%253AChado Modules")
- [!Lacking ERD](Category%253A!Lacking_ERD "Category%253A!Lacking ERD")






## Navigation menu









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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Contact_Module" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 04:34 on 18 February
  2015.</span>
<!-- - <span id="footer-info-viewcount">59,423 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





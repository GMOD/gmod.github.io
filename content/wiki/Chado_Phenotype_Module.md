---
title: "Chado Phenotype Module"
---
<span id="top"></span>

# <span dir="auto">Chado Phenotype Module</span>

## Contents

- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
- [<span class="tocnumber">2</span>
  <span class="toctext">Tables</span>](#Tables)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Table:
    feature_phenotype</span>](#Table:_feature_phenotype)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Table:
    phenotype</span>](#Table:_phenotype)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Table:
    phenotype_cvterm</span>](#Table:_phenotype_cvterm)

# <span id="Introduction" class="mw-headline">Introduction</span>

Chris Mungall's 2006
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/6b/02-chado-for-nescent-2006.pdf"
class="internal" title="02-chado-for-nescent-2006.pdf">Chado for
evolutionary science</a> presentation discusses the Phenotype module.

# <span id="Tables" class="mw-headline">Tables</span>

## <span id="Table:_feature_phenotype" class="mw-headline">Table: feature_phenotype</span>

| F-Key                                                     | Name                 | Type    | Description         |
| --------------------------------------------------------- | -------------------- | ------- | ------------------- |
|                                                           | feature_phenotype_id | serial  | _PRIMARY KEY_       |
| [feature](Chado_Tables#Table:_feature "Chado Tables")     | feature_id           | integer | _UNIQUE#1 NOT NULL_ |
| [phenotype](Chado_Tables#Table:_phenotype "Chado Tables") | phenotype_id         | integer | _UNIQUE#1 NOT NULL_ |

feature_phenotype Structure

---

## <span id="Table:_phenotype" class="mw-headline">Table: phenotype</span>

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

<!-- -->

- [phenotype_comparison](Chado_Tables#Table:_phenotype_comparison "Chado Tables")

<!-- -->

- [phenotype_cvterm](Chado_Tables#Table:_phenotype_cvterm "Chado Tables")

<!-- -->

- [phenstatement](Chado_Tables#Table:_phenstatement "Chado Tables")

<!-- -->

- [wwwuser_phenotype](Chado_Tables#Table:_wwwuser_phenotype "Chado Tables")

---

## <span id="Table:_phenotype_cvterm" class="mw-headline">Table: phenotype_cvterm</span>

| F-Key                                                     | Name                | Type    | Description         |
| --------------------------------------------------------- | ------------------- | ------- | ------------------- |
|                                                           | phenotype_cvterm_id | serial  | _PRIMARY KEY_       |
| [phenotype](Chado_Tables#Table:_phenotype "Chado Tables") | phenotype_id        | integer | _UNIQUE#1 NOT NULL_ |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables")       | cvterm_id           | integer | _UNIQUE#1 NOT NULL_ |

phenotype_cvterm Structure

---

[Categories](Special%253ACategories "Special%253ACategories"):

- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
- [Chado](Category%253AChado "Category%253AChado")
- [Phenotypes](Category%253APhenotypes "Category%253APhenotypes")

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Phenotype_Module" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 21:11 on 6 February 2008.</span>
<!-- - <span id="footer-info-viewcount">45,375 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

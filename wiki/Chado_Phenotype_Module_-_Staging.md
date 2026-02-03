



<span id="top"></span>




# <span dir="auto">Chado Phenotype Module - Staging</span>










<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/6b/WorkInProgressTools.gif" width="48"
height="48" alt="Under Construction" />



<span style="font-size: 140%">This page or section is under
construction.</span>  
  
This page is a working area for updating the revised phenotype module
that came out of the [GMOD Evo
Hackathon](GMOD_Evo_Hackathon "GMOD Evo Hackathon"). Please edit the
table and column descriptions below. These updates will be added to the
PostgreSQL comments before the next Chado release.




## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Phenotypes
    at FlyBase</span>](#Phenotypes_at_FlyBase)
- [<span class="tocnumber">2</span>
  <span class="toctext">Tables</span>](#Tables)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Table:
    feature_phenotype</span>](#Table:_feature_phenotype)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Table:
    phenotype</span>](#Table:_phenotype)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Table:
    phenotype_cvterm</span>](#Table:_phenotype_cvterm)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Table:
    phenotypeprop</span>](#Table:_phenotypeprop)



# <span id="Introduction" class="mw-headline">Introduction</span>

Chris Mungall's 2006
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/6b/02-chado-for-nescent-2006.pdf"
class="internal" title="02-chado-for-nescent-2006.pdf">Chado for
evolutionary science</a> presentation discusses the Phenotype module.

The phenotype tables are spread across the Phenotype and
[Genetic](Chado_Genetic_Module "Chado Genetic Module") modules. Both
modules originated at [FlyBase](Category%253AFlyBase "Category%253AFlyBase").
There were actually two versions of the Phenotype module that came out
of FlyBase: An early one that included the
[**`feature_phenotype`**](Chado_Phenotype_Module#Table:_feature_phenotype "Chado Phenotype Module")
table; and a later one that included several new phenotype tables in the
Genetic module, but did not make use of the **`feature_phenotype`** at
all. The later release does not tie phenotypes to a single feature, but
rather to a
[**`genotype`**](Chado_Genetic_Module#Table:_genotype "Chado Genetic Module"),
which is a collection of features.

## <span id="Phenotypes_at_FlyBase" class="mw-headline">Phenotypes at FlyBase</span>

To try and understand the existing phenotype module during the [GMOD Evo
Hackathon](GMOD_Evo_Hackathon "GMOD Evo Hackathon"), participants spent
some time exploring the phenotype tables at FlyBase. The notes from that
exploration are on the [Chado Phenotype Module at
FlyBase](Chado_Phenotype_Module_at_FlyBase "Chado Phenotype Module at FlyBase")
page.

# <span id="Tables" class="mw-headline">Tables</span>

## <span id="Table:_feature_phenotype" class="mw-headline">Table: feature_phenotype</span>

| FK | Name | Type | Description |
|----|----|----|----|
|  | feature_phenotype_id | serial | *PRIMARY KEY* |
| [feature](Chado_Tables#Table:_feature "Chado Tables") | feature_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](Chado_Tables#Table:_phenotype "Chado Tables") | phenotype_id | integer | *UNIQUE#1 NOT NULL* |

public.feature_phenotype Structure

------------------------------------------------------------------------

  

## <span id="Table:_phenotype" class="mw-headline">Table: phenotype</span>

A phenotypic statement, or a single atomic phenotypic observation, is a
controlled sentence describing observable effects of non-wild type
function. E.g. Obs=eye, attribute=color, cvalue=red.

<table data-border="1" data-cellpadding="3">
<caption>public.phenotype Structure</caption>
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
<td>phenotype_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em></em></td>
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
<td>units_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Phenotype value units of measurement.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>cvalue_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Phenotype attribute value (state).</td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>assay_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Evidence type.</td>
</tr>
</tbody>
</table>

public.phenotype Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_phenotype](Chado_Tables#Table:_feature_phenotype "Chado Tables")

<!-- -->

- [nd_experiment_phenotype](Chado_Tables#Table:_nd_experiment_phenotype "Chado Tables")

<!-- -->

- [phenotype_comparison](Chado_Tables#Table:_phenotype_comparison "Chado Tables")

<!-- -->

- [phenotype_cvterm](Chado_Tables#Table:_phenotype_cvterm "Chado Tables")

<!-- -->

- [phenotypeprop](Chado_Tables#Table:_phenotypeprop "Chado Tables")

<!-- -->

- [phenstatement](Chado_Tables#Table:_phenstatement "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_phenotype_cvterm" class="mw-headline">Table: phenotype_cvterm</span>

Deprecated and superseded by phenotypeprop.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phenotype_cvterm_id | serial | *PRIMARY KEY* |
| [phenotype](Chado_Tables#Table:_phenotype "Chado Tables") | phenotype_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | cvterm_id | integer | *UNIQUE#1 NOT NULL* |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

public.phenotype_cvterm Structure

------------------------------------------------------------------------

  

## <span id="Table:_phenotypeprop" class="mw-headline">Table: phenotypeprop</span>

A phenotype property should either have a value defined in
phenotypeprop.value or in phenotypeprop.cvalue_id but not in both
fields.

<table data-border="1" data-cellpadding="3">
<caption>public.phenotypeprop Structure</caption>
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
<td>phenotypeprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_phenotype"
title="Chado Tables">phenotype</a></p></td>
<td>phenotype_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>text</td>
<td><em></em><br />
<br />
Property value is free text.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>cvalue_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Property value is a cvterm.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
</tbody>
</table>

public.phenotypeprop Structure

------------------------------------------------------------------------




[Category](Special%253ACategories "Special%253ACategories"):

- [Under
  Construction](Category%253AUnder_Construction "Category%253AUnder Construction")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Phenotype_Module_-2D_Staging"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:10 on 10 December
  2010.</span>
<!-- - <span id="footer-info-viewcount">7,635 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





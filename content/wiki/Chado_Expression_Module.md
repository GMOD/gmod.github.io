---
title: "Chado Expression Module"
---




<span id="top"></span>




# <span dir="auto">Chado Expression Module</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Mage and
    Expression</span>](#Mage_and_Expression)
- [<span class="tocnumber">2</span>
  <span class="toctext">Tables</span>](#Tables)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Table:
    eimage</span>](#Table:_eimage)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Table:
    expression</span>](#Table:_expression)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Table:
    expression_cvterm</span>](#Table:_expression_cvterm)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Table:
    expression_image</span>](#Table:_expression_image)
  - [<span class="tocnumber">2.5</span> <span class="toctext">Table:
    expression_pub</span>](#Table:_expression_pub)
  - [<span class="tocnumber">2.6</span> <span class="toctext">Table:
    feature_expression</span>](#Table:_feature_expression)



# <span id="Introduction" class="mw-headline">Introduction</span>

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

### <span id="Mage_and_Expression" class="mw-headline">Mage and Expression</span>

The [Mage module](Chado_Mage_Module "Chado Mage Module") and the
Expression module can be considered overlapping but complementary. The
Mage module can store data taken directly from the experimental results
whereas the Expression module is typically used to store summary data
taken from the biological literature, or extracted from the microarray
data stored in Mage. The Mage module handles details about experiments
that the Expression module does not whereas the Expression module can be
thought of a simpler set of tables designed to tie ontologies concerned
with expression to sequence features.

# <span id="Tables" class="mw-headline">Tables</span>

## <span id="Table:_eimage" class="mw-headline">Table: eimage</span>

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

  

## <span id="Table:_expression" class="mw-headline">Table: expression</span>

The expression table is essentially a bridge table.

| F-Key | Name          | Type          | Description       |
|-------|---------------|---------------|-------------------|
|       | expression_id | serial        | *PRIMARY KEY*     |
|       | uniquename    | text          | *UNIQUE NOT NULL* |
|       | md5checksum   | character(32) |                   |
|       | description   | text          |                   |

expression Structure

Tables referencing this one via Foreign Key Constraints:

- [expression_cvterm](Chado_Tables#Table:_expression_cvterm "Chado Tables")

<!-- -->

- [expression_image](Chado_Tables#Table:_expression_image "Chado Tables")

<!-- -->

- [expression_pub](Chado_Tables#Table:_expression_pub "Chado Tables")

<!-- -->

- [expressionprop](Chado_Tables#Table:_expressionprop "Chado Tables")

<!-- -->

- [feature_expression](Chado_Tables#Table:_feature_expression "Chado Tables")

<!-- -->

- [wwwuser_expression](Chado_Tables#Table:_wwwuser_expression "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_expression_cvterm" class="mw-headline">Table: expression_cvterm</span>

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

  

## <span id="Table:_expression_image" class="mw-headline">Table: expression_image</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | expression_image_id | serial | *PRIMARY KEY* |
| [expression](Chado_Tables#Table:_expression "Chado Tables") | expression_id | integer | *UNIQUE#1 NOT NULL* |
| [eimage](Chado_Tables#Table:_eimage "Chado Tables") | eimage_id | integer | *UNIQUE#1 NOT NULL* |

expression_image Structure

------------------------------------------------------------------------

  

## <span id="Table:_expression_pub" class="mw-headline">Table: expression_pub</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | expression_pub_id | serial | *PRIMARY KEY* |
| [expression](Chado_Tables#Table:_expression "Chado Tables") | expression_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |

expression_pub Structure

------------------------------------------------------------------------

  

## <span id="Table:_feature_expression" class="mw-headline">Table: feature_expression</span>

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




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado Modules](Category%253AChado_Modules "Category%253AChado Modules")
- [Expression](Category%253AExpression "Category%253AExpression")
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Expression_Module" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 04:35 on 18 February
  2015.</span>
<!-- - <span id="footer-info-viewcount">86,304 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





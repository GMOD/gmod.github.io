---
title: "Chado Stock Module"
---




<span id="top"></span>




# <span dir="auto">Chado Stock Module</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
- [<span class="tocnumber">2</span>
  <span class="toctext">Tables</span>](#Tables)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Table:
    stock</span>](#Table:_stock)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Table:
    stock_cvterm</span>](#Table:_stock_cvterm)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Table:
    stock_dbxref</span>](#Table:_stock_dbxref)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Table:
    stock_genotype</span>](#Table:_stock_genotype)
  - [<span class="tocnumber">2.5</span> <span class="toctext">Table:
    stock_pub</span>](#Table:_stock_pub)
  - [<span class="tocnumber">2.6</span> <span class="toctext">Table:
    stock_relationship</span>](#Table:_stock_relationship)
  - [<span class="tocnumber">2.7</span> <span class="toctext">Table:
    stock_relationship_pub</span>](#Table:_stock_relationship_pub)
  - [<span class="tocnumber">2.8</span> <span class="toctext">Table:
    stockcollection</span>](#Table:_stockcollection)
  - [<span class="tocnumber">2.9</span> <span class="toctext">Table:
    stockcollection_stock</span>](#Table:_stockcollection_stock)
  - [<span class="tocnumber">2.10</span> <span class="toctext">Table:
    stockcollectionprop</span>](#Table:_stockcollectionprop)
  - [<span class="tocnumber">2.11</span> <span class="toctext">Table:
    stockprop</span>](#Table:_stockprop)
  - [<span class="tocnumber">2.12</span> <span class="toctext">Table:
    stockprop_pub</span>](#Table:_stockprop_pub)



# <span id="Introduction" class="mw-headline">Introduction</span>

The stock module was designed to store information about stock
collections in a laboratory. What is called a *stock* could also be
called a *strain* or an *accession*. There is a lot in common between a
*Drosophila* stock and a Saccharomyces *strain* and an *Arabidopsis*
line. They all come from some taxon, have genotypes, physical locations
in the lab, some conceivable relationship with a publication, some
conceivable relationship with a sequence feature (such as a transgene),
and could be described by some ontology term.

It may be that not all critical details about your collection are
accommodated, if this is the case it should not be difficult to extend
for your own purposes.

# <span id="Tables" class="mw-headline">Tables</span>

## <span id="Table:_stock" class="mw-headline">Table: stock</span>

Any stock can be globally identified by the combination of organism,
uniquename and stock type. A stock is the physical entities, either
living or preserved, held by collections. Stocks belong to a collection;
they have IDs, type, organism, description and may have a genotype.

<table data-border="1" data-cellpadding="3">
<caption>stock Structure</caption>
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
<td>stock_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_dbxref"
title="Chado Tables">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em></em><br />
<br />
The dbxref_id is an optional primary stable identifier for this stock.
Secondary identifiers and external dbxrefs go in table:
stock_dbxref.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_organism"
title="Chado Tables">organism</a></p></td>
<td>organism_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The organism_id is the organism to which the stock belongs. This column
is mandatory.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
The name is a human-readable local name for a stock.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>description</td>
<td>text</td>
<td><em></em><br />
<br />
The description is the genetic description provided in the stock
list.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The type_id foreign key links to a controlled vocabulary of stock types.
The would include living stock, genomic DNA, preserved specimen.
Secondary cvterms for stocks would go in stock_cvterm.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_obsolete</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT false</em></td>
</tr>
</tbody>
</table>

stock Structure

Tables referencing this one via Foreign Key Constraints:

- [stock_cvterm](Chado_Tables#Table:_stock_cvterm "Chado Tables")

<!-- -->

- [stock_dbxref](Chado_Tables#Table:_stock_dbxref "Chado Tables")

<!-- -->

- [stock_genotype](Chado_Tables#Table:_stock_genotype "Chado Tables")

<!-- -->

- [stock_pub](Chado_Tables#Table:_stock_pub "Chado Tables")

<!-- -->

- [stock_relationship](Chado_Tables#Table:_stock_relationship "Chado Tables")

<!-- -->

- [stockcollection_stock](Chado_Tables#Table:_stockcollection_stock "Chado Tables")

<!-- -->

- [stockprop](Chado_Tables#Table:_stockprop "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_stock_cvterm" class="mw-headline">Table: stock_cvterm</span>

stock_cvterm links a stock to cvterms. This is for secondary cvterms;
primary cvterms should use stock.type_id.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | stock_cvterm_id | serial | *PRIMARY KEY* |
| [stock](Chado_Tables#Table:_stock "Chado Tables") | stock_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | cvterm_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |

stock_cvterm Structure

------------------------------------------------------------------------

  

## <span id="Table:_stock_dbxref" class="mw-headline">Table: stock_dbxref</span>

stock_dbxref links a stock to dbxrefs. This is for secondary
identifiers; primary identifiers should use stock.dbxref_id.

<table data-border="1" data-cellpadding="3">
<caption>stock_dbxref Structure</caption>
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
<td>stock_dbxref_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_stock"
title="Chado Tables">stock</a></p></td>
<td>stock_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_dbxref"
title="Chado Tables">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_current</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT true</em><br />
<br />
The is_current boolean indicates whether the linked dbxref is the
current -official- dbxref for the linked stock.</td>
</tr>
</tbody>
</table>

stock_dbxref Structure

------------------------------------------------------------------------

  

## <span id="Table:_stock_genotype" class="mw-headline">Table: stock_genotype</span>

Simple table linking a stock to a genotype. Features with genotypes can
be linked to stocks thru feature_genotype -\> genotype -\>
stock_genotype -\> stock.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | stock_genotype_id | serial | *PRIMARY KEY* |
| [stock](Chado_Tables#Table:_stock "Chado Tables") | stock_id | integer | *UNIQUE#1 NOT NULL* |
| [genotype](Chado_Tables#Table:_genotype "Chado Tables") | genotype_id | integer | *UNIQUE#1 NOT NULL* |

stock_genotype Structure

------------------------------------------------------------------------

  

## <span id="Table:_stock_pub" class="mw-headline">Table: stock_pub</span>

Provenance. Linking table between stocks and, for example, a stocklist
computer file.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | stock_pub_id | serial | *PRIMARY KEY* |
| [stock](Chado_Tables#Table:_stock "Chado Tables") | stock_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |

stock_pub Structure

------------------------------------------------------------------------

  

## <span id="Table:_stock_relationship" class="mw-headline">Table: stock_relationship</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | stock_relationship_id | serial | *PRIMARY KEY* |
| [stock](Chado_Tables#Table:_stock "Chado Tables") | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [stock](Chado_Tables#Table:_stock "Chado Tables") | object_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

stock_relationship Structure

Tables referencing this one via Foreign Key Constraints:

- [stock_relationship_pub](Chado_Tables#Table:_stock_relationship_pub "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_stock_relationship_pub" class="mw-headline">Table: stock_relationship_pub</span>

Provenance. Attach optional evidence to a stock_relationship in the form
of a publication.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | stock_relationship_pub_id | serial | *PRIMARY KEY* |
| [stock_relationship](Chado_Tables#Table:_stock_relationship "Chado Tables") | stock_relationship_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |

stock_relationship_pub Structure

------------------------------------------------------------------------

  

## <span id="Table:_stockcollection" class="mw-headline">Table: stockcollection</span>

The lab or stock center distributing the stocks in their collection.

<table data-border="1" data-cellpadding="3">
<caption>stockcollection Structure</caption>
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
<td>stockcollection_id</td>
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
type_id is the collection type cv.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_contact"
title="Chado Tables">contact</a></p></td>
<td>contact_id</td>
<td>integer</td>
<td><em></em><br />
<br />
contact_id links to the contact information for the collection.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
name is the collection.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
uniqename is the value of the collection cv.</td>
</tr>
</tbody>
</table>

stockcollection Structure

Tables referencing this one via Foreign Key Constraints:

- [stockcollection_stock](Chado_Tables#Table:_stockcollection_stock "Chado Tables")

<!-- -->

- [stockcollectionprop](Chado_Tables#Table:_stockcollectionprop "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_stockcollection_stock" class="mw-headline">Table: stockcollection_stock</span>

stockcollection_stock links a stock collection to the stocks which are
contained in the collection.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | stockcollection_stock_id | serial | *PRIMARY KEY* |
| [stockcollection](Chado_Tables#Table:_stockcollection "Chado Tables") | stockcollection_id | integer | *UNIQUE#1 NOT NULL* |
| [stock](Chado_Tables#Table:_stock "Chado Tables") | stock_id | integer | *UNIQUE#1 NOT NULL* |

stockcollection_stock Structure

------------------------------------------------------------------------

  

## <span id="Table:_stockcollectionprop" class="mw-headline">Table: stockcollectionprop</span>

The table stockcollectionprop contains the value of the stock collection
such as website/email URLs; the value of the stock collection order
URLs.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | stockcollectionprop_id | serial | *PRIMARY KEY* |
| [stockcollection](Chado_Tables#Table:_stockcollection "Chado Tables") | stockcollection_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

stockcollectionprop Structure

------------------------------------------------------------------------

  

## <span id="Table:_stockprop" class="mw-headline">Table: stockprop</span>

A stock can have any number of slot-value property tags attached to it.
This is an alternative to hardcoding a list of columns in the relational
schema, and is completely extensible. There is a unique constraint,
stockprop_c1, for the combination of stock_id, rank, and type_id.
Multivalued property-value pairs must be differentiated by rank.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | stockprop_id | serial | *PRIMARY KEY* |
| [stock](Chado_Tables#Table:_stock "Chado Tables") | stock_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

stockprop Structure

Tables referencing this one via Foreign Key Constraints:

- [stockprop_pub](Chado_Tables#Table:_stockprop_pub "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_stockprop_pub" class="mw-headline">Table: stockprop_pub</span>

Provenance. Any stockprop assignment can optionally be supported by a
publication.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | stockprop_pub_id | serial | *PRIMARY KEY* |
| [stockprop](Chado_Tables#Table:_stockprop "Chado Tables") | stockprop_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |

stockprop_pub Structure

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Stock_Module" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 04:41 on 18 February
  2015.</span>
<!-- - <span id="footer-info-viewcount">54,279 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





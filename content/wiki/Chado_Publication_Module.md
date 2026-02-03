---
title: "Chado Publication Module"
---




<span id="top"></span>




# <span dir="auto">Chado Publication Module</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
- [<span class="tocnumber">2</span>
  <span class="toctext">Tables</span>](#Tables)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Table:
    pub</span>](#Table:_pub)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Table:
    pub_dbxref</span>](#Table:_pub_dbxref)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Table:
    pub_relationship</span>](#Table:_pub_relationship)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Table:
    pubauthor</span>](#Table:_pubauthor)
  - [<span class="tocnumber">2.5</span> <span class="toctext">Table:
    pubprop</span>](#Table:_pubprop)



# <span id="Introduction" class="mw-headline">Introduction</span>

The Publication module describes references to sources of knowledge.
Usually these are published articles but can also include conferences,
Web pages, and so on.

# <span id="Tables" class="mw-headline">Tables</span>

## <span id="Table:_pub" class="mw-headline">Table: pub</span>

A documented provenance artefact - publications, documents, personal
communication.

<table data-border="1" data-cellpadding="3">
<caption>pub Structure</caption>
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
<td>pub_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>title</td>
<td>text</td>
<td><em></em><br />
<br />
Descriptive general heading.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>volumetitle</td>
<td>text</td>
<td><em></em><br />
<br />
Title of part if one of a series.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>volume</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>series_name</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
Full name of (journal) series.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>issue</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>pyear</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>pages</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
Page number range[s], e.g. 457--459, viii + 664pp, lv--lvii.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>miniref</td>
<td>character varying(255)</td>
<td><em></em></td>
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
<td>type_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
The type of the publication (book, journal, poem, graffiti, etc). Uses
pub cv. See <a
href="http://www.ebi.ac.uk/ontology-lookup/browse.do?ontName=FBcv"
class="external text" rel="nofollow">FBcv</a> for publication
descriptor, or <a
href="http://obo.cvs.sourceforge.net/obo/obo/ontology/vocabularies/flybase_controlled_vocabulary.obo"
class="external text" rel="nofollow">FBcv.obo</a></td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_obsolete</td>
<td>boolean</td>
<td><em>DEFAULT false</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>publisher</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>pubplace</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
</tbody>
</table>

pub Structure

Tables referencing this one via Foreign Key Constraints:

- [expression_pub](Chado_Tables#Table:_expression_pub "Chado Tables")

<!-- -->

- [feature_cvterm](Chado_Tables#Table:_feature_cvterm "Chado Tables")

<!-- -->

- [feature_cvterm_pub](Chado_Tables#Table:_feature_cvterm_pub "Chado Tables")

<!-- -->

- [feature_expression](Chado_Tables#Table:_feature_expression "Chado Tables")

<!-- -->

- [feature_pub](Chado_Tables#Table:_feature_pub "Chado Tables")

<!-- -->

- [feature_relationship_pub](Chado_Tables#Table:_feature_relationship_pub "Chado Tables")

<!-- -->

- [feature_relationshipprop_pub](Chado_Tables#Table:_feature_relationshipprop_pub "Chado Tables")

<!-- -->

- [feature_synonym](Chado_Tables#Table:_feature_synonym "Chado Tables")

<!-- -->

- [featureloc_pub](Chado_Tables#Table:_featureloc_pub "Chado Tables")

<!-- -->

- [featuremap_pub](Chado_Tables#Table:_featuremap_pub "Chado Tables")

<!-- -->

- [featureprop_pub](Chado_Tables#Table:_featureprop_pub "Chado Tables")

<!-- -->

- [library_cvterm](Chado_Tables#Table:_library_cvterm "Chado Tables")

<!-- -->

- [library_pub](Chado_Tables#Table:_library_pub "Chado Tables")

<!-- -->

- [library_synonym](Chado_Tables#Table:_library_synonym "Chado Tables")

<!-- -->

- [phendesc](Chado_Tables#Table:_phendesc "Chado Tables")

<!-- -->

- [phenotype_comparison](Chado_Tables#Table:_phenotype_comparison "Chado Tables")

<!-- -->

- [phenstatement](Chado_Tables#Table:_phenstatement "Chado Tables")

<!-- -->

- [phylonode_pub](Chado_Tables#Table:_phylonode_pub "Chado Tables")

<!-- -->

- [phylotree_pub](Chado_Tables#Table:_phylotree_pub "Chado Tables")

<!-- -->

- [protocol](Chado_Tables#Table:_protocol "Chado Tables")

<!-- -->

- [pub_dbxref](Chado_Tables#Table:_pub_dbxref "Chado Tables")

<!-- -->

- [pub_relationship](Chado_Tables#Table:_pub_relationship "Chado Tables")

<!-- -->

- [pubauthor](Chado_Tables#Table:_pubauthor "Chado Tables")

<!-- -->

- [pubprop](Chado_Tables#Table:_pubprop "Chado Tables")

<!-- -->

- [stock_cvterm](Chado_Tables#Table:_stock_cvterm "Chado Tables")

<!-- -->

- [stock_pub](Chado_Tables#Table:_stock_pub "Chado Tables")

<!-- -->

- [stock_relationship_pub](Chado_Tables#Table:_stock_relationship_pub "Chado Tables")

<!-- -->

- [stockprop_pub](Chado_Tables#Table:_stockprop_pub "Chado Tables")

<!-- -->

- [study](Chado_Tables#Table:_study "Chado Tables")

<!-- -->

- [wwwuser_pub](Chado_Tables#Table:_wwwuser_pub "Chado Tables")

------------------------------------------------------------------------

## <span id="Table:_pub_dbxref" class="mw-headline">Table: pub_dbxref</span>

Handle links to repositories, e.g. Pubmed, Biosis, zoorec, OCLC,
Medline, ISSN, coden...

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | pub_dbxref_id | serial | *PRIMARY KEY* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |
| [dbxref](Chado_Tables#Table:_dbxref "Chado Tables") | dbxref_id | integer | *UNIQUE#1 NOT NULL* |
|  | is_current | boolean | *NOT NULL DEFAULT true* |

pub_dbxref Structure

------------------------------------------------------------------------

  

## <span id="Table:_pub_relationship" class="mw-headline">Table: pub_relationship</span>

Handle relationships between publications, e.g. when one publication
makes others obsolete, when one publication contains errata with respect
to other publication(s), or when one publication also appears in another
pub.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | pub_relationship_id | serial | *PRIMARY KEY* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | object_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |

pub_relationship Structure

------------------------------------------------------------------------

  

## <span id="Table:_pubauthor" class="mw-headline">Table: pubauthor</span>

An author for a publication. Note the denormalisation (hence lack of \_
in table name) - this is deliberate as it is in general too hard to
assign IDs to authors.

<table data-border="1" data-cellpadding="3">
<caption>pubauthor Structure</caption>
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
<td>pubauthor_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_pub"
title="Chado Tables">pub</a></p></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Order of author in author list for this pub - order is important.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>editor</td>
<td>boolean</td>
<td><em>DEFAULT false</em><br />
<br />
Indicates whether the author is an editor for linked publication. Note:
this is a boolean field but does not follow the normal chado convention
for naming booleans.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>surname</td>
<td>character varying(100)</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>givennames</td>
<td>character varying(100)</td>
<td><em></em><br />
<br />
First name, initials</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>suffix</td>
<td>character varying(100)</td>
<td><em></em><br />
<br />
Jr., Sr., etc</td>
</tr>
</tbody>
</table>

pubauthor Structure

------------------------------------------------------------------------

  

## <span id="Table:_pubprop" class="mw-headline">Table: pubprop</span>

Property-value pairs for a pub. Follows standard chado pattern.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | pubprop_id | serial | *PRIMARY KEY* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | *NOT NULL* |
|  | rank | integer | *UNIQUE#1* |

pubprop Structure

------------------------------------------------------------------------




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado Modules](Category%253AChado_Modules "Category%253AChado Modules")
- [!Lacking ERD](Category%253A!Lacking_ERD "Category%253A!Lacking ERD")






## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AChado_Publication_Module" accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>





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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Publication_Module"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 04:40 on 18 February
  2015.</span>
<!-- - <span id="footer-info-viewcount">50,434 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





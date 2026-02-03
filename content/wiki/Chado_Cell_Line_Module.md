---
title: "Chado Cell Line Module"
---
# Chado Cell Line Module

  Introduction](#Introduction)
- [Tables](#Tables)
  - [Table:
    **cell_line**](#Table:_cell_line)
  - [Table:
    **cell_line_relationship**](#Table:_cell_line_relationship)
  - [Table:
    **cell_line_synonym**](#Table:_cell_line_synonym)
  - [Table:
    **cell_line_cvterm**](#Table:_cell_line_cvterm)
  - [Table:
    **cell_line_dbxref**](#Table:_cell_line_dbxref)
  - [Table:
    **cell_lineprop**](#Table:_cell_lineprop)
  - [Table:
    **cell_lineprop_pub**](#Table:_cell_lineprop_pub)
  - [Table:
    **cell_line_feature**](#Table:_cell_line_feature)
  - [Table:
    **cell_line_cvtermprop**](#Table:_cell_line_cvtermprop)
  - [Table:
    **cell_line_pub**](#Table:_cell_line_pub)
  - [Table:
    **cell_line_library**](#Table:_cell_line_library)

# Introduction

# Tables

## Table: **`cell_line`**

\<protect\>

|-------------|-------------------| **Table:**  | **`cell_line`**   | **Module:** | ****Cell Line**** |

  

<table class="wikitable chadotable">
<caption><strong><code>cell_line</code></strong> columns</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><a href="Glossary#Foreign_Key" title="Glossary">FK</a></th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>cell_line_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td>uniquename</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td><a href="Chado_Organism_Module#Table:_organism"
title="Chado Organism Module"><strong><code>organism</code></strong></a></td>
<td>organism_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td></td>
<td>timeaccessioned</td>
<td>timestamp without time zone</td>
<td><em>NOT NULL</em><br />
&#10;<p><em>DEFAULT</em> now()<br />
</p></td>
</tr>
<tr class="even">
<td></td>
<td>timelastmodified</td>
<td>timestamp without time zone</td>
<td><em>NOT NULL</em><br />
&#10;<p><em>DEFAULT</em> now()<br />
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`cell_line`** columns

Tables referencing **`cell_line`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- [**`cell_line_cvterm`**](Chado_Cell_Line_Module#Table:_cell_line_cvterm "Chado Cell Line Module")
- [**`cell_line_dbxref`**](Chado_Cell_Line_Module#Table:_cell_line_dbxref "Chado Cell Line Module")
- [**`cell_line_feature`**](Chado_Cell_Line_Module#Table:_cell_line_feature "Chado Cell Line Module")
- [**`cell_line_library`**](Chado_Cell_Line_Module#Table:_cell_line_library "Chado Cell Line Module")
- [**`cell_line_pub`**](Chado_Cell_Line_Module#Table:_cell_line_pub "Chado Cell Line Module")
- [**`cell_line_relationship`**](Chado_Cell_Line_Module#Table:_cell_line_relationship "Chado Cell Line Module")
- [**`cell_line_synonym`**](Chado_Cell_Line_Module#Table:_cell_line_synonym "Chado Cell Line Module")
- [**`cell_lineprop`**](Chado_Cell_Line_Module#Table:_cell_lineprop "Chado Cell Line Module")

\</protect\>

**`cell_line`** **Additional Comments:**

Add your comments here and they will be integrated into the [schema
documentation](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
as part of the next Chado release.

## Table: **`cell_line_relationship`**

\<protect\>

|-------------|------------------------------| **Table:**  | **`cell_line_relationship`** | **Module:** | ****Cell Line****            |

  

<table class="wikitable chadotable">
<caption><strong><code>cell_line_relationship</code></strong>
columns</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><a href="Glossary#Foreign_Key" title="Glossary">FK</a></th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>cell_line_relationship_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Cell_Line_Module#Table:_cell_line"
title="Chado Cell Line Module"><strong><code>cell_line</code></strong></a></td>
<td>subject_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_Cell_Line_Module#Table:_cell_line"
title="Chado Cell Line Module"><strong><code>cell_line</code></strong></a></td>
<td>object_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td><a href="Chado_CV_Module#Table:_cvterm"
title="Chado CV Module"><strong><code>cvterm</code></strong></a></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`cell_line_relationship`** columns

Tables referencing **`cell_line_relationship`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

**`cell_line_relationship`** **Additional Comments:**

Add your comments here and they will be integrated into the [schema
documentation](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
as part of the next Chado release.

## Table: **`cell_line_synonym`**

\<protect\>

|-------------|-------------------------| **Table:**  | **`cell_line_synonym`** | **Module:** | ****Cell Line****       |

  

<table class="wikitable chadotable">
<caption><strong><code>cell_line_synonym</code></strong>
columns</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><a href="Glossary#Foreign_Key" title="Glossary">FK</a></th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>cell_line_synonym_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Cell_Line_Module#Table:_cell_line"
title="Chado Cell Line Module"><strong><code>cell_line</code></strong></a></td>
<td>cell_line_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_Sequence_Module#Table:_synonym"
title="Chado Sequence Module"><strong><code>synonym</code></strong></a></td>
<td>synonym_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td><a href="Chado_Publication_Module#Table:_pub"
title="Chado Publication Module"><strong><code>pub</code></strong></a></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td></td>
<td>is_current</td>
<td>boolean</td>
<td><em>NOT NULL</em><br />
&#10;<p><em>DEFAULT</em> false<br />
</p></td>
</tr>
<tr class="even">
<td></td>
<td>is_internal</td>
<td>boolean</td>
<td><em>NOT NULL</em><br />
&#10;<p><em>DEFAULT</em> false<br />
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`cell_line_synonym`** columns

Tables referencing **`cell_line_synonym`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

**`cell_line_synonym`** **Additional Comments:**

Add your comments here and they will be integrated into the [schema
documentation](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
as part of the next Chado release.

## Table: **`cell_line_cvterm`**

\<protect\>

|-------------|------------------------| **Table:**  | **`cell_line_cvterm`** | **Module:** | ****Cell Line****      |

  

<table class="wikitable chadotable">
<caption><strong><code>cell_line_cvterm</code></strong>
columns</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><a href="Glossary#Foreign_Key" title="Glossary">FK</a></th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>cell_line_cvterm_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Cell_Line_Module#Table:_cell_line"
title="Chado Cell Line Module"><strong><code>cell_line</code></strong></a></td>
<td>cell_line_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_CV_Module#Table:_cvterm"
title="Chado CV Module"><strong><code>cvterm</code></strong></a></td>
<td>cvterm_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td><a href="Chado_Publication_Module#Table:_pub"
title="Chado Publication Module"><strong><code>pub</code></strong></a></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`cell_line_cvterm`** columns

Tables referencing **`cell_line_cvterm`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- [**`cell_line_cvtermprop`**](Chado_Cell_Line_Module#Table:_cell_line_cvtermprop "Chado Cell Line Module")

\</protect\>

**`cell_line_cvterm`** **Additional Comments:**

Add your comments here and they will be integrated into the [schema
documentation](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
as part of the next Chado release.

## Table: **`cell_line_dbxref`**

\<protect\>

|-------------|------------------------| **Table:**  | **`cell_line_dbxref`** | **Module:** | ****Cell Line****      |

  

<table class="wikitable chadotable">
<caption><strong><code>cell_line_dbxref</code></strong>
columns</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><a href="Glossary#Foreign_Key" title="Glossary">FK</a></th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>cell_line_dbxref_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Cell_Line_Module#Table:_cell_line"
title="Chado Cell Line Module"><strong><code>cell_line</code></strong></a></td>
<td>cell_line_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_General_Module#Table:_dbxref"
title="Chado General Module"><strong><code>dbxref</code></strong></a></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td></td>
<td>is_current</td>
<td>boolean</td>
<td><em>NOT NULL</em><br />
&#10;<p><em>DEFAULT</em> true<br />
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`cell_line_dbxref`** columns

Tables referencing **`cell_line_dbxref`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

**`cell_line_dbxref`** **Additional Comments:**

Add your comments here and they will be integrated into the [schema
documentation](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
as part of the next Chado release.

## Table: **`cell_lineprop`**

\<protect\>

|-------------|---------------------| **Table:**  | **`cell_lineprop`** | **Module:** | ****Cell Line****   |

  

<table class="wikitable chadotable">
<caption><strong><code>cell_lineprop</code></strong> columns</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><a href="Glossary#Foreign_Key" title="Glossary">FK</a></th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>cell_lineprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Cell_Line_Module#Table:_cell_line"
title="Chado Cell Line Module"><strong><code>cell_line</code></strong></a></td>
<td>cell_line_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_CV_Module#Table:_cvterm"
title="Chado CV Module"><strong><code>cvterm</code></strong></a></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td></td>
<td>value</td>
<td>text</td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`cell_lineprop`** columns

Tables referencing **`cell_lineprop`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- [**`cell_lineprop_pub`**](Chado_Cell_Line_Module#Table:_cell_lineprop_pub "Chado Cell Line Module")

\</protect\>

**`cell_lineprop`** **Additional Comments:**

Add your comments here and they will be integrated into the [schema
documentation](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
as part of the next Chado release.

## Table: **`cell_lineprop_pub`**

\<protect\>

|-------------|-------------------------| **Table:**  | **`cell_lineprop_pub`** | **Module:** | ****Cell Line****       |

  

<table class="wikitable chadotable">
<caption><strong><code>cell_lineprop_pub</code></strong>
columns</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><a href="Glossary#Foreign_Key" title="Glossary">FK</a></th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>cell_lineprop_pub_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Cell_Line_Module#Table:_cell_lineprop"
title="Chado Cell Line Module"><strong><code>cell_lineprop</code></strong></a></td>
<td>cell_lineprop_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_Publication_Module#Table:_pub"
title="Chado Publication Module"><strong><code>pub</code></strong></a></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`cell_lineprop_pub`** columns

Tables referencing **`cell_lineprop_pub`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

**`cell_lineprop_pub`** **Additional Comments:**

Add your comments here and they will be integrated into the [schema
documentation](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
as part of the next Chado release.

## Table: **`cell_line_feature`**

\<protect\>

|-------------|-------------------------| **Table:**  | **`cell_line_feature`** | **Module:** | ****Cell Line****       |

  

<table class="wikitable chadotable">
<caption><strong><code>cell_line_feature</code></strong>
columns</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><a href="Glossary#Foreign_Key" title="Glossary">FK</a></th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>cell_line_feature_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Cell_Line_Module#Table:_cell_line"
title="Chado Cell Line Module"><strong><code>cell_line</code></strong></a></td>
<td>cell_line_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_Sequence_Module#Table:_feature"
title="Chado Sequence Module"><strong><code>feature</code></strong></a></td>
<td>feature_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td><a href="Chado_Publication_Module#Table:_pub"
title="Chado Publication Module"><strong><code>pub</code></strong></a></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`cell_line_feature`** columns

Tables referencing **`cell_line_feature`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

**`cell_line_feature`** **Additional Comments:**

Add your comments here and they will be integrated into the [schema
documentation](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
as part of the next Chado release.

## Table: **`cell_line_cvtermprop`**

\<protect\>

|-------------|----------------------------| **Table:**  | **`cell_line_cvtermprop`** | **Module:** | ****Cell Line****          |

  

<table class="wikitable chadotable">
<caption><strong><code>cell_line_cvtermprop</code></strong>
columns</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><a href="Glossary#Foreign_Key" title="Glossary">FK</a></th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>cell_line_cvtermprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Cell_Line_Module#Table:_cell_line_cvterm"
title="Chado Cell Line Module"><strong><code>cell_line_cvterm</code></strong></a></td>
<td>cell_line_cvterm_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_CV_Module#Table:_cvterm"
title="Chado CV Module"><strong><code>cvterm</code></strong></a></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td></td>
<td>value</td>
<td>text</td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`cell_line_cvtermprop`** columns

Tables referencing **`cell_line_cvtermprop`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

**`cell_line_cvtermprop`** **Additional Comments:**

Add your comments here and they will be integrated into the [schema
documentation](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
as part of the next Chado release.

## Table: **`cell_line_pub`**

\<protect\>

|-------------|---------------------| **Table:**  | **`cell_line_pub`** | **Module:** | ****Cell Line****   |

  

<table class="wikitable chadotable">
<caption><strong><code>cell_line_pub</code></strong> columns</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><a href="Glossary#Foreign_Key" title="Glossary">FK</a></th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>cell_line_pub_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Cell_Line_Module#Table:_cell_line"
title="Chado Cell Line Module"><strong><code>cell_line</code></strong></a></td>
<td>cell_line_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_Publication_Module#Table:_pub"
title="Chado Publication Module"><strong><code>pub</code></strong></a></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`cell_line_pub`** columns

Tables referencing **`cell_line_pub`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

**`cell_line_pub`** **Additional Comments:**

Add your comments here and they will be integrated into the [schema
documentation](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
as part of the next Chado release.

## Table: **`cell_line_library`**

\<protect\>

|-------------|-------------------------| **Table:**  | **`cell_line_library`** | **Module:** | ****Cell Line****       |

  

<table class="wikitable chadotable">
<caption><strong><code>cell_line_library</code></strong>
columns</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><a href="Glossary#Foreign_Key" title="Glossary">FK</a></th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>cell_line_library_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Cell_Line_Module#Table:_cell_line"
title="Chado Cell Line Module"><strong><code>cell_line</code></strong></a></td>
<td>cell_line_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_Library_Module#Table:_library"
title="Chado Library Module"><strong><code>library</code></strong></a></td>
<td>library_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td><a href="Chado_Publication_Module#Table:_pub"
title="Chado Publication Module"><strong><code>pub</code></strong></a></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`cell_line_library`** columns

Tables referencing **`cell_line_library`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

**`cell_line_library`** **Additional Comments:**

Add your comments here and they will be integrated into the [schema
documentation](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
as part of the next Chado release.

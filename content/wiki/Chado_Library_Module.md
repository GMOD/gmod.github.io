---
title: "Chado Library Module"
---
# Chado Library Module

The library module is designed to store detailed information about
molecular libraries. The library module uses the [sequence
module](/wiki/Chado_Sequence_Module), thus the library
in question could be any collection of sequences that the [sequence
module](/wiki/Chado_Sequence_Module) can describe. It
is expected that most of the description of a given library would come
through the use of ontology terms.

 Library module</span>](#Using_the_Library_module)
 - [A FlyBase
 cDNA library](#A_FlyBase_cDNA_library)
 - [Background](#Background)
 - [Implementation](#Implementation)
 - [Relationship
 graph](#Relationship_graph)
 - [Naming
 conventions](#Naming_conventions)
 - [A dsRNA
 library](#A_dsRNA_library)
 - [Background](#Background_2)
 - [Implementation](#Implementation_2)
 - [Relationship
 graph](#Relationship_graph_2)
- [Tables](#Tables)
- [Table:
 library](#Table:_library)
- [Table:
 library_cvterm](#Table:_library_cvterm)
- [Table:
 library_feature](#Table:_library_feature)
- [Table:
 library_pub](#Table:_library_pub)
- [Table:
 library_synonym](#Table:_library_synonym)
- [Table:
 libraryprop](#Table:_libraryprop)

## Using the Library module

The following are examples showing how to use this module to describe a
library.

### A FlyBase cDNA library

Written by Haiyan Zhang, April 14, 2006, the original Wiki page is here:
<a
href="http://cedar.bio.indiana.edu/mediawiki/index.php/Library_module_implementation"

#### Background

The cDNA library contains complementary DNA molecules synthesized from
mRNA molecules in a cell. One cDNA library has only one cloning vector.

- cDNA_clone: Complementary DNA; A piece of DNA copied from an mRNA and
 spliced into a vector for propagation in a suitable host.
- cDNA: DNA synthesized by reverse transcriptase using RNA as a
 template.
- EST: Expressed Sequence Tag: The sequence of a single sequencing read
 from a cDNA clone or PCR product; typically a few hundred base pairs
 long.

#### Implementation

1. Library name and uniquenames are generally from the first 2 letters
 of the the cDNA_clones, or the first 2 letters and vector name e.g.
 _AT library_, _HL_pOT2 library_
2. Library stored in _library_ table, type as _cDNA library_.
3. _libraryprop_ table stores the general description for each library
 as type _comment_ and the vector for each library as type _element_.
4. Library synonyms are linked in _library_synonym_ table.
5. Library's references are linked in _library_pub_ table.
6. Each cDNA_clone, cDNA, EST, vector is a feature with the
 corresponding type.
7. cDNA_clone has no residues information.
8. _library_feature_ connects library and its cDNA_clones.
9. cDNA, EST and vector are connected with cDNA_clone in
 _feature_relationship_ table, as type _partof_. cDNA_clone is the
 _object_id_, cDNA/EST/vector is the _subject_id_.

#### Relationship graph

 pOTB7
 __________ vector/plasmid
 | --partof
 \/ AT13713
 library -->library_feature ==> ------------------------- cDNA_clone
 ^ /\ --partof ^
 || AY113251 |
 partof-- | _________________ | cDNA
 | |--partof
 BF499196 ________ | ___________ EST
 AT13713.contig1 | CK130673
 | | AT13713.contig2
 | ---------------------------------------- genomic contig

#### Naming conventions

Rules for chado clones and clone features:

- cDNA_clone: uniquename = FBclxxxxxxx, name = clone id number e.g.
 _LD12345_
- cDNA: uniquename = accession number (if possible), name = clone id
 number e.g. _LD12345_
- EST: uniquename = accession number (if possible), name = clone id
 number.5prime,3prime,:contig etc e.g. _LD12345.5prime_

### A dsRNA library

June 1, 2006 written by Kathleen Falls. The original Wiki page is here:
<a
href="http://cedar.bio.indiana.edu/mediawiki/index.php/RNAi_primer_and_amplicon_implementation"

#### Background

The aim is to stored information about a dsRNA library and its
bulk-loaded amplicons and primers in Chado. There are sites performing
RNAi screens for which there are link-outs in chado (DRSC, FLIGHT,
Heidelberg RNAi) by genes hit by the screens. Initially the plan is to
store the dsRNA primers and amplicons with there chromosomal locations
mapped to the current release. The goal is to link the libraries, dsRNA
amplicons with genes and
.

- dsRNA library: contains collections of dsRNA amplicons, primarily from
 the screening centers. Currently it holds the DRSC collection.
- dsRNA amplicon: sequence of 100-500 bp selected from genomic DNA
 designed to amplify an exonic region or selected from cDNA
- dsRNA primers: PCR primers pairs of 15-25 bp designed to amplify dsRNA
 amplicon

#### Implementation

- The dsRNA library uniquename and name is typically name or initials of
 the screening center e.g. _DRSC_ for Drosophila RNAi Screening Center.
- The dsRNA library is stored in _library_ table, type "dsRNA library".
- The _libraryprop_ table stores a general description for each library
 as type _comment_ and for the DRSC library the DNA amplified from as
 type _strain_ value _Oregon R_.
- The _library_pub_ is reference to uniquename FBrf0188751 (personal
 communication to FlyBase).

Each dsRNA amplicon is stored in the _feature_ table. The uniquename is
FBrinnnnnnn generated by script and tracked in a log file, the type is
_pcr_product_ and no residues are stored. Each has a _featureloc_ entry
relating back to chromosome_arm. Strand was determined by extracting
residues from fmin+1 to fmax for an amplicon then for each each primer
pair testing for an exact match by length and orientation.

The dsRNA primers are a feature with uniquename FBrinnnnnnn_R and \_S,
type oligonucleotide and the residues are stored. They are linked to
their dsRNA amplicon in _feature_relationship_, as type
_primer_progenitor_of_ with each primer as subject and the dsRNA
amplicon as object.

The _feature_pub_ for dsRNA amplicons and primers is a reference to
FBrf0188751 (personal communication to FlyBase).

The _featureloc_pub_ for dsRNA amplicons remapped to rel5 is FBrf0188751
(personal communication to FlyBase) while the _featureloc_pub_ for dsRNA
amplicons mapped by BLAST of the primers to rel5 is FBrf0104946 (FlyBase
inference by analysis).

Each dsRNA amplicon feature record is linked to _library_ in the
_library_feature_ table.

#### Relationship graph

 ---------------------------------------------------------------------- chromosomal arm
 ^ ^
 | floc |
 -------------------------------------- dsRNA
 ^ ^ / \ ^ ^
 | fr | | fr | | | pcr primer R ------------ | ---------- pcr primer S
 --partof --------------------------------------- dsRNA library-->library_feature

## Tables

## Table: library

<table data-border="1" data-cellpadding="3">
<caption>library Structure</caption>
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
<td>library_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_organism"
title="Chado Tables">organism</a></p></td>
<td>organism_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The type_id foreign key links to a controlled vocabulary of library
types. Examples of this would be: "cDNA_library" or
"genomic_library"</td>
</tr>
</tbody>
</table>

library Structure

Tables referencing this one via Foreign Key Constraints:

- [library_cvterm](/wiki/Chado_Tables#Table:_library_cvterm)
- [library_feature](/wiki/Chado_Tables#Table:_library_feature)
- [library_pub](/wiki/Chado_Tables#Table:_library_pub)
- [library_synonym](/wiki/Chado_Tables#Table:_library_synonym)
- [libraryprop](/wiki/Chado_Tables#Table:_libraryprop)

---

## Table: library_cvterm

The table library_cvterm links a library to controlled vocabularies
which describe the library. For instance, there might be a link to the
anatomy cv for "head" or "testes" for a head or testes library.

| F-Key | Name | Type | Description | ----------------------------------------------------- | ----------------- | ------- | ------------------- | | library_cvterm_id | serial | _PRIMARY KEY_ | [library](/wiki/Chado_Tables#Table:_library) | library_id | integer | _UNIQUE#1 NOT NULL_ | [cvterm](/wiki/Chado_Tables#Table:_cvterm) | cvterm_id | integer | _UNIQUE#1 NOT NULL_ | [pub](/wiki/Chado_Tables#Table:_pub) | pub_id | integer | _UNIQUE#1 NOT NULL_ |

library_cvterm Structure

---

## Table: library_feature

library_feature links a library to the clones which are contained in the
library. Examples of such linked features might be "cDNA_clone" or
"genomic_clone".

| F-Key | Name | Type | Description | ----------------------------------------------------- | ------------------ | ------- | ------------------- | | library_feature_id | serial | _PRIMARY KEY_ | [library](/wiki/Chado_Tables#Table:_library) | library_id | integer | _UNIQUE#1 NOT NULL_ | [feature](/wiki/Chado_Tables#Table:_feature) | feature_id | integer | _UNIQUE#1 NOT NULL_ |

library_feature Structure

---

## Table: library_pub

| F-Key | Name | Type | Description | ----------------------------------------------------- | -------------- | ------- | ------------------- | | library_pub_id | serial | _PRIMARY KEY_ | [library](/wiki/Chado_Tables#Table:_library) | library_id | integer | _UNIQUE#1 NOT NULL_ | [pub](/wiki/Chado_Tables#Table:_pub) | pub_id | integer | _UNIQUE#1 NOT NULL_ |

library_pub Structure

---

## Table: library_synonym

<table data-border="1" data-cellpadding="3">
<caption>library_synonym Structure</caption>
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
<td>library_synonym_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_synonym"
title="Chado Tables">synonym</a></p></td>
<td>synonym_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_library"
title="Chado Tables">library</a></p></td>
<td>library_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_pub"
title="Chado Tables">pub</a></p></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The pub_id link is for relating the usage of a given synonym to the
publication in which it was used.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>is_current</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT true</em><br />
<br />
The is_current bit indicates whether the linked synonym is the current
-official- symbol for the linked library.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_internal</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT false</em><br />
<br />
Typically a synonym exists so that somebody querying the database with
an obsolete name can find the object they are looking for under its
current name. If the synonym has been used publicly and deliberately
(e.g. in a paper), it my also be listed in reports as a synonym. If the
synonym was not used deliberately (e.g., there was a typo which went
public), then the is_internal bit may be set to "true" so that it is
known that the synonym is "internal" and should be queryable but should
not be listed in reports as a valid synonym.</td>
</tr>
</tbody>
</table>

library_synonym Structure

---

## Table: libraryprop

| F-Key | Name | Type | Description | ----------------------------------------------------- | -------------- | ------- | ------------------- | | libraryprop_id | serial | _PRIMARY KEY_ | [library](/wiki/Chado_Tables#Table:_library) | library_id | integer | _UNIQUE#1 NOT NULL_ | [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | _UNIQUE#1 NOT NULL_ | | value | text | rank | integer | _UNIQUE#1 NOT NULL_ |

libraryprop Structure

---

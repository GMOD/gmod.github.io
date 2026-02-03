---
title: "Chado Library Module"
---
<span id="top"></span>

# <span dir="auto">Chado Library Module</span>

The library module is designed to store detailed information about
molecular libraries. The library module uses the [sequence
module](Chado_Sequence_Module "Chado Sequence Module"), thus the library
in question could be any collection of sequences that the [sequence
module](Chado_Sequence_Module "Chado Sequence Module") can describe. It
is expected that most of the description of a given library would come
through the use of ontology terms.

## Contents

- [<span class="tocnumber">1</span> <span class="toctext">Using the
  Library module</span>](#Using_the_Library_module)
  - [<span class="tocnumber">1.1</span> <span class="toctext">A FlyBase
    cDNA library</span>](#A_FlyBase_cDNA_library)
    - [<span class="tocnumber">1.1.1</span>
      <span class="toctext">Background</span>](#Background)
    - [<span class="tocnumber">1.1.2</span>
      <span class="toctext">Implementation</span>](#Implementation)
    - [<span class="tocnumber">1.1.3</span>
      <span class="toctext">Relationship
      graph</span>](#Relationship_graph)
    - [<span class="tocnumber">1.1.4</span> <span class="toctext">Naming
      conventions</span>](#Naming_conventions)
  - [<span class="tocnumber">1.2</span> <span class="toctext">A dsRNA
    library</span>](#A_dsRNA_library)
    - [<span class="tocnumber">1.2.1</span>
      <span class="toctext">Background</span>](#Background_2)
    - [<span class="tocnumber">1.2.2</span>
      <span class="toctext">Implementation</span>](#Implementation_2)
    - [<span class="tocnumber">1.2.3</span>
      <span class="toctext">Relationship
      graph</span>](#Relationship_graph_2)
- [<span class="tocnumber">2</span>
  <span class="toctext">Tables</span>](#Tables)
- [<span class="tocnumber">3</span> <span class="toctext">Table:
  library</span>](#Table:_library)
- [<span class="tocnumber">4</span> <span class="toctext">Table:
  library_cvterm</span>](#Table:_library_cvterm)
- [<span class="tocnumber">5</span> <span class="toctext">Table:
  library_feature</span>](#Table:_library_feature)
- [<span class="tocnumber">6</span> <span class="toctext">Table:
  library_pub</span>](#Table:_library_pub)
- [<span class="tocnumber">7</span> <span class="toctext">Table:
  library_synonym</span>](#Table:_library_synonym)
- [<span class="tocnumber">8</span> <span class="toctext">Table:
  libraryprop</span>](#Table:_libraryprop)

## <span id="Using_the_Library_module" class="mw-headline">Using the Library module</span>

The following are examples showing how to use this module to describe a
library.

### <span id="A_FlyBase_cDNA_library" class="mw-headline">A FlyBase cDNA library</span>

Written by Haiyan Zhang, April 14, 2006, the original Wiki page is here:
<a
href="http://cedar.bio.indiana.edu/mediawiki/index.php/Library_module_implementation"
class="external free"
rel="nofollow">http://cedar.bio.indiana.edu/mediawiki/index.php/Library_module_implementation</a>.

#### <span id="Background" class="mw-headline">Background</span>

The cDNA library contains complementary DNA molecules synthesized from
mRNA molecules in a cell. One cDNA library has only one cloning vector.

- cDNA_clone: Complementary DNA; A piece of DNA copied from an mRNA and
  spliced into a vector for propagation in a suitable host.
- cDNA: DNA synthesized by reverse transcriptase using RNA as a
  template.
- EST: Expressed Sequence Tag: The sequence of a single sequencing read
  from a cDNA clone or PCR product; typically a few hundred base pairs
  long.

#### <span id="Implementation" class="mw-headline">Implementation</span>

1.  Library name and uniquenames are generally from the first 2 letters
    of the the cDNA_clones, or the first 2 letters and vector name e.g.
    _AT library_, _HL_pOT2 library_
2.  Library stored in _library_ table, type as _cDNA library_.
3.  _libraryprop_ table stores the general description for each library
    as type _comment_ and the vector for each library as type _element_.
4.  Library synonyms are linked in _library_synonym_ table.
5.  Library's references are linked in _library_pub_ table.
6.  Each cDNA_clone, cDNA, EST, vector is a feature with the
    corresponding type.
7.  cDNA_clone has no residues information.
8.  _library_feature_ connects library and its cDNA_clones.
9.  cDNA, EST and vector are connected with cDNA_clone in
    _feature_relationship_ table, as type _partof_. cDNA_clone is the
    _object_id_, cDNA/EST/vector is the _subject_id_.

#### <span id="Relationship_graph" class="mw-headline">Relationship graph</span>

                                             pOTB7
                                     __________              vector/plasmid
                                         ||  --partof
                             \/       AT13713
     library -->library_feature ==> -------------------------   cDNA_clone
                        ^     /\  --partof     ^
                        |     ||      AY113251 |
                  partof--  |   _________________  |    cDNA
                                    |         |        |
                                    |         |        |--partof
                           BF499196   ________    |   ___________     EST
                                  AT13713.contig1 |       |   CK130673
                                         |        |       |   AT13713.contig2
                                         |        |       |
                         ---------------------------------------- genomic contig

#### <span id="Naming_conventions" class="mw-headline">Naming conventions</span>

Rules for chado clones and clone features:

- cDNA_clone: uniquename = FBclxxxxxxx, name = clone id number e.g.
  _LD12345_
- cDNA: uniquename = accession number (if possible), name = clone id
  number e.g. _LD12345_
- EST: uniquename = accession number (if possible), name = clone id
  number.5prime,3prime,:contig etc e.g. _LD12345.5prime_

### <span id="A_dsRNA_library" class="mw-headline">A dsRNA library</span>

June 1, 2006 written by Kathleen Falls. The original Wiki page is here:
<a
href="http://cedar.bio.indiana.edu/mediawiki/index.php/RNAi_primer_and_amplicon_implementation"
class="external free"
rel="nofollow">http://cedar.bio.indiana.edu/mediawiki/index.php/RNAi_primer_and_amplicon_implementation</a>.

#### <span id="Background_2" class="mw-headline">Background</span>

The aim is to stored information about a dsRNA library and its
bulk-loaded amplicons and primers in Chado. There are sites performing
RNAi screens for which there are link-outs in chado (DRSC, FLIGHT,
Heidelberg RNAi) by genes hit by the screens. Initially the plan is to
store the dsRNA primers and amplicons with there chromosomal locations
mapped to the current release. The goal is to link the libraries, dsRNA
amplicons with genes and
[phenotypes](Category%253APhenotypes "Category%253APhenotypes").

- dsRNA library: contains collections of dsRNA amplicons, primarily from
  the screening centers. Currently it holds the DRSC collection.
- dsRNA amplicon: sequence of 100-500 bp selected from genomic DNA
  designed to amplify an exonic region or selected from cDNA
- dsRNA primers: PCR primers pairs of 15-25 bp designed to amplify dsRNA
  amplicon

#### <span id="Implementation_2" class="mw-headline">Implementation</span>

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

#### <span id="Relationship_graph_2" class="mw-headline">Relationship graph</span>

     ---------------------------------------------------------------------- chromosomal arm
                         ^                                      ^
                         |                                      |
                         |     floc                             |
                         |                                      |
                          --------------------------------------      dsRNA
                         ^           ^      / \       ^        ^
                         |   fr      |      | |       |   fr   |
                         |           |      | |       |        |
           pcr primer R  ------------       | |       ----------    pcr primer S
                                 --partof   | |
                         ---------------------------------------   dsRNA library-->library_feature

## <span id="Tables" class="mw-headline">Tables</span>

## <span id="Table:_library" class="mw-headline">Table: library</span>

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
<td><p><a href="Chado_Tables#Table:_organism"
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
<td><p><a href="Chado_Tables#Table:_cvterm"
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

- [library_cvterm](Chado_Tables#Table:_library_cvterm "Chado Tables")

<!-- -->

- [library_feature](Chado_Tables#Table:_library_feature "Chado Tables")

<!-- -->

- [library_pub](Chado_Tables#Table:_library_pub "Chado Tables")

<!-- -->

- [library_synonym](Chado_Tables#Table:_library_synonym "Chado Tables")

<!-- -->

- [libraryprop](Chado_Tables#Table:_libraryprop "Chado Tables")

---

## <span id="Table:_library_cvterm" class="mw-headline">Table: library_cvterm</span>

The table library_cvterm links a library to controlled vocabularies
which describe the library. For instance, there might be a link to the
anatomy cv for "head" or "testes" for a head or testes library.

| F-Key                                                 | Name              | Type    | Description         |
| ----------------------------------------------------- | ----------------- | ------- | ------------------- |
|                                                       | library_cvterm_id | serial  | _PRIMARY KEY_       |
| [library](Chado_Tables#Table:_library "Chado Tables") | library_id        | integer | _UNIQUE#1 NOT NULL_ |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables")   | cvterm_id         | integer | _UNIQUE#1 NOT NULL_ |
| [pub](Chado_Tables#Table:_pub "Chado Tables")         | pub_id            | integer | _UNIQUE#1 NOT NULL_ |

library_cvterm Structure

---

## <span id="Table:_library_feature" class="mw-headline">Table: library_feature</span>

library_feature links a library to the clones which are contained in the
library. Examples of such linked features might be "cDNA_clone" or
"genomic_clone".

| F-Key                                                 | Name               | Type    | Description         |
| ----------------------------------------------------- | ------------------ | ------- | ------------------- |
|                                                       | library_feature_id | serial  | _PRIMARY KEY_       |
| [library](Chado_Tables#Table:_library "Chado Tables") | library_id         | integer | _UNIQUE#1 NOT NULL_ |
| [feature](Chado_Tables#Table:_feature "Chado Tables") | feature_id         | integer | _UNIQUE#1 NOT NULL_ |

library_feature Structure

---

## <span id="Table:_library_pub" class="mw-headline">Table: library_pub</span>

| F-Key                                                 | Name           | Type    | Description         |
| ----------------------------------------------------- | -------------- | ------- | ------------------- |
|                                                       | library_pub_id | serial  | _PRIMARY KEY_       |
| [library](Chado_Tables#Table:_library "Chado Tables") | library_id     | integer | _UNIQUE#1 NOT NULL_ |
| [pub](Chado_Tables#Table:_pub "Chado Tables")         | pub_id         | integer | _UNIQUE#1 NOT NULL_ |

library_pub Structure

---

## <span id="Table:_library_synonym" class="mw-headline">Table: library_synonym</span>

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
<td><p><a href="Chado_Tables#Table:_synonym"
title="Chado Tables">synonym</a></p></td>
<td>synonym_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_library"
title="Chado Tables">library</a></p></td>
<td>library_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_pub"
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

## <span id="Table:_libraryprop" class="mw-headline">Table: libraryprop</span>

| F-Key                                                 | Name           | Type    | Description         |
| ----------------------------------------------------- | -------------- | ------- | ------------------- |
|                                                       | libraryprop_id | serial  | _PRIMARY KEY_       |
| [library](Chado_Tables#Table:_library "Chado Tables") | library_id     | integer | _UNIQUE#1 NOT NULL_ |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables")   | type_id        | integer | _UNIQUE#1 NOT NULL_ |
|                                                       | value          | text    |                     |
|                                                       | rank           | integer | _UNIQUE#1 NOT NULL_ |

libraryprop Structure

---

[Categories](Special%253ACategories "Special%253ACategories"):

- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Library_Module" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 04:36 on 18 February 2015.</span>
<!-- - <span id="footer-info-viewcount">86,020 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

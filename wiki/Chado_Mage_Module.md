<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">Chado Mage Module</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Other
    Documentation</span>](#Other_Documentation)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Mage and
    Expression</span>](#Mage_and_Expression)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Entering
    and Querying</span>](#Entering_and_Querying)
    - [<span class="tocnumber">1.3.1</span>
      <span class="toctext">Loading</span>](#Loading)
    - [<span class="tocnumber">1.3.2</span>
      <span class="toctext">Querying</span>](#Querying)
- [<span class="tocnumber">2</span>
  <span class="toctext">Tables</span>](#Tables)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Table:
    acquisition</span>](#Table:_acquisition)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Table:
    acquisition_relationship</span>](#Table:_acquisition_relationship)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Table:
    acquisitionprop</span>](#Table:_acquisitionprop)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Table:
    arraydesign</span>](#Table:_arraydesign)
  - [<span class="tocnumber">2.5</span> <span class="toctext">Table:
    arraydesignprop</span>](#Table:_arraydesignprop)
  - [<span class="tocnumber">2.6</span> <span class="toctext">Table:
    assay</span>](#Table:_assay)
  - [<span class="tocnumber">2.7</span> <span class="toctext">Table:
    assay_biomaterial</span>](#Table:_assay_biomaterial)
  - [<span class="tocnumber">2.8</span> <span class="toctext">Table:
    assay_project</span>](#Table:_assay_project)
  - [<span class="tocnumber">2.9</span> <span class="toctext">Table:
    assayprop</span>](#Table:_assayprop)
  - [<span class="tocnumber">2.10</span> <span class="toctext">Table:
    biomaterial</span>](#Table:_biomaterial)
  - [<span class="tocnumber">2.11</span> <span class="toctext">Table:
    biomaterial_dbxref</span>](#Table:_biomaterial_dbxref)
  - [<span class="tocnumber">2.12</span> <span class="toctext">Table:
    biomaterial_relationship</span>](#Table:_biomaterial_relationship)
  - [<span class="tocnumber">2.13</span> <span class="toctext">Table:
    biomaterial_treatment</span>](#Table:_biomaterial_treatment)
  - [<span class="tocnumber">2.14</span> <span class="toctext">Table:
    biomaterialprop</span>](#Table:_biomaterialprop)
  - [<span class="tocnumber">2.15</span> <span class="toctext">Table:
    channel</span>](#Table:_channel)
  - [<span class="tocnumber">2.16</span> <span class="toctext">Table:
    control</span>](#Table:_control)
  - [<span class="tocnumber">2.17</span> <span class="toctext">Table:
    element</span>](#Table:_element)
  - [<span class="tocnumber">2.18</span> <span class="toctext">Table:
    element_relationship</span>](#Table:_element_relationship)
  - [<span class="tocnumber">2.19</span> <span class="toctext">Table:
    elementresult</span>](#Table:_elementresult)
  - [<span class="tocnumber">2.20</span> <span class="toctext">Table:
    elementresult_relationship</span>](#Table:_elementresult_relationship)
  - [<span class="tocnumber">2.21</span> <span class="toctext">Table:
    magedocumentation</span>](#Table:_magedocumentation)
  - [<span class="tocnumber">2.22</span> <span class="toctext">Table:
    mageml</span>](#Table:_mageml)
  - [<span class="tocnumber">2.23</span> <span class="toctext">Table:
    protocol</span>](#Table:_protocol)
  - [<span class="tocnumber">2.24</span> <span class="toctext">Table:
    protocolparam</span>](#Table:_protocolparam)
  - [<span class="tocnumber">2.25</span> <span class="toctext">Table:
    quantification</span>](#Table:_quantification)
  - [<span class="tocnumber">2.26</span> <span class="toctext">Table:
    quantification_relationship</span>](#Table:_quantification_relationship)
  - [<span class="tocnumber">2.27</span> <span class="toctext">Table:
    quantificationprop</span>](#Table:_quantificationprop)
  - [<span class="tocnumber">2.28</span> <span class="toctext">Table:
    study</span>](#Table:_study)
  - [<span class="tocnumber">2.29</span> <span class="toctext">Table:
    study_assay</span>](#Table:_study_assay)
  - [<span class="tocnumber">2.30</span> <span class="toctext">Table:
    studydesign</span>](#Table:_studydesign)
  - [<span class="tocnumber">2.31</span> <span class="toctext">Table:
    studydesignprop</span>](#Table:_studydesignprop)
  - [<span class="tocnumber">2.32</span> <span class="toctext">Table:
    studyfactor</span>](#Table:_studyfactor)
  - [<span class="tocnumber">2.33</span> <span class="toctext">Table:
    studyfactorvalue</span>](#Table:_studyfactorvalue)
  - [<span class="tocnumber">2.34</span> <span class="toctext">Table:
    treatment</span>](#Table:_treatment)

</div>

# <span id="Introduction" class="mw-headline">Introduction</span>

The Mage module is designed to store data from microarray experiments.
It is based on the
<a href="http://www.cbil.upenn.edu/RAD2/" class="external text"
rel="nofollow">RAD database</a> but has been substantially modified to
contain the necessary foreign keys and satisfy the [Chado naming
conventions](Chado_Manual#Chado_Naming_Conventions "Chado Manual"). The
Mage module is compatible with the
<a href="http://www.mged.org/Workgroups/MAGE/mage.html"
class="external text" rel="nofollow">MAGE standard</a>.

## <span id="Other_Documentation" class="mw-headline">Other Documentation</span>

See the [Mage FAQ](Mage_FAQ "Mage FAQ").

## <span id="Mage_and_Expression" class="mw-headline">Mage and Expression</span>

The Mage module and the [Expression
module](Chado_Expression_Module "Chado Expression Module") can be
considered overlapping but complementary. The Mage module can store data
taken directly from the experimental results whereas the Expression
module is typically used to store summary data taken from the biological
literature, or extracted from the microarray data stored in Mage. The
Mage module handles details about experiments that the Expression module
does not whereas the Expression module can be thought of a simpler set
of tables designed to tie ontologies concerned with expression to
sequence features.

## <span id="Entering_and_Querying" class="mw-headline">Entering and Querying</span>

A typical case would be that the researcher had run some number of
microarray experiments. She will need to load the resultant data into
the Mage module and related tables, then query them. These tasks could
be accomplished using some application but for illustrative purposes we
will interact directly with the schema. Let's assume that the tissues
being assayed come from *Drosophila melanogaster*. The relevant tables
are shown below, the purpose is to show the relationships between the
key tables.

<a href="File:Rad-query-1.png" class="image"><img
src="../mediawiki/images/4/41/Rad-query-1.png" width="1103" height="365"
alt="Rad-query-1.png" /></a>

  
Red is for the *mage* tables, Yellow is for *companalysis* tables, Gray
is for *organism* tables, Blue is for *sequence* tables, and Green is
for the *cv* tables.

  

### <span id="Loading" class="mw-headline">Loading</span>

The researcher would load the data into the database in this order:

1.  Assume that *forebrain*, or any other relevant ontology terms, are
    records in the *cvterm* table from a previously loaded anatomy
    ontology.
2.  Create a *biomaterial* record for the forebrain sample the
    expression was observed in. The *organism_id* would be for
    *Drosophila melanogaster* (assume all the relevant species are
    already loaded in *organism*).
3.  Create a *biomaterialprop* record to link records from **1**
    (*cvterm*) and **2** ( *biomaterial*).
4.  Create or use an *arraydesign* record for the assay platform. This
    could be something like *Drosophila2* (an Affymetrix platform), or
    even a string like *features* if we just want to report expression
    or lack thereof for all genes in the assayed sample.
5.  Create an *assay* record to represent the event where the forebrain
    sample was measured. It links to the record created in **4**
    (*arraydesign*).
6.  Link records from **2** (*biomaterial*) and **5** (*assay*) in
    *assay_biomaterial*. The relationship here is many-to-many between
    assays and biomaterials because of multichannel and multiplexed
    assay technology.
7.  Create an *acquisition* record that depends on **5** (*assay*). This
    is how the assay's results were digitized, typically using a digital
    camera or scanner, but it can refer to any data acquired from the
    assay in general.
8.  Create an *analysis* record. This is the algorithm that is used to
    process the data from **7** (*acquisition*).
9.  Create a *quantification* record. It depends on **7**
    (*acquisition*) and **8** (*analysis*), and represents data from
    **7** processed using **8**.
10. Create *element* records, one per gene that is assayable using **4**
    (*arraydesign*). Each *element* record has a nullable attribute
    where it can point back to *feature* records to associate elements
    directly with genomic features.
11. Create *elementresult* records, one for each record created in
    **10** (*element*) and pointing back to **9** (*quantification*)
    which ultimately links back to the sample. Experimental result data
    is stored here.

  
You can store a boolean for 'expressed' or 'not expressed', or you could
store the quantitative data and have some algorithm that determines from
those data what is or is not expressed. Obviously the latter is less
lossy but is also less straightforward for the casual observer to
interpret.

### <span id="Querying" class="mw-headline">Querying</span>

Once data has been loaded according to the general approach above the
schema can be queryed. A typical question the researcher may ask is
"which genes are expressed in the *Drosophila* forebrain". That question
is roughly equivalent to this SQL query:

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="sql source-sql">

``` de1
SELECT uniquename FROM feature
JOIN element ON feature.feature_id = element.feature_id
JOIN elementresult ON element.element_id = elementresult.element_id
JOIN quantification ON elementresult.quantification_id = quantification.quantification_id
JOIN acquisition ON quantification.acquisition_id = acquisition.acquisition_id
JOIN assay ON acquisition.assay_id = assay.assay_id
JOIN assay_biomaterial ON assay.assay_id = assay_biomaterial.assay_id
JOIN biomaterial ON assay_biomaterial.biomaterial_id = biomaterial.biomaterial_id
JOIN organism ON biomaterial.taxon_id = organism.organism_id
JOIN biomaterialprop ON biomaterial.biomaterial_id = biomaterialprop.biomaterial_id
JOIN cvterm ON biomaterialprop.type_id = cvterm.cvterm_id
WHERE organism.common_name = 'Drosophila' AND
WHERE cvterm.name = 'forebrain' AND
WHERE elementresult.signal > 0;
```

</div>

</div>

# <span id="Tables" class="mw-headline">Tables</span>

## <span id="Table:_acquisition" class="mw-headline">Table: acquisition</span>

This represents the scanning of hybridized material. The output of this
process is typically a digital image of an array.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | acquisition_id | serial | *PRIMARY KEY* |
| [assay](Chado_Tables#Table:_assay "Chado Tables") | assay_id | integer | *NOT NULL* |
| [protocol](Chado_Tables#Table:_protocol "Chado Tables") | protocol_id | integer |  |
| [channel](Chado_Tables#Table:_channel "Chado Tables") | channel_id | integer |  |
|  | acquisitiondate | timestamp without time zone | *DEFAULT ('now'::text)::timestamp(6) with time zone* |
|  | name | text | *UNIQUE* |
|  | uri | text |  |

acquisition Structure

Tables referencing this one via Foreign Key Constraints:

- [acquisition_relationship](Chado_Tables#Table:_acquisition_relationship "Chado Tables")

<!-- -->

- [acquisitionprop](Chado_Tables#Table:_acquisitionprop "Chado Tables")

<!-- -->

- [quantification](Chado_Tables#Table:_quantification "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_acquisition_relationship" class="mw-headline">Table: acquisition_relationship</span>

Multiple monochrome images may be merged to form a multi-color image.
Red-green images of 2-channel hybridizations are an example of this.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | acquisition_relationship_id | serial | *PRIMARY KEY* |
| [acquisition](Chado_Tables#Table:_acquisition "Chado Tables") | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
| [acquisition](Chado_Tables#Table:_acquisition "Chado Tables") | object_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

acquisition_relationship Structure

------------------------------------------------------------------------

  

## <span id="Table:_acquisitionprop" class="mw-headline">Table: acquisitionprop</span>

Parameters associated with image acquisition.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | acquisitionprop_id | serial | *PRIMARY KEY* |
| [acquisition](Chado_Tables#Table:_acquisition "Chado Tables") | acquisition_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

acquisitionprop Structure

------------------------------------------------------------------------

  

## <span id="Table:_arraydesign" class="mw-headline">Table: arraydesign</span>

General properties about an array. An array is a template used to
generate physical slides, etc. It contains layout information, as well
as global array properties, such as material (glass, nylon) and spot
dimensions (in rows/columns).

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | arraydesign_id | serial | *PRIMARY KEY* |
| [contact](Chado_Tables#Table:_contact "Chado Tables") | manufacturer_id | integer | *NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | platformtype_id | integer | *NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | substratetype_id | integer |  |
| [protocol](Chado_Tables#Table:_protocol "Chado Tables") | protocol_id | integer |  |
| [dbxref](Chado_Tables#Table:_dbxref "Chado Tables") | dbxref_id | integer |  |
|  | name | text | *UNIQUE NOT NULL* |
|  | version | text |  |
|  | description | text |  |
|  | array_dimensions | text |  |
|  | element_dimensions | text |  |
|  | num_of_elements | integer |  |
|  | num_array_columns | integer |  |
|  | num_array_rows | integer |  |
|  | num_grid_columns | integer |  |
|  | num_grid_rows | integer |  |
|  | num_sub_columns | integer |  |
|  | num_sub_rows | integer |  |

arraydesign Structure

Tables referencing this one via Foreign Key Constraints:

- [arraydesignprop](Chado_Tables#Table:_arraydesignprop "Chado Tables")

<!-- -->

- [assay](Chado_Tables#Table:_assay "Chado Tables")

<!-- -->

- [element](Chado_Tables#Table:_element "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_arraydesignprop" class="mw-headline">Table: arraydesignprop</span>

Extra array design properties that are not accounted for in arraydesign.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | arraydesignprop_id | serial | *PRIMARY KEY* |
| [arraydesign](Chado_Tables#Table:_arraydesign "Chado Tables") | arraydesign_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

arraydesignprop Structure

------------------------------------------------------------------------

  

## <span id="Table:_assay" class="mw-headline">Table: assay</span>

An assay consists of a physical instance of an array, combined with the
conditions used to create the array (protocols, technician information).
The assay can be thought of as a hybridization.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | assay_id | serial | *PRIMARY KEY* |
| [arraydesign](Chado_Tables#Table:_arraydesign "Chado Tables") | arraydesign_id | integer | *NOT NULL* |
| [protocol](Chado_Tables#Table:_protocol "Chado Tables") | protocol_id | integer |  |
|  | assaydate | timestamp without time zone | *DEFAULT ('now'::text)::timestamp(6) with time zone* |
|  | arrayidentifier | text |  |
|  | arraybatchidentifier | text |  |
| [contact](Chado_Tables#Table:_contact "Chado Tables") | operator_id | integer | *NOT NULL* |
| [dbxref](Chado_Tables#Table:_dbxref "Chado Tables") | dbxref_id | integer |  |
|  | name | text | *UNIQUE* |
|  | description | text |  |

assay Structure

Tables referencing this one via Foreign Key Constraints:

- [acquisition](Chado_Tables#Table:_acquisition "Chado Tables")

<!-- -->

- [assay_biomaterial](Chado_Tables#Table:_assay_biomaterial "Chado Tables")

<!-- -->

- [assay_project](Chado_Tables#Table:_assay_project "Chado Tables")

<!-- -->

- [assayprop](Chado_Tables#Table:_assayprop "Chado Tables")

<!-- -->

- [control](Chado_Tables#Table:_control "Chado Tables")

<!-- -->

- [study_assay](Chado_Tables#Table:_study_assay "Chado Tables")

<!-- -->

- [studyfactorvalue](Chado_Tables#Table:_studyfactorvalue "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_assay_biomaterial" class="mw-headline">Table: assay_biomaterial</span>

A biomaterial can be hybridized many times (technical replicates), or
combined with other biomaterials in a single hybridization (for
two-channel arrays).

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | assay_biomaterial_id | serial | *PRIMARY KEY* |
| [assay](Chado_Tables#Table:_assay "Chado Tables") | assay_id | integer | *UNIQUE#1 NOT NULL* |
| [biomaterial](Chado_Tables#Table:_biomaterial "Chado Tables") | biomaterial_id | integer | *UNIQUE#1 NOT NULL* |
| [channel](Chado_Tables#Table:_channel "Chado Tables") | channel_id | integer | *UNIQUE#1* |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

assay_biomaterial Structure

------------------------------------------------------------------------

  

## <span id="Table:_assay_project" class="mw-headline">Table: assay_project</span>

Link assays to projects.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | assay_project_id | serial | *PRIMARY KEY* |
| [assay](Chado_Tables#Table:_assay "Chado Tables") | assay_id | integer | *UNIQUE#1 NOT NULL* |
| [project](Chado_Tables#Table:_project "Chado Tables") | project_id | integer | *UNIQUE#1 NOT NULL* |

assay_project Structure

------------------------------------------------------------------------

  

## <span id="Table:_assayprop" class="mw-headline">Table: assayprop</span>

Extra assay properties that are not accounted for in assay.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | assayprop_id | serial | *PRIMARY KEY* |
| [assay](Chado_Tables#Table:_assay "Chado Tables") | assay_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

assayprop Structure

------------------------------------------------------------------------

  

## <span id="Table:_biomaterial" class="mw-headline">Table: biomaterial</span>

A biomaterial represents the MAGE concept of BioSource, BioSample, and
LabeledExtract. It is essentially some biological material (tissue,
cells, serum) that may have been processed. Processed biomaterials
should be traceable back to raw biomaterials via the
biomaterialrelationship table.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | biomaterial_id | serial | *PRIMARY KEY* |
| [organism](Chado_Tables#Table:_organism "Chado Tables") | taxon_id | integer |  |
| [contact](Chado_Tables#Table:_contact "Chado Tables") | biosourceprovider_id | integer |  |
| [dbxref](Chado_Tables#Table:_dbxref "Chado Tables") | dbxref_id | integer |  |
|  | name | text | *UNIQUE* |
|  | description | text |  |

biomaterial Structure

Tables referencing this one via Foreign Key Constraints:

- [assay_biomaterial](Chado_Tables#Table:_assay_biomaterial "Chado Tables")

<!-- -->

- [biomaterial_dbxref](Chado_Tables#Table:_biomaterial_dbxref "Chado Tables")

<!-- -->

- [biomaterial_relationship](Chado_Tables#Table:_biomaterial_relationship "Chado Tables")

<!-- -->

- [biomaterial_treatment](Chado_Tables#Table:_biomaterial_treatment "Chado Tables")

<!-- -->

- [biomaterialprop](Chado_Tables#Table:_biomaterialprop "Chado Tables")

<!-- -->

- [treatment](Chado_Tables#Table:_treatment "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_biomaterial_dbxref" class="mw-headline">Table: biomaterial_dbxref</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | biomaterial_dbxref_id | serial | *PRIMARY KEY* |
| [biomaterial](Chado_Tables#Table:_biomaterial "Chado Tables") | biomaterial_id | integer | *UNIQUE#1 NOT NULL* |
| [dbxref](Chado_Tables#Table:_dbxref "Chado Tables") | dbxref_id | integer | *UNIQUE#1 NOT NULL* |

biomaterial_dbxref Structure

------------------------------------------------------------------------

  

## <span id="Table:_biomaterial_relationship" class="mw-headline">Table: biomaterial_relationship</span>

Relate biomaterials to one another. This is a way to track a series of
treatments or material splits/merges, for instance.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | biomaterial_relationship_id | serial | *PRIMARY KEY* |
| [biomaterial](Chado_Tables#Table:_biomaterial "Chado Tables") | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
| [biomaterial](Chado_Tables#Table:_biomaterial "Chado Tables") | object_id | integer | *UNIQUE#1 NOT NULL* |

biomaterial_relationship Structure

------------------------------------------------------------------------

  

## <span id="Table:_biomaterial_treatment" class="mw-headline">Table: biomaterial_treatment</span>

Link biomaterials to treatments. Treatments have an order of operations
(rank), and associated measurements (unittype_id, value).

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | biomaterial_treatment_id | serial | *PRIMARY KEY* |
| [biomaterial](Chado_Tables#Table:_biomaterial "Chado Tables") | biomaterial_id | integer | *UNIQUE#1 NOT NULL* |
| [treatment](Chado_Tables#Table:_treatment "Chado Tables") | treatment_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | unittype_id | integer |  |
|  | value | real |  |
|  | rank | integer | *NOT NULL* |

biomaterial_treatment Structure

------------------------------------------------------------------------

  

## <span id="Table:_biomaterialprop" class="mw-headline">Table: biomaterialprop</span>

Extra biomaterial properties that are not accounted for in biomaterial.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | biomaterialprop_id | serial | *PRIMARY KEY* |
| [biomaterial](Chado_Tables#Table:_biomaterial "Chado Tables") | biomaterial_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

biomaterialprop Structure

------------------------------------------------------------------------

  

## <span id="Table:_channel" class="mw-headline">Table: channel</span>

Different array platforms can record signals from one or more channels
(cDNA arrays typically use two CCD, but Affymetrix uses only one).

| F-Key | Name       | Type   | Description       |
|-------|------------|--------|-------------------|
|       | channel_id | serial | *PRIMARY KEY*     |
|       | name       | text   | *UNIQUE NOT NULL* |
|       | definition | text   | *NOT NULL*        |

channel Structure

Tables referencing this one via Foreign Key Constraints:

- [acquisition](Chado_Tables#Table:_acquisition "Chado Tables")

<!-- -->

- [assay_biomaterial](Chado_Tables#Table:_assay_biomaterial "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_control" class="mw-headline">Table: control</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | control_id | serial | *PRIMARY KEY* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *NOT NULL* |
| [assay](Chado_Tables#Table:_assay "Chado Tables") | assay_id | integer | *NOT NULL* |
| [tableinfo](Chado_Tables#Table:_tableinfo "Chado Tables") | tableinfo_id | integer | *NOT NULL* |
|  | row_id | integer | *NOT NULL* |
|  | name | text |  |
|  | value | text |  |
|  | rank | integer | *NOT NULL* |

control Structure

------------------------------------------------------------------------

  

## <span id="Table:_element" class="mw-headline">Table: element</span>

Represents a feature of the array. This is typically a region of the
array coated or bound to DNA.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | element_id | serial | *PRIMARY KEY* |
| [feature](Chado_Tables#Table:_feature "Chado Tables") | feature_id | integer | *UNIQUE#1* |
| [arraydesign](Chado_Tables#Table:_arraydesign "Chado Tables") | arraydesign_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer |  |
| [dbxref](Chado_Tables#Table:_dbxref "Chado Tables") | dbxref_id | integer |  |

element Structure

Tables referencing this one via Foreign Key Constraints:

- [element_relationship](Chado_Tables#Table:_element_relationship "Chado Tables")

<!-- -->

- [elementresult](Chado_Tables#Table:_elementresult "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_element_relationship" class="mw-headline">Table: element_relationship</span>

Sometimes we want to combine measurements from multiple elements to get
a composite value. Affymetrix combines many probes to form a probeset
measurement, for instance.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | element_relationship_id | serial | *PRIMARY KEY* |
| [element](Chado_Tables#Table:_element "Chado Tables") | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
| [element](Chado_Tables#Table:_element "Chado Tables") | object_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

element_relationship Structure

------------------------------------------------------------------------

  

## <span id="Table:_elementresult" class="mw-headline">Table: elementresult</span>

An element on an array produces a measurement when hybridized to a
biomaterial (traceable through quantification_id). This is the base data
from which tables that actually contain data inherit.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | elementresult_id | serial | *PRIMARY KEY* |
| [element](Chado_Tables#Table:_element "Chado Tables") | element_id | integer | *UNIQUE#1 NOT NULL* |
| [quantification](Chado_Tables#Table:_quantification "Chado Tables") | quantification_id | integer | *UNIQUE#1 NOT NULL* |
|  | signal | double precision | *NOT NULL* |

elementresult Structure

Tables referencing this one via Foreign Key Constraints:

- [elementresult_relationship](Chado_Tables#Table:_elementresult_relationship "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_elementresult_relationship" class="mw-headline">Table: elementresult_relationship</span>

Sometimes we want to combine measurements from multiple elements to get
a composite value. Affymetrix combines many probes to form a probeset
measurement, for instance.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | elementresult_relationship_id | serial | *PRIMARY KEY* |
| [elementresult](Chado_Tables#Table:_elementresult "Chado Tables") | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
| [elementresult](Chado_Tables#Table:_elementresult "Chado Tables") | object_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

elementresult_relationship Structure

------------------------------------------------------------------------

  

## <span id="Table:_magedocumentation" class="mw-headline">Table: magedocumentation</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | magedocumentation_id | serial | *PRIMARY KEY* |
| [mageml](Chado_Tables#Table:_mageml "Chado Tables") | mageml_id | integer | *NOT NULL* |
| [tableinfo](Chado_Tables#Table:_tableinfo "Chado Tables") | tableinfo_id | integer | *NOT NULL* |
|  | row_id | integer | *NOT NULL* |
|  | mageidentifier | text | *NOT NULL* |

magedocumentation Structure

------------------------------------------------------------------------

  

## <span id="Table:_mageml" class="mw-headline">Table: mageml</span>

This table is for storing extra bits of MAGEml in a denormalized form.
More normalization would require many more tables.

| F-Key | Name         | Type   | Description   |
|-------|--------------|--------|---------------|
|       | mageml_id    | serial | *PRIMARY KEY* |
|       | mage_package | text   | *NOT NULL*    |
|       | mage_ml      | text   | *NOT NULL*    |

mageml Structure

Tables referencing this one via Foreign Key Constraints:

- [magedocumentation](Chado_Tables#Table:_magedocumentation "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_protocol" class="mw-headline">Table: protocol</span>

Procedural notes on how data was prepared and processed.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | protocol_id | serial | *PRIMARY KEY* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer |  |
| [dbxref](Chado_Tables#Table:_dbxref "Chado Tables") | dbxref_id | integer |  |
|  | name | text | *UNIQUE NOT NULL* |
|  | uri | text |  |
|  | protocoldescription | text |  |
|  | hardwaredescription | text |  |
|  | softwaredescription | text |  |

protocol Structure

Tables referencing this one via Foreign Key Constraints:

- [acquisition](Chado_Tables#Table:_acquisition "Chado Tables")

<!-- -->

- [arraydesign](Chado_Tables#Table:_arraydesign "Chado Tables")

<!-- -->

- [assay](Chado_Tables#Table:_assay "Chado Tables")

<!-- -->

- [protocolparam](Chado_Tables#Table:_protocolparam "Chado Tables")

<!-- -->

- [quantification](Chado_Tables#Table:_quantification "Chado Tables")

<!-- -->

- [treatment](Chado_Tables#Table:_treatment "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_protocolparam" class="mw-headline">Table: protocolparam</span>

Parameters related to a protocol. For example, if the protocol is a
soak, this might include attributes of bath temperature and duration.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | protocolparam_id | serial | *PRIMARY KEY* |
| [protocol](Chado_Tables#Table:_protocol "Chado Tables") | protocol_id | integer | *NOT NULL* |
|  | name | text | *NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | datatype_id | integer |  |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | unittype_id | integer |  |
|  | value | text |  |
|  | rank | integer | *NOT NULL* |

protocolparam Structure

------------------------------------------------------------------------

  

## <span id="Table:_quantification" class="mw-headline">Table: quantification</span>

Quantification is the transformation of an image acquisition to numeric
data. This typically involves statistical procedures.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | quantification_id | serial | *PRIMARY KEY* |
| [acquisition](Chado_Tables#Table:_acquisition "Chado Tables") | acquisition_id | integer | *NOT NULL* |
| [contact](Chado_Tables#Table:_contact "Chado Tables") | operator_id | integer |  |
| [protocol](Chado_Tables#Table:_protocol "Chado Tables") | protocol_id | integer |  |
| [analysis](Chado_Tables#Table:_analysis "Chado Tables") | analysis_id | integer | *UNIQUE#1 NOT NULL* |
|  | quantificationdate | timestamp without time zone | *DEFAULT ('now'::text)::timestamp(6) with time zone* |
|  | name | text | *UNIQUE#1* |
|  | uri | text |  |

quantification Structure

Tables referencing this one via Foreign Key Constraints:

- [elementresult](Chado_Tables#Table:_elementresult "Chado Tables")

<!-- -->

- [quantification_relationship](Chado_Tables#Table:_quantification_relationship "Chado Tables")

<!-- -->

- [quantificationprop](Chado_Tables#Table:_quantificationprop "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_quantification_relationship" class="mw-headline">Table: quantification_relationship</span>

There may be multiple rounds of quantification, this allows us to keep
an audit trail of what values went where.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | quantification_relationship_id | serial | *PRIMARY KEY* |
| [quantification](Chado_Tables#Table:_quantification "Chado Tables") | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
| [quantification](Chado_Tables#Table:_quantification "Chado Tables") | object_id | integer | *UNIQUE#1 NOT NULL* |

quantification_relationship Structure

------------------------------------------------------------------------

  

## <span id="Table:_quantificationprop" class="mw-headline">Table: quantificationprop</span>

Extra quantification properties that are not accounted for in
quantification.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | quantificationprop_id | serial | *PRIMARY KEY* |
| [quantification](Chado_Tables#Table:_quantification "Chado Tables") | quantification_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

quantificationprop Structure

------------------------------------------------------------------------

  

## <span id="Table:_study" class="mw-headline">Table: study</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | study_id | serial | *PRIMARY KEY* |
| [contact](Chado_Tables#Table:_contact "Chado Tables") | contact_id | integer | *NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer |  |
| [dbxref](Chado_Tables#Table:_dbxref "Chado Tables") | dbxref_id | integer |  |
|  | name | text | *UNIQUE NOT NULL* |
|  | description | text |  |

study Structure

Tables referencing this one via Foreign Key Constraints:

- [study_assay](Chado_Tables#Table:_study_assay "Chado Tables")

<!-- -->

- [studydesign](Chado_Tables#Table:_studydesign "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_study_assay" class="mw-headline">Table: study_assay</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | study_assay_id | serial | *PRIMARY KEY* |
| [study](Chado_Tables#Table:_study "Chado Tables") | study_id | integer | *UNIQUE#1 NOT NULL* |
| [assay](Chado_Tables#Table:_assay "Chado Tables") | assay_id | integer | *UNIQUE#1 NOT NULL* |

study_assay Structure

------------------------------------------------------------------------

  

## <span id="Table:_studydesign" class="mw-headline">Table: studydesign</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | studydesign_id | serial | *PRIMARY KEY* |
| [study](Chado_Tables#Table:_study "Chado Tables") | study_id | integer | *NOT NULL* |
|  | description | text |  |

studydesign Structure

Tables referencing this one via Foreign Key Constraints:

- [studydesignprop](Chado_Tables#Table:_studydesignprop "Chado Tables")

<!-- -->

- [studyfactor](Chado_Tables#Table:_studyfactor "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_studydesignprop" class="mw-headline">Table: studydesignprop</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | studydesignprop_id | serial | *PRIMARY KEY* |
| [studydesign](Chado_Tables#Table:_studydesign "Chado Tables") | studydesign_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

studydesignprop Structure

------------------------------------------------------------------------

  

## <span id="Table:_studyfactor" class="mw-headline">Table: studyfactor</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | studyfactor_id | serial | *PRIMARY KEY* |
| [studydesign](Chado_Tables#Table:_studydesign "Chado Tables") | studydesign_id | integer | *NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer |  |
|  | name | text | *NOT NULL* |
|  | description | text |  |

studyfactor Structure

Tables referencing this one via Foreign Key Constraints:

- [studyfactorvalue](Chado_Tables#Table:_studyfactorvalue "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_studyfactorvalue" class="mw-headline">Table: studyfactorvalue</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | studyfactorvalue_id | serial | *PRIMARY KEY* |
| [studyfactor](Chado_Tables#Table:_studyfactor "Chado Tables") | studyfactor_id | integer | *NOT NULL* |
| [assay](Chado_Tables#Table:_assay "Chado Tables") | assay_id | integer | *NOT NULL* |
|  | factorvalue | text |  |
|  | name | text |  |
|  | rank | integer | *NOT NULL* |

studyfactorvalue Structure

------------------------------------------------------------------------

  

## <span id="Table:_treatment" class="mw-headline">Table: treatment</span>

A biomaterial may undergo multiple treatments. Examples of treatments:
apoxia, fluorophore and biotin labeling.

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | treatment_id | serial | *PRIMARY KEY* |
|  | rank | integer | *NOT NULL* |
| [biomaterial](Chado_Tables#Table:_biomaterial "Chado Tables") | biomaterial_id | integer | *NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *NOT NULL* |
| [protocol](Chado_Tables#Table:_protocol "Chado Tables") | protocol_id | integer |  |
|  | name | text |  |

treatment Structure

Tables referencing this one via Foreign Key Constraints:

- [biomaterial_treatment](Chado_Tables#Table:_biomaterial_treatment "Chado Tables")

------------------------------------------------------------------------

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=Chado_Mage_Module&oldid=22160>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](Special:Categories "Special:Categories"):

- [Chado Modules](Category:Chado_Modules "Category:Chado Modules")
- [Expression](Category:Expression "Category:Expression")
- [Microarrays](Category:Microarrays "Category:Microarrays")

</div>

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">



<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces

- <span id="ca-nstab-main"><a href="Chado_Mage_Module" accesskey="c"
  title="View the content page [c]">Page</a></span>
- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:Chado_Mage_Module&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>

<div id="right-navigation">





</div>



</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>
- <span id="n-View-all-pages">[View all pages](Special:AllPages)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category:FAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category:HOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">


- <span id="t-smwbrowselink"><a href="Special:Browse/Chado_Mage_Module" rel="smw-browse">Browse
  properties</a></span>
- <span id="t-pdf">[Print as
  PDF](http://gmod.org/mediawiki/index.php?title=Special:PdfPrint&page=Chado_Mage_Module)</span>

</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 23:33 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">167,148 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->

- <span id="footer-copyrightico">[<img src="http://www.gnu.org/graphics/gfdl-logo-small.png" width="88"
  height="31" alt="a GNU Free Documentation License" />](http://www.gnu.org/licenses/fdl-1.3.html)</span>


<div style="clear:both">

</div>

</div>

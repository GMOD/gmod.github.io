---
title: "Chado Mage Module"
---
# Chado Mage Module

 Introduction](#Introduction)
 - [Other
 Documentation](#Other_Documentation)
 - [Mage and
 Expression](#Mage_and_Expression)
 - [Entering
 and Querying](#Entering_and_Querying)
 - [Loading](#Loading)
 - [Querying](#Querying)
- [Tables](#Tables)
 - [Table:
 acquisition](#Table:_acquisition)
 - [Table:
 acquisition_relationship](#Table:_acquisition_relationship)
 - [Table:
 acquisitionprop](#Table:_acquisitionprop)
 - [Table:
 arraydesign](#Table:_arraydesign)
 - [Table:
 arraydesignprop](#Table:_arraydesignprop)
 - [Table:
 assay](#Table:_assay)
 - [Table:
 assay_biomaterial](#Table:_assay_biomaterial)
 - [Table:
 assay_project](#Table:_assay_project)
 - [Table:
 assayprop](#Table:_assayprop)
 - [Table:
 biomaterial](#Table:_biomaterial)
 - [Table:
 biomaterial_dbxref](#Table:_biomaterial_dbxref)
 - [Table:
 biomaterial_relationship](#Table:_biomaterial_relationship)
 - [Table:
 biomaterial_treatment](#Table:_biomaterial_treatment)
 - [Table:
 biomaterialprop](#Table:_biomaterialprop)
 - [Table:
 channel](#Table:_channel)
 - [Table:
 control](#Table:_control)
 - [Table:
 element](#Table:_element)
 - [Table:
 element_relationship](#Table:_element_relationship)
 - [Table:
 elementresult](#Table:_elementresult)
 - [Table:
 elementresult_relationship](#Table:_elementresult_relationship)
 - [Table:
 magedocumentation](#Table:_magedocumentation)
 - [Table:
 mageml](#Table:_mageml)
 - [Table:
 protocol](#Table:_protocol)
 - [Table:
 protocolparam](#Table:_protocolparam)
 - [Table:
 quantification](#Table:_quantification)
 - [Table:
 quantification_relationship](#Table:_quantification_relationship)
 - [Table:
 quantificationprop](#Table:_quantificationprop)
 - [Table:
 study](#Table:_study)
 - [Table:
 study_assay](#Table:_study_assay)
 - [Table:
 studydesign](#Table:_studydesign)
 - [Table:
 studydesignprop](#Table:_studydesignprop)
 - [Table:
 studyfactor](#Table:_studyfactor)
 - [Table:
 studyfactorvalue](#Table:_studyfactorvalue)
 - [Table:
 treatment](#Table:_treatment)

# Introduction

The Mage module is designed to store data from microarray experiments.
It is based on the
<a href="http://www.cbil.upenn.edu/RAD2/" class="external text"

contain the necessary foreign keys and satisfy the [Chado naming
conventions](/wiki/Chado_Manual#Chado_Naming_Conventions). The
Mage module is compatible with the
<a href="http://www.mged.org/Workgroups/MAGE/mage.html"
class="external text" rel="nofollow">MAGE standard</a>.

## Other Documentation

See the [Mage FAQ](/wiki/Mage_FAQ).

## Mage and Expression

The Mage module and the [Expression
module](/wiki/Chado_Expression_Module) can be
considered overlapping but complementary. The Mage module can store data
taken directly from the experimental results whereas the Expression
module is typically used to store summary data taken from the biological
literature, or extracted from the microarray data stored in Mage. The
Mage module handles details about experiments that the Expression module
does not whereas the Expression module can be thought of a simpler set
of tables designed to tie ontologies concerned with expression to
sequence features.

## Entering and Querying

A typical case would be that the researcher had run some number of
microarray experiments. She will need to load the resultant data into
the Mage module and related tables, then query them. These tasks could
be accomplished using some application but for illustrative purposes we
will interact directly with the schema. Let's assume that the tissues
being assayed come from *Drosophila melanogaster*. The relevant tables
are shown below, the purpose is to show the relationships between the
key tables.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/41/Rad-query-1.png" width="1103" height="365"
alt="Rad-query-1.png" />

Red is for the *mage* tables, Yellow is for *companalysis* tables, Gray
is for *organism* tables, Blue is for *sequence* tables, and Green is
for the *cv* tables.

### Loading

The researcher would load the data into the database in this order:

1. Assume that *forebrain*, or any other relevant ontology terms, are
 records in the *cvterm* table from a previously loaded anatomy
 ontology.
2. Create a *biomaterial* record for the forebrain sample the
 expression was observed in. The *organism_id* would be for
 *Drosophila melanogaster* (assume all the relevant species are
 already loaded in *organism*).
3. Create a *biomaterialprop* record to link records from **1**
 (*cvterm*) and **2** ( *biomaterial*).
4. Create or use an *arraydesign* record for the assay platform. This
 could be something like *Drosophila2* (an Affymetrix platform), or
 even a string like *features* if we just want to report expression
 or lack thereof for all genes in the assayed sample.
5. Create an *assay* record to represent the event where the forebrain
 sample was measured. It links to the record created in **4**
 (*arraydesign*).
6. Link records from **2** (*biomaterial*) and **5** (*assay*) in
 *assay_biomaterial*. The relationship here is many-to-many between
 assays and biomaterials because of multichannel and multiplexed
 assay technology.
7. Create an *acquisition* record that depends on **5** (*assay*). This
 is how the assay's results were digitized, typically using a digital
 camera or scanner, but it can refer to any data acquired from the
 assay in general.
8. Create an *analysis* record. This is the algorithm that is used to
 process the data from **7** (*acquisition*).
9. Create a *quantification* record. It depends on **7**
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

### Querying

Once data has been loaded according to the general approach above the
schema can be queryed. A typical question the researcher may ask is
"which genes are expressed in the *Drosophila* forebrain". That question
is roughly equivalent to this SQL query:

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

# Tables

## Table: acquisition

This represents the scanning of hybridized material. The output of this
process is typically a digital image of an array.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | acquisition_id | serial | *PRIMARY KEY* |
| [assay](/wiki/Chado_Tables#Table:_assay) | assay_id | integer | *NOT NULL* |
| [protocol](/wiki/Chado_Tables#Table:_protocol) | protocol_id | integer | [channel](/wiki/Chado_Tables#Table:_channel) |
| channel_id | integer | acquisitiondate | timestamp without time zone |
| *DEFAULT ('now'::text)::timestamp(6) with time zone* | | name | text |
| *UNIQUE* | | uri | text acquisition Structure |

Tables referencing this one via Foreign Key Constraints:

- [acquisition_relationship](/wiki/Chado_Tables#Table:_acquisition_relationship)
- [acquisitionprop](/wiki/Chado_Tables#Table:_acquisitionprop)
- [quantification](/wiki/Chado_Tables#Table:_quantification)

------------------------------------------------------------------------

## Table: acquisition_relationship

Multiple monochrome images may be merged to form a multi-color image.
Red-green images of 2-channel hybridizations are an example of this.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | acquisition_relationship_id | serial | *PRIMARY KEY* |
| [acquisition](/wiki/Chado_Tables#Table:_acquisition) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [acquisition](/wiki/Chado_Tables#Table:_acquisition) | object_id | integer | *UNIQUE#1 NOT NULL* |
| | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* | | |

acquisition_relationship Structure

------------------------------------------------------------------------

## Table: acquisitionprop

Parameters associated with image acquisition.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | acquisitionprop_id | serial | *PRIMARY KEY* |
| [acquisition](/wiki/Chado_Tables#Table:_acquisition) | acquisition_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* | | |

acquisitionprop Structure

------------------------------------------------------------------------

## Table: arraydesign

General properties about an array. An array is a template used to
generate physical slides, etc. It contains layout information, as well
as global array properties, such as material (glass, nylon) and spot
dimensions (in rows/columns).

| F-Key | Name | Type | Description |
|----|----|----|----|
| | arraydesign_id | serial | *PRIMARY KEY* |
| [contact](/wiki/Chado_Tables#Table:_contact) | manufacturer_id | integer | *NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | platformtype_id | integer | *NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | substratetype_id | integer | [protocol](/wiki/Chado_Tables#Table:_protocol) |
| protocol_id | integer | [dbxref](/wiki/Chado_Tables#Table:_dbxref) | dbxref_id |
| integer | name | text | *UNIQUE NOT NULL* |
| | version | text | description |
| text | array_dimensions | text | element_dimensions |
| text | num_of_elements | integer | num_array_columns |
| integer | num_array_rows | integer | num_grid_columns |
| integer | num_grid_rows | integer | num_sub_columns |
| integer | num_sub_rows | integer arraydesign Structure | |

Tables referencing this one via Foreign Key Constraints:

- [arraydesignprop](/wiki/Chado_Tables#Table:_arraydesignprop)
- [assay](/wiki/Chado_Tables#Table:_assay)
- [element](/wiki/Chado_Tables#Table:_element)

------------------------------------------------------------------------

## Table: arraydesignprop

Extra array design properties that are not accounted for in arraydesign.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | arraydesignprop_id | serial | *PRIMARY KEY* |
| [arraydesign](/wiki/Chado_Tables#Table:_arraydesign) | arraydesign_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* | | |

arraydesignprop Structure

------------------------------------------------------------------------

## Table: assay

An assay consists of a physical instance of an array, combined with the
conditions used to create the array (protocols, technician information).
The assay can be thought of as a hybridization.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | assay_id | serial | *PRIMARY KEY* |
| [arraydesign](/wiki/Chado_Tables#Table:_arraydesign) | arraydesign_id | integer | *NOT NULL* |
| [protocol](/wiki/Chado_Tables#Table:_protocol) | protocol_id | integer | assaydate |
| timestamp without time zone | *DEFAULT ('now'::text)::timestamp(6) with time zone* | | arrayidentifier |
| text | arraybatchidentifier | text | [contact](/wiki/Chado_Tables#Table:_contact) |
| operator_id | integer | *NOT NULL* | [dbxref](/wiki/Chado_Tables#Table:_dbxref) |
| dbxref_id | integer | name | text |
| *UNIQUE* | | description | text assay Structure |

Tables referencing this one via Foreign Key Constraints:

- [acquisition](/wiki/Chado_Tables#Table:_acquisition)
- [assay_biomaterial](/wiki/Chado_Tables#Table:_assay_biomaterial)
- [assay_project](/wiki/Chado_Tables#Table:_assay_project)
- [assayprop](/wiki/Chado_Tables#Table:_assayprop)
- [control](/wiki/Chado_Tables#Table:_control)
- [study_assay](/wiki/Chado_Tables#Table:_study_assay)
- [studyfactorvalue](/wiki/Chado_Tables#Table:_studyfactorvalue)

------------------------------------------------------------------------

## Table: assay_biomaterial

A biomaterial can be hybridized many times (technical replicates), or
combined with other biomaterials in a single hybridization (for
two-channel arrays).

| F-Key | Name | Type | Description |
|----|----|----|----|
| | assay_biomaterial_id | serial | *PRIMARY KEY* |
| [assay](/wiki/Chado_Tables#Table:_assay) | assay_id | integer | *UNIQUE#1 NOT NULL* |
| [biomaterial](/wiki/Chado_Tables#Table:_biomaterial) | biomaterial_id | integer | *UNIQUE#1 NOT NULL* |
| [channel](/wiki/Chado_Tables#Table:_channel) | channel_id | integer | *UNIQUE#1* |
| | rank | integer | *UNIQUE#1 NOT NULL* |

assay_biomaterial Structure

------------------------------------------------------------------------

## Table: assay_project

Link assays to projects.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | assay_project_id | serial | *PRIMARY KEY* |
| [assay](/wiki/Chado_Tables#Table:_assay) | assay_id | integer | *UNIQUE#1 NOT NULL* |
| [project](/wiki/Chado_Tables#Table:_project) | project_id | integer | *UNIQUE#1 NOT NULL* |

assay_project Structure

------------------------------------------------------------------------

## Table: assayprop

Extra assay properties that are not accounted for in assay.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | assayprop_id | serial | *PRIMARY KEY* |
| [assay](/wiki/Chado_Tables#Table:_assay) | assay_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* | | |

assayprop Structure

------------------------------------------------------------------------

## Table: biomaterial

A biomaterial represents the MAGE concept of BioSource, BioSample, and
LabeledExtract. It is essentially some biological material (tissue,
cells, serum) that may have been processed. Processed biomaterials
should be traceable back to raw biomaterials via the
biomaterialrelationship table.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | biomaterial_id | serial | *PRIMARY KEY* |
| [organism](/wiki/Chado_Tables#Table:_organism) | taxon_id | integer | [contact](/wiki/Chado_Tables#Table:_contact) |
| biosourceprovider_id | integer | [dbxref](/wiki/Chado_Tables#Table:_dbxref) | dbxref_id |
| integer | name | text | *UNIQUE* |
| | description | text biomaterial Structure | |

Tables referencing this one via Foreign Key Constraints:

- [assay_biomaterial](/wiki/Chado_Tables#Table:_assay_biomaterial)
- [biomaterial_dbxref](/wiki/Chado_Tables#Table:_biomaterial_dbxref)
- [biomaterial_relationship](/wiki/Chado_Tables#Table:_biomaterial_relationship)
- [biomaterial_treatment](/wiki/Chado_Tables#Table:_biomaterial_treatment)
- [biomaterialprop](/wiki/Chado_Tables#Table:_biomaterialprop)
- [treatment](/wiki/Chado_Tables#Table:_treatment)

------------------------------------------------------------------------

## Table: biomaterial_dbxref

| F-Key | Name | Type | Description |
|----|----|----|----|
| | biomaterial_dbxref_id | serial | *PRIMARY KEY* |
| [biomaterial](/wiki/Chado_Tables#Table:_biomaterial) | biomaterial_id | integer | *UNIQUE#1 NOT NULL* |
| [dbxref](/wiki/Chado_Tables#Table:_dbxref) | dbxref_id | integer | *UNIQUE#1 NOT NULL* |

biomaterial_dbxref Structure

------------------------------------------------------------------------

## Table: biomaterial_relationship

Relate biomaterials to one another. This is a way to track a series of
treatments or material splits/merges, for instance.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | biomaterial_relationship_id | serial | *PRIMARY KEY* |
| [biomaterial](/wiki/Chado_Tables#Table:_biomaterial) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [biomaterial](/wiki/Chado_Tables#Table:_biomaterial) | object_id | integer | *UNIQUE#1 NOT NULL* |

biomaterial_relationship Structure

------------------------------------------------------------------------

## Table: biomaterial_treatment

Link biomaterials to treatments. Treatments have an order of operations
(rank), and associated measurements (unittype_id, value).

| F-Key | Name | Type | Description |
|----|----|----|----|
| | biomaterial_treatment_id | serial | *PRIMARY KEY* |
| [biomaterial](/wiki/Chado_Tables#Table:_biomaterial) | biomaterial_id | integer | *UNIQUE#1 NOT NULL* |
| [treatment](/wiki/Chado_Tables#Table:_treatment) | treatment_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | unittype_id | integer | value |
| real | rank | integer | *NOT NULL* |

biomaterial_treatment Structure

------------------------------------------------------------------------

## Table: biomaterialprop

Extra biomaterial properties that are not accounted for in biomaterial.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | biomaterialprop_id | serial | *PRIMARY KEY* |
| [biomaterial](/wiki/Chado_Tables#Table:_biomaterial) | biomaterial_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* | | |

biomaterialprop Structure

------------------------------------------------------------------------

## Table: channel

Different array platforms can record signals from one or more channels
(cDNA arrays typically use two CCD, but Affymetrix uses only one).

| F-Key | Name | Type | Description |
|-------|------------|--------|-------------------|
| | channel_id | serial | *PRIMARY KEY* |
| | name | text | *UNIQUE NOT NULL* |
| | definition | text | *NOT NULL* |

channel Structure

Tables referencing this one via Foreign Key Constraints:

- [acquisition](/wiki/Chado_Tables#Table:_acquisition)
- [assay_biomaterial](/wiki/Chado_Tables#Table:_assay_biomaterial)

------------------------------------------------------------------------

## Table: control

| F-Key | Name | Type | Description |
|----|----|----|----|
| | control_id | serial | *PRIMARY KEY* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *NOT NULL* |
| [assay](/wiki/Chado_Tables#Table:_assay) | assay_id | integer | *NOT NULL* |
| [tableinfo](/wiki/Chado_Tables#Table:_tableinfo) | tableinfo_id | integer | *NOT NULL* |
| | row_id | integer | *NOT NULL* |
| | name | text | value |
| text | rank | integer | *NOT NULL* |

control Structure

------------------------------------------------------------------------

## Table: element

Represents a feature of the array. This is typically a region of the
array coated or bound to DNA.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | element_id | serial | *PRIMARY KEY* |
| [feature](/wiki/Chado_Tables#Table:_feature) | feature_id | integer | *UNIQUE#1* |
| [arraydesign](/wiki/Chado_Tables#Table:_arraydesign) | arraydesign_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | [dbxref](/wiki/Chado_Tables#Table:_dbxref) |
| dbxref_id | integer element Structure | | |

Tables referencing this one via Foreign Key Constraints:

- [element_relationship](/wiki/Chado_Tables#Table:_element_relationship)
- [elementresult](/wiki/Chado_Tables#Table:_elementresult)

------------------------------------------------------------------------

## Table: element_relationship

Sometimes we want to combine measurements from multiple elements to get
a composite value. Affymetrix combines many probes to form a probeset
measurement, for instance.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | element_relationship_id | serial | *PRIMARY KEY* |
| [element](/wiki/Chado_Tables#Table:_element) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [element](/wiki/Chado_Tables#Table:_element) | object_id | integer | *UNIQUE#1 NOT NULL* |
| | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* | | |

element_relationship Structure

------------------------------------------------------------------------

## Table: elementresult

An element on an array produces a measurement when hybridized to a
biomaterial (traceable through quantification_id). This is the base data
from which tables that actually contain data inherit.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | elementresult_id | serial | *PRIMARY KEY* |
| [element](/wiki/Chado_Tables#Table:_element) | element_id | integer | *UNIQUE#1 NOT NULL* |
| [quantification](/wiki/Chado_Tables#Table:_quantification) | quantification_id | integer | *UNIQUE#1 NOT NULL* |
| | signal | double precision | *NOT NULL* |

elementresult Structure

Tables referencing this one via Foreign Key Constraints:

- [elementresult_relationship](/wiki/Chado_Tables#Table:_elementresult_relationship)

------------------------------------------------------------------------

## Table: elementresult_relationship

Sometimes we want to combine measurements from multiple elements to get
a composite value. Affymetrix combines many probes to form a probeset
measurement, for instance.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | elementresult_relationship_id | serial | *PRIMARY KEY* |
| [elementresult](/wiki/Chado_Tables#Table:_elementresult) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [elementresult](/wiki/Chado_Tables#Table:_elementresult) | object_id | integer | *UNIQUE#1 NOT NULL* |
| | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* | | |

elementresult_relationship Structure

------------------------------------------------------------------------

## Table: magedocumentation

| F-Key | Name | Type | Description |
|----|----|----|----|
| | magedocumentation_id | serial | *PRIMARY KEY* |
| [mageml](/wiki/Chado_Tables#Table:_mageml) | mageml_id | integer | *NOT NULL* |
| [tableinfo](/wiki/Chado_Tables#Table:_tableinfo) | tableinfo_id | integer | *NOT NULL* |
| | row_id | integer | *NOT NULL* |
| | mageidentifier | text | *NOT NULL* |

magedocumentation Structure

------------------------------------------------------------------------

## Table: mageml

This table is for storing extra bits of MAGEml in a denormalized form.
More normalization would require many more tables.

| F-Key | Name | Type | Description |
|-------|--------------|--------|---------------|
| | mageml_id | serial | *PRIMARY KEY* |
| | mage_package | text | *NOT NULL* |
| | mage_ml | text | *NOT NULL* |

mageml Structure

Tables referencing this one via Foreign Key Constraints:

- [magedocumentation](/wiki/Chado_Tables#Table:_magedocumentation)

------------------------------------------------------------------------

## Table: protocol

Procedural notes on how data was prepared and processed.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | protocol_id | serial | *PRIMARY KEY* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *NOT NULL* |
| [pub](/wiki/Chado_Tables#Table:_pub) | pub_id | integer | [dbxref](/wiki/Chado_Tables#Table:_dbxref) |
| dbxref_id | integer | name | text |
| *UNIQUE NOT NULL* | | uri | text |
| protocoldescription | text | hardwaredescription | text |
| softwaredescription | text protocol Structure | | |

Tables referencing this one via Foreign Key Constraints:

- [acquisition](/wiki/Chado_Tables#Table:_acquisition)
- [arraydesign](/wiki/Chado_Tables#Table:_arraydesign)
- [assay](/wiki/Chado_Tables#Table:_assay)
- [protocolparam](/wiki/Chado_Tables#Table:_protocolparam)
- [quantification](/wiki/Chado_Tables#Table:_quantification)
- [treatment](/wiki/Chado_Tables#Table:_treatment)

------------------------------------------------------------------------

## Table: protocolparam

Parameters related to a protocol. For example, if the protocol is a
soak, this might include attributes of bath temperature and duration.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | protocolparam_id | serial | *PRIMARY KEY* |
| [protocol](/wiki/Chado_Tables#Table:_protocol) | protocol_id | integer | *NOT NULL* |
| | name | text | *NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | datatype_id | integer | [cvterm](/wiki/Chado_Tables#Table:_cvterm) |
| unittype_id | integer | value | text |
| rank | integer | *NOT NULL* | |

protocolparam Structure

------------------------------------------------------------------------

## Table: quantification

Quantification is the transformation of an image acquisition to numeric
data. This typically involves statistical procedures.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | quantification_id | serial | *PRIMARY KEY* |
| [acquisition](/wiki/Chado_Tables#Table:_acquisition) | acquisition_id | integer | *NOT NULL* |
| [contact](/wiki/Chado_Tables#Table:_contact) | operator_id | integer | [protocol](/wiki/Chado_Tables#Table:_protocol) |
| protocol_id | integer | [analysis](/wiki/Chado_Tables#Table:_analysis) | analysis_id |
| integer | *UNIQUE#1 NOT NULL* | | quantificationdate |
| timestamp without time zone | *DEFAULT ('now'::text)::timestamp(6) with time zone* | | name |
| text | *UNIQUE#1* | | uri |
| text quantification Structure | | | |

Tables referencing this one via Foreign Key Constraints:

- [elementresult](/wiki/Chado_Tables#Table:_elementresult)
- [quantification_relationship](/wiki/Chado_Tables#Table:_quantification_relationship)
- [quantificationprop](/wiki/Chado_Tables#Table:_quantificationprop)

------------------------------------------------------------------------

## Table: quantification_relationship

There may be multiple rounds of quantification, this allows us to keep
an audit trail of what values went where.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | quantification_relationship_id | serial | *PRIMARY KEY* |
| [quantification](/wiki/Chado_Tables#Table:_quantification) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [quantification](/wiki/Chado_Tables#Table:_quantification) | object_id | integer | *UNIQUE#1 NOT NULL* |

quantification_relationship Structure

------------------------------------------------------------------------

## Table: quantificationprop

Extra quantification properties that are not accounted for in
quantification.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | quantificationprop_id | serial | *PRIMARY KEY* |
| [quantification](/wiki/Chado_Tables#Table:_quantification) | quantification_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* | | |

quantificationprop Structure

------------------------------------------------------------------------

## Table: study

| F-Key | Name | Type | Description |
|----|----|----|----|
| | study_id | serial | *PRIMARY KEY* |
| [contact](/wiki/Chado_Tables#Table:_contact) | contact_id | integer | *NOT NULL* |
| [pub](/wiki/Chado_Tables#Table:_pub) | pub_id | integer | [dbxref](/wiki/Chado_Tables#Table:_dbxref) |
| dbxref_id | integer | name | text |
| *UNIQUE NOT NULL* | | description | text study Structure |

Tables referencing this one via Foreign Key Constraints:

- [study_assay](/wiki/Chado_Tables#Table:_study_assay)
- [studydesign](/wiki/Chado_Tables#Table:_studydesign)

------------------------------------------------------------------------

## Table: study_assay

| F-Key | Name | Type | Description |
|----|----|----|----|
| | study_assay_id | serial | *PRIMARY KEY* |
| [study](/wiki/Chado_Tables#Table:_study) | study_id | integer | *UNIQUE#1 NOT NULL* |
| [assay](/wiki/Chado_Tables#Table:_assay) | assay_id | integer | *UNIQUE#1 NOT NULL* |

study_assay Structure

------------------------------------------------------------------------

## Table: studydesign

| F-Key | Name | Type | Description |
|----|----|----|----|
| | studydesign_id | serial | *PRIMARY KEY* |
| [study](/wiki/Chado_Tables#Table:_study) | study_id | integer | *NOT NULL* |
| | description | text studydesign Structure | |

Tables referencing this one via Foreign Key Constraints:

- [studydesignprop](/wiki/Chado_Tables#Table:_studydesignprop)
- [studyfactor](/wiki/Chado_Tables#Table:_studyfactor)

------------------------------------------------------------------------

## Table: studydesignprop

| F-Key | Name | Type | Description |
|----|----|----|----|
| | studydesignprop_id | serial | *PRIMARY KEY* |
| [studydesign](/wiki/Chado_Tables#Table:_studydesign) | studydesign_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* | | |

studydesignprop Structure

------------------------------------------------------------------------

## Table: studyfactor

| F-Key | Name | Type | Description |
|----|----|----|----|
| | studyfactor_id | serial | *PRIMARY KEY* |
| [studydesign](/wiki/Chado_Tables#Table:_studydesign) | studydesign_id | integer | *NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | name |
| text | *NOT NULL* | | description |
| text studyfactor Structure | | | |

Tables referencing this one via Foreign Key Constraints:

- [studyfactorvalue](/wiki/Chado_Tables#Table:_studyfactorvalue)

------------------------------------------------------------------------

## Table: studyfactorvalue

| F-Key | Name | Type | Description |
|----|----|----|----|
| | studyfactorvalue_id | serial | *PRIMARY KEY* |
| [studyfactor](/wiki/Chado_Tables#Table:_studyfactor) | studyfactor_id | integer | *NOT NULL* |
| [assay](/wiki/Chado_Tables#Table:_assay) | assay_id | integer | *NOT NULL* |
| | factorvalue | text | name |
| text | rank | integer | *NOT NULL* |

studyfactorvalue Structure

------------------------------------------------------------------------

## Table: treatment

A biomaterial may undergo multiple treatments. Examples of treatments:
apoxia, fluorophore and biotin labeling.

| F-Key | Name | Type | Description |
|----|----|----|----|
| | treatment_id | serial | *PRIMARY KEY* |
| | rank | integer | *NOT NULL* |
| [biomaterial](/wiki/Chado_Tables#Table:_biomaterial) | biomaterial_id | integer | *NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *NOT NULL* |
| [protocol](/wiki/Chado_Tables#Table:_protocol) | protocol_id | integer | name |
| text treatment Structure | | | |

Tables referencing this one via Foreign Key Constraints:

- [biomaterial_treatment](/wiki/Chado_Tables#Table:_biomaterial_treatment)

------------------------------------------------------------------------

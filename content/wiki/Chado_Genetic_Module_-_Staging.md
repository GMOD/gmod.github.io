---
title: "Chado Genetic Module - Staging"
---
# Chado Genetic Module - Staging


<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/6b/WorkInProgressTools.gif" width="48"
height="48" alt="Under Construction" />


<span style="font-size: 140%">This page or section is under
construction.</span>  
  
This page is a working area for updating the revised genetic module that
came out of the [GMOD Evo
Hackathon](GMOD_Evo_Hackathon "GMOD Evo Hackathon"). Please edit the
table and column descriptions below. These updates will be added to the
PostgreSQL comments before the next Chado release.


  Introduction](#Introduction)
- [Tables](#Tables)
  - [Table:
    environment](#Table:_environment)
  - [Table:
    environment_cvterm](#Table:_environment_cvterm)
  - [Table:
    feature_genotype](#Table:_feature_genotype)
  - [Table:
    genotype](#Table:_genotype)
  - [Table:
    phendesc](#Table:_phendesc)
  - [Table:
    phenotype_comparison](#Table:_phenotype_comparison)
  - [Table:
    phenstatement](#Table:_phenstatement)


# Introduction

See Dave Emmert's presentation [The new and improved chado genetics
module](https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5c/Emmert_040526.pdf "File:Emmert 040526.pdf") for
explanations of parts of this module.

# Tables

## Table: environment

The environmental component of a phenotype description.

| FK  | Name           | Type   | Description       |
|-----|----------------|--------|-------------------|
|     | environment_id | serial | *PRIMARY KEY*     |
|     | uniquename     | text   | *UNIQUE NOT NULL* |
|     | description    | text   |                   |

public.environment Structure

Tables referencing this one via Foreign Key Constraints:

- [environment_cvterm](Chado_Tables#Table:_environment_cvterm "Chado Tables")
- [phendesc](Chado_Tables#Table:_phendesc "Chado Tables")
- [phenotype_comparison](Chado_Tables#Table:_phenotype_comparison "Chado Tables")
- [phenstatement](Chado_Tables#Table:_phenstatement "Chado Tables")

------------------------------------------------------------------------

  

## Table: environment_cvterm

| FK | Name | Type | Description |
|----|----|----|----|
|  | environment_cvterm_id | serial | *PRIMARY KEY* |
| [environment](Chado_Tables#Table:_environment "Chado Tables") | environment_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | cvterm_id | integer | *UNIQUE#1 NOT NULL* |

public.environment_cvterm Structure

------------------------------------------------------------------------

  

## Table: feature_genotype

<table data-border="1" data-cellpadding="3">
<caption>public.feature_genotype Structure</caption>
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
<td>feature_genotype_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_genotype"
title="Chado Tables">genotype</a></p></td>
<td>genotype_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>chromosome_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
<br />
A feature of SO type "chromosome".</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
rank can be used for n-ploid organisms or to preserve order.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>cgroup</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Spatially distinguishable group. group can be used for distinguishing
the chromosomal groups, for example (RNAi products and so on can be
treated as different groups, as they do not fall on a particular
chromosome).</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>cvterm_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
</tbody>
</table>

public.feature_genotype Structure

------------------------------------------------------------------------

  

## Table: genotype

Genetic context. A genotype is defined by a collection of features,
mutations, balancers, deficiencies, haplotype blocks, or engineered
constructs.

<table data-border="1" data-cellpadding="3">
<caption>public.genotype Structure</caption>
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
<td>genotype_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>text</td>
<td><em></em><br />
<br />
Optional alternative name for a genotype, for display purposes.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE NOT NULL</em><br />
<br />
The unique name for a genotype; typically derived from the features
making up the genotype.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>description</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
</tbody>
</table>

public.genotype Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_genotype](Chado_Tables#Table:_feature_genotype "Chado Tables")
- [nd_experiment_genotype](Chado_Tables#Table:_nd_experiment_genotype "Chado Tables")
- [phendesc](Chado_Tables#Table:_phendesc "Chado Tables")
- [phenotype_comparison](Chado_Tables#Table:_phenotype_comparison "Chado Tables")
- [phenstatement](Chado_Tables#Table:_phenstatement "Chado Tables")
- [stock_genotype](Chado_Tables#Table:_stock_genotype "Chado Tables")

  

Discussion  

OPEN QUESTION: for multicopy transgenes, should we include a 'n_copies'
column as well? -- [Brain Osborne](User%253ABosborne "User%253ABosborne"), Feb
2007

------------------------------------------------------------------------

## Table: phendesc

A summary of a \_set\_ of phenotypic statements for any one gcontext
made in any one publication.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phendesc_id | serial | *PRIMARY KEY* |
| [genotype](Chado_Tables#Table:_genotype "Chado Tables") | genotype_id | integer | *UNIQUE#1 NOT NULL* |
| [environment](Chado_Tables#Table:_environment "Chado Tables") | environment_id | integer | *UNIQUE#1 NOT NULL* |
|  | description | text | *NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |

public.phendesc Structure

------------------------------------------------------------------------

  

## Table: phenotype_comparison

Comparison of phenotypes e.g., genotype1/environment1/phenotype1
"non-suppressible" with respect to genotype2/environment2/phenotype2.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phenotype_comparison_id | serial | *PRIMARY KEY* |
| [genotype](Chado_Tables#Table:_genotype "Chado Tables") | genotype1_id | integer | *UNIQUE#1 NOT NULL* |
| [environment](Chado_Tables#Table:_environment "Chado Tables") | environment1_id | integer | *UNIQUE#1 NOT NULL* |
| [genotype](Chado_Tables#Table:_genotype "Chado Tables") | genotype2_id | integer | *UNIQUE#1 NOT NULL* |
| [environment](Chado_Tables#Table:_environment "Chado Tables") | environment2_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](Chado_Tables#Table:_phenotype "Chado Tables") | phenotype1_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](Chado_Tables#Table:_phenotype "Chado Tables") | phenotype2_id | integer |  |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |
| [organism](Chado_Tables#Table:_organism "Chado Tables") | organism_id | integer | *NOT NULL* |

public.phenotype_comparison Structure

Tables referencing this one via Foreign Key Constraints:

- [phenotype_comparison_cvterm](Chado_Tables#Table:_phenotype_comparison_cvterm "Chado Tables")

------------------------------------------------------------------------

  

## Table: phenstatement

Phenotypes are things like "larval lethal". Phenstatements are things
like "dpp-1 is recessive larval lethal". So essentially phenstatement is
a linking table expressing the relationship between genotype,
environment, and phenotype.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phenstatement_id | serial | *PRIMARY KEY* |
| [genotype](Chado_Tables#Table:_genotype "Chado Tables") | genotype_id | integer | *UNIQUE#1 NOT NULL* |
| [environment](Chado_Tables#Table:_environment "Chado Tables") | environment_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](Chado_Tables#Table:_phenotype "Chado Tables") | phenotype_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |

public.phenstatement Structure

------------------------------------------------------------------------


[Category](Special%253ACategories "Special%253ACategories"):

- [Under
  Construction](Category%253AUnder_Construction "Category%253AUnder Construction")

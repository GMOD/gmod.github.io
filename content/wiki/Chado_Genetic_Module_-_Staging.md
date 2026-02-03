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
Hackathon](/wiki/GMOD_Evo_Hackathon). Please edit the
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
module](https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5c/Emmert_040526.pdf) for
explanations of parts of this module.

# Tables

## Table: environment

The environmental component of a phenotype description.

| FK  | Name           | Type   | Description |
|-----|----------------|--------|-------------------|
|  | environment_id | serial | *PRIMARY KEY* |
|  | uniquename | text | *UNIQUE NOT NULL* |
|  | description | text   public.environment Structure |  |

Tables referencing this one via Foreign Key Constraints:

- [environment_cvterm](/wiki/Chado_Tables#Table:_environment_cvterm)
- [phendesc](/wiki/Chado_Tables#Table:_phendesc)
- [phenotype_comparison](/wiki/Chado_Tables#Table:_phenotype_comparison)
- [phenstatement](/wiki/Chado_Tables#Table:_phenstatement)

------------------------------------------------------------------------

## Table: environment_cvterm

| FK | Name | Type | Description |
|----|----|----|----|
|  | environment_cvterm_id | serial | *PRIMARY KEY* |
| [environment](/wiki/Chado_Tables#Table:_environment) | environment_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | cvterm_id | integer | *UNIQUE#1 NOT NULL* |

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
<td><p><a href="/wiki/Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="/wiki/Chado_Tables#Table:_genotype"
title="Chado Tables">genotype</a></p></td>
<td>genotype_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="/wiki/Chado_Tables#Table:_feature"
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
<td><p><a href="/wiki/Chado_Tables#Table:_cvterm"
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

- [feature_genotype](/wiki/Chado_Tables#Table:_feature_genotype)
- [nd_experiment_genotype](/wiki/Chado_Tables#Table:_nd_experiment_genotype)
- [phendesc](/wiki/Chado_Tables#Table:_phendesc)
- [phenotype_comparison](/wiki/Chado_Tables#Table:_phenotype_comparison)
- [phenstatement](/wiki/Chado_Tables#Table:_phenstatement)
- [stock_genotype](/wiki/Chado_Tables#Table:_stock_genotype)

Discussion

OPEN QUESTION: for multicopy transgenes, should we include a 'n_copies'
column as well? -- [Brain Osborne](/wiki/User:Bosborne), Feb
2007

------------------------------------------------------------------------

## Table: phendesc

A summary of a \_set\_ of phenotypic statements for any one gcontext
made in any one publication.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phendesc_id | serial | *PRIMARY KEY* |
| [genotype](/wiki/Chado_Tables#Table:_genotype) | genotype_id | integer | *UNIQUE#1 NOT NULL* |
| [environment](/wiki/Chado_Tables#Table:_environment) | environment_id | integer | *UNIQUE#1 NOT NULL* |
|  | description | text | *NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](/wiki/Chado_Tables#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

public.phendesc Structure

------------------------------------------------------------------------

## Table: phenotype_comparison

Comparison of phenotypes e.g., genotype1/environment1/phenotype1
"non-suppressible" with respect to genotype2/environment2/phenotype2.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phenotype_comparison_id | serial | *PRIMARY KEY* |
| [genotype](/wiki/Chado_Tables#Table:_genotype) | genotype1_id | integer | *UNIQUE#1 NOT NULL* |
| [environment](/wiki/Chado_Tables#Table:_environment) | environment1_id | integer | *UNIQUE#1 NOT NULL* |
| [genotype](/wiki/Chado_Tables#Table:_genotype) | genotype2_id | integer | *UNIQUE#1 NOT NULL* |
| [environment](/wiki/Chado_Tables#Table:_environment) | environment2_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](/wiki/Chado_Tables#Table:_phenotype) | phenotype1_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](/wiki/Chado_Tables#Table:_phenotype) | phenotype2_id | integer | [pub](/wiki/Chado_Tables#Table:_pub) |
| pub_id | integer | *UNIQUE#1 NOT NULL* | [organism](/wiki/Chado_Tables#Table:_organism) |
| organism_id | integer | *NOT NULL* |  |

public.phenotype_comparison Structure

Tables referencing this one via Foreign Key Constraints:

- [phenotype_comparison_cvterm](/wiki/Chado_Tables#Table:_phenotype_comparison_cvterm)

------------------------------------------------------------------------

## Table: phenstatement

Phenotypes are things like "larval lethal". Phenstatements are things
like "dpp-1 is recessive larval lethal". So essentially phenstatement is
a linking table expressing the relationship between genotype,
environment, and phenotype.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phenstatement_id | serial | *PRIMARY KEY* |
| [genotype](/wiki/Chado_Tables#Table:_genotype) | genotype_id | integer | *UNIQUE#1 NOT NULL* |
| [environment](/wiki/Chado_Tables#Table:_environment) | environment_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](/wiki/Chado_Tables#Table:_phenotype) | phenotype_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](/wiki/Chado_Tables#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](/wiki/Chado_Tables#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

public.phenstatement Structure

------------------------------------------------------------------------

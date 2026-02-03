---
title: "Chado Phenotype Module at FlyBase"
---
# Chado Phenotype Module at FlyBase

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/6b/WorkInProgressTools.gif" width="48"
height="48" alt="Under Construction" />

<span style="font-size: 140%">This page or section is under
construction.</span>

Should be done before Jan 1, 2011

The [Chado Phenotype
module](Chado_Phenotype_Module "Chado Phenotype Module") was developed
at [FlyBase](Category%253AFlyBase "Category%253AFlyBase").

To try and understand the existing phenotype module during the [GMOD Evo
Hackathon](GMOD_Evo_Hackathon "GMOD Evo Hackathon"), participants spent
some time exploring the phenotype tables at FlyBase. The notes from that
exploration are on this page.

Phenotypes are not cleanly implemented in a single module. The tables
are spread across the
[Phenotype](Chado_Phenotype_Module "Chado Phenotype Module") and
[Genetic](Chado_Genetic_Module "Chado Genetic Module") modules. This
page discusses the tables from both modules. It also covers some related
tables.

**These notes reflect the state of the FlyBase Chado database during the
first two weeks on November 2010.**

  Tables](#Tables)
  - [Important
    Linked Tables](#Important_Linked_Tables)
  - [**phenotype**](#phenotype)
    - [What
      is a Phenotype?](#What_is_a_Phenotype.3F)
      - [PATO at
        FlyBase?](#PATO_at_FlyBase.3F)
    - [**phenotype** @
      Flybase](#phenotype_.40_Flybase)
      - [uniquename and
        observable_id](#uniquename_and_observable_id)
      - [attr_id and
        assay_id](#attr_id_and_assay_id)
      - [cvalue_id](#cvalue_id)
      - [value](#value)
  - [**phenotype_comparison**](#phenotype_comparison)
    - [**phenotype_comparison** @
      Flybase](#phenotype_comparison_.40_Flybase)
      - [environment\[12\]\_id](#environment.5B12.5D_id)
      - [phenotype\[12\]\_id and
        genotype\[12\]\_id](#phenotype.5B12.5D_id_and_genotype.5B12.5D_id)
      - [type_id](#type_id)
  - [**phenotype_cvterm**](#phenotype_cvterm)
    - [**phenotype_cvterm** @
      Flybase](#phenotype_cvterm_.40_Flybase)
      - [rank](#rank)
      - [cvterm_id](#cvterm_id)
      - [Semantics?](#Semantics.3F)
  - [**phenstatement**](#phenstatement)
    - [**phenstatement** @
      Flybase](#phenstatement_.40_Flybase)
  - [**phendesc**](#phendesc)
    - [**phendesc** @
      Flybase](#phendesc_.40_Flybase)
      - [type_id](#type_id_2)
      - [pub_id](#pub_id)
      - [environment_id](#environment_id)
      - [genotype_id](#genotype_id)
      - [Description](#Description)
  - [**environment**](#environment)
    - [**environment** @
      Flybase](#environment_.40_Flybase)
  - [**environment_cvterm**](#environment_cvterm)
    - [**environment_cvterm** @
      Flybase](#environment_cvterm_.40_Flybase)
  - [**genotype**](#genotype)
    - [**genotype** @
      Flybase](#genotype_.40_Flybase)
      - [uniquename](#uniquename)
      - [name](#name)
  - [**feature_genotype**](#feature_genotype)
    - [**feature_genotype** @
      Flybase](#feature_genotype_.40_Flybase)
      - [cvterm_id](#cvterm_id_2)
      - [cgroup](#cgroup)
      - [chromosome_id](#chromosome_id)
      - [rank](#rank_2)

# Tables

| Table | rows at FlyBase |
|----|----|
| [**`feature_phenotype`**](Chado_Phenotype_Module#Table:_feature_phenotype "Chado Phenotype Module") | 0 |
| [**`phenotype`**](Chado_Phenotype_Module#Table:_phenotype "Chado Phenotype Module") | 10,925 |
| [**`phenotype_comparison`**](Chado_Genetic_Module#Table:_phenotype_comparison "Chado Genetic Module") | 100,235 |
| [**`phenotype_cvterm`**](Chado_Phenotype_Module#Table:_phenotype_cvterm "Chado Phenotype Module") | 7,714 |
| [**`phenstatement`**](Chado_Genetic_Module#Table:_phenstatement "Chado Genetic Module") | 20,673 |
| [**`phendesc`**](Chado_Genetic_Module#Table:_phendesc "Chado Genetic Module") | 112,390 |

And those are the only tables that have "phen" in their name.

## Important Linked Tables

- [**`environment`**](Chado_Genetic_Module#Table:_environment "Chado Genetic Module")
  (Doc: "The environmental component of a phenotype description.")
- [**`genotype`**](Chado_Genetic_Module#Table:_genotype "Chado Genetic Module")

And that's it?

## [**`phenotype`**](Chado_Phenotype_Module#Table:_phenotype "Chado Phenotype Module")

\<protect\>

|----|----|
| **Table:** | **`phenotype`** |
| **Module:** | **[Phenotype](Chado_Phenotype_Module "Chado Phenotype Module")** |

A phenotypic statement, or a single atomic phenotypic observation, is a
controlled sentence describing observable effects of non-wild type
function. E.g. Obs=eye, attribute=color, cvalue=red.

<table class="wikitable chadotable">
<caption><strong><code>phenotype</code></strong> columns</caption>
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
<td>phenotype_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_CV_Module#Table:_cvterm"
title="Chado CV Module"><strong><code>cvterm</code></strong></a></td>
<td>observable_id</td>
<td>integer</td>
<td>The entity: e.g. anatomy_part, biological_process.</td>
</tr>
<tr class="even">
<td><a href="Chado_CV_Module#Table:_cvterm"
title="Chado CV Module"><strong><code>cvterm</code></strong></a></td>
<td>attr_id</td>
<td>integer</td>
<td>Phenotypic attribute (quality, property, attribute, character) -
drawn from PATO.</td>
</tr>
<tr class="odd">
<td></td>
<td>value</td>
<td>text</td>
<td>Value of attribute - unconstrained free text. Used only if cvalue_id
is not appropriate.</td>
</tr>
<tr class="even">
<td><a href="Chado_CV_Module#Table:_cvterm"
title="Chado CV Module"><strong><code>cvterm</code></strong></a></td>
<td>cvalue_id</td>
<td>integer</td>
<td>Phenotype attribute value (state).</td>
</tr>
<tr class="odd">
<td><a href="Chado_CV_Module#Table:_cvterm"
title="Chado CV Module"><strong><code>cvterm</code></strong></a></td>
<td>assay_id</td>
<td>integer</td>
<td>Evidence type.</td>
</tr>
</tbody>
</table>

**`phenotype`** columns

Tables referencing **`phenotype`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- [**`feature_phenotype`**](Chado_Phenotype_Module#Table:_feature_phenotype "Chado Phenotype Module")
- [**`nd_experiment_phenotype`**](Chado_Natural_Diversity_Module.1#Table:_nd_experiment_phenotype "Chado Natural Diversity Module")
- [**`phenotype_comparison`**](Chado_Genetic_Module#Table:_phenotype_comparison "Chado Genetic Module")
- [**`phenotype_cvterm`**](Chado_Phenotype_Module#Table:_phenotype_cvterm "Chado Phenotype Module")
- [**`phenstatement`**](Chado_Genetic_Module#Table:_phenstatement "Chado Genetic Module")

\</protect\>

### What is a Phenotype?

From conversation with Jim Balhoff and Matt Yoder:

**A phenotype is what you observe.**

This means that *stage* or *time since conception* is **not** part of
the phenotype. It is part of the experiment. (Unless you are observing
development rate, in which case, stage would be the phenotype.)

#### PATO at FlyBase?

That table description in the schema sounds like the old PATO, not the
new EQ model.

Does this table implement PATO at FlyBase?

No

- observable_id is the Entity. Usually points to anatomy or
  cellular_component CVs.
- But attr_id is not used and cvalue_id points to compound terms in the
  FlyBase Miscellaneous CV.

### [**`phenotype`**](Chado_Phenotype_Module#Table:_phenotype "Chado Phenotype Module") @ Flybase

| Counts |
|-----------------------|--------|
| Table Rows | 10925 |
| observable_id is null | 1 |
| attr_id is null | 1 |
| cvalue_id is null | 1 |
| assay_id is null | 1 |
| value is null | 10925 |

All the CVterm FKs that are null have the uniquename of "unspecified"

#### uniquename and observable_id

Most uniquenames are observable_id -\> cvterm.name + blank or integer,
but not when name is "unspecified", uniquename can be anything. Some
examples:

- viable
- long lived \| dominant
- fertile
- mitotic cell cycle defective \| recessive \| somatic clone
- lethal \| larval stage

There are 1473 of these (every one of them unspecified).



``` de1
SELECT COUNT(*), c.name
  FROM phenotype p, cvterm t, cv c
 WHERE t.cvterm_id = p.observable_id
   AND t.cv_id = c.cv_id
 GROUP BY 2
 ORDER BY 1 DESC
 LIMIT 50;
```

    count |           name
    ------+--------------------------
     8914 | FlyBase anatomy CV
     1473 | FlyBase miscellaneous CV
      436 | cellular_component
       91 | biological_process
        9 | property type
        1 | SO
    (6 rows)



#### attr_id and assay_id

attr_id is supposed to be "Phenotypic attribute (quality, property,
attribute, character) - drawn from PATO." but is not.

assay_id is supposed to be "Evidence type" but it is not.


At FlyBase, in all rows (except the null one) both of these point to
cvterm "unspecified"

So, this is not used for PATO at Flybase. I'm not sure why it isn't
null.

#### cvalue_id

Schema doc says "Phenotype attribute value (state)."

There are only 118 distinct values. Some of them:

- DNA repair defective
- Minute
- aging defective
- auditory perception defective
- auxotroph
- bang sensitive
- behavior defective

All from: FlyBase miscellaneous CV

#### value

value is null in every row in FlyBase.

## [**`phenotype_comparison`**](Chado_Genetic_Module#Table:_phenotype_comparison "Chado Genetic Module")

\<protect\>

|-------------|------------------------------------------------------------|
| **Table:** | **`phenotype_comparison`** |
| **Module:** | **[Genetic](Chado_Genetic_Module "Chado Genetic Module")** |

Comparison of phenotypes e.g., genotype1/environment1/phenotype1
"non-suppressible" with respect to genotype2/environment2/phenotype2.

<table class="wikitable chadotable">
<caption><strong><code>phenotype_comparison</code></strong>
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
<td>phenotype_comparison_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Genetic_Module#Table:_genotype"
title="Chado Genetic Module"><strong><code>genotype</code></strong></a></td>
<td>genotype1_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_Genetic_Module#Table:_environment"
title="Chado Genetic Module"><strong><code>environment</code></strong></a></td>
<td>environment1_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td><a href="Chado_Genetic_Module#Table:_genotype"
title="Chado Genetic Module"><strong><code>genotype</code></strong></a></td>
<td>genotype2_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_Genetic_Module#Table:_environment"
title="Chado Genetic Module"><strong><code>environment</code></strong></a></td>
<td>environment2_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td><a href="Chado_Phenotype_Module#Table:_phenotype"
title="Chado Phenotype Module"><strong><code>phenotype</code></strong></a></td>
<td>phenotype1_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_Phenotype_Module#Table:_phenotype"
title="Chado Phenotype Module"><strong><code>phenotype</code></strong></a></td>
<td>phenotype2_id</td>
<td>integer</td>
<td></td>
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
<td><a href="Chado_Organism_Module#Table:_organism"
title="Chado Organism Module"><strong><code>organism</code></strong></a></td>
<td>organism_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
&#10;<p><br />
</p></td>
</tr>
</tbody>
</table>

**`phenotype_comparison`** columns

Tables referencing **`phenotype_comparison`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- [**`phenotype_comparison_cvterm`**](Chado_Genetic_Module#Table:_phenotype_comparison_cvterm "Chado Genetic Module")

\</protect\>

This table is good for binary comparisons. How broadly useful is that?

### [**`phenotype_comparison`**](Chado_Genetic_Module#Table:_phenotype_comparison "Chado Genetic Module") @ Flybase

| Counts |
|-----------------------------------|---------|
| Table Rows | 100,235 |
| phenotype2_id is null | 0 |
| phenotype1_id = phenotype2_id | 42,510 |
| genotype1_id = genotype2_id | 0 |
| environment1_id = environment2_id | 99,293 |

Every column but phenotype2_id is not nullable, and that column has no
nulls in it either.

#### environment\[12\]\_id

The above counts imply a lot comparisons using different genotypes in
the same environment. **No it does not.** In every one of those 99K
comparisons, environment is "unspecified".

So, FlyBase has known environments for 1% of its comparisons.

#### phenotype\[12\]\_id and genotype\[12\]\_id

The 42K comparisons where the phenotypes are the same mean that the
genotype did not change this phenotype.

#### type_id

type_id is a phantom column. It does not exist in current Chado or at
FlyBase.

How do we say how they compare without this column?

What makes two G/E/P pairs comparable?

## [**`phenotype_cvterm`**](Chado_Phenotype_Module#Table:_phenotype_cvterm "Chado Phenotype Module")

\<protect\>

|----|----|
| **Table:** | **`phenotype_cvterm`** |
| **Module:** | **[Phenotype](Chado_Phenotype_Module "Chado Phenotype Module")** |



<table class="wikitable chadotable">
<caption><strong><code>phenotype_cvterm</code></strong>
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
<td>phenotype_cvterm_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Phenotype_Module#Table:_phenotype"
title="Chado Phenotype Module"><strong><code>phenotype</code></strong></a></td>
<td>phenotype_id</td>
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

**`phenotype_cvterm`** columns

Tables referencing **`phenotype_cvterm`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

Can imagine it just attaches a bag of terms to the phenotype. There is
no semantics on how the terms relate to each other or to the phenotype.

### [**`phenotype_cvterm`**](Chado_Phenotype_Module#Table:_phenotype_cvterm "Chado Phenotype Module") @ Flybase

| Counts |
|------------|--------|
| Table Rows | 7714 |

#### rank

Flybase's table def has a rank column, which is \> 0 for about 2000
rows. The rank column is part of standard Chado, but not listed on the
web site.

There is a unique constraint on (phenotype_id, cvterm_id, rank). Why?

#### cvterm_id

Links to terms in 5 different CVs

- FlyBase miscellaneous CV (75%)
- FlyBase anatomy CV
- SO
- FlyBase development CV (25%)
- biological_process

#### Semantics?

Find rows that use rank in the unique constraint.

``` de1
SELECT * FROM phenotype_cvterm pcv1
 WHERE EXISTS (
    SELECT * FROM phenotype_cvterm pcv2
     WHERE pcv1.phenotype_cvterm_id <> pcv2.phenotype_cvterm_id
       AND pcv1.phenotype_id = pcv2.phenotype_id
       AND pcv1.cvterm_id = pcv2.cvterm_id) LIMIT 10;
```

    phenotype_cvterm_id | phenotype_id | cvterm_id | rank
    --------------------+--------------+-----------+------
                   8763 |        15842 |     60843 |    0
                   8764 |        15842 |     60843 |    1
                  12006 |        19433 |     60843 |    1
                  12007 |        19433 |     60843 |    2
    (4 rows)

So, what does that mean?

Rank is used for some sort of code that is not stored in the database?

## [**`phenstatement`**](Chado_Genetic_Module#Table:_phenstatement "Chado Genetic Module")

\<protect\>

|-------------|------------------------------------------------------------|
| **Table:** | **`phenstatement`** |
| **Module:** | **[Genetic](Chado_Genetic_Module "Chado Genetic Module")** |

Phenotypes are things like "larval lethal". Phenstatements are things
like "dpp-1 is recessive larval lethal". So essentially phenstatement is
a linking table expressing the relationship between genotype,
environment, and phenotype.

<table class="wikitable chadotable">
<caption><strong><code>phenstatement</code></strong> columns</caption>
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
<td>phenstatement_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Genetic_Module#Table:_genotype"
title="Chado Genetic Module"><strong><code>genotype</code></strong></a></td>
<td>genotype_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_Genetic_Module#Table:_environment"
title="Chado Genetic Module"><strong><code>environment</code></strong></a></td>
<td>environment_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td><a href="Chado_Phenotype_Module#Table:_phenotype"
title="Chado Phenotype Module"><strong><code>phenotype</code></strong></a></td>
<td>phenotype_id</td>
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

**`phenstatement`** columns

Tables referencing **`phenstatement`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

### [**`phenstatement`**](Chado_Genetic_Module#Table:_phenstatement "Chado Genetic Module") @ Flybase

| Counts |
|------------|--------|
| Table Rows | 203673 |

All columns are not null; all except PK are FKs. Therefore
phenstatements require

- genotype
- environment
- phenotype
- cvterm (type_id ?)
- pub

Well, sort of.

- type_id is "unspecified" for every row.
- 7% of pubs link to one with a blank title
- 97% of environments point to "unspecified"

There are 72K linked genotypes. They use a custom markup language in the
uniquename.

## [**`phendesc`**](Chado_Genetic_Module#Table:_phendesc "Chado Genetic Module")

\<protect\>

|-------------|------------------------------------------------------------|
| **Table:** | **`phendesc`** |
| **Module:** | **[Genetic](Chado_Genetic_Module "Chado Genetic Module")** |

A summary of a \_set\_ of phenotypic statements for any one gcontext
made in any one publication.

<table class="wikitable chadotable">
<caption><strong><code>phendesc</code></strong> columns</caption>
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
<td>phendesc_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Genetic_Module#Table:_genotype"
title="Chado Genetic Module"><strong><code>genotype</code></strong></a></td>
<td>genotype_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_Genetic_Module#Table:_environment"
title="Chado Genetic Module"><strong><code>environment</code></strong></a></td>
<td>environment_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td></td>
<td>description</td>
<td>text</td>
<td><em>NOT NULL</em><br />
</td>
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

**`phendesc`** columns

Tables referencing **`phendesc`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

You can't link directly from a
[**`phenotype`**](Chado_Phenotype_Module#Table:_phenotype "Chado Phenotype Module")
to **`phendesc`**. You can link directly from a
[**`phenstatement`**](Chado_Genetic_Module#Table:_phenstatement "Chado Genetic Module")
to a {\[ChadoTableName\|phendesc}} using (genotype_id, environment_id,
and pub_id). Note that this does not take full advantage of the unique
index on those 3 columns plus type_id.

This table establishes two things:

- A general comment about a set of phenstatement's.
- A general type for the overall phenotype. See below for options at
  FlyBase.

This table means there can only be one phendesc for each
environment/genotype/pub publication. I think that makes sense.

It does mean we wont link to phenstatements with the wrong
genotype/environment, but it also means we can orphan phendesc rows that
don't join with any phenstatements.

### [**`phendesc`**](Chado_Genetic_Module#Table:_phendesc "Chado Genetic Module") @ Flybase

| Counts |
|---------------------|---------|
| Table Rows | 112,390 |
| description is null | 0 |

No columns are nullable. There is description, 4 FKs (genotype_id,
environment_id, type_id, pub_id), and the PK.

Description is not unique with "Homozygous lethal." and "homozygous
lethal" making up ~1% of records.

#### type_id

``` de1
SELECT COUNT(*), t.name, c.name
  FROM phendesc p, cvterm t, cv c
 WHERE p.type_id = t.cvterm_id
   AND t.cv_id = c.cv_id
 GROUP BY 2,3
 ORDER BY 1 DESC
 LIMIT 50;
```

    count |           name            |     name
    ------+---------------------------+---------------
    71688 | single_mutant_pheno       | phendesc type
    18648 | genetic_interaction_pheno | phendesc type
    12809 | aberr_pheno               | phendesc type
     7662 | interallele_comp          | phendesc type
     1583 | xeno_interaction_pheno    | phendesc type
    (5 rows)

#### pub_id

11,930 rows (about 10% of rows) link to the pub with no title.

#### environment_id

101,746 rows (over 90%) link to "unspecified"

#### genotype_id

There is wide distribution of genotypes. The top genotype has 122
phendesc records.

#### Description

Free form description of phenotype. Almost all entries are informative,
and none are null.

## [**`environment`**](Chado_Genetic_Module#Table:_environment "Chado Genetic Module")

Definition:

\<protect\>

|-------------|------------------------------------------------------------|
| **Table:** | **`environment`** |
| **Module:** | **[Genetic](Chado_Genetic_Module "Chado Genetic Module")** |

The environmental component of a phenotype description.

<table class="wikitable chadotable">
<caption><strong><code>environment</code></strong> columns</caption>
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
<td>environment_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td></td>
<td>description</td>
<td>text</td>
<td></td>
</tr>
</tbody>
</table>

**`environment`** columns

Tables referencing **`environment`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- [**`environment_cvterm`**](Chado_Genetic_Module#Table:_environment_cvterm "Chado Genetic Module")
- [**`phendesc`**](Chado_Genetic_Module#Table:_phendesc "Chado Genetic Module")
- [**`phenotype_comparison`**](Chado_Genetic_Module#Table:_phenotype_comparison "Chado Genetic Module")
- [**`phenstatement`**](Chado_Genetic_Module#Table:_phenstatement "Chado Genetic Module")

\</protect\>

### [**`environment`**](Chado_Genetic_Module#Table:_environment "Chado Genetic Module") @ Flybase

| Counts |
|------------|--------|
| Table Rows | 15 |

description is null in all rows.

Uniquename choice are:

    unspecified
    conditional qualifier
    temperature conditional
    drug conditional
    conditional tetracycline
    conditional RU486
    Drosophila cell culture
    In transgenic Drosophila (intraspecific)
    In transgenic Drosophila (allele of one drosophilid species in genome of another drosophilid)
    In transgenic Drosophila (allele of foreign species in genome of drosophilid)
    Whole-organism transient assay (intraspecific)
    Whole-organism transient assay (allele from one drosophilid species assayed in another drosophilid)
    Whole-organism transient assay (allele of foreign species assayed in drosophilid)
    conditional - heat sensitive
    conditional - cold sensitive

## [**`environment_cvterm`**](Chado_Genetic_Module#Table:_environment_cvterm "Chado Genetic Module")

Definition:

\<protect\>

|-------------|------------------------------------------------------------|
| **Table:** | **`environment_cvterm`** |
| **Module:** | **[Genetic](Chado_Genetic_Module "Chado Genetic Module")** |



<table class="wikitable chadotable">
<caption><strong><code>environment_cvterm</code></strong>
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
<td>environment_cvterm_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Genetic_Module#Table:_environment"
title="Chado Genetic Module"><strong><code>environment</code></strong></a></td>
<td>environment_id</td>
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
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`environment_cvterm`** columns

Tables referencing **`environment_cvterm`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

No semantics here. My guess is associates a list of CV terms with an
environment.

### [**`environment_cvterm`**](Chado_Genetic_Module#Table:_environment_cvterm "Chado Genetic Module") @ Flybase

| Counts |
|------------|--------|
| Table Rows | ? |

## [**`genotype`**](Chado_Genetic_Module#Table:_genotype "Chado Genetic Module")

Definition:

\<protect\>

|-------------|------------------------------------------------------------|
| **Table:** | **`genotype`** |
| **Module:** | **[Genetic](Chado_Genetic_Module "Chado Genetic Module")** |

Genetic context. A genotype is defined by a collection of features,
mutations, balancers, deficiencies, haplotype blocks, or engineered
constructs.

<table class="wikitable chadotable">
<caption><strong><code>genotype</code></strong> columns</caption>
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
<td>genotype_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td></td>
<td>name</td>
<td>text</td>
<td>Optional alternative name for a genotype,
<p>for display purposes.</p></td>
</tr>
<tr class="odd">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE</em><br />
&#10;<p><em>NOT NULL</em><br />
The unique name for a genotype; typically derived from the features
making up the genotype.</p></td>
</tr>
<tr class="even">
<td></td>
<td>description</td>
<td>character varying(255)</td>
<td></td>
</tr>
</tbody>
</table>

**`genotype`** columns

Tables referencing **`genotype`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- [**`feature_genotype`**](Chado_Genetic_Module#Table:_feature_genotype "Chado Genetic Module")
- [**`nd_experiment_genotype`**](Chado_Natural_Diversity_Module.1#Table:_nd_experiment_genotype "Chado Natural Diversity Module")
- [**`phendesc`**](Chado_Genetic_Module#Table:_phendesc "Chado Genetic Module")
- [**`phenotype_comparison`**](Chado_Genetic_Module#Table:_phenotype_comparison "Chado Genetic Module")
- [**`phenstatement`**](Chado_Genetic_Module#Table:_phenstatement "Chado Genetic Module")
- [**`stock_genotype`**](Chado_Stock_Module#Table:_stock_genotype "Chado Stock Module")

\</protect\>

### [**`genotype`**](Chado_Genetic_Module#Table:_genotype "Chado Genetic Module") @ Flybase

| Counts |
|-------------------------------|---------|
| Table Rows | 263,153 |
| description is null | 263,153 |
| name is null | 165,210 |
| description and name are null | 165,210 |

There is no **`genotype_cvterm`** table.

#### uniquename

Uniquename is the only informative column is 2/3 of the rows. It uses a
custom FlyBase encoding of information.

#### name

In the cases where this is not null it uses a custom FlyBase
nomenclature that often includes one or more FlyBase IDs.

## [**`feature_genotype`**](Chado_Genetic_Module#Table:_feature_genotype "Chado Genetic Module")

Definition:

\<protect\>

|-------------|------------------------------------------------------------|
| **Table:** | **`feature_genotype`** |
| **Module:** | **[Genetic](Chado_Genetic_Module "Chado Genetic Module")** |



<table class="wikitable chadotable">
<caption><strong><code>feature_genotype</code></strong>
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
<td>feature_genotype_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em><br />
</td>
</tr>
<tr class="even">
<td><a href="Chado_Sequence_Module#Table:_feature"
title="Chado Sequence Module"><strong><code>feature</code></strong></a></td>
<td>feature_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_Genetic_Module#Table:_genotype"
title="Chado Genetic Module"><strong><code>genotype</code></strong></a></td>
<td>genotype_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p></td>
</tr>
<tr class="even">
<td><a href="Chado_Sequence_Module#Table:_feature"
title="Chado Sequence Module"><strong><code>feature</code></strong></a></td>
<td>chromosome_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p>A feature of SO type "chromosome".</p></td>
</tr>
<tr class="odd">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
rank can be used for n-ploid organisms or to preserve order.</p></td>
</tr>
<tr class="even">
<td></td>
<td>cgroup</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
Spatially distinguishable group. group can be used for distinguishing
the chromosomal groups, for example (RNAi products and so on can be
treated as different groups, as they do not fall on a particular
chromosome).</p></td>
</tr>
<tr class="odd">
<td><a href="Chado_CV_Module#Table:_cvterm"
title="Chado CV Module"><strong><code>cvterm</code></strong></a></td>
<td>cvterm_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
&#10;<p><em>NOT NULL</em><br />
</p>
<p><br />
</p></td>
</tr>
</tbody>
</table>

**`feature_genotype`** columns

Tables referencing **`feature_genotype`** via [foreign
key](Glossary#Foreign_Key "Glossary") constraints:

- None.\</protect\>

This is the table that connects data to features, finally. The rank and
group have some semantics.

### [**`feature_genotype`**](Chado_Genetic_Module#Table:_feature_genotype "Chado Genetic Module") @ Flybase

| Counts |
|-----------------------|---------|
| Table Rows | 551,551 |
| chromosome_id is null | 0 |

#### cvterm_id

All cvterm_ids are unspecified. Every one of them. No doc on this.

#### cgroup

Spatially distinguishable group. group can be used for distinguishing
the chromosomal groups, for example (RNAi products and so on can be
treated as different groups, as they do not fall on a particular
chromosome).

455K are 0; After that it diminishes up to 6, which only has 5 records.

What does this mean? It's not an FK to anywhere, just an integer that
must be unique in combination with feature_id, genotype_id, chromosome,
rank, cgroup, and cvterm_id (every non-PK column).

#### chromosome_id

Every record points to the same feature_id, which has the name
"unspecified". Is this supposed to be a denormalization optimization
that they don't use at FlyBase?

#### rank

rank can be used for n-ploid organisms or to preserve order.

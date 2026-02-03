---
title: "Chado Tutorial 2013"
---
# Chado Tutorial 2013

(Redirected from [Chado
Tutorial](/wiki/Chado_Tutorial)

This <a href="Chado" class="mw-redirect" title="Chado">Chado</a>
tutorial was presented by [Scott Cain](User%253AScott "User%253AScott") as part
of the [2013 GMOD Summer
School](2013_GMOD_Summer_School "2013 GMOD Summer School").

Chado is the database schema of the GMOD project. This session
introduces database concepts, and then provides an overview of Chado's
design and architecture, and then goes into detail about how to use a
Chado database.

  Theory](#Theory)
  - [Introduction](#Introduction)
    - [Database
      Terminology](#Database_Terminology)
      - [What's a
        database?](#What.27s_a_database.3F)
      - [SQL](#SQL)
  - [Why
    Chado?](#Why_Chado.3F)
  - [Chado
    Architecture: Modules](#Chado_Architecture:_Modules)
    - [Extensible](#Extensible)
    - [Plus](#Plus)
    - [Module
      Caveats](#Module_Caveats)
  - [Exploring
    the schema](#Exploring_the_schema)
    - [Sequence Module](#Sequence_Module)
      - [Features](#Features)
    - [CV
      (Controlled Vocabularies)
      Module](#CV_.28Controlled_Vocabularies.29_Module)
      - [Controlled
        Vocabularies](#Controlled_Vocabularies)
      - [Ontologies](#Ontologies)
      - [CVs and Ontologies in
        Chado](#CVs_and_Ontologies_in_Chado)
        - [Data Integrity](#Data_Integrity)
        - [Data Portability and
          Standardization](#Data_Portability_and_Standardization)
        - [Complexity](#Complexity)
    - [Opening our sample
      database](#Opening_our_sample_database)
    - [Our
      first example query](#Our_first_example_query)
    - [General Module](#General_Module)
      - [IDs](#IDs)
        - [Public IDs](#Public_IDs)
        - [Private IDs](#Private_IDs)
      - [IDs in Chado](#IDs_in_Chado)
    - [Properties](#Properties)
      - [Relationships](#Relationships)
      - [Locations](#Locations)
        - [Interbase
          Coordinates](#Interbase_Coordinates)
        - [Location
          Chains](#Location_Chains)
        - [featureloc
          Table](#featureloc_Table)
      - [Example: Gene](#Example:_Gene)
      - [Example: Computational
        Analysis](#Example:_Computational_Analysis)
      - [Other Feature
        Annotations](#Other_Feature_Annotations)
      - [Extending Chado: Properties tables and new
        modules](#Extending_Chado:_Properties_tables_and_new_modules)
- [Practice](#Practice)
  - [Prerequisites](#Prerequisites)
    - [PostgreSQL](#PostgreSQL)
      - [Edit config
        files](#Edit_config_files)
      - [Create a gmod
        user](#Create_a_gmod_user)
    - [BioPerl](#BioPerl)
    - [Let's
      Go!](#Let.27s_Go.21)
    - [Environment
      Variables](#Environment_Variables)
  - [Installing
    Chado](#Installing_Chado)
    - [Saving
      your progress to this
      point](#Saving_your_progress_to_this_point)
    - [A Note
      about Redos](#A_Note_about_Redos)
  - [Preparing
    GFF data for loading](#Preparing_GFF_data_for_loading)
    - [Working with Large GFF
      files](#Working_with_Large_GFF_files)
    - [Loading GFF3](#Loading_GFF3)
    - [Capturing the output to check for
      problems](#Capturing_the_output_to_check_for_problems)
    - [Really
      loading data](#Really_loading_data)
      - [Try again](#Try_again)
  - [Loading
    other data](#Loading_other_data)
- [Chado for
  Expression, Genotype, Phenotype, and Natural
  Diversity](#Chado_for_Expression.2C_Genotype.2C_Phenotype.2C_and_Natural_Diversity)
  - [Expression](#Expression)
    - [What
      defines an expression
      pattern?](#What_defines_an_expression_pattern.3F)
    - [How
      does Chado deal with this
      variety?](#How_does_Chado_deal_with_this_variety.3F)
    - [FlyBase Example](#FlyBase_Example)
    - [Chado
      Allows](#Chado_Allows)
    - [Table:
      expression](#Table:_expression)
    - [Table:
      expression_cvterm](#Table:_expression_cvterm)
  - [Genotype](#Genotype)
    - [Table:
      genotype](#Table:_genotype)
    - [Table:
      feature_genotype](#Table:_feature_genotype)
  - [Environment](#Environment)
    - [Table:
      environment](#Table:_environment)
    - [Table:
      environment_cvterm](#Table:_environment_cvterm)
  - [Phenotype,
    Natural Diversity and Atlas
    Support](#Phenotype.2C_Natural_Diversity_and_Atlas_Support)

## Theory

### Introduction

#### Database Terminology

Or six years of school in 15 minutes or less.

- [A Brief Guide to
  Databases](A_Brief_Guide_to_Databases "A Brief Guide to Databases")
- [Chado Tables](Chado_Tables "Chado Tables")

##### What's a [database](Databases_and_GMOD "Databases and GMOD")?

- Chado is a [schema](Glossary#Schema "Glossary"), a database design - a
  blueprint for a database containing genomic data
- Distinct from
  - [Database Management System
    (DBMS)](Glossary#Database_Management_System "Glossary")
    - Software system for storing databases
    - _e.g.,_ Oracle, [PostgreSQL](PostgreSQL "PostgreSQL"),
      [MySQL](MySQL "MySQL")
  - Database, a very loose term
    - Any set of organized data that is readable by a computer
    - A web site with database driven content, e.g., FlyBase
    - Schema + DBMS + Data

##### SQL

SQL is a standardized query language for defining and manipulating
databases. Chado uses it. SQL is supported by all major DBMSs.

[FlyBase Field Mapping
Tables](FlyBase_Field_Mapping_Tables "FlyBase Field Mapping Tables")
shows some example SQL that queries the FlyBase Chado database. (Caveat:
FlyBase sometimes uses Chado in ways that no other organizations do.)

**Will SQL be on the test?**

No, we aren't going to teach in-depth SQL in this course but we will use
it in examples and show how to write queries in Chado.

You _can_ do basics with Chado without knowing SQL. Many common tasks
already have scripts written for them. However, as you get more into
using Chado, you will find that a working knowledge of SQL is necessary.

### Why Chado?

- **Integration**
  - Supports many types of data, integrates with many tools
- **Modular**
  - Use only what you need, ignore the rest
- **Extensible**
  - Write your own modules and properties
- **Widely used**
  - [FlyBase](Category%253AFlyBase "Category%253AFlyBase") - Chado started here,
    large diverse dataset and organization
  - <a href="http://xenbase.org" class="external text"
    rel="nofollow">Xenbase</a> - Smaller, but with several IT staff
  - [ParameciumDB](ParameciumDB "ParameciumDB") - Smaller still,
    complete GMOD shop, including Chado
  - <a href="http://www.igs.umaryland.edu" class="external text"
    rel="nofollow">IGS</a> - Large-scale annotation/comparative data in
    Chado, more than a dozen active developers
  - Plus AphidBase, BeeBase, BeetleBase, BovineBase, ...
- **Great Community of Support**
  - [Mailing List](GMOD_Mailing_Lists "GMOD Mailing Lists")

### Chado Architecture: Modules

The Chado schema is built with a set of _modules_. A Chado module is a
set of database tables and relationships that stores information about a
well-defined area of biology, such as sequence or attribution.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/cf/ChadoModules.png" width="519" height="408"
alt="ChadoModules.png" />

(Also available as a
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/36/ChadoModules.ppt" class="internal"
title="ChadoModules.ppt">PowerPoint animation</a>)

Arrows are dependencies between modules. Dependencies indicate one or
more _foreign keys_ linking modules.

- [General](Chado_General_Module "Chado General Module") - Identifying
  things within the DB to the outside world, and identifying things from
  other databases.
- [Controlled Vocabulary (cv)](Chado_CV_Module "Chado CV Module") -
  Controlled vocabularies and ontologies
- [Publication
  (pub)](Chado_Publication_Module "Chado Publication Module") -
  Publications and attribution
- [Organism](Chado_Organism_Module "Chado Organism Module") - Describes
  species; pretty simple. Phylogeny module stores relationships.
- [Sequence](Chado_Sequence_Module "Chado Sequence Module") - Genomic
  features and things that can be tied to or descend from genomic
  features.
- [Map](Chado_Map_Module "Chado Map Module") - Maps without sequence
- [Genetic](Chado_Genetic_Module "Chado Genetic Module") - Genetic data
  and genotypes
- [Companalysis](Chado_Companalysis_Module "Chado Companalysis Module") -
  Storage of Computational sequence analysis. The key concept is that
  the results of a computational analysis can be interpreted or
  described as a sequence feature.

#### Extensible

These modules have been contributed to Chado by users who developed
them.

- [Mage](Chado_Mage_Module "Chado Mage Module") - Microarray data
- [Stock](Chado_Stock_Module "Chado Stock Module") - Specimens and
  biological collections
- [Natural
  Diversity](Chado_Natural_Diversity_Module_Working_Group "Chado Natural Diversity Module Working Group") -
  geolocation, phenotype, genotype
- Plus property tables in many modules.

#### Plus

- [Audit](Chado_Audit_Module "Chado Audit Module") - Database audit
  trail
- [Expression](Chado_Expression_Module "Chado Expression Module") -
  Summaries of RNA and protein expression
- [Library](Chado_Library_Module "Chado Library Module") - Descriptions
  of molecular libraries
- [Phenotype](Chado_Phenotype_Module "Chado Phenotype Module") -
  Phenotypic data
- [Phylogeny](Chado_Phylogeny_Module "Chado Phylogeny Module") -
  Organisms and phylogenetic trees

#### Module Caveats

All modules are _blessed_, but some modules are _more blessed_ than
others.

The General, CV, Publication, Organism, Sequence and Companalysis
modules are all widely used and cleanly designed. After that modules
become less frequently used (Stock, Expression, Phenotype, Mage). Also
several modules are not as cleanly separated as we would like them to
be. Phenotypic data is spread over several modules. Organism and
Phylogeny overlap. [CMap](CMap.1 "CMap") is all about maps, but it does
not use the Map module.

From Jeff Bowes, at XenBase:

As for Chado, we are more Chadoish than exactly Chado. We use the core
modules with few changes - feature, cv, general, analysis. Although I
prefer to add columns to tables when it is reasonable and limit the use
of property tables (too many left outer joins). We use a slightly
modified version of the phylogeny module. We have developed completely
different modules for community, literature, anatomy and gene
expression. If there is a PATO compatible Chado Phenotype solution we'd
prefer to go with that. Although, it might cause problems that we have a
separate anatomy module as opposed to using cvterm to store anatomy.

In other words the ideal is good, but implementation and usage is
uneven. See the <a href="../extras/2008GMODCommunitySurvey.html#Chado"
class="external text" rel="nofollow">2008 GMOD Community survey</a> for
what gets used.

### Exploring the schema

Rather than simply listing out the modules and what is stored in them,
we'll take a data-centric view and imagine what we want to store in our
database, then learn the Chado way of storing it.

During this course you'll be working with genome annotation data from
[MAKER](MAKER.1 "MAKER"). We'll simplify this and start by considering
that we have annotation on chromosomes that we want to store in our
database. These are the sort of things we want to store:

- chromosomes
- genes
- gene predictions
- tRNAs
- BLAST matches

You may have worked with databases in the past where each type of thing
you want to store is given its own table. That is, we'd have a table for
genes, one for chromosomes, tRNAs, etc. The problem with this sort of
design is that, as you encounter new types of things, you have to create
new tables to store them. Also, many of these 'thing' tables are going
to look very much alike.

Chado is what is a _generic_ schema which, in effect, means that data
are abstracted wherever possible to prevent duplication in both the
design and data itself. So, instead of one table for each type of
'thing', we just have one table to hold 'things', regardless of their
types. In the Chado world these are known as 'features'. (This database
design pattern is called the
<a href="https://en.wikipedia.org/wiki/Entity-attribute-value_model"
class="external text" rel="nofollow">Entity-Attribute-Value model</a>.)

This brings us to the Sequence Module, which contains the central
feature table.

#### Sequence Module

[Sequence Module](Chado_Sequence_Module "Chado Sequence Module")

The sequence module is used to manage genomic features.

##### Features

Chado defines a _feature_ to be a region of a biological polymer
(typically a DNA, RNA, or a polypeptide molecule) or an aggregate of
regions on this polymer. A region can be an entire chromosome, or a
junction between two bases. Features are typed according to the
<a href="http://www.sequenceontology.org/" class="external text"
rel="nofollow">Sequence Ontology (SO)</a>, they can be localized
relative to other features, and they can form part-whole and other
relationships with other features.

Features are stored in the [feature
table](Chado_Sequence_Module#Table:_feature "Chado Sequence Module").

| Table: feature |      |            |         |             |     |
| -------------- | ---- | ---------- | ------- | ----------- | --- |
| feature_id     | name | uniquename | type_id | is_analysis | ... |

Within this feature table we can store all types of features and keep
track of their type with the type_id field. It's conceivable to store
the named value of each type in this field, like 'gene', 'tRNA', etc.
but this would be prone to things like spelling errors, not to mention
disagreement of the definition of some of these terms.

So solve this, all features are linked to a specific type in a
controlled vocabulary or ontology. These are stored in the cv module.

#### CV (Controlled Vocabularies) Module

<a href="http://gmod.org/Chado_CV_Module" class="external text"
rel="nofollow">Controlled Vocabulary Module Tables</a>

The CV module implements _controlled vocabularies_ and their more
complex cousins, _ontologies_.

##### Controlled Vocabularies

A _controlled vocabulary_ (CV) is a list of terms from which a value
must come. CVs are widely used in all databases, not just biological
ones. Pull down menus are often used to present CVs to users in query or
annotation interfaces.

|     |     |
| --- | --- |

| <a href="http://zfin.org" class="external text"
rel="nofollow">ZFIN's</a> Assay Type CV | <img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/6d/ZfinAssayTypePullDown.png" width="231"
height="260" alt="ZFIN&#39;s Assay Type CV" /> |

##### Ontologies

Controlled vocabularies are simple lists of terms. _Ontologies_ are
terms plus rules and relationships between the terms. The Gene Ontology
(GO) and Sequence Ontology (SO) are the two best known ontologies, but
there are many more available from
<a href="http://www.obofoundry.org/" class="external text"
rel="nofollow">OBO</a>.

Ontologies can be incredibly complex with many relationships between
terms. Representing them and reasoning with them is non-trivial, but the
CV module helps with both.

| <a href="http://flybase.org" class="external text"
rel="nofollow">FlyBase</a> CV Term Viewer showing GO term "tissue regeneration" |
|----|
| <img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d3/FlyBaseCVTermViewer.png" width="1067"
height="604" alt="FlyBaseCVTermViewer.png" /> |

##### CVs and Ontologies in Chado

[Chado CV Module](Chado_CV_Module "Chado CV Module")

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b5/ChadoModulesCV.png" width="588"
height="431" alt="ChadoModulesCV.png" />

(See the <a
href="Chado_CV_Module#Table:_cvterm"
class="external text" rel="nofollow">CVTerm table</a> referencing table
list.)

Every other module depends on on the CV module. CVs and ontologies are
central to Chado's design philosophy. Why?

###### Data Integrity

Using CVs (and enforcing their use as Chado does) ensures that your data
stays consistent. For example, in the most simple case it prevents your
database from using several different values all to mean the same thing
(e.g., "unknown", "unspecified", "missing", "other", " ",...), and it
prevents misspellings ("sagital" instead of "sagittal") and typos.

###### Data Portability and Standardization

If you are studying developmental processes and you use the Gene
Ontology's _biological process_ terms then your data can be easily
shared _and integrated_ with data from other researchers. If you create
your set of terms or just enter free text (egads!), then it will require
a lot of human intervention to convert your data to a standard
nomenclature so it can be integrated with others.

Using an established ontology when one exists usually involves some
compromises, but it greatly increases the usability of your data to
others (and to yourself).

###### Complexity

Controlled vocabularies are not particularly complex - they are just
lists of terms. Ontologies, however, can be very complex, as shown by
the GO example above. This complexity could be ignored. You could, for
example, convert GO to a controlled vocabulary - a very long list of
terms. You would still have data integrity and portability, and it
wouldn't be as complex.

It also would not be as powerful. Ontologies support reasoning about the
terms in them and this can be very useful. With GO, for example, you can
ask

Show me all genes involved in _anatomical structure development_

and get back genes directly tagged with _anatomical structure
development_, plus any genes tagged with any of that term's sub-terms,
from _organ development_ to _regulation of skeletal muscle
regeneration_. If you convert GO to just a list of terms, you can no
longer answer that question.

The Chado CV Module supports such complex queries with ontologies by
pre-calculating the _[transitive
closure](Chado_CV_Module#Transitive_Closure "Chado CV Module")_ of all
terms in an ontology. There is a great explanation of transitive closure
on the [Chado CV Module
page](Chado_CV_Module#Transitive_Closure "Chado CV Module"). Also see
the description of these 3 tables:

- [cvterm](Chado_CV_Module#Table:_cvterm "Chado CV Module")
- [cvterm_relationship](Chado_CV_Module#Table:_cvterm_relationship "Chado CV Module")
- [cvtermpath](Chado_CV_Module#Table:_cvtermpath "Chado CV Module")

We won't go into any more detail on it here.

#### Opening our sample database

    $ psql drupal

#### Our first example query

Up to this point we've seen how to store features using the feature
table as well as rigidly define what types of things they are using the
cv module tables. Here is an SQL example of how to query some very basic
information about all gene features in our database:

```de1
 SELECT gene.feature_id, gene.uniquename, gene.name
   FROM feature gene
        JOIN cvterm c ON gene.type_id = c.cvterm_id
  WHERE c.name = 'gene' AND organism_id = 13;
```

This should return something like:

     feature_id |                   uniquename                   |                      name
    ------------+------------------------------------------------+------------------------------------------------
            405 | maker-scf1117875582023-snap-gene-0.0           | maker-scf1117875582023-snap-gene-0.0
            409 | maker-scf1117875582023-snap-gene-0.3           | maker-scf1117875582023-snap-gene-0.3
            415 | genemark-scf1117875582023-abinit-gene-0.42     | genemark-scf1117875582023-abinit-gene-0.42
           1011 | maker-scf1117875582023-snap-gene-1.0           | maker-scf1117875582023-snap-gene-1.0
           1018 | maker-scf1117875582023-snap-gene-1.4           | maker-scf1117875582023-snap-gene-1.4
           1022 | maker-scf1117875582023-snap-gene-1.1           | maker-scf1117875582023-snap-gene-1.1
           1027 | maker-scf1117875582023-snap-gene-1.2           | maker-scf1117875582023-snap-gene-1.2
           1032 | maker-scf1117875582023-snap-gene-1.7           | maker-scf1117875582023-snap-gene-1.7
           1038 | maker-scf1117875582023-snap-gene-1.5           | maker-scf1117875582023-snap-gene-1.5
           1698 | snap_masked-scf1117875582023-abinit-gene-2.4   | snap_masked-scf1117875582023-abinit-gene-2.4
    ...

Type `q` to escape the listing.

Lists of things are great, but we're going to need to do a lot more with
our genomic data than keep lists of features. First, we need to be able
to identify them properly. This may seem straightforward, but creating
one column per ID type in feature would be a bad idea, since any given
feature could have dozens of different identifiers from different data
sources. The General Module helps resolve this.

#### General Module

The General module is about identifying things within this DB to the
outside world, and identifying things from the outside world (i.e.,
other databases) within this database.

##### IDs

[General module tables](Chado_General_Module "Chado General Module")

Biological databases have _public_ and _private_ IDs and they are
usually different things.

###### Public IDs

These are shown on web pages and in publications. These are also known
as _accession numbers_.

| GO + 0043565 = GO:0043565                 |
| ----------------------------------------- |
| InterPro + IPR001356 = InterPro:IPR001356 |
| YourDB + whatever = YourDB:whatever       |

Public IDs tend to be _alternate keys_ inside the database: they do
uniquely identify objects in the database.

###### Private IDs

These are used inside the database and are not meant to be shown or
published. Tend to be long integers. There are many more private IDs
than public IDs.

Private IDs are used for _primary keys_ and _foreign keys_.

Most DBMSs have built-in mechanisms for generating private IDs.

##### IDs in Chado

The [General module](Chado_General_Module "Chado General Module")
defines _public_ IDs of

- items defined in this databases, and
- items defined in other databases, that are used or referenced in this
  database.

In fact, those two classes of IDs are defined in exactly the same way,
in the <a
href="http://gmod.org/Chado_General_Module#Table:_dbxref"
class="external text" rel="nofollow">dbxref table</a>.

In Chado every table (in every module) defines its own private IDs.

#### Properties

So far we've only seen very basic information for each feature stored.
Because the feature table was designed to be very generic and store all
feature types, attributes specific to only some types can't be stored
there. It wouldn't make sense, for example, to have a column called
'gene_product_name', since that column would be empty for all the
features, like chromosomes, that aren't gene products.

These feature-specific attributes are known as 'properties' of a feature
in Chado. They are stored in a table called <a
href="Chado_Sequence_Module#Table:_featureprop"
class="external text" rel="nofollow">featureprop</a>.

| Table: featureprop |            |         |       |      |
| ------------------ | ---------- | ------- | ----- | ---- |
| featureprop_id     | feature_id | type_id | value | rank |

You may have noticed that the featureprop table shares a 'type_id'
column with the feature table. Properties of features are typed
according to a controlled vocabulary just as the features themselves
are. This helps to ensure that anyone using the same vocabularies are
encoding their property assertions in the same way.

Using feature properties we can now describe our features as richly as
needed, but our features are still independent of one another. Because
many of the features we're storing have some sort of relationship to one
another (such as genes and their polypeptide end-products), our schema
needs to accommodate this.

##### Relationships

Relationships between features are stored in the <a
href="Chado_Sequence_Module#Table:_feature_relationship"
class="external text" rel="nofollow">feature_relationship table</a>.

| Table: feature_relationship |            |           |         |      |     |
| --------------------------- | ---------- | --------- | ------- | ---- | --- |
| feature_relationship_id     | subject_id | object_id | type_id | rank | ... |

Features can be arranged in graphs, e.g. "exon _part_of_ transcript
_part_of_ gene"; If type is thought of as a verb, then each arc or edge
makes a statement:

- Subject _verb_ Object, or
- Child _verb_ Parent, or
- Contained _verb_ Container, or
- Subfeature _verb_ Feature

Again, notice the use of controlled vocabularies (type_id) to define the
relationship between features.

One might think of a relationship between a gene and chromosome as
'located_on', and store that as a feature_relationship entry between the
two. If you did, pat yourself on the back for Chado-ish thinking, but
there's a better way to handle locatable features, since a relationship
entry alone wouldn't actually say WHERE the feature was located, only
that it was.

##### Locations

Location describes where a feature is/comes from relative to another
feature. Some features such as chromosomes are not localized in sequence
coordinates, though contigs/assemblies which make up the chromosomes
could be.

Locations are stored in the <a
href="Chado_Sequence_Module#Table:_featureloc"
class="external text" rel="nofollow">featureloc table</a>, and a feature
can have zero or more featureloc records. Features will have either

- one featureloc record, for localized features for which the location
  is known, or
- zero featureloc records, for unlocalized features such as chromosomes,
  or for features for which the location is not yet known, such as a
  gene discovered using classical genetics techniques.
- Features with multiple featurelocs are explained below.

(For a good explanation of how features are located in Chado see <a
href="Chado_Sequence_Module#Feature_Locations"
class="external text" rel="nofollow">Feature Locations</a>. This
explanation is excerpted from that.)

###### Interbase Coordinates

This is covered in more detail on the [GMOD web
site](Introduction_to_Chado#Interbase_Coordinates "Introduction to Chado").

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a0/Interbase.png" width="352" height="296"
alt="Interbase.png" />

A featureloc record specifies an interval in _interbase sequence
coordinates_, bounded by the fmin and fmax columns, each representing
the lower and upper linear position of the _boundary_ between bases or
base pairs (with directionality indicated by the strand column).

Interbase coordinates were chosen over the base-oriented coordinate
system because the math is easier, and it cleanly supports zero-length
features such as splice sites and insertion points.

###### Location Chains

Chado supports _location chains_. For example, locating an exon relative
to a contig that is itself localized relative to a chromosome. The
majority of Chado instances will not require this flexibility; features
are typically located relative to chromosomes or chromosomes arms.

The ability to store such localization networks or location graphs can
be useful for unfinished genomes or parts of genomes such as
heterochromatin, in which it is desirable to locate features relative to
stable contigs or scaffolds, which are themselves localized in an
unstable assembly to chromosomes or chromosome arms.

Localization chains do not necessarily only span assemblies - protein
domains may be localized relative to polypeptide features, themselves
localized to a transcript (or to the genome, as is more common). Chains
may also span sequence alignments.

###### featureloc Table

Feature location information is stored in the <a
href="Chado_Sequence_Module#Table:_featureloc"
class="external text" rel="nofollow">featureloc table</a>.

| Table: featureloc |            |               |      |      |     |
| ----------------- | ---------- | ------------- | ---- | ---- | --- |
| featureloc_id     | feature_id | srcfeature_id | fmin | rank | ... |

##### Example: Gene

**Note:** This example and some of the figures are extracted from
_<a href="Image:A_Chado_Case_Study.pdf"
class="external text" rel="nofollow">A Chado case study: an
ontology-based modular schema for representing genome-associated
biological information</a>_, by Christopher J. Mungall, David B. Emmert,
and the FlyBase Consortium (2007)

How is a "central dogma" gene represented in Chado?

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/83/CentralDogma.png" width="347" height="370"
alt="CentralDogma.png" />

How do we represent these exons, mRNAs, proteins, and there
relationships between them?

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><table class="wikitable">
<thead>
<tr class="header">
<th colspan="6">Table: feature</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<th>feature _id</th>
<th>name</th>
<th>uniquename</th>
<th>type_id</th>
<th>is_ analysis</th>
<th></th>
</tr>
&#10;<tr class="odd">
<td>10456</td>
<td>exon 1</td>
<td>genex_exon1</td>
<td>(exon)</td>
<td>false</td>
<td></td>
</tr>
<tr class="even">
<td>10457</td>
<td>exon 2</td>
<td>genex_exon2</td>
<td>(exon)</td>
<td>false</td>
<td></td>
</tr>
<tr class="odd">
<td>10458</td>
<td>exon 3</td>
<td>genex_exon3</td>
<td>(exon)</td>
<td>false</td>
<td></td>
</tr>
<tr class="even">
<td>10459</td>
<td>exon 4</td>
<td>genex_exon4</td>
<td>(exon)</td>
<td>false</td>
<td></td>
</tr>
<tr class="odd">
<td>10460</td>
<td>exon 5</td>
<td>genex_exon5</td>
<td>(exon)</td>
<td>false</td>
<td></td>
</tr>
<tr class="even">
<td>10461</td>
<td>exon 6</td>
<td>genex_exon6</td>
<td>(exon)</td>
<td>false</td>
<td></td>
</tr>
<tr class="odd">
<td>10462</td>
<td>exon 7</td>
<td>genex_exon7</td>
<td>(exon)</td>
<td>false</td>
<td></td>
</tr>
<tr class="even">
<td>10463</td>
<td>mRNA-A</td>
<td>genex_mRNA-A</td>
<td>(mRNA)</td>
<td>false</td>
<td></td>
</tr>
<tr class="odd">
<td>10464</td>
<td>mRNA-B</td>
<td>genex_mRNA-B</td>
<td>(mRNA)</td>
<td>false</td>
<td></td>
</tr>
<tr class="even">
<td>10465</td>
<td>protein-p2</td>
<td>genex_protein-p2</td>
<td>(polypeptide)</td>
<td>false</td>
<td></td>
</tr>
<tr class="odd">
<td>10466</td>
<td>protein-p1</td>
<td>genex_protein-p1</td>
<td>(polypeptide)</td>
<td>false</td>
<td></td>
</tr>
<tr class="even">
<td>10467</td>
<td>gene X</td>
<td>genex</td>
<td>(polypeptide)</td>
<td>false</td>
<td></td>
</tr>
</tbody>
</table></td>
<td><table class="wikitable">
<thead>
<tr class="header">
<th colspan="6">Table: feature_relationship</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<th>feature_ relationship _id</th>
<th>subject_id</th>
<th>object_id</th>
<th>type_id</th>
<th>rank</th>
<th></th>
</tr>
&#10;<tr class="odd">
<td>589</td>
<td>(exon 1)</td>
<td>(mRNA-A)</td>
<td>(part_of)</td>
<td>0</td>
<td></td>
</tr>
<tr class="even">
<td>590</td>
<td>(exon 2)</td>
<td>(mRNA-A)</td>
<td>(part_of)</td>
<td>0</td>
<td></td>
</tr>
<tr class="odd">
<td>591</td>
<td>(exon 3)</td>
<td>(mRNA-A)</td>
<td>(part_of)</td>
<td>0</td>
<td></td>
</tr>
<tr class="even">
<td>592</td>
<td>(exon 4)</td>
<td>(mRNA-A)</td>
<td>(part_of)</td>
<td>0</td>
<td></td>
</tr>
<tr class="odd">
<td>593</td>
<td>(exon 5)</td>
<td>(mRNA-A)</td>
<td>(part_of)</td>
<td>0</td>
<td></td>
</tr>
<tr class="even">
<td>594</td>
<td>(exon 2)</td>
<td>(mRNA-B)</td>
<td>(part_of)</td>
<td>0</td>
<td></td>
</tr>
<tr class="odd">
<td>595</td>
<td>(exon 4)</td>
<td>(mRNA-B)</td>
<td>(part_of)</td>
<td>0</td>
<td></td>
</tr>
<tr class="even">
<td>596</td>
<td>(exon 6)</td>
<td>(mRNA-B)</td>
<td>(part_of)</td>
<td>0</td>
<td></td>
</tr>
<tr class="odd">
<td>597</td>
<td>(exon 7)</td>
<td>(mRNA-B)</td>
<td>(part_of)</td>
<td>0</td>
<td></td>
</tr>
<tr class="even">
<td>598</td>
<td>(protein-p2)</td>
<td>(mRNA-A)</td>
<td>(derives_from)</td>
<td>0</td>
<td></td>
</tr>
<tr class="odd">
<td>599</td>
<td>(protein-p1)</td>
<td>(mRNA-B)</td>
<td>(derives_from)</td>
<td>0</td>
<td></td>
</tr>
<tr class="even">
<td>600</td>
<td>(mRNA-A)</td>
<td>(gene X)</td>
<td>(part_of)</td>
<td>0</td>
<td></td>
</tr>
<tr class="odd">
<td>601</td>
<td>(mRNA-B)</td>
<td>(gene X)</td>
<td>(part_of)</td>
<td>0</td>
<td></td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

##### Example: Computational Analysis

**Note:** This is example is based on an example by Scott Cain from an
earlier <a
href="Image:ChadoWorkshopArthopod2008.pdf"
class="external text" rel="nofollow">Chado workshop</a>.

You can store the results of computational analysis such as BLAST or
BLAT runs in the sequence module. Here's an example of you could store a
BLAST highest scoring pair (HSP) result.

With HSP results there are two reference sequences, which means two
entries in the featureloc table. (The analysis and analysisfeature
tables, in the Companalysis module, are used to store information about
how the analysis was done and what scores resulted.)

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f6/CompAnalysisFeature.png" width="615"
height="322" alt="CompAnalysisFeature.png" />

Every horizontal line becomes a record in the feature table, and every
vertical line becomes a record in the feature_relationship table.

##### Other Feature Annotations

Link to any feature via <a
href="Chado_Sequence_Module#Table:_feature"
class="external text" rel="nofollow">feature_id</a>:

- GO terms in <a
  href="Chado_Sequence_Module#Table:_feature_cvterm"
  class="external text" rel="nofollow">feature_cvterm</a>
- DB links in <a
  href="Chado_Sequence_Module#Table:_feature_dbxref"
  class="external text" rel="nofollow">feature_dbxref</a>
- Miscellaneous features in <a
  href="Chado_Sequence_Module#Table:_featureprop"
  class="external text" rel="nofollow">featureprop</a>
- Attribution in <a
  href="Chado_Sequence_Module#Table:_feature_pub"
  class="external text" rel="nofollow">feature_pub</a>

##### Extending Chado: Properties tables and new modules

Chado was built to be easily extensible. New functionality can be added
by adding new modules. Both the Mage and the Stock modules were added
after Chado had been out for a while. They both addressed needs that
were either not addressed, or were inadequately addressed in the
original release.

Chado can be tailored to an individual organization's needs by using
_property tables_. Property tables are a means to virtually add new
columns without having to modify the schema. Property tables are
included in many modules.

Property tables are incredibly flexible, and they do make Chado
extremely extensible, but they do so at a cost.

- The SQL to get attributes from property tables is much more complex,
  and
- It is more work to enforce constraints on data in properties tables
  then in regular columns.

## Practice

### Prerequisites

Using data from [MAKER](MAKER.1 "MAKER").

#### PostgreSQL

Already installed PostgreSQL 9.1 via apt-get.

##### Edit config files

```enter
  sudo su
  cd /etc/postgresql/9.1/main/
  less pg_hba.conf
```

At the bottom of the file, we've already changed `ident sameuser` to
`trust`. This means that anyone who is on the local machine is allowed
to connect to any database. If you want to allow people to connect from
other machines, their IP address or a combo of IP address and netmasks
can be used to allow remote access.

If we'd have edited the pg_hba.conf file, we'd have to (re)start the
database server:

```enter
  /etc/init.d/postgresql restart
  exit # to get out of su
```

##### Create a gmod user

Normally, we'd have to switch to the postgres user to create a new
database user, but the ubuntu user is already a superuser. Create a new
user named "gmod":

      createuser gmod
        Shall the new role be a superuser? (y/n) y

#### [BioPerl](BioPerl "BioPerl")

Version 1.6.901 already installed.

#### Let's Go!

#### Environment Variables

in `~/.bashrc` add:

```enter
  GMOD_ROOT='/usr/local/gmod'
  export GMOD_ROOT
```

and source the profile:

```enter
  source ~/.bashrc
```

### Installing Chado

```enter
  cd ~/sources/chado/chado/
  perl Makefile.PL
```

     Use values in '/home/ubuntu/chado/chado/build.conf'? [Y] n

This allows you to specify Pythium when you are asked for a default
organism.

     > "chado" for database name
     > "ubuntu" for database username
     > "Pythium" for the default organism
     > "public" for the schema Chado will reside in

Just hit enter when it asks for a password for user gmod.

This `Makefile.PL` does quite a bit of stuff to get the installation
ready. Among other things it:

- Sets up a variety of database user parameters
- Prepares the SQL files for installation
- It can rebuild <a href="http://search.cpan.org/perldoc?Class::DBI"
  class="external text" rel="nofollow">Class::DBI</a> api for
  <a href="Chado" class="mw-redirect" title="Chado">Chado</a>, but isn't
  now (they are prebuilt for the default schema)
- All the 'normal' stuff that would happen when running `Makefile.PL`,
  like copying `lib` and `bin` files to be ready for installation
     make
     sudo make install
     make load_schema
     make prepdb

At this point, the installer checks the database to see if the organism
we put in as our default organism is present in the database. Since it
isn't, it will ask us to add it. It does this by automatically executing
a script that comes with Chado, gmod_add_organism.pl. You can execute
this script any time you want to [add organisms to your
database](Load_GFF_Into_Chado#Add_an_Entry_for_Your_Organism "Load GFF Into Chado"):

     Adding Pythium to the database...

     Both genus and species are required; please provide them below

     Organism's genus?  Pythium
     Organism's species?  ultimum
     Organism's abbreviation? [P.ultimum]
     Comment (can be empty)?

Continuing on...

     make ontologies
     Available ontologies:
     [1] Relationship Ontology
     [2] Sequence Ontology
     [3] Gene Ontology
     [4] Chado Feature Properties
     [5] Plant Ontology

     Which ontologies would you like to load (Comma delimited)? [0]  1,2,4

You can pick any ontologies you want, but GO will take over an hour to
install, and it doesn't matter to much what you pick, because we are
going to be blowing this database away soon anyway.

#### Saving your progress to this point

It is generally a good idea to save your progress when you are done
loading ontologies before you've attempted to load any other data. That
way, if something goes wrong, it is very easy to restore to this point.
To make a db dump, do this:

     pg_dump chado | bzip2 -c --best > db_w_ontologies.bz2

The `-c` tells `bzip2` to take input on standard in and spit it out on
`stdout`. To restore from a dump, drop and recreate the database and
then uncompress the dump into it, like this:

```dont
  dropdb chado
  createdb chado
  bzip2 -dc db_w_ontologies.bz2 | psql chado
```

#### A Note about Redos

If at some point you feel like you want to rebuild your database from
scratch, you need to get rid of the temporary directory where ontology
files are stored. You can either do this with `rm -rf ./tmp` **(be very
careful about that `./` in front of `tmp`)** or with a make target that
was designed for this: `make rm_locks`, which only gets rid of the lock
files but leaves the ontology files in place.

### Preparing [GFF](GFF "GFF") data for loading

Issues:

- splitting 'annotations' from 'computational analysis'
- very large files
- fasta → gff
- utility scripts for various preparation activities

#### Working with Large [GFF](GFF "GFF") files

Large files (more than 3-500,000 rows) can cause headaches for the
[GFF3](GFF3 "GFF3") bulk loader, but genome annotation GFF3 files can
frequently be millions of lines. What to do? The script
`gmod_gff3_preprocessor.pl` will help with this, both by splitting the
files in to reasonable size chunks and sorting the output so that it
make sense.

Note that if your files are already sorted (and in this case, that means
that all parent features come before their child features and lines that
share IDs (like CDSes sometimes do) are together), then all you need to
do is split your files. Frequently files are already sorted and avoiding
sorting is good for two reasons:

1.  It takes a long time to do the sort compared to the split (it parses
    every line, loads it into temporary tables and pulls out lines via
    query to rebuild the GFF file)
2.  The sorting process makes it more difficult to read the resulting
    GFF, since the parent feature will no longer be near the child
    features in the GFF file. Chado doesn't care about that but you
    might.

#### Loading [GFF3](GFF3 "GFF3")

Working with the large number of files that come out of the preprocessor
can be a bit of a headache, so I've 'developed' a few tricks. Basically,
I make a bash script that will execute all of the loads at once. The
easy way (for me) to do this is:

```enter
  ls *.gff3 > load.sh
  vi load.sh
```

and then use vim regex goodness to write the loader commands into every
line of the file:

     :% s/^/gmod_bulk_load_gff3.pl --analysis -g /

which puts the command at the beginning every line. The `--analysis`
tells the loader that it is working with analysis results, so the scores
need to be store in the companalysis module. While the genes file are
not really analysis results, I faked them to look like FgenesH results
so that Apollo would have something to work with. Then I manually edit
the file to add and remove the few modifications I need:

- Add `--noexon` to the genes file (since it contains both CDS and exon
  features, I don't want the loader to create exon features from CDS
  features).

Then I add `#!/bin/bash` at the top of the file (which isn't actually
needed) and run

     bash load.sh

and it loads all of the files sequentially. I have done this with 60-70
files at a time, letting the loader run for a few days(!)

#### Capturing the output to check for problems

If you are going to let a load run a very long time, you probably should
capture the output to check for problems. There are two ways to do this:

- run inside the `screen` command:

  screen -S loader

which creates a new 'screen' separate from your login. Then execute the
load command in the screen. To exit the screen but let your load command
continue running in it, type `ctrl-a` followed by a `d` (to detach) and
you get your original terminal back. To reconnect to the loader screen,
type

     screen -R loader

- capture `stdout` and `stderr` to a file

When you run the load command, you can use redirection to collect the
`stdout` and `stderr` to a file:

     bash load.sh >& load.output

#### Really loading data

OK, let's put the data into chado:

```enter
  gmod_bulk_load_gff3.pl -g /home/ubuntu/sources/pyu_data/scf1117875582023.gff
```

This should not work (yet!)

##### Try again

Doh! The loader is trying to tell us that this looks like analysis data
(that is, data produced by computer rather than humans).

We need to tell the loader that it is in fact analysis results:

     gmod_bulk_load_gff3.pl --analysis -g /home/ubuntu/sources/pyu_data/scf1117875582023.gff

<span style="font-size:120%">Kill, _kill_, **kill!** (ctrl-c)</span> the
load as soon as you see this message:

    There are both CDS and exon features in this file, but
    you did not set the --noexon option, which you probably want.
    Please see `perldoc gmod_bulk_load_gff3.pl for more information.

Argh! Now the loader is pointing out that this [GFF](GFF "GFF") file has
both exons and CDS features and Chado prefers something a little
different. While the loader will load this data as written, it won't be
"standard." Instead, we'll add the `--noexon` option (which tells the
loader not to create exon features from the CDS features, since we
already have them). One (at least) more time:

     gmod_bulk_load_gff3.pl --noexon --analysis -g /home/ubuntu/sources/pyu_data/scf1117875582023.gff

Success! (Probably.) If this failed, when rerun, we may need the
`--recreate_cache` option, which recreates a "temporary" table that the
loader uses to keep track of IDs.

### Loading other data

[Chado XML](Chado_XML "Chado XML") and [XORT](XORT.1 "XORT"), but
really, [Tripal](Tripal.1 "Tripal") bulk file loader.

## Chado for Expression, Genotype, Phenotype, and Natural Diversity

This section is about some of the lesser used Chado Modules.

### Expression

From an organism database point of view, expression is about turning
this:

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/80/ZfinGSC.jpg/200px-ZfinGSC.jpg"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/80/ZfinGSC.jpg/300px-ZfinGSC.jpg 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/80/ZfinGSC.jpg/400px-ZfinGSC.jpg 2x"
width="200" height="201" alt="ZfinGSC.jpg" /></td>
<td>Fig. S5 Synergistic effect of zdia2 sMO and profilin I tMO. Embryos
were injected with 8 ng zdia2 sMO (A and B) or co-injected with 4 ng
zdia2 sMO and 4 ng profilin I tMO (C and D). Embryos were incubated
until tail bud stage (10 hpf), fixed and stained with ntl and gsc
riboprobe. Photographs were taken for side view (A and C) and dorsal
view (B and D) after WISH.
<p>From <a href="http://dx.doi.org/10.1371/journal.pone.0003439"
class="external text" rel="nofollow">Lai <em>et al.</em>, 2008 -
Diaphanous-related formin 2 and profilin I are required for gastrulation
cell movements. PLoS One 3(10):e3439</a></p></td>
</tr>
</tbody>
</table>

Into this:

| Gene | Fish                                    | Stage | Anatomy          | Assay |
| ---- | --------------------------------------- | ----- | ---------------- | ----- |
| gsc  | wild type (unspecified), MO:diaph2,pfn1 | Bud   | prechordal plate | ISH   |
| gsc  | wild type (unspecified), MO:diaph2      | Bud   | prechordal plate | ISH   |
| ntla | wild type (unspecified), MO:diaph2,pfn1 | Bud   | notochord        | ISH   |
| ntla | wild type (unspecified), MO:diaph2,pfn1 | Bud   | tail bud         | ISH   |
| ntla | wild type (unspecified), MO:diaph2      | Bud   | notochord        | ISH   |
| ntla | wild type (unspecified), MO:diaph2      | Bud   | tail bud         | ISH   |

| From <a
href="http://zfin.org/cgi-bin/webdriver?MIval=aa-fxfigureview.apg&amp;OID=ZDB-FIG-081103-25"
class="external text" rel="nofollow">ZFIN: Figure: <em>Lai et al.</em>,
2008, Fig. S5</a> | | | | |

#### What defines an expression pattern?

Expression could include a lot of different things, and what it includes
depends on the community:

Gene, or Transcript, or Protein, or ...  
What are we measuring?

Stage  
Store single stages, or stage windows?

What do stage windows or adjacent stages mean: throughout window, or we
aren't sure on the stage (high-throughput)

Strain / Genotype  
What geneotype did we see this on.

Anatomy  
Does "expressed in brain" mean expressed in all, most, or somewhere in
brain?

Assay  
ISN, antibody, probe, ...

Source  
Publication, high-throughput screen, lab, project, ...

Genotype

Environment

Pattern  
Do you want to keep track of homogeneous, graded, spotty

Not Expressed  
Do you keep track of absence? If so, what does it mean? (not _detected_)

Image  
Is an image required or optional?

Strength  
What do strengths mean across different experiments?

#### How does Chado deal with this variety?

_Post-composition_, which is a very Chadoish way of doing things.

- Embrace a minimal definition of what an expression pattern is. In
  Chado, all that is required is a _name_, e.g., _SLC21A in GMOD Course
  Participant kidney after 4 days at NESCent_, or just "GMOD0002347".
- You can also provide a description. If your name is "GMOD0002347",
  this may be a good idea
- Details are then hung off that.

#### FlyBase Example

A specific example from FlyBase:

Here is an example of a simple case of the sort of data that
<a href="http://flybase.org" class="external text"
rel="nofollow">FlyBase</a> curates.

The _dpp_ transcript is expressed in embryonic stage 13-15 in the
cephalic segment as reported in a
<a href="http://flybase.bio.indiana.edu/reports/FBrf0053806.html"
class="external text" rel="nofollow">paper by Blackman <em>et al.</em>
in 1991</a>.

This would be implemented in the expression module by linking the _dpp_
transcript feature to expression via
[feature_expression](Chado_Tables#Table:_feature_expression "Chado Tables").
We would then link the following cvterms to the expression using
[expression_cvterm](#Table:_expression_cvterm):

- _embryonic stage 13_ where the cvterm_type would be stage and the
  rank=0
- _embryonic stage 14_ where the cvterm_type would be stage and the
  rank=1
- _embryonic stage 15_ where the cvterm_type would be stage and the
  rank=1
- _cephalic segment_ where the cvterm_type would be anatomy and the
  rank=0
- _in situ hybridization_ where the cvterm_type would be assay and the
  rank=0

Translation

In FlyBase, this would be a single expression record, with 5 Ontology/CV
terms attached to it.

- 1 saying what anatomy the expression is for - _cephalic segment_
- 1 saying that the assay type was _in situ hybridization_
- 1 each for each of the 3 stages - _embryonic stages 13, 14, 15_

And

- 1 record saying this expression pattern is for _dpp_.
- 1 record saying this expression pattern is from
  <a href="http://flybase.bio.indiana.edu/reports/FBrf0053806.html"
  class="external text" rel="nofollow">Blackman <em>et al.</em> in
  1991</a>.

#### Chado Allows

The Expression module table design allows each expression pattern to
have

- 1 name
- 0, 1 or more
  - Publications / Sources
  - Features
  - Images
  - Anatomy terms
  - Stages
  - Assay types
  - Any other CV/Ontology term (e.g., detected, not detected)

Two Key Points

1.  **Chado can support whatever your community decides your definition
    of an expression pattern is.**
2.  **However, Chado will not enforce that definition for you.**

If you require an expression pattern to have

- 1 name
- 1 publication/source
- 1 Feature
- 1 anatomy term
- 1 stage
- 1 assay type
- 1 detected / not detected flag
- 0, 1 or more images

then you will have to write a script to check that.

#### Table: expression

| F-Key | Name          | Type          | Description       |
| ----- | ------------- | ------------- | ----------------- |
|       | expression_id | serial        | _PRIMARY KEY_     |
|       | uniquename    | text          | _UNIQUE NOT NULL_ |
|       | md5checksum   | character(32) |                   |
|       | description   | text          |                   |

expression Structure

Tables referencing this one via Foreign Key Constraints:

- [expression_cvterm](#Table:_expression_cvterm),
  [expression_image](Chado_Tables#Table:_expression_image "Chado Tables"),
  [expression_pub](Chado_Tables#Table:_expression_pub "Chado Tables"),
  [expressionprop](Chado_Tables#Table:_expressionprop "Chado Tables"),
  [feature_expression](Chado_Tables#Table:_feature_expression "Chado Tables"),
  [wwwuser_expression](Chado_Tables#Table:_wwwuser_expression "Chado Tables")

#### Table: expression_cvterm

| F-Key                                               | Name                 | Type    | Description         |
| --------------------------------------------------- | -------------------- | ------- | ------------------- |
|                                                     | expression_cvterm_id | serial  | _PRIMARY KEY_       |
| [expression](#Table:_expression)                    | expression_id        | integer | _UNIQUE#1 NOT NULL_ |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | cvterm_id            | integer | _UNIQUE#1 NOT NULL_ |
|                                                     | rank                 | integer | _NOT NULL_          |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | cvterm_type_id       | integer | _UNIQUE#1 NOT NULL_ |

expression_cvterm Structure

Tables referencing this one via Foreign Key Constraints:

- [expression_cvtermprop](Chado_Tables#Table:_expression_cvtermprop "Chado Tables")

### Genotype

Defined in the [Chado Genetic
Module](Chado_Genetic_Module "Chado Genetic Module").

A _genotype_ in Chado is basically a _name_, with a pile of _features_
associated to it.

This used to mean a set of alleles.

Not sure how strains have been handled

In the era of high-throughput sequencing, this may be much more
detailed.

#### Table: genotype

Genetic context. A genotype is defined by a collection of features,
mutations, balancers, deficiencies, haplotype blocks, or engineered
constructs.

<table class="wikitable">
<caption>genotype Structure</caption>
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

genotype Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_genotype](Chado_Tables#Table:_feature_genotype "Chado Tables"),
  [phendesc](Chado_Tables#Table:_phendesc "Chado Tables"),
  [phenotype_comparison](Chado_Tables#Table:_phenotype_comparison "Chado Tables"),
  [phenstatement](Chado_Tables#Table:_phenstatement "Chado Tables"),
  [stock_genotype](Chado_Tables#Table:_stock_genotype "Chado Tables"),
  [wwwuser_genotype](Chado_Tables#Table:_wwwuser_genotype "Chado Tables")

#### Table: feature_genotype

<table class="wikitable">
<caption>feature_genotype Structure</caption>
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
<td><p><a href="#Table:_genotype">genotype</a></p></td>
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

feature_genotype Structure

### Environment

Also defined in the [Chado Genetic
Module](Chado_Genetic_Module "Chado Genetic Module").

#### Table: environment

The environmental component of a phenotype description.

| F-Key | Name           | Type   | Description       |
| ----- | -------------- | ------ | ----------------- |
|       | environment_id | serial | _PRIMARY KEY_     |
|       | uniquename     | text   | _UNIQUE NOT NULL_ |
|       | description    | text   |                   |

environment Structure

Tables referencing this one via Foreign Key Constraints:

- [environment_cvterm](#Table:_environment_cvterm),
  [phendesc](Chado_Tables#Table:_phendesc "Chado Tables"),
  [phenotype_comparison](Chado_Tables#Table:_phenotype_comparison "Chado Tables"),
  [phenstatement](Chado_Tables#Table:_phenstatement "Chado Tables")

#### Table: environment_cvterm

| F-Key                                               | Name                  | Type    | Description         |
| --------------------------------------------------- | --------------------- | ------- | ------------------- |
|                                                     | environment_cvterm_id | serial  | _PRIMARY KEY_       |
| [environment](#Table:_environment)                  | environment_id        | integer | _UNIQUE#1 NOT NULL_ |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | cvterm_id             | integer | _UNIQUE#1 NOT NULL_ |

environment_cvterm Structure

### Phenotype, Natural Diversity and Atlas Support

Phenotypes, natural diversity, and atlas support are all areas of future
work in Chado. Chado does have a phenotype module, but it has not aged
as well as other modules. Its support for natural diversity is limited
to what is implemented in the genotype, environment, and phenotype
modules. This is not robust enough to deal with studie that are
frequently done in the plant community, and are increasingly done in
animal communities as well.

To address this there are several efforts currently underway. The
<a href="http://aniseed-ibdm.univ-mrs.fr/" class="external text"
rel="nofollow">Aniseed project</a> includes 4 dimensional anatomy,
expression, and cell fate graphical atlases. Aniseed is currently in the
process of reimplementing itself to use Chado. This work is likely to
lead to contributions back to GMOD (both in Chado and a web interface)
to better support these types of atlases.

Better natural diversity support will be added in the coming year.
<a href="http://nescent.org" class="external text"
rel="nofollow">NESCent</a> has developed a prototype natural diversity
Chado module based on the
<a href="http://www.maizegenetics.net/gdpdm/" class="external text"
rel="nofollow">GDPDM</a>, that will added robust support for natural
diversity data.

[Categories](Special%253ACategories "Special%253ACategories"):

- [Tutorials](Category%253ATutorials "Category%253ATutorials")
- [Chado](Category%253AChado "Category%253AChado")

<span class="smwfactboxhead">Facts about
"<span class="swmfactboxheadbrowse">[Chado Tutorial
2013](Special%253ABrowse/Chado-20Tutorial-202013 "Special%253ABrowse/Chado-20Tutorial-202013")</span>"</span>

|                                                          |                                                                                                                                                                                                 |
| -------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Has topic](Property%253AHas_topic "Property:Has topic") | <a href="Chado" class="mw-redirect" title="Chado">Chado</a> <span class="smwsearch">[+](Special%253ASearchByProperty/Has-20topic/Chado "Special%253ASearchByProperty/Has-20topic/Chado")</span> |

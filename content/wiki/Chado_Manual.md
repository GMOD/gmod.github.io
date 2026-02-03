---
title: "Chado Manual"
---
# Chado Manual

  Introduction](#Introduction)
  - [The Chado
    Documentation's
    Vocabulary](#The_Chado_Documentation.27s_Vocabulary)
  - [Modularity](#Modularity)
  - [Ontologies](#Ontologies)
  - [Associated
    Software](#Associated_Software)
  - [Complexity
    and Detail](#Complexity_and_Detail)
  - [Data
    Integration](#Data_Integration)
  - [Support](#Support)
- [Modules](#Modules)
  - [Module
    Dependencies](#Module_Dependencies)
  - [Inter-module Linking
    Tables](#Inter-module_Linking_Tables)
- [Chado Naming
  Conventions](#Chado_Naming_Conventions)
  - [Case
    sensitivity](#Case_sensitivity)
  - [Table
    names](#Table_names)
  - [Column
    names](#Column_names)
  - [Primary
    and foreign key names](#Primary_and_foreign_key_names)
  - [Constraints](#Constraints)
  - [Indexes](#Indexes)
  - [Views](#Views)
- [Design
  Patterns](#Design_Patterns)
  - [Module
    System](#Module_System)
  - [Module
    Metadata](#Module_Metadata)
  - [View
    Layers](#View_Layers)
  - [Inter-schema
    Bridges](#Inter-schema_Bridges)
    - [GODB
      Bridge](#GODB_Bridge)
    - [BioSQL
      Bridge](#BioSQL_Bridge)
- [DBMS
  Functions](#DBMS_Functions)
  - [Function
    Interface Definitions](#Function_Interface_Definitions)
  - [Function
    Implementations](#Function_Implementations)
- [Glossary](#Glossary)

## Introduction

### The Chado Documentation's Vocabulary

It will be useful to the reader to clarify a number of terms used
throughout the Chado documentation. Because these terms have multiple
meanings it is useful at the outset to clarify how they are most often
used.

Database

A [Database Management System
(DBMS)](/wiki/Glossary#Database_Management_System), the software
that manages a database. The PostgreSQL software is an example of a
DBMS. The documentation rarely uses the term _database_ in this sense.

A collection of tables or other database content stored within a
particular DBMS, all of which can be queried together or otherwise
mutually manimpulated -- [the topmost hierarchal
element](/wiki/Glossary#DBMS-Database) in a DBMS's collection of
data. By definition, data stored within different databases cannot be
related, by query or otherwise. This is the sense of the term _database_
in a DBMS context, such as PostgreSQL, but the Chado document rarely
uses _database_ in this sense.

A [set of organized data](/wiki/Glossary#Database) that is readable
by a computer. This is the sense intended most often within the Chado
documentation. Usually, the word _database_ means something very
specific, a particular revision or version of bioinformatic information
stored in a Chado [database
schema](/wiki/Glossary#Database_Schema).

As an example the word _database_ might be used within this document to
refer to a specific version of the Flybase data set, a version stored
together in a Chado PostgreSQL-database along with other versions of the
Flybase drosopholid bioinformatic data.

Schema

A logical collection of tables or other DBMS-database content -- [the
layer below the topmost](/wiki/Glossary#DBMS-Schema) in a DBMS's
collection of data. An organizing concept somewhat similar to that of a
folder or directory; data stored within different schema of the same
[DBMS-Database](/wiki/Glossary) can be related and otherwise
mutually manipulated. This is the sense of the term _schema_ in a DBMS
context, such as PostgreSQL, but the Chado documentation rarely uses the
term _schema_ in this sense.

A database design -- a set of table and other definitions that describe
how and what data is to be stored, related validated, and otherwise kept
in and retrieved from a DBMS. This is the sense intended most often
within the Chado documentation. Chado is a schema.

As an example the phrase _loading the schema_ might be used in this
document to refer to creating within a DBMS the tables and other
database structural elements that make up Chado.

### Modularity

The Chado schema has been designed with modularity and
compartmentalization of function in mind. Groups of tables concerned
with a single knowledge domain are called _modules_. There is a core
module, [_general_](/wiki/Chado_General_Module),
concerned with data underlying all other classes, these tables store
information about databases, databases identifiers, and general
information about Chado tables. Equal in importance in Chado is
[_cv_](/wiki/Chado_CV_Module), the module concerned with
**c**controlled **v**ocabularies or ontologies.

All other sets of tables, or _modules_, link to these _general_ and _cv_
tables directly or indirectly but are limited in scope to specific
biological domains. For example, the [_sequence_
module](/wiki/Chado_Sequence_Module) is concerned with
protein and nucleotide sequence, the [_pub_
module](/wiki/Chado_Publication_Module) is
concerned with articles and publications, and so on. In addition to
these limitations in scope we see an effective absence of redundancy.
For example, there is a module called
[_companalysis_](/wiki/Chado_Companalysis_Module),
short for ’’computational analysis”. Its tables are responsible for
describing algorithms and the output of algorithms. The [_Mage_
module](/wiki/Chado_Mage_Module) (for microarrays) uses
_companalysis_ in order to refer to algorithms in addition. The
uniqueness, and generality, of the modules implies that one can rely on
pre-existing modules for function if one is interested in introducing
new modules.

Chado should be considered a highly extensible database due to its
modular design. The clear segregation of function into modules, or sets
of tables, should allow the introduction of new modules covering new
domains of knowledge. The fact that new modules have been introduced
into Chado since its initial release (e.g. _phylogeny_, _mage_, _stock_)
confirms that the authors' design concepts were correct.

### Ontologies

One of the more profound, recent changes in the nature of biology has to
do with the adoption of ontologies, or controlled vocabularies, as a way
to describe and organize data. Our most popular ontologies have arisen
from the need to describe the remarkable variety of living things, and
are very detailed and broad. Simultaneously these ontologies have served
to categorize and classify the contents of entire databases that had
been previously been atomized, or only partially coherent. Chado has
been built from the outset to integrate with these ontologies, and this
feature makes it extremely expressive. The acceptance of ontologies as
general standards, and Chado’s use of these ontologies, make Chado an
excellent platform for annotation of biological data.

### Associated Software

Chado is considered to be one of the key components in the GMOD suite.
It should not be considered **the** database of GMOD, there are other
ways of storing data within GMOD (e.g. [BioSQL](/wiki/BioSQL),
<a href="http://search.cpan.org/perldoc?Bio::DB::GFF"
class="external text" rel="nofollow">Bio::DB::GFF</a>,
<a href="http://search.cpan.org/perldoc?Bio::DB::SeqFeature"
class="external text" rel="nofollow">Bio::DB::SeqFeature</a>) but it is
the database of choice when complexity and breadth are required. Because
of this central position in GMOD it has been the focus of much software
development, not just the design of the schema itself but in terms of
components using it and _adaptor_ software that connect Chado to some
other GMOD component. Thus we are able to use Chado with different
browsers such as [GBrowse](/wiki/GBrowse) and
[Apollo](/wiki/Apollo) (the latter being able to both read from and
write to the database). We have a variety of tools that can be used to
load sequence data as [GFF](/wiki/GFF) into Chado and there are
different utilities that can move complex data in and out of Chado as
[XML](/wiki/Glossary#XML) ([XORT](/wiki/XORT),
[GMODTools](/wiki/GMODTools)).

### Complexity and Detail

Part of the impetus for the creation of Chado was the need for a
database that could describe **all** the detail that arises from
extensive research done on model organisms. There are a number of
schemas available that are built upon on the classic, and simple,
concept of the _central dogma_, _from 1 gene to 1 RNA to protein_.
However it can become difficult to work with simpler schemas when one
wants to describe _trans_-splicing or non-coding genes or other
departures from the simple model that are commonly found in viral or
bacterial genomes. The Chado schema is in use at model organism
databases such as <a href="http://flybase.org" class="external text"

<a href="http://xenbase.org" class="external text"

developers and these model organism communities has resulted in a
extensively tested data model, capable of handling both detail and
departures from the _standard model_.

### Data Integration

One characteristic of biology over the past decades has been the major
impact of methods or technologies. With each new adopted approach
biologists have created sizable data repositories, either as private
collections or in the public domain. The value and meaning of these data
types is fully realized when they are tied to other types of data. For
example, an evolutionary biologist may be studying the evolution of
non-coding, regulatory sequences. In order to do this she will consider
integrating expression data from microarrays (using the [_mage_
module](/wiki/Chado_Mage_Module)) with sequence data
(stored using the [_sequence_
module](/wiki/Chado_Sequence_Module)) from various
species (the [_organism_
module](/wiki/Chado_Organism_Module)) with
phylogenetic trees ([_phylogeny_
module](/wiki/Chado_Phylogeny_Module)) with results
from sequence comparison studies ([_companalysis_
module](/wiki/Chado_Companalysis_Module)). This is
not to suggest that such an effort is easy, rather that with a schema
like Chado such a proposition is actually _possible_.

### Support

The community using Chado, and GMOD, is extensive and growing. Chado is
in use at a number of sites worldwide (see [GMOD
Users](/wiki/GMOD_Users)) and is being considered by researchers
in related fields, notably molecular evolution and ecology. The Chado
community is active and supports a number of different [mailing
lists](/wiki/GMOD_Mailing_Lists). It is also notable that
there are close ties not just between GMOD and Chado users but also
between these two groups and the community of ontology developers (for
example, <a href="http://obofoundry.org" class="external text"

<a href="http://www.bioontology.org/" class="external text"

There is also Chado Documentation in this Wiki:

- [Chado - Getting
  Started](/wiki/Chado_-_Getting_Started)
- [Introduction to Chado](/wiki/Introduction_to_Chado)
- [FAQ for Chado](/wiki/Chado_FAQ)
- [Chado Tables](/wiki/Chado_Tables)
- [Chado Best Practices](/wiki/Chado_Best_Practices)

## Modules

We organised the tables into distinct modular components with tightly
defined dependencies. This is recognised as good software engineering
practice, it allows different software components to focus on the
specific data compartments required. It allows for extensibility and
schema evolution within specific modules without disrupting the rest of
the schema. Finally, it allows for a mix and match approach - it is the
authors' hope that the schema modules will be adopted by other model
organism and bioinformatics groups; these groups may want to swap in
their own table variants within specific modules, or add modules of
their own.

- [Audit](/wiki/Chado_Audit_Module) - for database audit
  trails
- [Companalysis](/wiki/Chado_Companalysis_Module) -
  for data from computational analysis
- [Contact](/wiki/Chado_Contact_Module) - for people,
  groups, and organizations
- [Controlled Vocabulary (cv)](/wiki/Chado_CV_Module) - for
  controlled vocabularies and ontologies
- [Expression](/wiki/Chado_Expression_Module) - for
  summaries of RNA and protein expression
- [General](/wiki/Chado_General_Module) - for
  identifiers
- [Genetic](/wiki/Chado_Genetic_Module) - for genetic
  data and genotypes
- [Library](/wiki/Chado_Library_Module) - for
  descriptions of molecular libraries
- [Mage](/wiki/Chado_Mage_Module) - for microarray data
- [Map](/wiki/Chado_Map_Module) - for maps without sequence
- [Natural Diversity
  (ND)](/wiki/Chado_Natural_Diversity_Module) -
  for multiple experiments, such as phenotyping and genotyping
- [Organism](/wiki/Chado_Organism_Module) - for
  taxonomic data
- [Phenotype](/wiki/Chado_Phenotype_Module) - for
  phenotypic data
- [Phylogeny](/wiki/Chado_Phylogeny_Module) - for
  organisms and phylogenetic trees
- [Publication
  (pub)](/wiki/Chado_Publication_Module) - for
  publications and references
- [Sequence](/wiki/Chado_Sequence_Module) - for
  sequences and sequence features
- [Stock](/wiki/Chado_Stock_Module) - for specimens and
  biological collections
- [WWW](/wiki/Chado_WWW_Module) -

### Module Dependencies

There is one module,
[general](/wiki/Chado_General_Module), that does not
depend on or inherit from any other module. All other modules require
[general](/wiki/Chado_General_Module) or some other
module. Many modules require the [sequence
module](/wiki/Chado_Sequence_Module) or the [cv
module](/wiki/Chado_CV_Module), or both.

| Module       | Depends on                                                    | ------------ | ------------------------------------------------------------- | general      | _none_                                                        | organism     | general cv                                                    | pub          | general cv                                                    | cv           | general                                                       | sequence     | cv general pub organism                                       | genetic      | sequence cv general pub phenotype                             | expression   | sequence cv pub                                               | map          | sequence cv pub                                               | rad          | sequence cv pub organism contact general companalysis         | companalysis | sequence cv                                                   | contact      | cv                                                            | library      | sequence cv pub organism                                      | phenotype    | cv sequence                                                   | phylogeny    | sequence cv pub organism general                              | stock        | cv pub general organism genetic                               | www          | sequence cv pub phenotype organism expression general genetic |

### Inter-module Linking Tables

These can be thought of as floating outside of the respective modules
they bridge, although they are generally bundled with one or the other
module.

| Linking Table                | Module    | Module     | ---------------------------- | --------- | ---------- | biomaterial_dbxref           | rad       | general    | cvterm_dbxref                | cv        | general    | environment_cvterm           | phenotype | cv         | expression_cvterm            | cv        | expression | expression_pub               | pub       | expression | feature_cvterm               | cv        | sequence   | feature_cvterm_dbxref        | sequence  | general    | feature_cvterm_pub           | sequence  | pub        | feature_dbxref               | general   | sequence   | feature_expression           | sequence  | expression | feature_genotype             | sequence  | genetic    | feature_organism             | organism  | sequence   | feature_phenotype            | sequence  | phenotype  | feature_pub                  | sequence  | pub        | feature_relationship_pub     | sequence  | pub        | feature_relationshipprop_pub | sequence  | pub        | feature_synonym              | general   | sequence   | featureloc_pub               | sequence  | pub        | featuremap_pub               | sequence  | pub        | featureprop_pub              | pub       | sequence   | gene_synonym                 | general   | sequence   | journal_dbxref               | general   | pub        | library_cvterm               | library   | cv         | library_feature              | library   | sequence   | library_pub                  | library   | pub        | organism_dbxref              | general   | organism   | phenotype_cvterm             | cv        | genetic    | phylonode_dbxref             | phylogeny | general    | phylonode_organism           | phylogeny | organism   | phylonode_pub                | phylogeny | pub        | phylotree_pub                | phylogeny | pub        | pub_dbxref                   | general   | pub        | stock_cvterm                 | stock     | cv         | stock_dbxref                 | stock     | general    | stock_genotype               | stock     | genetic    | stock_pub                    | stock     | pub        | stock_relationship_pub       | stock     | pub        | stockprop_pub                | stock     | pub        | wwwuser_author               | www       | pub        | wwwuser_cvterm               | www       | cv         | wwwuser_expression           | www       | expression | wwwuser_feature              | www       | sequence   | wwwuser_genotype             | www       | genetic    | wwwuser_organism             | www       | organism   | wwwuser_phenotype            | www       | phenotype  | wwwuser_project              | www       | general    | wwwuser_pub                  | www       | pub        |

## Chado Naming Conventions

### Case sensitivity

We use lowercase in all tables and column names - DBMSs differ in how
they treat case sensitivity. For example, Oracle will automatically
capitalize everything. So it's best to be neutral and use lowercase.

### Table names

In table names, we use underscores for linking tables; e.g.
_feature_dbxref_ is a linking table between _feature_ and _dbxref_.

Where a table name is a noun phrase rather than a single noun, we
concatenate the words together. For instance the table for describing
feature properties is called _featureprop_. It could be argued this is
harder to read, but it does allow consistent usage of underscores as
above. FeatureProp could be used where it is known the DBMS is case
insensitive.

### Column names

In column names, we also use concatenated noun phrases, except in the
case of primary or foreign keys, e.g. _dbxref_id_.

We try to keep column names unique where appropriate, which is useful
for large join statements or views, in avoiding column name clash
between diﬀerent tables. The convention is to use an abbreviated form of
the table name plus a noun describing the column, for instance _fmin_ in
the feature table. By consistently using abbreviated forms we stop
column names getting too big (many DBMSs will complain about long column
names).

### Primary and foreign key names

We use the same column name for primary and foreign key columns - very
useful for NATURAL JOIN statements.

### Constraints

Constraint names are a concatenation of table name, underscore, the
letter _c_, and a digit. For example: _feature_phenotype_c1_.

### Indexes

Index names are a concatenation of table name, underscore, the string
_idx_, and a digit. For example: _feature_phenotype_idx1_.

### Views

The names of views are lowercase. Where a table name is a noun phrase
rather than a single noun, we concatenate the words together using the
_underscore_. For example the view used to query for nucleotide motifs
is called _nucleotide_motif_ and the view used to find exons from
pseudogenes is called _pseudogenic_exon_.

## Design Patterns

### Module System

### Module Metadata

### View Layers

Views can be thought of as virtual tables. They provide a powerful
abstraction layer over the database. All views should be portable across
all DBMSs

Views in chado are deﬁned on a per module basis. View deﬁnitions are
maintained in the chado/modules/MODULE-NAME/views directory.

Included in the view directory are report views. These can usually be
found in a ﬁle called
chado/modules/MODULE-NAME/views/MODULE-NAME-report.sql

Collections of view deﬁnitions are bundled into packages, each package
is a .sql ﬁle.

### Inter-schema Bridges

#### GODB Bridge

#### BioSQL Bridge

## DBMS Functions

DBMS Functions in Chado are entirely optional.

Functions in chado are deﬁned on a per module basis. Function deﬁnitions
are maintained in the chado/modules/MODULE-NAME/functions directory.

Collections of function definitions are bundled into packages. Each
package comes with an **interface descriptions** and one or more
**implementations**.

### Function Interface Definitions

The interface descriptions are stored in a \*.sqlapi file. The syntax
used is a variant of SQL and is intended primarily as a consistent way
of providing information for human, although it should be parseable by
software.

Here is an example, taken from the top of the
chado/modules/sequence/functions/subsequence.sqlapi package. This
package provides basic subsequencing functions. It has dependencies on
two other function packages, declared at the top of the file. The
package declares multiple functions, only the first of which is show
here, a function for extracting subsequences from the sequence of a
feature.

```de1
IMPORT reverse_complement(TEXT) FROM 'sequtil';
IMPORT get_feature_relationship_type_id(TEXT) FROM 'sequence-cv-helper';

-----------------------------------
-- basic subsequencing functions --
-----------------------------------

DECLARE FUNCTION subsequence(
srcfeature_id  INT REFERENCES feature(feature_id),
fmin  INT,
fmax  INT,
strandINT
)
 RETURNS TEXT;

COMMENT ON FUNCTION subsequence(INT,INT,INT,INT) IS 'extracts a
subsequence from a feature referenced by srcfeature_id, within the
interbase boundaries determined by fmin and fmax, reverse
complementing if strand = -1. The sequence can be DNA or AA. Strand
must always by >0 for AA sequences';
```

### Function Implementations

The goal is to provide implementations for different dialects of
procedural [SQL](/wiki/Glossary#SQL). Currently only
[PostgreSQL](/wiki/PostgreSQL) dialect is supported. The psql
implementations are stored in \*.plpgsql files.

## Glossary

This document has a [glossary](/wiki/Glossary) of technical,
non-biological, terms.

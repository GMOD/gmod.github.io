---
title: "Chado Manual"
---
<span id="top"></span>

# <span dir="auto">Chado Manual</span>

## Contents

- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
  - [<span class="tocnumber">1.1</span> <span class="toctext">The Chado
    Documentation's
    Vocabulary</span>](#The_Chado_Documentation.27s_Vocabulary)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">Modularity</span>](#Modularity)
  - [<span class="tocnumber">1.3</span>
    <span class="toctext">Ontologies</span>](#Ontologies)
  - [<span class="tocnumber">1.4</span> <span class="toctext">Associated
    Software</span>](#Associated_Software)
  - [<span class="tocnumber">1.5</span> <span class="toctext">Complexity
    and Detail</span>](#Complexity_and_Detail)
  - [<span class="tocnumber">1.6</span> <span class="toctext">Data
    Integration</span>](#Data_Integration)
  - [<span class="tocnumber">1.7</span>
    <span class="toctext">Support</span>](#Support)
- [<span class="tocnumber">2</span>
  <span class="toctext">Modules</span>](#Modules)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Module
    Dependencies</span>](#Module_Dependencies)
  - [<span class="tocnumber">2.2</span>
    <span class="toctext">Inter-module Linking
    Tables</span>](#Inter-module_Linking_Tables)
- [<span class="tocnumber">3</span> <span class="toctext">Chado Naming
  Conventions</span>](#Chado_Naming_Conventions)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Case
    sensitivity</span>](#Case_sensitivity)
  - [<span class="tocnumber">3.2</span> <span class="toctext">Table
    names</span>](#Table_names)
  - [<span class="tocnumber">3.3</span> <span class="toctext">Column
    names</span>](#Column_names)
  - [<span class="tocnumber">3.4</span> <span class="toctext">Primary
    and foreign key names</span>](#Primary_and_foreign_key_names)
  - [<span class="tocnumber">3.5</span>
    <span class="toctext">Constraints</span>](#Constraints)
  - [<span class="tocnumber">3.6</span>
    <span class="toctext">Indexes</span>](#Indexes)
  - [<span class="tocnumber">3.7</span>
    <span class="toctext">Views</span>](#Views)
- [<span class="tocnumber">4</span> <span class="toctext">Design
  Patterns</span>](#Design_Patterns)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Module
    System</span>](#Module_System)
  - [<span class="tocnumber">4.2</span> <span class="toctext">Module
    Metadata</span>](#Module_Metadata)
  - [<span class="tocnumber">4.3</span> <span class="toctext">View
    Layers</span>](#View_Layers)
  - [<span class="tocnumber">4.4</span>
    <span class="toctext">Inter-schema
    Bridges</span>](#Inter-schema_Bridges)
    - [<span class="tocnumber">4.4.1</span> <span class="toctext">GODB
      Bridge</span>](#GODB_Bridge)
    - [<span class="tocnumber">4.4.2</span> <span class="toctext">BioSQL
      Bridge</span>](#BioSQL_Bridge)
- [<span class="tocnumber">5</span> <span class="toctext">DBMS
  Functions</span>](#DBMS_Functions)
  - [<span class="tocnumber">5.1</span> <span class="toctext">Function
    Interface Definitions</span>](#Function_Interface_Definitions)
  - [<span class="tocnumber">5.2</span> <span class="toctext">Function
    Implementations</span>](#Function_Implementations)
- [<span class="tocnumber">6</span>
  <span class="toctext">Glossary</span>](#Glossary)

## <span id="Introduction" class="mw-headline">Introduction</span>

### <span id="The_Chado_Documentation.27s_Vocabulary" class="mw-headline">The Chado Documentation's Vocabulary</span>

It will be useful to the reader to clarify a number of terms used
throughout the Chado documentation. Because these terms have multiple
meanings it is useful at the outset to clarify how they are most often
used.

Database

A [Database Management System
(DBMS)](Glossary#Database_Management_System "Glossary"), the software
that manages a database. The PostgreSQL software is an example of a
DBMS. The documentation rarely uses the term _database_ in this sense.

A collection of tables or other database content stored within a
particular DBMS, all of which can be queried together or otherwise
mutually manimpulated -- [the topmost hierarchal
element](Glossary#DBMS-Database "Glossary") in a DBMS's collection of
data. By definition, data stored within different databases cannot be
related, by query or otherwise. This is the sense of the term _database_
in a DBMS context, such as PostgreSQL, but the Chado document rarely
uses _database_ in this sense.

A [set of organized data](Glossary#Database "Glossary") that is readable
by a computer. This is the sense intended most often within the Chado
documentation. Usually, the word _database_ means something very
specific, a particular revision or version of bioinformatic information
stored in a Chado [database
schema](Glossary#Database_Schema "Glossary").

As an example the word _database_ might be used within this document to
refer to a specific version of the Flybase data set, a version stored
together in a Chado PostgreSQL-database along with other versions of the
Flybase drosopholid bioinformatic data.

Schema

A logical collection of tables or other DBMS-database content -- [the
layer below the topmost](Glossary#DBMS-Schema "Glossary") in a DBMS's
collection of data. An organizing concept somewhat similar to that of a
folder or directory; data stored within different schema of the same
[DBMS-Database](Glossary "Glossary") can be related and otherwise
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

### <span id="Modularity" class="mw-headline">Modularity</span>

The Chado schema has been designed with modularity and
compartmentalization of function in mind. Groups of tables concerned
with a single knowledge domain are called _modules_. There is a core
module, [_general_](Chado_General_Module "Chado General Module"),
concerned with data underlying all other classes, these tables store
information about databases, databases identifiers, and general
information about Chado tables. Equal in importance in Chado is
[_cv_](Chado_CV_Module "Chado CV Module"), the module concerned with
**c**controlled **v**ocabularies or ontologies.

All other sets of tables, or _modules_, link to these _general_ and _cv_
tables directly or indirectly but are limited in scope to specific
biological domains. For example, the [_sequence_
module](Chado_Sequence_Module "Chado Sequence Module") is concerned with
protein and nucleotide sequence, the [_pub_
module](Chado_Publication_Module "Chado Publication Module") is
concerned with articles and publications, and so on. In addition to
these limitations in scope we see an effective absence of redundancy.
For example, there is a module called
[_companalysis_](Chado_Companalysis_Module "Chado Companalysis Module"),
short for ’’computational analysis”. Its tables are responsible for
describing algorithms and the output of algorithms. The [_Mage_
module](Chado_Mage_Module "Chado Mage Module") (for microarrays) uses
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

### <span id="Ontologies" class="mw-headline">Ontologies</span>

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

### <span id="Associated_Software" class="mw-headline">Associated Software</span>

Chado is considered to be one of the key components in the GMOD suite.
It should not be considered **the** database of GMOD, there are other
ways of storing data within GMOD (e.g. [BioSQL](BioSQL "BioSQL"),
<a href="http://search.cpan.org/perldoc?Bio::DB::GFF"
class="external text" rel="nofollow">Bio::DB::GFF</a>,
<a href="http://search.cpan.org/perldoc?Bio::DB::SeqFeature"
class="external text" rel="nofollow">Bio::DB::SeqFeature</a>) but it is
the database of choice when complexity and breadth are required. Because
of this central position in GMOD it has been the focus of much software
development, not just the design of the schema itself but in terms of
components using it and _adaptor_ software that connect Chado to some
other GMOD component. Thus we are able to use Chado with different
browsers such as [GBrowse](GBrowse.1 "GBrowse") and
[Apollo](Apollo.1 "Apollo") (the latter being able to both read from and
write to the database). We have a variety of tools that can be used to
load sequence data as [GFF](GFF "GFF") into Chado and there are
different utilities that can move complex data in and out of Chado as
[XML](Glossary#XML "Glossary") ([XORT](XORT.1 "XORT"),
[GMODTools](GMODTools "GMODTools")).

### <span id="Complexity_and_Detail" class="mw-headline">Complexity and Detail</span>

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
rel="nofollow">FlyBase</a> and
<a href="http://xenbase.org" class="external text"
rel="nofollow">XenBase</a> and the close ties between the Chado
developers and these model organism communities has resulted in a
extensively tested data model, capable of handling both detail and
departures from the _standard model_.

### <span id="Data_Integration" class="mw-headline">Data Integration</span>

One characteristic of biology over the past decades has been the major
impact of methods or technologies. With each new adopted approach
biologists have created sizable data repositories, either as private
collections or in the public domain. The value and meaning of these data
types is fully realized when they are tied to other types of data. For
example, an evolutionary biologist may be studying the evolution of
non-coding, regulatory sequences. In order to do this she will consider
integrating expression data from microarrays (using the [_mage_
module](Chado_Mage_Module "Chado Mage Module")) with sequence data
(stored using the [_sequence_
module](Chado_Sequence_Module "Chado Sequence Module")) from various
species (the [_organism_
module](Chado_Organism_Module "Chado Organism Module")) with
phylogenetic trees ([_phylogeny_
module](Chado_Phylogeny_Module "Chado Phylogeny Module")) with results
from sequence comparison studies ([_companalysis_
module](Chado_Companalysis_Module "Chado Companalysis Module")). This is
not to suggest that such an effort is easy, rather that with a schema
like Chado such a proposition is actually _possible_.

### <span id="Support" class="mw-headline">Support</span>

The community using Chado, and GMOD, is extensive and growing. Chado is
in use at a number of sites worldwide (see [GMOD
Users](GMOD_Users "GMOD Users")) and is being considered by researchers
in related fields, notably molecular evolution and ecology. The Chado
community is active and supports a number of different [mailing
lists](GMOD_Mailing_Lists "GMOD Mailing Lists"). It is also notable that
there are close ties not just between GMOD and Chado users but also
between these two groups and the community of ontology developers (for
example, <a href="http://obofoundry.org" class="external text"
rel="nofollow">OBO</a>,
<a href="http://www.bioontology.org/" class="external text"
rel="nofollow">NCBO</a>).

There is also Chado Documentation in this Wiki:

- [Chado - Getting
  Started](Chado_-_Getting_Started "Chado - Getting Started")
- [Introduction to Chado](Introduction_to_Chado "Introduction to Chado")
- [FAQ for Chado](Chado_FAQ "Chado FAQ")
- [Chado Tables](Chado_Tables "Chado Tables")
- [Chado Best Practices](Chado_Best_Practices "Chado Best Practices")

## <span id="Modules" class="mw-headline">Modules</span>

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

- [Audit](Chado_Audit_Module "Chado Audit Module") - for database audit
  trails
- [Companalysis](Chado_Companalysis_Module "Chado Companalysis Module") -
  for data from computational analysis
- [Contact](Chado_Contact_Module "Chado Contact Module") - for people,
  groups, and organizations
- [Controlled Vocabulary (cv)](Chado_CV_Module "Chado CV Module") - for
  controlled vocabularies and ontologies
- [Expression](Chado_Expression_Module "Chado Expression Module") - for
  summaries of RNA and protein expression
- [General](Chado_General_Module "Chado General Module") - for
  identifiers
- [Genetic](Chado_Genetic_Module "Chado Genetic Module") - for genetic
  data and genotypes
- [Library](Chado_Library_Module "Chado Library Module") - for
  descriptions of molecular libraries
- [Mage](Chado_Mage_Module "Chado Mage Module") - for microarray data
- [Map](Chado_Map_Module "Chado Map Module") - for maps without sequence
- [Natural Diversity
  (ND)](Chado_Natural_Diversity_Module.1 "Chado Natural Diversity Module") -
  for multiple experiments, such as phenotyping and genotyping
- [Organism](Chado_Organism_Module "Chado Organism Module") - for
  taxonomic data
- [Phenotype](Chado_Phenotype_Module "Chado Phenotype Module") - for
  phenotypic data
- [Phylogeny](Chado_Phylogeny_Module "Chado Phylogeny Module") - for
  organisms and phylogenetic trees
- [Publication
  (pub)](Chado_Publication_Module "Chado Publication Module") - for
  publications and references
- [Sequence](Chado_Sequence_Module "Chado Sequence Module") - for
  sequences and sequence features
- [Stock](Chado_Stock_Module "Chado Stock Module") - for specimens and
  biological collections
- [WWW](Chado_WWW_Module "Chado WWW Module") -

### <span id="Module_Dependencies" class="mw-headline">Module Dependencies</span>

There is one module,
[general](Chado_General_Module "Chado General Module"), that does not
depend on or inherit from any other module. All other modules require
[general](Chado_General_Module "Chado General Module") or some other
module. Many modules require the [sequence
module](Chado_Sequence_Module "Chado Sequence Module") or the [cv
module](Chado_CV_Module "Chado CV Module"), or both.

| Module       | Depends on                                                    |
| ------------ | ------------------------------------------------------------- |
| general      | _none_                                                        |
| organism     | general cv                                                    |
| pub          | general cv                                                    |
| cv           | general                                                       |
| sequence     | cv general pub organism                                       |
| genetic      | sequence cv general pub phenotype                             |
| expression   | sequence cv pub                                               |
| map          | sequence cv pub                                               |
| rad          | sequence cv pub organism contact general companalysis         |
| companalysis | sequence cv                                                   |
| contact      | cv                                                            |
| library      | sequence cv pub organism                                      |
| phenotype    | cv sequence                                                   |
| phylogeny    | sequence cv pub organism general                              |
| stock        | cv pub general organism genetic                               |
| www          | sequence cv pub phenotype organism expression general genetic |

### <span id="Inter-module_Linking_Tables" class="mw-headline">Inter-module Linking Tables</span>

These can be thought of as floating outside of the respective modules
they bridge, although they are generally bundled with one or the other
module.

| Linking Table                | Module    | Module     |
| ---------------------------- | --------- | ---------- |
| biomaterial_dbxref           | rad       | general    |
| cvterm_dbxref                | cv        | general    |
| environment_cvterm           | phenotype | cv         |
| expression_cvterm            | cv        | expression |
| expression_pub               | pub       | expression |
| feature_cvterm               | cv        | sequence   |
| feature_cvterm_dbxref        | sequence  | general    |
| feature_cvterm_pub           | sequence  | pub        |
| feature_dbxref               | general   | sequence   |
| feature_expression           | sequence  | expression |
| feature_genotype             | sequence  | genetic    |
| feature_organism             | organism  | sequence   |
| feature_phenotype            | sequence  | phenotype  |
| feature_pub                  | sequence  | pub        |
| feature_relationship_pub     | sequence  | pub        |
| feature_relationshipprop_pub | sequence  | pub        |
| feature_synonym              | general   | sequence   |
| featureloc_pub               | sequence  | pub        |
| featuremap_pub               | sequence  | pub        |
| featureprop_pub              | pub       | sequence   |
| gene_synonym                 | general   | sequence   |
| journal_dbxref               | general   | pub        |
| library_cvterm               | library   | cv         |
| library_feature              | library   | sequence   |
| library_pub                  | library   | pub        |
| organism_dbxref              | general   | organism   |
| phenotype_cvterm             | cv        | genetic    |
| phylonode_dbxref             | phylogeny | general    |
| phylonode_organism           | phylogeny | organism   |
| phylonode_pub                | phylogeny | pub        |
| phylotree_pub                | phylogeny | pub        |
| pub_dbxref                   | general   | pub        |
| stock_cvterm                 | stock     | cv         |
| stock_dbxref                 | stock     | general    |
| stock_genotype               | stock     | genetic    |
| stock_pub                    | stock     | pub        |
| stock_relationship_pub       | stock     | pub        |
| stockprop_pub                | stock     | pub        |
| wwwuser_author               | www       | pub        |
| wwwuser_cvterm               | www       | cv         |
| wwwuser_expression           | www       | expression |
| wwwuser_feature              | www       | sequence   |
| wwwuser_genotype             | www       | genetic    |
| wwwuser_organism             | www       | organism   |
| wwwuser_phenotype            | www       | phenotype  |
| wwwuser_project              | www       | general    |
| wwwuser_pub                  | www       | pub        |

## <span id="Chado_Naming_Conventions" class="mw-headline">Chado Naming Conventions</span>

### <span id="Case_sensitivity" class="mw-headline">Case sensitivity</span>

We use lowercase in all tables and column names - DBMSs differ in how
they treat case sensitivity. For example, Oracle will automatically
capitalize everything. So it's best to be neutral and use lowercase.

### <span id="Table_names" class="mw-headline">Table names</span>

In table names, we use underscores for linking tables; e.g.
_feature_dbxref_ is a linking table between _feature_ and _dbxref_.

Where a table name is a noun phrase rather than a single noun, we
concatenate the words together. For instance the table for describing
feature properties is called _featureprop_. It could be argued this is
harder to read, but it does allow consistent usage of underscores as
above. FeatureProp could be used where it is known the DBMS is case
insensitive.

### <span id="Column_names" class="mw-headline">Column names</span>

In column names, we also use concatenated noun phrases, except in the
case of primary or foreign keys, e.g. _dbxref_id_.

We try to keep column names unique where appropriate, which is useful
for large join statements or views, in avoiding column name clash
between diﬀerent tables. The convention is to use an abbreviated form of
the table name plus a noun describing the column, for instance _fmin_ in
the feature table. By consistently using abbreviated forms we stop
column names getting too big (many DBMSs will complain about long column
names).

### <span id="Primary_and_foreign_key_names" class="mw-headline">Primary and foreign key names</span>

We use the same column name for primary and foreign key columns - very
useful for NATURAL JOIN statements.

### <span id="Constraints" class="mw-headline">Constraints</span>

Constraint names are a concatenation of table name, underscore, the
letter _c_, and a digit. For example: _feature_phenotype_c1_.

### <span id="Indexes" class="mw-headline">Indexes</span>

Index names are a concatenation of table name, underscore, the string
_idx_, and a digit. For example: _feature_phenotype_idx1_.

### <span id="Views" class="mw-headline">Views</span>

The names of views are lowercase. Where a table name is a noun phrase
rather than a single noun, we concatenate the words together using the
_underscore_. For example the view used to query for nucleotide motifs
is called _nucleotide_motif_ and the view used to find exons from
pseudogenes is called _pseudogenic_exon_.

## <span id="Design_Patterns" class="mw-headline">Design Patterns</span>

### <span id="Module_System" class="mw-headline">Module System</span>

### <span id="Module_Metadata" class="mw-headline">Module Metadata</span>

### <span id="View_Layers" class="mw-headline">View Layers</span>

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

### <span id="Inter-schema_Bridges" class="mw-headline">Inter-schema Bridges</span>

#### <span id="GODB_Bridge" class="mw-headline">GODB Bridge</span>

#### <span id="BioSQL_Bridge" class="mw-headline">BioSQL Bridge</span>

## <span id="DBMS_Functions" class="mw-headline">DBMS Functions</span>

DBMS Functions in Chado are entirely optional.

Functions in chado are deﬁned on a per module basis. Function deﬁnitions
are maintained in the chado/modules/MODULE-NAME/functions directory.

Collections of function definitions are bundled into packages. Each
package comes with an **interface descriptions** and one or more
**implementations**.

### <span id="Function_Interface_Definitions" class="mw-headline">Function Interface Definitions</span>

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

### <span id="Function_Implementations" class="mw-headline">Function Implementations</span>

The goal is to provide implementations for different dialects of
procedural [SQL](Glossary#SQL "Glossary"). Currently only
[PostgreSQL](PostgreSQL "PostgreSQL") dialect is supported. The psql
implementations are stored in \*.plpgsql files.

## <span id="Glossary" class="mw-headline">Glossary</span>

This document has a [glossary](Glossary "Glossary") of technical,
non-biological, terms.

[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado Modules](Category%253AChado_Modules "Category%253AChado Modules")
- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
- [Chado](Category%253AChado "Category%253AChado")

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Manual" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 13:43 on 14 March 2014.</span>
<!-- - <span id="footer-info-viewcount">306,381 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

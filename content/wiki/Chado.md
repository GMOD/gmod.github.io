---
title: "Chado - Getting Started"
---
# Chado - Getting Started

)

Status

- **Mature** release
- **Active** development
- **Active** support

- [Introduction](/wiki/Introduction_to_Chado)
- [Manual](/wiki/Chado_Manual)
- <a href="/wiki/Chado_Tutorial" class="mw-redirect"
 title="Chado Tutorial">Tutorial</a>
- [Modules](/wiki/Chado_Modules)
- <a href="https://lists.sourceforge.net/lists/listinfo/gmod-schema"
 class="external text" rel="nofollow">Mailing List</a>

- <a href="../extras/2008GMODCommunitySurvey.html#Chado"
 class="external text" rel="nofollow">2008 Survey</a>

Chado is a [relational database
schema](/wiki/Glossary#Database_Schema) that underlies [many GMOD
installations](/wiki/GMOD_Users). It is capable of representing
many of the general classes of data frequently encountered in modern
biology such as sequence, sequence comparisons, phenotypes, genotypes,
ontologies, publications, and phylogeny. It has been designed to handle
complex representations of biological knowledge and should be considered
one of the most sophisticated relational schemas currently available in
molecular biology. The price of this capability is that the new user
must spend some time becoming familiar with its fundamentals.

- [Documentation](#Documentation)
- [Modules](#Modules)
- [Installation](#Installation)
 - [Download a Stable Release of Chado](#Download_a_Stable_Release_of_Chado)
 - [Chado From SVN](#Chado_From_SVN)
- [Loading Data](#Loading_Data)
- [Mailing Lists](#Mailing_Lists)
- [Pronunciation](#Pronunciation)

## Documentation

- [Introduction to Chado](/wiki/Introduction_to_Chado)
- <a
 href="http://bioinformatics.oxfordjournals.org/cgi/content/abstract/23/13/i337?ijkey=QYeUct9uLSzefgk&amp;keytype=ref"
 class="external text" rel="nofollow">Chado paper in Bioinformatics</a>
- <a href="/wiki/Chado_Tutorial" class="mw-redirect"
 title="Chado Tutorial">Chado Tutorial</a>
- [Chado Manual](/wiki/Chado_Manual)
- [FAQ for Chado](/wiki/Chado_FAQ)
- [Chado Tables](/wiki/Chado_Tables)
- [Chado Best Practices](/wiki/Chado_Best_Practices)
- [Sample Chado SQL](/wiki/Sample_Chado_SQL)
- [PostgreSQL Performance
 Tips](/wiki/PostgreSQL_Performance_Tips)

## Modules

Chado is a modular schema, designed in such a way as to allow the
addition of new modules for new data types. The existing modules are:

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

## Installation

First you will need database software, or Relational Database Management
System (RDBMS). The recommended RDBMS for Chado currently is
<a href="http://www.postgresql.org/" class="external text"

a Unix operating system such as Linux or Mac OS X. You can also install
Postgres, and Chado, on Windows but most Chado installations are found
on some version of Unix - you'll probably get the best support by
choosing Unix. (See [Databases and
GMOD](/wiki/Databases_and_GMOD) for more discussion.)
Once you've installed your RDBMS you can install Chado.

### Download a Stable Release of Chado

See [Downloads](/wiki/Downloads)

### Chado From SVN

You can get the most up-to-date, not even released yet, version of Chado
from <a href="/wiki/Subversion" class="mw-redirect"
title="Subversion">Subversion</a>. To get a copy of the latest Chado
source, enter this at the command line:

 svn co https://svn.code.sf.net/p/gmod/svn/schema/trunk

Once the package has been downloaded `cd` to the `trunk/chado`
directory.

Follow the instructions in the `INSTALL.Chado` file, including the
installation of the prerequisites. Or read <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/schema/trunk/chado/INSTALL.Chado"
class="external text" rel="nofollow"><code>INSTALL.Chado</code></a>
online.

## Loading Data

After completing these steps, you can load your chado schema with data
in a number of ways:

- [Load RefSeq into Chado
 HOWTO](/wiki/Load_RefSeq_Into_Chado)
- [Load GFF into Chado HOWTO](/wiki/Load_GFF_Into_Chado)
- Using [XORT](/wiki/XORT)

You can also use the application [Apollo](/wiki/Apollo) to curate
data in Chado.

## Mailing Lists

| | Mailing List Link | Description | Archive(s) |
|----|----|----|----|
| [Chado](/wiki/Chado) | <a href="https://lists.sourceforge.net/lists/listinfo/gmod-schema" class="external text" rel="nofollow">gmod-schema</a> | All issues regarding [Chado](/wiki/Chado), [Chado::AutoDBI](/wiki/Chado_AutoDBI), and [Bio::Chado::Schema](/wiki/Bio_Chado_Schema) | <a href="http://dir.gmane.org/gmane.science.biology.gmod.schema" class="external text" rel="nofollow">Gmane</a>, <a href="http://gmod.827538.n3.nabble.com/Chado-f815597.html" class="external text" rel="nofollow">Nabble (2010/05+)</a>, <a href="http://sourceforge.net/mailarchive/forum.php?forum_name=gmod-schema" class="external text" rel="nofollow">Sourceforge</a> |
| | <a href="https://lists.sourceforge.net/lists/listinfo/gmod-schema-cmts" class="external text" rel="nofollow">gmod-schema-cmts</a> | [Chado](/wiki/Chado) code updates | <a href="http://sourceforge.net/mailarchive/forum.php?forum_name=gmod-schema-cmts" class="external text" rel="nofollow">Sourceforge</a> |

## Pronunciation

*Chado* is usually pronounced
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e4/Chado.mp3" class="internal"
title="Chado.mp3">like this</a>.

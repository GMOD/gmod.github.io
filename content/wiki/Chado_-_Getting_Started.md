---
title: "Chado - Getting Started"
---
# Chado - Getting Started


Status


- **Mature** release
- **Active** development
- **Active** support


Resources


- [Introduction](Introduction_to_Chado "Introduction to Chado")
- [Manual](Chado_Manual "Chado Manual")
- <a href="Chado_Tutorial" class="mw-redirect"
  title="Chado Tutorial">Tutorial</a>
- [Modules](Chado_Modules "Chado Modules")
- <a href="https://lists.sourceforge.net/lists/listinfo/gmod-schema"
  class="external text" rel="nofollow">Mailing List</a>
- [Tagged](Category%253AChado "Category%253AChado")
- <a href="../extras/2008GMODCommunitySurvey.html#Chado"
  class="external text" rel="nofollow">2008 Survey</a>


Chado is a [relational database
schema](Glossary#Database_Schema "Glossary") that underlies [many GMOD
installations](GMOD_Users "GMOD Users"). It is capable of representing
many of the general classes of data frequently encountered in modern
biology such as sequence, sequence comparisons, phenotypes, genotypes,
ontologies, publications, and phylogeny. It has been designed to handle
complex representations of biological knowledge and should be considered
one of the most sophisticated relational schemas currently available in
molecular biology. The price of this capability is that the new user
must spend some time becoming familiar with its fundamentals.


  Documentation](#Documentation)
- [Modules](#Modules)
- [Installation](#Installation)
  - [Download a
    Stable Release of Chado](#Download_a_Stable_Release_of_Chado)
  - [Chado From
    SVN](#Chado_From_SVN)
- [Loading
  Data](#Loading_Data)
- [Mailing
  Lists](#Mailing_Lists)
- [Pronunciation](#Pronunciation)


## Documentation

- [Introduction to Chado](Introduction_to_Chado "Introduction to Chado")
- <a
  href="http://bioinformatics.oxfordjournals.org/cgi/content/abstract/23/13/i337?ijkey=QYeUct9uLSzefgk&amp;keytype=ref"
  class="external text" rel="nofollow">Chado paper in Bioinformatics</a>
- <a href="Chado_Tutorial" class="mw-redirect"
  title="Chado Tutorial">Chado Tutorial</a>
- [Chado Manual](Chado_Manual "Chado Manual")
- [FAQ for Chado](Chado_FAQ "Chado FAQ")
- [Chado Tables](Chado_Tables "Chado Tables")
- [Chado Best Practices](Chado_Best_Practices "Chado Best Practices")
- [Sample Chado SQL](Sample_Chado_SQL "Sample Chado SQL")
- [PostgreSQL Performance
  Tips](PostgreSQL_Performance_Tips "PostgreSQL Performance Tips")

## Modules

Chado is a modular schema, designed in such a way as to allow the
addition of new modules for new data types. The existing modules are:

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

  

## Installation

First you will need database software, or Relational Database Management
System (RDBMS). The recommended RDBMS for Chado currently is
<a href="http://www.postgresql.org/" class="external text"
rel="nofollow">Postgres</a>. Postgres is free software, usually used on
a Unix operating system such as Linux or Mac OS X. You can also install
Postgres, and Chado, on Windows but most Chado installations are found
on some version of Unix - you'll probably get the best support by
choosing Unix. (See [Databases and
GMOD](Databases_and_GMOD "Databases and GMOD") for more discussion.)
Once you've installed your RDBMS you can install Chado.

  

### Download a Stable Release of Chado

See [Downloads](Downloads "Downloads")

  

### Chado From SVN

You can get the most up-to-date, not even released yet, version of Chado
from <a href="Subversion" class="mw-redirect"
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
  HOWTO](Load_RefSeq_Into_Chado "Load RefSeq Into Chado")
- [Load GFF into Chado HOWTO](Load_GFF_Into_Chado "Load GFF Into Chado")
- Using [XORT](XORT.1 "XORT")

You can also use the application [Apollo](Apollo.1 "Apollo") to curate
data in Chado.

## Mailing Lists

|  |  |  |  |
|----|----|----|----|
|  | Mailing List Link | Description | Archive(s) |
| <a href="Chado" class="mw-redirect" title="Chado">Chado</a> | <a href="https://lists.sourceforge.net/lists/listinfo/gmod-schema"
class="external text" rel="nofollow">gmod-schema</a> | All issues regarding <a href="Chado" class="mw-redirect" title="Chado">Chado</a>, [Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI"), and [Bio%253A%253AChado%253A%253ASchema](Bio%253A%253AChado%253A%253ASchema "Bio%253A%253AChado%253A%253ASchema") | <a href="http://dir.gmane.org/gmane.science.biology.gmod.schema"
class="external text" rel="nofollow">Gmane</a>, <a href="http://gmod.827538.n3.nabble.com/Chado-f815597.html"
class="external text" rel="nofollow">Nabble (2010/05+)</a>, <a
href="http://sourceforge.net/mailarchive/forum.php?forum_name=gmod-schema"
class="external text" rel="nofollow">Sourceforge</a> |
|  | <a href="https://lists.sourceforge.net/lists/listinfo/gmod-schema-cmts"
class="external text" rel="nofollow">gmod-schema-cmts</a> | <a href="Chado" class="mw-redirect" title="Chado">Chado</a> code updates. | <a
href="http://sourceforge.net/mailarchive/forum.php?forum_name=gmod-schema-cmts"
class="external text" rel="nofollow">Sourceforge</a> |

## Pronunciation

*Chado* is usually pronounced
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e4/Chado.mp3" class="internal"
title="Chado.mp3">like this</a>.

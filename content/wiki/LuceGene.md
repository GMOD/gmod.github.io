---
title: "LuceGene"
---
# LuceGene

  Description](#Description)
  - [EBI's
    EB-eye](#EBI.27s_EB-eye)
  - [Lucene
    search at Uniprot](#Lucene_search_at_Uniprot)
- [Demo &
  Screenshots](#Demo_.26_Screenshots)
- [Requirements](#Requirements)
- [Documentation](#Documentation)
- [Downloads](#Downloads)
- [Contact](#Contact)

## Description

This is an open-source document/object search and retrieval system
specially tuned for bioinformatics text databases and documents.
LuceGene is similar in concept to the widely used, commercially
successful, bioinformatics program SRS (Sequence Retrieval System).

It is built with the
<a href="http://jakarta.apache.org/lucene/" class="external text"

It includes common text search features: booleans, phrases, word
stemming, fuzzy and field range searches, relevance ranking. It supports
data field structure of many kinds. Lucene is comparable to web-indexing
systems such as Exite, Alta-vista, and Google.

LuceGene adds these bio-data methods to Lucene:

- Indexing adaptors for formats such as XML, PDF Documents,
  Biosequences, Spreadsheets, HTML, and others.
- Configurations for bio-data include UniProt/Swiss-Prot, Fasta and
  GenBank sequences, BIND protein interactions, NCBI Gene Expression
  Omnibus, BLAST output tables, Medline.
- Support for batch-list look-ups and searches is included, useful for
  data miners.
- Web applications offer paged search results, batch downloads, search
  refinement and search-linking among data libraries.
- Web Services support for data mining is included with a SOAP
  interface.
- Output support includes field selection and formats such as
  Spreadsheet, XML, HTML via XSLT, and others.

LuceGene is speedy with big data sets: Searching the UniProt library of
1.7 million sequences with LuceGene is a close equivalent to SRS in
speed and content. Gene Annotation object search and retrieval with
LuceGene is 10x to 20x faster than using a Postgres Chado database.
LuceGene has been tested and works well with millions of documents from
genome sequence, annotation and literature databases.

Others are noticing that Chado-database user searches, whether for
genome maps, reports, or other complex data, can be quite slow. Chado is
a good management database, but lacks efficiency for web access to
support many customers. Lucene has the ability to search genome reports,
the range of bio-data (XML, sequence records, interaction data sets),
GBrowse map data, etc.

There is also a GBrowse-Lucene adaptor as part of the LuceGene project
software (which works like the Mysql adaptor).

The GMOD/Turnkey web interface now has a Lucene search to avoid slow
ChadoDB queries.

### EBI's EB-eye

Please note that
<a href="http://www.ebi.ac.uk/inc/help/search_help.html"
class="external text" rel="nofollow">EBI's new search-everything
EB-eye</a> is based on Lucene, like LuceGene: it is fast, and works
easily and well on huge, complex bio-data sets:

*EMBL-EBI News Dec 2006: Better, faster, easier EMBL-EBI launches its
new website with powerful search engine*

*Behind this new web interface lies the EB-eye, a powerful search engine
allowing instant searches of all the EBI's databases from a single
query.*

*What is the EB-eye Search? The system is developed on top of the Apache
Lucene project framework, which is an Open-source, high-performance,
full-featured text search engine library written entirely in Java. It
uses this technology to index EBI databases in various formats (e.g.
flatfiles, XML dumps, OBO format, etc.) and provides very fast access to
the EBI's data resources. The system allows the user to search globally
across all EBI databases or individually in selected resources by using
an Advance search.*

### Lucene search at Uniprot

Uniprot's new version (2007) also uses Lucene as it's
search-all-proteins system. See it in action at
<a href="http://www.uniprot.org/" class="external free"

## Demo & Screenshots

- [Demo Screenshots](/wiki/LuceGene_Screenshots)
- Daphnia genome search
  <a href="http://wfleabase.org/lucegene" class="external free"
  rel="nofollow">http://wfleabase.org/lucegene</a>
  - newly updated with full Daphnia genome, see notes at
    [LuceGene_for_Daphnia_genome](/wiki/LuceGene_for_Daphnia_genome)

[Dongilbert](/wiki/User:Dongilbert) 16:25, 4 September 2007
(EDT)

- Demonstration server is available at
  <a href="http://eugenes.org/demolucegene/" class="external free"
  rel="nofollow">http://eugenes.org/demolucegene/</a>
- euGenes genome search
  <a href="http://eugenes.org/lucegene/" class="external free"
  rel="nofollow">http://eugenes.org/lucegene/</a>
- FlyBase Search preview
  <a href="http://chipmunk.bio.indiana.edu:7082/lucegene/"
  class="external free"
  rel="nofollow">http://chipmunk.bio.indiana.edu:7082/lucegene/</a>

## Requirements

- LuceGene requires Java versions 1.4 or later to compile and run.
- A Java/JSP web server like
  <a href="http://tomcat.apache.org/" class="external text"
  rel="nofollow">Jakarta Tomcat</a> is used for the web application.

Jakarta Lucene software is included with this package, as are other
required java libraries.

## Documentation

- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fc/Lucegene-readme.txt" class="internal"
  title="Lucegene-readme.txt">LuceGene README</a>
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fd/Lucegene-index-overview.txt"
  class="internal" title="Lucegene-index-overview.txt">Indexing methods
  overview</a>
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/07/Gmod-argos-sep03.pdf" class="internal"
  title="Gmod-argos-sep03.pdf">Talk slides on Argos/LuceGene, Sept
  2003</a>

## Downloads

Current distribution files are at <a
href="http://sourceforge.net/project/showfiles.php?group_id=27707&amp;package_id=120452"
class="external text" rel="nofollow">SourceForge</a> and
<a href="http://eugenes.org/gmod/lucegene/" class="external free"

- <a href="http://prdownloads.sourceforge.net/gmod/lucegene.war"
  class="external text" rel="nofollow">lucegene.war</a>: web application
  archive
- lucegene-\*-src.jar : sources, documents, configurations
- <a href="http://eugenes.org/gmod/lucegene/dist/" class="external text"
  rel="nofollow">sample data</a> for lucegene.war as lucegene_demo\*.zip
- <a href="http://eugenes.org/gmod/genomeview-package2008/"
  class="external text" rel="nofollow">Genome Viewer package</a> Lucene
  is packaged here with GBrowse as a genome viewing system
  (platform-independent) that has minimal installation/configuration
  requirements. Also included are the several organism genome data sets
  provided thru euGenes.org (Drosophila, Daphnia, Nasonia and others).

## Contact

- email: lucegene AT eugenes.org
  Current developers: Don Gilbert, Paul Poole, and others

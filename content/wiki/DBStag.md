---
title: "DBStag"
---
# DBStag

DBStag is a generic [SQL](Glossary#SQL "Glossary") to
[XML](Glossary#XML "Glossary") mapping tool

  Download](#Download)
- [Use](#Use)
  - [Loading
    data](#Loading_data)
  - [Querying](#Querying)

## Download

- <a href="http://search.cpan.org/~cmungall/DBIx-DBStag/"
  class="external text" rel="nofollow">CPAN</a>

## Use

### Loading data

The most common use in the context of Chado is to load [Chado
XML](Chado_XML "Chado XML"). No configuration is necessary, just install
and run

     stag-storenode.pl -d Pg:mychadoinst@myserver gene_ontology.chado

### Querying

A secondary use is a means of data retrieval. DBStag can be used to
query <a href="Chado" class="mw-redirect" title="Chado">Chado</a> using
multi-table joins with the results automatically nested.

Chado <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/schema/trunk/chado/stag-templates/"
class="external text" rel="nofollow">comes with some templates</a> that
can be used with Stag.

Example:

     selectall_xml.pl -d Pg:mychadoinst@myserver /chado-cvterm dbname=GO accession=0008150

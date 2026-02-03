---
title: "Hackathon wikidb"
---
# Hackathon wikidb


  wikidb components</span>](#Hackathon_wikidb_components)
  - [genome
    wiki templates](#genome_wiki_templates)
    - [gene
      page template (simple)](#gene_page_template_.28simple.29)
    - [gene
      info table template](#gene_info_table_template)
  - [loadwiki.php](#loadwiki.php)
    - [Initial version](#Initial_version)
  - [loadwiki
    format2](#loadwiki_format2)
    - [format
      notes](#format_notes)
- [Planned
  outcome](#Planned_outcome)
- [Genome wiki
  from chado notes](#Genome_wiki_from_chado_notes)


# Hackathon wikidb components

- middleware parts:
  - Chado to wiki:
    - modware to select gene attributes by gene name, print genes as
      wiki-string; Eric
    - wikiloader to add to create gene page, select gene page/table
      template, add gene wiki-string; Jim
  - Wiki to Chado:
    - XORT/chado xml scripts to load output of wiki/wikidb tables to
      chado; Josh
    - MODware to load output of wiki/wikidb tables to chado; Eric

## genome wiki templates

This use of chado to wiki is dependent on prepared templates in wiki to
handle gene page formatting and tables of gene information within the
pages. There can be several templates designed for a genome project, so
we want to store logic for populating these from chado db inside each
template. This will include metadata (not displayed) that middleware can
use to format data for each wiki template. Example templates are found
from a wiki via Special,All Pages, category Templates. We will add a set
of common gene page templates for this example.

### gene page template (simple)

    (there was a mediawiki template here)

    ==Notes==

    ==References==
    <references/>

### gene info table template

\<headings\> Gene name\|\|gene_name Description\|\|description
Synonyms\|\|synonyms \</headings\> \<type\>1\</type\>
\<heading_style\>heading_style link\<heading_style\>
\<table_style\>Prettytable link\</table_style\>

## loadwiki.php

### Initial version

     usage: php loadwiki.php -p page_template -t table_template -f input_filename
     page_template == gene page template for wiki
     table_template == table edit template inside gene page
     input_filename == gene data in wiki-string format

input file (one line, for wiki table with '\|\|' delimiters for wiki
table columns)

     sadA    sadA||EGF repeat-containing 9 transmembrane molecule involved in substrate adhesion.||Jim, Don

or

     $gene_name."\t".$gene_name.'||'.$description.'||'.$synonym_string."\n";

We plan to extend the above to work with a fuller gene 'page' of output
from chado. This will use one common wiki Template:gene_page. This page
template will have information linking the chado table output fields
with the gene wiki table templates.

## loadwiki format2

Extending the above format to handle many table templates, and page
template, per row of data information.

    pagename [tab] page_template [tab] table_template [tab] row_data (wiki-string) [tab] metadata [return]
    sadA \t  gene \t gene_basics \t sadA||EGF repeat-containing 9 transmembrane molecule involved in substrate adhesion.||sadA-like,sadA-by-another-name \t metastring \n
    sadA \t gene \t gene_location \t gene-location-wiki-string \t metastring \n
    sadA \t gene \t gene_function \t gene-function-value-string \t metastring \n
    notA \t gene \t gene_basics \t notA||Another gene ...

### format notes

The page and table templates are storeed in wiki, and can be accessed
via url to wiki/Special:Export/Template:page_template, or via other wiki
php tools. For GMOD gene pages and tables, we would like to include a
mapping of chado fields to/from wiki table fields. THat whey the
wiki-string in above exchange table can be generated if need by by
inspection of the template pages.

# Planned outcome

Simple example to collect gene(s) information from Chado db, produce
intermediate Wiki-text file (script 1). This is then loaded into
Mediawiki database with gene page templates (script 2). Community folks
edit the genes thru Table Edit mechanism as desired. Then updated gene
info is dumped (from mysql wikidb), converted to chado xml, then loaded
into Chado with transaction update checks, via XORT (script 3).

# Genome wiki from chado notes

\- From hackathon

- tasks:
  - locate sample chado data (some format) for some genes w/ attributes
  - convert to some format suited to wiki loading (as wiki xml?)
    - dump table via Chado SQL;
     see e.g. http://eugenes.org/gmod/genbank2chado/conf/v_genepage3.sql

- - - via xml/xslt transforms
    - via XORT perl parser
    - other
- - load to wiki
        >> this is larger;loading into wikipedia db via wikipedia.xml

- - dump wiki table edit (mysql db)
- - convert to chado xml (? xml transforms)
      ** flybase harvard has scripts for general bulk data to chado.xml

- options:
  - use chado sql view/procedure to dump tables suited to wikibox_db ?
  - easier


[Category](Special%253ACategories "Special%253ACategories"):

- [TableEdit](Category%253ATableEdit "Category%253ATableEdit")

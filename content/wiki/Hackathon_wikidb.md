---
title: "Hackathon wikidb"
---




<span id="top"></span>


# <span dir="auto">Hackathon wikidb</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Hackathon
  wikidb components</span>](#Hackathon_wikidb_components)
  - [<span class="tocnumber">1.1</span> <span class="toctext">genome
    wiki templates</span>](#genome_wiki_templates)
    - [<span class="tocnumber">1.1.1</span> <span class="toctext">gene
      page template (simple)</span>](#gene_page_template_.28simple.29)
    - [<span class="tocnumber">1.1.2</span> <span class="toctext">gene
      info table template</span>](#gene_info_table_template)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">loadwiki.php</span>](#loadwiki.php)
    - [<span class="tocnumber">1.2.1</span>
      <span class="toctext">Initial version</span>](#Initial_version)
  - [<span class="tocnumber">1.3</span> <span class="toctext">loadwiki
    format2</span>](#loadwiki_format2)
    - [<span class="tocnumber">1.3.1</span> <span class="toctext">format
      notes</span>](#format_notes)
- [<span class="tocnumber">2</span> <span class="toctext">Planned
  outcome</span>](#Planned_outcome)
- [<span class="tocnumber">3</span> <span class="toctext">Genome wiki
  from chado notes</span>](#Genome_wiki_from_chado_notes)



# <span id="Hackathon_wikidb_components" class="mw-headline">Hackathon wikidb components</span>

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

## <span id="genome_wiki_templates" class="mw-headline">genome wiki templates</span>

This use of chado to wiki is dependent on prepared templates in wiki to
handle gene page formatting and tables of gene information within the
pages. There can be several templates designed for a genome project, so
we want to store logic for populating these from chado db inside each
template. This will include metadata (not displayed) that middleware can
use to format data for each wiki template. Example templates are found
from a wiki via Special,All Pages, category Templates. We will add a set
of common gene page templates for this example.

### <span id="gene_page_template_.28simple.29" class="mw-headline">gene page template (simple)</span>

    (there was a mediawiki template here)

    ==Notes==

    ==References==
    <references/>

### <span id="gene_info_table_template" class="mw-headline">gene info table template</span>

\<headings\> Gene name\|\|gene_name Description\|\|description
Synonyms\|\|synonyms \</headings\> \<type\>1\</type\>
\<heading_style\>heading_style link\<heading_style\>
\<table_style\>Prettytable link\</table_style\>

## <span id="loadwiki.php" class="mw-headline">loadwiki.php</span>

### <span id="Initial_version" class="mw-headline">Initial version</span>

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

## <span id="loadwiki_format2" class="mw-headline">loadwiki format2</span>

Extending the above format to handle many table templates, and page
template, per row of data information.

    pagename [tab] page_template [tab] table_template [tab] row_data (wiki-string) [tab] metadata [return]
    sadA \t  gene \t gene_basics \t sadA||EGF repeat-containing 9 transmembrane molecule involved in substrate adhesion.||sadA-like,sadA-by-another-name \t metastring \n
    sadA \t gene \t gene_location \t gene-location-wiki-string \t metastring \n
    sadA \t gene \t gene_function \t gene-function-value-string \t metastring \n
    notA \t gene \t gene_basics \t notA||Another gene ...

### <span id="format_notes" class="mw-headline">format notes</span>

The page and table templates are storeed in wiki, and can be accessed
via url to wiki/Special:Export/Template:page_template, or via other wiki
php tools. For GMOD gene pages and tables, we would like to include a
mapping of chado fields to/from wiki table fields. THat whey the
wiki-string in above exchange table can be generated if need by by
inspection of the template pages.

# <span id="Planned_outcome" class="mw-headline">Planned outcome</span>

Simple example to collect gene(s) information from Chado db, produce
intermediate Wiki-text file (script 1). This is then loaded into
Mediawiki database with gene page templates (script 2). Community folks
edit the genes thru Table Edit mechanism as desired. Then updated gene
info is dumped (from mysql wikidb), converted to chado xml, then loaded
into Chado with transaction update checks, via XORT (script 3).

# <span id="Genome_wiki_from_chado_notes" class="mw-headline">Genome wiki from chado notes</span>

\- From hackathon

- tasks:
  - locate sample chado data (some format) for some genes w/ attributes
  - convert to some format suited to wiki loading (as wiki xml?)
    - dump table via Chado SQL;

<!-- -->

     see e.g. http://eugenes.org/gmod/genbank2chado/conf/v_genepage3.sql

- - - via xml/xslt transforms
    - via XORT perl parser
    - other

<!-- -->

- - load to wiki

<!-- -->

        >> this is larger;loading into wikipedia db via wikipedia.xml

- - dump wiki table edit (mysql db)

<!-- -->

- - convert to chado xml (? xml transforms)

<!-- -->

      ** flybase harvard has scripts for general bulk data to chado.xml

- options:
  - use chado sql view/procedure to dump tables suited to wikibox_db ?
  - easier




[Category](Special%253ACategories "Special%253ACategories"):

- [TableEdit](Category%253ATableEdit "Category%253ATableEdit")






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



- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Hackathon_wikidb" rel="smw-browse">Browse
  properties</a></span>





- <span id="footer-info-lastmod">Last updated at 01:23 on 10 December 2009.</span>
<!-- - <span id="footer-info-viewcount">29,522 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->



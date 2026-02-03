---
title: "TableEdit"
---




<span id="top"></span>




# <span dir="auto">TableEdit</span>





(Redirected from [Table
Editor](Table_Editor)








## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Genome
  community annotation with a MediaWiki
  wiki</span>](#Genome_community_annotation_with_a_MediaWiki_wiki)
- [<span class="tocnumber">2</span> <span class="toctext">Table
  Edit</span>](#Table_Edit)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Source
    code</span>](#Source_code)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Object
    classes</span>](#Object_classes)
    - [<span class="tocnumber">2.2.1</span>
      <span class="toctext">wikiBox</span>](#wikiBox)
    - [<span class="tocnumber">2.2.2</span>
      <span class="toctext">wikiBoxRow</span>](#wikiBoxRow)
    - [<span class="tocnumber">2.2.3</span>
      <span class="toctext">TableEdit</span>](#TableEdit)
- [<span class="tocnumber">3</span> <span class="toctext">Table Edit at
  EcoliWiki</span>](#Table_Edit_at_EcoliWiki)
- [<span class="tocnumber">4</span> <span class="toctext">Table Edit at
  Hackathon 2007</span>](#Table_Edit_at_Hackathon_2007)
  - [<span class="tocnumber">4.1</span> <span class="toctext">TableEdit
    Chado round trip</span>](#TableEdit_Chado_round_trip)
    - [<span class="tocnumber">4.1.1</span>
      <span class="toctext">Chado2TableEdit</span>](#Chado2TableEdit)
    - [<span class="tocnumber">4.1.2</span>
      <span class="toctext">TableEdit2Chado</span>](#TableEdit2Chado)
    - [<span class="tocnumber">4.1.3</span>
      <span class="toctext">Bidirectional
      issues</span>](#Bidirectional_issues)
  - [<span class="tocnumber">4.2</span> <span class="toctext">TableEdit
    IntraWiki Interaction</span>](#TableEdit_IntraWiki_Interaction)
  - [<span class="tocnumber">4.3</span>
    <span class="toctext">Restricting search to
    Tables</span>](#Restricting_search_to_Tables)
  - [<span class="tocnumber">4.4</span>
    <span class="toctext">AJAX</span>](#AJAX)
  - [<span class="tocnumber">4.5</span> <span class="toctext">Other
    TableEdit enhancements</span>](#Other_TableEdit_enhancements)


## <span id="Genome_community_annotation_with_a_MediaWiki_wiki" class="mw-headline">Genome community annotation with a MediaWiki wiki</span>

<a href="http://ecoliwiki.net/colipedia/" class="external text"
rel="nofollow">Ecoliwiki</a> is providing detailed gene reports in a
community editable form. One goal for this with GMOD is to integrate
annotations made in
<a href="http://mediawiki.org" class="external text">MediaWiki</a> with
a <a href="Chado" class="mw-redirect" title="Chado">Chado</a> database
for better comprehensive genome data management. MediaWiki is a widely
used wiki package and the one that backs the GMOD site,
<a href="http://ecoliwiki.net/colipedia/" class="external text"
rel="nofollow">Ecoliwiki</a>, and
<a href="http://wikipedia.org" class="external text"
rel="nofollow">Wikipedia</a>). MediaWiki is also included in the
[Community Annotation
System](Community_Annotation_System "Community Annotation System").

## <span id="Table_Edit" class="mw-headline">Table Edit</span>

Ecoliwiki's
<a href="http://ecoliwiki.net/colipedia/index.php/Special:TableEdit"
class="external text" rel="nofollow">Table Edit</a> is the core for this
gene-oriented [community
annotation](Category%253ACommunity_Annotation "Category%253ACommunity Annotation")
database. TableEdit provides a somewhat more friendly way to edit simple
tables in
<a href="http://mediawiki.org" class="external text">MediaWiki</a>.
TableEdit tables show up in a page with their own Edit link. Users who
have editing privileges can add rows and columns, rename headings, and
change the style of the headings row using a GUI, rather than
<a href="http://www.mediawiki.org/wiki/Help:Tables"
class="external text">MediaWiki's table markup</a>, which can be a
challenge to read and update.

### <span id="Source_code" class="mw-headline">Source code</span>

The TableEdit code is at
<a href="http://www.mediawiki.org/wiki/Extension:TableEdit"
class="external free">http://www.mediawiki.org/wiki/Extension:TableEdit</a>

The basic infrastructure is based on two PHP object classes, `wikiBox`
and `TableEdit`. The `wikiBox` object class is defined by
`class.wikiBox.php `in the TableEdit distribution.

### <span id="Object_classes" class="mw-headline">Object classes</span>

#### <span id="wikiBox" class="mw-headline">`wikiBox`</span>

A `wikiBox` object consists of a series of attributes that control the
behavior and appearance of the table and a collection of row objects
that hold the actual data. The `wikiBox` also has methods to manipulate
rows, <a href="http://en.wikipedia.org/wiki/Serialization" class="extiw"
title="wp:Serialization">serialize and unserialize</a> its contents, and
for interacting with the [MySQL](MySQL "MySQL") database that controls
the tables.

#### <span id="wikiBoxRow" class="mw-headline">`wikiBoxRow`</span>

A `wikiBoxRow` object holds the actual data. This is also defined in
`class.wikiBox.php`. The `wikiBoxRow` has methods for loading and saving
etc.

#### <span id="TableEdit" class="mw-headline">`TableEdit`</span>

class `TableEdit` is defined in `SpecialTableEdit.body.php` and is an
extension of the
<a href="http://svn.wikimedia.org/doc/classSpecialPage.html"
class="external text" rel="nofollow">MediaWiki <code>SpecialPage</code>
class</a>. However, it can be invoked without generating a special page
to handle interactions between `wikiBox`es and Article objects in
MediaWiki.

## <span id="Table_Edit_at_EcoliWiki" class="mw-headline">Table Edit at EcoliWiki</span>

In constructing the first release of
<a href="http://ecoliwiki.net/colipedia/" class="external text"
rel="nofollow">EcoliWiki</a>, we built PHP scripts to load and/or update
tables. This involved writing functions that find the `box_uid` of
tables of specific types on specific pages, looking for the rows that
needed updating, creating them if they did not already exist, and either
incorporating the table markup into an [XML](Glossary#XML "Glossary")
load file for the wiki, or directly editing the page via <a
href="http://www.mediawiki.org/wiki/Manual:Maintenance_scripts#List_of_maintenance_scripts#List_of_maintenance_scripts"
class="external text">MediaWiki's command line utilities</a>.

Here is a code snippet from a wrapper script


``` de1
foreach ($genes as $gene){
        $gene_count++;
        $gene_name = $gene['feature_name'];
 
        # require something that finds the desired page and table and edits it
        require "$bot_dir/colimod_colipedia/modify_tables/test_modify.php";
         if ($box){
                $tableEdit = new TableEdit();
                $title = Title::newFromID($box->page_uid);
                $tableEdit->save_to_page($title, $box);
                unset($box);
        }
 }
```


`test_modify.php` corrected a typo introduced by an earlier load, where
a double \|\| was needed instead of a single \| after a PMID. The
metadata is data associated with a row that is not displayed on the
page. I use this to identify rows that have been used to store a
particular kind of content. In this case, it's rows in an allele table
that describe the availability of knockouts from a strain collection
from Hirotada Mori's lab.


``` de1
<?php
# example for modifying box without rebuilding the whole page.  This example does not use metadata matching or conflict catching
$page_name = "$gene_name:Gene_Product(s)";
$template = "Gene_allele_table";
echo "$page_name\t $template\n";
$box_id = get_wikibox_id($page_name, $template);
$box_uid = get_wikibox_uid($box_id);
$box = new wikiBox();
$box->box_uid = $box_uid;
$box->template = $template;
$box->set_from_DB();
$metadata = 'keio';
$uid = 0;
$rows = get_wikibox_rows($box, $uid, $metadata);
foreach ($rows as $index=>$row){
       $box->rows[$index]->row_data = preg_replace("/16738554\|\[/","16738554||[", $box->rows[$index]->row_data);
        $box->rows[$index]->db_save_row();
}
?>
```


## <span id="Table_Edit_at_Hackathon_2007" class="mw-headline">Table Edit at Hackathon 2007</span>

Making the Table Editor more useful and integrating it better with other
GMOD tools was our goal for the wiki part of [Hackathon
2007](Hackathon_2007_info "Hackathon 2007 info"). See [Possible
TableEdit/Wiki hackathon
projects](Talk%253AHackathon_2007_info#Possible_TableEdit.2FWiki_hackathon_projects "Talk:Hackathon 2007 info")
for more.

### <span id="TableEdit_Chado_round_trip" class="mw-headline">TableEdit Chado round trip</span>

Integration with
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> will require
that TableEdit tables reflect data from an underlying Chado, and also
that changes made in a TableEdit table be saved back to the underlying
Chado. In both directions there are issues about how to handle
situations where the modifications on one end might cause loss or
corruption of data in the other.

#### <span id="Chado2TableEdit" class="mw-headline">Chado2TableEdit</span>

This would involve:

- Something triggering a
  <a href="Chado" class="mw-redirect" title="Chado">Chado</a> query that
  would generate a view or join with sufficient information to determine
  the desired page, table (box) and row to be added or updated.
- Creating an <a href="TableEdit/IFALT" class="mw-redirect"
  title="TableEdit/IFALT">IFALT</a> file for loading into the wiki via
  the TableEdit loader system.
- Instantiating a box and TableEdit as in the EcoliWiki example above,
  and saving the table back to the page.

Based on our already being able to do table insertion, row creation, row
updates, and row deletion, this should be a relatively simple task of
getting [middleware](Category%253AMiddleware "Category%253AMiddleware") to have
Chado provide data in a form that the TableEdit can use.

#### <span id="TableEdit2Chado" class="mw-headline">TableEdit2Chado</span>

This would involve:

- Passing a request to the TableEdit/Wiki system to identify tables/rows
  with information needed to populate/update fields in
  <a href="Chado" class="mw-redirect" title="Chado">Chado</a>.
- Returning the data in a format that can be transformed to something
  Chado \[\[[middleware](Category%253AMiddleware "Category%253AMiddleware") can
  use.

This is a specific case of the general problem discussed at the [Jan
2007 GMOD workshop](GMOD_Middleware "GMOD Middleware") - how to
transform data to update Chado where the structure of the incoming data
has to be manipulated to fit the Chado
[schema](Glossary#Schema "Glossary").

#### <span id="Bidirectional_issues" class="mw-headline">Bidirectional issues</span>

Some issues to discuss:

- If the desired table does not already exist, should it be created, or
  should the process throw an error?
- how should the system check for whether a row should be updated or
  created?
- how should we pass these requests and send confirmation messages to
  and from remote servers (i.e can we do this as a web service?). This
  would allow interaction with non-PHP
  [middleware](Category%253AMiddleware "Category%253AMiddleware") (highly
  desirable!).

### <span id="TableEdit_IntraWiki_Interaction" class="mw-headline">TableEdit IntraWiki Interaction</span>

Two or more tables in a wiki could be interconnected so that updating
the Table in page A triggers an update of the table in page B. Use case:
GO annotations on wiki pages. If round-trips work, this should fall out
of the code needed. It may then be possible to couple tables without an
intermediate trip to
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>.

### <span id="Restricting_search_to_Tables" class="mw-headline">Restricting search to Tables</span>

This one is relatively simple and we might have a prototype before the
[2007 Hackathon](Hackathon_2007_info "Hackathon 2007 info") - modify the
wiki search system to restrict searching to a particular class of tables
or fields.

### <span id="AJAX" class="mw-headline">AJAX</span>

There are many places where the TableEdit system would benefit from the
addition of [AJAX](Category%253AAJAX "Category%253AAJAX").

- General elimination of reloads
- Autocomplete fields
- other?

### <span id="Other_TableEdit_enhancements" class="mw-headline">Other TableEdit enhancements</span>

Many of the items above do not require changes to the core TableEdit
extension. But we can do that too during the [2007
Hackathon](Hackathon_2007_info "Hackathon 2007 info"), if there's time.
Some possible things to add or change

- recovery of data from old wiki revisions
- change to store the data in the wiki page in a more compact form.
- change how deleted rows are handled to allow restoration
- other?




[Categories](Special%253ACategories "Special%253ACategories"):

- [Community
  Annotation](Category%253ACommunity_Annotation "Category%253ACommunity Annotation")
- [GMOD Components](Category%253AGMOD_Components "Category%253AGMOD Components")
- [MOD User
  Interfaces](Category%253AMOD_User_Interfaces "Category%253AMOD User Interfaces")
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/TableEdit" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:12 on 9 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">99,662 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





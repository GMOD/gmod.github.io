



<span id="top"></span>


# <span dir="auto">Chado Schema Documentation HOWTO</span>









The <a href="Chado" class="mw-redirect" title="Chado">Chado</a> schema
documentation on this wiki is a mixture of generated content and
material directly entered by GMOD users into this wiki. The generated
part of the documentation consists of the table definitions that are
included on the [Chado module
pages](Template:ChadoModules "Template:ChadoModules") and on the [Chado
Tables](Chado_Tables "Chado Tables") page, listing all the tables in
Chado.

All of the table descriptions on [Chado module
pages](Template:ChadoModules "Template:ChadoModules") and the [Chado
Tables](Chado_Tables "Chado Tables") page are generated every time there
is a new release of Chado. The column and table details, including
comments, come from the [PostgreSQL](PostgreSQL "PostgreSQL") data
dictionary.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Using Module
  and Table Documentation</span>](#Using_Module_and_Table_Documentation)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Showing a
    Table Description</span>](#Showing_a_Table_Description)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Linking to
    Module Documentation</span>](#Linking_to_Module_Documentation)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Linking to
    Table Documentation</span>](#Linking_to_Table_Documentation)
- [<span class="tocnumber">2</span> <span class="toctext">Updating Table
  Documentation Part I</span>](#Updating_Table_Documentation_Part_I)
- [<span class="tocnumber">3</span> <span class="toctext">Updating
  Module and Table Documentation Part
  II</span>](#Updating_Module_and_Table_Documentation_Part_II)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Integrate
    New Comments Into SQL
    DDL</span>](#Integrate_New_Comments_Into_SQL_DDL)
  - [<span class="tocnumber">3.2</span> <span class="toctext">Regenerate
    Wiki Content</span>](#Regenerate_Wiki_Content)
  - [<span class="tocnumber">3.3</span> <span class="toctext">Push
    Regenerated Wiki Text to
    GMOD.org</span>](#Push_Regenerated_Wiki_Text_to_GMOD.org)
    - [<span class="tocnumber">3.3.1</span> <span class="toctext">Update
      Table Templates</span>](#Update_Table_Templates)
    - [<span class="tocnumber">3.3.2</span> <span class="toctext">Update
      Module Pages</span>](#Update_Module_Pages)
    - [<span class="tocnumber">3.3.3</span> <span class="toctext">Update
      Chado Tables Page</span>](#Update_Chado_Tables_Page)
- [<span class="tocnumber">4</span> <span class="toctext">Why is this
  complicated?</span>](#Why_is_this_complicated.3F)
- [<span class="tocnumber">5</span>
  <span class="toctext">Internals</span>](#Internals)
  - [<span class="tocnumber">5.1</span>
    <span class="toctext">wiki.tmpl</span>](#wiki.tmpl)



## <span id="Using_Module_and_Table_Documentation" class="mw-headline">Using Module and Table Documentation</span>

Add to this documentation that makes sense for markdown pages.

### <span id="Linking_to_Module_Documentation" class="mw-headline">Linking to Module Documentation</span>

Add to this documentation that makes sense for markdown pages.

### <span id="Linking_to_Table_Documentation" class="mw-headline">Linking to Table Documentation</span>

Add to this documentation that makes sense for markdown pages.

## <span id="Updating_Table_Documentation_Part_I" class="mw-headline">Updating Table Documentation Part I</span>

This vvv is what used to be done in mediawiki. I'm leaving it here for historical purposes.

_Chado Table Templates_ are the building blocks of the Chado schema
documentation. They are also auto-generated, and cannot be directly
updated by editing them on the wiki. Preventing editing of the templates
ensures that user updates are not just written over and lost the next
time the templates are auto-generated.

However, it is possible to update table documentation. It is a two-step
process and you must take the first step. Here's the recipe:

1.  Enter your update on the wiki.
    1.  Login to the wiki
    2.  Go to the [module
        page](Template:ChadoModules "Template:ChadoModules") for the
        module the table is in.
    3.  Click on the \[edit\] link to the right of the table you want to
        comment on.
    4.  Go to the edit window towards the bottom of the page, and add
        your comments below the section "Additional Comments"
    5.  Save the edits.
2.  The next time Chado is released, all the module pages will be
    reviewed for any comments that have been added since the last
    update.
    1.  New comments will be added to the Chado SQL table definitions
        (and probably dropped from the "Additional Comments" sections).
    2.  The table documentation will be regenerated and reposted to the
        wiki as part of the Chado release.

See [Updating Table Documentation Part
II](#Updating_Table_Documentation_Part_II) for more on how step \#2 is
done.

## <span id="Updating_Module_and_Table_Documentation_Part_II" class="mw-headline">Updating Module and Table Documentation Part II</span>

Table Templates are themselves a nest of smaller MediaWiki templates.
This means it's hard to figure out how the wiki decides what to show.
However, all this complexity doesn't really matter to the wiki user or
even to the wiki editor. It is all auto-generated, and it is never
directly updated using the wiki interface. The upside of this complexity
is that it is easy to change the appearance of all Chado tables in the
wiki. All you do is modify the appropriate template.

This section describes how to regenerate the Table Templates from a live
Chado database as part of creating a new release of Chado. **If you are
not creating a Chado release, or not a GMOD web site manager, then you
don't care about this section.**

This step is itself a multistep process:

1.  Integrate new comments on module pages with comments in the SQL
    schema.
2.  Regenerate the wiki content
3.  Push new wiki content to GMOD.org.

### <span id="Integrate_New_Comments_Into_SQL_DDL" class="mw-headline">Integrate New Comments Into SQL DDL</span>

This step involves walking through all the [Chado Module
pages](Template:ChadoModules "Template:ChadoModules"), looking at any
"Additional Comments" that have been added since the last Chado release,
and then integrating them with the comments in the SQL DDL definitions
of the tables. Integrated comments should then be removed from the
module pages.

### <span id="Regenerate_Wiki_Content" class="mw-headline">Regenerate Wiki Content</span>

Next regenerate the wiki content after you have created a Chado instance
using the newly updated SQL. This is done with scripts in the Chado
source tree:

    cd chado/doc/wiki

Edit `generateChadoWikiTables.py` and update any of these variables that
you need to:


```de1
# UPDATE THESE 4 BEFORE RUNNING THE PROGRAM.
DB_NAME           = "testdb"
DB_USER           = "gmodhack"
MODULE_TABLE_PATH = "../../modules/module-tables.json"
WIKI_DIR          = "/tmp/ChadoWikiFiles"
```


Before you can run this script, make sure that the `postgresql_autodoc`
package is installed. The script won't run without it. Now run:

    $ ./generateChadoWikiTables.py
    Producing testdb.wiki from ./wiki.tmpl
    $

**Note:** This script will run for a _looong_ time. It takes 18 minutes
on my laptop.

This script places generated wiki content in the `WIKI_DIR` directory,
which by default is `/tmp/ChadoWikiFiles/`:



|                        |                                                                                                                                             |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `/tmp/ChadoWikiFiles/` | Determined by what `WIKI_DIR` is set to.                                                                                                    |
| ` Modules/`            | Contains one file per module. These become the "Tables" sections of the [Chado module pages](Template:ChadoModules "Template:ChadoModules") |
| ` Tables/`             | Contains one file per table; these will become Table Templates.                                                                             |
| ` allTables.wiki`      | List of all tables; will become the module/table list on [Chado Tables](Chado_Tables "Chado Tables").                                       |



### <span id="Push_Regenerated_Wiki_Text_to_GMOD.org" class="mw-headline">Push Regenerated Wiki Text to GMOD.org</span>

Now we need to update the wiki itself. First tar/compress the directory
containing all the generated wiki files. Then copy it to the GMOD web
server and unpack it. You'll need shell access to the GMOD web server to
do this. Then update the three types of pages:

- Table Templates
- Module Pages
- [Chado Tables](Chado_Tables "Chado Tables") page

#### <span id="Update_Table_Templates" class="mw-headline">Update Table Templates</span>

On the GMOD web server create this script:


```de1
#!/usr/bin/python
# ===================
#
# Upload all the table templates to the GMOD wiki.
 
IMPORT_TEXT_FILE_PATH = "/var/www/html/w/maintenance/importTextFile.php"
TABLES_DIR = "Tables"
MW_USERNAME = "Your gmod.org MediaWiki Username.  e.g., 'Clements'"
COMMENT = "Table definition  for Chado Version a.b on yyyy/mm/dd"
 
import glob
import os
 
for tablePath in glob.glob(TABLES_DIR + "/*.wiki"):
    tableFile = os.path.split(tablePath)[1]
    tableName = tableFile.split(".")[0]
    command = (
        "/usr/bin/php " + IMPORT_TEXT_FILE_PATH +
        " --title 'Template:ChadoTable_" + tableName +
        "' --user '" + MW_USERNAME + "' --comment '" + COMMENT + "' " +
        tablePath)
    print(command)
    os.system(command)
```


Set `MW_USERNAME` and `COMMENT` appropriately. Also set `TABLES_DIR` to
be the relative path from the script to directory containing the Table
Templates.

This script uses the Mediawiki maintenance script
<a href="http://www.mediawiki.org/wiki/Manual:ImportTextFile.php"
class="external text"><code>ImportTextFile.php</code></a> to upload the
Table Templates.

#### <span id="Update_Module_Pages" class="mw-headline">Update Module Pages</span>

We don't yet have an automated way to synchronize the [module
pages](Template:ChadoModules "Template:ChadoModules") with the update.

The _first time_ this process is done (the process described on this
page), you'll probably want to do a wholesale replacement of the
"Tables" section of each page. This will replace the current hard-coded
table defs, with the Table Templates. It will also update the table list
to be current.

On subsequent updates, you will only need to touch the module pages if a
table was dropped or added. The Table Templates will take care of the
rest.

#### <span id="Update_Chado_Tables_Page" class="mw-headline">Update [Chado Tables](Chado_Tables "Chado Tables") Page</span>

The [Chado Tables](Chado_Tables "Chado Tables") page lists every table
defined in Chado. Replace this wholesale each time.

## <span id="Why_is_this_complicated.3F" class="mw-headline">Why is this complicated?</span>

With any programmatically generated wiki doc we've got conflicting goals:

1.  Keep the doc close to the source. In this case that means in the SQL
    table definitions
2.  Make that doc available on the wiki, where it is easy to find
3.  Keep the wiki doc in sync with the source doc.
4.  Allow users to use the wiki to update doc, and not have it be lost
    every time the wiki doc is regenerated.

We've tackled this for Chado with MediaWiki Templates:

1.  There's a template for each table. (e.g.,
    [Template:ChadoTable_cv](Template:ChadoTable_cv "Template:ChadoTable cv"))
2.  The templates are protected and can't be edited by regular wiki
    users (prevents lost updates)
3.  The [Chado Module
    pages](Template:ChadoModules "Template:ChadoModules") include the
    templates and clearly have a place for additional comments to be
    added. (Encourages updates without requiring SVN update access).
4.  Those comments can be incorporated into the SQL on the next Chado
    update, prior to regenerating the templates.
5.  The Chado Table templates are regenerated and reloaded for every
    Chado release.




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado Modules](Category%253AChado_Modules "Category%253AChado Modules")
- [Chado](Category%253AChado "Category%253AChado")
- [Wiki Tools](Category%253AWiki_Tools "Category%253AWiki Tools")






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



- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Schema_Documentation_HOWTO"
  rel="smw-browse">Browse properties</a></span>





- <span id="footer-info-lastmod">Last updated at 20:28 on 29 January 2013.</span>
<!-- - <span id="footer-info-viewcount">64,827 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->



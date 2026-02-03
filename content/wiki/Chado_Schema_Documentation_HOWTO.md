---
title: "Chado Schema Documentation HOWTO"
---
# Chado Schema Documentation HOWTO

The <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> schema
documentation on this wiki is a mixture of generated content and
material directly entered by GMOD users into this wiki. The generated
part of the documentation consists of the table definitions that are
included on the [Chado module
pages](/wiki/Template:ChadoModules) and on the [Chado
Tables](/wiki/Chado_Tables) page, listing all the tables in
Chado.

All of the table descriptions on [Chado module
pages](/wiki/Template:ChadoModules) and the [Chado
Tables](/wiki/Chado_Tables) page are generated every time there
is a new release of Chado. The column and table details, including
comments, come from the [PostgreSQL](/wiki/PostgreSQL) data
dictionary.

  and Table Documentation</span>](#Using_Module_and_Table_Documentation)
  - [Showing a
    Table Description](#Showing_a_Table_Description)
  - [Linking to
    Module Documentation](#Linking_to_Module_Documentation)
  - [Linking to
    Table Documentation](#Linking_to_Table_Documentation)
- [Updating Table
  Documentation Part I](#Updating_Table_Documentation_Part_I)
- [Updating
  Module and Table Documentation Part
  II](#Updating_Module_and_Table_Documentation_Part_II)
  - [Integrate
    New Comments Into SQL
    DDL](#Integrate_New_Comments_Into_SQL_DDL)
  - [Regenerate
    Wiki Content](#Regenerate_Wiki_Content)
  - [Push
    Regenerated Wiki Text to
    GMOD.org](#Push_Regenerated_Wiki_Text_to_GMOD.org)
    - [Update
      Table Templates](#Update_Table_Templates)
    - [Update
      Module Pages](#Update_Module_Pages)
    - [Update
      Chado Tables Page](#Update_Chado_Tables_Page)
- [Why is this
  complicated?](#Why_is_this_complicated.3F)
- [Internals](#Internals)
  - [wiki.tmpl](#wiki.tmpl)

## Using Module and Table Documentation

Add to this documentation that makes sense for markdown pages.

### Linking to Module Documentation

Add to this documentation that makes sense for markdown pages.

### Linking to Table Documentation

Add to this documentation that makes sense for markdown pages.

## Updating Table Documentation Part I

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
        page](/wiki/Template:ChadoModules) for the
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

## Updating Module and Table Documentation Part II

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

### Integrate New Comments Into SQL DDL

This step involves walking through all the [Chado Module
pages](/wiki/Template:ChadoModules), looking at any
"Additional Comments" that have been added since the last Chado release,
and then integrating them with the comments in the SQL DDL definitions
of the tables. Integrated comments should then be removed from the
module pages.

### Regenerate Wiki Content

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

| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | `/tmp/ChadoWikiFiles/` | Determined by what `WIKI_DIR` is set to.                                                                                                    | ` Modules/`            | Contains one file per module. These become the "Tables" sections of the [Chado module pages](/wiki/Template:ChadoModules) | ` Tables/`             | Contains one file per table; these will become Table Templates.                                                                             | ` allTables.wiki`      | List of all tables; will become the module/table list on [Chado Tables](/wiki/Chado_Tables).                                       |

### Push Regenerated Wiki Text to GMOD.org

Now we need to update the wiki itself. First tar/compress the directory
containing all the generated wiki files. Then copy it to the GMOD web
server and unpack it. You'll need shell access to the GMOD web server to
do this. Then update the three types of pages:

- Table Templates
- Module Pages
- [Chado Tables](/wiki/Chado_Tables) page

#### Update Table Templates

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

#### Update Module Pages

We don't yet have an automated way to synchronize the [module
pages](/wiki/Template:ChadoModules) with the update.

The _first time_ this process is done (the process described on this
page), you'll probably want to do a wholesale replacement of the
"Tables" section of each page. This will replace the current hard-coded
table defs, with the Table Templates. It will also update the table list
to be current.

On subsequent updates, you will only need to touch the module pages if a
table was dropped or added. The Table Templates will take care of the
rest.

#### Update [Chado Tables](/wiki/Chado_Tables) Page

The [Chado Tables](/wiki/Chado_Tables) page lists every table
defined in Chado. Replace this wholesale each time.

## Why is this complicated?

With any programmatically generated wiki doc we've got conflicting goals:

1.  Keep the doc close to the source. In this case that means in the SQL
    table definitions
2.  Make that doc available on the wiki, where it is easy to find
3.  Keep the wiki doc in sync with the source doc.
4.  Allow users to use the wiki to update doc, and not have it be lost
    every time the wiki doc is regenerated.

We've tackled this for Chado with MediaWiki Templates:

1.  There's a template for each table. (e.g.,
    [Template:ChadoTable_cv](/wiki/Template:ChadoTable_cv))
2.  The templates are protected and can't be edited by regular wiki
    users (prevents lost updates)
3.  The [Chado Module
    pages](/wiki/Template:ChadoModules) include the
    templates and clearly have a place for additional comments to be
    added. (Encourages updates without requiring SVN update access).
4.  Those comments can be incorporated into the SQL on the next Chado
    update, prior to regenerating the templates.
5.  The Chado Table templates are regenerated and reloaded for every
    Chado release.

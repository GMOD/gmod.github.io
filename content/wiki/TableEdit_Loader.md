---
title: "TableEdit Loader"
---




<span id="top"></span>




# <span dir="auto">TableEdit Loader</span>












## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Objective</span>](#Objective)
- [<span class="tocnumber">2</span>
  <span class="toctext">Location</span>](#Location)
- [<span class="tocnumber">3</span> <span class="toctext">Execution
  Syntax/ Usage</span>](#Execution_Syntax.2F_Usage)
  - [<span class="tocnumber">3.1</span>
    <span class="toctext">Options</span>](#Options)
  - [<span class="tocnumber">3.2</span> <span class="toctext">Public
    Methods/Properties</span>](#Public_Methods.2FProperties)
  - [<span class="tocnumber">3.3</span>
    <span class="toctext">Example</span>](#Example)
  - [<span class="tocnumber">3.4</span> <span class="toctext">running
    the script (loading information into the
    wiki)</span>](#running_the_script_.28loading_information_into_the_wiki.29)
- [<span class="tocnumber">4</span>
  <span class="toctext">I/O</span>](#I.2FO)
  - [<span class="tocnumber">4.1</span>
    <span class="toctext">Input</span>](#Input)
  - [<span class="tocnumber">4.2</span>
    <span class="toctext">Output</span>](#Output)
- [<span class="tocnumber">5</span>
  <span class="toctext">Notes</span>](#Notes)
  - [<span class="tocnumber">5.1</span> <span class="toctext">logic
    cases</span>](#logic_cases)
  - [<span class="tocnumber">5.2</span> <span class="toctext">How it
    works</span>](#How_it_works)
- [<span class="tocnumber">6</span> <span class="toctext">Code
  Examples</span>](#Code_Examples)
  - [<span class="tocnumber">6.1</span>
    <span class="toctext">do_misc_features</span>](#do_misc_features)
  - [<span class="tocnumber">6.2</span>
    <span class="toctext">appendRow</span>](#appendRow)
  - [<span class="tocnumber">6.3</span>
    <span class="toctext">mergeRows</span>](#mergeRows)
  - [<span class="tocnumber">6.4</span>
    <span class="toctext">clearOldRows</span>](#clearOldRows)


**Author** : *Daniel Renfro*

## <span id="Objective" class="mw-headline">Objective</span>

Introduced in version 0.8, the loader class houses methods to **load
data into tables in the wiki**.

## <span id="Location" class="mw-headline">Location</span>

Reading the page on Using
Subversion with the wikis is a good reference, you'll need some
background in SVN.

The loader currently resides in the SVN repository at
<a href="svn://tetramer.tamu.edu/wiki-extensions/trunk/TableEdit/"
class="external free"
rel="nofollow"><code>svn://tetramer.tamu.edu/wiki-extensions/trunk/TableEdit/</code></a>

## <span id="Execution_Syntax.2F_Usage" class="mw-headline">Execution Syntax/ Usage</span>

The loader is a PHP class which must be instantiated to use.

See the Example script below.

The loader has a few options that can be set in the instantiation code.

#### <span id="Options" class="mw-headline">Options</span>

| option | input value | explanation |
|----|----|----|
| *setVerbose()* | none | Will force the loader to tell you more about what is going on behind the scenes. It's not very pretty output because it is activating print statements throughout the code, but it *will* tell you more than normal. |
| *setUser()* | A valid Username from the wiki | This will use the given user's id as the owner of the loaded rows. It defaults to the `WikiEntryBot` user (which makes the rows public). |
| *debug()* | none | Tells the loader to go through all the steps of loading, but not actually do anything permanent. This has the effect of making things run much faster because the wiki isn't accessing the database to do writes. |
| *printInfo()* | true/false | Will print a few lines at the beginning of execution to tell you about what wiki and what user you're working with. |

#### <span id="Public_Methods.2FProperties" class="mw-headline">Public Methods/Properties</span>

| Name | Info | Code / Usage Ex. |
|----|----|----|
| `do_misc_features()` | This is where you put code to interpret things in the 7th column. To make a string that goes in that column use the PHP function `http_build_query()`. This string then gets cut up into an array by `parse_str()`. | code |
| `appendRow()` | This method takes care of when the incoming row gets appended to the box. | code |
| `mergeRows()` | This method gets called when a new row is trying to be merged into an existing box. It can be <a href="http://en.wikipedia.org/wiki/Overriding" class="external text"
rel="nofollow">overridden</a> to behave differently. | code |
| `clearOldRows()` | This method gets called with the flag "clear" gets put in the update_type field of IFALT (col 6.) It will delete all the rows in a box. Useful for emptying tables for reloads. | code |

### <span id="Example" class="mw-headline">Example</span>

TableEdit ships with a sample script, but I'll add it here, too. This is
a basic script which will:

1.  set up the wiki to be used ( by setting the variable \$wikidir)
2.  include the loader class ( by giving the right path to the loader
    class in the require_once())
3.  make an object from the loader class
4.  set up some options for the object (verbosity, etc)
5.  load info into the tables in the wiki ( by calling the method
    `loadFromFile()`)


``` de1
<?php
/* 
    Example loader script for TableEdit.
*/
 
// Setup to use the wiki from the command line
$options = getopt('w:');
if(isset($options['w'])){
    if( is_file($options['w'] . "/AdminSettings.php") ){
        require_once($options['w'] . "/maintenance/commandLine.inc");
    } else {
        die("Cannot find AdminSettings.php in {$options['w']}. Please check the paths.\n");
    }
} else {
    die("Please use the -w flag to set a path to the wiki.\n");
}
 
// Instantiate the object
    $loader = new TableEdit_Loader;
 
// set some options
    $loader->setVerbose();
    $loader->setUser()
    $loader->printInfo();
 
 
// load pretty much anything into tables from either an *.ifalt file.
    $loader->loadFromFile(array_pop($argv));
 
?>
```


### <span id="running_the_script_.28loading_information_into_the_wiki.29" class="mw-headline">running the script (loading information into the wiki)</span>

Once you have a script like above, with the right variables and paths,
you can then run that script to do the loading. In a command-line
window, browse to the path where your script lives, and run it using the
command

    php5 loader.sample.php /path/to/input_file

If you want to save the output into a file for later viewing, you can
*pipe* the output like so:

    php5 loader.sample.php >& output.txt

You can also separate the output based on STDOUT and STDERR with this
type of command:

    (php5 loader.sample.php > load.out) >& load.err

  

## <span id="I.2FO" class="mw-headline">I/O</span>

It takes a path to a [formatted input file](#input_types), and has a few
options.

### <span id="Input" class="mw-headline">Input</span>

The loader currently will accept one type of input:

1.  Ifalt format

### <span id="Output" class="mw-headline">Output</span>

On the commandline the loader will tell you what page it's working on.
It will print any error messages to STDERR.

  

## <span id="Notes" class="mw-headline">Notes</span>

#### <span id="logic_cases" class="mw-headline">logic cases</span>

There is a key method in the loader class which compares two rows. There
are four return values:

1.  *exact* : the two rows match data regardless of whitespace
2.  *disjoint* : the two rows are totally different
3.  *subset* : the old row is a subset of the new row
4.  *different* : they could have some common elements, but are regarded
    as different

Below is a table that explains these cases in more depth:



<table class="sortable" data-border="2" data-cellpadding="4"
data-cellspacing="0"
style="margin: 1em 1em 1em 0; background: #ffffff; border: 2px #aaa solid; border-collapse: collapse;">
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>The <em>new row</em> and the <em>old row</em> match
<strong>exactly</strong>.</p></td>
<td><pre><code>old = a | b | c | d | e
new = a | b | c | d | e</code></pre></td>
<td><ol>
<li>do nothing, as the data is the same</li>
<li>append <em>new row</em>, creating a duplicate</li>
</ol></td>
<td><p>A = B</p></td>
<td><p>true</p></td>
</tr>
<tr class="even">
<td><p>The <em>new row</em> is a <a
href="http://en.wikipedia.org/wiki/Subset" class="external text"
rel="nofollow">superset</a> of the <em>old row</em>.</p></td>
<td><pre><code>old = a | b |   |   | e
new = a | b | c | d | e</code></pre></td>
<td><ol>
<li>replace entire <em>old row</em> with <em>new row</em></li>
<li>merge the two rows, keeping the <em>old row</em> data and adding-in
the <em>new row</em> data to the blank fields.</li>
<li>append the <em>new row</em></li>
<li>throw a [[Category%253ANeedsManualCuration]]</li>
</ol></td>
<td><p>A is a subset of B</p></td>
<td><p>$new_row_obj</p></td>
</tr>
<tr class="odd">
<td><p>The <em>new row</em> and the <em>old row</em> dont' match at any
field.</p></td>
<td><pre><code>new = a | b | c | d | e
old = z | y | w | v | u</code></pre></td>
<td><ol>
<li>append row</li>
</ol></td>
<td><p>Pr(A ∩ B) = 0<br />
They are mutually exclusive.</p></td>
<td><p>false</p></td>
</tr>
<tr class="even">
<td><p>The <em>new row</em> only matches part of the <em>old
row</em>.</p></td>
<td><pre><code>new = a | b |   | k | e
old = a | g | h |   | e</code></pre></td>
<td><ol>
<li>do nothing
<ul>
<li>this leads to a problem -- it makes the loading of the data
<strong>dependent on line order in the Ifalt input file</strong></li>
</ul></li>
<li>append
<ul>
<li>this is a better solution, and can be made to through a
[[Category%253ANeeds Manual Curation]] tag</li>
</ul></li>
</ol></td>
<td><p>A ∩ B = ø<br />
They are disjoint.</p></td>
<td><p>false</p></td>
</tr>
</tbody>
</table>



#### <span id="How_it_works" class="mw-headline">How it works</span>

1.  constructor sets up variables to use later
2.  options are set
3.  grabs a line from ifalt, parses it into data-structure
4.  creates object for page
    - if the page doesn't exist, check if the gene name redirects to
      another article, and use this one (follow the redirect)
5.  get content from the page
6.  create object for page template, get content
7.  get content from table template
8.  get the box_uid from the database using the page_uid
    - if that fails, try getting the box_uid from the database using the
      page_name
    - if that fails, then try and grab the box out of the wikitext of
      the page
    - if that fails, forget it--throw an error
9.  make a box object from the table info, make sure we've got the
    wikitext equivalent
10. check what type of action we are doing (append, merge, clear)
    - if append:
      - append rows and save metadata
    - if merge:
      - compare new row to every row in the existing box
      - we can do a plethora of things here, see above
    - if clear, clear old rows from table
11. save the box object to the database
12. replace the any old wikitext with the new wikitext and save the page
13. unset the box object to keep from messing up next iteration

## <span id="Code_Examples" class="mw-headline">Code Examples</span>

#### <span id="do_misc_features" class="mw-headline">do_misc_features</span>


``` de1
public function do_misc_features( $array ){
    foreach ($array as $name => $feature) {
 
        // Here is where you can add code to define what to do for things in the 7th column.  
        if ($name == 'row_style')    $this->new_row->row_style = trim($feature);
 
        print "added row style";
        return true;
    }
}
```


  

#### <span id="appendRow" class="mw-headline">appendRow</span>


``` de1
public function appendRow($new_row_obj){
    $this->box_obj->rows[] = $new_row_obj;
    if ($this->verbose) print "\tappended row, \n";     
    return;
}
```


  

#### <span id="mergeRows" class="mw-headline">mergeRows</span>


``` de1
public function mergeRows($new_row_obj){ 
    // compare the new row to each of the existing rows
    $results = array();
    foreach ($this->box_obj->rows as $old_row) {
        $results[] = $this->compareRows($old_row, $new_row_obj);
    }
    if (in_array('exact', $results)) {
        // skip, this row is already in the box
        return;
    } elseif (in_array('subset', $results)) {
        for($i=0, $c=count($results); $i<$c; $i++){
            if($results[$i] == 'subset'){
                foreach($this->box_obj->rows[$i]->row_metadata as $old_row_metadata_obj){
                    $new_row_obj->metadata[] = $old_row_metadata_obj;
                }
                $this->box_obj->delete_row($i);
            }
        }
        $this->box_obj->rows[] = $new_row_obj;
        return;
    } else {
        $this->appendRow($new_row_obj);
    }
}
```


  

#### <span id="clearOldRows" class="mw-headline">clearOldRows</span>


``` de1
function clearOldRows($box, $time){
    // compare timestamps and delete row if older
    if(!$this->debug){
        foreach($box->rows as $row){
            if($time > $row->timestamp){
                $row->delete_row();
            }
        }
    }
    return;
}
```





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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/TableEdit_Loader" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:12 on 9 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">7,294 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





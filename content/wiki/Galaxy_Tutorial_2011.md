---
title: "Galaxy Tutorial 2011"
---




<span id="top"></span>




# <span dir="auto">Galaxy Tutorial 2011</span>









<a href="http://galaxyproject.org" class="external text"
rel="nofollow">Galaxy</a> is a framework for integrating computational
tools. It allows nearly any tool that can be run from the command line
to be wrapped in a structured well defined interface.

On top of these tools, Galaxy provides an accessible environment for
interactive analysis that transparently tracks the details of analyses,
a workflow system for convenient reuse, data management, sharing,
publishing, and more.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Creating a
  Galaxy instance</span>](#Creating_a_Galaxy_instance)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Getting
    Galaxy</span>](#Getting_Galaxy)
    - [<span class="tocnumber">1.1.1</span>
      <span class="toctext">Prerequisites</span>](#Prerequisites)
    - [<span class="tocnumber">1.1.2</span>
      <span class="toctext">Cloning the Galaxy
      repository</span>](#Cloning_the_Galaxy_repository)
- [<span class="tocnumber">2</span> <span class="toctext">Initial Setup
  and Run</span>](#Initial_Setup_and_Run)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Set the
    port</span>](#Set_the_port)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Run
    Galaxy! Run!</span>](#Run_Galaxy.21_Run.21)
- [<span class="tocnumber">3</span> <span class="toctext">Running
  analyses with Galaxy</span>](#Running_analyses_with_Galaxy)
  - [<span class="tocnumber">3.1</span> <span class="toctext">1. Access
    your new Galaxy
    instance</span>](#1._Access_your_new_Galaxy_instance)
  - [<span class="tocnumber">3.2</span> <span class="toctext">2. Upload
    TAF1 ChIP-Seq data</span>](#2._Upload_TAF1_ChIP-Seq_data)
  - [<span class="tocnumber">3.3</span> <span class="toctext">3. Edit
    Dataset Attributes</span>](#3._Edit_Dataset_Attributes)
  - [<span class="tocnumber">3.4</span> <span class="toctext">4. Get
    Gene Annotations from
    UCSC</span>](#4._Get_Gene_Annotations_from_UCSC)
  - [<span class="tocnumber">3.5</span> <span class="toctext">5.
    Generate a set of putative promoter
    regions</span>](#5._Generate_a_set_of_putative_promoter_regions)
  - [<span class="tocnumber">3.6</span> <span class="toctext">6.
    Identify promoter regions containing TAF1
    sites</span>](#6._Identify_promoter_regions_containing_TAF1_sites)
- [<span class="tocnumber">4</span> <span class="toctext">Under the
  hood</span>](#Under_the_hood)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Data and
    metadata</span>](#Data_and_metadata)
  - [<span class="tocnumber">4.2</span>
    <span class="toctext">Tools</span>](#Tools)
- [<span class="tocnumber">5</span> <span class="toctext">Configuring
  Galaxy (2)</span>](#Configuring_Galaxy_.282.29)
  - [<span class="tocnumber">5.1</span> <span class="toctext">Using a
    more robust database</span>](#Using_a_more_robust_database)
  - [<span class="tocnumber">5.2</span> <span class="toctext">Tool
    dependencies</span>](#Tool_dependencies)
- [<span class="tocnumber">6</span> <span class="toctext">A second
  example with NGS data</span>](#A_second_example_with_NGS_data)
  - [<span class="tocnumber">6.1</span> <span class="toctext">1. Upload
    datasets</span>](#1._Upload_datasets)
  - [<span class="tocnumber">6.2</span> <span class="toctext">2. Run BWA
    to map reads</span>](#2._Run_BWA_to_map_reads)
- [<span class="tocnumber">7</span> <span class="toctext">Adding a new
  tool</span>](#Adding_a_new_tool)
  - [<span class="tocnumber">7.1</span> <span class="toctext">The tool
    command (script)</span>](#The_tool_command_.28script.29)
  - [<span class="tocnumber">7.2</span> <span class="toctext">The tool
    wrapper</span>](#The_tool_wrapper)
  - [<span class="tocnumber">7.3</span> <span class="toctext">Running
    the new tool</span>](#Running_the_new_tool)
- [<span class="tocnumber">8</span> <span class="toctext">Galaxy
  Workflows</span>](#Galaxy_Workflows)
- [<span class="tocnumber">9</span> <span class="toctext">Making genome
  / alignment data available to
  Galaxy</span>](#Making_genome_.2F_alignment_data_available_to_Galaxy)
  - [<span class="tocnumber">9.1</span> <span class="toctext">Python
    package management tools</span>](#Python_package_management_tools)
  - [<span class="tocnumber">9.2</span>
    <span class="toctext">bx-python</span>](#bx-python)
  - [<span class="tocnumber">9.3</span> <span class="toctext">Get
    datasets for our genome</span>](#Get_datasets_for_our_genome)
  - [<span class="tocnumber">9.4</span> <span class="toctext">Edit
    configuration files</span>](#Edit_configuration_files)
  - [<span class="tocnumber">9.5</span> <span class="toctext">Create
    dataset using new genome
    build</span>](#Create_dataset_using_new_genome_build)
  - [<span class="tocnumber">9.6</span> <span class="toctext">Extract
    sequence corresponding to these
    intervals</span>](#Extract_sequence_corresponding_to_these_intervals)
  - [<span class="tocnumber">9.7</span> <span class="toctext">Extract
    multiple alignments corresponding to these
    intervals</span>](#Extract_multiple_alignments_corresponding_to_these_intervals)
  - [<span class="tocnumber">9.8</span> <span class="toctext">Other
    Features</span>](#Other_Features)
  - [<span class="tocnumber">9.9</span> <span class="toctext">Galaxy
    Pages</span>](#Galaxy_Pages)
- [<span class="tocnumber">10</span> <span class="toctext">Where to go
  next</span>](#Where_to_go_next)



# <span id="Creating_a_Galaxy_instance" class="mw-headline">Creating a Galaxy instance</span>

## <span id="Getting_Galaxy" class="mw-headline">Getting Galaxy</span>

### <span id="Prerequisites" class="mw-headline">Prerequisites</span>

The only prerequisite to run your own Galaxy is a Python interpreter,
version 2.4 or greater. Python 3 is a different language and is
currently not supported. The Ubuntu VM images used for this course
include version 2.6.4 of the interpreter:

    gmod@ubuntu:~$ python --version
    Python 2.6.4

Galaxy is distributed (and developed) using a distributed version
control system called
<a href="http://mercurial.selenic.com/" class="external text"
rel="nofollow">Mercurial</a>. The Ubuntu VM image already includes
mercurial version 1.3.1:

    gmod@ubuntu:~$ hg --version
    Mercurial Distributed SCM (version 1.3.1)
    ...

### <span id="Cloning_the_Galaxy_repository" class="mw-headline">Cloning the Galaxy repository</span>

The development and release repositories are available through the
<a href="http://bitbucket.org" class="external text"
rel="nofollow">bitbucket hosting service</a>.



**DO NOT DO THIS NOW**: To create a local clone of the release
repository run the following:

``` dont
 gmod@ubuntu:~$ cd ~/work
 gmod@ubuntu:~/work$ hg clone http://bitbucket.org/galaxy/galaxy-dist
```



**DO THIS INSTEAD**: To ensure we are all using the exact same revision
of Galaxy, instead clone from a repository that is already on the VM
image:

    gmod@ubuntu:~$ cd ~/work
    gmod@ubuntu:~/work$ hg clone ~/Documents/Software/galaxy/galaxy-dist

Either is equivalent, and the resulting repository can later be updated
from any other Galaxy clone.

# <span id="Initial_Setup_and_Run" class="mw-headline">Initial Setup and Run</span>

## <span id="Set_the_port" class="mw-headline">Set the port</span>

Often you can just fire up Galaxy at this point. However, if you are
following this tutorial using a
[VMware](VMware_2011_Spring_Training "VMware 2011 Spring Training")
image from the [2011 GMOD Spring
Training](2011_GMOD_Spring_Training "2011 GMOD Spring Training") course,
this may not work. The issue is that Galaxy, like
[InterMine](InterMine "InterMine") (also covered at that course), will
by default listen to port 8080. InterMine is already using port 8080 on
the course image. Therefore, to avoid a collision with InterMine, let's
do InterMine one better and use port 8081.

    gmod@ubuntu:~/work$ cd ~/work/galaxy-dist

Galaxy's main configuration file, `universe_wsgi.ini`, sets the port. By
default, that file is created at initialization time by copying
`universe_wsgi.ini.sample`. However, if the file already exists, it will
use the already existing file.

    $ cp universe_wsgi.ini.sample universe_wsgi.ini
    $ gedit universe_wsgi.ini

Change this:

    #port = 8080

to this:

    port = 8081

and save the file.

## <span id="Run_Galaxy.21_Run.21" class="mw-headline">Run Galaxy! Run!</span>

Galaxy includes a script to run it. This script also does the
initialization of Galaxy, the first time it is run. Run it now:

    gmod@ubuntu:~/work/galaxy-dist$ sh run.sh
    Initializing external_service_types_conf.xml from external_service_types_conf.xml.sample
    Initializing datatypes_conf.xml from datatypes_conf.xml.sample
    Initializing reports_wsgi.ini from reports_wsgi.ini.sample
    Initializing tool_conf.xml from tool_conf.xml.sample
    ... (a minute or two or three will pass) ...
    galaxy.web.buildapp DEBUG 2011-02-25 13:01:32,295 Enabling 'x-forwarded-host' middleware
    Starting server in PID 5153.
    serving on http://127.0.0.1:8081

This script performs several significant actions the first time it is
run:

- Creates initial configuration files, including the main file
  `universe_wsgi.ini` (but not this time, because we created it), and
  empty directories for storing data files
- Fetches all of the Galaxy framework's
  <a href="http://bitbucket.org/galaxy/galaxy-central/wiki/Config/Eggs"
  class="external text" rel="nofollow">dependencies</a>, packaged as
  Python eggs, for the current platform.
- Initialize its database. Galaxy uses a database migration system to
  automatically handle any changes to the database schema. On first load
  it runs all migrations to ensure the database is in a known state,
  which may take a little time.

Once the database is initialized, the normal startup process proceeds,
loading tool configurations, starting the job runner, and finally
initializing the web interface on port. You can now access your Galaxy
at <a href="http://localhost:8081" class="external free"
rel="nofollow">http://localhost:8081</a>

See <a href="http://bitbucket.org/galaxy/galaxy-central/wiki/GetGalaxy"
class="external text" rel="nofollow">GetGalaxy</a> for more information
on setting up Galaxy on other platforms (e.g. Mac OS X).

# <span id="Running_analyses_with_Galaxy" class="mw-headline">Running analyses with Galaxy</span>

Without any additional configuration, there is already a lot we can do
with our first Galaxy instance. As an example, let's work through the
first example from our recent <a
href="http://lava.mathcs.emory.edu/outgoing/publications/galaxy_cpmb_2010.pdf"
class="external text" rel="nofollow">Current Protocols in Molecular
Biology publication</a>.

### <span id="1._Access_your_new_Galaxy_instance" class="mw-headline">1. Access your new Galaxy instance</span>

Load a web browser and access
<a href="http://localhost:8081" class="external free"
rel="nofollow">http://localhost:8081</a>.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5a/Galaxy_FirstAnalysis_1.png" width="1049"
height="790" alt="Galaxy FirstAnalysis 1.png" />

### <span id="2._Upload_TAF1_ChIP-Seq_data" class="mw-headline">2. Upload TAF1 ChIP-Seq data</span>

To use data in an analysis in Galaxy, it first needs to be imported into
the current history. There are many ways to do this, but the simplest is
by uploading or fetching a file.

In the **Tools** panel *select* **Get Data** → **Upload File**. You can
either upload a file, or enter one or more URLs in the **URL/Text** box.
*Enter*

    ftp://ftp.gmod.org/pub/gmod/Courses/2011/SpringTraining/Galaxy/TAF1_ChIP.txt



(**Note:** You can also upload this from the filesystem at
`~/Documents/Data/galaxy/)`



in the **URL/Text** box and *click* **Execute**.

Galaxy will run the upload tool. Because we are fetching data from an
external URL, the job will run in the background. It will first appear
in the history as queued (gray), then running (yellow) and finally done
(green). At this point, *clicking* on the **name of the dataset in the
history** will show you information about the uploaded file, including
the first few lines.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/bd/Galaxy_FirstAnalysis_2.png" width="1053"
height="791" alt="Galaxy FirstAnalysis 2.png" />

### <span id="3._Edit_Dataset_Attributes" class="mw-headline">3. Edit Dataset Attributes</span>

The dataset we uploaded is a generic tabular data file (dumped out of
the UCSC browser, not in any particular feature format like BED or
[GFF](GFF "GFF")). However, it is feature data, meaning that each row
represents a location on a genome. To let Galaxy know about this,
*click* the **pencil icon** in the dataset's **History** entry to show
the dataset attributes interface. Under **Change data type** *set* **New
Type:** to **interval** and then *click* **Save**.

Galaxy will look at the dataset and guess which columns represent
chromosome, start, end, *et cetera*. In this case it guesses correctly.

We also need to tell Galaxy what genome assembly the intervals
correspond to. *Click* the dataset's **pencil icon** again, and then
under **Database / Build:** *select* **Human Mar. 2006 (NCBI36/hg18)
(hg18)**. Then *click* **Save**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a6/Galaxy_FirstAnalysis_3.png" width="1053"
height="791" alt="Galaxy FirstAnalysis 3.png" />

### <span id="4._Get_Gene_Annotations_from_UCSC" class="mw-headline">4. Get Gene Annotations from UCSC</span>

Another major way to pull data into Galaxy is through interfaces with
external data providers. Several of these are pre-configured out of the
box, including interfaces to [InterMine](InterMine "InterMine"),
[BioMart](BioMart "BioMart") and the UCSC Table Browser. Here we will
pull gene annotations from UCSC.

In the **Tools** panel, *select* **Get Data** → **UCSC Main Table
Browser**. The Table Browser UI will load in the center panel. Because
the data is of human annotations, make sure that **Clade, Genome**, and
**Assembly** are *set* to **Mammal, Human**, and **Mar. 2006**,
respectively. *Set* **Group** to **Genes and Gene Prediction Tracks**
and **Track** to **RefSeq Genes**. *Set* the **region** to **Genome**.
Make sure **Output Format** is *set* to **BED - Browser Extensible
Data** and the check-box by **Send Output to Galaxy** is **checked**.
Finally, *click* **get output**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/dc/Galaxy_FirstAnalysis_4.png" width="1053"
height="791" alt="Galaxy FirstAnalysis 4.png" />

A second interface will load allowing you to specify what portion of
genes to select, make sure **Whole Gene** is *selected* and *click*
**Send query to Galaxy**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/25/Galaxy_FirstAnalysis_4-5.png" width="925"
height="738" alt="Galaxy FirstAnalysis 4-5.png" />

### <span id="5._Generate_a_set_of_putative_promoter_regions" class="mw-headline">5. Generate a set of putative promoter regions</span>

You should now have two datasets in your history. Dataset 1 containing
TAF ChIP-seq intervals, and Dataset 2 containing RefSeq gene
annotations. We will now use a Galaxy tool to (naively) create a set of
putative promoter regions.

In the **Tools** panel, *select* **Operate on Genomic Intervals** →
**Get Flanks**. The user interface for the tool will appear in the
center panel. Make sure the dataset **2: UCSC Main...** is *selected*
and *set* **Length of Flanking region** to **1000** to create intervals
1000bp upstream of each gene. *Click* **Execute**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/1f/Galaxy_FirstAnalysis_5.png" width="1053"
height="791" alt="Galaxy FirstAnalysis 5.png" />

### <span id="6._Identify_promoter_regions_containing_TAF1_sites" class="mw-headline">6. Identify promoter regions containing TAF1 sites</span>

Finally, we will join this dataset with our original TAF1 dataset to
select promoter regions with TAF1 sites. In the **Tools** sections
*select* **Operate on Genomic Intervals → Join** and *select* **3: Get
Flanks...** as the first dataset and **1: ftp://ftp.gmod...** as the
second dataset. *Click* **Execute**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8c/Galaxy_FirstAnalysis_6.png" width="1053"
height="791" alt="Galaxy FirstAnalysis 6.png" />

The resulting dataset will contain all promoter regions that contain a
TAF1 site, joined side-by-side with the TAF1 sites they contain. From
here we can process further or visualize at different browsers.

# <span id="Under_the_hood" class="mw-headline">Under the hood</span>

Now that we've run some analyses, let's look at how Galaxy is organized
and how it handles our data. Return to the terminal, and *hit*
**Control-C** to terminate the Galaxy instance.

## <span id="Data_and_metadata" class="mw-headline">Data and metadata</span>

Within our Galaxy instance directory, instance data is stored under the
`database` directory:

    gmod@ubuntu:~/work/galaxy-dist$ ls database/
    compiled_templates  info.txt               pbs  universe.sqlite
    files               job_working_directory  tmp  whoosh_indexes

Two key files are `universe.sqlite` which is a [relational
database](Glossary#Relational "Glossary") containing all the metadata
tracked by Galaxy, and the `files` directory which contains the raw
datasets. First let's look at the database using the SQLite command line
interface:

    gmod@ubuntu:~/work/galaxy-dist$ sqlite3 database/universe.sqlite 
    SQLite version 3.6.16
    Enter ".help" for instructions
    Enter SQL statements terminated with a ";"
    sqlite>

For example, let's look at the first dataset we created:

    sqlite> select * from history_dataset_association limit 1;
    1|1|1|2011-02-25 23:10:08.399957|2011-02-25 23:33:22.081694||1|ftp://ftp.gmod.org/pub/gmod/Courses/2011/SpringTraining/Galaxy/TAF1_ChIP.txt%7Cuploaded tabular file|200 regions|#bin chrom   chromStart  chromEnd    name    score   floatScore
    1470    chr7    116099071   116100373   26384   720 2.183
    1589    chr5    131622266   131623568   26442   679 2.06
    1590    chr5    131854028   131855330   26415   693 2.102
    1591    chr5    131859918   131861220   26451   675 2.048
    1592    chr5    132109996   132111298   26337   764 2.317
    |tabular|{"column_types": ["int", "str", "int", "int", "int", "int", "float"], "columns": 7, "comment_lines": 1, "data_lines": 200, "dbkey": "hg18"}|||0|1|

We see that this table tracks all the information the Galaxy interface
needs to work with this dataset, include user defined fields such as
name and info, as well as the first few lines of the dataset ("peek"),
and the type specific metadata.

Exit the sqlite interface by *pressing* **Control-D**.

Now let's look at the actual data.

    gmod@ubuntu:~/work/galaxy-dist$ find database/files/
    database/files
    database/files/000
    database/files/000/dataset_1.dat
    database/files/000/dataset_2.dat
    database/files/000/dataset_3.dat
    database/files/000/dataset_4.dat

All of the datasets corresponding to our history items are stored in
this directory. Datasets are broken up into a hierarchy based on ID to
avoid problems with particular filesystems. If we look at a single file:

    gmod@ubuntu:~/work/galaxy-dist$ head database/files/000/dataset_1.dat
    #bin    chrom   chromStart  chromEnd    name    score   floatScore
    1470    chr7    116099071   116100373   26384   720 2.183
    1589    chr5    131622266   131623568   26442   679 2.06
    1590    chr5    131854028   131855330   26415   693 2.102
    1591    chr5    131859918   131861220   26451   675 2.048
    1592    chr5    132109996   132111298   26337   764 2.317
    1593    chr5    132140320   132141622   26374   729 2.21
    1471    chr11   116212868   116214170   26386   718 2.178
    816 chr22   30341490    30342792    26387   718 2.176
    102 chr22   30670342    30671644    26475   663 2.01

we see that Galaxy just stores the raw data exactly as we uploaded it.

## <span id="Tools" class="mw-headline">Tools</span>

Galaxy reads all of its tool configuration from a series of
[XML](Glossary#XML "Glossary") files. The file `tool_conf.xml` defines
which tools are loaded by a given instance:

    gmod@ubuntu:~/work/galaxy-dist$ head tool_conf.xml


``` de1
<?xml version="1.0"?>
 <toolbox>
   <section name="Get Data" id="getext">
     <tool file="data_source/upload.xml"/>
     <tool file="data_source/ucsc_tablebrowser.xml" />
     <tool file="data_source/ucsc_tablebrowser_test.xml" /> 
     <tool file="data_source/ucsc_tablebrowser_archaea.xml" />
     <tool file="data_source/bx_browser.xml" />
     <tool file="data_source/microbial_import.xml" />
     <tool file="data_source/biomart.xml" />
```


Each referenced file contains the description of a particular tool. The
**Get Flanks** tool we used earlier is described farther down:


``` de1
  <section name="Operate on Genomic Intervals" id="bxops">
    <tool file="new_operations/intersect.xml" />
    ...
    <tool file="new_operations/join.xml" />
    <tool file="new_operations/get_flanks.xml" />
    <tool file="new_operations/flanking_features.xml" />
    <tool file="annotation_profiler/annotation_profiler.xml" />
  </section>
```


Let's examine the **Get Flanks** tool by looking at the file
`tools/new_operations/get_flanks.xml`:


``` de1
 <tool id="get_flanks1" name="Get flanks">
  <description>returns flanking region/s for every gene</description>
  <command interpreter="python">get_flanks.py $input $out_file1 $size $direction $region -o $offset \
       -l ${input.metadata.chromCol},${input.metadata.startCol},${input.metadata.endCol},${input.metadata.strandCol}</command>
  <inputs>
    <param format="interval" name="input" type="data" label="Select data"/>
    <param name="region" type="select" label="Region">
      <option value="whole" selected="true">Whole feature</option>
      <option value="start">Around Start</option>
      <option value="end">Around End</option>
    </param>
    <param name="direction" type="select" label="Location of the flanking region/s">
      <option value="Upstream">Upstream</option>
      <option value="Downstream">Downstream</option>
      <option value="Both">Both</option>
    </param>
    <param name="offset" size="10" type="integer" value="0" label="Offset" 
           help="Use positive values to offset co-ordinates in the direction of transcription and negative values to offset in the opposite direction."/>
    <param name="size" size="10" type="integer" value="50" label="Length of the flanking region(s)" help="Use non-negative value for length"/>
  </inputs>
  <outputs>
    <data format="interval" name="out_file1" metadata_source="input"/>
  </outputs>
  <tests>
    ...
  </tests>
 <help> 
...
</help>
 </tool>
```


This syntax is defined at <a
href="https://bitbucket.org/galaxy/galaxy-central/wiki/ToolConfigSyntax"
class="external text" rel="nofollow">Tool Config Syntax</a> on the
Galaxy wiki. You can guess what most of it is about, but some of it,
such as:

    ${input.metadata.chromCol}

is less clear. A set of *metadata information* is defined for each
supported data type. In this case, the input is defined as format
`interval`. Known formats are defined in the data types classes in
`lib/galaxy/datatypes/`. Let's look at
`lib/galaxy/datatypes/interval.py`, which defines interval formats. To
find each type's metadata elements, search for `MetadataElement`:


``` de1
class Interval( Tabular ):
    """Tab delimited data containing interval information"""
    file_ext = "interval"
 
    """Add metadata elements"""
    MetadataElement( name="chromCol", default=1, desc="Chrom column", param=metadata.ColumnParameter )
    MetadataElement( name="startCol", default=2, desc="Start column", param=metadata.ColumnParameter )
    MetadataElement( name="endCol", default=3, desc="End column", param=metadata.ColumnParameter )
    MetadataElement( name="strandCol", desc="Strand column (click box & select)", param=metadata.ColumnParameter, optional=True, no_value=0 )
    MetadataElement( name="nameCol", desc="Name/Identifier column (click box & select)", param=metadata.ColumnParameter, optional=True, no_value=0 )
    MetadataElement( name="columns", default=3, desc="Number of columns", readonly=True, visible=False )
```


Test and help details have been removed from the listing here. The
`<help>` section describes the tool. This text is displayed on the tool
page. The markup used is
<a href="http://docutils.sourceforge.net/docs/user/rst/quickref.html"
class="external text" rel="nofollow">reStructured Text (RST)</a>, a
popular markup language in the Python community.

This file contains everything necessary to define the user interface of
the tool. Compare the inputs element with the figure of the **Get
Flanks** tool interface above.

It also describes how to take a set of user input values from the
generated user interface, and construct a command line to actually run
the tool. Nearly all tools in Galaxy are constructed in this way -- any
analysis that can be run from the command line can be integrated into a
Galaxy instance.

# <span id="Configuring_Galaxy_.282.29" class="mw-headline">Configuring Galaxy (2)</span>

## <span id="Using_a_more_robust_database" class="mw-headline">Using a more robust database</span>

Out of the box Galaxy includes the embedded SQLite database. This allows
Galaxy to run with zero-configuration and provides an excellent solution
for single-user Galaxy's being used for tool development. However, for
any multi-user scenario a more robust database will be needed for Galaxy
to be reliable. We **highly** recommend
[Postgres](PostgreSQL "PostgreSQL"), although other database are known
to work.

Postgres is already installed on our VM image (it's the default
[DBMS](Glossary#DBMS "Glossary") for
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>), and the
`gmod` user has permission to create databases, so let's create a
database for Galaxy

    gmod@ubuntu:~/work/galaxy-dist$ createdb galaxy_test

Once the empty database is created, we need to edit Galaxy's
`universe_wsgi.ini` file to use it:

1.  Setting `database_connection` to
    `postgres://gmod:gmodamericas2011@localhost:5432/galaxy_test`.
2.  Setting `database_engine_option_server_side_cursors` to `True`
3.  Setting `database_engine_option_strategy` to `threadlocal`

With these changes the `Database` section of your Galaxy config file
will look like:

    # -- Database

    # By default, Galaxy uses a SQLite database at 'database/universe.sqlite'.  You
    # may use a SQLAlchemy connection string to specify an external database
    # instead.  This string takes many options which are explained in detail in the
    # config file documentation.
    #database_connection = sqlite:///./database/universe.sqlite?isolation_level=IMMEDIATE
    database_connection = postgres://gmod:gmodamericas2011@localhost:5432/galaxy_test

    # If the server logs errors about not having enough database pool connections,
    # you will want to increase these values, or consider running more Galaxy
    # processes.
    #database_engine_option_pool_size = 5
    #database_engine_option_max_overflow = 10

    # If using MySQL and the server logs the error "MySQL server has gone away",
    # you will want to set this to some positive value (7200 should work).
    #database_engine_option_pool_recycle = -1

    # If large database query results are causing memory or response time issues in
    # the Galaxy process, leave the result on the server instead.  This option is
    # only available for PostgreSQL and is highly recommended.
    database_engine_option_server_side_cursors = True

    # Create only one connection to the database per thread, to reduce the
    # connection overhead.  Recommended when not using SQLite:
    database_engine_option_strategy = threadlocal

    # Log all database transactions, can be useful for debugging and performance
    # profiling.  Logging is done via Python's 'logging' module under the qualname
    # 'galaxy.model.orm.logging_connection_proxy'
    #database_query_profiling_proxy = False

## <span id="Tool_dependencies" class="mw-headline">Tool dependencies</span>

So far we have used tools that are completely packaged with the Galaxy
distribution. However, many tools require external software to be
installed to be used (we are currently working on an enhanced dependency
management system to make this easier). In the meantime, we maintain a
list of <a
href="http://bitbucket.org/galaxy/galaxy-central/wiki/ToolDependencies"
class="external text" rel="nofollow">tool dependencies</a>. Suppose we'd
like to analyze some Illumina datasets. We see that the **Map with BWA**
tool requires us to install
<a href="http://bio-bwa.sourceforge.net/" class="external text"
rel="nofollow">BWA</a> (surprise!). To save time, BWA is already
compiled on the VM image, so let's copy it to a location on the `PATH`:

    $ sudo cp /home/gmod/Documents/Software/galaxy/bwa-0.5.9/bwa /usr/local/bin

Now `bwa` can be run from the command line:

    $ bwa

    Program: bwa (alignment via Burrows-Wheeler transformation)
    Version: 0.5.9-r16
    Contact: Heng Li <lh3@sanger.ac.uk>

    ...

The Galaxy tool also requires a `loc` file which contains the locations
of indexes for locally stored genome builds. We don't have any, so we
can just use the empty sample:

    $ cp tool-data/bwa_index.loc.sample tool-data/bwa_index.loc

and run Galaxy using `sh run.sh`

# <span id="A_second_example_with_NGS_data" class="mw-headline">A second example with NGS data</span>

Having made these changes, start Galaxy again using `run.sh` and access
it at <a href="http://localhost:8081" class="external free"
rel="nofollow">http://localhost:8081</a>

You will notice that your history has been lost. This is the result of
moving to Postgres. On startup, Galaxy will again have created a new
database from scratch.

### <span id="1._Upload_datasets" class="mw-headline">1. Upload datasets</span>

We will again use the **Get Data → Upload File** tool to upload data
into Galaxy. You can enter multiple URLs into the **URL / Text** box.
*Enter:*

    ftp://ftp.gmod.org/pub/gmod/Courses/2011/SpringTraining/Galaxy/phiX174_genome.fa
    ftp://ftp.gmod.org/pub/gmod/Courses/2011/SpringTraining/Galaxy/phiX174_reads.fastqsanger

and *click* **Execute**:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/53/Galaxy_SecondAnalysis_1.png" width="1053"
height="791" alt="Galaxy SecondAnalysis 1.png" />

After uploading the datasets, *expand them* in the **History**. We can
see that Galaxy has successfully detected the file formats of both
files.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/01/Galaxy_SecondAnalysis_2.png" width="1053"
height="791" alt="Galaxy SecondAnalysis 2.png" />

However, we need to make one modification. The FASTQ format is
ill-defined, and Galaxy needs to know how the quality scores are scaled.
*Click* the **pencil icon for dataset 2**, and *change* the **datatype**
from **fastq** to **fastqsanger** (be careful, there are many similar
choices here). Finally, *click* **Save**.

## <span id="2._Run_BWA_to_map_reads" class="mw-headline">2. Run BWA to map reads</span>

In the **Tools** panel, *select* **NGS: Mapping → Map with BWA for
Illumina**.

*Change* the value of the first parameter to **Use one from the
history** and make sure that **1:
<a href="http://...genome.fa" class="external free"
rel="nofollow">http://...genome.fa</a>** is **selected**.

Make sure that for parameter **FASTQ file** that **2:
<a href="http://...fastqsanger" class="external free"
rel="nofollow">http://...fastqsanger</a>** is selected.

*Click* **Execute**.

A new dataset is generated containing the mapped reads in [SAM
format](Glossary#SAM "Glossary").

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d5/Galaxy_SecondAnalysis_3.png" width="1001"
height="578" alt="Galaxy SecondAnalysis 3.png" />

# <span id="Adding_a_new_tool" class="mw-headline">Adding a new tool</span>

The <a href="http://samtools.sourceforge.net/" class="external text"
rel="nofollow">SAM format</a> contains 12 required fields representing
the read and the position it maps to, followed by a variable number of
optional fields of the form *`CODE:TYPE:VALUE`*. Suppose we want to
filter by these optional fields. We can whip up a quick command line
tool in Python (or perl, or awk, or...) to do this.

Let's first create a directory for our new tool:

    gmod@ubuntu:~/work/galaxy-dist$ mkdir tools/gmod_2011

## <span id="The_tool_command_.28script.29" class="mw-headline">The tool command (script)</span>

And then using a [text editor](Linux_Text_Editors "Linux Text Editors"),
create `tools/gmod_2011/sam_filter.py` containing:


``` de1
#!/usr/bin/env python
 
"""
Usage: sam_filter.py input_file output_file flag value
"""
 
import sys
 
out = open( sys.argv[2], "w" )
 
for line in open( sys.argv[1] ):
    # Strip end of line and split on tabs
    fields = line.rstrip( "\r\n" ).split( "\t" )
    # Look only at optional fields
    write_line = False
    for field in fields[12:]:
        flag, type, value = field.split( ":" )
        if flag == sys.argv[3] and value == sys.argv[4]:
            write_line = True
    # If any optional field matched, keep the read
    if write_line:        
        out.write( line )
```


## <span id="The_tool_wrapper" class="mw-headline">The tool wrapper</span>

Next, we need to create the tool configuration. Edit the file
`tools/gmod_2011/sam_filter.xml` and start with the following skeleton:


``` de1
<tool id="sam_filter_1" name="SAM Filter">
    <command interpreter="python">
 
    </command>
    <inputs>
 
    </inputs>
    <outputs>
 
    </outputs>
</tool>
```


First, let's define the output. This tool has a single output, of type
`sam`, so we modify the configuration to contain:


``` de1
<tool id="sam_filter_1" name="SAM Filter">
    <command interpreter="python">
 
    </command>
    <inputs>
 
    </inputs>
    <outputs>
        <data name="output1" format="sam" />
    </outputs>
</tool>
```


The name can be anything, but it will be used later to identify the
output file in the command line. Second, let's define the following
inputs

- An input dataset of type `sam`
- An input flag, which is selected from a predefined set
- An input value, which can be any text

The resulting configuration:


``` de1
<tool id="sam_filter_1" name="SAM Filter">
    <command interpreter="python">
 
    </command>
    <inputs>
        <param type="data" format="sam" name="input1" label="File to filter"/>
        <param type="select" name="flag" label="Optional field to filter on">
            <option value="NM">Edit Distance</option>
            <option value="MD">Mismatching positions / bases</option>
        <option value="AS">Alignment score</option>
        </param>
    <param type="text" name="value" label="Value to require for flag"/>
    </inputs>
    <outputs>
        <data name="output1" format="sam" />
    </outputs>
</tool>
```


Finally, we define how to construct our command line based on values for
the inputs. The command line is a template, where we can substitute in
the value of each input (filenames in the case of datasets). Thus our
final tool configuration is:


``` de1
<tool id="sam_filter_1" name="SAM Filter">
    <command interpreter="python">
        sam_filter.py $input1 $output1 $flag $value
    </command>
    <inputs>
        <param type="data" format="sam" name="input1" label="File to filter"/>
        <param type="select" name="flag" label="Optional field to filter on">
            <option value="NM">Edit Distance</option>
            <option value="MD">Mismatching positions / bases</option>
        <option value="AS">Alignment score</option>
        </param>
    <param type="text" name="value" label="Value to require for flag"/>
    </inputs>
    <outputs>
        <data name="output1" format="sam" />
    </outputs>
</tool>
```


We now need to modify `tool_conf.xml` to register our new tool and run
Galaxy. Modify the top of `tool_conf.xml` to look like:


``` de1
<?xml version="1.0"?>
<toolbox>
  <section name="GMOD 2011 Course Tools" id="gmod_2011">
    <tool file="gmod_2011/sam_filter.xml"/>
  </section>
  ...
```


and run Galaxy using `run.sh`

## <span id="Running_the_new_tool" class="mw-headline">Running the new tool</span>

Return to the Galaxy web interface and from the **Tools** panel and
*select* **GMOD 2011 Course Tools → SAM Filter**.

The dataset **3: Map with BWA...** should already be **selected**.
Because we defined the type of data the tool can accept, Galaxy knows
this is the only dataset in our history that is valid.

*Select* **Edit distance** for the **flag**, *enter* **0** for the
**value**, and *click* **Execute**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/70/Galaxy_SamFilter_1.png" width="1024"
height="330" alt="Galaxy SamFilter 1.png" />

We know have a new dataset **4: Sam Filter on data 3** which contains
only reads that mapped exactly to the reference.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3a/Galaxy_SamFilter_2.png" width="1012"
height="433" alt="Galaxy SamFilter 2.png" />

# <span id="Galaxy_Workflows" class="mw-headline">Galaxy Workflows</span>

The Galaxy workflow system allows analysis containing multiple tools to
be built, run, extracted from histories, and rerun. As a trivial
example, let's extract a workflow for the analysis we just performed.

We'll first need to create a user account and login. At the top of the
Galaxy interface, select **User → Register**. *Fill in* the required
fields and *click* **Submit**. Your account will be created, and you
will be logged in (retaining your current history).

In the title of the **History** panel, *click* **Options → Extract
Workflow**.

At this point, you have the option to select a subset of steps from your
history to include in the workflow. Some tools cannot be used as
workflow steps (e.g. uploads) so they will instead be treated as inputs
to the workflow. This is fine, so *click* **Create Workflow**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/65/Galaxy_Misc_1.png" width="1053"
height="791" alt="Galaxy Misc 1.png" />

Now, from the top bar *click* **Workflow** to see a list of your
workflows. You should see one workflow. *Click* on **its name** to bring
up a popup menu, then *click* **Edit** to open the workflow editor. In
the workflow editor, we can modify parameters or add and remove steps.
For example, if we *click* on **SAM filter**, we can change edit
distance from 0 to 1:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/88/Galaxy_Misc_2.png" width="1366"
height="661" alt="Galaxy Misc 2.png" />

# <span id="Making_genome_.2F_alignment_data_available_to_Galaxy" class="mw-headline">Making genome / alignment data available to Galaxy</span>

Galaxy is designed so that a single Galaxy instance can work with many
genomes simultaneously. To use certain tools, Galaxy needs to be
configured to know where to find data for those genomes. As an example,
let's create a new fake genome and configure some data for it.

Every genome in Galaxy needs to have an unique identifier (called the
build identifier or dbkey). For our example, the identifier will be
`a_example_1`.

## <span id="Python_package_management_tools" class="mw-headline">Python package management tools</span>



**DO NOT DO THIS NOW**: This has already been done on the VMware image.

First, install a few packages that will allow us to index our data. At
the terminal, enter:

`  $ `<span class="enter">`sudo apt-get install python-dev python-setuptools python-pip`</span>



## <span id="bx-python" class="mw-headline">bx-python</span>



**Do not do this now either.** This has already been done on your image.

This *would* install some support files needed by Python. Next type

`  $ `<span class="enter">`sudo pip install bx-python`</span>

This would install the `bx-python` package, a collection of scripts and
Python libraries for working with genomic and comparative genomic data.



## <span id="Get_datasets_for_our_genome" class="mw-headline">Get datasets for our genome</span>

Now, we will download the datasets for our example genome:

    $ mkdir tool-data/a_example_1
    $ cd tool-data/a_example_1
    $ wget ftp://ftp.gmod.org/pub/gmod/Courses/2011/SpringTraining/Galaxy/a_example_1.maf
    $ wget ftp://ftp.gmod.org/pub/gmod/Courses/2011/SpringTraining/Galaxy/a_example_1.2bit



Note: These files are also available on the image in
`~/Documents/Data/galaxy/`.



Next, we will use the script `maf_build_index.py` (put in
`/usr/local/bin/` when `bx-python` was installed) to create a binary
index that allows fast selection of alignments from a MAF file:

    $ maf_build_index.py a_example_1.maf
    $ ls
    a_example_1.2bit  a_example_1.maf  a_example_1.maf.index
    $ cd ~/work/galaxy-dist

## <span id="Edit_configuration_files" class="mw-headline">Edit configuration files</span>

We now need to edit several configuration files to inform Galaxy of the
existence of our genome, and of these associated datasets.

**NOTE:** these are TAB separated files, and it is important that the
tabs are in the right places. If you have trouble cutting and pasting
from the wiki, you can cut and paste from this text file instead:

    ftp://ftp.gmod.org/pub/gmod/Courses/2011/SpringTraining/Galaxy/info.txt

Add this line to `tool-data/shared/ucsc/builds.txt`

``` enter
a_example_1 Example genome
```

Add this to `tool-data/alignseq.loc`

``` enter
seq a_example_1 /home/gmod/work/galaxy-dist/tool-data/a_example_1/a_example_1.2bit
```

Add this to `tool-data/maf_index.loc`

``` enter
a_example_1 with 3 other species    a_example_1_3way    a_example_1 a_example_1,apiMel2,n_vitripennis_20100409,dm3  /home/gmod/work/galaxy-dist/tool-data/a_example_1/a_example_1.maf
```

Now, stop and start your running Galaxy with

    <Control-C>
    $ sh run.sh

## <span id="Create_dataset_using_new_genome_build" class="mw-headline">Create dataset using new genome build</span>

Now let's see if our new data is available in Galaxy. Click **Get Data →
Upload File**.

Paste the following into the **URL/Text** box:

    scaffold0   450 650
    scaffold0   2000    3000

Set the **File Format** to **BED**, make sure **Convert spaces to tabs**
is **selected**, and click in the **Genome:** box. You should be able to
find your genome by typing **example**.

## <span id="Extract_sequence_corresponding_to_these_intervals" class="mw-headline">Extract sequence corresponding to these intervals</span>

In the **Tools** menu, *click* **Fetch Sequences → Extract Genomic
DNA**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/11/Galaxy_Fetch_1.png" width="1247"
height="683" alt="Galaxy Fetch 1.png" />

The tool interface should open in the main panel. The default values are
probably fine (make sure the dataset you just created is selected).
*Click* **Execute**. A new dataset will be created containing the DNA
for your regions of interest.

## <span id="Extract_multiple_alignments_corresponding_to_these_intervals" class="mw-headline">Extract multiple alignments corresponding to these intervals</span>

In the **Tools** menu, click **Fetch Alignments → Extract MAF Blocks**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/74/Galaxy_Fetch_2.png" width="1246"
height="681" alt="Galaxy Fetch 2.png" />

The tool interface will open in the main panel. Again, the defaults
should be reasonable, but *click* **Select All** to do alignments to all
other species. *Click* **Execute**. A new dataset will be created
containing alignments corresponding to your intervals of interest.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a7/Galaxy_Fetch_3.png" width="1246"
height="683" alt="Galaxy Fetch 3.png" />

## <span id="Other_Features" class="mw-headline">Other Features</span>

Terminate Galaxy with `Control-C`. Edit `universe_wsgi.ini` again and in
the section `[app:main]` add two lines:

    # enable_tracks = True 
    enable_pages = True

Restart Galaxy with `run.sh`



Note: if you are running this tutorial after the course, pages may be
enabled by default in the most current Galaxy distribution.



## <span id="Galaxy_Pages" class="mw-headline">Galaxy Pages</span>

The Galaxy pages feature allows the creation of documents that integrate
datasets, histories, and workflows.

From the **User** menu at the top, select **Saved Pages** and then
*click* **Add new page**. *Enter* a **Page Title** and **Page
Annotation**, and a URL compatible identifier will be generated
automatically. *Click* **submit**, and you will return to the list of
pages.

Click the **arrow to the right of the page name**, and from the popup
menu click **Edit Content**.

You are now in a WYSIWYG editor where you can write-up your analysis for
sharing. As a simple example, click **Embed Galaxy Object → Embed
History**, and then select the history you have been working with, and
*click* **Embed**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/10/Galaxy_Misc_3.png" width="1366"
height="661" alt="Galaxy Misc 3.png" />

Click **Save** and **Close** to return to the page list, and *click* on
the **page's title → View** to view it. You will now see your page, with
your analysis history embedded. This page can be shared with others, or
published publicly. Others can inspect your history, import and work
with your analysis.

Note that our history is still named "Unnamed history", which is mildly
irritating, given how spiffy it is. To fix this, *click* on the
**Analyze Data** tab, and then at the top of the **History** panel,
*click* on the text **Unnamed history** and enter a meaningful history
name, such as "Spiffy History". *Hit* the **return key**.

Now, if you view the page again, you'll see the history has a name.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d6/Galaxy_Misc_4.png" width="1326"
height="621" alt="Galaxy Misc 4.png" />

*Spiffy!* You can return to the History view and annotate your history
items by clicking on the **Note icon**. These annotations will show up
with your embedded history.

# <span id="Where_to_go_next" class="mw-headline">Where to go next</span>

We've only scratched the surface of what can be done with Galaxy. Here
are some pointers for learning more:

- <a
  href="http://main.g2.bx.psu.edu/u/jeremy/p/galaxy-rna-seq-analysis-exercise"
  class="external text" rel="nofollow">Jeremy Goecks' RNA-seq Analysis
  Exercise shared page</a>.
- <a
  href="http://bitbucket.org/galaxy/galaxy-central/wiki/ToolConfigSyntax"
  class="external text" rel="nofollow">You can build much more complicated
  tool configurations</a>
- <a href="http://bitbucket.org/galaxy/galaxy-central/wiki/Config/Cluster"
  class="external text" rel="nofollow">Your Galaxy instance can run jobs
  on a cluster</a>
- <a
  href="http://bitbucket.org/galaxy/galaxy-central/wiki/Config/ProductionServer"
  class="external text" rel="nofollow">Your Galaxy can be more robust and
  scalable</a>
- <a
  href="http://bitbucket.org/galaxy/galaxy-central/wiki/DataIntegration"
  class="external text" rel="nofollow">You can make local genomes,
  alignments, and other data available to Galaxy</a>
- <a
  href="http://bitbucket.org/galaxy/galaxy-central/wiki/ExternalDisplayApplications/Tutorial"
  class="external text" rel="nofollow">You can customize what external
  applications are available for displaying datasets</a>
- <a
  href="http://bitbucket.org/galaxy/galaxy-central/wiki/AddingDatatypes"
  class="external text" rel="nofollow">You can customize the datatypes for
  a Galaxy instance</a>
- <a href="http://bitbucket.org/galaxy/galaxy-central/wiki/cloud"
  class="external text" rel="nofollow">You can instantiate Galaxy on the
  Amazon cloud</a>
- <a href="http://bitbucket.org/galaxy/galaxy-central/wiki/Home"
  class="external text" rel="nofollow">You can find even more at the
  Galaxy wiki</a>




[Categories](Special%253ACategories "Special%253ACategories"):

- [2011 Spring
  Training](Category%253A2011_Spring_Training "Category%253A2011 Spring Training")
- [Galaxy](Category%253AGalaxy "Category%253AGalaxy")
- [Tutorials](Category%253ATutorials "Category%253ATutorials")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Galaxy_Tutorial_2011" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:56 on 13 February
  2013.</span>
<!-- - <span id="footer-info-viewcount">14,148 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





---
title: "InterMine Tutorial 2011"
---
# InterMine Tutorial 2011


  OOOPS!](#OOOPS.21)
- [Introduction](#Introduction)
- [Overview](#Overview)
- [Loading Data
  Into Your Database](#Loading_Data_Into_Your_Database)
  - [The
    tutorial data](#The_tutorial_data)
  - [The
    MineManager Graphical
    Installer](#The_MineManager_Graphical_Installer)
    - [Running it from the command
      line](#Running_it_from_the_command_line)
    - [Running it from a clickable
      launcher](#Running_it_from_a_clickable_launcher)
    - [Welcome Screen](#Welcome_Screen)
  - [Starting a
    new Mine](#Starting_a_new_Mine)
    - [Setting up the new Mine's
      properties](#Setting_up_the_new_Mine.27s_properties)
    - [The
      Mine project directory](#The_Mine_project_directory)
  - [Adding
    Sources to a Project](#Adding_Sources_to_a_Project)
    - [Importing Protein Data From
      Uniprot](#Importing_Protein_Data_From_Uniprot)
      - [Side Note: Model
        Additions](#Side_Note:_Model_Additions)
    - [The
      GFF3 source](#The_GFF3_source)
    - [FASTA
      files](#FASTA_files)
    - [Entrez
      Organism](#Entrez_Organism)
    - [Loading Custom Data
      Sources](#Loading_Custom_Data_Sources)
      - [Tool-chain
        details](#Tool-chain_details)
      - [Installing the Perl
        tool-chain](#Installing_the_Perl_tool-chain)
      - [Our example
        dataset](#Our_example_dataset)
      - [Our parsing
        strategy](#Our_parsing_strategy)
      - [Adding The
        Source](#Adding_The_Source)
      - [An
        Example Implementation of this
        Strategy](#An_Example_Implementation_of_this_Strategy)
      - [Additions](#Additions)
        - [Gene](#Gene)
        - [Pathway](#Pathway)
      - [Dealing With
        Integration](#Dealing_With_Integration)
      - [Generating the
        XML](#Generating_the_XML)
  - [Running a
    Build](#Running_a_Build)
- [Deployment](#Deployment)
  - [Configuration](#Configuration)
  - [UserProfile
    Initialisation](#UserProfile_Initialisation)
  - [Starting
    the Tomcat Webserver](#Starting_the_Tomcat_Webserver)
  - [Deploying
    the Webapp to Tomcat](#Deploying_the_Webapp_to_Tomcat)
- [Accessing Your
  Data Through the
  Webapp](#Accessing_Your_Data_Through_the_Webapp)
  - [Single
    Objects (Report Pages)](#Single_Objects_.28Report_Pages.29)
  - [Multiple
    Objects (Lists)](#Multiple_Objects_.28Lists.29)
  - [Exporting
    Data and Summarising
    Columns](#Exporting_Data_and_Summarising_Columns)
    - [Exporting Data](#Exporting_Data)
    - [Viewing Column
      Summaries](#Viewing_Column_Summaries)
  - [Running
    Queries](#Running_Queries)
  - [Making
    Lists from Query Results](#Making_Lists_from_Query_Results)
  - [Running
    Templates](#Running_Templates)
  - [Making
    Templates](#Making_Templates)
- [Accessing Your
  Data through the
  Webservice](#Accessing_Your_Data_through_the_Webservice)
  - [Raw
    URLs](#Raw_URLs)
    - [Asking
      the Webapp to generate them for
      you](#Asking_the_Webapp_to_generate_them_for_you)
  - [The
    Command-Line utilities](#The_Command-Line_utilities)
    - [Getting XML from the
      Webapp](#Getting_XML_from_the_Webapp)
    - [Running
      Templates](#Running_Templates_2)
  - [Access
    from Perl & Java
    programs](#Access_from_Perl_.26_Java_programs)
    - [Webapp/Webservice
      Integration](#Webapp.2FWebservice_Integration)
    - [Accessing
      Templates](#Accessing_Templates)
    - [Accessing
      Queries](#Accessing_Queries)
  - [Data
    Formats](#Data_Formats)
    - [Row
      Based Formats](#Row_Based_Formats)
    - [Record
      Based Formats](#Record_Based_Formats)
    - [Getting the
      Total](#Getting_the_Total)
  - [Access
    From Within the Browser](#Access_From_Within_the_Browser)


# OOOPS!


**First things first:**

- **I forgot to install a cpan module:**

``` enter
 sudo cpan Expect
```

- **You need to run a command:**

``` enter
 cp -r /home/gmod/Documents/Software/intermine/bio/sources/example-sources/malaria-gff  /home/gmod/Documents/Software/intermine/bio/sources/
```


# Introduction

<a href="http://db.tt/yCxyJnx" class="external text"
rel="nofollow">Intro Slides</a>

InterMine is a project that aims to make creating, running, and
maintaining massive data warehouses of integrated genomics data fast and
flexible. It provides a back end database solution, a front end
web-application, and a fully capable webservice API to access the data
you host. InterMine already powers several websites, including
<a href="http://www.flymine.org" class="external text"
rel="nofollow">FlyMine</a>,
<a href="http://intermine.modencode.org/" class="external text"
rel="nofollow">modMine</a>,
<a href="http://ratmine.mcw.edu/" class="external text"
rel="nofollow">RatMine</a>,
<a href="http://yeastmine.yeastgenome.org" class="external text"
rel="nofollow">YeastMine</a>, and soon
<a href="http://www.metabolicmine.org/beta/begin.do"
class="external text" rel="nofollow">metabolicMine</a> and
<a href="http://zmine.zfin.org/zfinmine/" class="external text"
rel="nofollow">ZFINmine</a> as well.

InterMine is fundamentally data agnostic, and can host any data you
like, but we have been funded to develop genomics tools, and you will
find a wide range of utilities that make dealing with different
biological sources of data easy. Dealing with the massive amount of data
that genomics research produces is never really easy, but InterMine
makes the straightforward simple, and the difficult possible.

# Overview

We aim to demonstrate three strengths of InterMine:

1.  It's ~~effortless~~ straightforward to integrate data from different
    datasets (even your own data!) into one database.
2.  Once you get your data into the database, you get a powerful,
    works-out-of-the-box webapp that makes it easy and fun to access
    your data.
3.  Once you get your webapp up on the server, you get a sophisticated
    webservice that enables you or others to access the data via
    scripts, Java programs and other web-pages.

To do this, we will set up a stand-alone InterMine. This consists of a
PostgreSQL database and a Java web-app sitting on top of it. Setting up
your InterMine involves loading data into this database, and then
mounting the web application in a running Tomcat instance.

# Loading Data Into Your Database

The database schema, and the Java classes that represent it, are
generated from XML configuration files. To manage this each mine has an
associated Java project folder, named after itself. This project also
contains code which manages *integration*, or the procedure of loading
data into the scheme once it has been defined. Therefore the outline of
this section is:

1.  Setting up the project structure
2.  Configuring the data sources and the associated schema
3.  Running the build process

## The tutorial data

We will use the sample data set we distribute with our source. This is
located at:

    ~/Documents/Software/intermine/bio/tutorial/malariamine/malaria-data.tar.gz

Place this data in the the data directory, and extract it for use in the
tutorial:

``` enter
 mkdir ~/Documents/Data/intermine
 cd ~/Documents/Data/intermine
 cp ~/Documents/Software/intermine/bio/tutorial/malariamine/malaria-data.tar.gz .
 tar -zxvf malaria-data.tar.gz
```

You should now have a directory of data available at
`/home/gmod/Documents/Data/intermine/malaria`

## The MineManager Graphical Installer

We are developing a graphical application to manage these stages, which
we will use in this section of the workshop:

The MineManager is located in our source tree at
`SVN_ROOT/intermine/MineManager`.

### Running it from the command line

To run it open a terminal and type the command:

``` enter
  /home/gmod/Documents/Software/intermine/intermine/MineManager/run
```

### Running it from a clickable launcher

If you would prefer a point and click interface, on standard Linux
desktops, you can run the launcher installer to obtain a runnable icon:

``` enter
  /home/gmod/Documents/Software/intermine/intermine/MineManager/install_launcher
```

You should then find a MineManager icon on your desktop, which you can
double click to open the installer.

### Welcome Screen

You should see a window like this:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fe/MineManager-welcome.png" width="800"
height="454" alt="MineManager-welcome.png" />

This installer will guide you through the install procedure in 4 steps
to the point of having a working database that we can use to release a
mine on.

## Starting a new Mine

To do this enter a name in the box at the top and click on the **save**
icon to the right of the text box. This will automatically open up the
next stage of the mine creation process.

### Setting up the new Mine's properties

In order to proceed, we need to tell the installer where the InterMine
source tree we are using is located. This is referred to here as
**InterMine Home**. You can use the browse button on the top right of
the Mine Information tab to select the appropriate directory:

     /home/gmod/Documents/Software/intermine

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e7/MineManager-minesettings-info.png"
width="800" height="467" alt="MineManager-minesettings-info.png" />

Once this form is completed and you have **applied your changes** you
will be able to create your mine.

### The Mine project directory

Creating the mine runs the `make_mine` script, which sets up the Java
project directories in the appropriate places, and then builds an
initial version of the data model. The structure of the mine's project
directory is:

     SVN_ROOT/your_mine
             |
             + -- dbmodel/
             + -- integrate/
             + -- postprocess/
             + -- webapp/
             + -- project.xml
             + -- default.intermine.webapp.properties
             + -- default.intermine.integrate.properties 

The four sub directories are each separate Java projects that manage the
different stages of building and running a mine, pretty much in the
order they appear.

## Adding Sources to a Project

The next section of the MineManager handles adding sources to a project:

A source here refers to the combination of a datasource and a parser
that reads the data into the database. We supply a
<a href="http://intermine.org/wiki/BioSources" class="external text"
rel="nofollow">large number of parsers</a> with our source code for
reading in data from common biological formats (including
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>,
[GFF3](GFF3 "GFF3")), and we supply the tools for writing your own
parsers for datasources we don't support out of the box.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/2d/InterMine-dataparsing.png/700px-InterMine-dataparsing.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/2d/InterMine-dataparsing.png/1050px-InterMine-dataparsing.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2d/InterMine-dataparsing.png 2x"
width="700" height="525" alt="InterMine-dataparsing.png" />

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/4a/MineManager-sourcesettings-empty.png"
width="800" height="467"
alt="MineManager-sourcesettings-empty.png" />

### Importing Protein Data From Uniprot

Click on **add source**, and then select **uniprot** as the source type
from the drop-down list. (you can choose to name each source, but in
this case *uniprot* is fine).

Once you add a source the section on the right will load up its specific
configuration options.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/90/MineManager-sourcesettings-uniprot.png"
width="800" height="467"
alt="MineManager-sourcesettings-uniprot.png" />

For uniprot the appropriate settings are:

| Field                      | Value                                     |
|----------------------------|-------------------------------------------|
| List of Organisms          | 36329                                     |
| Create protein domains     | TICKED                                    |
| Create GO terms            | UNTICKED                                  |
| Location of data directory | /home/gmod/Documents/Data/malaria/uniprot |

To save this configuration so it is used in the build, select **save
sources** from the bottom right, or when prompted.

#### Side Note: Model Additions

The Uniprot configuration section has a second tab named *Source Model
Additions*, which specifies the additions to the data model that a
particular source brings with it. The uniprot source adds the following
classes:

- Component
- UniprotFeature

And adds fields to the following classes:

- Gene
- GoAnnotation
- Protein
- ProteinDomain

If you select **model** → **view model** from the menu you can see how
these classes and fields are integrated into the data model.

### The GFF3 source

InterMine includes a parser to load valid [GFF3](GFF3 "GFF3") files. The
creation of features, sequence features (usually chromosomes), locations
and standard attributes is taken care of automatically.

The files we are loading are from PlasmoDB and contain gene, exon and
mRNA features, there is one file per chromosome. Look at an example:

``` enter
 head ~/Documents/Data/intermine/malaria/genome/gff/MAL1.gff3
```

To add the GFF3 source to your MalariaMine:

1.  Select the **Add source** option on the Sources menu.
2.  Choose **malaria-gff**
3.  Click the **add** button and **save** your sources.

The properties set for malaria-gff are:

| Field | Value | Notes |
|----|----|----|
| gff3.seqClsName | Chromosome | the ids in the first column represent Chromosome objects, e.g. MAL1 |
| gff3.taxonId | 36329 | taxon id of malaria |
| gff3.dataSourceName | PlasmoDB | the data source for features and their identifiers, this is used for the DataSet (evidence) and synonyms. |
| gff3.seqDataSourceName | PlasmoDB | the source of the seqids (chromosomes) is sometimes different to the features described |
| gff3.dataSetTitle | PlasmoDB P. falciparum genome | a DataSet object is created as evidence for the features, it is linked to a DataSource (PlasmoDB) |
| Location of Data Directory | /home/gmod/Documents/Data/intermine/malaria/genome/gff | Where we unpacked the data to |

### FASTA files

FASTA is a minimal format for representing sequence data. Files comprise
a header with some identifier information preceded by '\>' and a
sequence. At present the InterMine FASTA parser loads just the first
entry in header after `>` and assigns it to be an attribute of the
feature created. Here we will load one FASTA file for each malaria
chromosome. Look at an example of the files we will load:

``` enter
 head ~/malaria/genome/fasta/MAL1.fasta
```

Add a fasta source to your Mine by following these steps:

1.  Select **Add source** option from the Sources menu
2.  Select the **fasta** type and name your source
    **malaria-chromosome-fasta**. <span style="color:grey">*Note: you
    must use this name as there is an integration keys set of this name
    predefined for you. We will deal with keys in more detail in the
    custom source section.*</span>
3.  Click the **add** button and **save** your changes.

The following properties should be defined for malaria-chromosome-fasta:

| Field | Value | Notes |
|----|----|----|
| FASTA Class Name | org.intermine.model.bio.Chromosome | the type of feature that each sequence is for |
| fasta.dataSourceName | PlasmoDB | the source of identifiers to be created |
| Dataset Name | PlasmoDB chromosome sequence | a DataSet object is created as evidence |
| Taxon ID | 36329 | the organism id for Plasmodium falciparum |
| Location of Data Directory | /home/gmod/Documents/Data/intermine/malaria/genome/fasta | Where we unpacked the data to before |

### Entrez Organism

Some sources depend on other sources, usually in order to complete the
database with fields that can be derived or fetched in some way,
**Entrez Organism** is one of these. It fetches organism names from
Entrez. Add this source to the mine - it does not need any special
configuration.

### Loading Custom Data Sources

As well as the standard data loaders that ship with the InterMine source
tree, we supply a tool-chain for building your own data loaders for any
custom data source. There are APIs for this tool-chain in Java and Perl.
The next section will walk us through loading a custom data source by
using the Perl data loading API.

#### Tool-chain details

- **Java** - data loaders are written by sub-classing one of a set of
  basic data loading classes (eg.
  `org.intermine.bio.dataconversion.BioFileConverter`), which provide a
  scaffold.
- **Perl** - data is loaded in a two stage process, by first using a set
  of Perl modules to convert your data into our
  <a href="http://intermine.org/wiki/ItemsXmlFormat" class="external text"
  rel="nofollow">XML format</a>, which is then loaded into the database
  using a core dataloader.

#### Installing the Perl tool-chain

The Perl modules are located in our source tree at:

     SVN_ROOT/intermine/perl/InterMine-Item

and can be installed in the standard manner with the commands:

``` enter
  perl Build.PL
  sudo ./Build installdeps [if you don't have the pre-requisites]
  ./Build test [optional]
  sudo ./Build install
```

Or the entire procedure above can be automated with your preferred CPAN
client by installing `InterMine::Item`. eg:

``` enter
  cpan InterMine::Item
```

#### Our example dataset

First let's look at the data we will be adding to the database. In this
tutorial we will use data from the
<a href="http://www.genome.jp/kegg/pathway.html" class="external text"
rel="nofollow">KEGG pathway database</a>. In their words:

> "*KEGG PATHWAY mapping is the process to map molecular datasets,
> especially large-scale datasets in genomics, transcriptomics,
> proteomics, and metabolomics, to the KEGG pathway maps for biological
> interpretation of higher-level systemic functions.*"

Specifically, the data we have will provide mappings between genes and
KEGG pathways. It takes the form of two files in
**/home/gmod/Documents/Data/malaria/kegg**, look at these now.

- `pfa_gene_map.tab` - this has two tab delimited columns:
  - the first is the identifier of a malaria gene, note these are the
    same ids we have used for \`Gene.primaryIdentifier\` in other
    sources.
  - the second is a space separated list of KEGG pathway ids that the
    gene is involved in
- `map_title.tab` - also has two tab delimited columns:
  - the first is a KEGG pathway identifier
  - the second the descriptive name of the pathway

#### Our parsing strategy

We will

1.  Create data items for the data source, data set, and organism
2.  Read in the pathways file
    1.  Create a data item for each pathway in the file
    2.  Remember which item was made for each id
3.  Read in the gene mappings file
    1.  Create a data item for each gene in the file, linked to the
        pathway items made earlier

  

#### Adding The Source

There a couple of custom source types; since we will be using the Perl
toolchain, add a new source of the type **intermine-items-xml**, and set
the name to something sensible, such as **kegg-pathways**.

#### An Example Implementation of this Strategy

Click on **open parser to edit** and paste in the script below:


``` de1
#!/usr/bin/perl
 
use warnings;
use strict;
use InterMine::Model;
use InterMine::Item::Document;
 
@ARGV == 4 or die "Bad arguments: we need four arguments\n$0 model-file output-file pathways-file gene-mappings-file\n";
 
my ( $model_file, $out_file, $pathway_file, $gene_mappings_file ) = @ARGV;
 
# Create the writing apparatus
my $model = InterMine::Model->new( file => $model_file );
my $document = InterMine::Item::Document->new(
    model      => $model,
    output     => $out_file,
    auto_write => 1,
);
 
my $data_source = 'Kegg';
my $taxon_id = 36329;
my %pathway_with;
 
# Create data items for the data source, data set, and organism
 
my $datasource_item = $document->add_item(
    'DataSource',
    'name' => $data_source,
);
 
my $dataset_item = $document->add_item(
    'DataSet',
    name       => $data_source . ' data set for taxon id: ' . $taxon_id,
    dataSource => $datasource_item,
);
 
my $org_item = $document->add_item(
    'Organism',
    taxonId  => $taxon_id,
);
 
# Read in the pathways file
open(my $pathways, '<', $pathway_file) or die "Could not open $pathway_file, $!";
for (<$pathways>) {
    chomp;
    my ($id, $title) = split(/\t/);
 
    ## Create a data item for each pathway in the file
    ## Remember which item was made for each id
    $pathway_with{$id} = $document->add_item(
        'Pathway',
        identifier => $id,
        name       => $title,
    );
}
close $pathways or die "Could not close $pathway_file, $!";
 
# Read in the gene mappings file
open(my $gene_mappings, '<', $gene_mappings_file) or die "Couldn't open $gene_mappings_file, $!";
for (<$gene_mappings>) {
    chomp;
    my ($gene_id, $pathway_string) = split(/\t/);
    my @pathway_ids = split(/\s/, $pathway_string);
    my $pathway_items = [@pathway_with{@pathway_ids}];
 
    ## Create a data item for each gene in the file, linked to the pathway items made earlier
    $document->add_item('Gene',
       primaryIdentifier => $gene_id,
       organism          => $org_item,
       pathways          => $pathway_items,
       dataSets          => [$dataset_item],
    );
}
close $gene_mappings or die "Could not close $gene_mappings_file, $!";
 
# Close the document
$document->close();
 
exit;
```


#### Additions

Our Model currently has no class "Pathway" (as you can confirm by
browsing the model). We need to add it, and the Gene ↔ Pathway link. We
can do this by using the **Source Model Additions** editor.

1.  Add a new class and name it **Pathway**
2.  Add an attribute in this class and name it **name**, with the type
    set to **String**
3.  Add an attribute in this class and name it **identifier**, with the
    type set to **String**
4.  Add a collection in this class and name it **genes**, with the type
    set to **Gene** and a reverse reference named **pathways**
5.  Click **yes** when asked if you want to make the reverse reference
6.  Change the field-type of the new reverse reference in the Gene class
    to **collection**
7.  Click **no** when asked if you want to make the reverse reference.

You should end up with:

##### Gene

| FieldType  | Name     | Type    | Reverse-Reference |
|------------|----------|---------|-------------------|
| Collection | pathways | Pathway | genes             |

##### Pathway

| FieldType  | Name       | Type   | Reverse-Reference |
|------------|------------|--------|-------------------|
| Attribute  | name       | String | \-                |
| Attribute  | identifier | String | \-                |
| Collection | genes      | Gene   | pathways          |

Once these are added, if you reload the model, you should find the new
Pathway class as part of the model

#### Dealing With Integration

As we are adding gene data from this source in addition to the other
genes already in the database, we need to make sure they play nicely
together. We do this by setting up "integration keys" that tell the
integration process how to identify when we are adding details about an
object we already have in the database, rather than adding an entirely
new one.

To do this, on the **source properties** tab of the source details
panel, click on **Open keys file** to edit the integration keys.

We already have keys defined for DataSet and DataSource: we only need to
add the following line:

    Gene.key = primaryIdentifier

We do not need to add a key for Pathway, as we are not adding pathways
data from any other source.

#### Generating the XML

Now we are ready to generate the XML using our parser. First we need to
generate the model:

``` enter
  cd ~/Documents/Software/intermine/malariamine/dbmodel
  ant build-db
```

And now we can run our parser and generate XML

``` enter
  perl ~/Documents/Software/intermine/bio/sources/kegg-pathways/kegg-pathways_parser.pl \
    ~/Documents/Software/intermine/malariamine/dbmodel/build/model/genomic_model.xml \
    ~/Documents/Data/intermine/malaria/kegg/pathways.xml \
    ~/Documents/Data/intermine/malaria/kegg/map_title.tab \
    ~/Documents/Data/intermine/malaria/kegg/pfa_gene_map.tab
```

And then finally tell our mine where the data is by filling in the Data
file location in the *kegg-pathways* source properties section to
**/home/gmod/Documents/Data/intermine/malaria/kegg/pathways.xml**

## Running a Build

The **build** section of the MineManager runs the build process (a
front-end for our `project-build` script).

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ea/MineManager-buildscreen.png" width="800"
height="467" alt="MineManager-buildscreen.png" />

If you click build and there are problems with your configuration that
would prevent a successful build, the MineManager will catch that and
tell you:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/68/MineManager-cannotbuild.png" width="800"
height="458" alt="MineManager-cannotbuild.png" />

In this case we would need to go back to the database options in the
first section (**Mine Settings** → **Database** → **create databases**).

After a successful build, you will see a summary of the time taken at
each stage:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/84/MineManager-built.png" width="800"
height="467" alt="MineManager-built.png" />

The sources we have set up above should take about 650 sec (give or
take) to integrate into the database ∴ time for a break!

# Deployment

Once you have read access to a production database, you can build and
release a web application against it.

## Configuration

If you haven't already, use the MineManager to configure the tomcat
properties (**Mine Settings** → **Web Settings**):

Uses these settings for the tutorial (<span style="color:grey">*the
tomcat settings refer to a preconfigured tomcat role*</span>).

| Field | Value | Notes |
|----|----|----|
| tomcat username | manager | The name of a tomcat administrator |
| tomcat password | manager | the password for the tomcat administrator |
| superuser username | **choose a name** | The name for the webapp administrator |
| superuser password | **choose a password** | The password for the webapp administrator |

## UserProfile Initialisation

In addition to the ObjectStore DB which contains your data, there is a
separate database which holds user information (accounts, saved
preferences, query history, lists, templates, etc) and general webapp
configuration (which technically all belongs to the superuser).

Since this mine is new, we need to build a new one (we will only ever
need to do this **once** - repeating this step at a later date will
<span style="color:red">**delete all your users' data**</span>).

To build the database:

<span style="color:red">NOTE: This command will delete any data in the
userprofile database.</span>

``` enter
 cd ~/Documents/Software/intermine/malariamine/webapp
 ant build-db-userprofile
```

This command creates the SuperUser account and loads the
`default-template-queries.xml` file.

## Starting the Tomcat Webserver

Tomcat is the webserver we use to serve InterMine webapps. Start Tomcat
with this command:

``` enter
 cd ~/Documents/Software/tomcat6 
 bin/startup.sh
```

Visit the Tomcat manager at
<a href="http://localhost:8080/" class="external free"
rel="nofollow">http://localhost:8080/</a>. The username and password
required to access the manager are **manager** and **manager**

## Deploying the Webapp to Tomcat

Run the following command to release your webapp:

``` enter
 cd ~/Documents/Software/intermine/malariamine/webapp
 ant clean default remove-webapp release-webapp
```

This will fetch the model from the database and generate the model java
code, remove and release the webapp. The default target forces a rebuild
of the .war file. (The clean is not always necessary, but it doesn't
hurt to include it, and remove-webapp is only really required when you
have previously released before).

Visit your newly minted mine:
<a href="http://localhost:8080/malariamine" class="external free"
rel="nofollow">http://localhost:8080/malariamine</a>

# Accessing Your Data Through the Webapp

In this section we will look at how you can examine, analyse and
aggregate your data in the webapp, looking both at the webapp you have
built, and FlyMine.

## Single Objects (Report Pages)

Each object in the database (each Gene, Chromosome, Exon, Protein, etc)
will have a report page that can display:

- The properties of the object
- Links to other objects this object references
- Widgets that display data about the object (GBrowse/Cytoscape)
- Links to sites that contain information about the objects
- Homologues of the object in other organisms/mines
- Templates that you can run on the given object, and the number of
  results you can expect.

In the top right there is a search box which uses the Lucene
quick-search. Enter **ald** to find the *Aldolase* gene.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b5/Report-page-props.png" width="758"
height="680" alt="Report-page-props.png" />

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/2a/Report-page-templates.png/700px-Report-page-templates.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/2a/Report-page-templates.png/1050px-Report-page-templates.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2a/Report-page-templates.png 2x"
width="700" height="377" alt="Report-page-templates.png" />

## Multiple Objects (Lists)

Lists of Objects of any type can be made and explored. The pages that
display data on these lists are called "*List Report Pages*", and can
display:

- The properties of the objects in the list
- Links to tools in other sites
- Tools that convert a list into:
  - A list of a different type: (eg. *gene* → *exon*)
  - A list of orthologues
- Tools that aggregate data over the list:
  - Enrichment
  - Distribution
  - Expression
  - Localisation
- Queries run on all objects in the list

Click the **Lists** tab to see the lists section. Here you can either:

- **Upload** a list of identifiers to create a new list
- **View** an existing list.

On the list view page you can perform set logic on lists of objects
(intersection/union/etc) to derive new lists.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/78/List-view-page.png" width="990"
height="482" alt="List-view-page.png" />

From the *view* sub-tab, select a list you think looks interesting:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/74/List-analysis-page.png" width="1258"
height="667" alt="List-analysis-page.png" />

## Exporting Data and Summarising Columns

When viewing lists or Query results these two actions are always
available:

### Exporting Data

Data can be exported from Lists and Query results in a number of
formats:

- Flat file formats (TSV/CSV)
- Excel .xls format
- GFF3
- Fasta
- Galaxy (for use in a workflow)

The export link is always in the top left of the page:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/04/Export-options.png" width="366"
height="219" alt="Export-options.png" />

### Viewing Column Summaries

Each column header also has a summary symbol (Σ) which helps you get an
overview over the data contained in that column:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/9c/Column-header.png" width="497"
height="303" alt="Column-header.png" />

## Running Queries

Queries in the webapp are created and run using the *QueryBuilder*
interface, which helps you build queries using the data model as a
guide.

1.  Click on the **QueryBuilder** tab  
    <img
    src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/07/Query-builder-tab.png" width="486"
    height="102" alt="Query-builder-tab.png" />
2.  Select **gene** as the type of object we want to query for  
    <img
    src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/bb/Query-select-gene.png" width="493"
    height="258" alt="Query-select-gene.png" />
3.  Click **summary** next to **gene** in the Model browser
4.  Scroll down to pathways
    1.  Expand the pathways collection
    2.  Click **constrain** next to **name**
    3.  Type in **p** into the value box in the pop-up
    4.  Select **Pentose Phosphate Pathway** from the autocomplete
        drop-down  
        <img
        src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e7/Query-built-query.png" width="822"
        height="654" alt="Query-built-query.png" />
5.  Select **Show results**

You should see results like this:
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/32/Query-results.png" width="1256"
height="553" alt="Query-results.png" />

## Making Lists from Query Results

The query results page provides links to the report pages of individual
objects, and we can create lists of the objects returned. To create a
list, click the check-box in the header of the column containing the
type of object you want to make into a list, here, any of the gene
fields:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e3/Making-a-list1.png" width="492"
height="393" alt="Making-a-list1.png" />

Then name your list:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2b/Making-a-list2.png" width="337"
height="108" alt="Making-a-list2.png" />

And you're done.

## Running Templates

Templates are queries that have been pre-written and saved for later
re-use, either by and for a single user, or for all the users of the
mine. Rather than running the same query over and over, they allow for
their parameters to be changed, and they automatically present a simple
web-form interface.

When we build our mine we included a number of default templates, and
large mines such as FlyMine have many more. Click on the **Templates**
tab to see what templates are available (you can type a name, or part of
a name into the box at the top to filter the list of templates):

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/09/Flymine-templates.png" width="816"
height="647" alt="Flymine-templates.png" />

Select the **Pathway → Genes** template to see how the template
interface differs from the query interface:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/7a/Template-form.png" width="768"
height="365" alt="Template-form.png" />

Running this query should get us the same results (more or less) than
the query we wrote ourselves. To see where it might differ, we can view
the underlying query by selecting **Edit Query**.

## Making Templates

To make templates you and others can use later, you need to be logged
in. When you are, you will be able to edit templates that belong to you,
and make new templates:

Making a template is as simple as making a query, and then clicking
**start building a template query**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/4a/Logged-in-options.png" width="243"
height="142" alt="Logged-in-options.png" />

You can choose what constraints are shown to the user (whether they are
editable or not), and whether they are required or optional.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/cb/Template-editing.png" width="836"
height="635" alt="Template-editing.png" />

# Accessing Your Data through the Webservice

As well as the graphical webapp interface, each mine also offers a
webservice that exposes an external, scriptable programmatic API to the
data (although this can be turned off at deployment). The webservice
takes the form of a RESTful(*-ish*) set of resource paths, that accept
either GET or POST HTTP requests (for further details see
<a href="http://www.intermine.org/wiki/WebService" class="external text"
rel="nofollow">here</a>).

## Raw URLs

Anything you can do with the webservice ultimately boils down to
requests to urls, and the clients we provide are simply ways to generate
and validate urls, and manage the results they return. An example of a
websevice url is:

    http://preview.flymine.org/preview/service/template/results?name=Gene_Protein&constraint1=Gene&op1=LOOKUP&value1=big&extra1=&size=10&format=jsonobjects

Here the different parts are:

<a href="http://preview.flymine.org/preview/service"
class="external free"
rel="nofollow">http://preview.flymine.org/preview/service</a>  
The base url for this service

template/results  
The resource path (in this case, results for templates)

?name=Gene_Protein&constraint1=Gene&op1=LOOKUP&value1=big&extra1=&size=10&format=jsonobjects  
The query string, a URL-encoded name-value pair set that tells the
resource what we want to do

### Asking the Webapp to generate them for you

Obviously generating these urls is possible, but non-obvious. The
simplest way to get a url for a query you want to run again is to ask
the webapp to generate it for you. You can do this when you are on the
edit query page or a template form page by selecting the **webservice
url** link at the bottom of the page:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a5/Getting-query-xml.png" width="245"
height="82" alt="Getting-query-xml.png" />

This will get you a url you can use with *wget* or *curl*, although it
will be difficult to edit and adjust.

## The Command-Line utilities

For very simple applications of the webservice, we also provide command
line utilities that can take a query as XML or a template as a name and
a list of parameters and return you the result as a flat-file. This is
much more readable than simply using URLs.

(The command line utilities are installed automatically when the Perl
Webservice client modules are installed)

### Getting XML from the Webapp

Queries are represented in the webservice as XML strings, and rather
than having to write them yourself (although you
<a href="http://www.intermine.org/wiki/QueryXML" class="external text"
rel="nofollow">can</a>), again the webservice will generate this for you
if you want. Just select **Query XML** at the bottom of the page:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a5/Getting-query-xml.png" width="245"
height="82" alt="Getting-query-xml.png" />

Which in the case of our pathways query would look like this:


``` de1
<query name="" model="genomic" view="Pathway.identifier Pathway.name Pathway.genes.primaryIdentifier Pathway.genes.symbol" 
  longDescription="For a specified KEGG, REACTOME or FlyReactome pathway, list all the genes that are involved for a particular organism" 
  sortOrder="Pathway.identifier asc" constraintLogic="B and C and A">
  <pathDescription pathString="Pathway.genes" description="Gene"/>
  <constraint path="Pathway.name" code="A" op="=" value="Pentose phosphate pathway"/>
  <constraint path="Pathway.dataSets.name" code="B" op="=" value="KEGG pathways data set"/>
  <constraint path="Pathway.genes.organism.name" code="C" op="=" value="Drosophila melanogaster"/>
</query>
```


To run the xml you got, then use the *run-im-query* program:

    run-im-query --url www.flymine.org/query path/to/query.xml

### Running Templates

To run a template all we need is the name of the template, and the
parameters we want to specify. This information is all included in the
query string part of the webservice url. For example, to make a command
line request for the pathways → genes template we can run the following
command:

    run-im-template --url www.flymine.org/query --title Pathway_Genes value1="Pentose phosphate pathway" value2="Drosophila melanogaster" value3="KEGG pathways data set"

## Access from Perl & Java programs

To simplify access to the webservice from Perl and Java programs, we
supply client software to run queries with. This software is included in
our source tree:

- **Perl**: `~/Documents/Software/intermine/perl/Webservice-InterMine`
- **Java**: `~/Documents/Software/intermine/webservice/client`

But the easiest way to install these clients is respectively:

- **Perl**: install with a cpan client:
    cpan Webservice::InterMine

- **Java**: download the client package from the appropriate webapp, by
  visiting the API tab

### Webapp/Webservice Integration

Each mine now includes an API tab that provides links and guidance on
using the programmatic client software. To get the Java client package
for a particular webservice, make sure to click on the **Java** subtab
(in the top-left), and then click the **download** link in the first
section. <img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ec/Perl-api_tab.png" width="834" height="464"
alt="Perl-api tab.png" />
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/12/Java-api_tab.png" width="834" height="425"
alt="Java-api tab.png" />

In addition to this help page, every query and template you visit will
offer to write a script or a java program for you that you can just save
and run. To get this, click on the **Perl** or **Java** link to see the
generated code:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/7a/Template-form.png" width="768"
height="365" alt="Template-form.png" />

Additional help is provided at the CPAN:
<a href="http://search.cpan.org/perldoc?Webservice::InterMine"
class="external free"
rel="nofollow">http://search.cpan.org/perldoc?Webservice::InterMine</a>,
or though the use of the `perldoc` command:

    perldoc Webservice::InterMine

### Accessing Templates

The following is the complete code you would get by clicking on the
**Perl** link above:


``` de1
use Webservice::InterMine 0.9412 'http://www.flymine.org/release-27.0/service';
 
# This is an automatically generated script to run the FlyMine template
# You should install the Webservice::InterMine modules to run this example, e.g. sudo cpan Webservice::InterMine
 
# template name - Pathway_Genes
# template description - For a specified KEGG, REACTOME or FlyReactome pathway, list all the genes that are involved for a particular organism
 
my $template = Webservice::InterMine->template('Pathway_Genes')
    or die 'Could not find template';
 
# You can edit the constraint values below
# A    Pathway.name    Show genes in pathway:
# B    Pathway.dataSets.name    From dataset (KEGG, Reactome or FlyReactome):
# C    Pathway.genes.organism.name    For organism:
 
my $results = $template->results_with(
    opA    => '=',
    valueA => 'Pentose phosphate pathway',
    opB    => '=',
    valueB => 'KEGG pathways data set',
    opC    => '=',
    valueC => 'Drosophila melanogaster',
    as     => 'string',
);
 
print $results."\n";
```


The equivalent **Java** query would look like this:


``` de1
package flymine;
 
import java.util.ArrayList;
import java.util.List;
 
import org.intermine.webservice.client.core.ServiceFactory;
import org.intermine.webservice.client.services.TemplateService;
import org.intermine.webservice.client.template.TemplateParameter;
 
/**
 * This is an automatically generated Java program to run the FlyMine template.
 * template name - Pathway_Genes
 * template description - For a specified KEGG, REACTOME or FlyReactome pathway, list all the genes that are involved for a particular organism
 *
 * @author FlyMine
 *
 */
public class TemplatePathwayGenes
{
    private static String serviceRootUrl = "http://www.flymine.org/release-27.0/service";
 
    /**
     * @param args command line arguments
     */
    public static void main(String[] args) {
 
        TemplateService service = new ServiceFactory(serviceRootUrl, "TemplateService").getTemplateService();
 
        List<TemplateParameter> parameters = new ArrayList<TemplateParameter>();
 
        // You can edit the constraint values below
        // Constraint description - Show genes in pathway:
        parameters.add(new TemplateParameter("Pathway.name", "eq", "Pentose phosphate pathway"));
        // Constraint description - From dataset (KEGG, Reactome or FlyReactome):
        parameters.add(new TemplateParameter("Pathway.dataSets.name", "eq", "KEGG pathways data set"));
        // Constraint description - For organism:
        parameters.add(new TemplateParameter("Pathway.genes.organism.name", "eq", "Drosophila melanogaster"));
 
        // Name of a public template, private templates are not supported at the moment
        String templateName = "Pathway_Genes";
 
        // Number of results are fetched
        int maxCount = 10000;
        List<List<String>> result = service.getResult(templateName, parameters, maxCount);
        System.out.print("Results: \n");
        for (List<String> row : result) {
            for (String cell : row) {
                System.out.print(cell + " ");
            }
            System.out.print("\n");
        }
    }
}
```


### Accessing Queries

The **Perl** to access the same underlying query as that above using the
query service would look like this:


``` de1
use Webservice::InterMine 0.9412 'http://www.flymine.org/release-27.0/service';
 
# This is an automatically generated script to run the FlyMine query
# You should install the Webservice::InterMine modules to run this example, e.g. sudo cpan Webservice::InterMine
 
# query description - For a specified KEGG, REACTOME or FlyReactome pathway, list all the genes that are involved for a particular organism
 
my $query = Webservice::InterMine->new_query;
 
# The view specifies the output columns
$query->add_view(qw/
    Pathway.identifier
    Pathway.name
    Pathway.genes.primaryIdentifier
    Pathway.genes.symbol
/);
 
# Sort by
$query->set_sort_order('Pathway.identifier' => 'ASC');
 
# You can edit the constraint values below
$query->add_constraint(
    path  => 'Pathway.name',
    op    => '=',
    value => 'Pentose phosphate pathway',
    code => 'A',
);
 
$query->add_constraint(
    path  => 'Pathway.dataSets.name',
    op    => '=',
    value => 'KEGG pathways data set',
    code => 'B',
);
 
$query->add_constraint(
    path  => 'Pathway.genes.organism.name',
    op    => '=',
    value => 'Drosophila melanogaster',
    code => 'C',
);
 
# Constraint Logic
$query->logic('B and C and A');
 
print $query->results(as => 'string')."\n";
```


The equivalent **Java** would look like this:


``` de1
package flymine;
 
import java.io.IOException;
import java.util.List;
 
import org.intermine.metadata.Model;
import org.intermine.webservice.client.core.ServiceFactory;
import org.intermine.webservice.client.services.ModelService;
import org.intermine.webservice.client.services.QueryService;
import org.intermine.pathquery.PathQuery;
import org.intermine.pathquery.OrderDirection;
import org.intermine.pathquery.Constraints;
 
/**
 * This is an automatically generated Java program to run the FlyMine query.
 *
 * @author FlyMine
 *
 */
public class QueryClient
{
    private static String serviceRootUrl = "http://www.flymine.org/release-27.0/service";
 
    /**
     * @param args command line arguments
     * @throws IOException
     */
    public static void main(String[] args) {
        QueryService service =
            new ServiceFactory(serviceRootUrl, "QueryService").getQueryService();
        Model model = getModel();
        PathQuery query = new PathQuery(model);
 
        // Add views
        query.addViews("Pathway.identifier",
                "Pathway.name",
                "Pathway.genes.primaryIdentifier",
                "Pathway.genes.symbol");
 
        // Add orderby
        query.addOrderBy("Pathway.identifier", OrderDirection.ASC);
 
        // Add constraints and you can edit the constraint values below
        query.addConstraint(Constraints.eq("Pathway.name", "Pentose phosphate pathway"), "A");
 
        query.addConstraint(Constraints.eq("Pathway.dataSets.name", "KEGG pathways data set"), "B");
 
        query.addConstraint(Constraints.eq("Pathway.genes.organism.name", "Drosophila melanogaster"), "C");
 
        // Add constraintLogic
        query.setConstraintLogic("B and C and A");
 
        // Number of results are fetched
        int maxCount = 10000;
        List<List<String>> result = service.getResult(query, maxCount);
        System.out.print("Results: \n");
        for (List<String> row : result) {
            for (String cell : row) {
                System.out.print(cell + " ");
            }
            System.out.print("\n");
        }
    }
 
    private static Model getModel() {
        ModelService service = new ServiceFactory(serviceRootUrl, "ModelService").getModelService();
        return service.getModel();
    }
}
```


## Data Formats

Thus far we have received all our results as tab-delimited rows of data,
but there are other formats we can request:

### Row Based Formats

tab  
The default format - simple tab separated values

csv  
As above, but comma separated, and double quoted

jsonrows  
Row based json format:
<a href="http://intermine.org/wiki/JSONRowFormat" class="external free"
rel="nofollow">http://intermine.org/wiki/JSONRowFormat</a>

xml  
Structured data format with the structure


``` de1
<ResultSet><Row><i></i>...</Row>...</ResultSet>
```


### Record Based Formats

We have one format (**jsonobjects**) that treats records as the unit of
the query, returning an object with arbitrarily deep nesting of
references and collections: see
<a href="http://intermine.org/wiki/JSONRowFormat" class="external free"
rel="nofollow">http://intermine.org/wiki/JSONRowFormat</a> for more. You
can see an example of the results in this format below:


``` de1
{
  'rootClass': 'Gene',
  'modelName': 'genomic',
  'views':     ["Gene.primaryIdentifier", "Gene.symbol", "Gene.proteins.primaryAccession", "Gene.proteins.primaryIdentifier"],
  'executionTime':  '2011.01.14 13:32::14',
  'results':   [
    {
      "primaryIdentifier": null,
      "symbol":            null,
      "objectId":          1719268932,
      "class":             "Gene",
      "proteins":          [
        {
          "primaryAccession":  "A2AKB2",
          "primaryIdentifier": "A2AKB2_MOUSE",
          "objectId":          1719574559,
          "class":             "Protein"
        },
        {
          "primaryAccession":  "P61965",
          "primaryIdentifier": "WDR5_MOUSE",
          "objectId":          1719268927,
          "class":             "Protein"
        },
        {
          "primaryAccession":  "Q3UNQ3",
          "primaryIdentifier": "Q3UNQ3_MOUSE",
          "objectId":          1719447174, 
          "class":             "Protein"
        }
      ]
    }
  ]
}
```


### Getting the Total

Set the format to **count**

## Access From Within the Browser

We have a javascript client as well, called IMBedding
(<a href="http://www.intermine.org/imbedding" class="external free"
rel="nofollow">http://www.intermine.org/imbedding</a>) which enables
queries to any Mine webservice from any browser, and display tables of
data inline. Please look at the imbedding tutorial to see more, but an
example is included below as a demonstration:


``` de1
 <head>
    <!-- jQuery is hosted by Google -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js" 
        type="text/javascript">
    </script>
    <!-- jquery-jsonp is likewise available from an online repository -->
    <script src="http://jquery-jsonp.googlecode.com/files/jquery.jsonp-2.1.4.min.js" 
        type="text/javascript">
    </script>
    <!-- Similarly imbedding.js is hosted on intermine.org -->
    <script src="http://www.intermine.org/lib/imbedding/0.1/imbedding.min.js" 
        type="text/javascript">
    </script>
 </head>
 
 <script type="text/javascript">
    IMBedding.setBaseUrl("http://preview.flymine.org/preview");
    IMBedding.loadTemplate(
        {
            name:           "Gene_RegionOverlappingTFbindingsite",
 
            constraint1:    "Gene",
            op1:            "LOOKUP",
            value1:         "CG2328",
            code1:          "A",
        },            
        '#some-placeholder',
    );
 </script>
```





<span id="top"></span>




# <span dir="auto">Tripal Tutorial (v0.3.1b)</span>












## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Introduction
  to Tripal</span>](#Introduction_to_Tripal)
  - [<span class="tocnumber">1.1</span> <span class="toctext">What is
    Tripal</span>](#What_is_Tripal)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Content
    Management System</span>](#Content_Management_System)
  - [<span class="tocnumber">1.3</span>
    <span class="toctext">Drupal</span>](#Drupal)
  - [<span class="tocnumber">1.4</span>
    <span class="toctext">Chado</span>](#Chado)
  - [<span class="tocnumber">1.5</span> <span class="toctext">Goals of
    Tripal</span>](#Goals_of_Tripal)
  - [<span class="tocnumber">1.6</span> <span class="toctext">Structure
    of Tripal</span>](#Structure_of_Tripal)
  - [<span class="tocnumber">1.7</span> <span class="toctext">Sites
    Running Tripal</span>](#Sites_Running_Tripal)
  - [<span class="tocnumber">1.8</span>
    <span class="toctext">Resources</span>](#Resources)
  - [<span class="tocnumber">1.9</span>
    <span class="toctext">Contributing
    Organizations</span>](#Contributing_Organizations)
  - [<span class="tocnumber">1.10</span>
    <span class="toctext">Funding</span>](#Funding)
  - [<span class="tocnumber">1.11</span>
    <span class="toctext">Additional
    Support</span>](#Additional_Support)
- [<span class="tocnumber">2</span>
  <span class="toctext">Pre-planning</span>](#Pre-planning)
  - [<span class="tocnumber">2.1</span> <span class="toctext">IT
    Infrastructure</span>](#IT_Infrastructure)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Technical
    Skills</span>](#Technical_Skills)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Why Use
    Tripal</span>](#Why_Use_Tripal)
- [<span class="tocnumber">3</span> <span class="toctext">Server
  Setup</span>](#Server_Setup)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Install
    the Apache Web Server</span>](#Install_the_Apache_Web_Server)
  - [<span class="tocnumber">3.2</span> <span class="toctext">Install
    the PostgreSQL Server</span>](#Install_the_PostgreSQL_Server)
  - [<span class="tocnumber">3.3</span> <span class="toctext">Install &
    Setup PHP</span>](#Install_.26_Setup_PHP)
  - [<span class="tocnumber">3.4</span> <span class="toctext">Install
    phpPgAdmin</span>](#Install_phpPgAdmin)
  - [<span class="tocnumber">3.5</span> <span class="toctext">Prepare
    Apache</span>](#Prepare_Apache)
- [<span class="tocnumber">4</span> <span class="toctext">Database
  Setup</span>](#Database_Setup)
- [<span class="tocnumber">5</span> <span class="toctext">Install
  Drupal</span>](#Install_Drupal)
  - [<span class="tocnumber">5.1</span> <span class="toctext">Software
    Installation</span>](#Software_Installation)
  - [<span class="tocnumber">5.2</span>
    <span class="toctext">Configuration
    File</span>](#Configuration_File)
  - [<span class="tocnumber">5.3</span> <span class="toctext">Final
    directory creation</span>](#Final_directory_creation)
  - [<span class="tocnumber">5.4</span>
    <span class="toctext">Compatibility with other
    tools</span>](#Compatibility_with_other_tools)
  - [<span class="tocnumber">5.5</span> <span class="toctext">Web-based
    Steps</span>](#Web-based_Steps)
  - [<span class="tocnumber">5.6</span> <span class="toctext">Drupal
    Cron Entry</span>](#Drupal_Cron_Entry)
- [<span class="tocnumber">6</span> <span class="toctext">Explore
  Drupal</span>](#Explore_Drupal)
  - [<span class="tocnumber">6.1</span> <span class="toctext">User
    Account Page</span>](#User_Account_Page)
  - [<span class="tocnumber">6.2</span> <span class="toctext">Creating
    Content</span>](#Creating_Content)
  - [<span class="tocnumber">6.3</span> <span class="toctext">Site
    Administration</span>](#Site_Administration)
    - [<span class="tocnumber">6.3.1</span>
      <span class="toctext">Content
      Management</span>](#Content_Management)
    - [<span class="tocnumber">6.3.2</span> <span class="toctext">Site
      Building</span>](#Site_Building)
      - [<span class="tocnumber">6.3.2.1</span>
        <span class="toctext">Modules</span>](#Modules)
      - [<span class="tocnumber">6.3.2.2</span>
        <span class="toctext">Themes</span>](#Themes)
      - [<span class="tocnumber">6.3.2.3</span>
        <span class="toctext">Blocks</span>](#Blocks)
      - [<span class="tocnumber">6.3.2.4</span>
        <span class="toctext">Menus</span>](#Menus)
      - [<span class="tocnumber">6.3.2.5</span>
        <span class="toctext">URL Path</span>](#URL_Path)
      - [<span class="tocnumber">6.3.2.6</span>
        <span class="toctext">Site
        Configuration</span>](#Site_Configuration)
  - [<span class="tocnumber">6.4</span> <span class="toctext">User
    Accounts</span>](#User_Accounts)
- [<span class="tocnumber">7</span> <span class="toctext">Prepare Drupal
  for Tripal</span>](#Prepare_Drupal_for_Tripal)
  - [<span class="tocnumber">7.1</span> <span class="toctext">Theme
    Installation</span>](#Theme_Installation)
  - [<span class="tocnumber">7.2</span> <span class="toctext">Theme
    Configuration</span>](#Theme_Configuration)
  - [<span class="tocnumber">7.3</span> <span class="toctext">Module
    Installation</span>](#Module_Installation)
- [<span class="tocnumber">8</span> <span class="toctext">Tripal
  Installation</span>](#Tripal_Installation)
  - [<span class="tocnumber">8.1</span> <span class="toctext">Main
    Package Installation</span>](#Main_Package_Installation)
  - [<span class="tocnumber">8.2</span> <span class="toctext">Tripal
    Extension Module
    Installation</span>](#Tripal_Extension_Module_Installation)
- [<span class="tocnumber">9</span> <span class="toctext">Using
  Tripal</span>](#Using_Tripal)
  - [<span class="tocnumber">9.1</span> <span class="toctext">Installing
    Chado</span>](#Installing_Chado)
  - [<span class="tocnumber">9.2</span> <span class="toctext">Jobs
    Management</span>](#Jobs_Management)
  - [<span class="tocnumber">9.3</span> <span class="toctext">Using
    PhpPgAdmin to View Chado/Drupal
    Tables</span>](#Using_PhpPgAdmin_to_View_Chado.2FDrupal_Tables)
  - [<span class="tocnumber">9.4</span> <span class="toctext">Enable
    Additional Tripal Modules</span>](#Enable_Additional_Tripal_Modules)
  - [<span class="tocnumber">9.5</span> <span class="toctext">Enable the
    Tripal Theme</span>](#Enable_the_Tripal_Theme)
  - [<span class="tocnumber">9.6</span> <span class="toctext">Controlled
    Vocabularies: Installing
    CVs</span>](#Controlled_Vocabularies:_Installing_CVs)
  - [<span class="tocnumber">9.7</span> <span class="toctext">Creating
    Organism Pages</span>](#Creating_Organism_Pages)
    - [<span class="tocnumber">9.7.1</span> <span class="toctext">What
      if Our Organism is Already in
      Chado?</span>](#What_if_Our_Organism_is_Already_in_Chado.3F)
    - [<span class="tocnumber">9.7.2</span> <span class="toctext">What
      if My Organism Is Not Present in
      Chado?</span>](#What_if_My_Organism_Is_Not_Present_in_Chado.3F)
  - [<span class="tocnumber">9.8</span> <span class="toctext">Creating
    an Analysis</span>](#Creating_an_Analysis)
  - [<span class="tocnumber">9.9</span> <span class="toctext">Creating a
    Database Cross
    Reference</span>](#Creating_a_Database_Cross_Reference)
  - [<span class="tocnumber">9.10</span> <span class="toctext">Loading
    Feature Data</span>](#Loading_Feature_Data)
    - [<span class="tocnumber">9.10.1</span>
      <span class="toctext">Loading a GFF3
      File</span>](#Loading_a_GFF3_File)
    - [<span class="tocnumber">9.10.2</span>
      <span class="toctext">Loading FASTA
      files</span>](#Loading_FASTA_files)
  - [<span class="tocnumber">9.11</span> <span class="toctext">Creating
    Feature Pages</span>](#Creating_Feature_Pages)
  - [<span class="tocnumber">9.12</span>
    <span class="toctext">Materialized
    Views</span>](#Materialized_Views)
  - [<span class="tocnumber">9.13</span> <span class="toctext">Feature
    Page Configuration</span>](#Feature_Page_Configuration)
  - [<span class="tocnumber">9.14</span> <span class="toctext">Loading
    Functional Data Using Extension
    Modules</span>](#Loading_Functional_Data_Using_Extension_Modules)
    - [<span class="tocnumber">9.14.1</span>
      <span class="toctext">Loading Blast
      Results</span>](#Loading_Blast_Results)
    - [<span class="tocnumber">9.14.2</span>
      <span class="toctext">Loading InterProScan
      Results</span>](#Loading_InterProScan_Results)
    - [<span class="tocnumber">9.14.3</span>
      <span class="toctext">Loading KEGG Analysis
      Results</span>](#Loading_KEGG_Analysis_Results)
  - [<span class="tocnumber">9.15</span> <span class="toctext">Creating
    Stocks</span>](#Creating_Stocks)
  - [<span class="tocnumber">9.16</span> <span class="toctext">Using the
    GBrowse Extension
    Module</span>](#Using_the_GBrowse_Extension_Module)
  - [<span class="tocnumber">9.17</span> <span class="toctext">Drupal
    Taxonomy & Searching</span>](#Drupal_Taxonomy_.26_Searching)
    - [<span class="tocnumber">9.17.1</span>
      <span class="toctext">Drupal Taxonomy</span>](#Drupal_Taxonomy)
    - [<span class="tocnumber">9.17.2</span>
      <span class="toctext">Drupal Searching</span>](#Drupal_Searching)
- [<span class="tocnumber">10</span>
  <span class="toctext">Customizations</span>](#Customizations)
  - [<span class="tocnumber">10.1</span> <span class="toctext">Panels &
    Custom Layouts</span>](#Panels_.26_Custom_Layouts)
    - [<span class="tocnumber">10.1.1</span>
      <span class="toctext">Adding a GBrowse
      Image</span>](#Adding_a_GBrowse_Image)
  - [<span class="tocnumber">10.2</span> <span class="toctext">Drupal
    Views</span>](#Drupal_Views)
    - [<span class="tocnumber">10.2.1</span>
      <span class="toctext">Changing Tripal Default
      Views</span>](#Changing_Tripal_Default_Views)
  - [<span class="tocnumber">10.3</span> <span class="toctext">Editing
    Template Files</span>](#Editing_Template_Files)
    - [<span class="tocnumber">10.3.1</span>
      <span class="toctext">Adding a GBrowse
      Image</span>](#Adding_a_GBrowse_Image_2)


## <span id="Introduction_to_Tripal" class="mw-headline">Introduction to Tripal</span>

This tutorial is for Tripal version v0.3.1b. This tutorial is designed
to be used with a fresh install of Ubuntu 11.04 (although may work for
earlier versions as well), with default service installation paths. For
example, by default, the Apache document root is /var/www. If this is
not the case for your server you will need to manually convert the paths
shown in this tutorial to wherever your Apache document root may reside.

  

### <span id="What_is_Tripal" class="mw-headline">What is Tripal</span>

Tripal is a suite of PHP5 modules that bridges the Drupal Content
Managment System (CMS) and GMOD Chado.

<a href="File:600px-WhatisTripal.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/ea/600px-WhatisTripal.png/400px-600px-WhatisTripal.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ea/600px-WhatisTripal.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ea/600px-WhatisTripal.png 2x"
width="400" height="271" alt="600px-WhatisTripal.png" /></a>

### <span id="Content_Management_System" class="mw-headline">Content Management System</span>

*Definition From Wikipedia:*

A **content management system** (**CMS**) is the **collection of
procedures** used to manage work flow in a collaborative environment.
These procedures can be manual or computer-based. The procedures are
designed to do the following:

- Allow for a large number of people to contribute to and share stored
  data
- Control access to data, based on user roles (defining which
  information users or user groups can view, edit, publish, etc.)
- Aid in easy storage and retrieval of data
- Reduce repetitive duplicate input
- Improve the ease of report writing
- Improve communication between users

In a CMS, data can be defined as nearly anything: documents, movies,
pictures, phone numbers, scientific data, and so forth. CMSs are
frequently used for storing, controlling, revising, semantically
enriching, and publishing documentation. Serving as a central
repository, the CMS increases the version level of new updates to an
already existing file. Version control is one of the primary advantages
of a CMS.

### <span id="Drupal" class="mw-headline">Drupal</span>

Drupal is an open-source freely available CMS with thousands of users
and existing sites. Features of Drupal

- A well-supporting community.
- Books, tutorials and online forums for help .
- Hundreds of user-contributed extension modules that are freely
  available.
- Hundreds of user-contributed themes to instantly change the
  look-and-feel of the site
- User management infrastructure.
- Allows for non-coding manipulation of the website contents. Anyone can
  edit content.
- Easy to install and maintain

Drupal website: <a href="http://www.drupal.org" class="external free"
rel="nofollow">http://www.drupal.org</a>

Drupal modules:
<a href="http://www.drupal.org/project/modules" class="external free"
rel="nofollow">http://www.drupal.org/project/modules</a>

Drupal themes:
<a href="http://www.drupal.org/project/themes" class="external free"
rel="nofollow">http://www.drupal.org/project/themes</a>

  

### <span id="Chado" class="mw-headline">Chado</span>

The session for Chado was presented yesterday
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>, so no need
for introdcutions. However, one thing to remember is that Chado has a
modular structure:



- Audit - for database audits
- Companalysis - for data from computational analysis
- Contact - for people, groups, and organizations
- Controlled Vocabulary (cv) - for controlled vocabularies and
  ontologies
- Expression - for summaries of RNA and protein expresssion
- General - for identifiers
- Genetic - for genetic data and genotypes
- Library - for descriptions of molecular libraries
- Mage - for microarray data
- Map - for maps without sequence
- Organism - for taxonomic data
- Phenotype - for phenotypic data
- Phylogeny - for organisms and phylogenetic trees
- Publication (pub) - for publications and references
- Sequence - for sequences and sequence features
- Stock - for specimens and biological collections
- WWW -



Tripal is also modular along these same designations.

### <span id="Goals_of_Tripal" class="mw-headline">Goals of Tripal</span>

- Simplify Construction of Biological Databases
  - Reduce time of development
  - Reduce costs
  - Reduce technical resources (i.e. programmers, systems admins).
  - A non-technical site administrator can add content without knowing
    PHP, HTML, JavaScript.

<!-- -->

- Greater Flexibility of the Biological Website
  - Social Networking
  - Non-biological content
  - Outreach, tutorials, documentation, protocols, publications

<!-- -->

- Expandability
  - Site can be programmatically expanded in any way
  - Changes to base-code are not needed but modules are added.
  - Availability of an Application Programmer Interface (API)

<!-- -->

- Reusability
  - All code can be shared. Expansion modules created by one group can
    be shared with all.

### <span id="Structure_of_Tripal" class="mw-headline">Structure of Tripal</span>

Tripal is a collection of modules that integrate with Drupal. These
modules are divided into hierarchical categories:

<a href="File:TripalLayers.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/05/TripalLayers.png" width="393" height="411"
alt="TripalLayers.png" /></a>

The Tripal Core level contains supportive functionality for all other
modules. It contains

- A jobs management utility
- A utility to manage materialized views
- An API for these features
- Functions for managing module specific CV terms
- Functions for interfacing with Chado.

  
The Chado-centric modules provide:

- Edit/Update/Delete for Chado modules.
- Bulk loaders for these data
- Basic visualizations for data in Chado specific for the module
- An API for easily accessing Chado.

  
Analysis modules provide

- Custom visualization for specific analyses (e.g. Blast, KEGG,
  InterProScan, Unigene construction)
- Uses the API from the Tripal Analysis (Chado-centric) module.

  
Applications:

- These are full blown applications that use Tripal, Drupal and Chado
  and typically consist of several Chado-centric modules, Analysis
  modules and custom built modules. (e.g. Breeders Toolbox currently
  under construction).

### <span id="Sites_Running_Tripal" class="mw-headline">Sites Running Tripal</span>

| Site Name | URL |
|----|----|
| Pulse Crops Genomics & Breeding | <a href="http://knowpulse2.usask.ca/portal/" class="external free"
rel="nofollow">http://knowpulse2.usask.ca/portal/</a> |
| Genome Database for Vaccinium | <a href="http://www.vaccinium.org" class="external free"
rel="nofollow">http://www.vaccinium.org</a> |
| Cool Season Food Legume Database | <a href="http://www.gabcsfl.org" class="external free"
rel="nofollow">http://www.gabcsfl.org</a> |
| Cacao Genome Database | <a href="http://www.cacaogenomedb.org" class="external free"
rel="nofollow">http://www.cacaogenomedb.org</a> |
| Fagaceae Genome Web | <a href="http://www.fagaceae.org" class="external free"
rel="nofollow">http://www.fagaceae.org</a> |
| Citrus Genome Database | <a href="http://www.citrusgenomedb.org" class="external free"
rel="nofollow">http://www.citrusgenomedb.org</a> |
| Marine Genomics Project | <a href="http://www.marinegenomics.org" class="external free"
rel="nofollow">http://www.marinegenomics.org</a> |

### <span id="Resources" class="mw-headline">Resources</span>

The Tripal Sourceforge home site where you can find everything about
Tripal: <a href="http://tripal.sourceforge.net" class="external free"
rel="nofollow">http://tripal.sourceforge.net</a>

GMOD Tripal mailing lists:
<a href="GMOD_Mailing_Lists" class="external free"
rel="nofollow">http://gmod.org/wiki/GMOD_Mailing_Lists</a>

GMOD Tutorials from previous GMOD schools:
<a href="Tripal.1" class="external free"
rel="nofollow">http://gmod.org/wiki/Tripal</a>

  

### <span id="Contributing_Organizations" class="mw-headline">Contributing Organizations</span>

Individuals from these organizations have provided design and coding for
Tripal

<a href="File:150px-CUGILogo.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5c/150px-CUGILogo.png" width="150"
height="85" alt="150px-CUGILogo.png" /></a>
<a href="File:150px-USLogo.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/58/150px-USLogo.png" width="150" height="35"
alt="150px-USLogo.png" /></a>
<a href="File:150px-WSULogo.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/ab/150px-WSULogo.png" width="150" height="44"
alt="150px-WSULogo.png" /></a>

  

### <span id="Funding" class="mw-headline">Funding</span>

Funding for Tripal has been provided through various grants from the
USDA, NSF, in-house funding from the Clemson University Genomics
Institute (CUGI), and Clemson's Cyberinfrastructure and Technology
Integration (CITI) group.

  

### <span id="Additional_Support" class="mw-headline">Additional Support</span>

- Logistical and community interaction support and has been provided by
  GMOD!!
- The South Carolina Marine Genomics Consortium with researchers housed
  primarily at the NOAA Hollings Marine Lab in Charleston South Carolina
  provided input and direction for the first versions of Tripal.

## <span id="Pre-planning" class="mw-headline">Pre-planning</span>

### <span id="IT_Infrastructure" class="mw-headline">IT Infrastructure</span>

Setup of the prerequisites for Tripal can be the most challenging part
depending on the IT infrastructure currently available for your project.
Tripal requires a server with adequate resources to handle the expected
load and systems administration skills to get the machine up and
running, applications installed and everything properly secure. Tripal
requires a PostgreSQL databases server, Apache (or equivalent) web
server, PHP5 and several configuration options to make it all work.
However, once these prerequisites are met, working with Drupal and
Tripal are quite easy.

  
There are three basic ways you could get a Tripal/Drupal/Chado database
web server available for your site

1.  **Option \#1 In-house dedicated servers:** You may have access to
    servers in your own department or group which you have
    administrative control and wish to install Tripal/Drupal/Chado on
    these.
2.  **Option \#2 Institutional IT support:** Your institution may
    provide IT servers and would support your efforts to install a
    website with database backend.
3.  **Option \#3 Commercial web-hosting:** If options \#1 and \#2 are
    not available to you, commercial web-hosting is an affordable
    option. For large databases you may require a dedicated server.

  
After selection of one of the options that works best for you you can
arrange your database/webserver in the following ways:

1.  **Arrangement \#1:** The database and web server are housed on a
    single server. *This is the approach taken by this course*. It is
    necessary to gain access to a machine with enough memory (RAM), hard
    disk speed and space, and processor power to handle both services.
2.  **Arrangement \#2:** The database and web server are housed on
    different servers. This provides dedicated resources to each service
    (i.e. web and database).

  
**Selection of an appropriate machine**

Databases are typically bottlenecked by RAM and disk speed. Selection of
the correct balance of RAM, disk speed, disk size and CPU speed is
important and dependent on the size of the data. Unfortunately, we have
only tested production installations of Tripal on a limited number of
server configurations. The best advice is to consult an IT professional
who can recommend a server installation tailored for the expected size
of your data.

  
**Note**: Tripal does require command-line access to the web server with
adequate local file storage for loading of large data files. Be sure to
check with your service provider to make sure command-line access is
possible.

### <span id="Technical_Skills" class="mw-headline">Technical Skills</span>

Depending on your needs, you may need additional Technical support....

  
**Tripal already supports my data, what personnel to I need to maintain
it?**

- Someone to install/setup the IT infrastructure
- Someone who understands the data to load it properly

  
**Tripal does not yet support all of my data, but I want to use what's
been done and expand on it....?**

- Someone to install/setup the IT infrastructure
- Someone who understands the data to load it properly
- PHP/HTML/CSS/JavaScript programmer(s) to write your custom extensions

  

### <span id="Why_Use_Tripal" class="mw-headline">Why Use Tripal</span>

Tripal does not yet fully support Chado. We are getting closer, but as
of now, it is still lacking in many areas... ***So why use Tripal?***

1.  If you want to use Chado
2.  You need a web interface
3.  You need CMS capabilities (distributed content editing, user
    management, social networking... i.e. Drupal)
4.  You want to contribute to a community effort to help build a tool
    others can use.
5.  Participate in a community of other database developers using the
    same technology, confronting similar problems and helping each
    other.
6.  It is all open-source and free technology!

## <span id="Server_Setup" class="mw-headline">Server Setup</span>

The following instructions are for setup of a
<a href="http://www.ubuntu.com/" class="external text"
rel="nofollow">Ubuntu linux</a> version 11.04 server, although these
instructions should work for older versions of Ubuntu as well. When
possible, alternative command-line statements have been added to this
tutorial as users of other Linux version have provided feedback. Unless
specifically identified, all commands are for Ubuntu linux.

The following software packages are needed before installing Drupal or
Tripal:

- <a href="http://apache.org" class="external text"
  rel="nofollow">Apache</a> Web server
- PHP (both command-line and web module)
- <a href="http://www.postgresql.org" class="external text"
  rel="nofollow">PostgreSQL</a> database management system
- phpPgAdmin (for easy database administration)

  

#### <span id="Install_the_Apache_Web_Server" class="mw-headline">Install the Apache Web Server</span>

To install the Apache web server, simply issue the following command:

``` enter
   sudo apt-get install apache2
```

Now navigate to your new website using this address:
<a href="http://localhost/" class="external free"
rel="nofollow">http://localhost/</a>. You should see the text "It
works!".

<a href="File:ItWorks.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d0/ItWorks.png/800px-ItWorks.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d0/ItWorks.png/1200px-ItWorks.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d0/ItWorks.png 2x"
width="800" height="669" alt="ItWorks.png" /></a>

#### <span id="Install_the_PostgreSQL_Server" class="mw-headline">Install the PostgreSQL Server</span>

To install the PostgreSQL server, simply issue the following command:

``` enter
   sudo apt-get install postgresql
```

#### <span id="Install_.26_Setup_PHP" class="mw-headline">Install & Setup PHP</span>

<a href="File:Ubuntu.jpg" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e2/Ubuntu.jpg/50px-Ubuntu.jpg"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e2/Ubuntu.jpg/75px-Ubuntu.jpg 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e2/Ubuntu.jpg/100px-Ubuntu.jpg 2x"
width="50" height="58" alt="Ubuntu.jpg" /></a> First install php5 using
Ubuntu's apt-get utility:

``` enter
   sudo apt-get install php5
   sudo apt-get install php5-pgsql
   sudo apt-get install php5-cli
   sudo apt-get install php5-gd
```

<a href="File:Suse.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f0/Suse.png/50px-Suse.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f0/Suse.png/75px-Suse.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f0/Suse.png/100px-Suse.png 2x"
width="50" height="45" alt="Suse.png" /></a> For Suse Linux you may need
to install the **php-posix** package:

``` enter
   yum install php-posix
```

<a href="File:Red_hat_logo_big.jpg" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/ca/Red_hat_logo_big.jpg/50px-Red_hat_logo_big.jpg"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/ca/Red_hat_logo_big.jpg/75px-Red_hat_logo_big.jpg 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/ca/Red_hat_logo_big.jpg/100px-Red_hat_logo_big.jpg 2x"
width="50" height="55" alt="Red hat logo big.jpg" /></a> For RedHat
Linux you may also need to install the **php-process** package:

``` enter
   yum install php-process
```

Change some php settings (as root):

``` enter
   cd /etc/php5/apache2
   sudo gedit php.ini
```

  
Set the `memory_limit` to something larger than `128M` (should not
exceed physical memory, be conservative but not too much so):

      memory_limit = 2048M;

  
Now, restart the webserver:

      sudo /etc/init.d/apache2 restart

  
Do the same for the command-line `php.ini`:

``` enter
   cd /etc/php5/cli/
   sudo gedit php.ini
```

Set the memory limit:

      memory_limit = 2048M;

#### <span id="Install_phpPgAdmin" class="mw-headline">Install phpPgAdmin</span>

phpPgAdmin is a nice web-based utility for easy administration of a <a
href="http://gmod.org/mediawiki/index.php?title=GMOD:PostgreSQL&amp;action=edit&amp;redlink=1"
class="new" title="GMOD:PostgreSQL (page does not exist)">PostgreSQL</a>
database. It is not required for successful operation of Tripal but is
very useful.

``` enter
   sudo apt-get install phppgadmin
```

Now navigate to the URL
\[<a href="http://localhost/phppgadmin" class="external free"
rel="nofollow">http://localhost/phppgadmin</a>\] and you should see the
following:

<a href="File:Phppgadmin.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/8f/Phppgadmin.png/800px-Phppgadmin.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/8f/Phppgadmin.png/1200px-Phppgadmin.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8f/Phppgadmin.png 2x"
width="800" height="669" alt="Phppgadmin.png" /></a>

  
Before continuing, we want to password protect PhpPgAdmin using Apache's
access control mechanisms. To do this, we will create two hidden files
in the /usr/share/phppgadmin directory. First we need to instruct apache
to use password protection for PhpPgAdmin. To do this, edit the
phppgadmin config file for apache:

``` enter
   cd /etc/apache2/conf.d
   sudo gedit phppgadmin
```

Within the Directory stanza add the following:

``` enter
   AuthType Basic
   AuthName "Password Required"
   AuthUserFile /usr/share/phppgadmin/.htpasswd
   Require User tripaladmin
```

Note: it is necessary that the preceding lines appear below the
'Directory /usr/share/phppgadmin' line.

The lines above instruct apache to use basic authentication, that the
password file is located at /usr/share/phppgadmin/.htpasswd and the only
user allowed to login is 'tripaladmin'. Next we need to create the
password file:

``` enter
   cd /usr/share/phppgadmin
   sudo htpasswd -c .htpasswd tripaladmin
```

The htpasswd command above will create the .htpasswd file and add the
new user 'tripaladmin'. You will need to set a password when requested.

  
Now, restart the webserver:

      sudo /etc/init.d/apache2 restart

A password should now be required when accessing the PhpPgAdmin page.

### <span id="Prepare_Apache" class="mw-headline">Prepare Apache</span>

Enable the rewrite module for apache. This is useful so that we can use
Clean URLs with Drupal. Clean URLs are not required but make the page
URLs easier to use. We'll discuss clean URLs later.

``` enter
   cd /etc/apache2/mods-enabled
   sudo ln -s ../mods-available/rewrite.load
```

Next we need to edit the apache configuration file to give Drupal full
controls of options within the directory root. Edit the
/etc/apache2/sites-available/000-default file:

``` enter
   cd /etc/apache2/sites-available/
   sudo gedit 000-default
```

And change the **AllowOverride** option from **None** to **All**:

``` enter
   <Directory /var/www/>
      Options Indexes FollowSymLinks MultiViews
      AllowOverride All
      Order allow,deny
      allow from all
   </Directory>
```

Now restart your apache again.

``` enter
sudo /etc/init.d/apache2 restart
```

## <span id="Database_Setup" class="mw-headline">Database Setup</span>

Drupal can run on a MySQL or PostgreSQL database but Chado prefers
PostgreSQL so that is what we will use for both Drupal and Chado. We
need to create the Drupal database. The following command can be used to
create a new database user and database.

  
First, become the 'postgres' user:

``` enter
sudo su - postgres
```

  
Next, create the new 'tripal' user account. This account will not be a
"superuser' nor allowed to create new roles, but should be allowed to
create a database.

``` enter
createuser -P tripal
```

When requested, enter an appropriate password:

      
      Enter password for new role: *********
      Enter it again:  *********
      Shall the new role be a superuser? (y/n) n
      Shall the new role be allowed to create databases? (y/n) y
      Shall the new role be allowed to create more new roles? (y/n) n
      

  

Finally, create the new database:

``` enter
createdb tripal_demo -O tripal
```

  
We no longer need to be the postgres user so exit

``` enter
exit
```

## <span id="Install_Drupal" class="mw-headline">Install Drupal</span>

### <span id="Software_Installation" class="mw-headline">Software Installation</span>

We want to install Drupal into our web document root (`/var/www`). We
want to be able to do this as our 'tripal' user. So, first, let's set
the directory permissions to allow this:

``` enter
  cd /var
  sudo chgrp -R tripal www
  sudo chmod -R g+rw www
```

In the command above we set the group of the directory to be **tripal**
(our user group) and we gave the directory read and write permissions
for the group.

Tripal currently requires version 6 of Drupal. Drupal can be freely
downloaded from the
<a href="http://www.drupal.org" class="external free"
rel="nofollow">http://www.drupal.org</a> website. At the writing of this
Tutorial the most recent version of Drupal is version 6.22. The software
can be downloaded manually from the Drupal website through a web browser
or we can use the 'wget' command to retrieve it:

``` class
   cd /var/www
   wget http://ftp.drupal.org/files/projects/drupal-6.22.tar.gz
```

  
Next, we want to install Drupal. We will use the **tar** command to
uncompress the software:

``` enter
  cd /var/www
  tar -zxvf drupal-6.22.tar.gz
```

  
Notice that we now have a `drupal-6.22` directory with all of the Drupal
files. We want the Drupal files to be in our document root, not in a
'drupal-6.22' subdirectory. So, we'll move the contents of the directory
up one level:

``` enter
mv drupal-6.22/* ./
mv drupal-6.22/.htaccess ./
mv index.html index.html.orig
```

  
**Note:** It is extremely important the the hidden file `.htaccess` is
also moved (note the second 'mv' command above. Check to make sure this
file is there

``` enter
   ls -l .htaccess
```

Notice that the last of the three `mv` commands renames the `index.html`
file and calls it `index.html.orig`. The `index.html` file was serving
as the home page for the website. Drupal uses an `index.php` page for
it's home page but the web server has preference for the `index.html`
page. So, we move it out of the way.

### <span id="Configuration_File" class="mw-headline">Configuration File</span>

Next, we need to tell Drupal how to connect to our database. To do this
we have to setup a configuration file. Drupal comes with an example
configuration file which we can borrow.

  
First navigate to the location where the configuration file should go:

``` enter
  cd /var/www/sites/default/
```

  
Next, copy the example configuration that already exists in the
directory to be our actual configuration file by renaming it to
`settings.php`.

``` enter
  cp default.settings.php settings.php
```

  
Now, we need to edit the configuration file to tell Drupal how to
connect to our database server. To do this we'll use an easy to use text
editor **gedit**

``` enter
  gedit settings.php
```

  
Find the variable \$db_url and set it to this

``` enter
  $db_url = 'pgsql://tripal:********@localhost/tripal_demo';
```

Replace the text '\*\*\*\*\*\*\*\*' with your database password for the
user 'tripal' created previously.

### <span id="Final_directory_creation" class="mw-headline">Final directory creation</span>

Finally, we need to create three new directories. The first is the
`files` directory which Drupal uses for storing uploaded files.

``` enter
  cd /var/www/sites/default
  mkdir files
  sudo chown tripal:www-data files
  sudo chmod g+rw files
```

  
The above command creates the directory but sets the group to be the web
server (i.e. www) with read/write permissions. This way the web server
can write to the directory but so can we.

  
Also, we need to create two new directories, one for storing module
files we'll be installing and another for themes which we'll also be
installing later:

  
Now create the modules and themes directory

``` enter
  cd /var/www/sites/all
  mkdir modules
  mkdir themes
```

### <span id="Compatibility_with_other_tools" class="mw-headline">Compatibility with other tools</span>

We want to ensure that our Drupal installation doesn't interfere with
other web-based tools, such as GBrowse. We need update a setting in the
.htaccess file that came with Drupal which instructs the web server to
look for both `index.php` and `index.html` files when serving pages.

Use 'gedit' to modify the `/var/www.htaccess` file.

``` enter
   cd /var/www
   gedit .htaccess
```

Locate the line `DirectoryIndex` and change it to mach the following:

``` enter
  DirectoryIndex index.php index.html
```

### <span id="Web-based_Steps" class="mw-headline">Web-based Steps</span>

Navigate to the installation page of our new web site
<a href="http://localhost/install.php" class="external free"
rel="nofollow">http://localhost/install.php</a>

<a href="File:800px-Install1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e6/800px-Install1.png" width="800"
height="475" alt="800px-Install1.png" /></a>

  
Click the link in the middle section that reads **Install Drupal in
English**

<a href="File:800px-Tripal_Install2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/51/800px-Tripal_Install2.png" width="800"
height="475" alt="800px-Tripal Install2.png" /></a>

  
When the progress bar shows completing the page will switch to a
configuration page with some final settings.

<a href="File:800px-Tripal-install3.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/53/800px-Tripal-install3.png" width="800"
height="475" alt="800px-Tripal-install3.png" /></a>

  
Set the following

- Site Name: Tripal Demo
- Site email: Your email address
- Administrator Username: administrator (all lower-case)
- Administrator Email: Your email address
- Password: \*\*\*\*\*\*\*\*
- Default time zone: leave as is
- Clean URLs: enabled
- Update Notification: check for updates automatically

  
Now, click the **Save and Continue** button. You will see a message
about unable to send an email. This is safe to ignore as email
capabilities are not fully enabled on this VMWare image. Now, your site
is enabled. Click the link **Your new site**:

<a href="File:800px-Tripal_Install4.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8c/800px-Tripal_Install4.png" width="800"
height="475" alt="800px-Tripal Install4.png" /></a>

### <span id="Drupal_Cron_Entry" class="mw-headline">Drupal Cron Entry</span>

The last step for installing Drupal is setting up the automatted Cron
entry. The Drupal cron is used to automatically execute necessary
housekeeping tasks on a regular interval. Cron is a UNIX facility for
scheduling jobs to run at specific intervals.

Drupal itself requires an entry in the crontab to function. To edit the
cron launch the crontab editor:

``` enter
  sudo crontab -e
```



[A word on text editors such as
nano](Linux_Text_Editors "Linux Text Editors").



  
Add this line to the crontab

``` enter
  0,30 * * * * /usr/bin/wget -O - -q http://localhost/cron.php > /dev/null
```

  
Now save the changes. We have now added a UNIX cron job that will occur
every 30 minutes that will execute the `cron.php` script and cause
Drupal to perform housekeeping tasks.

## <span id="Explore_Drupal" class="mw-headline">Explore Drupal</span>

### <span id="User_Account_Page" class="mw-headline">User Account Page</span>

All users have an account page. Currently, we are logged in as the
administrator. The account page is simple for now. Click the **My
account** link on the left sidebar. You'll see a brief history for the
user and an **Edit** tab. Users can edit their own information using the
edit interface:

<a href="File:800px-ExplorDrupal1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/35/800px-ExplorDrupal1.png" width="800"
height="475" alt="800px-ExplorDrupal1.png" /></a>

### <span id="Creating_Content" class="mw-headline">Creating Content</span>

Creation of content in Drupal is very easy. Click the **Create content**
link on the left sidebar.

<a href="File:800px-ExplorDrupal2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3e/800px-ExplorDrupal2.png" width="800"
height="475" alt="800px-ExplorDrupal2.png" /></a>

  
You'll see two content types that come default with Drupal: Page and
Story. Here is where a user can add simple new pages to the website
without knowledge of HTML or CSS. Click the **Page** content type to see
the interface for creating a new page:

<a href="File:800px-ExploreDrupal3.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/52/800px-ExploreDrupal3.png" width="800"
height="475" alt="800px-ExploreDrupal3.png" /></a>

  
You'll notice at the top a **Title** field and a **Body** text box. All
pages require a title and typically have some sort of content entered in
the body. Additionally, there are other options that allow someone to
enter HTML if they would like, save revisions of a page to preserve a
history and to set authoring and publishing information.

<a href="File:800px-ExploreDrupal4.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fc/800px-ExploreDrupal4.png" width="800"
height="475" alt="800px-ExploreDrupal4.png" /></a>

  
For practice, try to create two new pages. A **Home** page and an
**About** page for our site. First create the home page and second
create the about page. Add whatever text you like for the body.

### <span id="Site_Administration" class="mw-headline">Site Administration</span>

#### <span id="Content_Management" class="mw-headline">Content Management</span>

There are many options under the **Administer** link on the left
sidebar. Here you can manage the site setup, monitor and control
content, manage users and view reports.

<a href="File:800px-DrupalAdmin1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e8/800px-DrupalAdmin1.png" width="800"
height="633" alt="800px-DrupalAdmin1.png" /></a>

  
We will not explore all of the options here but will visit a few of the
more important ones for this tutorial. First, click the **Content
Management** link on the left sidebar. You'll see different options.

<a href="File:800px-DrupalAdminContent.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/88/800px-DrupalAdminContent.png" width="800"
height="633" alt="800px-DrupalAdminContent.png" /></a>

  
Click the **Content** link. The page shows all content available on the
site. You will see the "About" and "Home" pages you created previously:

<a href="File:800px-DrupalContent.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fd/800px-DrupalContent.png" width="800"
height="633" alt="800px-DrupalContent.png" /></a>

  
You'll also notice a set of drop down boxes for filtering the content.
For sites with many different content types and pages this helps to find
content. You can use this list to click to view each page or to edit.

#### <span id="Site_Building" class="mw-headline">Site Building</span>

##### <span id="Modules" class="mw-headline">Modules</span>

Click the **Site Building** link on the let sidebar under the
**Administer** link. You'll see several new menu options: Blocks, Menus,
Modules and Themes. First click **Modules**

<a href="File:800px-AdminModules.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/43/800px-AdminModules.png" width="800"
height="633" alt="800px-AdminModules.png" /></a>

  
Here is where you will see the various modules that make up Drupal. Take
a minute to scroll through the list of these and read some of the
descriptions. The modules you see here are core modules that come with
Drupal. Those that are checked come pre-enabled. Those that are not
checked we will need to install. For this tutorial we will need two
additional modules that are not yet installed. Locate the modules
**Path** and **Search** and check the box next to each of those. Scroll
to the bottom and click 'Save configuration'.

  
The Path and Search modules are now installed. The Search module enables
site-wide searching capabilities for our site and the Path module
enables alternative naming of page URLs (we will discuss later).

  

##### <span id="Themes" class="mw-headline">Themes</span>

Next, click the **Themes** link under **Administer** → **Site Building**
on the left sidebar.

<a href="File:800px-DrupalThemes.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/1a/800px-DrupalThemes.png" width="800"
height="633" alt="800px-DrupalThemes.png" /></a>

  
Here, you'll see a list of themes that come with Drupal by default. If
you scroll down you'll see that one theme named **Garland** is enabled
and set as default. The current look of the site is using the Garland
them. Change the them by checking the **Enable** checkbox and the
**default** radio button for the **Pushbutton** theme and then clicking
**Save configuration**. Now you'll see that the theme has changed.

<a href="File:800px-DrupalThemes2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8d/800px-DrupalThemes2.png" width="800"
height="522" alt="800px-DrupalThemes2.png" /></a>

  

##### <span id="Blocks" class="mw-headline">Blocks</span>

Blocks in Drupal are used to provide content in regions of a Drupal
theme. For example, navigate to **Adminster** → **Site Building** →
**Blocks**.

You'll see that regions of the theme have been identified. Within the
**Sky** theme you can see the regions with dashed lines around them.
Also, you'll see a list of available blocks. You can select where blocks
will appear by selecting the region in the drop down list. Blocks may
also be hidden, if desired, by selecting **\<none\>** in the dropdown.

<a href="File:Drupal_blocks1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/77/Drupal_blocks1.png/800px-Drupal_blocks1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/77/Drupal_blocks1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/77/Drupal_blocks1.png 2x"
width="800" height="708" alt="Drupal blocks1.png" /></a>

  
Take time to turn on and off blocks to see where they appear. Re-arrange
blocks by dragging and dropping the cross-hairs beside each one. Be sure
to leave the blocks in the configuration shown in the image below
finished:

<a href="File:Drupal_blocks2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/3b/Drupal_blocks2.png/800px-Drupal_blocks2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3b/Drupal_blocks2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3b/Drupal_blocks2.png 2x"
width="800" height="708" alt="Drupal blocks2.png" /></a>

##### <span id="Menus" class="mw-headline">Menus</span>

Drupal provides an interface for working with menus, including adding
new menu items to an existing menu or for creating new menus. For the
exercise in the Blocks section above we added the **Primary links** menu
to the **Content top** section of the Sky theme. To view the **Primary
links** menu, navigate to **Administer** → **Site building** →
**Menus**.

<a href="File:Drupal_menus1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/2a/Drupal_menus1.png/800px-Drupal_menus1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2a/Drupal_menus1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2a/Drupal_menus1.png 2x"
width="800" height="613" alt="Drupal menus1.png" /></a>

  
Select the menu **Primary links**. You'll see it currently has no item.

<a href="File:Drupal_menus2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/81/Drupal_menus2.png/800px-Drupal_menus2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/81/Drupal_menus2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/81/Drupal_menus2.png 2x"
width="800" height="613" alt="Drupal menus2.png" /></a>

  
As a demonstration for working with menus we'll add two menu items for
the Home and About pages we created earlier. To do so, click the **Add
item** tab. You will see a form for providing information about the menu
item to be added.

<a href="File:Drupal_menus3.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/fd/Drupal_menus3.png/800px-Drupal_menus3.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fd/Drupal_menus3.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fd/Drupal_menus3.png 2x"
width="800" height="613" alt="Drupal menus3.png" /></a>

The first field is the path. We need to find the path for our home page.

The path for a page can be found in the address bar for the page. In
Drupal pages of content are generally referred to as **nodes**. So, in
the address bar for our home page you'll see the address is
<a href="http://localhost/node/1" class="external free"
rel="nofollow">http://localhost/node/1</a>. Our about page should be
<a href="http://localhost/node/2" class="external free"
rel="nofollow">http://localhost/node/2</a> (i.e the first and second
pages we created).

The path for each of these nodes is simply `node/1` and `node/2`.
Returning to our tab where we are adding a menu item, enter the path
`node/1`. We will set the fields in this ways:

- Path: node/1
- Menu Link Title: Home
- Description: Tripal Demo Home Page
- Enabled: checked
- Expanded: no check
- Parent item: \<primary links\>
- Weight: 0

  
The settings above will give the menu link a title of **Home** and put
it on the **Primary Links** menu. We now have a **Home** menu item in
the top just under the header, and our **Home** menu item now appears in
the list of menu items for the **Primary Links** menu

<a href="File:Druapl_menus4.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/73/Druapl_menus4.png/800px-Druapl_menus4.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/73/Druapl_menus4.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/73/Druapl_menus4.png 2x"
width="800" height="613" alt="Druapl menus4.png" /></a>

  
Using the insructions above to add a second menu item for our about page
and arrange. Use the 'weight' value so that our Home link appears first
and the About link appears second.

##### <span id="URL_Path" class="mw-headline">URL Path</span>

As mentioned previously, the URL paths for our pages have `node/1` and
`node/2` in the address. This is not very intuitive for site visitors.
Earlier we enabled the **Path** module. This module will allow us to set
a more human-readable path for our pages.

  
To set a path, click on our new **About** page in the new menu link at
the top and click the **Edit** tab. Scroll to the bottom of the edit
page and you'll see a section titled **URL path setting**. click to open
this section.

<a href="File:Drupal_url.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/ad/Drupal_url.png/800px-Drupal_url.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/ad/Drupal_url.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/ad/Drupal_url.png 2x"
width="800" height="336" alt="Drupal url.png" /></a>

  
Since this is our about page, we simply want the URL to be
<a href="http://localhost/about" class="external free"
rel="nofollow">http://localhost/about</a>. To do this, just add the word
**about** in the text box. You will now notice that the URL for this
page is no longer
<a href="http://localhost/node/2" class="external free"
rel="nofollow">http://localhost/node/2</a> but now
<a href="http://localhost/about" class="external free"
rel="nofollow">http://localhost/about</a>. Although, both links will
still get you to our About page.

  
Now, use the instructions described above to set a path of 'home' for
our home page.

##### <span id="Site_Configuration" class="mw-headline">Site Configuration</span>

There are many options under the **Administer** → **Site configuration**
page. Here we will only look at one of these at the moment--the **Site
Information** page.

<a href="File:Drupal_config.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d3/Drupal_config.png/800px-Drupal_config.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d3/Drupal_config.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d3/Drupal_config.png 2x"
width="800" height="613" alt="Drupal config.png" /></a>

  
Here you will find the configuration options we set when installing the
site. You can change the site name, add a slogan, mission and footer
text to the. Towards the bottom there is a text box titled **Default
front page**. This is where we can tell Drupal to use our new **Home**
page we created as the first page visitors see when the view the site.
In this text box enter the text `node/1`. This is the address of our
home page. We must use the node number here and not our new URL pat of
'home' that we just created. Let's change the name of our site from
**Tripal demo** to **Fly Genes Database** and add a slogan: **Resources
for Fly Genomics**.

  
Now, click the **Save configuration** button at the bottom. You'll see
our site name has changed at the top. Also, if we click the logo image
at the top of the site and it will take you to the front page with our
new home page appearing.

### <span id="User_Accounts" class="mw-headline">User Accounts</span>

For this tutorial, we will not discuss in depth the user management
infrastructure except to point out:

- User accounts can be created
- Users are assigned to various roles
- Permissions for those roles can be set to allow groups of users
  certain administrative rights or access to specific data.

Explore the Drupal **User Management** menu to see how users can be
created, added to roles with specific permissions.

## <span id="Prepare_Drupal_for_Tripal" class="mw-headline">Prepare Drupal for Tripal</span>

### <span id="Theme_Installation" class="mw-headline">Theme Installation</span>

Drupal allows us to install new themes. Installation of themes involves
these steps:

1.  Locate and download a theme from the Drupal website
    (<a href="http://www.drupal.org/themes" class="external free"
    rel="nofollow">http://www.drupal.org/themes</a>)
2.  Unpack the theme in the /var/www/sites/all/themes directory
3.  Return to the Drupal **Administer** → **Site Building** → **Themes**
    page and enable the theme

For this tutorial, we will use the Sky theme which is available from
<a href="http://drupal.org/project/sky" class="external free"
rel="nofollow">http://drupal.org/project/sky</a>

``` enter
  cd /var/www/sites/all/themes
  wget http://ftp.drupal.org/files/projects/sky-6.x-3.11.tar.gz
  tar -zxvf sky-6.x-3.11.tar.gz
```

  
This should unpack the theme for us. Now, navigate to **Administer** →
**Site Building** → **Themes** and enable the 'Sky' theme:

<a href="File:800px-DrupalThemes3.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2e/800px-DrupalThemes3.png" width="800"
height="522" alt="800px-DrupalThemes3.png" /></a>

  
The sky theme was obtained at this address:
<a href="http://drupal.org/project/sky" class="external free"
rel="nofollow">http://drupal.org/project/sky</a>

### <span id="Theme_Configuration" class="mw-headline">Theme Configuration</span>

Here we return to theming. There are several configuration options that
are available to help customize the theme for your site. These can be
found by navigating to the **Administer** → **Site Building** →
**Themes** page and clicking the **Configure** tab near the top.

  
Appearing under the **Configure** link will be small menu with a listing
of every theme we have enabled. You should see the **Sky** theme at the
end of this list. Click that theme because that is the one we are using
and want to configure:

<a href="File:800px-DrupalSkyTheme.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d5/800px-DrupalSkyTheme.png" width="800"
height="477" alt="800px-DrupalSkyTheme.png" /></a>

  
Here you can turn on and off the presence of the logo, site name,
slogan, mission statement, etc. For this particular theme we can also
adjust background colors and images, link colors, font style and size,
and more. Notice when we added a slogan in the previous step that it did
not appear anywhere on the site. To make it appear, check the box next
to **Slogan**.

  
We also want to add a new logo for our site. Since we'll be loading fly
data we want to add a picture of a fruit fly as our logo. We will use
the following image:

<a href="File:Drosophila.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2d/Drosophila.png" width="123" height="75"
alt="Drosophila.png" /></a>

  
This image was taken from Wikimedia Commons
(<a href="http://commons.wikimedia.org/wiki/File:Drosophila.png"
class="external free"
rel="nofollow">http://commons.wikimedia.org/wiki/File:Drosophila.png</a>).
Right-click on this image and download it somewhere on your machine.
Next, return to our Drupal theme configuration page and use the Logo
file upload interface on the page to upload this file as our logo.

  
Also set the following for the theme:

- The dark blue header is a bit too dark for our logo image. So, let's
  add a different color that. Find the text box for the header
  background color and enter this color: '#EE2222' (red color).
- Set the 'Custom Layout Width' to be 1200px to give us more room
- Set the height of the header to be 120px to give a bit more room in
  the header as well.

  
Then, click the **Save Configuration** button at the bottom. We now have
a new logo and our slogan appears.

<a href="File:800px-DrupalLogo.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/47/800px-DrupalLogo.png" width="800"
height="477" alt="800px-DrupalLogo.png" /></a>

### <span id="Module_Installation" class="mw-headline">Module Installation</span>

We can install new extension modules which we will need later. For this
workshop we have several modules that we will need to install but which
do not yet appear in the list of modules. To do this, we must follow
these steps:

1.  Locate and download the extension modules from the Drupal website
2.  Unpack the module in the /var/www/sites/all/modules directory
3.  Check for a README.txt or INSTALL.txt for any further instructions
    for installation of the module
4.  Return the the Drupal 'Administer' -\> 'Site Building' -\> 'Modules'
    page and enable the module.

  
For an example, let's install the **Views** module needed for this
workshop. The Views module can be found here:
<a href="http://drupal.org/project/views" class="external free"
rel="nofollow">http://drupal.org/project/views</a>. We will download the
current version as of the writing of this tutorial:

  

``` enter
  cd /var/www/sites/all/modules
  wget http://ftp.drupal.org/files/projects/views-6.x-2.12.tar.gz
```

Now unpack the module:

``` enter
  tar -zxvf views-6.x-2.12.tar.gz
```

  
Check the README for additional installation instructions

``` enter
  cd views
  ls
  less README.txt
```

*Use the space-bar to scroll through the README.txt file. Hit the 'q'
key to quit*

  
There are no other installation steps besides what we've done. So return
to the **Administer** → **Site Building** → **Modules** page and enable
the module.

  
<a href="File:800px-DrupalViews.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/03/800px-DrupalViews.png" width="800"
height="491" alt="800px-DrupalViews.png" /></a>

  
Notice that the Views package provided three different related modules
and they all appear under a **Views** category.

for this Tutorial, the Chaos tools, CCK, JQuery UI, Devel, Node Privacy
by Role, and Panels modules should also be downloaded and installed
following the same instructions above

``` enter
   cd /var/www/sites/all/modules
   wget http://ftp.drupal.org/files/projects/ctools-6.x-1.8.tar.gz
   wget http://ftp.drupal.org/files/projects/panels-6.x-3.9.tar.gz
   wget http://ftp.drupal.org/files/projects/jquery_ui-6.x-1.5.tar.gz
   wget http://ftp.drupal.org/files/projects/cck-6.x-2.9.tar.gz
   wget http://ftp.drupal.org/files/projects/devel-6.x-1.26.tar.gz
```

For JQuery UI the README file indicates we need to install the JQuery UI
package before we can eanble this module. We must first get this package
from online.

Here is a quick command for downloading this file

``` enter
  cd /var/www/sites/all/modules/jquery_ui
  wget http://jquery-ui.googlecode.com/files/jquery.ui-1.6.zip
```

Now unzip the package and rename it according to the instructions

``` enter
  unzip jquery.ui-1.6.zip
  mv jquery.ui-1.6 jquery.ui
```

  
Now, return to our Drupal website and enable the modules.

For Chaos Tools, enable these modules under the *Chaos tool suite*
category:

     * Chaos tools
     * Custom content panes
     * Page Manager
     * Views content panes

Enables these modules under the **Panels** category:

     * Mini panels
     * Panel nodes
     * Panels

Enable the JQuery module. which is found under the **User Interface**
category.

Enable all modules under the **CCK** category.

Enable these modules under the **Devel** category:

      * Devel

For reference, the modules installed above can be found here:

- CTools:
  <a href="http://drupal.org/project/ctools" class="external free"
  rel="nofollow">http://drupal.org/project/ctools</a>
- Views: <a href="http://drupal.org/project/views" class="external free"
  rel="nofollow">http://drupal.org/project/views</a>
- Panels:
  <a href="http://drupal.org/project/panels" class="external free"
  rel="nofollow">http://drupal.org/project/panels</a>
- JQuery-ui:
  <a href="http://drupal.org/project/jquery_ui" class="external free"
  rel="nofollow">http://drupal.org/project/jquery_ui</a>
- CCK: <a href="http://drupal.org/project/cck" class="external free"
  rel="nofollow">http://drupal.org/project/cck</a>
- Devel: <a href="http://drupal.org/project/devel" class="external free"
  rel="nofollow">http://drupal.org/project/devel</a>

## <span id="Tripal_Installation" class="mw-headline">Tripal Installation</span>

### <span id="Main_Package_Installation" class="mw-headline">Main Package Installation</span>

First, we need to download Tripal. Tripal can be easily downloaded from
the website
<a href="http://tripal.sourceforge.net" class="external free"
rel="nofollow">http://tripal.sourceforge.net</a> by following the
download link at the top left of the home page, or by clicking the
'Download' menu item. Installing the Tripal package is the same as for
the other modules. In the example code below we retrieve the Tripal
package using a 'wget' command:

``` enter
cd /var/www/sites/all/modules
wget http://sourceforge.net/projects/tripal/files/tripal-6.x-0.3.1b.tar.gz
tar -zxvf tripal-6.x-0.3.1b.tar.gz
```

Next, we need to move the Tripal base theme 'theme_tripal' directory to
the /var/www/sites/all/themes directory so that Drupal can find it:

``` enter
mv tripal-6.x-0.3.1b/theme_tripal /var/www/sites/all/themes
```

  
There are no special instructions for installing Tripal other than
copying the files so we will now navigate to the **Administer** → **Site
Building** → **Modules** page to install Tripal. Here you'll see a set
of modules under the category: **Tripal**.

<a href="File:800px-TripalModules.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ef/800px-TripalModules.png" width="800"
height="477" alt="800px-TripalModules.png" /></a>

  
Enable the module **Tripal core** only. There is now a **Tripal
Management** link under **Administer** with several sub items:

- Install Chado v1.11
- Jobs
- Materialized Views

<a href="File:Tripal_management1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/c5/Tripal_management1.png/800px-Tripal_management1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c5/Tripal_management1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c5/Tripal_management1.png 2x"
width="800" height="613" alt="Tripal management1.png" /></a>

### <span id="Tripal_Extension_Module_Installation" class="mw-headline">Tripal Extension Module Installation</span>

In this tutorial we will also be using several of the Tripal extension
modules. Extension modules provide additional functionality not provided
by the main Tripal package. Anyone may create new extensions using the
Tripal API. To install Extension modules we follow the same pattern as
described previously for installing all modules. Exnteion modules can be
download from the Tripal website's extension page:
<a href="http://tripal.sourceforge.net/?q=extensions"
class="external free"
rel="nofollow">http://tripal.sourceforge.net/?q=extensions</a>.

For this tutorial we will use four extension modules. Before proceeding,
download and uncompress into the /var/www/sites/all/modules directory
the following Tripal extensions

- tripal_analysis_blast-0.3.1b-0.1
- tripal_analysis_go-0.3.1b-0.1
- tripal_analysis_interpro-0.3.1b-0.1
- tripal_analysis_kegg-0.3.1b-0.1

  
Extension modules have one extra step after installation which is to
copy any theme updates to the /var/www/sites/all/themes/theme_tripal
directory. Each extension has it's own 'theme' directory that needs to
be copied. The following command will copy all the theme files and place
them in the correct location:

``` enter
   cd /var/www/sites/all/modules
   cp -R tripal_analysis*/theme/* /var/www/sites/all/themes/theme_tripal
```

Do not enable these modules in Drupal just yet. We will do that later.

## <span id="Using_Tripal" class="mw-headline">Using Tripal</span>

### <span id="Installing_Chado" class="mw-headline">Installing Chado</span>

The first thing we want to do is install Chado. If Chado is already
installed in another database then Tripal can use that Chado as well.
However, for better compatibility with all functionality of Drupal it is
best if Drupal and Chado live in the same database. Instructions for
integrating Tripal with an external Chado database are provided on the
Tripal website but will not be shown in this tutorial

  
To install Chado, simply navigate to the page **Administer** → **Tripal
Management** → **Install Chado v1.11**, read the warning message and
click **Install Chado** when ready.

<a href="File:800px-TripalInstallChado.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a5/800px-TripalInstallChado.png" width="800"
height="362" alt="800px-TripalInstallChado.png" /></a>

  
A message will then be given that says
`"Job 'Install Chado' submitted. Click the jobs page for status"`. If we
then click the link *jobs page* we can then see our job in the list:

<a href="File:Tripal_Jobs1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/c8/Tripal_Jobs1.png/800px-Tripal_Jobs1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c8/Tripal_Jobs1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c8/Tripal_Jobs1.png 2x"
width="800" height="613" alt="Tripal Jobs1.png" /></a>

  
We will continue our installation of Chado in the next section.

### <span id="Jobs_Management" class="mw-headline">Jobs Management</span>

The jobs management subsystem allows modules to submit long-running
jobs, on behalf of site administrators or site visitors. Often, long
running jobs can time out on the web server and fail to complete. The
jobs system runs separately in the background using the command-line on
an automated schedule but jobs are submitted through the web interface
by users.

So, in the example above we now see a job for installing Chado. The job
view page provides details such as the name of the job, The user who
submitted the job, dates that the job was submitted and job status.

Jobs in the queue can be executed in two ways:

- Manually through a command-line call
- Using the UNIX cron to automatically launch the command-line

When we installed Drupal we installed a Cron job to allow the software
to run housekeeping tasks on a regular bases. Tripal needs a cron entry
as well to allow for regular execution of jobs in the queue. We will
need to add a second cron entry:

``` enter
   sudo crontab -e
```



[A word on text editors such as
nano](Linux_Text_Editors "Linux Text Editors").



  
Add this line to the crontab

``` enter
   0,15,30,45 * * * * (cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator ) > /dev/null
```

  
This entry will run the Tripal cron every 15 minutes as the
administrator user. For this tutorial we do not want to wait 15 minutes
at the most to execute our jobs. So, we will run the jobs manually. We
will execute the same command that we used in the cron above:

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

  
We should now see that Chado is being installed!

<a href="File:800px-TripalChadoInstalled.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/ae/800px-TripalChadoInstalled.png"
width="800" height="360" alt="800px-TripalChadoInstalled.png" /></a>

  
Also, we see that the job has completed when refreshing the jobs
management page:

<a href="File:Tripal_Jobs2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/61/Tripal_Jobs2.png/800px-Tripal_Jobs2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/61/Tripal_Jobs2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/61/Tripal_Jobs2.png 2x"
width="800" height="403" alt="Tripal Jobs2.png" /></a>

### <span id="Using_PhpPgAdmin_to_View_Chado.2FDrupal_Tables" class="mw-headline">Using PhpPgAdmin to View Chado/Drupal Tables</span>

PhpPgAdmin is a freely available database management tool for PostgreSQL
databases. It was installed earlier, password protected, and is
accessible at this URL:
<a href="http://localhost/phppgadmin/" class="external free"
rel="nofollow">http://localhost/phppgadmin/</a>. Log in using the
username **tripaladmin** and the password created earlier.

Next log in to the PhpPgAdmin tool with the username **tripal** and
password we created earlier for the database user. When the tool opens
you'll see several databases listed down the left-hand side. Click the
**tripal_demo** database and then **Schemas** to open the tree.

<a href="File:Tripal_databases.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/47/Tripal_databases.png/800px-Tripal_databases.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/47/Tripal_databases.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/47/Tripal_databases.png 2x"
width="800" height="450" alt="Tripal databases.png" /></a>

  
Under the **tripal_demo** database you'll see several different schemas:

- chado
- frange
- genetic_code
- public
- so

The **chado**, **frange**, **genetic_code** and **so** schemas were all
installed by our Chado installation. The **public** schema is used by
Drupal. All of the chado tables that we will be using are housed in the
'chado' schema and all tables for Drupal are in the 'public' schema.

  
Open the **chado** schema look at the Chado tables. Then open the
**public** schema and take a look at the Drupal tables

  
The Chado database:

<a href="File:Tripal_chado_tables.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/0d/Tripal_chado_tables.png/800px-Tripal_chado_tables.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/0d/Tripal_chado_tables.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/0d/Tripal_chado_tables.png 2x"
width="800" height="679" alt="Tripal chado tables.png" /></a>

  
The Drupal database

<a href="File:Tripal_drupal_tables.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/c9/Tripal_drupal_tables.png/800px-Tripal_drupal_tables.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c9/Tripal_drupal_tables.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c9/Tripal_drupal_tables.png 2x"
width="800" height="679" alt="Tripal drupal tables.png" /></a>

### <span id="Enable_Additional_Tripal_Modules" class="mw-headline">Enable Additional Tripal Modules</span>

Now that we have the core module installed and enabled and the Chado
database installed we can enable the other Tripal modules.

Return to the **Administer** → **Site building** → **Modules** page and
turn on the following Tripal modules in the following order. Do not
enable all of them at once. Use the following order:

1.  Tripal DB
2.  Tripal CV
3.  Tripal Organism
4.  Tripal Analysis
5.  Tripal Feature
6.  Tripal Stock
7.  Tripal Library
8.  Tripal Search

  
**Note**: It is not necessary to enable all Tripal modules. Only those
you may want to use. For example, if you do not want to use the library
module it is not necessary to enable.

Now, when you visit the **Administer** → **Tripal Management** page you
will see several more administrative options available to you.

For this tutorial, we will also be using some of the extension modules
we installed earlier. Therefore, we want to enable these extension
modules as well:

- Tripal Blast
- Tripal GO
- Tripal KEGG
- Tripal Interpro

You will notice that after installation, a set of new menu items have
appeared in our primary menu at the top of the page. If you have Drupal
Views installed the menu items will include:

- Analyses: provides a list of all analyses in Chado
- Organisms: provides a list of all organisms in Chado
- Sequence Features: provides a basic list and searching mechanism to
  find genomic features
- Sequence Libraries: provides a basic list and searching mechanism to
  find libraries.
- Stocks: provides a basic searching mechanism to find stocsk.

Using the Drupal Views interface (to be discussed later), you can change
the content and behavior of these lists. If you did not enable Drupal
Views then then you will have a similar list of additional menu items,
but the pages for those menu items can not be customized. Therefore, it
is recommend to use Drupal Views.

  
<a href="File:Tripal_afterinstall_menu.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e9/Tripal_afterinstall_menu.png/800px-Tripal_afterinstall_menu.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e9/Tripal_afterinstall_menu.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e9/Tripal_afterinstall_menu.png 2x"
width="800" height="219" alt="Tripal afterinstall menu.png" /></a>

  

You can use the menu administration pages of Drupal to remove these. If
you enabled Drupal Views (as instructed previously), then you may change
the content shown on each page when you click the

### <span id="Enable_the_Tripal_Theme" class="mw-headline">Enable the Tripal Theme</span>

Tripal provides a theme for Drupal, but it is designed to be a **base
theme**. This way the site can use any theme you want, but Tripal can
still provide some theming support for the data components it generates.
To enable the Tripal theme, Navigate to the **Adminster** → **Site
Building** → **Themes** page and click the checkbox to Enable the
**Tripal** theme. DO NOT click the **default** radio button for the
Tripal theme. We do not want it to be default. The **Sky** theme should
remain as default.

<a href="File:800px-TripalBaseTheme1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/30/800px-TripalBaseTheme1.png" width="800"
height="485" alt="800px-TripalBaseTheme1.png" /></a>

  
Next we have to inform our default theme (a.k.a the **Sky** theme) that
it should use Tripal as it's base theme. To do this, we need to edit the
.info file in the **Sky** theme directory.

``` enter
   cd /var/www/sites/all/themes/sky
   gedit sky.info
```

  
Scroll to the bottom of the file and add the following line

``` enter
   base theme = tripal
```

  
If you do not wish to use the Sky theme, you simply need to find the
corresponding .info file for your default theme and add the same line to
the file.

### <span id="Controlled_Vocabularies:_Installing_CVs" class="mw-headline">Controlled Vocabularies: Installing CVs</span>

Before we can proceed with populating our Chado table with genomic data
we must first load some controlled vocabularies (i.e. ontologies). To do
this, navigate to **Administer** → **Tripal Management** → **Controlled
Vocabularies**. You'll see a page describing the purpose of the module
and how to use it. Click the link on the left sidebar titled 'Add/Update
Ontology With OBO File'. You'll see the following page:

<a href="File:800px-TripalAddOntology.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/76/800px-TripalAddOntology.png" width="800"
height="485" alt="800px-TripalAddOntology.png" /></a>

  
The Ontology loader will allow you to select a pre-defined ontology from
the drop down list or allow you to provide your own to be loaded. If you
provide your own, you give the remote URL of the OBO file or provide the
full path on the local web server where the OBO file is located. In the
case of a remote URL, Tripal first downloads and then parses the OBO
file for loading. If you do provide your own OBO file it will appear in
the saved drop down list for loading of future updates to the ontology.

For this tutorial, we need to install these ontologies:

1.  Chado feature properties
2.  Relationship ontology
3.  Sequence ontology
4.  Gene ontology.

Do so by selecting one and clicking the **Submit** button. Repeat this
process for each of the three ontologies. You'll notice each time that a
job is added to the jobs subsystem.

  
Now manually launch these jobs

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

  
**Note:** Loading the Gene Ontology will take several hours.

### <span id="Creating_Organism_Pages" class="mw-headline">Creating Organism Pages</span>

There are two ways to create pages for organism. If your organism is
already in Chado then you can sync the organism. If it is not in Chado
you will need manually create it using the Tripal web interface. The
following two sections describe both methods.

#### <span id="What_if_Our_Organism_is_Already_in_Chado.3F" class="mw-headline">What if Our Organism is Already in Chado?</span>

Now that we have Chado loaded and populated we would like to create a
home page for our species. Chado comes pre-loaded with a few species
already, so we will check to see if our organism is already present. To
do this navigate to **Administer** -\> **Tripal Management** →
**Organisms** → **Configuration**

<a href="File:800px-TripalOrganisms.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ec/800px-TripalOrganisms.png" width="800"
height="485" alt="800px-TripalOrganisms.png" /></a>

  
This configuration page has several different options. We will discuss
two of these here. The first is the top section labeled **Sync
Organisms**. In this section is a list of organisms. These are the
organisms that come by default with Chado. Fortunately, our organism is
already in the list: *Drosophila melenogaster*

  
We need to inform Drupal that we have data in Chado that we would like a
web page for. This is what we call **Syncing**. We need to sync Drupal
and Chado so that Drupal knows about our organism. To do this, click the
check box next to **Drosophila melenogaster** and then click the
**Submit Sync Job**.

  
As usual we want to run this job manually:

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

  
Now that our organism is synced we should have a new page for
*Drosophila melenogaster*. To find out, click the **Organisms** menu
item at the top of the page. This menu item was automatically added when
we installed the Tripal Organism module. On this page we see a list of
organisms that are present in Chado. Notice that only the fruitfly is
clickable because it is the only organism synced.

<a href="File:Tripal_orgnaisms1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/a7/Tripal_orgnaisms1.png/800px-Tripal_orgnaisms1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a7/Tripal_orgnaisms1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a7/Tripal_orgnaisms1.png 2x"
width="800" height="620" alt="Tripal orgnaisms1.png" /></a>

  
Now if we click the 'fruitfly' link it should take us to our new
organism page:

<a href="File:Tripal_organism3.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/54/Tripal_organism3.png/800px-Tripal_organism3.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/54/Tripal_organism3.png/1200px-Tripal_organism3.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/54/Tripal_organism3.png 2x"
width="800" height="466" alt="Tripal organism3.png" /></a>

By default all Tripal pages have a center content section and a right
side-bar section with links for **Resources**. However, this page is a
bit empty. We need to add some details. Click the **Edit** tab towards
the top of the page. Notice two if the fields are missing content: the
description and the organism image

<a href="File:800px-TripalOrganism4.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b1/800px-TripalOrganism4.png" width="800"
height="485" alt="800px-TripalOrganism4.png" /></a>

  
For the description add the following text (taken from wikipedia:
<a href="http://en.wikipedia.org/wiki/Drosophila_melanogaster"
class="external free"
rel="nofollow">http://en.wikipedia.org/wiki/Drosophila_melanogaster</a>):

"The genome of D. melanogaster (sequenced in 2000, and curated at the
FlyBase database) contains four pairs of chromosomes: an X/Y pair, and
three autosomes labeled 2, 3, and 4. The fourth chromosome is so tiny
that it is often ignored, aside from its important eyeless gene. The D.
melanogaster sequenced genome of 165 million base pairs has been
annotated\[17\] and contains approximately 13,767 protein-coding genes,
which comprise ~20% of the genome out of a total of an estimated 14,000
genes. More than 60% of the genome appears to be functional
non-protein-coding DNA involved in gene expression control.
Determination of sex in Drosophila occurs by the ratio of X chromosomes
to autosomes, not because of the presence of a Y chromosome as in human
sex determination. Although the Y chromosome is entirely
heterochromatic, it contains at least 16 genes, many of which are
thought to have male-related functions."

  
For the image, download this image below and upload it using the
interface on the page.

<a href="File:Dmel.jpg" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/65/Dmel.jpg" width="250" height="196"
alt="Dmel.jpg" /></a>

  
Save the page. Now we have a more informative page:

<a href="File:Tripal_organism5.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/35/Tripal_organism5.png/800px-Tripal_organism5.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/35/Tripal_organism5.png/1200px-Tripal_organism5.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/35/Tripal_organism5.png 2x"
width="800" height="466" alt="Tripal organism5.png" /></a>

#### <span id="What_if_My_Organism_Is_Not_Present_in_Chado.3F" class="mw-headline">What if My Organism Is Not Present in Chado?</span>

If we have an organism that is not already present in Chado, we can
easily add one using the **Create Content** page. You can find this link
on the left side bar navigation menu. The **Create Content** page has
many more content types than when we first saw it. Previously we only
had **Page** and **Story** content types. Now we have three additional
content types added by the Tripal Analysis, Organism and Feature
modules.

<a href="File:Tripal_create_content.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/bc/Tripal_create_content.png/800px-Tripal_create_content.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/bc/Tripal_create_content.png/1200px-Tripal_create_content.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/bc/Tripal_create_content.png 2x"
width="800" height="466" alt="Tripal create content.png" /></a>

  
To add a new organism simply click the **Organism** link and and fill in
the fields.

<a href="File:800px-TripalOrganism6.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b2/800px-TripalOrganism6.png" width="800"
height="485" alt="800px-TripalOrganism6.png" /></a>

  
Here you can create a new organism of your choice. Once complete, click
the **Organism** menu item at the top to see it in the list.

### <span id="Creating_an_Analysis" class="mw-headline">Creating an Analysis</span>

For this tutorial, we will later import a set of genes, including
associated mRNA, CDS, exons, etc. Tripal requires that an Analysis be
associated with all imported features. This has several advantages,
including:

- The source of features (sequences) can be traced. Even for feature
  simply downloaded from a database, it allows someone else to see where
  the features came from.
- Provides a mechanism for describing how the features were created
  (e.g. whole genome structural and functional annotation description)
- The analysis links all of the features together which can be useful
  for querying for specific features from an analysis.

To create an analysis for loading our genomic data, navigate to the
**Create content**and click on the link: **Analysis**

<a href="File:Tripal_create_content.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/bc/Tripal_create_content.png/800px-Tripal_create_content.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/bc/Tripal_create_content.png/1200px-Tripal_create_content.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/bc/Tripal_create_content.png 2x"
width="800" height="466" alt="Tripal create content.png" /></a>

The analysis creation page will appear:

<a href="File:Tripal_createAnalysis.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/eb/Tripal_createAnalysis.png/800px-Tripal_createAnalysis.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/eb/Tripal_createAnalysis.png/1200px-Tripal_createAnalysis.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/eb/Tripal_createAnalysis.png 2x"
width="800" height="466" alt="Tripal createAnalysis.png" /></a>

Here you can provide the necessary details to help others understand the
source of your data. For this tutorial, enter the following:

- Analysis Name: Drosophila melanogaster genes from Flybase
- Program: Web Download
- Program Version: FlyBase r5.34
- Source Name: FlyBase
- Source URI: <a href="http://flybase.org/" class="external free"
  rel="nofollow">http://flybase.org/</a>
- Time Executed: (todays date)
- Description: A subset of the gene list from the 2lHet chromosome of
  Drosophila melanogaster was downloaded from Flybase. The original GFF
  file can be obtained from here: \<a href="<a
  href="ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r5.34_FB2011_02/gff/dmel-2LHet-r5.34.gff.gz"
  class="external free"
  rel="nofollow">ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r5.34_FB2011_02/gff/dmel-2LHet-r5.34.gff.gz</a>"\>dmel-2LHet-r5.34.gff.gz\</a\>

After saving, you should have the following analysis page:

<a href="File:Tripal_analysis2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/20/Tripal_analysis2.png/800px-Tripal_analysis2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/20/Tripal_analysis2.png/1200px-Tripal_analysis2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/20/Tripal_analysis2.png 2x"
width="800" height="466" alt="Tripal analysis2.png" /></a>

### <span id="Creating_a_Database_Cross_Reference" class="mw-headline">Creating a Database Cross Reference</span>

For our site, we want to create gene pages with sequences and have those
pages link back to Flybase where we obtained the genes. Therefore, we
want to add a database reference for FlyBase. To mange external
databases, navigate to **Administer** → **Tripal Management** →
**Databases** → **Update/Delete Database References**. On this page
appears a singe drop down list of the available databases stored in
Chado.

<a href="File:800px-TripalDBs.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/44/800px-TripalDBs.png" width="800"
height="537" alt="800px-TripalDBs.png" /></a>

  
Look in the drop down list for an existing **FlyBase** database. Most of
these databases were added automatically by the Chado installation.
However, some of these, including the 'FlyAtlas' and
'FlyBase_Annotation_ID' database were added automatically by the GFF
loader. Since we do not find a database that matches what we want, we
will add our own. To do this, click the link **Add a new external
database**. Enter the following values for the fields:

- Name: FlyBase
- Description: FlyBase: a database for drosophila genetics and molecular
  biology
- URL: <a href="http://flybase.org/" class="external free"
  rel="nofollow">http://flybase.org/</a>
- URL prefix:
  <a href="http://flybase.org/reports/" class="external free"
  rel="nofollow">http://flybase.org/reports/</a>

The URL prefix is important as it will be used to create the links on
our gene pages. Our gene name will be appended to this URL to create the
link that will take us to the corresponding gene page on Flybase.

Click **Add**.

We now have added a new database!

### <span id="Loading_Feature_Data" class="mw-headline">Loading Feature Data</span>

Now that we have our organism ready, we can being loading genomic data.
For this tutorial only a few genomic features from the genome of
*Drosophila melenogaster* (obtained from FlyBase) have been selected.
This is to ensure we can move through the tutorial rather quickly. But
Tripal can support larger datasets. Links to download the feature data
are provided in the text below. Also, we are not loading the entire
compendium of data for these genomic features. Tripal does not have
loaders or visualization pages for all of the data types available on
FlyBase.

#### <span id="Loading_a_GFF3_File" class="mw-headline">Loading a GFF3 File</span>

A GFF3 file containing the genes and mRNA sequences we will be using can
be downloaded here:
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/6e/Flybase-tripal-demo.gff"
class="internal" title="Flybase-tripal-demo.gff">Flybase demo data</a>
(Aside from filtering the original FlyBase GFF file, no alterations have
been made to this file). Right-click and download this data. Save the
file in the directory `/var/www/sites/default/files`. The
`/var/www/sites/default/files` is the default directory for Drupal where
you can put files that can be shared through your website. We will store
our GFF file here so that we can easily link to it later and make it
available to our site visitors.

Now, navigate to **Administer** → **Tripal Management** → **Features** →
**Import a GFF3 file**.

<a href="File:Tripal-importGFF.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7d/Tripal-importGFF.png/800px-Tripal-importGFF.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7d/Tripal-importGFF.png/1200px-Tripal-importGFF.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/7d/Tripal-importGFF.png 2x"
width="800" height="466" alt="Tripal-importGFF.png" /></a>

Perform the following:

1.  Choose the organism to which the GFF3 file belongs (in this case
    *Drosophila melanogaster (fruitfly)*
2.  Enter the path on the file system where our GFF file resides
    (`/var/www/sites/default/files/Flybase-tripal-demo.gff`)
3.  Select the analysis named "Drosophila melanogaster genes from
    Flybase".
4.  Select the check box "Import all and update"

Finally, click the **Import GFF3 button**. You'll notice a job was
submitted to the jobs subsystem. Now, to complete the process we need
the job to run. We'll do this manually:

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

The final text on the screen should look like the following:

<a href="File:Tripal-loadGFF.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/20/Tripal-loadGFF.png/800px-Tripal-loadGFF.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/20/Tripal-loadGFF.png/1200px-Tripal-loadGFF.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/20/Tripal-loadGFF.png 2x"
width="800" height="489" alt="Tripal-loadGFF.png" /></a>

**Note**: You may notice as the output scrolls by in the terminal a few
"Error" lines. These lines can be safely ignored for this tutorial.

**Note**: For very large GFF files the loader can take quite a while to
complete. If you find the loader is taking too long you can improve
performance by using the Perl-based Chado loaders to load your GFF file.

#### <span id="Loading_FASTA_files" class="mw-headline">Loading FASTA files</span>

Using the Tripal GFF loader we were able to populate the database with
the genomic features for our organism. However, those features now need
nucleotide and protein sequence data. To do this, we will load three
FASTA files which you can download from the following links. Save these
files in the `/var/www/sites/default/files` directory

- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/36/Flybase-tripal-demo.2LHet.fna.txt"
  class="internal"
  title="Flybase-tripal-demo.2LHet.fna.txt">Media:Flybase-tripal-demo.2LHet.fna.txt</a>:
  2LHet chromosomal sequence
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f4/Flybase-tripal-demo.genes.fna.txt"
  class="internal"
  title="Flybase-tripal-demo.genes.fna.txt">Media:Flybase-tripal-demo.genes.fna.txt</a>:
  nucleotide sequences for genes
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a2/Flybase-tripal-demo.peptides.fna.txt"
  class="internal"
  title="Flybase-tripal-demo.peptides.fna.txt">Media:Flybase-tripal-demo.peptides.fna.txt</a>:
  translated peptide sequences

  
Now,navigate to the **Administer** → **Tripal Management** →
**Features** → **Import a Multi-FASTA file** Page

  
<a href="File:Tripal-import_fasta.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/93/Tripal-import_fasta.png/800px-Tripal-import_fasta.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/93/Tripal-import_fasta.png/1200px-Tripal-import_fasta.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/93/Tripal-import_fasta.png 2x"
width="800" height="466" alt="Tripal-import fasta.png" /></a>

Before loading the FASTA file we must first know the Sequence Ontology
(SO) term that describes the sequences we are about to upload. We can
find the appropriate SO terms from our GFF file. In the GFF file we see
the SO terms that correspond to our FASTA files are 'chromosome_arm' and
'gene'. However, the protein sequences were not present in our GFF file
so these will need to be added as new features of type 'peptide'.

We will load our FASTA files in the order they appear for download
above.

  
**IMPORTANT:** It is important to ensure prior to importing, that the
FASTA loader will be able to appropriately match the sequence in the
FASTA file with existing sequences in the database. Before loading FASTA
files take special care to ensure the definition line of your FASTA file
can uniquely identify the feature for the specific organism and sequence
type. For example, in our GFF file the chromosome's are of type
'chromsome_arm' and have an ID of '2LHet' and a Name of '2LHet':

``` enter
2LHet   FlyBase chromosome_arm  1       368872  .       .       .       ID=2LHet;Name=2LHet;Dbxref=REFSEQ:NW_001848855,GB:CM000456
```

In our FASTA file for the chromosomes, the first few line are as
follows:

``` enter
>2LHet
TTCATCTTTCGTCTTTATGAAAAACACAAACATGTATCTCGATTTGTCATCTACGAAGGTGACAAAATAGCGTGCACCTC
CAACAGACGTCGTTTGTATTGGACCACAGATGTCACTATGCACAGTACTTCATTTGTGCGATTTCCAGAGGCTTTTGGGA
```

When loading a FASTA file you must specify if the definition line (e.g.
"\>2LHet") matches either the Name or Unique Name. In Chado, features
always have a human readable name which does not need to be unique, and
also a unique name which must be unique for the organism and SO type. In
the GFF file, the ID becomes the unique name and the Name becomes the
human readable name. They are identical in this case and our definition
line properly identifies the feature. Therefore we can specify to match
on the name or the unique name when loading this file.

In another example, here is an entry from the GFF file for a gene:

``` enter
2LHet   FlyBase gene    19633   32995   .   -   .   ID=FBgn0039958;Name=CG12567;Alias=FBan0012567;
```

And here is the corresponding part of the FASTA file:

``` enter
>FBgn0039958 type=gene; loc=2LHet:complement(19633..32995); ID=FBgn0039958; name=CG12567; dbxref=GB:AA439562,GB:AABU01002756,GB:AI945506,GB:AY071204,GB_protein:AAL48826,GB:BI227483,UniProt/TrEMBL:Q7PLS1,UniProt/TrEMBL:Q8SZ06,INTERPRO:IPR000086,GB_protein:EAA46064,GB_protein:EAA46064,GB_protein:EDP28153,GB_protein:EAA46065,GB_protein:EAA46065,GB_protein:EFA98684,GB_protein:EFA98683,FlyBase_Annotation_IDs:CG12567,FlyBase:FBan0012567,FlyBase:FBgn0039958,INTERPRO:IPR015797,EntrezGene:3355094,UniProt/TrEMBL:A8Y4U4,UniProt/TrEMBL:D2A6J3,UniProt/TrEMBL:D2A6J2,BIOGRID:78219,DroID:FBgn0039958,DRSC:FBgn0039958,FLIGHT:FBgn0039958,FlyAtlas:CG12567-RB,FlyMine:FBgn0039958,modMine:FBgn0039958; MD5=57c1745d700710f63511899f5bc07576; length=13363; release=r5.34; species=Dmel;
AACACGCAAACGAACTTTCAAATATGTTACTTATTAATATTGTAGTGCCAACAGAGCATC
TCTTTGTCCTCAGTAAGTGCTGGAAAACGGACCATTGAGTGATGCTCTACATTACTCACC
```

Here, the name and unique name are different in the GFF file. However,
we can see that the first word in the definition line of the FASTA file
is the unique name. So, we can specify the unique name for matching when
loading the FASTA file for genes.

By default, Tripal will match the first word using either the name or
unique name as indicated by the user. If however, the feature name is
not the first word you may use regular expressions in the "Advanced
Options" to tell Tripal where to find the name or unique name in the
definition line of your FASTA file.

**IMPORTANT:** When loading FASTA files to update existing features,
always choose "Update only" as the import method. Otherwise, Tripal may
add the features in the FASTA file as new features if it cannot properly
match them to existing features.

  
***Loading Flybase-tripal-demo.2LHet.fna.txt (chromosomal sequence)***

Load the FASTA file for the chromosomes by specifying the following:

- FASTA file:
  /var/www/sites/default/files/Flybase-tripal-demo.2LHet.fna.txt
- Organism: Drosophila melenogaster (fruitfly)
- Sequence type: chromosome_arm
- Method: Update only (we do not want to insert these are they should
  already be there)
- Name Match: Unique name
- Analysis: Drosophila melanogaster genes from Flybase

Click the **Import Fasta File**, and a job will be added to the jobs
system. Run the job:

``` enter
   cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

  
***Loading Flybase-tripal-demo.genes.fna.txt***

Load the FASTA file for the chromosomes by specifying the following:

- FASTA file:
  /var/www/sites/default/files/Flybase-tripal-demo.genes.fna.txt
- Organism: Drosophila melanogaster (fruitfly)
- Sequence type: gene
- Method: Update only
- Name Match Type: Unique name
- Under advanced options set the following
  - External database: FlyBase (the database we created earlier)
  - Regular expression for the accession: ^(.\*?)\s.\*\$

We set the "External database" and "Regular expression for the
accession" fields because we want to link our genes to Flybase. Earlier,
we created a database entry for FlyBase which has the proper URL prefix
needed. But also we need to provide the database 'accession' name to be
used when constructing the link. For Flybase, the accession name needed
to construct the link is the same as the unique name and we use a
regular expression to extract this name.

Here is the meaning of the characters in the regular expression:

``` enter
  ^         matches the beginning of the line
  $         matches the end of the line
  .         matches any character
  \s        matches a space
  (.*?)\s   matches all characters up to the first space.  The text in parenthesis will be the accession
```

  
Click the **Import Fasta File**, and a job will be added to the jobs
system. Run the job:

``` enter
   cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

  
You should see output from the jobs similar to the following indicating
that the gene sequences were updated and the database cross references
were added:

<a href="File:800px-TripalFastaLoad2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8b/800px-TripalFastaLoad2.png" width="800"
height="322" alt="800px-TripalFastaLoad2.png" /></a>

  
***Loading Flybase-tripal-demo.peptides.fna.txt***

The features present in the other FASTA files were already added to
Chado by the GFF loader, so the FASTA loader simply updated those
features by added the sequence information. Their relationships and
database references were already in the database so we didn't need to
use the advanced options of the FASTA loader to add this information.
However, the protein sequences were not added by the GFF loader as they
were not present in the GFF file. We will need to use the advanced
options to associate these protein sequences with the mRNA features from
which they are derived. We also want to have links for these features to
FlyBase.

  
We will need to use the advanced options to associate relationships and
a database reference with these peptides. Here is an example of a
definition line in the FASTA file:



` `

\>FBpp0112427 type=protein;
loc=2LHet:complement(20469..20650,20723..21383,21436..21569,32573..32645);
ID=FBpp0112427; name=CG12567-PA; parent=FBgn0039958,FBtr0113704;
dbxref=FlyBase_Annotation_IDs:CG12567-PA,FlyBase:FBpp0112427,REFSEQ:NP_001015384,GB_protein:EAA46065,FlyMine:FBpp0112427,modMine:FBpp0112427;
MD5=246ea191b614901ccb7ba87d545d6308; length=349; release=r5.34;
species=Dmel;



  
We will use regular expressions to pull out the necessary information.
Use these values when loading this FASTA file:

- FASTA file:
  /var/www/sites/default/files/Flybase-tripal-demo.peptides.fna.txt
- Organism: Drosophila melanogaster (fruitfly)
- Sequence type: protein
- Method: Insert and update
- Name match Type: Unique name
- Analysis: Drosophila melanogaster genes from Flybase
- Under advanced options set the following
  - Regular expression for the name: name=(.\*?);
  - Regular expression for the unique name: ID=(.\*?);
  - External Database Reference:
    - External Database: FlyBase
    - Regular expression for the accession: ID=(.\*?);
  - Relationships
    - Relationship type: produced by
    - Regular expression for the parent: parent=.\*?,(.\*?);
    - Parent type: mRNA

  
Click the **Import FASTA file** button and then run the job:

``` enter
   cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

  
You should see output where the protein feature was added, along with
relationship information and database cross-reference information:

<a href="File:800px-TripalFastaLoader2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/20/800px-TripalFastaLoader2.png" width="800"
height="478" alt="800px-TripalFastaLoader2.png" /></a>

### <span id="Creating_Feature_Pages" class="mw-headline">Creating Feature Pages</span>

Now that we've loaded our feature data, we must "sync" them. Loading of
the GFF file in the previous step has populated the feature tables of
Chado for us, but now Drupal must know about these features. To sync
features, navigating to **Administer** → **Tripal Management** →
**Features** → **Sync Features** (unlike for syncing organisms, features
have a separate page for syncing).

<a href="File:Tripal-sync_features.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/af/Tripal-sync_features.png/800px-Tripal-sync_features.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/af/Tripal-sync_features.png/1200px-Tripal-sync_features.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/af/Tripal-sync_features.png 2x"
width="800" height="466" alt="Tripal-sync features.png" /></a>

Here we can specify the types of features to sync and the organism. This
allows us to create feature pages for different types of features for
different organisms. Enter into the **Feature Types** the features that
should have pages on the site. In this case, we want gene and mRNA
pages. Features of these types were present in our GFF file. So, add the
SO terms 'gene' and 'mRNA' to the this box.

  
Next, select the organism "Drosophila Melenogaster", and click the "Sync
all features" button. A job is then added to the jobs management system
which we need to manually run rather than wait on the cron entry to run
it.

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

  
Our features are now synced:

  
<a href="File:800px-TripalFeatureSync.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c8/800px-TripalFeatureSync.png" width="800"
height="384" alt="800px-TripalFeatureSync.png" /></a>

  
Below are some screen shots of the the various data types available for
the feature:

**Feature Details**

<a href="File:Tripal_feature_details.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/b0/Tripal_feature_details.png/900px-Tripal_feature_details.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/b0/Tripal_feature_details.png/1350px-Tripal_feature_details.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b0/Tripal_feature_details.png 2x"
width="900" height="674" alt="Tripal feature details.png" /></a>

**References**

Not shown, but at the bottom of the page is the link to FlyBase that we
added using the FASTA loader. If clicked it will take you to the FlyBase
record <a href="File:Tripal_feature_references.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1f/Tripal_feature_references.png/900px-Tripal_feature_references.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1f/Tripal_feature_references.png/1350px-Tripal_feature_references.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/1f/Tripal_feature_references.png 2x"
width="900" height="674" alt="Tripal feature references.png" /></a>

**Relationships**

This gene is the parent of several mRNA sequences
<a href="File:Tripal_feature_relation.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e7/Tripal_feature_relation.png/900px-Tripal_feature_relation.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e7/Tripal_feature_relation.png/1350px-Tripal_feature_relation.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e7/Tripal_feature_relation.png 2x"
width="900" height="674" alt="Tripal feature relation.png" /></a>

**Alignments**

This gene is aligned to Chromosome 2LHet
<a href="File:Tripal-feature_aligns.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/ea/Tripal-feature_aligns.png/900px-Tripal-feature_aligns.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/ea/Tripal-feature_aligns.png/1350px-Tripal-feature_aligns.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ea/Tripal-feature_aligns.png 2x"
width="900" height="674" alt="Tripal-feature aligns.png" /></a>

  
**GO Assignments**

This gene is annotated with the following GO terms (obtained when
loading the GFF file)
<a href="File:Tripal-feature_go.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/91/Tripal-feature_go.png/900px-Tripal-feature_go.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/91/Tripal-feature_go.png/1350px-Tripal-feature_go.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/91/Tripal-feature_go.png 2x"
width="900" height="674" alt="Tripal-feature go.png" /></a>

### <span id="Materialized_Views" class="mw-headline">Materialized Views</span>

Chado is very efficient as a data warehouse but queries can become slow
depending on the number of table joins and amount of data. To help
simplify and speed these queries, materialized views were introduced
into Chado by the GMOD folks.

  
A materialized views will take an SQL query like this

``` enter
   SELECT DISTINCT CVT.name,CVT.cvterm_id, CV.cv_id, CV.name
   FROM {cvterm_relationship} CVTR
     INNER JOIN cvterm CVT on CVTR.object_id = CVT.cvterm_id
     INNER JOIN CV on CV.cv_id = CVT.cv_id
   WHERE CVTR.object_id not in
        (SELECT subject_id FROM {cvterm_relationship})
```

And reduce it into this:

``` enter
     SELECT * FROM cv_root_mview WHERE cvterm_id = 100
```

For this to work a table named **cv_root_mview** is created and
populated with the results of the larger query. The query on the
materialized view is more simple and faster. A side effect, however is
redundant data, with the materialized view becoming stale if not updated
regularly.

Tripal provides a mechanism for populating and updating these
materialized views. These can be found on the **Administer** → **Tripal
Management** → **Materialized Views** page.

<a href="File:Tripal_mviews1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/45/Tripal_mviews1.png/800px-Tripal_mviews1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/45/Tripal_mviews1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/45/Tripal_mviews1.png 2x"
width="800" height="620" alt="Tripal mviews1.png" /></a>

  
Here we see several materialized views. These were installed
automatically by the various modules. To update these views, click the
**Update** button for each one.

So, let's run these two jobs by clicking the **Update** button next to
the name:

- cv_root_mview
- organism_feature_count

Run these jobs manually:

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

  
You can now see that both views are up-to-date on the **Materialized
Views** Page

<a href="File:Tripal-vmiews2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/ab/Tripal-vmiews2.png/800px-Tripal-vmiews2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/ab/Tripal-vmiews2.png/1200px-Tripal-vmiews2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/ab/Tripal-vmiews2.png 2x"
width="800" height="514" alt="Tripal-vmiews2.png" /></a>

### <span id="Feature_Page_Configuration" class="mw-headline">Feature Page Configuration</span>

Before viewing our Feature pages, we need to make a few configuration
settings. Navigate to the **Administer** → **Tripal Management** →
**Features** %rarr; **Feature Configuration** page.

<a href="File:Tripal_feature_config.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/23/Tripal_feature_config.png/800px-Tripal_feature_config.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/23/Tripal_feature_config.png/1200px-Tripal_feature_config.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/23/Tripal_feature_config.png 2x"
width="800" height="599" alt="Tripal feature config.png" /></a>

First, we can alter the feature URL path. This is the URL path that
visitors can bookmark or link to for each feature. The URL would be
<a href="http://localhost/" class="external free"
rel="nofollow">http://localhost/</a>\[identifier\] where \[identifier\]
could be the name of the feature, unique name or internal ID number. If
you are certain that all features can be uniquely identified by a name
or unique name then select one of those, otherwise the internal ID is
guaranteed to always be unique.

For this tutorial we will select the "feature unique name" as we will
not have any pages for features with the same unique name.

Second, we can specify a prefix for the internal ID number when it
appears on the URL path. For example, if we leave the default prefix of
'ID' and have a feature ID number of 283942, the feature ID would appear
as 'ID283942'. If we set this ID to be 'FLY' then the internal ID will
by 'FLY283942'. For this tutorial we will leave the ID prefix set to
'ID'.

We want to set the URL for all of the features we loaded previously. To
do this, click the button 'Set Feature URLs'. This will add a job to the
jobs subsytem. We want to execute this job manually:

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

Third on the configuration page are **Feature Browser** settings. By
default, Tripal will provide a browser on the organism page that allows
a visitor to easily find a feature. For large sites with many features
this would be an inefficient way to find a specific feature, but it does
allow visitors who simply want to explore the site to quickly find
example pages. This browser will only show synced features and will only
show features of the type specified in the **Feature Types** box. We
want to show 'genes' pages so alter the contents of this box to contain
only the word 'gene'. Optionally, you can turn this browser off by
setting the appropriate radio buttons.

If we then navigate to the organism page for *Drosophila melanogaster*
and click the link on the right sidebar titled **Feature Browser** we
can see the genes listed with links for each feature page.

<a href="File:Tripal_feature_borwser.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/19/Tripal_feature_borwser.png/800px-Tripal_feature_borwser.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/19/Tripal_feature_borwser.png/1200px-Tripal_feature_borwser.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/19/Tripal_feature_borwser.png 2x"
width="800" height="599" alt="Tripal feature borwser.png" /></a>

  
Fourth on the configuration page is the *Feature Summary'* setting. By
default, on the organism page, Tripal will provide a list of all
features associated with an organism and provide a pie-chart showing
this list. You can turn this off by setting the appropriate radio
button.

Below is a screen shot of the **Date Type Summary** available for the
data we loaded. This is accessed by clicking on the link on the right
side bar of the *Drosophila melanogaster* organism page.

<a href="File:Tripal-feature_type_summary.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/05/Tripal-feature_type_summary.png/800px-Tripal-feature_type_summary.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/05/Tripal-feature_type_summary.png/1200px-Tripal-feature_type_summary.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/05/Tripal-feature_type_summary.png 2x"
width="800" height="599" alt="Tripal-feature type summary.png" /></a>

**Note** The data type summary is only available when the
**organism_feature_count** materialized view is populated. Each time new
data is added, this materialized view should be updated to capture the
changes and have those shown in the summary.

### <span id="Loading_Functional_Data_Using_Extension_Modules" class="mw-headline">Loading Functional Data Using Extension Modules</span>

For this tutorial we will be loading functional data for our genes. To
do this we will use several extension modules. These modules were
previously installed with this Tutorial.

#### <span id="Loading_Blast_Results" class="mw-headline">Loading Blast Results</span>

Now that we have our features loaded we want to add some functional data
as well. A blastx analysis was performed for the gene sequences against
the ExPASy SwissProt database. You can find the results from that job
here:

  
<a
href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/56/Flybase-tripal-demo.genes.blastx.xml.txt"
class="internal"
title="Flybase-tripal-demo.genes.blastx.xml.txt">Media:Flybase-tripal-demo.genes.blastx.xml.txt</a>.

  
Download this file and save it in `/var/www/sites/default/files`

  
Before we load our blast data, we must first create an analysis,
navigate to the **Create Content** page and select the content type
**Blast Analysis**. Add the following values for this analysis

- Analysis Name: blastx Dmel genes vs ExPASy SwissProt
- Program: blastx
- Program Version: NCBI Blast 2.2.19
- Source name: FlyBase 2LHet genes FASTA file
- Source version: FB2011_02
- Time Executed: Mar 6 2011
- Description: blastx vs ExPASy SwissProt of four genes from the Dmel
  2LHet chromosomal region to provide evidence of function
  - Blast Settings
    - Database: DB:swisprot:display
    - Blast XML File/Directory:
      /var/www/sites/default/files/Flybase-tripal-demo.genes.blastx.xml.txt
    - Check the box 'Use Unique Name'
    - Parameters: -e 1e-6
    - Submit a job to parse the XML output: checked

  
Click the **Save** button. You can now see our new Analysis.

<a href="File:Tripal-blast1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/91/Tripal-blast1.png/800px-Tripal-blast1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/91/Tripal-blast1.png/1200px-Tripal-blast1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/91/Tripal-blast1.png 2x"
width="800" height="599" alt="Tripal-blast1.png" /></a>

  
The analysis also appears under the **Analysis** menu item at the top of
the page.

  
Now we need to manually run the job to parse the Blast results:

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

  
The results should now be loaded. if we visit our feature page, for
feature 'FBgn0063368'
(<a href="http://localhost/FBgn0063368" class="external free"
rel="nofollow">http://localhost/FBgn0063368</a>) we should now see blast
results by clicking the 'ExPASy SwissProt' link on the right sidebar:

<a href="File:Tripal-blast2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/26/Tripal-blast2.png/800px-Tripal-blast2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/26/Tripal-blast2.png/1200px-Tripal-blast2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/26/Tripal-blast2.png 2x"
width="800" height="599" alt="Tripal-blast2.png" /></a>

#### <span id="Loading_InterProScan_Results" class="mw-headline">Loading InterProScan Results</span>

Now we want to load results from an InterProScan. For this tutorial,
these results were obtained by using a local installation of
InterProScan installed on a computational cluster. However, you may
choose to use Blast2GO or the online InterProScan utility. Results
should be saved in XML format. You can download the example results
here:

<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3a/Flybase-tripal-demo.iprscan.xml.txt"
class="internal"
title="Flybase-tripal-demo.iprscan.xml.txt">Media:Flybase-tripal-demo.iprscan.xml.txt</a>

Download this file and save it in `/var/www/sites/default/files`

To create an analysis, navigate to the **Create Content** page and
select the content type **Analysis: Interpro**. Add the following values
for this analysis

- Analysis Name: InterProScan of Dmel genes
- Program: iprscan
- Program Version: InterProScan 4.7
- Source name: FlyBase 2LHet genes FASTA file
- Source version: FB2011_02
- Time Executed: Aug 18, 2011
- Description: InterProScan search of Dmel genes against all databases
- InterPro Settings
  - InterProScan XML File/Directory:
    /var/www/sites/default/files/Flybase-tripal-demo.iprscan.xml.txt
  - Check the box 'Submit a job to parse the Interpro XML output'
  - Chekc the box 'Load GO terms'
  - Parameters: -goterms -ipr -format xml
  - Check the box 'Use Unique Name'
  - Query type: gene

  
Click the **Save** button. You can now see our new Analysis.

<a href="File:Traipal-Interpro_analysis.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/01/Traipal-Interpro_analysis.png/800px-Traipal-Interpro_analysis.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/01/Traipal-Interpro_analysis.png/1200px-Traipal-Interpro_analysis.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/01/Traipal-Interpro_analysis.png 2x"
width="800" height="484" alt="Traipal-Interpro analysis.png" /></a>

  
Now we need to manually run the job to parse the Inetpro results:

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

  
The results should now be loaded. if we visit our feature page, for
feature 'FBgn0039958' we should now see interpro results by clicking on
the "Interpro Report" link on the right sidebar.

<a href="File:Triapl-Interpro.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/5a/Triapl-Interpro.png/800px-Triapl-Interpro.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/5a/Triapl-Interpro.png/1200px-Triapl-Interpro.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5a/Triapl-Interpro.png 2x"
width="800" height="484" alt="Triapl-Interpro.png" /></a>

#### <span id="Loading_KEGG_Analysis_Results" class="mw-headline">Loading KEGG Analysis Results</span>

Now we want to load results from a KEGG/KAAS analysis
(<a href="http://www.genome.ad.jp/tools/kaas/" class="external free"
rel="nofollow">http://www.genome.ad.jp/tools/kaas/</a>). The KAAS server
receives as input a FASTA file of genes and annotates those with KEGG
terms. The tool also generates an heirarchy (heir) outputfile. This
output file can be read directly by the Tripal Analysis KEGG module.
This analysis has been performed previously. You can download the
results here:

<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/19/Flybase-tripal-demo.kegg.heir.tar.gz"
class="internal"
title="Flybase-tripal-demo.kegg.heir.tar.gz">Media:Flybase-tripal-demo.kegg.heir.tar.gz</a>

Download this file and save it in `/var/www/sites/default/files `

To create an analysis, navigate to the **Create Content** page and
select the content type **Analysis: KEGG**. Add the following values for
this analysis

- Analysis Name: KEGG analysis of Dmel genes
- Program: KEGG Automatic Annotation Server (KAAS)
- Program Version: 1.63a
- Source name: FlyBase 2LHet genes FASTA file
- Source version: FB2011_02
- Time Executed: Aug 18, 2011
- Description: Drosophila melanogaster gene sequences were uploaded to
  the KEGG / KASS server at \<a
  href="<a href="http://www.genome.ad.jp/tools/kaas/" class="external free"
  rel="nofollow">http://www.genome.ad.jp/tools/kaas/</a>"\><a href="http://www.genome.ad.jp/tools/kaas/" class="external free"
  rel="nofollow">http://www.genome.ad.jp/tools/kaas/</a>\</a\>.   The
  SBH method was selected.  Results were downloaded in the heir.tar.gz
  heirarchy file and uploaded to the website.

\<meta content="text/html; charset=utf-8" http-equiv="content-type" /\>

- KEGG Settings
  - KAAS hier.tar.gz Output File:
    /var/www/sites/default/files/Flybase-tripal-demo.kegg.heir.tar.gz
  - Check the box "use unique name"
  - Check the box "Submit a job to parse the kegg output into Chado"

  
Click the **Save** button. You can now see our new Analysis.

<a href="File:Tripal-kegg1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/49/Tripal-kegg1.png/800px-Tripal-kegg1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/49/Tripal-kegg1.png/1200px-Tripal-kegg1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/49/Tripal-kegg1.png 2x"
width="800" height="484" alt="Tripal-kegg1.png" /></a>

Now we need to manually run the job to parse the Blast results:

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

To make the KEGG reports appear on the Organism page, we must populate
the **kegg_by_organism** materialized view. To do this, navigate to
**Administer** → **Tripal Management** → **Materialized Views**. Find
the **kegg_by_organism** view and click the **update** link. Manually
run the job to populate the view:

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

You should now return to the organism page and see the KEGG report.

### <span id="Creating_Stocks" class="mw-headline">Creating Stocks</span>

### <span id="Using_the_GBrowse_Extension_Module" class="mw-headline">Using the GBrowse Extension Module</span>

### <span id="Drupal_Taxonomy_.26_Searching" class="mw-headline">Drupal Taxonomy & Searching</span>

#### <span id="Drupal_Taxonomy" class="mw-headline">Drupal Taxonomy</span>

Drupal provides a tagging mechanism that allows the site creator to tag
pages with certain words that categorize the page. Drupal calls this
categorizing mechanism **Taxonomy**. This allows users to search for and
find pages with certain tag words on them.

  
Similar to the controlled vocabularies we loaded earlier, Drupal
maintains it's own vocabularies for these categories. You can find this
interface by navigating to **Administer** → **Content Management** →
**Taxonomy**.

<a href="File:800px-DrupalTaxonomy.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/34/800px-DrupalTaxonomy.png" width="800"
height="507" alt="800px-DrupalTaxonomy.png" /></a>

  
Here you will see some existing vocabularies for **Feature Type**,
**Organism**, **Library** and **Analysis**. If you click the link 'list
terms' you will see that we have no terms in any of the vocabularies.

  
We would like to tag all of our gene pages to enable searching by
category for our feature pages using Drupal's built-in searching
mechanism. To do this, navigate to **Administer** → **Tripal
Management** → **Features** → **Configuration**. Look for the section
titled **Set Taxonomy**. Check the boxes next to **Organism name** and
**Feature type** and then click the **Set/Reset Taxonomy for all
features** button.

  
This will add a job to our jobs subsystem which we want to run manually:

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

  
Now, all of our synced features are annotated with Drupal taxonomy
(cateory) terms. These can now be used for filtering the search as
described in the next section.

#### <span id="Drupal_Searching" class="mw-headline">Drupal Searching</span>

Now that we have added taxonomy terms to our feature pages we want to
enable searching using Drupal's full text searching mechanism. The first
step is to index our feature pages for searching. Drupal will do this
automatically each time the Drupal cron is run (which was setup when we
installed Drupal). This is one of the housekeeping tasks that Drupal
performs. However, when syncing large data sets we can generate
thousands of pages at a time. The Drupal cron will only index 500 pages
at a time. If we rely on Drupal cron it will take an extreme amount of
time to index all of our new pages.

Therefore, we can submit an indexing job using Tripal which will index
all of our features pages in one step. This can take quite a bit of time
for very large datasets, but once it completes it does not need to be
repeated very often. For small dataset, indexing should complete
quickly.

To submit an job for indexing, Navigate to the **Administer** → **Tripal
Management** → **Features** → **Feature Configuration** page and look
for the section titled **Index/Reindex** and click the **Reindex All
Feature nodes** button.

  
<a href="File:Tripal-reindex.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/14/Tripal-reindex.png/800px-Tripal-reindex.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/14/Tripal-reindex.png/1200px-Tripal-reindex.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/14/Tripal-reindex.png 2x"
width="800" height="213" alt="Tripal-reindex.png" /></a>

  
Then manually run the job:

``` enter
  cd /var/www; php ./sites/all/modules/tripal-6.x-0.3.1b/tripal_core/tripal_launch_jobs.php administrator
```

  
Drupal searching will not work unless all of the pages are indexed. To
see if the site is fully index, navigate to **Administer** -\> **Site
Configuration** -\> **Search Settings**

<a href="File:800px-DrupalSearchSettings.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/0f/800px-DrupalSearchSettings.png"
width="800" height="515" alt="800px-DrupalSearchSettings.png" /></a>

  
If the indexing status says 100% then all is well and searching will
work. If it is less than 100% then most likely there are other
pages,such as our About page which have not yet been indexed. To quickly
index these we can manually run the Drupal cron. The Drupal cron can
easily be run by going to this URL:

<a href="http://localhost/cron.php" class="external free"
rel="nofollow">http://localhost/cron.php</a>

  
When the cron completes there will be no output to the browser, but the
page load will stop, indicating the cron is complete. Now, return to the
**Administer** → **Site Configuration** → **Search Settings** to see if
the search status is 100%. If not, keep updating the Drupal cron until
it reaches 100%.

  
Next, we need to expose the search box. Drupal provides a "Search" block
which is not enabled by default. This can be turned on by navigating to
**Administer** → **Site building** → **Blocks**. Enable the block by
searching for **Search form** and setting it to appear on the **Left
sidebar**. Save the changes.

  
The site should now appear with a search box on the left:

<a href="File:Tripal-search1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/0a/Tripal-search1.png/800px-Tripal-search1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/0a/Tripal-search1.png/1200px-Tripal-search1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/0a/Tripal-search1.png 2x"
width="800" height="497" alt="Tripal-search1.png" /></a>

  
We can now perform searches. For example, to find the gene with the
GenBank accession 'AA439562', enter the accession in the search box and
click Search.

  
Click the **Advanced search** link to open additional searching options
that can be used to refine a search. Notice that the taxonomy terms for
our synced organism and features appears in the list. You can therefore
limit your search results to specific organisms or feature types.

<a href="File:800px-DrupalAdvancedSearch.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f1/800px-DrupalAdvancedSearch.png"
width="800" height="515" alt="800px-DrupalAdvancedSearch.png" /></a>

## <span id="Customizations" class="mw-headline">Customizations</span>

### <span id="Panels_.26_Custom_Layouts" class="mw-headline">Panels & Custom Layouts</span>

Suppose we do not like the way the feature page looks. Right now, all
content is presented in the default Tripal style with a content box and
right sidebar box. We can use the **Panels** module to change this.
Earlier, we installed the 'Panels' module. To begin using Panels,
navigate to **Administer** → **Site Building** → **Panels**.

<a href="File:800px-DrupalPanels.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e9/800px-DrupalPanels.png" width="800"
height="500" alt="800px-DrupalPanels.png" /></a>

  
The Panels configuration page has many options. For brevity we will not
discuss them all. But in short, we want to alter the layout of our
feature pages. We can do this by first enabling the **Node template**.
We can do this by clicking the **Enable** link next to **Node template**
under the '**Manage Pages** at the bottom right of the screen. This will
take you to the **Pages** configuration page where you'll see that the
**Node template** is now Enabled.

<a href="File:800px-DrupalPages.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/71/800px-DrupalPages.png" width="800"
height="500" alt="800px-DrupalPages.png" /></a>

  
Next, return to the Panels configuration page at **Administer** → **Site
Building** → **Panels**. We now want to create the page layout. We begin
this step by clicking **Node Template** under the **Page wizards**
section.

  
Here, you should select the node type to be 'Feature' because this is
the content type for which we want a custom layout. Next, select the
category. This is where you choose the layout type. Choose the category
**Columns: 2** and then select the second layout named **Two column
bricks**. Click the continue button.

<a href="File:800px-DrupalNodeWizard.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f8/800px-DrupalNodeWizard.png" width="800"
height="366" alt="800px-DrupalNodeWizard.png" /></a>

  
The following configuration page will appear. Simply click the
**Finish** button.

<a href="File:800px-DrupalPanelsConfig1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/ce/800px-DrupalPanelsConfig1.png" width="800"
height="495" alt="800px-DrupalPanelsConfig1.png" /></a>

  
Finally, we are taken to the Panel configuration page where we can set
all of the parameters. Notice that we are currently set on the
**Layout** section of the configuration.

<a href="File:800px-DrupalPanelsConfig3.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2a/800px-DrupalPanelsConfig3.png" width="800"
height="495" alt="800px-DrupalPanelsConfig3.png" /></a>

  
Using the layout interface, the following will be demonstrated (but not
shown here in this tutorial). But first, open to the feature page
'CG40042' so we can watch the changes as we proceed:

- How to remove default content from the panel regions
- How to add content to each panel region
- Adding of blocks in this order:
  - Feature Details in the **Left Above** section
  - Feature Synonyms in the **Left Above** section, just below the
    feature details.
  - Feature References in the **Right Above** section
  - Feature Relationships as Object in the **Middle** section
  - Add any other blocks desired to the **Middle** or lower sections

When finished our page now looks like this:

<a href="File:800px-DrupalCustomPage.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/75/800px-DrupalCustomPage.png" width="800"
height="495" alt="800px-DrupalCustomPage.png" /></a>

#### <span id="Adding_a_GBrowse_Image" class="mw-headline">Adding a GBrowse Image</span>

We would now like to add a GBrowse image onto our gene page. Tripal does
not support this directly, but can facilitate this. The easiest way to
add this content is to create a new **Block**. But, we'll have to code a
bit of PHP to do it. So, we need to first turn on the **PHP filter**
module. Navigate to the **Administer** → **Site building** → **Mouldes**
to enable this module.

  
Next, we want to create our block. To do this, navigate to **Administer'
*→*** *Site Building **→** Blocks**, then click on the tab,** Add
Block*.

  
<a href="File:Tripal-GBrowse_block.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/9a/Tripal-GBrowse_block.png/800px-Tripal-GBrowse_block.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/9a/Tripal-GBrowse_block.png/1200px-Tripal-GBrowse_block.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/9a/Tripal-GBrowse_block.png 2x"
width="800" height="497" alt="Tripal-GBrowse block.png" /></a>

  
Enter the values, as shown in the image above:

- Block Description: Feature GBrowse View
- Block Title: GBrowse View
- Block Body: enter the PHP code below

``` enter
<?php
$nid = arg(1);
$node = node_load($nid);
$feature = $node->feature;

if($feature->type_id->name == 'gene' or $feature->type_id->name == 'mRNA'){
   print "<img src=\"http://flybase.org/cgi-bin/gbrowse_img/dmel/?name=$feature->uniquename\">";
}
?>
```

The PHP code above uses the Tripal API to access feature information.
See the Tripal website for more information about using the Tripal API.

  
**Note** The URL used for the link in the `img` tag may not work. In
that case, we can change the print statement to use the Metazome GBrowse
(Ideally we would want to use GBrowse installed on our own system):

       print "<img src=\"http://www.metazome.net/cgi-bin/gbrowse_img/Dmelanogaster/?name=$feature->name\">";

We'll try the flybase link first. If it doesn't work we can return here
to switch it out for the Metazome URL.

  

Then, under the **Input Format** section, select the radio button **PHP
code**. Now click **Save Block**

Return to the Panels configuration page for the node template and add
this new block to our feature page in the Middle section and place it as
the first item in the Middle section.

<a href="File:800px-TripalGBrowseImg.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e8/800px-TripalGBrowseImg.png" width="800"
height="495" alt="800px-TripalGBrowseImg.png" /></a>

If you are using the default Tripal view

### <span id="Drupal_Views" class="mw-headline">Drupal Views</span>

#### <span id="Changing_Tripal_Default_Views" class="mw-headline">Changing Tripal Default Views</span>

### <span id="Editing_Template_Files" class="mw-headline">Editing Template Files</span>

#### <span id="Adding_a_GBrowse_Image_2" class="mw-headline">Adding a GBrowse Image</span>




[Categories](Special%3ACategories "Special%3ACategories"):

- [Tripal](Category%3ATripal "Category%3ATripal")
- [Tutorials](Category%3ATutorials "Category%3ATutorials")






## Navigation menu



### Namespaces


- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:Tripal_Tutorial_(v0.3.1b)&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>


### 

### Variants[](#)








<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>


### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>




### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%3AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%3AHOWTO)</span>
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

- <span id="t-smwbrowselink"><a href="Special%3ABrowse/Tripal_Tutorial_(v0.3.1b)"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:27 on 5 September
  2012.</span>
<!-- - <span id="footer-info-viewcount">365,452 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD%3AAbout "GMOD%3AAbout")</span>

<!-- -->





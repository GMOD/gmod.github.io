---
title: "GMOD Malaysia 2014/Tripal Tutorial"
---
# GMOD Malaysia 2014/Tripal Tutorial

This [Tripal](../Tripal.1 "Tripal") tutorial was presented by [Scott
Cain](../User%253AScott "User%253AScott") at [GMOD Malaysia
2014](../GMOD_Malaysia_2014.1 "GMOD Malaysia 2014"), February 2014. This
tutorial requires Tripal version 1.1.

The most recent Tripal tutorial can be found at the
<a href="../Tripal_Tutorial" class="mw-redirect"
title="Tripal Tutorial">Tripal Tutorial</a> page.

This tutorial uses the AWS AMI ' **_named '_** in the '

.

Welcome to the [Tripal](../Tripal.1 "Tripal") v1.1 Tutorial. Here you
will find instructions for installation, usage and administration of a
Tripal-based genome website. This tutorial guides the user through the
process of installation, setup and data loading of genomic feature data
and annotations.

**Note**: Tripal is provided free of charge, as-is with no warranty or
guarantee of fitness. The developers are committed to creating a
platform usable by all and as bug free as possible. However, bugs may be
present, especially with the newest features. If you find problems or
bugs, please feel free to report them either via the
<a href="https://lists.sourceforge.net/lists/listinfo/gmod-tripal"
class="external text" rel="nofollow">Tripal mailing List</a> or adding a
bug report on the <a href="https://drupal.org/project/issues/1337878"
class="external text" rel="nofollow">Tripal issues tracker</a>.

  Tripal</span>](#What_is_Tripal)
- [Content
  Management System](#Content_Management_System)
- [Drupal](#Drupal)
- [Chado](#Chado)
- [Goals of
  Tripal](#Goals_of_Tripal)
- [Structure of
  Tripal](#Structure_of_Tripal)
- [Sites Running
  Tripal](#Sites_Running_Tripal)
- [Resources](#Resources)
- [Contributing
  Organizations](#Contributing_Organizations)
- [Funding](#Funding)
- [Publications](#Publications)
- [Pre-planning](#Pre-planning)
  - [IT
    Infrastructure](#IT_Infrastructure)
  - [Technical
    Skills](#Technical_Skills)
  - [Why Use
    Tripal](#Why_Use_Tripal)
  - [Development and Production
    Instances](#Development_and_Production_Instances)
- [Server
  Installation](#Server_Installation)
  - [Apache
    Setup](#Apache_Setup)
  - [Setup
    PHP](#Setup_PHP)
  - [Install
    phpPgAdmin](#Install_phpPgAdmin)
- [Database
  Setup](#Database_Setup)
- [Install
  Drupal](#Install_Drupal)
  - [Software
    Installation](#Software_Installation)
  - [Configuration
    File](#Configuration_File)
  - [Final
    directory creation](#Final_directory_creation)
  - [Compatibility with other
    tools](#Compatibility_with_other_tools)
  - [Web-based
    Steps](#Web-based_Steps)
  - [Drupal
    Cron Entry](#Drupal_Cron_Entry)
- [Drush](#Drush)
- [Explore
  Drupal](#Explore_Drupal)
  - [User
    Account Page](#User_Account_Page)
  - [Creating
    Content](#Creating_Content)
  - [Site
    Administration](#Site_Administration)
    - [Content
      Management](#Content_Management)
    - [Site
      Building](#Site_Building)
      - [Modules](#Modules)
      - [Themes](#Themes)
      - [Blocks](#Blocks)
      - [Menus](#Menus)
      - [URL Path](#URL_Path)
      - [Site
        Configuration](#Site_Configuration)
  - [User
    Accounts](#User_Accounts)
- [Prepare
  Drupal for Tripal](#Prepare_Drupal_for_Tripal)
  - [Theme
    Installation](#Theme_Installation)
  - [Theme
    Configuration](#Theme_Configuration)
  - [3rd Party
    Modules](#3rd_Party_Modules)
    - [Configure
      CKEditor](#Configure_CKEditor)
- [Tripal
  Installation](#Tripal_Installation)
  - [Get the
    Software](#Get_the_Software)
  - [Installation](#Installation)
  - [Controlled Vocabularies: Installing
    CVs](#Controlled_Vocabularies:_Installing_CVs)
  - [Setting
    Perimssions](#Setting_Perimssions)
- [Using
  Tripal](#Using_Tripal)
  - [Creating
    Organism Pages](#Creating_Organism_Pages)
    - [What
      if Our Organism is Already in
      Chado?](#What_if_Our_Organism_is_Already_in_Chado.3F)
    - [What
      if My Organism Is Not Present in
      Chado?](#What_if_My_Organism_Is_Not_Present_in_Chado.3F)
  - [Creating
    an Analysis](#Creating_an_Analysis)
  - [Creating
    a Database Cross
    Reference](#Creating_a_Database_Cross_Reference)
  - [Loading
    Feature Data](#Loading_Feature_Data)
    - [Loading a GFF3
      File](#Loading_a_GFF3_File)
    - [Loading FASTA
      files](#Loading_FASTA_files)
  - [Creating
    Feature Pages](#Creating_Feature_Pages)
  - [Materialized
    Views](#Materialized_Views)
  - [Feature
    Page Configuration](#Feature_Page_Configuration)
    - [Feature URLs](#Feature_URLs)
    - [Feature Browser](#Feature_Browser)
    - [Feature Summary
      Report](#Feature_Summary_Report)
  - [Loading
    Functional Data Using Extension
    Modules](#Loading_Functional_Data_Using_Extension_Modules)
    - [Loading Blast
      Results](#Loading_Blast_Results)
      - [Configuring Blast
        Databases](#Configuring_Blast_Databases)
      - [Load the Blast
        Results](#Load_the_Blast_Results)
    - [Loading InterProScan
      Results](#Loading_InterProScan_Results)
    - [Viewing GO Terms](#Viewing_GO_Terms)
    - [Loading KEGG Analysis
      Results](#Loading_KEGG_Analysis_Results)
  - [Adding
    New Resources To Pages](#Adding_New_Resources_To_Pages)
  - [Linking
    to Resource Blocks](#Linking_to_Resource_Blocks)
  - [Adding
    Publications](#Adding_Publications)
    - [Manually Adding a
      Publication](#Manually_Adding_a_Publication)
    - [Searching for
      Publications](#Searching_for_Publications)
    - [Bulk
      Import of Publications](#Bulk_Import_of_Publications)
  - [Drupal
    Views Integration](#Drupal_Views_Integration)
    - [Editing Existing
      Views](#Editing_Existing_Views)
    - [Adding a New
      View](#Adding_a_New_View)
    - [Limitations of
      views](#Limitations_of_views)
  - [Customizing The Look-and-Feel of
    Tripal](#Customizing_The_Look-and-Feel_of_Tripal)
  - [Advanced
    Features](#Advanced_Features)
    - [The
      Tripal Bulk Loader](#The_Tripal_Bulk_Loader)
    - [Creating Custom
      Modules](#Creating_Custom_Modules)

### What is Tripal

Tripal is a suite of PHP5 modules that bridges the Drupal Content
Management System (CMS) and GMOD Chado. The goal is to simplify
construction of a community genomics website to enable individual labs
or research communities to construct a high-quality, standards-based
website for data sharing and collaboration.

<a href="../File:600px-WhatisTripal.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/ea/600px-WhatisTripal.png/300px-600px-WhatisTripal.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/ea/600px-WhatisTripal.png/450px-600px-WhatisTripal.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ea/600px-WhatisTripal.png 2x"
width="300" height="204" alt="600px-WhatisTripal.png" /></a>

### Content Management System

_Definition From Wikipedia:_

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

### Drupal

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
rel="nofollow">http://www.drupal.org</a> Drupal modules:
<a href="http://www.drupal.org/project/modules" class="external free"
rel="nofollow">http://www.drupal.org/project/modules</a> Drupal themes:
<a href="http://www.drupal.org/project/themes" class="external free"
rel="nofollow">http://www.drupal.org/project/themes</a>

Tripal v1.0 is compatible with Drupal v6. This is the final Drupal 6
compatible version. Later releases will be compatible with Drupal v7.

### Chado

You can find more detailed information about Chado here:
[Chado - Getting Start](/wiki/Chado_-_Getting_Started).
However, one thing to remember in regards to Tripal organization is that
Chado has a modular structure:

- Audit - for database audits
- Companalysis - for data from computational analysis
- Contact - for people, groups, and organizations
- Controlled Vocabulary (cv) - for controlled vocabularies and
  ontologies
- Expression - for summaries of RNA and protein expression
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

### Goals of Tripal

- Simplify Construction of Biological Databases
  - Reduce time of development
  - Reduce costs
  - Reduce technical resources (i.e. programmers, systems admins).
  - A non-technical site administrator can add content without knowing
    PHP, HTML, JavaScript.
- Greater Flexibility of the Biological Website
  - Social Networking
  - Non-biological content
  - Outreach, tutorials, documentation, protocols, publications
- Expandability
  - Site can be programmatically expanded in any way
  - Changes to base-code are not needed but modules are added.
  - Availability of an Application Programmer Interface (API)
- Reusability
  - All code can be shared. Expansion modules created by one group can
    be shared with all.

### Structure of Tripal

Tripal is a collection of modules that integrate with Drupal. These
modules are divided into hierarchical categories:

<a href="../File:TripalLayers.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/05/TripalLayers.png/300px-TripalLayers.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/05/TripalLayers.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/05/TripalLayers.png 2x"
width="300" height="314" alt="TripalLayers.png" /></a>

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

### Sites Running Tripal

| Site Name                                             | URL                                                                | ----------------------------------------------------- | ------------------------------------------------------------------ | Banana Genome Hub                                     | <a href="http://banana-genome.cirad.fr/" class="external free"     | rel="nofollow">http://banana-genome.cirad.fr/</a>     | Pulse Crops Genomics & Breeding                       | <a href="http://knowpulse2.usask.ca/portal/" class="external free" | rel="nofollow">http://knowpulse2.usask.ca/portal/</a> | Genome Database for Vaccinium                         | <a href="http://www.vaccinium.org" class="external free"           | rel="nofollow">http://www.vaccinium.org</a>           | Genome Database for Rosacaee                          | <a href="http://www.rosaceae.org" class="external free"            | rel="nofollow">http://www.rosaceae.org</a>            | Cool Season Food Legume Database                      | <a href="http://www.gabcsfl.org" class="external free"             | rel="nofollow">http://www.gabcsfl.org</a>             | Cacao Genome Database                                 | <a href="http://www.cacaogenomedb.org" class="external free"       | rel="nofollow">http://www.cacaogenomedb.org</a>       | Fagaceae Genome Web                                   | <a href="http://www.fagaceae.org" class="external free"            | rel="nofollow">http://www.fagaceae.org</a>            | Citrus Genome Database                                | <a href="http://www.citrusgenomedb.org" class="external free"      | rel="nofollow">http://www.citrusgenomedb.org</a>      | Marine Genomics Project                               | <a href="http://www.marinegenomics.org" class="external free"      | rel="nofollow">http://www.marinegenomics.org</a>      |

### Resources

The Tripal home site where you can find everything about Tripal:
<a href="http://tripal.info" class="external free"
rel="nofollow">http://tripal.info</a>

GMOD Tripal mailing lists:
<a href="../GMOD_Mailing_Lists" class="external free"
rel="nofollow">http://gmod.org/wiki/GMOD_Mailing_Lists</a>

GMOD Tutorials from previous GMOD schools:
<a href="../Tripal.1" class="external free"
rel="nofollow">http://gmod.org/wiki/Tripal</a>

### Contributing Organizations

Individuals from these organizations have provided design and coding for
Tripal v1.1

<a href="../File:150px-USLogo.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/58/150px-USLogo.png" width="150"
height="35" alt="150px-USLogo.png" /></a>
<a href="../File:150px-WSULogo.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/ab/150px-WSULogo.png" width="150"
height="44" alt="150px-WSULogo.png" /></a>

Acknowledgments are extended to the Clemson University Genomics
Institute where Tripal was first conceived and where development of
earlier releases was performed.

<a href="../File:150px-CUGILogo.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/5c/150px-CUGILogo.png/75px-150px-CUGILogo.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/5c/150px-CUGILogo.png/113px-150px-CUGILogo.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5c/150px-CUGILogo.png 2x"
width="75" height="43" alt="150px-CUGILogo.png" /></a>

Also, special thanks are extended to the GMOD project for logistical
support and community interaction!!

### Funding

Funding for Tripal v1.0 has been provided through various grants from
various sources.

### Publications

1.  Lacey-Anne Sanderson, Stephen. P. Ficklin, Chun-Huai Cheng, Sook
    Jung, Frank A. Feltus, Kirstin E. Bett, Dorrie Main. Tripal v1.1: a
    Standards-based Platform for Construction of Online Genetic and
    Genomic Databases". Submitted for review June 2013.
2.  Stephen P. Ficklin, Lacey-Anne Sanderson, Chun-Huai Cheng, Margaret
    Staton, Taein Lee, Il-Hyung Cho, Sook Jung, Kirstin E Bett, Dorrie
    Main.
    <a href="http://database.oxfordjournals.org/content/2011/bar044.full%7C"
    class="external text" rel="nofollow">Tripal: a construction Toolkit for
    Online Genome Databases</a>. _Database_, Sept 2011. Vol 2011.

## Pre-planning

### IT Infrastructure

Tripal requires a server with adequate resources to handle the expected
load and systems administration skills to get the machine up and
running, applications installed and everything properly secure. Tripal
requires a PostgreSQL databases server, Apache (or equivalent) web
server, PHP5 and several configuration options to make it all work.
However, once these prerequisites are met, working with Drupal and
Tripal are quite easy.

There are four ways you could get a Tripal/Drupal/Chado database web
server available for your site

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
    <a href="http://www.bluehost.com/" class="external text"
    rel="nofollow">Bluehost.com</a> is a web hosting service that
    provides hosting compatible with Drupal, Tripal and its
    dependencies.
4.  **Option \#4 In the Cloud:** Tripal is a part of the
    <a href="../Cloud.1" class="external text" rel="nofollow">GMOD in the
    cloud</a> Amazon AWS image created by GMOD. It is also accompanied
    by other GMOD tools such as GBrowse2, JBrowse, Apollo and WebApollo.

After selection of one of the options above you can arrange your
database/webserver in the following ways:

1.  **Arrangement \#1:** The database and web server are housed on a
    single server. _This is the approach taken by this course_. It is
    necessary to gain access to a machine with enough memory (RAM), hard
    disk speed and space, and processor power to handle both services.
2.  **Arrangement \#2:** The database and web server are housed on
    different servers. This provides dedicated resources to each service
    (i.e. web and database).

**Selection of an appropriate machine**

Databases are typically bottle-necked by RAM and disk speed. Selection
of the correct balance of RAM, disk speed, disk size and CPU speed is
important and dependent on the size of the data. The best advice is to
consult an IT professional who can recommend a server installation
tailored for the expected size of your data.

**Note**: Tripal does require command-line access to the web server with
adequate local file storage for loading of large data files. Be sure to
check with your service provider to make sure command-line access is
possible.

### Technical Skills

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

### Why Use Tripal

Tripal v1.1 provides default views for most Chado data types. It also
support **all** of Chado in terms of data access. **_So why use
Tripal?_**

1.  You want to use a community-supported common database infrastrcure
    (i.e. Chado).
2.  You need a web interface but do not want to build one from scratch.
3.  You need content-management capabilities (distributed content
    editing, user management, social networking... i.e. Drupal)
4.  You want to contribute to a community effort to help build a tool
    others can use.
5.  You want to participate in a community with other database
    developers using the same technology and confronting similar
    problems.
6.  You want to use open-source and free technology!

### Development and Production Instances

It is recommended that you have separate development and production
instances of Tripal. The staging or development instance allows you to
test new functionality, add customizations, or test modification or
additions to data without disturbing the production instance. The
production instance serves content to the rest of the world. Once you
are certain that customizations and new functionality will work well on
the development instance you can easily re-implement or copy these over
to the production site. Sometimes it may take a few trials to load data
in the way you want. A development sites lets you take time to test data
loading prior to making it public. The development site can be
password-protected to allow only access only to site administrators,
developers or collaborators.

## Server Installation

The following instructions are for setup of Tripal on an
<a href="http://www.ubuntu.com/" class="external text"
rel="nofollow">Ubuntu version 12.04 server edition</a>. When possible,
alternative command-line statements have been added to this tutorial as
users of other Linux version have provided feedback. Unless specifically
identified, all commands are for Ubuntu 12.04 linux.

During installation of the Ubuntu 12.04 server please select the
following software packages for installation:

- OpenSSH server
- LAMP (includes Apache and PHP)
- PostgreSQL database version 8.4 or higher

After installation the Ubuntu Unity Desktop can be installed. For the
virtual machine image that accompanies this tutorial, the following
command was issued to install the desktop:

```enter
sudo apt-get install ubuntu-desktop
```

Reboot your server after installation of the Ubuntu Desktop.

### Apache Setup

Apache is the web server software. Apache should be installed. On the
Ubuntu server, navigate to your new website using this address:
<a href="http://localhost/" class="external free"
rel="nofollow">http://localhost/</a>. You should see the text "It
works!".

<a href="../File:ItWorks.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d0/ItWorks.png/800px-ItWorks.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d0/ItWorks.png/1200px-ItWorks.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d0/ItWorks.png 2x"
width="800" height="669" alt="ItWorks.png" /></a>

Enable the rewrite module for apache. This is useful so that we can use
Clean URLs with Drupal. Clean URLs are not required but make the page
URLs easier to use. We'll discuss clean URLs later.

```enter
   cd /etc/apache2/mods-enabled
   sudo ln -s ../mods-available/rewrite.load
```

Next we need to edit the apache configuration file to give Drupal full
controls of options within the directory root. Edit the
/etc/apache2/sites-available/000-default file:

```enter
   cd /etc/apache2/sites-available/
   sudo gedit default
```

And change the **AllowOverride** option from **None** to **All**:

```enter
   <Directory /var/www/>
      Options Indexes FollowSymLinks MultiViews
      AllowOverride All
      Order allow,deny
      allow from all
   </Directory>
```

Now restart your apache again.

```enter
sudo /etc/init.d/apache2 restart
```

### Setup PHP

PHP comes loaded onto the server, but we need a few other packages:

<a href="../File:Ubuntu.jpg" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e2/Ubuntu.jpg/50px-Ubuntu.jpg"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e2/Ubuntu.jpg/75px-Ubuntu.jpg 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e2/Ubuntu.jpg/100px-Ubuntu.jpg 2x"
width="50" height="58" alt="Ubuntu.jpg" /></a> First install php5 using
Ubuntu's apt-get utility:

```enter
   sudo apt-get install php5-pgsql
   sudo apt-get install php5-gd
```

For newer versions of Ubuntu (e.g. 13.10) you will also want to install
the php5-json package:

```enter
   sudo apt-get install php5-json
```

<a href="../File:Suse.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f0/Suse.png/50px-Suse.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f0/Suse.png/75px-Suse.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f0/Suse.png/100px-Suse.png 2x"
width="50" height="45" alt="Suse.png" /></a> For Suse Linux you may need
to install the **php-posix** package:

```enter
   yum install php-posix
```

<a href="../File:Red_hat_logo_big.jpg" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/ca/Red_hat_logo_big.jpg/50px-Red_hat_logo_big.jpg"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/ca/Red_hat_logo_big.jpg/75px-Red_hat_logo_big.jpg 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/ca/Red_hat_logo_big.jpg/100px-Red_hat_logo_big.jpg 2x"
width="50" height="55" alt="Red hat logo big.jpg" /></a> For RedHat
Linux you may also need to install the **php-process** package:

```enter
   yum install php-process
```

Change some php settings (as root):

```enter
   cd /etc/php5/apache2
   sudo gedit php.ini
```

Set the `memory_limit` to something larger than `128M` (should not
exceed physical memory, be conservative but not too much so):

      memory_limit = 2048M;

Now, restart the webserver:

      sudo /etc/init.d/apache2 restart

### Install phpPgAdmin

phpPgAdmin is a nice web-based utility for easy administration of a PostgreSQL
database. **Note**: PhpPgAdmin is not required for successful operation
of Tripal but is very useful.

```enter
   sudo apt-get install phppgadmin
```

Next, we need to make changes to the configuration settings so that we
can remotely access phppgadmin. To do this, edit the phppgadmin config
file for apache:

```enter
   cd /etc/apache2/conf.d
   sudo gedit phppgadmin
```

Now, comment out the line that allows access to the local server only,
and uncomment the line that allows access to anyone.

```enter
#allow from 127.0.0.0/255.0.0.0 ::1/128
allow from all
```

We also want to password protect PhpPgAdmin using Apache's access
control mechanisms. we need to instruct Apache to use password
protection for PhpPgAdmin. To do this add the following lines within the
Directory stanza just below the line we just uncommented:

```enter
AuthType Basic
AuthName "Password Required"
AuthUserFile /usr/share/phppgadmin/.htpasswd
Require User tripaladmin
```

The lines above instruct apache to use basic authentication, that the
password file is located at /usr/share/phppgadmin/.htpasswd and the only
user allowed to login is 'tripaladmin'. Save the configuration file.
Next we need to create the password file:

```enter
   cd /usr/share/phppgadmin
   sudo htpasswd -c .htpasswd tripaladmin
```

The htpasswd command above will create the .htpasswd file and add the
new user 'tripaladmin'. You will need to set a password when requested.
Finally, restart the webserver:

```enter
sudo /etc/init.d/apache2 restart
```

Now navigate to the URL
\[<a href="http://localhost/phppgadmin" class="external free"
rel="nofollow">http://localhost/phppgadmin</a>\] and you should see the
following:

<a href="../File:Phppgadmin.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/8f/Phppgadmin.png/800px-Phppgadmin.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/8f/Phppgadmin.png/1200px-Phppgadmin.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8f/Phppgadmin.png 2x"
width="800" height="669" alt="Phppgadmin.png" /></a>

The username 'tripaladmin' and the password you specified should be
required when accessing the PhpPgAdmin page.

## Database Setup

Drupal can run on a MySQL or PostgreSQL database but Chado prefers
PostgreSQL so that is what we will use for both Drupal and Chado. We
need to create the Drupal database. The following command can be used to
create a new database user and database.

First, become the 'postgres' user:

```enter
sudo su - postgres
```

Next, create the new 'drupal' user account. This account will not be a
"superuser' nor allowed to create new roles, but should be allowed to
create a database.

```enter
createuser -P drupal
```

When requested, enter an appropriate password:

      Enter password for new role: *********
      Enter it again:  *********
      Shall the new role be a superuser? (y/n) n
      Shall the new role be allowed to create databases? (y/n) y
      Shall the new role be allowed to create more new roles? (y/n) n

Finally, create the new database:

```enter
createdb drupal -O drupal
```

We no longer need to be the postgres user so exit

```enter
exit
```

## Install Drupal

### Software Installation

We want to install Drupal into our web document root (`/var/www`). We
want to be able to do this as our 'ubuntu' user. So, first, set the
directory permissions to allow this:

```enter
  cd /var
  sudo chown -R ubuntu www
  sudo chgrp -R ubuntu www
```

In the command above we set the owner and group of the directory to be
**ubuntu** (our user group).

Tripal currently requires version 6.x of Drupal. Drupal can be freely
downloaded from the
<a href="http://www.drupal.org" class="external free"
rel="nofollow">http://www.drupal.org</a> website. At the writing of this
Tutorial the most recent version of Drupal 6 is version 6.28. The
software can be downloaded manually from the Drupal website through a
web browser or we can use the 'wget' command to retrieve it:

```class
   cd /var/www
   wget http://ftp.drupal.org/files/projects/drupal-6.28.tar.gz
```

**Note:** The current version of Drupal is Drupal 7.x. The major release
v1.1 of Tripal is the final major release that will be compatible with
Drupal 6.x. Future major releases of Tripal will be compatible with
Drupal 7.x.

Next, we want to install Drupal. We will use the **tar** command to
uncompress the software:

```enter
  cd /var/www
  tar -zxvf drupal-6.28.tar.gz
```

Notice that we now have a `drupal-6.28` directory with all of the Drupal
files. We want the Drupal files to be in our document root, not in a
'drupal-6.28' subdirectory. So, we'll move the contents of the directory
up one level:

```enter
mv drupal-6.28/* ./
mv drupal-6.28/.htaccess ./
mv index.html index.html.orig
```

**Note:** It is extremely important the the hidden file `.htaccess` is
also moved (note the second 'mv' command above. Check to make sure this
file is there

```enter
   ls -l .htaccess
```

Notice that the last of the three `mv` commands renames the `index.html`
file and calls it `index.html.orig`. The `index.html` file was serving
as the home page for the website. Drupal uses an `index.php` page for
it's home page but the web server has preference for the `index.html`
page. So, we move it out of the way.

### Configuration File

Next, we need to tell Drupal how to connect to our database. To do this
we have to setup a configuration file. Drupal comes with an example
configuration file which we can borrow.

First navigate to the location where the configuration file should go:

```enter
  cd /var/www/sites/default/
```

Next, copy the example configuration that already exists in the
directory to be our actual configuration file by renaming it to
`settings.php`.

```enter
  cp default.settings.php settings.php
```

Now, we need to edit the configuration file to tell Drupal how to
connect to our database server. To do this we'll use an easy to use text
editor **gedit**

```enter
  gedit settings.php
```

Find the variable \$db_url and set it to this

```enter
  $db_url = 'pgsql://drupal:********@localhost/drupal';
```

Replace the text '\*\*\*\*\*\*\*\*' with your database password for the
user 'tripal' created previously.

### Final directory creation

Finally, we need to create three new directories. The first is the
`files` directory which Drupal uses for storing uploaded files.

```enter
  cd /var/www/sites/default
  mkdir files
  sudo chown ubuntu:www-data files
  sudo chmod g+rw files
```

The above command creates the directory but sets the group to be the web
server (i.e. www) with read/write permissions. This way the web server
can write to the directory but so can we.

Also, we need to create two new directories, one for storing module
files we'll be installing and another for themes which we'll also be
installing later:

Now create the modules and themes directory

```enter
  cd /var/www/sites/all
  mkdir modules
  mkdir themes
```

### Compatibility with other tools

We want to ensure that our Drupal installation doesn't interfere with
other web-based tools, such as GBrowse. We need update a setting in the
.htaccess file that came with Drupal which instructs the web server to
look for both `index.php` and `index.html` files when serving pages.

Use 'gedit' to modify the `/var/www.htaccess` file.

```enter
   cd /var/www
   gedit .htaccess
```

Locate the line `DirectoryIndex` and change it to mach the following:

```enter
  DirectoryIndex index.php index.html
```

### Web-based Steps

Navigate to the installation page of our new web site
<a href="http://localhost/install.php" class="external free"
rel="nofollow">http://localhost/install.php</a>

<a href="../File:800px-Install1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e6/800px-Install1.png" width="800"
height="475" alt="800px-Install1.png" /></a>

Click the link in the middle section that reads **Install Drupal in
English**

<a href="../File:800px-Tripal_Install2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/51/800px-Tripal_Install2.png" width="800"
height="475" alt="800px-Tripal Install2.png" /></a>

When the progress bar shows completing the page will switch to a
configuration page with some final settings.

<a href="../File:800px-Tripal-install3.png" class="image"><img
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

<a href="../File:800px-Tripal_Install4.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8c/800px-Tripal_Install4.png" width="800"
height="475" alt="800px-Tripal Install4.png" /></a>

### Drupal Cron Entry

The last step for installing Drupal is setting up the automate Cron
entry. The Drupal cron is used to automatically execute necessary
housekeeping tasks on a regular interval. Cron is a UNIX facility for
scheduling jobs to run at specific intervals.

Drupal itself requires an entry in the crontab to function. To edit the
cron launch the crontab editor:

```enter
  sudo crontab -e
```

[A word on text editors such as
nano](../Linux_Text_Editors "Linux Text Editors").

Add this line to the crontab

```enter
  0,30 * * * * /usr/bin/wget -O - -q http://localhost/cron.php > /dev/null
```

Now save the changes. We have now added a UNIX cron job that will occur
every 30 minutes that will execute the `cron.php` script and cause
Drupal to perform housekeeping tasks.

## Drush

Drush is a command-line utility that allows for non-graphical access to
the Drupal website. You can use it to automatically download and install
themes and modules, clear the Drupal cache, upgrade the site and more.
Tripal v1.0 supports Drush. For this tutorial we will use Drush and
therefore we want the most recent version installed. Drush can be found
on the Drupal website at
<a href="http://drupal.org/project/drush" class="external free"
rel="nofollow">http://drupal.org/project/drush</a>.

To install drush first retrieve the most recent version from it's Drupal
project page. The current version at the writing of this document is
version 7.x-5.9. While this version is intended for use with Drupal 7,
it is backwards compatible with Drupal 6 and provides the most
functionality.

We want Drush to reside in /usr/local which is where 3rd party software
is normally installed. We'll download the package to /usr/local/src and
uncompress into /usr/local:

```enter
  cd /usr/local/src
  sudo wget http://ftp.drupal.org/files/projects/drush-7.x-5.9.tar.gz
  cd /usr/local
  sudo tar -zxvf src/drush-7.x-5.9.tar.gz
```

Next, we want the operating system to know about drush. We'll create a
symbolic link to the Drush executable in the /usr/local/bin directory
where the operating systems looks for executables:

```enter
  sudo ln -s /usr/local/drush/drush /usr/local/bin/drush
```

Finally Drush needs to perform updates the first time it is run, so
we'll run it with elevated privileges (using sudo) so that it can
perform it's updates. In the future we no longer need 'sudo' to run
drush:

```enter
  sudo drush
```

You must always run drush commands within the Drupal installation. It
does not matter what subdirectory so long as you are in the Drupal
directory structure. To see a list of available commands type the
following:

```enter
  cd /var/www/
  drush
```

## Explore Drupal

### User Account Page

All users have an account page. Currently, we are logged in as the
administrator. The account page is simple for now. Click the **My
account** link on the left sidebar. You'll see a brief history for the
user and an **Edit** tab. Users can edit their own information using the
edit interface:

<a href="../File:800px-ExplorDrupal1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/35/800px-ExplorDrupal1.png" width="800"
height="475" alt="800px-ExplorDrupal1.png" /></a>

### Creating Content

Creation of content in Drupal is very easy. Click the **Create content**
link on the left sidebar.

<a href="../File:800px-ExplorDrupal2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3e/800px-ExplorDrupal2.png" width="800"
height="475" alt="800px-ExplorDrupal2.png" /></a>

You'll see two content types that come default with Drupal: Page and
Story. Here is where a user can add simple new pages to the website
without knowledge of HTML or CSS. Click the **Page** content type to see
the interface for creating a new page:

<a href="../File:800px-ExploreDrupal3.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/52/800px-ExploreDrupal3.png" width="800"
height="475" alt="800px-ExploreDrupal3.png" /></a>

You'll notice at the top a **Title** field and a **Body** text box. All
pages require a title and typically have some sort of content entered in
the body. Additionally, there are other options that allow someone to
enter HTML if they would like, save revisions of a page to preserve a
history and to set authoring and publishing information.

<a href="../File:800px-ExploreDrupal4.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fc/800px-ExploreDrupal4.png" width="800"
height="475" alt="800px-ExploreDrupal4.png" /></a>

For practice, try to create two new pages. A **Home** page and an
**About** page for our site. First create the home page and second
create the about page. Add whatever text you like for the body.

### Site Administration

#### Content Management

There are many options under the **Administer** link on the left
sidebar. Here you can manage the site setup, monitor and control
content, manage users and view reports.

<a href="../File:800px-DrupalAdmin1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e8/800px-DrupalAdmin1.png" width="800"
height="633" alt="800px-DrupalAdmin1.png" /></a>

We will not explore all of the options here but will visit a few of the
more important ones for this tutorial. First, click the **Content
Management** link on the left sidebar. You'll see different options.

<a href="../File:800px-DrupalAdminContent.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/88/800px-DrupalAdminContent.png"
width="800" height="633" alt="800px-DrupalAdminContent.png" /></a>

Click the **Content** link. The page shows all content available on the
site. You will see the "About" and "Home" pages you created previously:

<a href="../File:800px-DrupalContent.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fd/800px-DrupalContent.png" width="800"
height="633" alt="800px-DrupalContent.png" /></a>

You'll also notice a set of drop down boxes for filtering the content.
For sites with many different content types and pages this helps to find
content. You can use this list to click to view each page or to edit.

#### Site Building

##### Modules

Click the **Site Building** link on the let sidebar under the
**Administer** link. You'll see several new menu options: Blocks, Menus,
Modules and Themes. First click **Modules**

<a href="../File:800px-AdminModules.png" class="image"><img
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

##### Themes

Next, click the **Themes** link under **Administer** → **Site Building**
on the left sidebar.

<a href="../File:800px-DrupalThemes.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/1a/800px-DrupalThemes.png" width="800"
height="633" alt="800px-DrupalThemes.png" /></a>

Here, you'll see a list of themes that come with Drupal by default. If
you scroll down you'll see that one theme named **Garland** is enabled
and set as default. The current look of the site is using the Garland
them. Change the them by checking the **Enable** checkbox and the
**default** radio button for the **Pushbutton** theme and then clicking
**Save configuration**. Now you'll see that the theme has changed.

<a href="../File:800px-DrupalThemes2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8d/800px-DrupalThemes2.png" width="800"
height="522" alt="800px-DrupalThemes2.png" /></a>

##### Blocks

Blocks in Drupal are used to provide content in regions of a Drupal
theme. For example, navigate to **Administer** → **Site Building** →
**Blocks**.

You'll see that regions of the theme have been identified. Within the
**Sky** theme you can see the regions with dashed lines around them.
Also, you'll see a list of available blocks. You can select where blocks
will appear by selecting the region in the drop down list. Blocks may
also be hidden, if desired, by selecting **\<none\>** in the dropdown.

<a href="../File:Drupal_blocks1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/77/Drupal_blocks1.png/800px-Drupal_blocks1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/77/Drupal_blocks1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/77/Drupal_blocks1.png 2x"
width="800" height="708" alt="Drupal blocks1.png" /></a>

Take time to turn on and off blocks to see where they appear. Re-arrange
blocks by dragging and dropping the cross-hairs beside each one. Be sure
to leave the blocks in the configuration shown in the image below
finished:

<a href="../File:Drupal_blocks2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/3b/Drupal_blocks2.png/800px-Drupal_blocks2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3b/Drupal_blocks2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3b/Drupal_blocks2.png 2x"
width="800" height="708" alt="Drupal blocks2.png" /></a>

##### Menus

Drupal provides an interface for working with menus, including adding
new menu items to an existing menu or for creating new menus. For the
exercise in the Blocks section above we added the **Primary links** menu
to the **Content top** section of the Sky theme. To view the **Primary
links** menu, navigate to **Administer** → **Site building** →
**Menus**.

<a href="../File:Drupal_menus1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/2a/Drupal_menus1.png/800px-Drupal_menus1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2a/Drupal_menus1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2a/Drupal_menus1.png 2x"
width="800" height="613" alt="Drupal menus1.png" /></a>

Select the menu **Primary links**. You'll see it currently has no item.

<a href="../File:Drupal_menus2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/81/Drupal_menus2.png/800px-Drupal_menus2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/81/Drupal_menus2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/81/Drupal_menus2.png 2x"
width="800" height="613" alt="Drupal menus2.png" /></a>

As a demonstration for working with menus we'll add two menu items for
the Home and About pages we created earlier. To do so, click the **Add
item** tab. You will see a form for providing information about the menu
item to be added.

<a href="../File:Drupal_menus3.png" class="image"><img
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

<a href="../File:Druapl_menus4.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/73/Druapl_menus4.png/800px-Druapl_menus4.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/73/Druapl_menus4.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/73/Druapl_menus4.png 2x"
width="800" height="613" alt="Druapl menus4.png" /></a>

Using the instructions above to add a second menu item for our about page
and arrange. Use the 'weight' value so that our Home link appears first
and the About link appears second.

##### URL Path

As mentioned previously, the URL paths for our pages have `node/1` and
`node/2` in the address. This is not very intuitive for site visitors.
Earlier we enabled the **Path** module. This module will allow us to set
a more human-readable path for our pages.

To set a path, click on our new **About** page in the new menu link at
the top and click the **Edit** tab. Scroll to the bottom of the edit
page and you'll see a section titled **URL path setting**. click to open
this section.

<a href="../File:Drupal_url.png" class="image"><img
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

##### Site Configuration

There are many options under the **Administer** → **Site configuration**
page. Here we will only look at one of these at the moment--the **Site
Information** page.

<a href="../File:Drupal_config.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d3/Drupal_config.png/800px-Drupal_config.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d3/Drupal_config.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d3/Drupal_config.png 2x"
width="800" height="613" alt="Drupal config.png" /></a>

Here you will find the configuration options we set when installing the
site. You can change the site name, add a slogan, mission and footer
text to the. Towards the bottom there is a text box titled **Default
front page**. This is where we can tell Drupal to use our new **Home**
page we created as the first page visitors see when the view the site.
In this text box enter the text `node/1`. This is the address of our
home page. We must use the node number here and not our new URL path of
'home' that we just created. Let's change the name of our site from
**Tripal demo** to **My Community Genome Database** and add a slogan:
**Resources for Community Genomics**.

Now, click the **Save configuration** button at the bottom. You'll see
our site name has changed at the top. Also, if we click the logo image
at the top of the site and it will take you to the front page with our
new home page appearing.

### User Accounts

For this tutorial, we will not discuss in depth the user management
infrastructure except to point out:

- User accounts can be created
- Users are assigned to various roles
- Permissions for those roles can be set to allow groups of users
  certain administrative rights or access to specific data.

Explore the Drupal **User Management** menu to see how users can be
created, added to roles with specific permissions.

## Prepare Drupal for Tripal

### Theme Installation

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
rel="nofollow">http://drupal.org/project/sky</a>. We can use the drush
utility to download the theme

```enter
  cd /var/www/sites/all/themes
  drush pm-download sky
```

This should unpack the theme for us. Now, navigate to **Administer** →
**Site Building** → **Themes** and enable the 'Sky' theme and set it as
default:

<a href="../File:800px-DrupalThemes3.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2e/800px-DrupalThemes3.png" width="800"
height="522" alt="800px-DrupalThemes3.png" /></a>

The sky theme was obtained at this address:
<a href="http://drupal.org/project/sky" class="external free"
rel="nofollow">http://drupal.org/project/sky</a>

### Theme Configuration

Here we return to theming. There are several configuration options that
are available to help customize the theme for your site. These can be
found by navigating to the **Administer** → **Site Building** →
**Themes** page and clicking the **Configure** tab near the top.

Appearing under the **Configure** link will be small menu with a listing
of every theme we have enabled. You should see the **Sky** theme at the
end of this list. Click that theme because that is the one we are using
and want to configure:

<a href="../File:800px-DrupalSkyTheme.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d5/800px-DrupalSkyTheme.png" width="800"
height="477" alt="800px-DrupalSkyTheme.png" /></a>

Here you can turn on and off the presence of the logo, site name,
slogan, mission statement, etc. For this particular theme we can also
adjust background colors and images, link colors, font style and size,
and more. Notice when we added a slogan in a previous step but it did
not appear anywhere on the site. To make it appear, check the box next
to **Slogan**.

Also set the following for the theme:

- Set the 'Custom Layout Width' to be 90% to give us more room

Then, click the **Save Configuration** button at the bottom. The pages
inow a bit wider and our slogan appears.

### 3rd Party Modules

We can install new extension modules which we will need later. For this
workshop we have several modules that we will need to install but which
do not yet appear in the list of modules. To do this, we must follow
these steps:

1.  Locate the extension modules from the Drupal website
2.  Retrieve the module using a **drush** command.
3.  Check for a README.txt or INSTALL.txt for any further instructions
    for installation of the module
4.  Return the the Drupal **Administer** → **Site Building** →
    **Modules** page and enable the module.

For an example, let's install the **Views** module needed for this
workshop. The Views module can be found here:
<a href="http://drupal.org/project/views" class="external free"
rel="nofollow">http://drupal.org/project/views</a>. We will download the
current version as of the writing of this tutorial:

```enter
  cd /var/www/sites/all/modules
  drush pm-download views
```

Check the README for additional installation instructions

```enter
  cd views
  ls
  less README.txt
```

_Use the space-bar to scroll through the README.txt file. Hit the 'q'
key to quit_

There are no other installation steps besides what we've done. So return
to the **Administer** → **Site Building** → **Modules** page and enable
the Views module.

<a href="../File:800px-DrupalViews.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/03/800px-DrupalViews.png" width="800"
height="491" alt="800px-DrupalViews.png" /></a>

Notice that the Views package provided three different related modules
and they all appear under a **Views** category.

Alternatively, you can enable the module using another drush command:

```enter
  drush pm-enable views views_ui views_export
```

for this Tutorial, CCK, Views, Views Data Export, JQuery update, and
CKEditor should also be downloaded and installed following the same
instructions above

```enter
drush pm-download views
drush pm-download views_data_export
drush pm-download cck
drush pm-download jquery_update
drush pm-download ckeditor
```

For CKEditor, the README file indicates we need to install the CKEditor
library before we can enable this module. We must first get this package
from online.

Here is a quick command for downloading this file

```enter
  cd /var/www/sites/all/modules/ckeditor
  wget http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.1.2/ckeditor_4.1.2_standard.zip
```

Now unzip the package and rename it according to the instructions

```enter
  unzip ckeditor_4.1.2_standard.zip
```

Once all installation steps have been completed the Views Data Export,
CCK and CKEditor modules can be enabled with the following

```enter
   drush pm-enable views_data_export
   drush pm-enable content fieldgroup content_permissions nodereference userreference text content_copy optionwidgets number
   drush pm-enable jquery_update
   drush pm-enable ckeditor
```

For reference, the modules installed above can be found here:

- Views: <a href="http://drupal.org/project/views" class="external free"
  rel="nofollow">http://drupal.org/project/views</a>
- CCK: <a href="http://drupal.org/project/cck" class="external free"
  rel="nofollow">http://drupal.org/project/cck</a>
- Views Data Export:
  <a href="http://drupal.org/project/views_data_export"
  class="external free"
  rel="nofollow">http://drupal.org/project/views_data_export</a>
- JQuery Update:
  <a href="https://drupal.org/project/jquery_update" class="external free"
  rel="nofollow">https://drupal.org/project/jquery_update</a>
- CKEditor:
  <a href="http://drupal.org/project/ckeditor" class="external free"
  rel="nofollow">http://drupal.org/project/ckeditor</a>

#### Configure CKEditor

Next, we need to configure the CKEditor which provides the Word-style
interface for adding content. Navigate to 'Administer' -\> 'Site
Configuration' -\> 'CKEditor'. You will see a page similar to the
following:

<a href="../File:Tripal-v1.1_ckeditor1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/93/Tripal-v1.1_ckeditor1.png/800px-Tripal-v1.1_ckeditor1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/93/Tripal-v1.1_ckeditor1.png/1200px-Tripal-v1.1_ckeditor1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/93/Tripal-v1.1_ckeditor1.png 2x"
width="800" height="457" alt="Tripal-v1.1 ckeditor1.png" /></a>

Click the 'Edit' link beside 'CKEditor Global Profile'. On the page that
appears, we want to expand the 'Visibility Settings' and switch the
radio button from 'Exclude' to 'Include'. Then clear all of the entries
in the textbox named 'Fields to exclude/include':

<a href="../File:Tripal-v1.1_ckeditor2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/5b/Tripal-v1.1_ckeditor2.png/800px-Tripal-v1.1_ckeditor2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/5b/Tripal-v1.1_ckeditor2.png/1200px-Tripal-v1.1_ckeditor2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5b/Tripal-v1.1_ckeditor2.png 2x"
width="800" height="457" alt="Tripal-v1.1 ckeditor2.png" /></a>

Add the following lines to the textbox you just cleared:

```enter
page@node/add/page.edit-body
chado_organism@node/add/chado-organism.edit-description
chado_organism@node/*/edit.edit-description
chado_analysis@node/add/chado-analysis.edit-description
chado_analysis@node/*/edit.edit-description
```

This will disable the CKEditor for all text boxes except for generic
pages, organism descriptions and analysis descriptions. We can return
later to add any other textareas to the list. You can find the
identifier, similar to those we added to the textbox above, underneath
any compatible text box. CKEditor puts the identifier under each textbox
for your reference. Simply cut-and-paste the identifier. For example,
the screenshot from the **Create Page** page is shown below. Notice the
CKEdintifier for the textbox named `sky:page@node/add/page.edit-body.`.
This was one of the identifiers we used in the textbox above, but with
the theme name (e.g. `sky`) removed.

<a href="../File:Tripal_v1.1-ckeditor3.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/9e/Tripal_v1.1-ckeditor3.png/800px-Tripal_v1.1-ckeditor3.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/9e/Tripal_v1.1-ckeditor3.png/1200px-Tripal_v1.1-ckeditor3.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/9e/Tripal_v1.1-ckeditor3.png 2x"
width="800" height="457" alt="Tripal v1.1-ckeditor3.png" /></a>

Click the **Update global profile button**. Next, under the **Profiles**
section. Click the **edit** link next to **Default** profile. When the
page appears, open the **Editor Appearance** section, and set the
Toolbar by clicking the **full** link. finally, click the **Save**
button.

## Tripal Installation

### Get the Software

To download Tripal and the Extension modules change to the directory
where Drupal keeps it's modules:

```enter
cd /var/www/sites/all/modules
```

To obtain Tripal, issue the following '_git_ commands:

```enter
git clone http://git.drupal.org/sandbox/spficklin/1337878.git tripal
cd tripal
git checkout 6.x-1.1
cd ../
```

We also want to obtain several Extension modules that will be used in
this tutorial. Those modules are available on the
<a href="http://tripal.info/extensions" class="external text"
rel="nofollow">Extensions Page</a> of the Tripal website. However, these
extension modules are also available via a git repository so we will use
a git commands to obtain these.

```enter
git clone http://git.drupal.org/sandbox/spficklin/1578226.git tripal_blast_analysis
cd tripal_blast_analysis
git checkout 6.x-1.1-tripal_v1.1
cd ../

git clone http://git.drupal.org/sandbox/spficklin/1578234.git tripal_kegg_analysis
cd tripal_kegg_analysis
git checkout 6.x-1.1-tripal_v1.1
cd ../

git clone http://git.drupal.org/sandbox/spficklin/1578232.git tripal_interpro_analysis
cd tripal_interpro_analysis
git checkout 6.x-1.1-tripal_v1.1
cd ../

git clone http://git.drupal.org/sandbox/spficklin/1578230.git tripal_go_analysis
cd tripal_go_analysis
git checkout 6.x-1.1-tripal_v1.1
cd ../

git clone http://git.drupal.org/sandbox/spficklin/1578246.git tripal_unigene_analysis
cd tripal_unigene_analysis
git checkout 6.x-1.1-tripal_v1.1
cd ../
```

The above commands will download the main tripal package as well as the
Blast, KEGG, InterPro, GO and Unigene extension modules. Tripal also has
a theme as well. Change to the theme directory:

```enter
cd /var/www/sites/all/themes
```

And issue the following **git** commands:

```enter
git clone http://git.drupal.org/sandbox/spficklin/1342972.git tripal_theme
cd tripal_theme
git checkout 6.x-1.1
```

### Installation

Previously in this Tutorial we enabled the **Path** and **Search**
modules. The process for enabling the Tripal modules is the same. The
site administrator can navigate to the **Administer** → **Site
Building** → **Modules** page and enable each of the Tripal modules.
However, Drush make it easier to enable modules from the command-line.
First, we must enable the tripal_core module. Enter the following
command

```enter
drush pm-enable tripal_core
```

Now that the core module is enabled, we must next install Chado. In the
web browser, navigate to **Administer** → **Tripal Management** →
**Install Chado Schema**. Since this is a fresh install, select the
option to install Chado v1.2 and click the button **Install/ugrapde
Chado**

<a href="../File:Chado_install.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/35/Chado_install.png/800px-Chado_install.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/35/Chado_install.png/1200px-Chado_install.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/35/Chado_install.png 2x"
width="800" height="457" alt="Chado install.png" /></a>

After the button is clicked a message will appear stating "Job 'Install
Chado v1.2' submitted. Check the jobs page for status". Click the **jobs
page** link to see the job that was submitted:

<a href="../File:ChadoInstallJob.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/01/ChadoInstallJob.png/800px-ChadoInstallJob.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/01/ChadoInstallJob.png/1200px-ChadoInstallJob.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/01/ChadoInstallJob.png 2x"
width="800" height="457" alt="ChadoInstallJob.png" /></a>

The job is waiting in the queue until the Tripal jobs system wakes and
tries to run the job. The jobs management subsystem allows modules to
submit long-running jobs, on behalf of site administrators or site
visitors. Often, long running jobs can time out on the web server and
fail to complete. The jobs system runs separately in the background
using the command-line on an automated schedule but jobs are submitted
through the web interface by users.

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

```enter
   sudo crontab -e
```

[A word on text editors such as
nano](../Linux_Text_Editors "Linux Text Editors").

Add this line to the crontab

```enter
   0,15,30,45 * * * * (cd /var/www; drush trpjob-run administrator ) > /dev/null
```

This entry will run the Tripal cron every 15 minutes as the
administrator user. For this tutorial we do not want to wait 15 minutes
at the most to execute our jobs. So, we will run the jobs manually.
Tripal supports Drush and therefore has it's own commands. We can use
drush to manually launch the job:

```enter
drush trpjob-run administrator
```

We should now see to following text in the terminal window indicating
that the installation of Chado was successful:

    Tripal Job Launcher
    Running as user 'administrator'
    -------------------
    Calling: tripal_core_install_chado(Install Chado v1.2, 1)
    Creating 'chado' schema
    Loading sites/all/modules/tripal/tripal_core/chado_schema/default_schema-1.2.sql...
    Install of Chado v1.2 (Step 1 of 2) Successful!
    Loading sites/all/modules/tripal/tripal_core/chado_schema/initialize-1.2.sql...
    Install of Chado v1.2 (Step 2 of 2) Successful.
    Installation Complete

Also, we see that the job has completed when refreshing the jobs
management page:

<a href="../File:ChadoInstallDone.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d2/ChadoInstallDone.png/800px-ChadoInstallDone.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d2/ChadoInstallDone.png/1200px-ChadoInstallDone.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d2/ChadoInstallDone.png 2x"
width="800" height="438" alt="ChadoInstallDone.png" /></a>

Now that Chado is installed, we can continue with installation of the
remaining Tripal modules. These modules should be installed in the
following order one at a time. If you install them all at once you may
encounter errors later. Install the modules in the following way (and
order):

```enter
drush pm-enable tripal_db
drush pm-enable tripal_cv
drush pm-enable tripal_organism
drush pm-enable tripal_analysis
drush pm-enable tripal_feature
drush pm-enable tripal_views
```

Now, enable the remaining Tripal extension modules

```enter
drush pm-enable tripal_analysis_blast
drush pm-enable tripal_analysis_go
drush pm-enable tripal_analysis_interpro
drush pm-enable tripal_analysis_kegg
```

There are more Tripal modules that can be enabled (e.g. tripal_project,
tripal_stock, etc.). But for this tutorial we will only be using the
modules we enabled above.

The Tripal modules create directories in the
/var/www/sites/default/files directory. By default, Drupal expects the
'sites/default/files' directory to be writeable by the web server.
Because we installed the Tripal mdoules using Drush we need to reset the
permissions for the web user. Execute the following command to give the
web user group permission to write to that directory

```enter
sudo chown -R ubuntu:www-data /var/www/sites/default/files
sudo chmod -R g+rw /var/www/sites/default/files
```

The last component we need to enable is the Tripal base theme. This
theme provides the necessary look-and-feel to the data presented by
Tripal. Installation is the same as for modules:

```enter
drush pm-enable tripal
```

The Tripal theme is not a full Drupal theme. It is intended to
beincorporated into the site's primary theme. In this tutorial we are
currently using the **sky** theme. Therefore, we need to inform Drupal
that the sky theme will be using Tripal as a base theme. To do this,
change to the sky theme directory:

```enter
cd /var/www/sites/all/themes/sky
```

And edit the sky.info file

```enter
gedit sky.info
```

And add the following line to the bottom of the file:

```enter
base theme = tripal
```

If you do not wish to use the Sky theme, you simply need to find the
corresponding .info file for your default theme and add the same line to
the file.

Tripal is now installed!

### Controlled Vocabularies: Installing CVs

Before we can proceed with populating our Chado table with genomic data
we must first load some controlled vocabularies (i.e. ontologies). To do
this, navigate to **Administer** → **Tripal Management** →
**Vocabularies**. You'll see a page describing the purpose of the module
and how to use it. Click the link on the left sidebar titled 'Load
Ontology With OBO File'. You'll see the following page:

<a href="../File:Tripal-LoadOntology.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/fa/Tripal-LoadOntology.png/800px-Tripal-LoadOntology.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/fa/Tripal-LoadOntology.png/1200px-Tripal-LoadOntology.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fa/Tripal-LoadOntology.png 2x"
width="800" height="581" alt="Tripal-LoadOntology.png" /></a>

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

```enter
cd /var/www
drush trpjob-run administrator
```

**Note:** Loading the Gene Ontology will take several hours.

### Setting Perimssions

Because we are logged on to the site as an admin user we are able to see
all content. However, Drupal provides **User Management** infrastructure
that allows the site admin to set which types of users can view the
content on the site. By default there are two types of users
**anonymous** and **authenticated** users. For this tutorial we want to
set permissions so that anonymous visitors to the site can see the
genomic content. To do this, navigate to **Administer** → **user
Management** → **Permissions**. Here you will see permissions for all
types of content.

<a href="../File:Triapl-Permissions.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1e/Triapl-Permissions.png/800px-Triapl-Permissions.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1e/Triapl-Permissions.png/1200px-Triapl-Permissions.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/1e/Triapl-Permissions.png 2x"
width="800" height="489" alt="Triapl-Permissions.png" /></a>

Scroll through the list of permissions and set the following for both
anonymous and authenticated users:

- access chado_analysis content
- access chado_analysis_blast content
- access chado_analysis_go content
- access chado_analysis_interpro content
- access chado_analysis_kegg content
- access chado_cv content
- access chado_db content
- access chado_feature content
- access chado_organism content

Each time you install a new module you should always check the
**Permissions** page and set any new permissions that may have been
added by the new module.

## Using Tripal

### Creating Organism Pages

There are two ways to create pages for organism. If your organism is
already in Chado then you can sync the organism. If it is not in Chado
you will need manually create it using the Tripal web interface. The
following two sections describe both methods.

#### What if Our Organism is Already in Chado?

Now that we have Chado loaded and populated we would like to create a
home page for our species. Chado comes pre-loaded with a few species
already, so we will check to see if our organism is already present. To
do this navigate to **Administer** -\> **Tripal Management** →
**Organisms** → **Configuration**

<a href="../File:800px-TripalOrganisms.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ec/800px-TripalOrganisms.png" width="800"
height="485" alt="800px-TripalOrganisms.png" /></a>

This configuration page has several different options. We will discuss
two of these here. The first is the top section labeled **Sync
Organisms**. In this section is a list of organisms. These are the
organisms that come by default with Chado. If our organism is already in
the list (e.g. _Drosophila melenogaster_) then we need to inform Drupal
that we have data in Chado for which we would like a web page. This is
what we call **Syncing**. We need to sync Drupal and Chado so that
Drupal knows about our organism. To do this, click the check box next to
**Drosophila melenogaster** and then click the **Submit Sync Job**.

As usual we want to run this job manually:

```enter
cd /var/www
drush trpjob-run administrator
```

Now that our organism is synced we should have a new page for
_Drosophila melenogaster_. To find the page, click the **Organisms**
menu item in the left side bar under **Search Biological Data**. This
menu item was automatically added when we installed the Tripal Organism
module. On this page we see a list of organisms that are present in
Chado. Notice that only the fruitfly is clickable because it is the only
organism synced.

<a href="../File:TripalOrganismList.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/bf/TripalOrganismList.png/800px-TripalOrganismList.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/bf/TripalOrganismList.png/1200px-TripalOrganismList.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/bf/TripalOrganismList.png 2x"
width="800" height="409" alt="TripalOrganismList.png" /></a>

Now if we click the 'fruitfly' link it should take us to our new
organism page:

<a href="../File:TripalOrganismFruitFly.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/a2/TripalOrganismFruitFly.png/800px-TripalOrganismFruitFly.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/a2/TripalOrganismFruitFly.png/1200px-TripalOrganismFruitFly.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a2/TripalOrganismFruitFly.png 2x"
width="800" height="409" alt="TripalOrganismFruitFly.png" /></a>

By default all Tripal pages have a center content section and a right
side-bar section with links for **Resources**. However, this page is a
bit empty. We need to add some details. Click the **Edit** tab towards
the top of the page. Notice two if the fields are missing content: the
description and the organism image

<a href="../File:TripalOrganismFruitFly2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/82/TripalOrganismFruitFly2.png/800px-TripalOrganismFruitFly2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/82/TripalOrganismFruitFly2.png/1200px-TripalOrganismFruitFly2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/82/TripalOrganismFruitFly2.png 2x"
width="800" height="448" alt="TripalOrganismFruitFly2.png" /></a>

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

<a href="../File:Dmel.jpg" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/65/Dmel.jpg/200px-Dmel.jpg"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/65/Dmel.jpg 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/65/Dmel.jpg 2x"
width="200" height="157" alt="Dmel.jpg" /></a>

Save the page. Now we have a more informative page:

<a href="../File:TripalOrgPageDone.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/3c/TripalOrgPageDone.png/800px-TripalOrgPageDone.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/3c/TripalOrgPageDone.png/1200px-TripalOrgPageDone.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3c/TripalOrgPageDone.png 2x"
width="800" height="499" alt="TripalOrgPageDone.png" /></a>

#### What if My Organism Is Not Present in Chado?

For this tutorial we will be loading data for _Citrus sinensis_ (sweet
orange), but this organism is not in Chado by default. We can easily add
the organism using the **Create Content** page. You can find this link
on the left side bar navigation menu. The **Create Content** page has
many more content types than when we first saw it. Previously we only
had **Page** and **Story** content types. Now we have more content types
added by the Tripal Analysis, Organism, Feature and Extension modules .

<a href="../File:Tripal-Create_content.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/20/Tripal-Create_content.png/800px-Tripal-Create_content.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/20/Tripal-Create_content.png/1200px-Tripal-Create_content.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/20/Tripal-Create_content.png 2x"
width="800" height="448" alt="Tripal-Create content.png" /></a>

To add a new organism simply click the **Organism** link and and fill in
the fields with these values:

- Genus: Citrus
- Species: sinensis
- Abbreviation: C. sinensis
- Common name: Sweet orange
- Description: Sweet orange is the No.1 citrus production in the world,
  accounting for about 70% of the total. Brazil, Florida (USA), and
  China are the three largest sweet orange producers. Sweet orange
  fruits have very tight peel and are classified into the hard-to-peel
  group. They are often used for juice processing, rather than fresh
  consumption. Valencia, Navel, Blood, Acidless, and other subtypes are
  bud mutants of common sweet orange varieties. Sweet orange is
  considered as an introgression of a natural hybrid of mandarin and
  pummelo; some estimates shows more mandarin genomic background than
  pummelo. The genome size is estimated at 380Mb across 9 haploid
  chromosomes.

And, use the following image:

<a href="../File:Citrus_sinensis.jpg" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/42/Citrus_sinensis.jpg/200px-Citrus_sinensis.jpg"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/42/Citrus_sinensis.jpg 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/42/Citrus_sinensis.jpg 2x"
width="200" height="176" alt="Citrus sinensis.jpg" /></a>

Save the page and view the new Organism:

<a href="../File:Tripal-Organism-Citrus.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/cc/Tripal-Organism-Citrus.png/800px-Tripal-Organism-Citrus.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/cc/Tripal-Organism-Citrus.png/1200px-Tripal-Organism-Citrus.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/cc/Tripal-Organism-Citrus.png 2x"
width="800" height="499" alt="Tripal-Organism-Citrus.png" /></a>

### Creating an Analysis

For this tutorial, we will later import a set of genes, including
associated mRNA, CDS, UTRs, etc. Tripal requires that an analysis be
associated with all imported features. This has several advantages,
including:

- The source of features (sequences) can be traced. Even for features
  simply downloaded from a database, someone else can see where the
  features came from.
- Provides a mechanism for describing how the features were created
  (e.g. whole genome structural and functional annotation description)
- The analysis links all of the features together which can be useful
  for querying for specific features from an analysis.

To create an analysis for loading our genomic data, navigate to the
**Create content** and click on the link: **Analysis**

The analysis creation page will appear:

<a href="../File:TripalCreateAnalysis.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f5/TripalCreateAnalysis.png/800px-TripalCreateAnalysis.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f5/TripalCreateAnalysis.png/1200px-TripalCreateAnalysis.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f5/TripalCreateAnalysis.png 2x"
width="800" height="538" alt="TripalCreateAnalysis.png" /></a>

Here you can provide the necessary details to help others understand the
source of your data. For this tutorial, enter the following:

- Analysis Name: Whole Genome Assembly and Annotation of Citrus Sinensis
  (JGI)
- Program: Performed by JGI
- Program Version: v1.0
- Source Name: JGI Citrus sinensis assembly/annotation v1.0 (154)
- Source URI:
  <a href="http://www.phytozome.net/citrus.php" class="external free"
  rel="nofollow">http://www.phytozome.net/citrus.php</a>
- Time Executed: Feb 1, 2011
- Materials and Methods: (if using CKEditor, click the 'Source' button
  before pasting)

```enter
<p>
    <strong><em>Note: </em>The following text comes from phytozome.org:</strong></p>
<p>
    <u>Genome Size / Loci</u><br />
    This version (v.1) of the assembly is 319 Mb spread over 12,574 scaffolds. Half the genome is accounted for by 236 scaffolds 251 kb or longer. The current gene set (orange1.1) integrates 3.8 million ESTs with homology and ab initio-based gene predictions (see below). 25,376 protein-coding loci have been predicted, each with a primary transcript. An additional 20,771 alternative transcripts have been predicted, generating a total of 46,147 transcripts. 16,318 primary transcripts have EST support over at least 50% of their length. Two-fifths of the primary transcripts (10,813) have EST support over 100% of their length.</p>
<p>
    <u>Sequencing Method</u><br />
    Genomic sequence was generated using a whole genome shotgun approach with 2Gb sequence coming from GS FLX Titanium; 2.4 Gb from FLX Standard; 440 Mb from Sanger paired-end libraries; 2.0 Gb from 454 paired-end libraries</p>
<p>
    <u>Assembly Method</u><br />
    The 25.5 million 454 reads and 623k Sanger sequence reads were generated by a collaborative effort by 454 Life Sciences, University of Florida and JGI. The assembly was generated by Brian Desany at 454 Life Sciences using the Newbler assembler.</p>
<p>
    <u>Identification of Repeats</u><br />
    A de novo repeat library was made by running RepeatModeler (Arian Smit, Robert Hubley) on the genome to produce a library of repeat sequences. Sequences with Pfam domains associated with non-TE functions were removed from the library of repeat sequences and the library was then used to mask 31% of the genome with RepeatMasker.</p>
<p>
    <u>EST Alignments</u><br />
    We aligned the sweet orange EST sequences using Brian Haas's PASA pipeline which aligns ESTs to the best place in the genome via gmap, then filters hits to ensure proper splice boundaries.</p>
```

**Note:**: Above we entered HTML. This is not the easiest way to enter
text, but makes it simple for this tutorial. When the **ckeditor**
module is installed and properly setup the user is provided with editor
tools that makes it much easier to add text to any page.

After saving, you should have the following analysis page:

<a href="../File:Tripal-Analysis-Citrus.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/27/Tripal-Analysis-Citrus.png/800px-Tripal-Analysis-Citrus.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/27/Tripal-Analysis-Citrus.png/1200px-Tripal-Analysis-Citrus.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/27/Tripal-Analysis-Citrus.png 2x"
width="800" height="448" alt="Tripal-Analysis-Citrus.png" /></a>

### Creating a Database Cross Reference

For our site, we want to create gene pages with sequences and have those
pages link back to JGI where we obtained the genes. Therefore, we want
to add a database reference for JGI. To add a new external databases,
navigate to **Administer** → **Tripal Management** → **Databases** →
**Add a Database**. The resulting page provides fields for adding a new
database:

<a href="../File:Tripal-Add-Database.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/c1/Tripal-Add-Database.png/800px-Tripal-Add-Database.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/c1/Tripal-Add-Database.png/1200px-Tripal-Add-Database.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c1/Tripal-Add-Database.png 2x"
width="800" height="448" alt="Tripal-Add-Database.png" /></a>

Enter the following values for the fields:

- Name: Phytozome
- Description: Phytozome is a joint project of the Department of
  Energy's Joint Genome Institute and the Center for Integrative
  Genomics to facilitate comparative genomic studies amongst green
  plants
- URL: <a href="http://www.phytozome.net/" class="external free"
  rel="nofollow">http://www.phytozome.net/</a>
- URL prefix: <a
  href="http://www.phytozome.net/genePage.php?search=1&amp;detail=1&amp;er=1&amp;crown&amp;method=0&amp;searchText=transcriptid%253A"
  class="external free"
  rel="nofollow">http://www.phytozome.net/genePage.php?search=1&amp;detail=1&amp;er=1&amp;crown&amp;method=0&amp;searchText=transcriptid%253A</a>

The URL prefix is important as it will be used to create the links on
our gene pages. Our gene name will be appended to this URL to create the
link that will take us to the corresponding gene page on Flybase.

Click **Add**.

We now have added a new database!

Later we will also load Blast data. We need to create two new databases
for those as well. Creat the following entries for NCBI nr, and ExPASy
SwissProt:

- Name: NCBI nr
- Description: NCBI's non-redundant database.
- URL: <a href="http://www.ncbi.nlm.nih.gov/" class="external free"
  rel="nofollow">http://www.ncbi.nlm.nih.gov/</a>
- URL prefix:
  <a href="http://www.ncbi.nlm.nih.gov/protein/" class="external free"
  rel="nofollow">http://www.ncbi.nlm.nih.gov/protein/</a>

- Name: ExPASy Swiss-Prot
- Description: A curated protein sequence database which strives to
  provide a high level of annotation, a minimal level of redundancy and
  high level of integration with other databases
- URL: <a href="http://expasy.org/sprot/" class="external free"
  rel="nofollow">http://expasy.org/sprot/</a>
- URL prefix:
  <a href="http://www.uniprot.org/uniprot/" class="external free"
  rel="nofollow">http://www.uniprot.org/uniprot/</a>

### Loading Feature Data

Now that we have our organism and whole genome analysis ready, we can
being loading genomic data. For this tutorial only a single gene from
sweet orange will be loaded into the database. This is to ensure we can
move through the tutorial rather quickly. The following datasets will be
used for this tutorial:

- <a
  href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/dc/Citrus_sinensis-orange1.1g015632m.g.gff3"
  class="internal" title="Citrus sinensis-orange1.1g015632m.g.gff3">Citrus
  sinensis-orange1.1g015632m.g.gff3</a>
- <a
  href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/87/Citrus_sinensis-scaffold00001.fasta"
  class="internal" title="Citrus sinensis-scaffold00001.fasta">Citrus
  sinensis-scaffold00001.fasta</a>
- <a
  href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/90/Citrus_sinensis-orange1.1g015632m.g.fasta"
  class="internal"
  title="Citrus sinensis-orange1.1g015632m.g.fasta">Citrus
  sinensis-orange1.1g015632m.g.fasta</a>

Download these to the `/var/www/sites/default/files`. The quickest
method is to right-click on the links above, then **wget** to retrieve
the file:

```enter
  cd /var/www/sites/default/files
  #Note that these files no longer exist!
  wget http://gmod.org/mediawiki/images/d/dc/Citrus_sinensis-orange1.1g015632m.g.gff3
  wget http://gmod.org/mediawiki/images/8/87/Citrus_sinensis-scaffold00001.fasta
  wget http://gmod.org/mediawiki/images/9/90/Citrus_sinensis-orange1.1g015632m.g.fasta
```

#### Loading a GFF3 File

The gene features (e.g. gene, mRNA, 5_prime_UTRs, CDS 3_prime_UTRS) are
stored in the GFF3 file downloaded in the previous step. We will load
this GFF3 file and consequently load our gene features into the
database. Navigate to **Administer** → **Tripal Management** →
**Features** → **Import a GFF3 file**.

<a href="../File:Tripal-importGFF.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7d/Tripal-importGFF.png/800px-Tripal-importGFF.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7d/Tripal-importGFF.png/1200px-Tripal-importGFF.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/7d/Tripal-importGFF.png 2x"
width="800" height="466" alt="Tripal-importGFF.png" /></a>

Perform the following:

1.  Enter the path on the file system where our GFF file resides
    (`/var/www/sites/default/files/Citrus_sinensis-orange1.1g015632m.g.gff3`)
2.  Choose the organism to which the GFF3 file belongs (in this case
    _Citrus sinensis (sweet orange)_
3.  Select the analysis named "Whole Genome Assembly and Annotation of
    Citrus sinensis...".
4.  Leave all other options as default.

Finally, click the **Import GFF3 file** button. You'll notice a job was
submitted to the jobs subsystem. Now, to complete the process we need
the job to run. We'll do this manually:

```enter
cd /var/www;
drush trpjob-run administrator
```

**Note**: For very large GFF files the loader can take quite a while to
complete. There should be no errors or warnings after loading the GFF
file but there will be information about the time and memory used when
loading the file. Below is similar to what you should see:

    Tripal Job Launcher
    Running as user 'administrator'
    -------------------
    Calling: tripal_feature_load_gff3(/var/www/sites/default/files/Citrus_sinensis-orange1.1g015632m.g.gff3, 13, 10, 0, 1, 0, 0, 1, , , 0, , , , 0, 8)

    NOTE: Loading of this GFF file is performed using a database transaction.
    If the load fails or is terminated prematurely then the entire set of
    insertions/updates is rolled back and will not be found in the database

    Opening /var/www/sites/default/files/Citrus_sinensis-orange1.1g015632m.g.gff3
    Parsing Line 138 (100.00%). Memory: 39,138,672 bytes.
    Setting ranks of children...
    Done

#### Loading FASTA files

Using the Tripal GFF loader we were able to populate the database with
the genomic features for our organism. However, those features now need
nucleotide sequence data. To do this, we will load the nucleotide
sequences for the mRNA features and the scaffold sequence. Navigate to
the **Administer** → **Tripal Management** → **Features** → **Import a
Multi-FASTA file** Page

<a href="../File:Tripal-import_fasta.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/93/Tripal-import_fasta.png/800px-Tripal-import_fasta.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/93/Tripal-import_fasta.png/1200px-Tripal-import_fasta.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/93/Tripal-import_fasta.png 2x"
width="800" height="466" alt="Tripal-import fasta.png" /></a>

Before loading the FASTA file we must first know the Sequence Ontology
(SO) term that describes the sequences we are about to upload. We can
find the appropriate SO terms from our GFF file. In the GFF file we see
the SO terms that correspond to our FASTA files are 'scaffold' and
'mRNA'.

**IMPORTANT:** It is important to ensure prior to importing, that the
FASTA loader will be able to appropriately match the sequence in the
FASTA file with existing sequences in the database. Before loading FASTA
files take special care to ensure the definition line of your FASTA file
can uniquely identify the feature for the specific organism and sequence
type. For example, in our GFF file an mRNA feature appears as follows:

```enter
scaffold00001   phytozome6      mRNA    4058460 4062210 .       +       .       ID=PAC:18136217;Name=orange1.1g015632m;PACid=18136217;Parent=orange1.1g015632m.g
```

Note that for this mRNA feature the ID is **PAC:18136217** and the name
is **orange1.1g015632m**. In Chado, features always have a human
readable name which does not need to be unique, and also a unique name
which must be unique for the organism and SO type. In the GFF file, the
ID becomes the unique name and the Name becomes the human readable name.

In our FASTA file the definition line for this mRNA is:

```enter
>orange1.1g015632m PAC:18136217 (mRNA) Citrus sinensis
```

By default Tripal will match the sequence in a FASTA file with the
feature that matches the first word in the definition line. In this case
the first word is **orange1.1g015632m**. As defined in the GFF file, the
name and unique name are different for this mRNA. However, we can see
that the first word in the definition line of the FASTA file is the name
and the second is the unique name. Therefore, when we load the FASTA
file we should specify that we are matching by the name because it
appears first in the definition line.

If however, we cannot guarantee the that feature name is unique then we
can use a regular expressions in the **Advanced Options** to tell Tripal
where to find the name or unique name in the definition line of your
FASTA file.

**IMPORTANT:** When loading FASTA files to update _existing_ features,
always choose "Update only" as the import method. Otherwise, Tripal may
add the features in the FASTA file as new features if it cannot properly
match them to existing features.

Now, enter the following values in the fields on the web form:

- FASTA file:
  /var/www/sites/default/files/Citrus_sinensis-scaffold00001.fasta
- Organism: Citrus sinensis (Sweet orange)
- Sequence type: scaffold
- Name Match Type: Name
- Method: Update only (we do not want to insert these are they should
  already be there)
- Analysis: Whole Genome Assembly and Annotation of Citrus sinensis....

Click the **Import Fasta File**, and a job will be added to the jobs
system. Run the job:

```enter
cd /var/www
drush trpjob-run administrator
```

Next do the same for the genes GFF:

- FASTA file:
  /var/www/sites/default/files/Citrus_sinensis-orange1.1g015632m.g.fasta
- Organism: Citrus sinensis (Sweet orange)
- Sequence type: mRNA
- Method: Update only
- Name Match: Name
- Analysis: Whole Genome Assembly and Annotation of Citrus sinensis....

Now run this job:

```enter
cd /var/www;
drush trpjob-run administrator
```

Now the scaffold sequence and mRNA sequences are loaded

**Note** It is not necessary to load the mRNA sequences as those can be
derived from their alignments with the scaffold sequence. However, in
Chado the feature table has a 'residues' column. Therefore, it is best
practice to load the sequence when possible.

The FASTA loader has some advanced options which we will not cover in
this tutorial. But briefly, the advanced options allow you to create
relationships between features and associate them with external
databases. For example, the definition line for an mRNA is:

```enter
>orange1.1g015632m PAC:18136217 (mRNA) Citrus sinensis
```

Here we have more information than just the feature name. We have a
unique Phytozome accession number (e.g. PAC ID) for the mRNA. Using the
**External Database Reference** section under **Advanced Options** we
can provide the name of the database and a regular expression to tell
the loader how to find the accession number in the definition line.
However, the database cross-reference is present in the GFF file and
this association has already been made so we do not need to make the
association here.

If the name of the gene to which this mRNA belonged was also on the
definition line, we could use the **Relationships** section to link this
mRNA with it's gene parent. Fortunately, this information is also in our
GFF file and these relationships have already been made.

### Creating Feature Pages

Now that we've loaded our feature data, we must "sync" them. Loading of
the GFF file in the previous step has populated the feature tables of
Chado for us, but now Drupal must know about these features. To sync
features, navigating to **Administer** → **Tripal Management** →
**Features** → **Sync Features** (unlike for syncing organisms, features
have a separate page for syncing).

<a href="../File:Tripal-Sync-Features.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/ce/Tripal-Sync-Features.png/800px-Tripal-Sync-Features.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/ce/Tripal-Sync-Features.png/1200px-Tripal-Sync-Features.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/ce/Tripal-Sync-Features.png 2x"
width="800" height="448" alt="Tripal-Sync-Features.png" /></a>

Here we can specify the types of features to sync and the organism. This
allows us to create feature pages for different types of features for
different organisms. Enter into the **Feature Types** the features that
should have pages on the site. In this case, we want **gene** and
**mRNA** pages. Features of these types were present in our GFF file.

Next, select the organism "Citrus sinensis", and click the "Sync all
features" button. A job is then added to the jobs management system
which we need to manually run rather than wait on the cron entry to run
it.

```enter
cd /var/www
drush trpjob-run administrator
```

Our features are now synced:

<a href="../File:Tripal-Features-Synced.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/c3/Tripal-Features-Synced.png/800px-Tripal-Features-Synced.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/c3/Tripal-Features-Synced.png/1200px-Tripal-Features-Synced.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c3/Tripal-Features-Synced.png 2x"
width="800" height="361" alt="Tripal-Features-Synced.png" /></a>

**Note:** It is not necessary to sync all types of features in the GFF
file. For example, do not sync the **scaffold**. The feature is large
and would have many relationships to other features. Only sync features
that you will want users to view. For example, each mRNA is composed of
several **CDS** features. These CDS features do not need their own page
and therefore do not need to be synced..

Now, we can view our gene and mRNA pages. Navigate to **Search
Biological Data** → **Features**. Select **gene** and **mRNA** in the
**Type** select box and click the **Show** button. The list of genes and
mRNA will be all available features.

<a href="../File:Tripal-Search-Features.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f1/Tripal-Search-Features.png/800px-Tripal-Search-Features.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f1/Tripal-Search-Features.png/1200px-Tripal-Search-Features.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f1/Tripal-Search-Features.png 2x"
width="800" height="448" alt="Tripal-Search-Features.png" /></a>

Here we can see the gene feature we added and its corresponding mRNA's.
Click on the mRNA named **orange1.1g015615m**. You can now see the
details page with available resources on the side bar:

<a href="../File:Triapl-New-Feature-Page.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/43/Triapl-New-Feature-Page.png/800px-Triapl-New-Feature-Page.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/43/Triapl-New-Feature-Page.png/1200px-Triapl-New-Feature-Page.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/43/Triapl-New-Feature-Page.png 2x"
width="800" height="448" alt="Triapl-New-Feature-Page.png" /></a>

### Materialized Views

Chado is very efficient as a data warehouse but queries can become slow
depending on the number of table joins and amount of data. To help
simplify and speed these queries, materialized views can be employed.
For a materialized view, a table is created and then populated with the
results of a pre-defined SQL query. Therefore, rather than execute the
pre-defined query which may take a long time, the query on the
materialized view is more simple and faster. A side effect, however is
redundant data, with the materialized view becoming stale if not updated
regularly.

Tripal provides a mechanism for populating and updating these
materialized views. These can be found on the **Administer** → **Tripal
Management** → **MViews** page.

<a href="../File:Tripal-MViews.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/24/Tripal-MViews.png/800px-Tripal-MViews.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/24/Tripal-MViews.png/1200px-Tripal-MViews.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/24/Tripal-MViews.png 2x"
width="800" height="489" alt="Tripal-MViews.png" /></a>

Here we see several materialized views. These were installed
automatically by the various Tripal modules. To update these views,
click the **Populate** button for each one.

This will submit jobs to populate the views with data. Now, run the
jobs:

```enter
cd /var/www
drush trpjob-run administrator
```

You can now see that all views are up-to-date on the **Materialized
Views** Page. The number of rows in the view table is shown:

<a href="../File:Tripal-MViews-Populated.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/02/Tripal-MViews-Populated.png/800px-Tripal-MViews-Populated.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/02/Tripal-MViews-Populated.png/1200px-Tripal-MViews-Populated.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/02/Tripal-MViews-Populated.png 2x"
width="800" height="489" alt="Tripal-MViews-Populated.png" /></a>

Materialized views are most useful when creating custom pages where data
is queried in novel ways.

### Feature Page Configuration

#### Feature URLs

The feature configuration page allows us to perform configuration
changes for the entire site. Navigate to the **Administer** → **Tripal
Management** → **Features** → **Feature Configuration** page.

<a href="../File:TripalFeatureConfiguration.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/9a/TripalFeatureConfiguration.png/800px-TripalFeatureConfiguration.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/9a/TripalFeatureConfiguration.png/1200px-TripalFeatureConfiguration.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/9a/TripalFeatureConfiguration.png 2x"
width="800" height="538" alt="TripalFeatureConfiguration.png" /></a>

First, we can alter the feature URL path which is used to construct the
URL that visitors can bookmark or link to for each feature. The URL
would be <a href="http://localhost/" class="external free"
rel="nofollow">http://localhost/</a>\[identifier\] where \[identifier\]
could be the name of the feature, unique name or internal ID number, or
a combination of the organism, type and name of the feature. If we
choose to use an internal ID, we can specify a prefix for the internal
ID number when it appears on the URL path. For example, if we leave the
default prefix of 'ID' and have a feature ID number of 283942, the
feature ID would appear as 'ID283942'.

For this tutorial, we want to reset the URL for all of the features we
loaded previously. To do this, click the option **feature name** and
then click the **Set Feature URLs**. This will add a job to the jobs
system. We want to execute this job manually:

```enter
cd /var/www
drush trpjob-run administrator
```

You should see the following output to the terminal:

    Tripal Job Launcher (in parallel)
    Running as user 'administrator'
    -------------------
    Calling: tripal_feature_set_urls(, 18)
    Setting URL alias for orange1.1g015632m.g: node/4 => orange1.1g015632m.g
    Setting URL alias for orange1.1g015632m: node/5 => orange1.1g015632m
    Setting URL alias for orange1.1g015645m: node/6 => orange1.1g015645m
    Setting URL alias for orange1.1g015615m: node/7 => orange1.1g015615m
    Setting URL alias for orange1.1g015662m: node/8 => orange1.1g015662m
    Setting URL alias for orange1.1g017341m: node/9 => orange1.1g017341m
    Setting URL alias for orange1.1g018514m: node/10 => orange1.1g018514m
    Setting URL alias for orange1.1g022520m: node/11 => orange1.1g022520m
    Setting URL alias for orange1.1g022799m: node/12 => orange1.1g022799m
    Setting URL alias for orange1.1g022797m: node/13 => orange1.1g022797m

Previously, URLs were set to use the Internal ID by default, but now the
URLs for features are similar to:
<a href="http://localhost/orange1.1g015632m" class="external free"
rel="nofollow">http://localhost/orange1.1g015632m</a>.

#### Feature Browser

Next on the configuration page are **Feature Browser** settings. By
default, Tripal will provide a browser on the organism page that allows
a visitor to easily find a feature. For large sites with many features
this would be an inefficient way to find a specific feature, but it does
allow visitors who simply want to explore the site to quickly find
example pages. This browser will only show synced features and will only
show features of the type specified in the **Feature Types** box. We
want to show **genes** pages so alter the contents of this box to
contain only the word **gene**. Optionally, you can turn this browser
off by setting the appropriate radio buttons. If we then navigate to the
organism page for _Citrus sinensis_ and click the link on the right
sidebar titled **Feature Browser** we can see the genes listed with
links for each feature page.

<a href="../File:Tripal-FeatureBrowser.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/39/Tripal-FeatureBrowser.png/800px-Tripal-FeatureBrowser.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/39/Tripal-FeatureBrowser.png/1200px-Tripal-FeatureBrowser.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/39/Tripal-FeatureBrowser.png 2x"
width="800" height="489" alt="Tripal-FeatureBrowser.png" /></a>

#### Feature Summary Report

Next on the configuration page is the **Feature Summary Report**
setting. By default, on the organism page, Tripal will provide a list of
all features belonging to an organism and provide a pie-chart of this
list. For example, below is a screen shot of the **Data Type Summary**
on the **_Citrus sinensis_** page for the data we loaded.

<a href="../File:Tripal-FeatureTypes.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f1/Tripal-FeatureTypes.png/800px-Tripal-FeatureTypes.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f1/Tripal-FeatureTypes.png/1200px-Tripal-FeatureTypes.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f1/Tripal-FeatureTypes.png 2x"
width="800" height="489" alt="Tripal-FeatureTypes.png" /></a>

You can turn off this summary graph using the feature configuration page
by setting the appropriate radio button in the **Feature Summary
Report** section. You can also specify which feature types to show and
can rename them to be more meaningful. To select which items will appear
in this list, add the following contents to the **Map feature types**
box:

    CDS
    five_prime_UTR = 5'UTR
    three_prime_UTR = 3'UTR
    mRNA
    supercontig = Supercontig
    gene = Gene

Now the Data Type Summary on the organism page appears as:

<a href="../File:TripalDataTypeSummary.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/91/TripalDataTypeSummary.png/800px-TripalDataTypeSummary.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/91/TripalDataTypeSummary.png/1200px-TripalDataTypeSummary.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/91/TripalDataTypeSummary.png 2x"
width="800" height="538" alt="TripalDataTypeSummary.png" /></a>

**Note** The data type summary is only available when the
**organism_feature_count** materialized view is populated. Each time new
data is added, this materialized view should be updated to capture the
changes and have those shown in the summary.

### Loading Functional Data Using Extension Modules

For this tutorial we will be loading functional data for our gene. To do
this we will use the Blast, KEGG, and InterPro extension modules. These
modules were installed previously. Blast, KEGG and InterPro analyses
were completed prior to this tutorial and results files are available
for downloading:

- <a
  href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/0c/Citrus_sinensis-orange1.1g015632m.g.iprscan.xml"
  class="internal"
  title="Citrus sinensis-orange1.1g015632m.g.iprscan.xml">Citrus
  sinensis-orange1.1g015632m.g.iprscan.xml</a>
- <a
  href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/13/Citrus_sinensis-orange1.1g015632m.g.KEGG.heir.tar.gz"
  class="internal"
  title="Citrus sinensis-orange1.1g015632m.g.KEGG.heir.tar.gz">Citrus
  sinensis-orange1.1g015632m.g.KEGG.heir.tar.gz</a>
- <a
  href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e8/Blastx_citrus_sinensis-orange1.1g015632m.g.fasta.0_vs_uniprot_sprot.fasta.out"
  class="internal"
  title="Blastx citrus sinensis-orange1.1g015632m.g.fasta.0 vs uniprot sprot.fasta.out">Blastx
  citrus sinensis-orange1.1g015632m.g.fasta.0 vs uniprot
  sprot.fasta.out</a>
- <a
  href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/24/Blastx_citrus_sinensis-orange1.1g015632m.g.fasta.0_vs_nr.out"
  class="internal"
  title="Blastx citrus sinensis-orange1.1g015632m.g.fasta.0 vs nr.out">Blastx
  citrus sinensis-orange1.1g015632m.g.fasta.0 vs nr.out</a>

Download these files to the `/var/www/sites/default/files` directory. To
do so quickly run these commands:

```enter
  cd /var/www/sites/default/files
  # Note that these files no longer exist!
  wget http://gmod.org/mediawiki/images/0/0c/Citrus_sinensis-orange1.1g015632m.g.iprscan.xml
  wget http://gmod.org/mediawiki/images/1/13/Citrus_sinensis-orange1.1g015632m.g.KEGG.heir.tar.gz
  wget http://gmod.org/mediawiki/images/e/e8/Blastx_citrus_sinensis-orange1.1g015632m.g.fasta.0_vs_uniprot_sprot.fasta.out
  wget http://gmod.org/mediawiki/images/2/24/Blastx_citrus_sinensis-orange1.1g015632m.g.fasta.0_vs_nr.out
```

#### Loading Blast Results

##### Configuring Blast Databases

Now that we have our features loaded we want to add some functional data
as well. We need to create a new analysis page for our blast results.
The **Tripal Blast Analysis** extension module will parse blast results
and load them into Chado after a blast analysis page is created.
However, before we create the page we need to ensure that the blast
module can properly parse the blast hits. To do this, navigate to
**Administer** → **Tripal Management** → **Analyses** → **Blast
Settings**. The following page will appear.

<a href="../File:Tripal-Blast-Settings.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/48/Tripal-Blast-Settings.png/800px-Tripal-Blast-Settings.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/48/Tripal-Blast-Settings.png/1200px-Tripal-Blast-Settings.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/48/Tripal-Blast-Settings.png 2x"
width="800" height="489" alt="Tripal-Blast-Settings.png" /></a>

This page allows you to specify a different, more meaningful name for
the database. This name will be displayed with blast results. You can
also provide regular expressions for parsing blast hits. For example,
the following is an line for a match from SwissProt:

```enter
sp|P43288|KSG1_ARATH Shaggy-related protein kinase alpha OS=Arabidopsis thaliana GN=ASK1 PE=2 SV=3
```

Here the hit name is "KSG1_ARATH", the accession is "P43288", the hit
description is "Shaggy-related protein kinase alpha OS=Arabidopsis
thaliana" and the organism is "Arabidopsis thaliana". We need regular
expressions to tell Tripal how to extract these unique parts from the
match text. Because Tripal is a PHP application, the syntax for regular
expressions follows the PHP method. Documentation for regular PHP
expressions can be found
<a href="http://php.net/manual/en/reference.pcre.pattern.syntax.php"
class="external text" rel="nofollow">here</a>. The following regular
expressions can be used to extract the hit name, the accession, hit
description and organism for the example SwissProt line above:

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Element</th>
<th>RE</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Hit Name</td>
<td><pre><code>^sp\|.*?\|(.*?)\s.*?$</code></pre></td>
</tr>
<tr class="even">
<td>Hit Description</td>
<td><pre><code>^sp\|.*?\|.*?\s(.*)$</code></pre></td>
</tr>
<tr class="odd">
<td>Hit Accession</td>
<td><pre><code>^sp\|(.*?)\|.*?\s.*?$</code></pre></td>
</tr>
<tr class="even">
<td>Hit Organism</td>
<td><pre><code>^.*?OS=(.*?)\s\w\w=.*$</code></pre></td>
</tr>
</tbody>
</table>

In this tutorial, we will be adding blast results for the two databases
we created earlier in the tutorial: ExPASy SwissProt and NCBI nr. First,
select ExPASy SwissProt from the drop-down menu, and add the following
values to the fields.

- Title for the blast analysis: (leave blank)
- Regular expression for Hit Name: ^sp\\.\*?\\(.\*?)\s.\*?\$
- Regular expression for Hit Description: ^sp\\.\*?\\.\*?\s(.\*)\$
- Regular expression for Hit Accession: ^sp\\(.\*?)\\.\*?\s.\*?\$
- Regular expression for Organism: ^.\*?OS=(.\*?)\s\w\w=.\*\$
- Organism Name: (leave blank)

Click **Save Settings**.

**Note:** The match accession will be used for building web links to the
external database. The accession will be appended to the **URL Prefix**
set earlier when the database record was first created.

Now select the NCBI nr database from the drop-down and click the radio
button. NCBI databases use a format that is compatible with blast.
Therefore, the hit name, accession and description are handled
differently in the BLAST XML results. To correctly parse results from an
NCBI database click the **Use Genebank style parser** checkbox. This
should disable all other fields and is all we need for this database.

##### Load the Blast Results

Now we can create out analysis page. Navigate to **Create Content** page
and select the **Analysis: Blast** content type. Add the following
values for this analysis. In the fields set the following values:

- Analysis Name: blastx Citrus sinensis v1.0 genes vs ExPASy SwissProt
- Program: blastall
- Program Version: 2.2.25
- Algorithm: blastx
- Source name: C. sinensis mRNA vs ExPASy SwissProt
- Time Executed: (today's date)
- Materials & Methods: C. sinensis mRNA sequences were BLAST'ed against
  the ExPASy SwissProt protein database using a local installation of
  BLAST on in-house linux server. Expectation value was set at 1e-6
- Blast Settings
  - Database: ExPASy SwissProt
  - Blast XML File/Directory:
    /var/www/sites/default/files/Blastx_citrus_sinensis-orange1.1g015632m.g.fasta.0_vs_uniprot_sprot.fasta.out
  - Parameters: -p blastx -e 1e-6 -m 7
  - Submit a job to parse the XML output: checked
  - Keywords for custom search: checked

Click the **Save** button. You can now see our new Analysis.

<a href="../File:Tripal-Analysis-Blast.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/21/Tripal-Analysis-Blast.png/800px-Tripal-Analysis-Blast.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/21/Tripal-Analysis-Blast.png/1200px-Tripal-Analysis-Blast.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/21/Tripal-Analysis-Blast.png 2x"
width="800" height="489" alt="Tripal-Analysis-Blast.png" /></a>

Now we need to manually run the job to parse the Blast results:

```enter
cd /var/www
drush trpjob-run administrator
```

The results should now be loaded. if we visit our feature page, for
feature 'orange1.1g015615m'
(<a href="http://localhost/orange1.1g015615m" class="external free"
rel="nofollow">http://localhost/orange1.1g015615m</a>) we should now see
blast results by clicking the 'ExPASy SwissProt' link on the right
sidebar:

<a href="../File:Tripal-Blast-Results.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/ed/Tripal-Blast-Results.png/800px-Tripal-Blast-Results.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/ed/Tripal-Blast-Results.png/1200px-Tripal-Blast-Results.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ed/Tripal-Blast-Results.png 2x"
width="800" height="489" alt="Tripal-Blast-Results.png" /></a>

Now we want to add the results for NCBI nr. Repeat the steps above to
add a new analysis with the following details:

- Analysis Name: blastx Citrus sinensis v1.0 genes vs NCBI nr
- Program: blastall
- Program Version: 2.2.25
- Algorithm: blastx
- Source name: C. sinensis mRNA vs NCBI nr
- Time Executed: (today's date)
- Materials & Methods: C. sinensis mRNA sequences were BLAST'ed against
  the NCBI nr protein database using a local installation of BLAST on
  in-house linux server. Expectation value was set at 1e-6
- Blast Settings
  - Database: NCBI nr
  - Blast XML File/Directory:
    /var/www/sites/default/files/Blastx_citrus_sinensis-orange1.1g015632m.g.fasta.0_vs_nr.out
  - Parameters: -p blastx -e 1e-6 -m 7
  - Submit a job to parse the XML output: checked
  - Keywords for custom search: checked

Click the **Save** button and manually run the job:

```enter
cd /var/www
drush trpjob-run administrator
```

Return to the example feature page to view the newly added results:
<a href="http://localhost/orange1.1g015615m" class="external free"
rel="nofollow">http://localhost/orange1.1g015615m</a>

#### Loading InterProScan Results

Now we want to load results from an InterProScan. For this tutorial,
these results were obtained by using a local installation of
InterProScan installed on a computational cluster. However, you may
choose to use Blast2GO or the online InterProScan utility. Results
should be saved in XML format.

To create an analysis, navigate to the **Create Content** page and
select the content type **Analysis: Interpro**. Add the following values
for this analysis

- Analysis Name: InterPro Annotations of C. sinensis v1.0
- Program: InterProScan
- Program Version: 4.8
- Algorithm: iprscan
- Source name: C. sinensis v1.0 mRNA
- Time Executed: (today's date)
- Materials & Methods: C. sinensis mRNA sequences were mapped to IPR
  domains and GO terms using a local installation of InterProScan
  executed on a computational cluster. InterProScan date files used were
  MATCH_DATA_v32, DATA_v32.0 and PTHR_DATA v31.0.
- InterPro Settings
  - InterProScan XML File/Directory:
    /var/www/sites/default/files/Citrus_sinensis-orange1.1g015632m.g.iprscan.xml
  - Check the box 'Submit a job to parse the Interpro XML output'
  - Check the box 'Load GO terms'
  - Parameters: iprscan -cli -goterms -ipr -format xml

Click the **Save** button. You can now see our new Analysis.

<a href="../File:Triapl-InterPro-Analysis.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/6a/Triapl-InterPro-Analysis.png/800px-Triapl-InterPro-Analysis.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/6a/Triapl-InterPro-Analysis.png/1200px-Triapl-InterPro-Analysis.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/6a/Triapl-InterPro-Analysis.png 2x"
width="800" height="489" alt="Triapl-InterPro-Analysis.png" /></a>

Now we need to manually run the job to parse the Inetpro results:

```enter
cd /var/www
drush trpjob-run administrator
```

The results should now be loaded. if we visit our feature page,
<a href="http://localhost/orange1.1g015615m" class="external free"
rel="nofollow">http://localhost/orange1.1g015615m</a>, we should now see
interpro results by clicking on the "Interpro Report" link on the right
sidebar.

<a href="../File:Tripal-Interpro-Results.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7d/Tripal-Interpro-Results.png/800px-Tripal-Interpro-Results.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7d/Tripal-Interpro-Results.png/1200px-Tripal-Interpro-Results.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/7d/Tripal-Interpro-Results.png 2x"
width="800" height="489" alt="Tripal-Interpro-Results.png" /></a>

#### Viewing GO Terms

When we setup the InterPro analysis we requested that it parse GO terms
from the InterProScan results. As a result, we now have a new **GO
Assignments** item in the **Resources** sidebar. For our example feature
(<a href="http://localhost/orange1.1g015615m" class="external free"
rel="nofollow">http://localhost/orange1.1g015615m</a>), the results are
as follows:

<a href="../File:Tripal-GO-Results.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/c3/Tripal-GO-Results.png/800px-Tripal-GO-Results.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/c3/Tripal-GO-Results.png/1200px-Tripal-GO-Results.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c3/Tripal-GO-Results.png 2x"
width="800" height="489" alt="Tripal-GO-Results.png" /></a>

Because we now have GO terms associated with features we can setup the
GO report that appears on the organism page. Navigate to the Citrus
sinensis organism page and click the **Go Analysis Reports** in the
**Resources** sidebar. A page appears with instructions to the site
administrator that gives details to make the report visible.

<a href="../File:Triapl-GO-Report-NotSetup.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/83/Triapl-GO-Report-NotSetup.png/800px-Triapl-GO-Report-NotSetup.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/83/Triapl-GO-Report-NotSetup.png/1200px-Triapl-GO-Report-NotSetup.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/83/Triapl-GO-Report-NotSetup.png 2x"
width="800" height="489" alt="Triapl-GO-Report-NotSetup.png" /></a>

Follow the instructions as presented on the page. Briefly, you need to

1.  Set the CV term paths for the three GO vocabularies. This should
    have been done automatically when you loaded the Gene Ontology
    earlier in the Tutorial.
2.  Populate the **go_count_analysis** materialized view.

When complete the following report will be visible:

<a href="../File:Tripal-GO-Report.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d8/Tripal-GO-Report.png/800px-Tripal-GO-Report.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d8/Tripal-GO-Report.png/1200px-Tripal-GO-Report.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d8/Tripal-GO-Report.png 2x"
width="800" height="447" alt="Tripal-GO-Report.png" /></a>

The GO report provides pie charts and an expandable tree for browsing
results. Clicking on a GO term in the true will cause a box to appear
with details about the term and a link to download a FASTA file of all
features annotated with the term. Notice that the graphs are quite
simple and the graph for the **cellular component** is missing. This is
because we only loaded GO assignments for a single gene.

#### Loading KEGG Analysis Results

Now we want to load results from a KEGG/KAAS analysis
(<a href="http://www.genome.ad.jp/tools/kaas/" class="external free"
rel="nofollow">http://www.genome.ad.jp/tools/kaas/</a>). The KAAS server
receives as input a FASTA file of sequences and annotates those with
KEGG terms. The tool also generates an hierarchy (heir) output file.
This output file can be read directly by the Tripal Analysis KEGG
module.

To create an analysis, navigate to the **Create Content** page and
select the content type **Analysis: KEGG**. Add the following values for
this analysis

- Analysis Name: KEGG analysis of C. sinensis v1.0
- Program: KEGG Automatic Annotation Server (KAAS)
- Program Version: 1.64a
- Source name: C. sinensis v1.0 genes
- Time Executed: (todays date)
- Materials & Methods: C. sinensis mRNA sequences were uploaded to the
  KEGG Automatic Annotation Server (KAAS) where they were mapped to KEGG
  pathways and orthologs. The SBH (single-directional best hit) was used
  with the genes data set being the defaults for genes.
- KEGG Settings
  - KAAS hier.tar.gz Output File:
    /var/www/sites/default/files/Citrus_sinensis-orange1.1g015632m.g.KEGG.heir.tar.gz
  - Check the box "Submit a job to parse the kegg output into Chado"

Click the **Save** button. You can now see our new Analysis.

<a href="../File:Tripal-KEGG-Analysis.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/50/Tripal-KEGG-Analysis.png/800px-Tripal-KEGG-Analysis.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/50/Tripal-KEGG-Analysis.png/1200px-Tripal-KEGG-Analysis.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/50/Tripal-KEGG-Analysis.png 2x"
width="800" height="489" alt="Tripal-KEGG-Analysis.png" /></a>

Now we need to manually run the job to parse the KEGG results:

```enter
cd /var/www;
drush trpjob-run administrator
```

**Note:** currently in the development version of Tripal there is a bug
where the KEGG data is not loaded when the job runs. You must run the
job a second time for the KEGG results to be loaded. To do this, edit
the analysis by clicking the **Edit** tab at the top of the analysis,
re-check the box titled "Submit a job to parse the kegg output into
Chado", click **Save** and then re-run the job.

If we navigate to our feature page
(<a href="http://localhost/orange1.1g015615m" class="external free"
rel="nofollow">http://localhost/orange1.1g015615m</a>) we can now see
the KEGG results by clicking the **KEGG Assignments** link in the
**Resources** sidebar.

<a href="../File:Tripal-KEGG-Results.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/50/Tripal-KEGG-Results.png/800px-Tripal-KEGG-Results.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/50/Tripal-KEGG-Results.png/1200px-Tripal-KEGG-Results.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/50/Tripal-KEGG-Results.png 2x"
width="800" height="489" alt="Tripal-KEGG-Results.png" /></a>

Similar to the GO report. A KEGG report is also available on the analysis
and the organism page. Navigate to the _Citrus sinensis_ organism page
and click the **KEGG Analysis Reports** in the **Resources** sidebar. A
page with instructions is visible:

<a href="../File:Tripal-KEGG-Report-PRE.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/63/Tripal-KEGG-Report-PRE.png/800px-Tripal-KEGG-Report-PRE.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/63/Tripal-KEGG-Report-PRE.png/1200px-Tripal-KEGG-Report-PRE.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/63/Tripal-KEGG-Report-PRE.png 2x"
width="800" height="489" alt="Tripal-KEGG-Report-PRE.png" /></a>

Follow the instructions on the page. Because we have already loaded the
data we only need to popluate the **kegg_by_organism** materialized
view. After populating the view we can now return to the organism page
and view the KEGG report:

<a href="../File:Tripal-KEGG-Results-After.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/00/Tripal-KEGG-Results-After.png/800px-Tripal-KEGG-Results-After.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/00/Tripal-KEGG-Results-After.png/1200px-Tripal-KEGG-Results-After.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/00/Tripal-KEGG-Results-After.png 2x"
width="800" height="489" alt="Tripal-KEGG-Results-After.png" /></a>

Site visitors can browse KEGG results by expanding the trees
corresponding to the the Brite terms.

### Adding New Resources To Pages

Each page created by Tripal tends to have a **Resources** sidebar. We've
seen this for the analysis, organism and feature pages. In some cases we
may want to add new items to the resources sidebar. In the case of our
_Citrus sinensis_ organism we want to add a **Downloads** link to the
organism page for relevant data. We do this using the Content
Construction Kit (CCK). The CCK is a 3rd-path Drupal module that allows
new fields to be added to any content. Using the CCK we will add new
fields to our organism page which Tripal will recognize as new
resources.

Earlier in the tutorial we installed the CCK, but for review, we can do
so easily using drush:

```enter
drush pm-enable content
drush pm-enable text
drush pm-enable number
```

Now, navigate to **Administer** → **Content management** → **Content
Types**. The following page appears:

<a href="../File:Tripal-Content-types.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/51/Tripal-Content-types.png/800px-Tripal-Content-types.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/51/Tripal-Content-types.png/1200px-Tripal-Content-types.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/51/Tripal-Content-types.png 2x"
width="800" height="489" alt="Tripal-Content-types.png" /></a>

Beside the **Organism** content type, click on the link **manage
fields**. The field editor page appears:

<a href="../File:Tripal-CCK-ManageFields.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/8e/Tripal-CCK-ManageFields.png/800px-Tripal-CCK-ManageFields.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/8e/Tripal-CCK-ManageFields.png/1200px-Tripal-CCK-ManageFields.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8e/Tripal-CCK-ManageFields.png 2x"
width="800" height="489" alt="Tripal-CCK-ManageFields.png" /></a>

We need to add three specific fields. In the form elements just below
the existing fields, add the following values in the **New field**
section:

- Label: Resource Titles
- Field: resource_titles
- Type of data to store: Text
- Form element to edit the data: Text Field

**Important**: be sure to spell the field name correctly.

Click **Save** button and the following field setup page appears:

<a href="../File:Tripal-CCK-FieldSetup.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e6/Tripal-CCK-FieldSetup.png/800px-Tripal-CCK-FieldSetup.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e6/Tripal-CCK-FieldSetup.png/1200px-Tripal-CCK-FieldSetup.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e6/Tripal-CCK-FieldSetup.png 2x"
width="800" height="489" alt="Tripal-CCK-FieldSetup.png" /></a>

On this page, leave all fields as default except one. Set the number of
values to **Unlimited** and click the **Save field settings** button. We
can now see the new field:

<a href="../File:Tripal-CCK-Field-RT.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1e/Tripal-CCK-Field-RT.png/800px-Tripal-CCK-Field-RT.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1e/Tripal-CCK-Field-RT.png/1200px-Tripal-CCK-Field-RT.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/1e/Tripal-CCK-Field-RT.png 2x"
width="800" height="489" alt="Tripal-CCK-Field-RT.png" /></a>

Finally, we don't want this field to show up on the page but rather we
want Tripal to handle it. If Tripal sees a field with the name
'field_resource_titles' it will automatically add it to the
**Resources** sidebar and hence we do not need Drupal to display it. To
exclude the field, click the **Display fields** tab. On this page there
are two checkboxes, each under a column titled 'Exclude'. Check both
checkboxes and then click the **Save** button.

<a href="../File:Tripal-CCK-Field-RT.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1e/Tripal-CCK-Field-RT.png/800px-Tripal-CCK-Field-RT.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1e/Tripal-CCK-Field-RT.png/1200px-Tripal-CCK-Field-RT.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/1e/Tripal-CCK-Field-RT.png 2x"
width="800" height="489" alt="Tripal-CCK-Field-RT.png" /></a>

Next, we need to add a second field to accompany the new field we just
created. These two fields will work in conjunction with each other. One
will serve as the title for the content and will appear on the resources
sidebar as the link, and the other will house the content that will
appear when the link is clicked. Follow the same steps as described
previously to create a new field:

- Label: Resource Blocks
- Field: resource_blocks
- Type of data to store: Text
- Form element to edit the data: Text area (multiple rows)

Click **Save**, then set the following:

- Number of values: Unlimited
- Text processing: Filtered text (user selects input format)

Remember to click **Display fields** tab to exclude this field from
display.

We now have two fields that allow us to add new content to the pages,
one lets us provide a title and the other allows us to provide content.
Suppose we also want to simply add links to the resources sidebar. We
can do this with a third field. Add the following new field:

- Label: Resource Links
- Field: resource_links
- Type of data to store: Text
- Form element to edit the data: Text Field

On the settings page set:

- Number of values: Unlimited

Don't forget to exclude this field as well!

Finally, we want to group these fields together. Otherwise, when editing
the organism page these fields may not be next to each other. We can do
this using the same form we used to add new fields. But this time we
will add a group. Under the **New group** section add the following
group:

- Label: Additional Resources
- group: resources

Click 'Save'. We should now have a new group entry in bold text. We can
use the cross-hairs next to each field and drag and drop the fields we
want into the new group. Do this with the Resource Titles, Resource
Blocks and Resource Links fields--in that order. When done it should
look as follows:

<a href="../File:Tripal-v1.1_resource_group.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/16/Tripal-v1.1_resource_group.png/800px-Tripal-v1.1_resource_group.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/16/Tripal-v1.1_resource_group.png/1200px-Tripal-v1.1_resource_group.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/16/Tripal-v1.1_resource_group.png 2x"
width="800" height="513" alt="Tripal-v1.1 resource group.png" /></a>

Click the **Save** button.

In summary, we created three new fields that will appear on our organism
page. Tripal will recognize these new field names (e.g.
field_resource_titles, field_resources_blocks and field_resource_links)
and will automatically put new items on the **Resources** sidebar for
titles and links. The resource blocks are then the text content that
corresponds to the titles.

Now, we can return to our _Citrus sinensis_ organism page, and click the
'Edit' tab at the top. Scroll to the section titled **Additional
Resources** to see our newly added fields.

<a href="../File:Tripal-v1.1_org_edit_resources.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e7/Tripal-v1.1_org_edit_resources.png/800px-Tripal-v1.1_org_edit_resources.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e7/Tripal-v1.1_org_edit_resources.png/1200px-Tripal-v1.1_org_edit_resources.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e7/Tripal-v1.1_org_edit_resources.png 2x"
width="800" height="513" alt="Tripal-v1.1 org edit resources.png" /></a>

We will use these fields to add a link to the Phytozome page for Citrus
sinensis and also a Downloads block that will allow the site visitor to
download all of the data files we used in this tutorial. First, add the
following text to the **Resource Links** text box:

```enter
C sinensis at Phytozome|http://www.phytozome.net/search.php?method=Org_Csinensis
```

The title that will appear in the sidebar occurs before the '\|'
character. The link comes after. Now we want to add our downloads page.
In the **Resource Titles** field add the text, 'Downloads'. Then in the
text area under **Resource Blocks** add the following text:

```enter
<p>The following annotation files are available for download:</p>
<b>Structural Annotations</b>
<table>
  <tr>
    <th>C. sinensis v1.0 scaffolds (FASTA format)</th>
    <td><a href="/sites/default/files/citrus_sinensis-scaffold00001.fasta">citrus_sinensis-scaffold00001.fasta</a></td>
  </tr>
  <tr>
    <th>C. siensis v1.0 genes sequences (FASTA format)</th>
    <td><a href="/sites/default/files/citrus_sinensis-orange1.1g015632m.g.fasta">citrus_sinensis-orange1.1g015632m.g.fasta</a></td>
  </tr>
  <tr>
    <th>C. siensis v1.0 genes (GFF3 format)</th>
    <td><a href="/sites/default/files/citrus_sinensis-orange1.1g015632m.g.gff3">citrus_sinensis-orange1.1g015632m.g.gff3</a></td>
  </tr>
</table>

<b>Functional Annotations</b>
<table>
  <tr>
    <th>Blast of C. sinensis v1.0 mRNA vs NCBI nr (XML format)</th>
    <td><a href="/sites/default/files/blastx_citrus_sinensis-orange1.1g015632m.g.fasta.0_vs_nr.out">blastx_citrus_sinensis-orange1.1g015632m.g.fasta.0_vs_nr.out</a></td>
  </tr>
  <tr>
    <th>Blast of C. sinensis v1.0 mRNA vs ExPASy SwissProt (XML format)</th>
    <td><a href="/sites/default/files/blastx_citrus_sinensis-orange1.1g015632m.g.fasta.0_vs_uniprot_sprot.fasta.out">blastx_citrus_sinensis-orange1.1g015632m.g.fasta.0_vs_uniprot_sprot.fasta.out</a></td>
  </tr>
  <tr>
    <th>InterPro analysis of C. sinensis v1.0 mRNA (XML format)</th>
    <td><a href="/sites/default/files/citrus_sinensis-orange1.1g015632m.g.iprscan.xml">citrus_sinensis-orange1.1g015632m.g.iprscan.xml</a></td>
  </tr>
  <tr>
    <th>KEGG analysis of C. sinensis v1.0 mRNA (KEGG heir format)</th>
    <td><a href="/sites/default/files/citrus_sinensis-orange1.1g015632m.g.KEGG.heir.tar.gz">citrus_sinensis-orange1.1g015632m.g.KEGG.heir.tar.gz</td>
  </tr>
</table>
```

**Note:**: Above we added raw HTML for our downloads block. However, if
you prefer, the **ckeditor** module can configured so you do not need to
use HTML.

Click **Save**. Now, the link to Phytozome is present in the
**Resources** sidebar and the Download block appears as follows:

<a href="../File:Tripal-Downloads.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/be/Tripal-Downloads.png/800px-Tripal-Downloads.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/be/Tripal-Downloads.png/1200px-Tripal-Downloads.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/be/Tripal-Downloads.png 2x"
width="800" height="489" alt="Tripal-Downloads.png" /></a>

Because we set the fields to be unlimited in number you can add as many
links or titles with blocks as you like by editing the organism page and
adding more. Be sure that the order of the Titles and blocks correspond
with each other.

Finally, we can add resources for all Tripal content types (e.g.
Analysis, Feature, etc.) However, because we have already created the
CCK fields we don't need to create them again. We simply reuse them on
the other content types. For example, if we were to add these same
fields to the **Analysis** content type, a new section appears when
managing the fields called **Existing field**.

<a href="../File:Tripal-CCK-Reuse.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d9/Tripal-CCK-Reuse.png/800px-Tripal-CCK-Reuse.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d9/Tripal-CCK-Reuse.png/1200px-Tripal-CCK-Reuse.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d9/Tripal-CCK-Reuse.png 2x"
width="800" height="489" alt="Tripal-CCK-Reuse.png" /></a>

We can use this new section to add the three fields we created
previously to the **Analysis** content type. For consistency we should
use the same name for the label. And we should group these fields
together as well.

### Linking to Resource Blocks

As mentioned previously, each Tripal page typically has a **Resources**
sidebar. In the previous section we learned how to add custom items to
the sidebar using CCK fields. In some cases, we may want to link
directly to these resource blocks. For example, the URL for our _Citrus
sinensis_ page has been:

    http://localhost/node/2

On that page we have a feature browser, KEGG reports, GO reports, a data
type summary and now we have a new Downloads block.

Suppose we want to have a new **Downloads** page that will provide links
to all of the downloadable content on our site. We have downloadable
content on our citrus page, but, it would be confusing if on our new
**Downloads** page, we simply had a link to our organism page and
expected users to click the **Downloads** link in the sidebar. What we
really need is a link directly to the **Downloads** block on the _Citrus
sinensis_ page.

To create this link, first right-click on the link in the **Resources**
sidebar and copying the link address. Paste the link in a text-editor so
you can see the full URL. For this tutorial, the new Downloads link is

    http://localhost/node/2#tripal_organism-resource_0-box

Notice the text after the hash symbol: tripal_organism-resource_0-box.
If you split that text into three pieces, using the dash as a delimiter,
then the second text (resource_0) is the text we will use to build the
link. The direct link to the **Downloads** block on our organism page is
then the concatenation of the URL for our species page with this text in
the following way:

    http://localhost/node/2?block=resource_0

Notice, that we added the suffix '?block=' followed by the text
'resource_0' to our original organism link. You can create links to any
block on the **Resources** sidebar using this method. As another
example, here is the direct link to the data type summary block on our
organism page:

    http://localhost/node/2?block=feature_counts

Suppose we do not want our organism page to have `node/2` in the URL,
but rather we want the name of the species in our URL. If we edit our
organism and set the **URL path settings** to be

    species/citrus_sinensis

The URL for our organism page now becomes:

    http://localhost/species/citrus_sinensis

We can still use the same scheme described above to link to the resource
blocks, but using the new URL for our species:

    http://localhost/species/citrus_sinensis?block=resource_0
    http://localhost/species/citrus_sinensis?block=feature_counts

### Adding Publications

Tripal v1.1 provides a new interface for automatically and manually
adding publications. First we will manually add a new publication. To do
this, we must first enable the Tripal Pub module. The Tripal Pub module
can be installed using the site's Modules page at **Administer** →
**Site Building** → **Modules**, or using Drush. We have previously used
Drush to install modules in this tutorial and the commands to install
the Tripal Pub module are similar:

```enter
cd /var/www
drush pm-enable tripal_pub
```

You should see the following output in the terminal:

    The following extensions will be enabled: tripal_pub, tripal_contact
    Do you really want to continue? (y/n): y
    tripal_contact was enabled successfully.                                                                   [ok]
    tripal_pub was enabled successfully.                                                                       [ok]
    The directory sites/default/files/tripal/tripal_pub has been created.                                      [status]
    Job 'Load OBO Tripal Publication' submitted.  Check the jobs page for status                               [status]
    The directory sites/default/files/tripal/tripal_contact has been created.                                  [status]
    Job 'Load OBO Tripal Contacts' submitted.  Check the jobs page for status                                  [status]

You will notice that the Tripal Contact module was also installed, and
two jobs were submitted. These jobs will load a contact and publication
ontology. The Tripal Contact and Pub ontologies are custom vocabularies
used for organizing information about publications and contact
information. So, before we can add publications (or contacts) we need to
run these jobs:

```enter
cd /var/www
drush trpjob-run administrator
```

**Note**: Always remember to set permissions for any new modules that
are installed. Permissions can be set at **Administer** → **User
Management** → **Permissions**. For this tutorial we do not need to set
permissions because we are logging on using the **administrator**
account, but for a real site permissions are necessary.

#### Manually Adding a Publication

Now that the Tripal publication and contact ontologies are loaded we can
add publications. First, we will manually add a publication. Navigate to
**Create Content** and click **Publication**.

<a href="../File:Tripal-v1.1_create_publication.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/0d/Tripal-v1.1_create_publication.png/800px-Tripal-v1.1_create_publication.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/0d/Tripal-v1.1_create_publication.png/1200px-Tripal-v1.1_create_publication.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/0d/Tripal-v1.1_create_publication.png 2x"
width="800" height="566" alt="Tripal-v1.1 create publication.png" /></a>

We will add information about the Tripal publication. Enter the
following values:

- Publication Title: Tripal: a construction Toolkit for Online Genome
  Databases
- Publication Type: Journal Article
- Publication Year: 2011
- Citation: Stephen Ficklin SP, Sanderson LA, Cheng CH, Staton M, Lee T,
  Cho IH, Jung S, Bett KE, Main D. Tripal: a construction Toolkit for
  Online Genome Databases. Database, Sept 2011. Vol 2011.
- Additional Details
  - Journal Name: Database
  - Abstract: As the availability, affordability and magnitude of
    genomics and genetics research increases so does the need to provide
    online access to resulting data and analyses. Availability of a
    tailored online database is the desire for many investigators or
    research communities; however, managing the Information Technology
    infrastructure needed to create such a database can be an undesired
    distraction from primary research or potentially cost prohibitive.
    Tripal provides simplified site development by merging the power of
    Drupal, a popular web Content Management System with that of Chado,
    a community-derived database schema for storage of genomic, genetic
    and other related biological data. Tripal provides an interface that
    extends the content management features of Drupal to the data housed
    in Chado. Furthermore, Tripal provides a web-based Chado installer,
    genomic data loaders, web-based editing of data for organisms,
    genomic features, biological libraries, controlled vocabularies and
    stock collections. Also available are Tripal extensions that support
    loading and visualizations of NCBI BLAST, InterPro, Kyoto
    Encyclopedia of Genes and Genomes and Gene Ontology analyses, as
    well as an extension that provides integration of Tripal with
    GBrowse, a popular GMOD tool. An Application Programming Interface
    is available to allow creation of custom extensions by site
    developers, and the look-and-feel of the site is completely
    customizable through Drupal-based PHP template files. Addition of
    non-biological content and user-management is afforded through
    Drupal. Tripal is an open source and freely available software
    package found at
    <a href="http://tripal.sourceforge.net" class="external free"
    rel="nofollow">http://tripal.sourceforge.net</a>
  - Publication Date: 2011 Sep
  - Authors: Ficklin SP, Sanderson LA, Cheng CH, Staton M, Lee T, Cho
    IH, Jung S, Bett KE, Main D
  - Volume: 2011

Our publication has been added and you should see the following page:

<a href="../File:Tripal-v1.1_manual_publication.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/2d/Tripal-v1.1_manual_publication.png/800px-Tripal-v1.1_manual_publication.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/2d/Tripal-v1.1_manual_publication.png/1200px-Tripal-v1.1_manual_publication.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2d/Tripal-v1.1_manual_publication.png 2x"
width="800" height="513" alt="Tripal-v1.1 manual publication.png" /></a>

**Note**: It seems a bug is present here. If you add additional
properties, but accidentally forget a required field when saving, you
will receive a message that the field is missing, which you can correct.
However, when you click the save button again you will receive a page
full of text and not the screen shot above. The publication was,
however, saved and you can find it by using the publication search tool
at <a href="http://localhost/find/publications" class="external free"
rel="nofollow">http://localhost/find/publications</a>. This bug will be
corrected in future updates of Tripal.

Now we have a publication page, and it is informative but it doesn't
link to the website where the publication can be found. When we created
the publication we failed to add a 'URL' as a property. Edit the page
and add a new URL property with the property **URL** with the value:

    http://database.oxfordjournals.org/content/2011/bar044.long

After saving the page, the title is now linked to the full article.

#### Searching for Publications

By default, Tripal provides a simple searching interface for many data
types (e.g. organisms, analyses, features, etc). These can be found in
the menu under **Search Biological Data**. However, the publications
search tool is not in this list. It may be there in the future, but for
now, it can be found at this URL http://\[your site
name\]/find/publications.

Clicking the search button without providing any criteria will provide a
list of all publications. For this tutorial, we only have a single
publication:

<a href="../File:Tripal-v1.1_pub_search.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/67/Tripal-v1.1_pub_search.png/800px-Tripal-v1.1_pub_search.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/67/Tripal-v1.1_pub_search.png/1200px-Tripal-v1.1_pub_search.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/67/Tripal-v1.1_pub_search.png 2x"
width="800" height="513" alt="Tripal-v1.1 pub search.png" /></a>

However, you will notice that if you try to select a criteria that
nothing is available. Tripal allows you to set which fields a user can
use as criteria. In some cases not all fields will be appropriate given
the publications available on the site. All of the properties available
when adding a publication can be searched, but some properties like the
**URL** may not be necessary for searching. You can specify which fields
to use for search criteria by navigating to **Administer** → **Tripal
Management** → **Publications** → **Configuration**. At the top of the
page you will see a section for **Searching Options**:

<a href="../File:Tripal-v1.1_pubconfig_searchoptions.png"
class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/ba/Tripal-v1.1_pubconfig_searchoptions.png/800px-Tripal-v1.1_pubconfig_searchoptions.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/ba/Tripal-v1.1_pubconfig_searchoptions.png/1200px-Tripal-v1.1_pubconfig_searchoptions.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/ba/Tripal-v1.1_pubconfig_searchoptions.png 2x"
width="800" height="513"
alt="Tripal-v1.1 pubconfig searchoptions.png" /></a>

Here you can select which properties a user can use for searching. For
this tutorial, find and check these options:

- Abstract
- Authors
- Journal Name
- Title

Then click the **Save configuration** button at the bottom. If we return
to the publication search page, we now have criteria for searching.

#### Bulk Import of Publications

Tripal supports bulk importing of publications from remote databases
such as NCBI PubMed and the USDA National Agricultural Library (AGL).
Support of PubMed is built-in to the Tripal module, but support for AGL
requires some additional setup on the server. You can find instructions
for preparing the server for AGL on the **Administer** → **Tripal
Management** → **Publications** page in the **Setup Instructions**
section. For this tutorial we will create an importer for PubMed.

Creation of an importer is an administrative function. A publication
importer is created by the site administrator and consists of a set of
search criteria for finding multiple publications at one time. When the
importer is run, it will query the remote database, retrieve the
publications that match the criteria and add them to the database.
Because we loaded genomic data for _Citrus sinensis_ we will create an
importer that will find all publications related to this species.

First, navigate to **Administer** → **Tripal Management** →
**Publications** → **Add an Importer**. You will see the following page:

<a href="../File:Tripal-v1.1_pubimporter1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/4c/Tripal-v1.1_pubimporter1.png/800px-Tripal-v1.1_pubimporter1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/4c/Tripal-v1.1_pubimporter1.png/1200px-Tripal-v1.1_pubimporter1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/4c/Tripal-v1.1_pubimporter1.png 2x"
width="800" height="513" alt="Tripal-v1.1 pubimporter1.png" /></a>

Enter the following values in the fields:

- Remote Database: PubMed
- Loader Name: Pubs for Citrus sinensis
- Criteria \#1:
  - Scope: Abstract/Title
  - Search Terms: Citrus sinensis
  - is Phrase?: checked

Now, click the 'Test Importer' button. This will connect to PubMed and
search for all publications that match our provided criteria. On the
date this portion of the tutorial was written, 473 publications were
found:

<a href="../File:Tripal-v1.1_pubimporter2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d8/Tripal-v1.1_pubimporter2.png/800px-Tripal-v1.1_pubimporter2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d8/Tripal-v1.1_pubimporter2.png/1200px-Tripal-v1.1_pubimporter2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d8/Tripal-v1.1_pubimporter2.png 2x"
width="800" height="513" alt="Tripal-v1.1 pubimporter2.png" /></a>

Now, save this importer. You should see that we have one importer in the
list:

<a href="../File:Tripal-v1.1_pubimporter3.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/88/Tripal-v1.1_pubimporter3.png/800px-Tripal-v1.1_pubimporter3.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/88/Tripal-v1.1_pubimporter3.png/1200px-Tripal-v1.1_pubimporter3.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/88/Tripal-v1.1_pubimporter3.png 2x"
width="800" height="513" alt="Tripal-v1.1 pubimporter3.png" /></a>

We can use this importer to load all 473 publications about _Citrus
sinensis_ from PubMed into our database (how to load these will be shown
later). However, what if new publications are added? We would like this
importer to be run monthly so that we can automatically add new
publications as they become available. But we do not need to try to
reload these 473 again. So, we will create a new importer that only
finds publications within the last 30 days. To do this, click the link
**Create a new publication importer** just below the list of importers.
Now, add the following criteria:

- Remote Database: PubMed
- Loader Name: Pubs for Citrus sinensis last 30 days
- Days since record modified: 30
- Criteria \#1:
  - Scope: Abstract/Title
  - Search Terms: Citrus sinensis
  - is Phrase?: checked

Now, when we test the importer we find only 2 publications that have
been add (created) in PubMed in the last 30 days:

<a href="../File:Tripal-v1.1_pubimporter4.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/68/Tripal-v1.1_pubimporter4.png/800px-Tripal-v1.1_pubimporter4.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/68/Tripal-v1.1_pubimporter4.png/1200px-Tripal-v1.1_pubimporter4.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/68/Tripal-v1.1_pubimporter4.png 2x"
width="800" height="513" alt="Tripal-v1.1 pubimporter4.png" /></a>

Save this importer.

Next, there are two ways to import these publications. The first it to
manually import them. There is a Drush command that is used for
importing publications. Return to the terminal and run the following
command:

```enter
cd /var/www
drush tpubs-import
```

You should see output to the terminal that begins like this:

    NOTE: Loading of publications is performed using a database transaction.
    If the load fails or is terminated prematurely then the entire set of
    insertions/updates is rolled back and will not be found in the database

    Importing: Pubs for Citrus sinensis

And as publications are imported each one is printed to the screen. The
importer will pause while it requests 100 publications. It will then
load those, then pause to request another 100 until it imports all
publications that match the criteria.

Some things to know about the publication importer:

1.  The importer keeps track of publications from the remote database
    using the publication accession (e.g. PubMed ID).
2.  If a publication with an accession (e.g. PubMed ID) already exists
    in the local database, the record will be updated.
3.  If a publication in the local database matches by title, journal and
    year with one that is to be imported, then the record will be
    updated. You can change the requirement of which fields to match at
    the **Administer** → **Tripal Management** → **Publications** →
    **Configuration** Page.

The second way to import publications is to add an entry to the UNIX
cron. We did this previously for the Tripal Jobs management system when
we first installed Tripal. We will add another entry for importing
publications. But first, now that we have imported all of the relevant
pubs, we need to return to the importers list at **Administer** →
**Tripal Management** → **Publications** → **Importers List** and
disable the first importer we created. We do not want to run that
importer again, as we've already imported all historical publications on
record at PubMed. Click the edit button next to the importer named
`Pubs for Citrus sinensis`, click the **disable** checkbox and then save
the template. The template should now be disabled.

<a href="../File:Tripal-v1.1_pubimporter5.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/2b/Tripal-v1.1_pubimporter5.png/800px-Tripal-v1.1_pubimporter5.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/2b/Tripal-v1.1_pubimporter5.png/1200px-Tripal-v1.1_pubimporter5.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2b/Tripal-v1.1_pubimporter5.png 2x"
width="800" height="332" alt="Tripal-v1.1 pubimporter5.png" /></a>

Now we have the importer titled `Pubs for Citrus sinensis last 30 days`
enabled. This is the importer we want to run on a monthly basis. The
cron entry will do this for us. On the terminal open the crontab with
the following command:

```enter
sudo crontab -e
```

Now add the following line to the bottom of the crontab:

```enter
30 8 1,15 * *  su - www-data -c 'cd /var/www; /usr/local/drush/drush -l http://[site url] tpubs-import --report=[your email] > /dev/null'
```

Where

- \[site url\] is the full URL of your site
- \[your email\] is the email address of the user that should receive an
  email containing a list of publications that were imported. You can
  separate multiple email addresses with a comma.

The cron entry above will launch the importer at 8:30am on the first and
fifteenth days of the month. We will run this importer twice a month in
the event it fails to run (e.g. server is down) at least one time during
the month.

### Drupal Views Integration

#### Editing Existing Views

<a href="https://drupal.org/project/views" class="external text"
rel="nofollow">Drupal Views</a> is a powerful 3rd-party module that
allows an authorized user to query database tables in novel and unique
ways and to create custom pages and search forms. Tripal has fully
integrated the Chado database tables with Drupal Views. The basic search
tools available under the **Search Biological Data** are all Drupal
Views. As a brief introduction to views we will examine one of these
views and customize it. In order to use Views you need a basic
understanding of the Chado tables.

First, navigate to **Administer** → **Site building** → **Views**

<a href="../File:Tripal-v1.1_views1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/41/Tripal-v1.1_views1.png/800px-Tripal-v1.1_views1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/41/Tripal-v1.1_views1.png/1200px-Tripal-v1.1_views1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/41/Tripal-v1.1_views1.png 2x"
width="800" height="488" alt="Tripal-v1.1 views1.png" /></a>

Here we see the list of the views that have already been created. All of
the active views were created automatically by Tripal modules when they
were installed. At the bottom of the page are inactive views that come
by default with the Views module. Scroll to the view titled
**feature_listing** and click the 'Edit' button to the right of it. You
will see the following page:

<a href="../File:Tripal-v1.1_feature_listing1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/aa/Tripal-v1.1_feature_listing1.png/800px-Tripal-v1.1_feature_listing1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/aa/Tripal-v1.1_feature_listing1.png/1200px-Tripal-v1.1_feature_listing1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/aa/Tripal-v1.1_feature_listing1.png 2x"
width="800" height="488" alt="Tripal-v1.1 feature listing1.png" /></a>

On this page you will see several sections: View settings, Basic
settings, Relationships, Arguments, Fields, Sort criteria, and Filters.
This tutorial will not describe all of these settings. There are
tutorials on the web that better explains these fields. For this
tutorial we will discuss only a few of them.

The **Basic settings** section provides details about how the view
behaves, such as how many records to show at one time, how the results
should be laid out on the page, etc. For example, for this view, the
results are displayed in a table format, with 50 items per page.

The **Fields** section lists the fields that will be used for the view.
For example, in this view we will be using the feature's uniquename,
name, type, organism common name and a few other fields from the Chado
feature table. We also have the node ID of the Drupal node that
corresponds to the feature.

The **Sort criteria** section lists the order in which results will be
shown. The results will be sorted by organism common name, feature type
and feature name, in that order.

The **Filters** section provides a set of criteria for limiting which
records will be shown. We want to limit the results by common name,
feature type and feature name. The filters are used to create the search
form at the top of the features search page:

<a href="../File:Tripal-Search-Features.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f1/Tripal-Search-Features.png/800px-Tripal-Search-Features.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f1/Tripal-Search-Features.png/1200px-Tripal-Search-Features.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f1/Tripal-Search-Features.png 2x"
width="800" height="448" alt="Tripal-Search-Features.png" /></a>

A single view can have multiple displays. On the left hand side is the
interface for adding additional displays:

<a href="../File:Tripal-v1.1_feature_listing_displays.png"
class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/83/Tripal-v1.1_feature_listing_displays.png"
width="157" height="255"
alt="Tripal-v1.1 feature listing displays.png" /></a>

The first item titled **features_all** provides all of the default
settings for the view. The next item titled **Page** is the page
display. If you click **Page** you will see the same sections but a new
section appears titled **Page settings**. Notice that the page settings
contains the URL path (e.g. `chado/features`) for the view. This is the
URL we use on the site to search for features (e.g.
<a href="http://localhost/chado/features" class="external free"
rel="nofollow">http://localhost/chado/features</a>). We can customize
this page by altering any of the fields. Those that are light gray and
italic are inherited from the default view settings. We can test changes
to the view using the **Live preview** section at the bottom of the view
configuration page.

**Note**: always be cautious to notice when you are editing default
settings for the entire view and settings just for a single display.

Now, suppose we do not like the way our search pages looks. Currently,
for features, when search results are returned we see the unique name,
name, feature type, common name of the organism, sequence length, if the
sequence is obsolete and the date it was accessioned. We do not want the
sequence length, or if the sequence is obsolete or the date it was
accessioned to appear in our search results. And, suppose we want the
genus and species to be listed instead of the common name. We can make
these changes by editing the view settings.

First, we need to add the genus and species as fields to show. To do
this, click the small plus in the header of the **Fields** section. A
new section towards the bottom of the setting sections will appear with
a long list of fields you can select from and a drop down to let you
filter the list:

<a href="../File:Tripal-v1.1_feature_listing_add_field.png"
class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/73/Tripal-v1.1_feature_listing_add_field.png"
width="486" height="436"
alt="Tripal-v1.1 feature listing add field.png" /></a>

In the Drop down you can see all of the **Groups** of fields associated
with features. These groups correspond to Chado tables. Select the group
**Chado Organism**. This reduces the list of fields to only those
associated with the Chado orgnaism table. Click the checkbox for **Chado
Organism: Genus** and **Chado Organism: Species** and click **Save**.

Next we see a set of configuration settings for the fields we selected.
In this case, we see configuration settings for the **Genus** field
first.

<a href="../File:Tripal-v1.1_feature_listing_add_field2.png"
class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/94/Tripal-v1.1_feature_listing_add_field2.png/800px-Tripal-v1.1_feature_listing_add_field2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/94/Tripal-v1.1_feature_listing_add_field2.png/1200px-Tripal-v1.1_feature_listing_add_field2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/94/Tripal-v1.1_feature_listing_add_field2.png 2x"
width="800" height="488"
alt="Tripal-v1.1 feature listing add field2.png" /></a>

Views will let you control a lot of how the field is seen (or not seen)
in the page results. Here we want to leave all the defaults. click the
**Update default display** button at the bottom. This will ensure that
this change is made to our current page and to the default settings as
well. The configuration settings for the **Species** field now appears.
Leave the defaults as well and click **Update default display**. Now
that we are done configuring our new fields we can preview the changes
using the **Live Preview** section. Below is a screen shot of the view
after we have added our new fields:

<a href="../File:Tripal-v1.1_feature_listing_live_preview1.png"
class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f1/Tripal-v1.1_feature_listing_live_preview1.png/800px-Tripal-v1.1_feature_listing_live_preview1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f1/Tripal-v1.1_feature_listing_live_preview1.png/1200px-Tripal-v1.1_feature_listing_live_preview1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f1/Tripal-v1.1_feature_listing_live_preview1.png 2x"
width="800" height="488"
alt="Tripal-v1.1 feature listing live preview1.png" /></a>

Now, we want to remove the unwanted fields. In the **Fields** section,
click on the field named **Chado Feature: Timeaccessioned**. A
configuration page appears similar to what we saw previously for
**Genus** and **Species**. Check the box **Exclude from display**. This
will leave the field present in the view but will not show it. Click the
**Update default display** button. Alternatively, if we no longer want
to keep this field in the view, then we could remove the field by
clicking the **Remove** button. Do the same for the common name,
sequence length and is obsolete fields. Our view now appears as follows:

<a href="../File:Tripal-v1.1_feature_listing_live_preview2.png"
class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/78/Tripal-v1.1_feature_listing_live_preview2.png/800px-Tripal-v1.1_feature_listing_live_preview2.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/78/Tripal-v1.1_feature_listing_live_preview2.png/1200px-Tripal-v1.1_feature_listing_live_preview2.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/78/Tripal-v1.1_feature_listing_live_preview2.png 2x"
width="800" height="488"
alt="Tripal-v1.1 feature listing live preview2.png" /></a>

If we click the **Save** button at the bottom, this will save all of the
changes we have made to the view and the **Features** search page under
**Search Biological Data** will be updated.

We have only touched on a few of the capabilities of the Views
interface. You can create advanced looking forms and pages using Views.

#### Adding a New View

To create a new view navigate to **Administer' _→_** _Site building
**→** Views **and click the** Add_ tab near the top of the page. Here
you see a set of fields. There are two that are required: the **View
name** and the **View type**.

<a href="../File:Tripal-v1.1_views_new.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/86/Tripal-v1.1_views_new.png/800px-Tripal-v1.1_views_new.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/86/Tripal-v1.1_views_new.png/1200px-Tripal-v1.1_views_new.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/86/Tripal-v1.1_views_new.png 2x"
width="800" height="488" alt="Tripal-v1.1 views new.png" /></a>

Suppose we want to create a 'Species' page for our site that lists all
of the available species that our site houses. To do this, enter the
following

1.  View name: all_species
2.  View type: Node

Despite that we will be creating a list of species, we select the view
type as 'Node'. This is because all nodes (nodes are pages in Drupal
lingo) have teasers. A teaser is a brief set of contents about a page
and it only shows up in certain cases. Tripal provides teasers for all
of its pages. So, we want to use the node teasers in our list of
species. If however, we wanted to use content directly from the Chado
organism table then we would have selected the view type to be **Chado
Organism**. Click the **Next** button at the bottom.

Now we see the same form we saw before when editing an existing view,
but there are no fields, sort criteria, or filters for this view. The
first thing we want to do is indicate to the view that we will be using
Node teasers. To do this, click the **Row style** link in the **Basic
Settings** section. A box appears towards the bottom with radio buttons.
Click the button for **Node** and then **Update**.

<a href="../File:Tripal-v1.1_views_row_style.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/05/Tripal-v1.1_views_row_style.png"
width="676" height="168" alt="Tripal-v1.1 views row style.png" /></a>

In the next box that appears, select **Teaser** in the drop down and
click **Update**

<a href="../File:Tripal-v1.1_views_row_style2.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/15/Tripal-v1.1_views_row_style2.png"
width="389" height="188" alt="Tripal-v1.1 views row style2.png" /></a>

Next, we want to limit the nodes that are shown to be only those for
organisms. In the **Filters** section, click the small plus in the
section header. Select **Node** in the **Groups** drop down and click
the box **Node: Type** and then click **Add**. This will allows us to
filter on the node type. A new section appears allowing you to select
which node type to filter. Check the **Organism** box and click
**Update**

<a href="../File:Tripal-v1.1_views_filter1.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fa/Tripal-v1.1_views_filter1.png"
width="783" height="378" alt="Tripal-v1.1 views filter1.png" /></a>

Next we want to sort the list by title so that our species are in
alphabetical order. In the **Sort criteria** section. In the settings
select the group **Node**, check the box **Node: Title** and click the
**Add** button. Then choose **Ascending** and click **Update**. We now
have a sorted list of species showing up in the **Live preview**
section:

<a href="../File:Tripal-v1.1_views_species_previiew1.png"
class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/5e/Tripal-v1.1_views_species_previiew1.png/800px-Tripal-v1.1_views_species_previiew1.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/5e/Tripal-v1.1_views_species_previiew1.png/1200px-Tripal-v1.1_views_species_previiew1.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5e/Tripal-v1.1_views_species_previiew1.png 2x"
width="800" height="488"
alt="Tripal-v1.1 views species previiew1.png" /></a>

Notice in the **Basic settings'** section that were are limiting the
view to only show 10 items (see the **items to display** setting). If we
ever have more than 10 species we will want to increase that number, or
we will want to add a pager. A pager is an interface that appears at the
bottom of the page that will allow a visitor to cycle between pages of
content. If we have more than 10 species then the first page will show
the first 10 species and an interface will be provided to let the user
scroll to the next set of 10, etc. Click the **Use Pager** setting and
change it to be **Full pager**. The pager will not be visible unless we
have more than 10 species pages.

Finally, we want to create a display of type **Page** for this view. On
the top left-hand side of the configuration settings, just above the
**Add display** button, select **Page** in the drop down and click **Add
display**. All of the fields are now greyed and italicized indicating
this new page is inheriting all of the view settings we just created.
Also a new **Page settings** section appeared. We need a URL for this
species page so, click the **Path** setting and add the following text:

    species

This will create a page at the URL
<a href="http://localhost/species" class="external free"
rel="nofollow">http://localhost/species</a>

Next, click the **Menu** item. And add click the **NOrmal Menu Entry**
radio button, set the title to be **Species** and click **Update**:

<a href="../File:Tripal-v1.1_views_menu_setup.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/95/Tripal-v1.1_views_menu_setup.png"
width="665" height="352" alt="Tripal-v1.1 views menu setup.png" /></a>

Finally click **Save** to save this view. We now have a new menu item
named **Species** on the main menu, and if we click that menu item we
now see our new species page:

<a href="../File:Tripal-v1.1_views_new_final.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1f/Tripal-v1.1_views_new_final.png/800px-Tripal-v1.1_views_new_final.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1f/Tripal-v1.1_views_new_final.png/1200px-Tripal-v1.1_views_new_final.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/1f/Tripal-v1.1_views_new_final.png 2x"
width="800" height="488" alt="Tripal-v1.1 views new final.png" /></a>

#### Limitations of views

### Customizing The Look-and-Feel of Tripal

The default look-and-feel of data presented by Tripal is set in
Drupal-style template files. These template files can be found inside of
the Tripal theme and **theme** folder of the Tripal Extension modules.
Drupal allows you to customize the templates. For this tutorial we will
not cover customization of template files. However, a tutorial for
customizing the look-and-feel of the site using templates can be found
in the
<a href="/wiki/Tripal_Developer%27s_Handbook%7CTripal"
class="external text" rel="nofollow">Developers Handbook</a>.

### Advanced Features

#### The Tripal Bulk Loader

The Tripal Bulk Loader is a new feature added to version 1.0. Often,
data is not in common formats such as GFF, FASTA, GAF, InterPro XML,
etc., but rather in Excel spreadsheets or tab-delimited or
comma-separated files. The goal of the bulk loader is to enable a user to
load data in these formats into the Chado schema. Currently, the bulk
loader allows a site administrator to create custom loader templates
that will allow a user to load tab-delimited files of any format.

Using the bulk loader web-interface, the privileged user creates a
"template" for loading a tab-delimited file. This templates specifies
which fields in the Chado tables the values in the tab-delimited file
will be stored. Once the template is fully defined, the privilege user
saves the template for other users to use. Another user can then load
any tab-delimited files that matches the template. The user can upload
as many files as desired.

#### Creating Custom Modules

As mentioned early in the Tutorial, Tripal is a modular software package.
A Tripal API has been developed to help others who want to extend the
functionality of Tripal. Anyone is welcome to develop modules for Tripal
to suit their own needs and perhaps share them back with the community.
The Tripal API can be found on the home page:
<a href="http://tripal.sourceforge.net/" class="external free"
rel="nofollow">http://tripal.sourceforge.net/</a>. Information for
developing new module can be found in the [Tripal Developer's
Handbook](../Tripal_Developer's_Handbook "Tripal Developer's Handbook").

Modules that conform the the Tripal API and Drupal coding standards will
be officially approved by the Tripal Developers Consortium. These
modules will be listed on the Tripal website and will be available in
the Drupal module repository for download.

Anyone wishing to extend Tripal should sign up for the developers
mailing list
<a href="https://lists.sourceforge.net/lists/listinfo/gmod-tripal-devel"
class="external free"
rel="nofollow">https://lists.sourceforge.net/lists/listinfo/gmod-tripal-devel</a>
and try to attend one of the monthly developer's meetings to discuss the
desired extensions.

:

- [Tutorials](../Category%253ATutorials "Category%253ATutorials")
- [Tripal](../Category%253ATripal "Category%253ATripal")
- [GMOD Schools](../Category%253AGMOD_Schools "Category%253AGMOD Schools")

<span class="smwfactboxhead">Facts about
"<span class="swmfactboxheadbrowse"></span>"</span>

| ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | [Has topic](../Property%253AHas_topic "Property:Has topic") | [Tripal](../Tripal.1 "Tripal")  |

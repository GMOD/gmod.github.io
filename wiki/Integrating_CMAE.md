



<span id="top"></span>




# <span dir="auto">Integrating CMAE</span>









Note: This document was generated from a POD formatted document checked
in at <a
href="http://gmod.cvs.sourceforge.net/gmod/cmap/editor/Integrating_CMAE.pod?view=markup"
class="external text" rel="nofollow">sourceforge</a>. Editing will not
result in long term changes.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Integrating
  the CMap Assembly Editor (CMAE) with In-House
  Systems</span>](#Integrating_the_CMap_Assembly_Editor_.28CMAE.29_with_In-House_Systems)
- [<span class="tocnumber">2</span>
  <span class="toctext">VERSION</span>](#VERSION)
- [<span class="tocnumber">3</span>
  <span class="toctext">Overview</span>](#Overview)
- [<span class="tocnumber">4</span> <span class="toctext">Installing
  CMAE</span>](#Installing_CMAE)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Download
    CMap</span>](#Download_CMap)
  - [<span class="tocnumber">4.2</span> <span class="toctext">Install
    Pre-Requisites</span>](#Install_Pre-Requisites)
    - [<span class="tocnumber">4.2.1</span> <span class="toctext">CMap
      Pre-Requisites</span>](#CMap_Pre-Requisites)
    - [<span class="tocnumber">4.2.2</span> <span class="toctext">CMAE
      Pre-Requisites</span>](#CMAE_Pre-Requisites)
  - [<span class="tocnumber">4.3</span> <span class="toctext">Install
    CMap</span>](#Install_CMap)
  - [<span class="tocnumber">4.4</span> <span class="toctext">Create the
    Database</span>](#Create_the_Database)
  - [<span class="tocnumber">4.5</span> <span class="toctext">Create the
    configuration files</span>](#Create_the_configuration_files)
- [<span class="tocnumber">5</span> <span class="toctext">Importing
  Data</span>](#Importing_Data)
- [<span class="tocnumber">6</span> <span class="toctext">Modifying
  Data</span>](#Modifying_Data)
- [<span class="tocnumber">7</span>
  <span class="toctext">Conclusion</span>](#Conclusion)
- [<span class="tocnumber">8</span>
  <span class="toctext">AUTHOR</span>](#AUTHOR)



## <span id="Integrating_the_CMap_Assembly_Editor_.28CMAE.29_with_In-House_Systems" class="mw-headline">Integrating the CMap Assembly Editor (CMAE) with In-House Systems</span>

## <span id="VERSION" class="mw-headline">VERSION</span>

\$Revision: 1.1 \$

This document is intended to give a clear idea of what it will take to
integrate the CMap Assembly Editor (CMAE) into an organizations in-house
data system.

## <span id="Overview" class="mw-headline">Overview</span>

CMAE is built upon the CMap code base. The machines that run the program
will need to have the CMap Perl modules installed (at a minimum).

CMAE uses CMap configuration files and reads data from the CMap
database. These can be on the local machine or on a web server that the
program can access.

For information on Installing CMAE see the "Installing CMAE" section of
this document.

Since, CMAE uses the CMap database, the data will have to be loaded. The
"Importing Data" section discusses what kind of data is needed and how
to use the CMap API to do data imports.

CMAE can make modifications to the data. In order for these to become
permanent outside of the CMAE environment, plug-ins need to be written
to launch external scripts to change the in-house data. For information
on this topic, see the "Modifying Data" section.

## <span id="Installing_CMAE" class="mw-headline">Installing CMAE</span>

Since CMAE uses much of the CMap code base, the CMap modules need to be
installed on each machine using it (even if the data and config files
are being served off another machine.

### <span id="Download_CMap" class="mw-headline">Download CMap</span>

Download CMap from the SourceForge CVS repository

  

     $ cvs -d:pserver:anonymous@gmod.cvs.sourceforge.net:/cvsroot/gmod login
     $ cvs -z3 -d:pserver:anonymous@gmod.cvs.sourceforge.net:/cvsroot/gmod co -P cmap

### <span id="Install_Pre-Requisites" class="mw-headline">Install Pre-Requisites</span>

CMAE (and CMap) requires a number of modules to be installed prior to
installation.

#### <span id="CMap_Pre-Requisites" class="mw-headline">CMap Pre-Requisites</span>

Running "perl Build.PL" will provide a list of missing modules, which
can be downloaded from CPAN.

A bundle can be used to install most of these at once. To use this
bundle, run:

  

     $ sudo perl -MCPAN -e "install Bundle::CMap"

The GD module requires the use of the libgd library which can be found
at <a href="http://www.libgd.org/" class="external free"
rel="nofollow">http://www.libgd.org/</a> .

#### <span id="CMAE_Pre-Requisites" class="mw-headline">CMAE Pre-Requisites</span>

In addition to the CMap requirements, CMAE requires:

- Perl/Tk (<a href="http://www.perltk.org/" class="external free"
  rel="nofollow">http://www.perltk.org/</a>)

Perl/Tk can be downloaded from CPAN,
<a href="http://search.cpan.org/~ni-s/Tk-804.027/" class="external free"
rel="nofollow">http://search.cpan.org/~ni-s/Tk-804.027/</a> .

- Tkzinc (<a href="http://www.tkzinc.org/" class="external free"
  rel="nofollow">http://www.tkzinc.org/</a>)

Zinc can render images using openGL. It can be downloaded from
<a href="http://www.tkzinc.org/tkzinc/pmwiki.php?n=Main.Download"
class="external free"
rel="nofollow">http://www.tkzinc.org/tkzinc/pmwiki.php?n=Main.Download</a>
.

  

### <span id="Install_CMap" class="mw-headline">Install CMap</span>

The install process will install CMap on the machine as well as CMAE. It
will ask you about the location of various web related directories. On a
linux system those should be easily answered.

The install process is simply:

  

     $ perl Build.PL
     $ ./Build
     $ sudo ./Build install

### <span id="Create_the_Database" class="mw-headline">Create the Database</span>

If you will be serving the data from a web page, the database only needs
to be created on the web server.

Create the CMap database schema by reading the schema file into the
database. There are schema files provided for [MySQL](MySQL "MySQL"),
Oracle, [PostgreSQL](PostgreSQL "PostgreSQL"), Sybase and SQLite. Each
is named cmap.create.dbname (e.g. cmap.create.mysql). They are in the
sql directory in the distribution.

### <span id="Create_the_configuration_files" class="mw-headline">Create the configuration files</span>

If you will be serving the data from a web page, the config files only
need to be created on the web server.

The configuration files are important to CMap (and hence CMAE). They
define which database is to be used and provide information about the
different types of maps, features and correspondence evidences in the
database.

For more information about the configuration files, see the
ADMINISTRATION.pod document in the docs/ directory.

## <span id="Importing_Data" class="mw-headline">Importing Data</span>

The simplest way to import data is with a Perl script using the CMap
API.

Using the API, the following data types will need to be created:

\- Species   
Each species that maps in the data set belong to must be entered into
the database.

\- Map Sets   
A map set is a collection of maps. The maps are of the same type
(sequence, FPC, etc) and are usually from the same analysis set. For
instance, the contigs from a particular assembly run would be in a set.

\- Maps   
Maps can represent many different data types, sequence, physical,
genetic, etc. Simply put, a map is any type of data that can be
represented as a line with features on it.

\- Features   
Features can be placed on maps. They provide the anchor points for
correspondences such as a read is one anchor for a line between read
pairs. There are also other types of features that can be used to create
banding patterns or heat maps.

\- Map_to_Features   
In order to place a map underneath another map, CMAE requires a link
between the child map and a feature on the parent. That feature
represents the exact placement of the child.

\- Correspondences   
Correspondences are links between features.

\- Attributes and External References (xrefs)   
CMap also allows for assigning attributes and external references to
it's objects (features, maps, etc). These can be useful for adding
descriptions or providing data for an external script to work on an
object (such as location of a contig's ACE file).

## <span id="Modifying_Data" class="mw-headline">Modifying Data</span>

After modifying data in CMAE, the user can save the changes to the CMap
database. However, in order to modify the underlying data, a plug-in
system has been created.

There are several hooks in the code (and more to be added) where a
plug-in can be attached. For instance, there is a plug-in hook attached
to the right click menu. A plug-in can then be written to add a button
that gets the selected maps, figures out where their ACE files are and
passes them to Consed for viewing.

A hook will be added to the "Save changes" method, so any modifications
in CMAE can be appropriately handled for the underlying data.

After modifying the underlying data, the plug-in could then modify the
data in the CMap database to be viewed in CMAE.

## <span id="Conclusion" class="mw-headline">Conclusion</span>

Hopefully, the barrier of entry for using CMAE isn't too great. Please
let me know if you see any improvements can be made. Questions and
comments can be emailed to the CMAE mailing list,
gmod-cmap@lists.sourceforge.net.

## <span id="AUTHOR" class="mw-headline">AUTHOR</span>

Ben Faga, faga@cshl.edu

Copyright (c) 2007 Cold Spring Harbor Laboratory




[Category](Special%253ACategories "Special%253ACategories"):

- [CMap](Category%253ACMap "Category%253ACMap")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Integrating_CMAE" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:53 on 23 January
  2008.</span>
<!-- - <span id="footer-info-viewcount">16,851 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





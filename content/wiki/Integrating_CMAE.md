---
title: "Integrating CMAE"
---
# Integrating CMAE

Note: This document was generated from a POD formatted document checked
in at <a
href="http://gmod.cvs.sourceforge.net/gmod/cmap/editor/Integrating_CMAE.pod?view=markup"
class="external text" rel="nofollow">sourceforge</a>. Editing will not
result in long term changes.

  the CMap Assembly Editor (CMAE) with In-House
  Systems</span>](#Integrating_the_CMap_Assembly_Editor_.28CMAE.29_with_In-House_Systems)
- [VERSION](#VERSION)
- [Overview](#Overview)
- [Installing
  CMAE](#Installing_CMAE)
  - [Download
    CMap](#Download_CMap)
  - [Install
    Pre-Requisites](#Install_Pre-Requisites)
    - [CMap
      Pre-Requisites](#CMap_Pre-Requisites)
    - [CMAE
      Pre-Requisites](#CMAE_Pre-Requisites)
  - [Install
    CMap](#Install_CMap)
  - [Create the
    Database](#Create_the_Database)
  - [Create the
    configuration files](#Create_the_configuration_files)
- [Importing
  Data](#Importing_Data)
- [Modifying
  Data](#Modifying_Data)
- [Conclusion](#Conclusion)
- [AUTHOR](#AUTHOR)

## Integrating the CMap Assembly Editor (CMAE) with In-House Systems

## VERSION

\$Revision: 1.1 \$

This document is intended to give a clear idea of what it will take to
integrate the CMap Assembly Editor (CMAE) into an organizations in-house
data system.

## Overview

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

## Installing CMAE

Since CMAE uses much of the CMap code base, the CMap modules need to be
installed on each machine using it (even if the data and config files
are being served off another machine.

### Download CMap

Download CMap from the SourceForge CVS repository



     $ cvs -d:pserver:anonymous@gmod.cvs.sourceforge.net:/cvsroot/gmod login
     $ cvs -z3 -d:pserver:anonymous@gmod.cvs.sourceforge.net:/cvsroot/gmod co -P cmap

### Install Pre-Requisites

CMAE (and CMap) requires a number of modules to be installed prior to
installation.

#### CMap Pre-Requisites

Running "perl Build.PL" will provide a list of missing modules, which
can be downloaded from CPAN.

A bundle can be used to install most of these at once. To use this
bundle, run:



     $ sudo perl -MCPAN -e "install Bundle::CMap"

The GD module requires the use of the libgd library which can be found
at <a href="http://www.libgd.org/" class="external free"
rel="nofollow">http://www.libgd.org/</a> .

#### CMAE Pre-Requisites

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



### Install CMap

The install process will install CMap on the machine as well as CMAE. It
will ask you about the location of various web related directories. On a
linux system those should be easily answered.

The install process is simply:



     $ perl Build.PL
     $ ./Build
     $ sudo ./Build install

### Create the Database

If you will be serving the data from a web page, the database only needs
to be created on the web server.

Create the CMap database schema by reading the schema file into the
database. There are schema files provided for [MySQL](/wiki/MySQL),
Oracle, [PostgreSQL](/wiki/PostgreSQL), Sybase and SQLite. Each
is named cmap.create.dbname (e.g. cmap.create.mysql). They are in the
sql directory in the distribution.

### Create the configuration files

If you will be serving the data from a web page, the config files only
need to be created on the web server.

The configuration files are important to CMap (and hence CMAE). They
define which database is to be used and provide information about the
different types of maps, features and correspondence evidences in the
database.

For more information about the configuration files, see the
ADMINISTRATION.pod document in the docs/ directory.

## Importing Data

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

## Modifying Data

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

## Conclusion

Hopefully, the barrier of entry for using CMAE isn't too great. Please
let me know if you see any improvements can be made. Questions and
comments can be emailed to the CMAE mailing list,
gmod-cmap@lists.sourceforge.net.

## AUTHOR

Ben Faga, faga@cshl.edu

Copyright (c) 2007 Cold Spring Harbor Laboratory

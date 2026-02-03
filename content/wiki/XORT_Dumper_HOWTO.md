---
title: "XORT Dumper HOWTO"
---
# XORT Dumper HOWTO

  Introduction](#Introduction)
- [Author](#Author)
- [Prerequisites](#Prerequisites)
- [System
  Setup](#System_Setup)
- [Chado Database
  Setup](#Chado_Database_Setup)
- [XORT
  Installation](#XORT_Installation)
- [Dumping
  ChadoXML](#Dumping_ChadoXML)
  - [Genes](#Genes)
  - [Feature
    locations](#Feature_locations)
  - [CDS](#CDS)
- [More
  Information](#More_Information)

## Introduction

This HOWTO describes how to dump data from
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> into [Chado
XML](/wiki/Chado_XML) using [XORT](/wiki/XORT.1). It is a fairly
high level introduction to XORT dumpspecs. In this HOWTO you will be
taken through setting up a Chado database using Ubuntu 8.04, installing
XORT, and running some simple dumpspecs. The dumpspecs used herein start
out with a very simple feature table dump that extracts all gene
features from the YFGdb Chado database. Then feature location
information is added followed by associated CDS features. These examples
will hopefully give you more of an idea about how to dump Chado data
using XORT and what is involved to do so.

## Author

- [Josh Goodman](/wiki/User%3AJogoodma)

## Prerequisites

The steps outlined in this HOWTO were done on a x86 Ubuntu 8.0.4 desktop
edition machine. It is also assumed that you have some basic knowledge
of the <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>
schema.

## System Setup

1\. Install make, gcc, autoconf, automake, and binutils.

    $ sudo apt-get install make gcc autoconf automake binutils

2\. Install PostgreSQL. Please note that PostgreSQL 8.3 is the default
in 8.04 and should work, but at the time of this writing there were some
<a
href="http://www.nabble.com/Re%253A--Gmod-help--gmod-bulk-upload-td17135725.html#a17137953#a17137953"
class="external text" rel="nofollow">concerns</a> about GMOD
compatibility with 8.3.

    $ sudo apt-get install postgresql-8.2 postgresql-client-8.2

3\. Install Perl libraries

    $ sudo apt-get install libxml-perl libxml-dom-perl libxml-sax-perl
    $ sudo apt-get install libdbi-perl libdbd-pg-perl

## Chado Database Setup

1\. Create a PostgreSQL database superuser

    $ sudo su - postgres
    $ createuser
    Enter name of role to add: <username>
    Shall the new role be a superuser? (y/n) y

The value of \<username\> used should match your local unix login name
in order to simplify things.

2\. Set the new database user's password. You still need to be su'd as
the postgres user here. Be sure to substitute \<username\> and
\<password\> with an actual username and password.

    $ psql
    postgres=# alter user <username> with password '<password>';
    postgres=# \q
    $ exit

3\. Fetch the YFGdb Chado dump

    $ wget ftp://gen-ftp.princeton.edu/yfgdb/yfgdb_no-privs_20080211.sql.gz

4\. Create and load the YFGdb database

    $ createdb -E SQL_ASCII yfgdb
    $ zcat yfgdb_no-privs_20080211.sql.gz | psql -d yfgdb -o yfgdb_load.log

## XORT Installation

    $ wget http://superb-west.dl.sourceforge.net/sourceforge/gmod/XML-XORT-0.008.tar.gz
    $ tar zxf XML-XORT-0.008.tar.gz
    $ cd XML-XORT-0.008
    $ perl Makefile.PL
      What is the database name? yfgdb
      What is the database username? <username>
      What is the password for 'jogoodma'? <password>
      What is the database host? localhost
      What is your database port? 5432
      Where will the tmp directory go? /tmp
      Where will the conf directory go? /usr/local/xort/conf
      Where is the DDL file? <enter> - accept default
      Where do you want to install XORT if other than default, press ENTER if default: <enter>
    $ make
    $ sudo make install

## Dumping ChadoXML

### Genes

If everything has gone well thus far you should have a functioning Chado
installation with yeast data and XORT ready to go. For the first step of
this HOWTO we are going to dump a simple listing (in ChadoXML format) of
all the genes in the database. First create an XML dumpspec file called
genes.xml in your home directory that looks like this:

``` de1
<?xml version="1.0" encoding="UTF-8"?>
<chado dumpspec="genes.xml">
    <feature dump="select">
       <type_id test="yes">
          <cvterm>
             <name>gene</name>
          </cvterm>
       </type_id>
       <is_obsolete test="yes">false</is_obsolete>
       <is_analysis test="yes">false</is_analysis>
       <uniquename />
       <name />
       <seqlen />
    </feature>
</chado>
```

This dumpspec selects all features of type 'gene', that have is_obsolete
set to false, and also have is_analysis set to false. It then dumps the
uniquename, name, and seqlen fields from the feature table for these
records. The dump="select" attribute of the feature tag tells XORT that
we only want to dump what we explicitly define in the dumpspec. The
"test" attribute informs XORT that the value(s) of this node or node
tree in the XML is to be used to restrict the rows returned by XORT.
Here we are using a simple exact value comparison test but you can also
use 'like' or regular expression comparison operators. Please refer to
the [XORT](/wiki/XORT.1) documentation for a full list of supported
search operators. The SQL version of this dumpspec looks like this:

``` de1
SELECT f.uniquename, f.name, f.seqlen
       FROM feature f, cvterm cvt
       WHERE f.is_obsolete=FALSE AND f.is_analysis=FALSE AND
             cvterm.name='gene' AND f.type_id=cvt.cvterm_id;
```

You can execute this dumpspec by running the xort_dump.pl program like
this:

    $ /usr/local/bin/xort_dump.pl --database chado --output chado_genes.xml --dumpspec genes.xml

It is important to note that the --database option takes the first part
of the database properties file name located in the XORT conf directory
(/usr/local/xort/conf/chado.properties).

### Feature locations

In order to make our dumpspec a little more useful lets add sequence
location information about our genes. This information is stored in the
featureloc table and is joined to the feature table via feature_id.
Therefore, to dump rows from featureloc we nest a featureloc tag
directly under '\<feature\>'. Rather than explicitly defining that we
want all columns of the featureloc table we will use dump="cols" to tell
XORT to do this for us. We also want to know which chromosome the gene
is localized to; this information is obtained by following srcfeature_id
back to the feature table.

``` de1
<?xml version="1.0" encoding="UTF-8"?>
<chado dumpspec="genes.xml">
    <feature dump="select">
       <type_id test="yes">
          <cvterm>
             <name>gene</name>
          </cvterm>
       </type_id>
       <is_obsolete test="yes">false</is_obsolete>
       <is_analysis test="yes">false</is_analysis>
       <uniquename />
       <name />
       <seqlen />
       <featureloc dump="cols">
          <srcfeature_id>
             <feature dump="select">
                <uniquename />
             </feature>
          </srcfeature_id>
       </featureloc>
    </feature>
</chado>
```

After running this dumpspec our list of genes should now contain
information about the fmin, fmax, strand, and chromosome that it is
localized on. The equivalent SQL for this dumpspec would be this:

``` de1
SELECT f1.uniquename, f1.name, f1.seqlen, fl.*, f2.uniquename
       FROM feature f1, feature f2, cvterm cvt, featureloc fl
       WHERE f1.is_obsolete=FALSE AND f1.is_analysis=FALSE AND
             cvt.name='gene' AND f1.type_id=cvt.cvterm_id AND
             f1.feature_id=fl.feature_id AND fl.srcfeature_id=f2.feature_id;
```

### CDS

For the last dumpspec we will add CDS information. In the YFGdb Chado
database, CDS information is associated with gene features via the
feature_relationship table. The gene is the object, the CDS is the
subject, and the relationship type is set to 'part_of'. Here is what the
dumpspec would look like for dumping CDS features:

``` de1
<?xml version="1.0" encoding="UTF-8"?>
<chado dumpspec="genes.xml">
    <feature dump="select">
       <type_id test="yes">
          <cvterm>
             <name>gene</name>
          </cvterm>
       </type_id>
       <is_obsolete test="yes">false</is_obsolete>
       <is_analysis test="yes">false</is_analysis>
       <uniquename />
       <name />
       <seqlen />
       <featureloc dump="cols">
          <srcfeature_id>
             <feature dump="select">
                <uniquename />
             </feature>
          </srcfeature_id>
       </featureloc>
       <feature_relationship>
          <type_id test="yes">
             <cvterm>
                <name>part_of</name>
             </cvterm>
          </type_id>
          <subject_id test="yes">
             <feature>
                <type_id>
                   <cvterm>
                      <name>CDS</name>
                   </cvterm>
                </type_id>
             </feature>
          </subject_id>
          <subject_id>
             <feature dump="select">
                <uniquename />
                <name />
                <type_id>
                   <cvterm dump="select">
                      <name />
                   </cvterm>
                </type_id>
                <featureloc dump="cols" />
             </feature>
          </subject_id>
          <type_id>
             <cvterm dump="select">
                <name />
             </cvterm>
          </type_id>
       </feature_relationship>
    </feature>
</chado>
```

In this dumpspec you can see that feature_relationship is directly
nested under the gene feature and because subject_id is used directly
under feature_relationship XORT knows to join the gene feature to
feature_relationship via object_id and then follow the subject_id back
to the feature table to fetch the CDS.



## More Information

See the [XORT](/wiki/XORT.1) page.

Please send questions to the GMOD developers list:

<a href="mailto:gmod-devel@lists.sourceforge.net" class="external text"
rel="nofollow">gmod-devel@lists.sourceforge.net</a>

Or contact the [GMOD Help Desk](/wiki/GMOD_Help_Desk)

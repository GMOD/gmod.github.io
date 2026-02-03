---
title: "Glossary"
---
# Glossary


  AJAX](#AJAX)
- [API](#API)
- [BAM](#BAM)
- [CPAN](#CPAN)
- [CSS](#CSS)
- [CVS](#CVS)
- [DAG](#DAG)
- [DAS](#DAS)
- [Database](#Database)
- [Database
  Management System](#Database_Management_System)
- [Database
  Schema](#Database_Schema)
- [DBMS](#DBMS)
- [DBMS-Database](#DBMS-Database)
- [DBMS-Schema](#DBMS-Schema)
- [FASTA](#FASTA)
- [Foreign
  Key](#Foreign_Key)
- [Gene Finder
  Format](#Gene_Finder_Format)
- [Generic
  Feature Format](#Generic_Feature_Format)
- [General
  Feature Format](#General_Feature_Format)
- [GFF](#GFF)
- [GFF2](#GFF2)
- [GFF3](#GFF3)
- [Git](#Git)
- [GTF](#GTF)
- [GUI](#GUI)
- [Java](#Java)
- [JRE](#JRE)
- [JSON](#JSON)
- [Linux](#Linux)
- [Middleware](#Middleware)
- [Object-Relational
  Mapping](#Object-Relational_Mapping)
- [Operating
  System](#Operating_System)
- [ORM](#ORM)
- [OS](#OS)
- [Perl](#Perl)
- [RDBMS](#RDBMS)
- [Relational](#Relational)
- [Relational
  Database Management
  System](#Relational_Database_Management_System)
- [SAM](#SAM)
- [SAMtools](#SAMtools)
- [Schema](#Schema)
- [SQL](#SQL)
- [SVN](#SVN)
- [Unix](#Unix)
- [XML](#XML)


This glossary explains terms that

- are specific to the GMOD project, or
- are computing terms that are used in the GMOD project.

This glossary does **not** define biology terms.


  

### AJAX

AJAX is a web user interface technology used in some [GMOD
Components](GMOD_Components "GMOD Components"). It is used to provide a
richer user experience than was typically available during the first 10
years of the web. AJAX stands for Asynchronous Javascript and
[XML](#XML).

See Also:

- [Category%253AAJAX](Category%253AAJAX "Category%253AAJAX")

### API

*API* stands for *Application Programming Interface*. An API is a
well-defined programmatic interface to some resource. That is, it is an
interface meant to be used by other programs to access that resource. It
is distinct and sometime complementary to a *Graphical User Interface*
or *GUI*, which is a direct user interface to a resource.

### BAM

*BAM* is a binary version of *[Sequence Alignment/Map (SAM)](#SAM)*
format. BAM and SAM are both part of [SAMtools](#SAMtools). BAM is
compressed, binary, indexed format for [Next Generation
Sequencing](Next_Generation_Sequencing "Next Generation Sequencing")
data. [GBrowse](GBrowse.1 "GBrowse") 2 has an adaptor that can read BAM
data.

### CPAN

*CPAN* is the *Comprehensive Perl Archive Network*, a repository of
[Perl](#Perl) modules that bring additional functionality to the Perl
language.

See also

- <a href="http://cpan.org" class="external text" rel="nofollow">CPAN</a>
  web site.

### CSS

*Cascading Style Sheets (CSS)* are a way to control the appearance of
web pages. CSS is used to separate style (colors, fonts, layout, etc.)
from content (the actual information on a page), allowing styles to
defined in a single place and then referred to from many pages.

See also

- <a href="http://www.w3.org/Style/CSS/" class="external text"
  rel="nofollow">CSS Home Page @ W3C</a>
- [MediaWiki%253ACommon.css](MediaWiki%253ACommon.css "MediaWiki%253ACommon.css") -
  Extensions to MediaWiki's default CSS that we have made on this web
  site.

### CVS

*CVS* is a *source code control* system that *used* to be used by most
of GMOD. Source code control systems, also known as *revision control*
or *version control* systems are used to record changes to computer
files. GMOD now uses [SVN](#SVN).

See Also:

- <a href="Subversion" class="mw-redirect"
  title="Subversion">Subversion</a>
- <a href="http://ximbiot.com/cvs/" class="external text"
  rel="nofollow">CVS Home Page</a>

### DAG

A *directed acyclic graph (DAG)* is a set of nodes and connections
between the nodes where every connection has a direction, and there are
no loops in the connections. That is, if you start at any node, and
follow connections out of that node, you will never return to it.

See also:

- <a href="http://en.wikipedia.org/wiki/Directed_acyclic_graph"
  class="external text" rel="nofollow">Wikipedia</a>

### DAS

See [Distributed Annotation
System](Distributed_Annotation_System "Distributed Annotation System")

### Database

A *database* can be any set of organized data that is readable by a
computer. It can be anywhere from an implementation of a [database
schema](#Database_Schema) in a particular [database management
system](#Database_Management_System) to regular files that have a
defined format.

For example, the *database* behind the FlyBase web site contains data on
drosopholids, and uses the
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> schema and
the [PostgreSQL](PostgreSQL "PostgreSQL") [database management
system](#Database_Management_System).

See also:

- [Databases and GMOD](Databases_and_GMOD "Databases and GMOD")
- [Database Management System](#Database_Management_System)
- [Database Schema](#Database_Schema)
- [DBMS-Database](#DBMS-Database)

### Database Management System

*Database management systems* (DBMSs) are software systems that can
manage data. [PostgreSQL](PostgreSQL "PostgreSQL"),
[MySQL](MySQL "MySQL"), Oracle and Sybase are all examples of DBMSs.
DBMSs are containers of databases. That is, they are the systems that
manage databases, which is distinct from the data that they manage.

Most DBMSs are *[relational](#Relational)*, which is a particular way of
representing data. All DBMSs that GMOD is concerned with are relational,
so GMOD uses the terms*database management system* and *relational
database management system* (RDBMS) interchangeably.

See also:

- [Databases and GMOD](Databases_and_GMOD "Databases and GMOD")
- [Database](#Database)
- [Database Schema](#Database_Schema)
- [MySQL](MySQL "MySQL")
- [PostgreSQL](PostgreSQL "PostgreSQL")
- [Relational](#Relational)

### Database Schema

A *database schema* is the design of a particular database, independent
of its contents.
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> is an
example of a *database schema*. Designs (like Chado) can be reused
across multiple databases.

See also:

- [Databases and GMOD](Databases_and_GMOD "Databases and GMOD")
- [Database](#Database)
- [Database Management System](#Database_Management_System)
- [DBMS-Schema](#DBMS-Schema)

### DBMS

See [Database Management System](#Database_Management_System).

### DBMS-Database

The topmost hierarchal element in a
[DBMS](#Database_Management_System)'s collection of data. By definition,
data stored within different databases cannot be related by the DBMS, by
query or otherwise.

See also:

- [Database](#Database)

### DBMS-Schema

The layer below the topmost in a [DBMS](#Database_Management_System)'s
collection of data. An organizing concept somewhat similar to that of a
folder or directory. Unlike data stored within different
[DBMS-Databases](#DBMS-Database), data stored within different schema of
the same DBMS-Database can be related and otherwise mutually manipulated
within the DBMS.

See also:

- [Database Schema](#Database_Schema)
- [Database Management System](#Database_Management_System)
- [DBMS-Database](#DBMS-Database)

### FASTA

<a href="http://en.wikipedia.org/wiki/Fasta_format"
class="external text" rel="nofollow">FASTA</a> is a widely used
text-based data format for representing nucleic acid and peptide
sequence data. FASTA entries start with a header line, followed by the
sequence on the immediately following lines. The header line starts with
the sequence identifier. It can also contain additional information,
which is often pipe ("\|") separated.

A basic example, showing "ctg123", a DNA sequence that is 338
nucleotides long:

    >ctg123
    cttctgggcgtacccgattctcggagaacttgccgcaccattccgccttg
    tgttcattgctgcctgcatgttcattgtctacctcggctacgtgtggcta
    tctttcctcggtgccctcgtgcacggagtcgagaaaccaaagaacaaaaa
    aagaaattaaaatatttattttgctgtggtttttgatgtgtgttttttat
    aatgatttttgatgtgaccaattgtacttttcctttaaatgaaatgtaat
    cttaaatgtatttccgacgaattcgaggcctgaaaagt

FASTA entries can be included at the end of [GFF3](#GFF3) files.

See also:

- <a href="http://en.wikipedia.org/wiki/Fasta_format"
  class="external text" rel="nofollow">FASTA format</a> at Wikipedia.

### Foreign Key

In a [database](#Database), related tables are linked together by taking
the primary key from one table and placing in the related table. The
primary key then becomes a *foreign key*.

### Gene Finder Format

A former name for [GFF](#GFF).

### Generic Feature Format

See [GFF](GFF "GFF").

### General Feature Format

A former name for [GFF](#GFF).

### GFF

**[GFF](GFF "GFF")** is a standard file format for storing genomic
features in a text file. GFF stands for ***G**eneric **F**eature
**F**ormat*. GFF files are plain text, 9 column, tab-delimited files.
GFF *[databases](Databases_and_GMOD "Databases and GMOD")* also exist.
They use a [schema](#Schema) custom built to represent GFF data. GFF is
[frequently used in GMOD](GFF#GFF_in_GMOD "GFF") for data exchange and
representation of genomic data.

There are two versions of GFF supported in GMOD: [GFF3](#GFF3) and
[GFF2](#GFF2). GFF2 is now *deprecated*.

See also:

- [GFF](GFF "GFF") - all things GFF and GFF3

### GFF2

[GFF2](GFF2 "GFF2") is a supported [GFF](#GFF) format in GMOD, **but it
is now deprecated and if you have a choice you should use
[GFF3](#GFF3)**. Unfortunately, data is sometimes only available in GFF2
format. GFF2 has a number of shortcomings compared to GFF3.

See also:

- [GFF2](GFF2 "GFF2")

### GFF3

[GFF3](GFF3 "GFF3") is the most recent version of the [GFF](#GFF)
format. It has many advantages over the now deprecated [GFF2](#GFF2) and
should be used in favor of GFF2 whenever possible.

See also:

- [GFF3](GFF3 "GFF3")
- <a href="http://www.sequenceontology.org/gff3.shtml"
  class="external text" rel="nofollow">GFF3 Specification</a>

### Git

*<a href="http://git-scm.com/" class="external text"
rel="nofollow">Git</a>* is a version control system, like [Subversion
(SVN)](#SVN), that is used to track and coordinate updates to files,
usually software and/or documentation. Git is a *distributed* version
control system, in that it does not require use of a central server.
However, in practice, most projects use a central server, either hosted
themselves or on a public host such as
<a href="http://github.com" class="external text"
rel="nofollow">GitHub</a>.

### GTF

<a href="http://mblab.wustl.edu/GTF2.html" class="external text"
rel="nofollow"><em>GTF</em></a> is a genomic annotation file format that
is very similar to [GFF2](#GFF2) and is sometimes referred to as GFF2.5.
GTF is not a supported format in GMOD so if you have a GTF file you'll
need to convert it to [GFF3](#GFF3).

See also:

- [GFF](#GFF)
- The [GTF section](GFF#GTF "GFF") of the [GFF](GFF "GFF") page.

### GUI

*GUI* is an acronym for ***G**raphical **U**set **I**nterface.* GUIs are
interfaces to computer programs that use graphics, mice, pull down
menus, check boxes, and other interactive elements. GUIs contrast with
*command line interfaces,* where you interact with the program using
only the keyboard.

### Java

*Java* is arguably the world's most popular programming language but it
is not as popular for command-line work on Unix as [Perl](#Perl). It's
encountered in GMOD primarily as a language to construct user interfaces
(e.g. [Apollo](Apollo.1 "Apollo")).

See also:

- [Category%253AJava](Category%253AJava "Category%253AJava") - GMOD pages tagged as
  related to Java.

### JRE

[Java](#Java) programs run in a virtual machine known as a *Java Runtime
Environment* or *JRE*.

### JSON

*JSON* is an acronym for JavaScript Object Notation, a lightweight
data-interchange format. It is used in GMOD in
[Galaxy](Galaxy.1 "Galaxy") and [JBrowse](JBrowse.1 "JBrowse").

See also:

- <a href="http://www.json.org" class="external text"
  rel="nofollow">JSON.org</a>

### Linux

*Linux* is an open source [operating system](#Operating_System) that is
based on he [Unix](#Unix) operating system. Linux is the default
operating system for GMOD.

See also:

- [Computing
  Requirements](Computing_Requirements "Computing Requirements")
- [Category%253ALinux](Category%253ALinux "Category%253ALinux") - List of GMOD pages
  tagged as related to Linux.

### Middleware

*Middleware* is software that connects other software components so they
can talk together. You can think of it as project plumbing. Like
plumbing, it is hard to do well, and people take it for granted until it
does not work.

See also:

- [Category%253AMiddleware](Category%253AMiddleware "Category%253AMiddleware") -
  List of GMOD pages tagged as related to middleware.

### Object-Relational Mapping

*Objects* and *[relations](#Relational)* are two different ways to
represent information in computing. *Objects* tend to be used by
programming languages such as Java, while relations are widely used in
[databases](#Database), particularly [relational](#Relational)
databases. *Object-relational mapping (ORM)* converts information from
one model to the other, usually at the point of interaction between
object-oriented languages, and relational databases.

See also:

- <a href="http://en.wikipedia.org/wiki/Object-relational_mapping"
  class="external text" rel="nofollow">Object-relational mapping at
  Wikipedia</a>

### Operating System

An *operating system* (OS) is the software that controls a computer and
manages the sharing of resources on that computer. Example operating
systems are <a href="http://www.microsoft.com" class="external text"
rel="nofollow">Microsoft Windows</a> and [Linux](#Linux).

See also:

- [Computing
  Requirements](Computing_Requirements "Computing Requirements")

### ORM

See [Object-Relational Mapping](#Object-Relational_Mapping).

### OS

See [Operating System](#Operating_System).

### Perl

*Perl* is the programming language most used in the bioinformatics
realm, and it is the language most used by GMOD developers. It is
well-suited to text and data processing and is also characterized by an
extensive open source library, so it's highly functional. Many of GMOD
components use [BioPerl](BioPerl "BioPerl"), a bioinformatics toolkit
written in Perl.

Some parts of GMOD, like [GBrowse](GBrowse.1 "GBrowse"), can be extended
or customized using Perl but beginners' skills in Perl is sufficient for
this work.

See also:

- <a href="http://www.perl.org/" class="external text" rel="nofollow">Perl
  Home Page</a>
- <a href="http://cpan.perl.org/" class="external text"
  rel="nofollow">Perl's open source library repository.</a>
- [Category%253APerl](Category%253APerl "Category%253APerl") - GMOD pages tagged as
  related to Perl.

### RDBMS

See [Database Management System](#Database_Management_System).

### Relational

Most [Database Management Systems (DBMSs)](#Database_Management_System)
are *relational*, which is a particular way of representing data. All
DBMSs that GMOD is concerned with are relational, so GMOD uses the terms
*database management system* and *relational database management system*
(RDBMS) interchangeably.

See also:

- [Databases and GMOD](Databases_and_GMOD "Databases and GMOD")
- [Database](#Database)
- [Database Schema](#Database_Schema)
- [MySQL](MySQL "MySQL")
- [PostgreSQL](PostgreSQL "PostgreSQL")

### Relational Database Management System

See [Relational](#Relational) and [Database Management
System](#Database_Management_System).

### SAM

***S**equence **A**lignment/**M**ap* format. SAM is a text format for
[Next Generation
Sequencing](Next_Generation_Sequencing "Next Generation Sequencing")
data. It is a part of [SAMtools](#SAMtools).
[GBrowse](GBrowse.1 "GBrowse") 2 has an adaptor that can read SAM data.

### SAMtools

*<a href="http://samtools.sourceforge.net" class="external text"
rel="nofollow">SAMtools</a>* is a set of formats and programs for
storing, manipulating, and accessing [Next Generation
Sequencing](Next_Generation_Sequencing "Next Generation Sequencing")
data.

### Schema

See [Database Schema](#Database_Schema)

### SQL

*SQL* is a standard query language used with relational [database
management systems](#Database_Management_System) (DBMSs). Is is used to
update and retrieve data that is in a database.

SQL is generally similar for different DBMSs but varies in many details
from one DBMS to another.

### SVN

*SVN*, short for **Subversion**, is a *source code control* system that
is used by most of GMOD. Source code control systems, also known as
*revision control* or *version control* systems are used to record
changes to computer files. GMOD
[converted](CVS_to_Subversion_Conversion "CVS to Subversion Conversion")
from [CVS](#CVS) to
<a href="SVN" class="mw-redirect" title="SVN">SVN</a> on 2009/09/15.

GMOD's main source code repository is at
<a href="http://gmod.svn.sourceforge.net/viewvc/gmod/"
class="external text" rel="nofollow">SourceForge</a>.
<a href="Subversion" class="mw-redirect"
title="Subversion">Subversion</a> explains how to both download and
update the main GMOD repository at SourceForge.

See Also:

- <a href="Subversion" class="mw-redirect"
  title="Subversion">Subversion</a>

### Unix

*Unix* is a group of [operating systems](#Operating_System) that are
descended from the original Unix operating system developed in the
1970s. This includes Solaris, HP-UX, [Linux](#Linux), [Mac OS
X](Category%253AMac_OS_X "Category%253AMac OS X"), and many others.

### XML

*XML* is an acronym for *e**X**tensible **M**arkup **L**language*, a data
format used primarily for sharing data. It looks similar to HTML, but
has a much tighter syntax than does HTML.

See also:

- [Category%253AXML](Category%253AXML "Category%253AXML")
- [XORT](XORT.1 "XORT")

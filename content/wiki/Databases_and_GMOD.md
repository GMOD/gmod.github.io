---
title: "Databases and GMOD"
---
# Databases and GMOD

This introduces the broad topic of databases in GMOD. It introduces some
[database terminology](#Database_Terminology) for those that are new to
databases. It also covers how databases are implemented and used in
GMOD, and what database management system choices are available.



  Terminology</span>](#Database_Terminology)
  - [What's a
    Database?](#What.27s_a_Database.3F)
    - [Database](#Database)
    - [Database Management
      System](#Database_Management_System)
    - [Database Schema](#Database_Schema)
    - [Database Web
      Site](#Database_Web_Site)
  - [Relational
    Database Terminology](#Relational_Database_Terminology)
- [GMOD Database
  Components](#GMOD_Database_Components)
  - [Chado](#Chado)
  - [BioMart](#BioMart)
  - [InterMine](#InterMine)
  - [Database
    Tools](#Database_Tools)
  - [GMOD
    Components that Require a
    DBMS](#GMOD_Components_that_Require_a_DBMS)
- [GMOD DBMS
  Choices](#GMOD_DBMS_Choices)
  - [Can I Use
    Something Besides the Default
    DBMS?](#Can_I_Use_Something_Besides_the_Default_DBMS.3F)
  - [DBMSs in
    Use in the GMOD
    Community](#DBMSs_in_Use_in_the_GMOD_Community)
    - [PostgreSQL](#PostgreSQL)
    - [MySQL](#MySQL)
    - [SQLite](#SQLite)
    - [DB2](#DB2)
    - [Oracle](#Oracle)
    - [Sybase](#Sybase)
- [See
  Also](#See_Also)

## Database Terminology

### What's a Database?

The term *database* is mentioned in all sorts of contexts in GMOD. It is
even part of the project's name. Despite its central role in GMOD, the
term *database* is often used to mean four different things. This
section distinguishes its various meanings and introduces more precise
terms that should be (but probably aren't) used throughout GMOD.

#### Database

A *database* is any organized set of data that is readable by a
computer. This may or may not use a formal *database schema* and may or
may not be in a *database management system*.

A database can be implemented in a *[relational database management
system](Glossary#Relational_Database_Management_System "Glossary")*
using a defined *[database
schema](Glossary#Database_Schema "Glossary")*. For example, the database
behind the <a href="http://flybase.org" class="external text"
rel="nofollow">FlyBase web site</a> contains data on drosopholids, and
uses the <a href="Chado" class="mw-redirect" title="Chado">Chado</a>
schema and the [PostgreSQL](PostgreSQL "PostgreSQL") database management
system.

A database can also be in regular files with a well defined format.

#### Database Management System

*Database management systems* (DBMSs) are software systems that can
manage data. Oracle, MySQL, PostgreSQL, and Sybase are all examples of
DBMSs. DBMSs are *containers of databases*. That is, they are the
systems that manage databases, which is distinct from the data that they
manage.

#### Database Schema

A *database schema* is the design of a particular database, independent
of its contents. Chado is an example of a database schema. Designs (like
Chado) can be reused across multiple databases.

#### Database Web Site

Web sites that feature a lot of database driven content, such as
[FlyBase](Category%253AFlyBase "Category%253AFlyBase")
(<a href="http://flybase.org" class="external free"
rel="nofollow">http://flybase.org</a>) or
[ParameciumDB](ParameciumDB "ParameciumDB")
(<a href="http://paramecium.cgm.cnrs-gif.fr" class="external free"
rel="nofollow">http://paramecium.cgm.cnrs-gif.fr</a>), are often
referred to as databases. This is somewhat accurate as there are
databases backing the web sites, but it is also misleading. These
websites also show information that doesn't come from their database and
they also may not show everything in their databases.

### Relational Database Terminology

The [brief guide to
databases](A_Brief_Guide_to_Databases "A Brief Guide to Databases")
defines some basic database concepts, and the [Relational
Databases](Overview#Relational_Databases "Overview") section in
[Overview](Overview "Overview") explains many terms that are useful in
understanding relational databases.

## GMOD Database Components

There are three main GMOD components that are fundamentally about
databases, and several more that help you manage databases or that use
(or can use) databases to accomplish their purpose.

GMOD's database related components are:

### Chado

<a href="Chado" class="mw-redirect" title="Chado">Chado</a> is the
modular [database schema](#Database_Schema) of GMOD. Chado is about
organizing your data in a database so that you can manage it and can
connect other GMOD components to it (either directly or via data
exports). When someone speaks of the GMOD Schema they are speaking about
Chado.

### BioMart

[BioMart](BioMart "BioMart") is a data warehouse package tailored for
biological data. It takes existing databases (for example, the
[FlyBase](Category%253AFlyBase "Category%253AFlyBase")
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> database),
transforms them into a data warehouse and then provides a web interface
for supporting arbitrary queries against the data.

### InterMine

[InterMine](InterMine "InterMine") also integrates multiple data sources
into a single data warehouse. It has a core data model based on the
sequence ontology and supports several biological data formats. It is
easy to extend the data model and integrate your own data, Java and Perl
APIs and an XML format to help import custom data. A web application
allows creation of custom queries, includes template queries (web forms
to run 'canned' queries) and can upload and operate on lists of data.
Many aspects of the web app can be configured and branded.

### Database Tools

- [Argos](Argos "Argos"), a.k.a. Flybase-NG, a.k.a. biodb, is designed
  to provide automatic replication, installation and updates of genome
  and organism databases and information servers, including FlyBase and
  euGenes. It should be not too difficult to add other organism/genome
  services to this replication structure.
- [GMODTools](GMODTools "GMODTools") is a Perl package that generates
  Fasta, [GFF](GFF "GFF"), DNA and other bulk genome annotation files
  from <a href="Chado" class="mw-redirect" title="Chado">Chado</a>
  databases.
- [Modware](Modware "Modware") is an object-oriented Perl API for
  <a href="Chado" class="mw-redirect" title="Chado">Chado</a>. It allows
  object-oriented querying and loading of a Chado database and returns
  data structures that a programmer can readily use without knowing the
  details of how the object is stored in the relational schema.
- [XORT](XORT.1 "XORT") is a utility written in Perl that can be used to
  read to and write from a [relational
  schema](Glossary#Schema "Glossary") using
  [XML](Glossary#XML "Glossary") as an interchange format. In GMOD XORT
  is frequently used to transfer data to and from
  <a href="Chado" class="mw-redirect" title="Chado">Chado</a>.

### GMOD Components that Require a DBMS

- [CMap](CMap.1 "CMap")
- [GBrowse_syn](GBrowse_syn.1 "GBrowse syn")

## GMOD DBMS Choices

Several [GMOD Components](GMOD_Components "GMOD Components") rely on
databases to store their data. All such components have a default DBMS
that the developers had in mind when they created the component. The
default DBMS is most often [PostgreSQL](PostgreSQL "PostgreSQL") or
[MySQL](MySQL "MySQL"). PostgreSQL, commonly known as Postgres, and
MySQL are both open-source DBMSs with large and active user communities.
It is possible to use a DBMS other than the default but it does involve
more work, sometimes a lot more work.

See the component descriptions to find out if they need an underlying
database and what their default DBMS is.

### Can I Use Something Besides the Default DBMS?

The answer is yes, but it will mean extra work.

You may want to do this if you are already using a DBMS that you
understand. DBMS administration is non-trivial and adding one or two
more DBMSs to the list you have to support may or may not be more effort
than porting the component to use your DBMS of choice. However, do keep
in mind that one of the reasons why MySQL and Postgres are often picked
as default DBMSs is that they are comparatively easy to administer.

### DBMSs in Use in the GMOD Community

Postgres and MySQL are the most popular DBMSs, but several others are in
use in the GMOD community.

#### PostgreSQL

[Postgres](PostgreSQL "PostgreSQL") (officially known as *PostgreSQL*)
is the default DBMS for
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>, GMOD's
modular database schema. [Galaxy](Galaxy.1 "Galaxy") can also run using
Postgres. Work is being done on
<a href="Ergatis" class="mw-redirect" title="Ergatis">Ergatis</a> to
also support PostgreSQL.

See the [PostgreSQL](PostgreSQL "PostgreSQL") page from more information
on Postgres.

#### MySQL

MySQL adapters exist for [GBrowse](GBrowse.1 "GBrowse") and it also used
by [CMap](CMap.1 "CMap")

Using MySQL with
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> is
discouraged. See [MySQL](MySQL "MySQL") for more information on MySQL in
GMOD.

#### SQLite

<a href="http://sqlite.org/" class="external text"
rel="nofollow">SQLite</a> is a software library that implements a
self-contained, serverless, zero-configuration, transactional SQL
database engine. SQLite is the most widely deployed SQL database engine
in the world. The source code for SQLite is in the public domain.

SQLite is used in a few places in GMOD. [MAKER](MAKER.1 "MAKER") uses it
for its data store. It is the default database when installing
[Galaxy](Galaxy.1 "Galaxy"), but most users then upgrade to a different
[DBMS](Glossary#DBMS "Glossary"), usually
[PostgreSQL](PostgreSQL "PostgreSQL"). It can also be used with
[GBrowse](GBrowse.1 "GBrowse").

#### DB2

<a href="http://xenbase.org" class="external text"
rel="nofollow">Xenbase</a> uses
<a href="http://www.ibm.com/db2" class="external text"
rel="nofollow">DB2</a> for their
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>
installation. DB2 is a high-end database from
<a href="http://ibm.com" class="external text" rel="nofollow">IBM</a>
that has a
<a href="http://www-306.ibm.com/software/data/db2/express/download.html"
class="external text" rel="nofollow">free version</a> and also a <a
href="http://www-304.ibm.com/jct09002c/university/scholars/academicinitiative/"
class="external text" rel="nofollow">free academic licenses</a>. DB2 is
one of the big players in the commercial database market.

#### Oracle

Oracle is a supported DBMS for [CMap](CMap.1 "CMap") and
[GBrowse](GBrowse.1 "GBrowse").

<a href="http://apidb.org" class="external text"
rel="nofollow">ApiDB</a> uses
<a href="http://http://www.oracle.com/database/" class="external text"
rel="nofollow">Oracle</a> for its database needs, and
<a href="http://www.dictybase.org" class="external text"
rel="nofollow">dictyBase</a> uses [Oracle for Chado and
GMODTools](https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e7/Just-050516.ppt "File:Just-050516.ppt").

Work is being done on
<a href="Ergatis" class="mw-redirect" title="Ergatis">Ergatis</a> to
also support Oracle.

Oracle is a high-end database management system from
<a href="http://oracle.com" class="external text" rel="nofollow">Oracle
Corporation</a>. It is the most popular commercial database in the
world.

#### Sybase

Due to its heritage at JCVI, the default database of the
<a href="Ergatis" class="mw-redirect" title="Ergatis">Ergatis</a>
workflow management tool was originally Sybase. Currently, it is usually
used with MySQL and PostgreSQL by way of the
<a href="https://sourceforge.net/projects/coati-api/"
class="external text" rel="nofollow">Coati</a> development framework.

## See Also

[Relational Databases](Overview#Relational_Databases "Overview") in
[Overview](Overview "Overview").

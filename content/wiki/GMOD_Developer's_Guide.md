---
title: "GMOD Developer's Guide"
---
# GMOD Developer's Guide

This is the GMOD Developer's Guide.

  Platforms</span>](#Favored_Platforms)
  - [Server
    Side](#Server_Side)
    - [OS](#OS)
    - [Web
      Server](#Web_Server)
    - [Languages](#Languages)
    - [DBMS](#DBMS)
    - [Compilers](#Compilers)
    - [Libraries](#Libraries)
    - [Hardware](#Hardware)
  - [Client
    Side](#Client_Side)
    - [OS](#OS_2)
    - [Browser](#Browser)
- [Server Side
  Directory Structure](#Server_Side_Directory_Structure)
- [Interoperation](#Interoperation)
- [A First GMOD
  Release would Contain](#A_First_GMOD_Release_would_Contain)
- [Creating a
  software release](#Creating_a_software_release)

## Favored Platforms

### Server Side

The following environment variables should be set:

- GMOD_ROOT
- CHADO_DB_NAME
- CHADO_DB_USERNAME
- CHADO_DB_PASSWORD
- CHADO_DB_HOST
- CHADO_DB_PORT

#### OS

Any of Linux/BSD, Solaris, OSX. Windows: optional as cost/benefit less
favorable.

#### Web Server

All of:

- Apache
  - With Modperl 1.3, temporarily; need to migrate to Modperl 2.0
    (currently broken) or CGI soon.
  - Allen, Ken to investigate effort required to port their apps to
    ModPerl 2.0 or CGI.
- TomCat 4.1 (auxiliary Web server to support server-side Java/JSP)

#### Languages

All of:

- Perl 5.6.1 or higher
- Java 1.4

#### DBMS

[PostgreSQL](PostgreSQL "PostgreSQL") 7.3 or 8.0

#### Compilers

gcc (on Solaris as well).

#### Libraries

Perl bundle; requires some C libraries

#### Hardware

Recommendations based on current MODs to be determined. Minimum: 20GB
disk, 512 MB ram, 1.8 GHz Pentium or equiv. Client or server.

### Client Side

#### OS

Linux, Windows, Mac OSX.

#### Browser

- Any of Mac IE, Win IE, Netscape. Which versions within these?
- Fly and worm will analyze server logs to determine largest market
  segments.
- How to test?

## Server Side Directory Structure

- \$GMOD_HOME=**/usr/local/gmod/** (default -- set before installing)
  - **bin/** -- all scripts

Prefix all executables with 2-3 letter app prefix

- - **sbin/** -- system binaries that may do dangerous things
  - **web/**
  - **htdocs/** -- db
    - **cgi-bin/** -- appname
    - **webapps/** -- appname
  - **conf/** -- all configuration files (attr/value format)
    - **gmod.conf** always source this first; global site params
    - **db.conf** -- one for each datasource at the installation server,
      port, DB, login, password, banner/site-specific page config info
      optionally source one of these after gmod.conf according to "db"
      URL param (Perl: use CPAN INI parser to load)
  - **data/** -- inputs and outputs; operator writable -- appname
  - **lib/** -- appname or shared library, Perl plugins, jar files
  - **doc/** -- appname
  - **log/**
  - **examples/** -- appname
  - **src/** -- appname

- \$CLASS_PATH := \$GMOD_HOME/lib\[/app\]
- Suggested CGI Parameter Names:

  - db=short symbolic name of datasource (MOD), used to look up conf
    file
  - class=object class within db to search
  - id=unique primary key
  - name=human readable, possibly ambiguous string

- What if multiple DB instances running on same site?
- Package manager?
- Testing process: is a goal. "Testing is good" -- LS
  - Developer side
  - Release testing: alpha, beta
  - Installer side

## Interoperation

- Support chado schema for genome features
- Establish clear naming conventions for Chado extension to avoid
  intermodule conflicts:
  - Use namespaces (using PostgreSQL "create schema" or table prefixes?)
    corresponding to Chado modules. Or will current conventions suffice?
- Different apps should share portions of schema wherever that makes
  sense
- Schema changes need extensive coordination, versioning and testing
  across all affected apps.
- Apps are encouraged to be backward compatible with older versions of
  schema.
- Need to track which app versions work with which schema versions.
- Releases:
  - Major (or "public") release is a coordinated release of all apps,
    with testing.
  - Minor releases / tagged versions as needed by development groups, no
    guarantee of installable tarball.
- Schema change coordination manners: notify gmod-schema list of all
  proposed changes. Is this sufficient (for now?)
- Support a few standard external reps of data:
  - Sequence feature apps should read/write GenBank & EMBL formats
    (BioPerl and BioJava handle this). GFF? GTF? BED? GAME? BSML? TIGR
    add BSML adaptors to BioPerl?
  - Citations: Medline flatfile format
  - Expression: MageML for microarrays
  - Maps: use CMAP tab delimited format. (the new standard :-)
  - Adaptors for chado-DBI and/or chado-XML?
- AppDB communication:
  - SQL (DBI/JDBC)
  - TIGR developing Perl API for chado: get central dogma model,
    cv_term2genes, writes
  - UCLA has developed a Perl middleware API (Class::DBI) for Chado
  - BioPerl2chado -- CJM readonly API -- out of date?
  - Chado XML Dumper
- Bulk dataloading
  - Colin's GAME2chado initializer
  - Chado XML Loader
  - GAME2chadx, chadx2game
  - BSML2chado loader @ TIGR

## A First GMOD Release would Contain

- Sample data
  - Fasta files
  - GenBank files
  - BLAST output
- Loading tools for sample data
- Stable chado release
- gmod-web with "basic" pages
- Compatible Gbrowse release
- Apollo
- Other support tools (chadx dumpers and loaders,xxx2chadx translators)
- DOCUMENTATION (README, INSTALL, CONFIGURATION-HOWTO)

## Creating a software release

All software releases for GMOD should conform to a bare minimum
standard. First, the package should be easily 'installable.' That is, it
should be free of hard coded paths and other machine specific
parameters. In addition, the package should contain:

- A README document
- A INSTALL document
- A LICENSE file (containing an open source license; licenses used in
  GMOD projects include the GNU public license, BSD license, and the
  Perl artistic license)
- The source code
- An appropriate installation method:
  - For Perl modules, use Makefile.PL
  - Perl applications can be installed via Makefile.PL or an install
    script
  - For Java applications, use a suitable build tool, like Ant
  - For Java servelets that are distributed as war files, the war file
    should be in a tarball with the above mentioned documentation

Additionally, the following things are not absolutely required but are
strongly advised for GMOD projects:

- The application should contain a testing suite so that the user can
  verify proper builds.
- Packages should contain sample data for testing and trying out the
  application
- Including a tutorial for guiding the user on the application's use is
  a very good idea.
- For applications that interact with a relational database, it should
  be able to interact with a Chado database via a database adaptor.

Finally, a page describing the application and providing basic
information about the application should be provide for www.gmod.org.
This page should contain the following information:

- A brief summary describing the application
- Links to a demo or screenshot
- Links to installation documentation
- Links to downloads
- Author contact information

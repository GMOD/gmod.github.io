---
title: "XORT Presentation"
---
# XORT Presentation

This Wiki section is an edited version of
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8e/XORT.pdf" class="internal"
title="XORT.pdf">Josh Goodman and Pinglei Zhou's presentation</a>.

  Introduction](#Introduction)
- [Chado
  XML](#Chado_XML)
- [Components](#Components)
- [Highlights of
  Chado XML
  Specification](#Highlights_of_Chado_XML_Specification)
- [Putting it
  together: New FlyBase dataflow Part
  1](#Putting_it_together:_New_FlyBase_dataflow_Part_1)
- [Putting it
  together: New FlyBase dataflow Part
  2](#Putting_it_together:_New_FlyBase_dataflow_Part_2)
- [Data & Report
  Generation](#Data_.26_Report_Generation)
- [Hibernate &
  XORT](#Hibernate_.26_XORT)
- [Support for
  complex transactions using
  XORT](#Support_for_complex_transactions_using_XORT)
- [CHIA (Chado
  Interface
  Application)](#CHIA_.28Chado_Interface_Application.29)
- [Documentation](#Documentation)
- [Acknowledgements](#Acknowledgements)

##### Introduction

- An [XML](/wiki/Glossary#XML)-database mapping system for data
  exchange between DB and XML-driven application
- [XORT](/wiki/XORT.1) can handle typical XML, it's not
  <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>-specific
- Developed/Supported by Pinglei Zhou at FlyBase Harvard, 0.007 version
  now.
- Used at all FlyBase sites
  - Harvard has extensive library of Perl modules for generating
    ChadoXML
- Written in Perl
- Required Perl modules:
  - <a href="http://search.cpan.org/perldoc?XML::Parser::PerlSAX"
    class="external text" rel="nofollow">XML::Parser::PerlSAX</a>
  - <a href="http://search.cpan.org/perldoc?Unicode::String"
    class="external text" rel="nofollow">Unicode::String</a>
  - <a href="http://search.cpan.org/perldoc?XML::DOM" class="external text"
    rel="nofollow">XML::DOM</a>
  - <a href="http://search.cpan.org/perldoc?DBI" class="external text"
    rel="nofollow">DBI</a>

##### Chado XML

- Is [Chado XML](/wiki/Chado_XML) necessary? No, but it may help
  you.
- ChadoXML assists with incremental updates, if you want to avoid
  flush-and-reload.
- While update can be achived by other middleware (for example, perl
  Class::DBI, Java Hibernate), ChadoXML provide additional feature as
  way to archive your transaction.
- It provides bulk update/download which other methods lack or is
  inefficient

##### Components

- Database & Schema
- ChadoXML Specification
- DumpSpec
  - DumpSpec files are simple XML files that tell XORT what to do
  - DumpSpec files are *language independent*, being XML
  - It's fairly easy for those who know the schema to read these files
    and understand what the operation is

##### Highlights of Chado XML Specification

- Unique represent of specific database schema
- Get away with those internal primary key value
- Static vs. Operational
- Encoding for non-ASCII characters
- Macro mechanism (object reference)

##### Putting it together: New FlyBase dataflow Part 1

There are three Flybase sites, and most curation is done at Harvard and
Cambridge. Proforma is the curation format at Cambridge and Harvard, but
Harvard also curates with [Apollo](/wiki/Apollo.1) and ChadoXML.

Once in Chado, the reporting instance, there's a denormalization step in
moving data to a read-only database. Once in the read-only database
there are dumps, for reporting purposes, using XORT to create ChadoXML.
Once ChadoXML is created version 2 of XSLT is used to create HTML and
[GFF](/wiki/GFF). HTML reports are for human-readable reports,
[GFF](/wiki/GFF) for [GBrowse](/wiki/GBrowse.1) and for various
power users.

1.a. Proforma (FlyBase Cambridge) is converted to ChadoXML

1.b. ChadoXML is created by Apollo (Harvard)

1.c. ChadoXML is created by Java SEAN (Harvard)

2\. All ChadoXML is loaded into Chado by XORT

##### Putting it together: New FlyBase dataflow Part 2

3\. Chado (Harvard) is denormalized and loaded into Chado (Indiana)

4\. ChadoXML is created from Chado using XORT

5.a. [GFF](/wiki/GFF) and Fasta is created from ChadoXML

5.b. HTML is created from Chado XML

##### Data & Report Generation

- Content of all output files is controlled by XML dumpspecs.
  - Dumpspecs are language independent.
  - Easily readable (with knowledge of Chado structure).
- All XML transformation steps are done with XSLT v2.
  - Saxon XSLT
    (<a href="http://saxon.sourceforge.net/" class="external free"
    rel="nofollow">http://saxon.sourceforge.net/</a>)
  - ChadoXML is split into individual chunks before XSLT processing to
    accommodate large file sizes.
  - Extremely fast. We can process all data for ~60,000 Drosophila genes
    in under 30 minutes.

##### Hibernate & XORT

- Hibernate didn't scale well when dealing with 5,000+ features in bulk.
  - The test was simply calling `print()` statements
- Performance tweaks for Hibernate can be quite complicated to setup for
  bulk operations.
- XORT is currently handling ~6 million features in production with only
  minor performance problems.
- XORT is much more language independent.

##### Support for complex transactions using XORT

For example:

- Find all records linked to a record using dumpspec
- Merge gene x into y, each with thousands of records attached

Step 1. Dump all data use simple dumpspec

``` de1
 <chado>
  <feature dump=“all”>
   <uniquename test=“eq”>x</uniquename>
  </feature>
 </chado>
```

Step 2 Delete feature x from DB, with triggers to clean orphan records,
if necessary

Step 3. Edit the output xml, change uniquename x to y, then load the
edited file back to DB

##### CHIA (Chado Interface Application)

A Java application that organizes SQL and XORT functionality for
internal users, e.g.:

- Dump chado-XML for gene regions for Apollo curation
- Organize and execute “canned” SQL queries
- Serve IDs for curators (in development)
- Dynamic browser Chado without writing SQL statement

CHIA is being designed to be extensible for adding new functionality as
needed.



##### Documentation

- *Using Chado to Store Genome Annotation Data"*
  - Current Protocols in Bioinformatics (Baxevanis, A.D., and Davison,
    D.B., eds) 2, 9.6.1-9.6.28.
- XORT specification docs
- XORT draft (unpublished)
- GMOD case demo procedure
  - All in the doc directory of XORT package,
    <a href="http://www.gmod.org" class="external free"
    rel="nofollow">http://www.gmod.org</a>

##### Acknowledgements

- Willian Gelbart
- Chris Mungall
- David Emmert
- Mark Gibson
- Stan Letovsky
- Nomi Harris
- Frank Smutniak
- Suzanna Lewis
- Peili Zhang
- Stan Letovsky
- Haiyan Zhang
- Aubrey de Grey
- Andy Schroeder
- Don Gilbert
- Susan Russo
- Mark Zythovicz
- Scott Cain
- Lincoln Stein
- Victor Strelets
- Robert Wilson
- Paul Leyland

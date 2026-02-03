---
title: "XORT Presentation"
---




<span id="top"></span>




# <span dir="auto">XORT Presentation</span>









This Wiki section is an edited version of
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8e/XORT.pdf" class="internal"
title="XORT.pdf">Josh Goodman and Pinglei Zhou's presentation</a>.


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
- [<span class="tocnumber">2</span> <span class="toctext">Chado
  XML</span>](#Chado_XML)
- [<span class="tocnumber">3</span>
  <span class="toctext">Components</span>](#Components)
- [<span class="tocnumber">4</span> <span class="toctext">Highlights of
  Chado XML
  Specification</span>](#Highlights_of_Chado_XML_Specification)
- [<span class="tocnumber">5</span> <span class="toctext">Putting it
  together: New FlyBase dataflow Part
  1</span>](#Putting_it_together:_New_FlyBase_dataflow_Part_1)
- [<span class="tocnumber">6</span> <span class="toctext">Putting it
  together: New FlyBase dataflow Part
  2</span>](#Putting_it_together:_New_FlyBase_dataflow_Part_2)
- [<span class="tocnumber">7</span> <span class="toctext">Data & Report
  Generation</span>](#Data_.26_Report_Generation)
- [<span class="tocnumber">8</span> <span class="toctext">Hibernate &
  XORT</span>](#Hibernate_.26_XORT)
- [<span class="tocnumber">9</span> <span class="toctext">Support for
  complex transactions using
  XORT</span>](#Support_for_complex_transactions_using_XORT)
- [<span class="tocnumber">10</span> <span class="toctext">CHIA (Chado
  Interface
  Application)</span>](#CHIA_.28Chado_Interface_Application.29)
- [<span class="tocnumber">11</span>
  <span class="toctext">Documentation</span>](#Documentation)
- [<span class="tocnumber">12</span>
  <span class="toctext">Acknowledgements</span>](#Acknowledgements)



##### <span id="Introduction" class="mw-headline">Introduction</span>

- An [XML](Glossary#XML "Glossary")-database mapping system for data
  exchange between DB and XML-driven application
- [XORT](XORT.1 "XORT") can handle typical XML, it's not
  <a href="Chado" class="mw-redirect" title="Chado">Chado</a>-specific
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

##### <span id="Chado_XML" class="mw-headline">Chado XML</span>

- Is [Chado XML](Chado_XML "Chado XML") necessary? No, but it may help
  you.
- ChadoXML assists with incremental updates, if you want to avoid
  flush-and-reload.
- While update can be achived by other middleware (for example, perl
  Class::DBI, Java Hibernate), ChadoXML provide additional feature as
  way to archive your transaction.
- It provides bulk update/download which other methods lack or is
  inefficient

##### <span id="Components" class="mw-headline">Components</span>

- Database & Schema
- ChadoXML Specification
- DumpSpec
  - DumpSpec files are simple XML files that tell XORT what to do
  - DumpSpec files are *language independent*, being XML
  - It's fairly easy for those who know the schema to read these files
    and understand what the operation is

##### <span id="Highlights_of_Chado_XML_Specification" class="mw-headline">Highlights of Chado XML Specification</span>

- Unique represent of specific database schema
- Get away with those internal primary key value
- Static vs. Operational
- Encoding for non-ASCII characters
- Macro mechanism (object reference)

##### <span id="Putting_it_together:_New_FlyBase_dataflow_Part_1" class="mw-headline">Putting it together: New FlyBase dataflow Part 1</span>

There are three Flybase sites, and most curation is done at Harvard and
Cambridge. Proforma is the curation format at Cambridge and Harvard, but
Harvard also curates with [Apollo](Apollo.1 "Apollo") and ChadoXML.

Once in Chado, the reporting instance, there's a denormalization step in
moving data to a read-only database. Once in the read-only database
there are dumps, for reporting purposes, using XORT to create ChadoXML.
Once ChadoXML is created version 2 of XSLT is used to create HTML and
[GFF](GFF "GFF"). HTML reports are for human-readable reports,
[GFF](GFF "GFF") for [GBrowse](GBrowse.1 "GBrowse") and for various
power users.

1.a. Proforma (FlyBase Cambridge) is converted to ChadoXML

1.b. ChadoXML is created by Apollo (Harvard)

1.c. ChadoXML is created by Java SEAN (Harvard)

2\. All ChadoXML is loaded into Chado by XORT

##### <span id="Putting_it_together:_New_FlyBase_dataflow_Part_2" class="mw-headline">Putting it together: New FlyBase dataflow Part 2</span>

3\. Chado (Harvard) is denormalized and loaded into Chado (Indiana)

4\. ChadoXML is created from Chado using XORT

5.a. [GFF](GFF "GFF") and Fasta is created from ChadoXML

5.b. HTML is created from Chado XML

##### <span id="Data_.26_Report_Generation" class="mw-headline">Data & Report Generation</span>

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

##### <span id="Hibernate_.26_XORT" class="mw-headline">Hibernate & XORT</span>

- Hibernate didn't scale well when dealing with 5,000+ features in bulk.
  - The test was simply calling `print()` statements
- Performance tweaks for Hibernate can be quite complicated to setup for
  bulk operations.
- XORT is currently handling ~6 million features in production with only
  minor performance problems.
- XORT is much more language independent.

##### <span id="Support_for_complex_transactions_using_XORT" class="mw-headline">Support for complex transactions using XORT</span>

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

##### <span id="CHIA_.28Chado_Interface_Application.29" class="mw-headline">CHIA (Chado Interface Application)</span>

A Java application that organizes SQL and XORT functionality for
internal users, e.g.:

- Dump chado-XML for gene regions for Apollo curation
- Organize and execute “canned” SQL queries
- Serve IDs for curators (in development)
- Dynamic browser Chado without writing SQL statement

CHIA is being designed to be extensible for adding new functionality as
needed.

  

##### <span id="Documentation" class="mw-headline">Documentation</span>

- *Using Chado to Store Genome Annotation Data"*
  - Current Protocols in Bioinformatics (Baxevanis, A.D., and Davison,
    D.B., eds) 2, 9.6.1-9.6.28.
- XORT specification docs
- XORT draft (unpublished)
- GMOD case demo procedure
  - All in the doc directory of XORT package,
    <a href="http://www.gmod.org" class="external free"
    rel="nofollow">http://www.gmod.org</a>

##### <span id="Acknowledgements" class="mw-headline">Acknowledgements</span>

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




[Categories](Special%253ACategories "Special%253ACategories"):

- [FlyBase](Category%253AFlyBase "Category%253AFlyBase")
- [XORT](Category%253AXORT "Category%253AXORT")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/XORT_Presentation" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:54 on 9 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">16,595 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





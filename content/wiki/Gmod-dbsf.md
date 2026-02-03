---
title: "Gmod-dbsf"
---




<span id="top"></span>




# <span dir="auto">Gmod-dbsf</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Overview</span>](#Overview)
- [<span class="tocnumber">2</span>
  <span class="toctext">Dependencies</span>](#Dependencies)
- [<span class="tocnumber">3</span>
  <span class="toctext">Features</span>](#Features)
- [<span class="tocnumber">4</span>
  <span class="toctext">Examples</span>](#Examples)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Websites
    using it</span>](#Websites_using_it)
  - [<span class="tocnumber">4.2</span> <span class="toctext">Drupal
    modules using it</span>](#Drupal_modules_using_it)
  - [<span class="tocnumber">4.3</span> <span class="toctext">Examples
    of capabilities</span>](#Examples_of_capabilities)
- [<span class="tocnumber">5</span> <span class="toctext">Demos and
  Screenshots</span>](#Demos_and_Screenshots)
- [<span class="tocnumber">6</span>
  <span class="toctext">License</span>](#License)



# <span id="Overview" class="mw-headline">Overview</span>

The GMOD Drupal Bioinformatic Server Framework (GMOD-DBSF) is an
Application Programming Interface module for the
<a href="http://drupal.org" class="external text"
rel="nofollow">Drupal</a> CMS which simplifies programming bioinformatic
Drupal modules. This Drupal API is not a visualization module, like
[Tripal](Tripal.1 "Tripal"). It is aimed for developers and seeks to
make the co-existence of Chado and Drupal seamless to the end-user and
reduces the learning curve for the bioinformatic community. It was
developed with the non-model species community in mind and is especially
interested in enhancing support for non-genome data types. It is an
open-source package and the community is invited to contribute to its
development.

It is freely available from
<a href="http://drupal.org/project/gmod_dbsf" class="external free"
rel="nofollow">http://drupal.org/project/gmod_dbsf</a> and
<a href="http://gmod-dbsf.googlecode.com" class="external free"
rel="nofollow">http://gmod-dbsf.googlecode.com</a> with the latter being
a more complete repository.

# <span id="Dependencies" class="mw-headline">Dependencies</span>

GMOD-DBSF depends on Drupal 6.

# <span id="Features" class="mw-headline">Features</span>

GMOD-DBSF offers:

- imports a subset of the Chado tables to Drupal
- creates new tables in Drupal using Chado-conventions in order to
  better support sequence-less features.
- provides functions to communicate with Chado and Drupal database
  schemas
- provides other, generic, functions useful for bioinformatic module
  development.
- makes use of other GMOD tools such as BioPerl

# <span id="Examples" class="mw-headline">Examples</span>

## <span id="Websites_using_it" class="mw-headline">Websites using it</span>

The <a href="http://insectacentral.org" class="external text"
rel="nofollow">InsectaCentral</a> database is coded using the GMOD-DBSF
engine and the custom genes4all module for visualization

## <span id="Drupal_modules_using_it" class="mw-headline">Drupal modules using it</span>

- The [Bioinformatics Software
  Bench](Biosoftware_bench "Biosoftware bench")
- The [genes4all](Genes4all "Genes4all") visualization project.

## <span id="Examples_of_capabilities" class="mw-headline">Examples of capabilities</span>

- Chado manipulation:
  - The function gmod_dbsf_add_cv() allows for one to add a new
    Controlled Vocabulary (CV) by providing the name of the CV and an
    array with the CV terms they wish to add.
  - This and other functions can connect to a Chado database via the
    gmod_dbsf_db_execute() function or operate on the local Drupal
    database (or make use of the gmod_dbsf_is_chado(), an auto-detect
    function).
  - Similar functions operate to add, delete and populate the feature,
    db, pub and other Chado tables: ancillary Chado tables, such as the
    featureprop, feature_cvterm tables, often require complicated SQL
    commands with multiple joins and a number of gmod_dbsf functions
    cater to simplify manipulating these tables by simply passing the
    desired variables. Thus a featureprop table can be populated with a
    single line of code which passes the feature ID or feature name, the
    CV term and properties one wishes to associate.

<!-- -->

- Secure approaches for often-used tasks:
  - The gmod_dbsf_create_uid() function creates a unique MD5 identifier,
    based on a user's session ID, time and optionally a text string,
    which can be used for file uploads.
  - The gmod_dbsf_batch_upload_fasta() function allows web-users to
    upload a FASTA file to the server even if it is many megabytes large
    or takes a considerable amount of time
  - A few functions have been created to make use of BioPerl functions,
    for example:
    - Creating and parsing GFF3 files
    - The gmod_dbsf_get_taxonomy_from_ncbi() function uses
      Bio::DB::Taxon to query NCBI (via Entrez or via a local NCBI
      Taxonomy database flatfile) for the taxonomy of a species.
- and an evergrowing list of many others...

  

# <span id="Demos_and_Screenshots" class="mw-headline">Demos and Screenshots</span>

- A <a href="http://www.scivee.tv/node/20322" class="external text"
  rel="nofollow">screencast on how to install</a>

# <span id="License" class="mw-headline">License</span>

This software is GPLv2+ licensed as part of the Drupal package. It is
currently supported by [Alexie
Papanicolaou](User%253AAlpapan "User%253AAlpapan") while at CSIRO, the
Australian Commonwealth Scientific and Research Organization
(<a href="http://www.csiro.au" class="external free"
rel="nofollow">http://www.csiro.au</a>).




[Categories](Special%253ACategories "Special%253ACategories"):

- [Drupal](Category%253ADrupal "Category%253ADrupal")
- [Chado](Category%253AChado "Category%253AChado")
- [Web services](Category%253AWeb_services "Category%253AWeb services")
- [External](Category%253AExternal "Category%253AExternal")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Gmod-2Ddbsf" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:27 on 29 December
  2010.</span>
<!-- - <span id="footer-info-viewcount">36,997 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





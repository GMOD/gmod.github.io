---
title: "Genes4all"
---




<span id="top"></span>




# <span dir="auto">Genes4all</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Overview</span>](#Overview)
- [<span class="tocnumber">2</span>
  <span class="toctext">Dependencies</span>](#Dependencies)
- [<span class="tocnumber">3</span>
  <span class="toctext">Features</span>](#Features)
- [<span class="tocnumber">4</span> <span class="toctext">Demos and
  Screenshots</span>](#Demos_and_Screenshots)
- [<span class="tocnumber">5</span>
  <span class="toctext">License</span>](#License)



# <span id="Overview" class="mw-headline">Overview</span>

Genes4all is a visualization module for the
<a href="http://drupal.org" class="external text"
rel="nofollow">Drupal</a> CMS. It is species and data-type neutral and
unlike most Drupal modules, it relies on dynamically generated content
and does not store much information on the Drupal database (i.e. does
not create nodes).It currently drives the
<a href="http://insectacentral.org" class="external text"
rel="nofollow">InsectaCentral</a> database, an insect transcriptome
database with 1,578,321 gene models from 12,800,018 ESTs.

It is not yet fit for public consumption but Drupal developers can get a
taste from
<a href="http://drupal.org/project/gmod_dbsf" class="external free"
rel="nofollow">http://drupal.org/project/gmod_dbsf</a> and
<a href="http://gmod-dbsf.googlecode.com" class="external free"
rel="nofollow">http://gmod-dbsf.googlecode.com</a>.

# <span id="Dependencies" class="mw-headline">Dependencies</span>

Genes4all is written for Drupal 6 and it depends on the Drupal gmod_dbsf
module
(<a href="http://drupal.org/project/gmod_dbsf" class="external free"
rel="nofollow">http://drupal.org/project/gmod_dbsf</a>). It requires
BioPerl.

# <span id="Features" class="mw-headline">Features</span>

Genes4all is built with the notion that Chado is a read-only data
warehouse where only administrators can edit it but web-users can
retrieve data. The Drupal database offers a bidirectional interface with
the users.

- Currently these two are publicly available:
  - genes4all_experiment - RNAi experiment databasing module is an
    ontology-driven system which was built for the Lepidoptera RNAi
    Working Group and can be adapted for other types of experiments.
  - genes4all_download - Download est2assembly data which have been
    stored in Chado.

<!-- -->

- Other modules deployed in InsectaCentral but not available to
  developers yet:
  - genes4all_explore - Create gene pages for sequence features directly
    from Chado
  - genes4all_curation - Provide a community curation system where web
    users write to the Drupal database and curators can visually 'save'
    accepted annotations to Chado.

<!-- -->

- - These modules are currently being developed.
  - genes4all_upload - upload your est2assembly transcriptome assembly
    for integration into a genes4all database.
  - Integration with the
    <a href="http://geneious.com" class="external text"
    rel="nofollow">Geneious</a> software and provide other web services

For the 2011-2012 season we are planning to go beyond transcriptome data
and support genomes as well as ecological and geographical characters.

# <span id="Demos_and_Screenshots" class="mw-headline">Demos and Screenshots</span>

- A <a href="http://www.scivee.tv/node/20326" class="external text"
  rel="nofollow">screencast on how to use the RNAi experiment module</a>.

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Genes4all" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:43 on 29 December
  2010.</span>
<!-- - <span id="footer-info-viewcount">23,600 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





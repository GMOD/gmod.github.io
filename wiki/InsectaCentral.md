



<span id="top"></span>




# <span dir="auto">InsectaCentral</span>










<a href="http://insectacentral.org" rel="nofollow"
title="InsectaCentral"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/9b/InsectaCentralLogo.png" width="93"
height="75" alt="InsectaCentral" /></a>



## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Overview</span>](#Overview)
- [<span class="tocnumber">2</span>
  <span class="toctext">Aim</span>](#Aim)
- [<span class="tocnumber">3</span> <span class="toctext">Data
  Origin</span>](#Data_Origin)
- [<span class="tocnumber">4</span>
  <span class="toctext">Quality</span>](#Quality)
- [<span class="tocnumber">5</span>
  <span class="toctext">Content</span>](#Content)
  - [<span class="tocnumber">5.1</span>
    <span class="toctext">Roadmap</span>](#Roadmap)
  - [<span class="tocnumber">5.2</span>
    <span class="toctext">Wishlist</span>](#Wishlist)
- [<span class="tocnumber">6</span>
  <span class="toctext">Software</span>](#Software)
  - [<span class="tocnumber">6.1</span>
    <span class="toctext">Roadmap</span>](#Roadmap_2)
- [<span class="tocnumber">7</span>
  <span class="toctext">Wishlist</span>](#Wishlist_2)
- [<span class="tocnumber">8</span>
  <span class="toctext">License</span>](#License)



# <span id="Overview" class="mw-headline">Overview</span>

The <a href="http://insectacentral.org" class="external text"
rel="nofollow">InsectaCentral</a> database is a unique insect
transcriptome database built by GMOD components. The database schema is
driven by <a href="Chado" class="mw-redirect" title="Chado">Chado</a>,
<a href="http://search.cpan.org/perldoc?Bio::DB::SeqFeature::Store"
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a> and
the [Drupal](Drupal "Drupal") modules of
<a href="GMOD-DBSF" class="mw-redirect" title="GMOD-DBSF">GMOD-DBSF</a>.
The software developed for this project aim to be species neutral and
when released anyone can make a *Central* database.

# <span id="Aim" class="mw-headline">Aim</span>

InsectaCentral is a central repository of Insect transcriptomes,
produced using traditional capillary (Sanger) sequencing or 454 Next
Generation pyrosequencing
(<a href="NGS" class="mw-redirect" title="NGS">NGS</a>). Our aim is to
allow the thousands of researchers working on species without a huge
Genome Consortium and rolling database funding to make use of their own
and the community's data in a streamlined, efficient and standardized
fashion. Support for other data types is being implemented.

# <span id="Data_Origin" class="mw-headline">Data Origin</span>

Data are acquired from NCBI's dbEST, Short Read Archive and GenBank. We
also process private datasets, from our laboratory or collaborators,

We process them using est2assembly and stored in GMOD's chado database.
We use this data warehouse to allow you to search using pre-annotated
information and you can explore each gene/protein object using GBrowse,
driven by BioPerl's Bio::SeqFeature database.

# <span id="Quality" class="mw-headline">Quality</span>

We provide deep annotation using BLAST similarity analysis to many
databases, Electronic Inference Annotation of GO, EC and KEGG terms and
also provide InterProScan domains. This process requires tremendous
computational power, so re-annotation is done sparingly. In addition, as
there is no dedicated funding, we do not manually curate any of the
datasets but we would do so should the opportunity arise. Likewise, as
we do not have a head curator, we cannot implement a Community
Annotation System even though we would very much like to. Should you be
interested in supporting us to help you, then a simple email will set
things in motion.

# <span id="Content" class="mw-headline">Content</span>

The database is being constantly expanded as analysis of data progresses
and support for new data types is implemented.

The current public release is: **beta**

## <span id="Roadmap" class="mw-headline">Roadmap</span>

- **Alpha** ~~EST datasets funded by/collaborated with RFC lab; EST
  datasets of special interest; in-depth annotation~~
- **Beta** ~~Molecular markers; All Insecta transcriptomes;
  documentation~~
- **1.0** Implementation of a community curation system;Tutorials;
  Solexa digital transcriptomics; preparation of manuscript
- **1.5** Homeless insect genomes + DAS genomes of interest
- **2.0** Geographical and population data of Insects in collaboration
  with the Atlas of Living Australia.

## <span id="Wishlist" class="mw-headline">Wishlist</span>

- [GBrowse](GBrowse.1 "GBrowse") 2.x
- Head curator to supervise community gene models

# <span id="Software" class="mw-headline">Software</span>

Once the software is ready for public release it's source will be
offered for laboratories to create InsectaCentral clones for use with
any laboratory's private data. The processing of the data is
accomplished with est2assembly, which is already available.

The current public release is: **beta**

## <span id="Roadmap_2" class="mw-headline">Roadmap</span>

- **Alpha** ~~Most of ButterflyBase's user interface; support for
  Sanger/454 EST data, SNP markers, BLASTs, ontology-based annotation;
  support for public + secure (private) data; Chado database engine;
  SeqFeature/Gbrowse driven exploration; iceBLAST interface~~
- **Beta** ~~Support for sample library information; extended user
  interface; documentation; Drupalization of an extended BLAST
  interface; curation module~~
- **1.0** Support for digital transcriptomics; Walkthrough/tutorials;
  Further Drupal standardization; preparation of manuscript
- **2.0** Support for geographical and population data; interface with
  Google Earth/Atlas of Living Australia; support for basic phylogenetic
  information

# <span id="Wishlist_2" class="mw-headline">Wishlist</span>

- Sun Grid Engine support

# <span id="License" class="mw-headline">License</span>

This software is GPLv2+ licensed as part of the Drupal package. It is
currently supported by [Alexie
Papanicolaou](User%253AAlpapan "User%253AAlpapan") while at CSIRO, the
Australian Commonwealth Scientific and Research Organization
(<a href="http://www.csiro.au" class="external free"
rel="nofollow">http://www.csiro.au</a>).




[Categories](Special%253ACategories "Special%253ACategories"):

- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
- [Drupal](Category%253ADrupal "Category%253ADrupal")
- [GMOD Community](Category%253AGMOD_Community "Category%253AGMOD Community")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/InsectaCentral" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 01:37 on 3 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">15,959 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





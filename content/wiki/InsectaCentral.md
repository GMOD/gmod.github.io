---
title: "InsectaCentral"
---
# InsectaCentral


<a href="http://insectacentral.org" rel="nofollow"
title="InsectaCentral"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/9b/InsectaCentralLogo.png" width="93"
height="75" alt="InsectaCentral" /></a>


  Overview](#Overview)
- [Aim](#Aim)
- [Data
  Origin](#Data_Origin)
- [Quality](#Quality)
- [Content](#Content)
  - [Roadmap](#Roadmap)
  - [Wishlist](#Wishlist)
- [Software](#Software)
  - [Roadmap](#Roadmap_2)
- [Wishlist](#Wishlist_2)
- [License](#License)


# Overview

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

# Aim

InsectaCentral is a central repository of Insect transcriptomes,
produced using traditional capillary (Sanger) sequencing or 454 Next
Generation pyrosequencing
(<a href="NGS" class="mw-redirect" title="NGS">NGS</a>). Our aim is to
allow the thousands of researchers working on species without a huge
Genome Consortium and rolling database funding to make use of their own
and the community's data in a streamlined, efficient and standardized
fashion. Support for other data types is being implemented.

# Data Origin

Data are acquired from NCBI's dbEST, Short Read Archive and GenBank. We
also process private datasets, from our laboratory or collaborators,

We process them using est2assembly and stored in GMOD's chado database.
We use this data warehouse to allow you to search using pre-annotated
information and you can explore each gene/protein object using GBrowse,
driven by BioPerl's Bio::SeqFeature database.

# Quality

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

# Content

The database is being constantly expanded as analysis of data progresses
and support for new data types is implemented.

The current public release is: **beta**

## Roadmap

- **Alpha** ~~EST datasets funded by/collaborated with RFC lab; EST
  datasets of special interest; in-depth annotation~~
- **Beta** ~~Molecular markers; All Insecta transcriptomes;
  documentation~~
- **1.0** Implementation of a community curation system;Tutorials;
  Solexa digital transcriptomics; preparation of manuscript
- **1.5** Homeless insect genomes + DAS genomes of interest
- **2.0** Geographical and population data of Insects in collaboration
  with the Atlas of Living Australia.

## Wishlist

- [GBrowse](GBrowse.1 "GBrowse") 2.x
- Head curator to supervise community gene models

# Software

Once the software is ready for public release it's source will be
offered for laboratories to create InsectaCentral clones for use with
any laboratory's private data. The processing of the data is
accomplished with est2assembly, which is already available.

The current public release is: **beta**

## Roadmap

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

# Wishlist

- Sun Grid Engine support

# License

This software is GPLv2+ licensed as part of the Drupal package. It is
currently supported by [Alexie
Papanicolaou](User%253AAlpapan "User%253AAlpapan") while at CSIRO, the
Australian Commonwealth Scientific and Research Organization
(<a href="http://www.csiro.au" class="external free"
rel="nofollow">http://www.csiro.au</a>).

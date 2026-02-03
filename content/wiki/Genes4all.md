---
title: "Genes4all"
---
# Genes4all

  Overview](#Overview)
- [Dependencies](#Dependencies)
- [Features](#Features)
- [Demos and
  Screenshots](#Demos_and_Screenshots)
- [License](#License)

# Overview

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

# Dependencies

Genes4all is written for Drupal 6 and it depends on the Drupal gmod_dbsf
module
(<a href="http://drupal.org/project/gmod_dbsf" class="external free"
rel="nofollow">http://drupal.org/project/gmod_dbsf</a>). It requires
BioPerl.

# Features

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
- Other modules deployed in InsectaCentral but not available to
  developers yet:
  - genes4all_explore - Create gene pages for sequence features directly
    from Chado
  - genes4all_curation - Provide a community curation system where web
    users write to the Drupal database and curators can visually 'save'
    accepted annotations to Chado.
- - These modules are currently being developed.
  - genes4all_upload - upload your est2assembly transcriptome assembly
    for integration into a genes4all database.
  - Integration with the
    <a href="http://geneious.com" class="external text"
    rel="nofollow">Geneious</a> software and provide other web services

For the 2011-2012 season we are planning to go beyond transcriptome data
and support genomes as well as ecological and geographical characters.

# Demos and Screenshots

- A <a href="http://www.scivee.tv/node/20326" class="external text"
  rel="nofollow">screencast on how to use the RNAi experiment module</a>.

# License

This software is GPLv2+ licensed as part of the Drupal package. It is
currently supported by [Alexie
Papanicolaou](/wiki/User%253AAlpapan) while at CSIRO, the
Australian Commonwealth Scientific and Research Organization
(<a href="http://www.csiro.au" class="external free"
rel="nofollow">http://www.csiro.au</a>).

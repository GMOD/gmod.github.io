---
title: "Gmod-dbsf"
---
# Gmod-dbsf

  Overview](#Overview)
- [Dependencies](#Dependencies)
- [Features](#Features)
- [Examples](#Examples)
  - [Websites
    using it](#Websites_using_it)
  - [Drupal
    modules using it](#Drupal_modules_using_it)
  - [Examples
    of capabilities](#Examples_of_capabilities)
- [Demos and
  Screenshots](#Demos_and_Screenshots)
- [License](#License)

# Overview

The GMOD Drupal Bioinformatic Server Framework (GMOD-DBSF) is an
Application Programming Interface module for the
<a href="http://drupal.org" class="external text"

Drupal modules. This Drupal API is not a visualization module, like
[Tripal](/wiki/Tripal.1). It is aimed for developers and seeks to
make the co-existence of Chado and Drupal seamless to the end-user and
reduces the learning curve for the bioinformatic community. It was
developed with the non-model species community in mind and is especially
interested in enhancing support for non-genome data types. It is an
open-source package and the community is invited to contribute to its
development.

It is freely available from
<a href="http://drupal.org/project/gmod_dbsf" class="external free"

<a href="http://gmod-dbsf.googlecode.com" class="external free"

a more complete repository.

# Dependencies

GMOD-DBSF depends on Drupal 6.

# Features

GMOD-DBSF offers:

- imports a subset of the Chado tables to Drupal
- creates new tables in Drupal using Chado-conventions in order to
  better support sequence-less features.
- provides functions to communicate with Chado and Drupal database
  schemas
- provides other, generic, functions useful for bioinformatic module
  development.
- makes use of other GMOD tools such as BioPerl

# Examples

## Websites using it

The <a href="http://insectacentral.org" class="external text"

engine and the custom genes4all module for visualization

## Drupal modules using it

- The [Bioinformatics Software
  Bench](/wiki/Biosoftware_bench)
- The [genes4all](/wiki/Genes4all) visualization project.

## Examples of capabilities

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

# Demos and Screenshots

- A <a href="http://www.scivee.tv/node/20322" class="external text"
  rel="nofollow">screencast on how to install</a>

# License

This software is GPLv2+ licensed as part of the Drupal package. It is
currently supported by [Alexie
Papanicolaou](/wiki/User:Alpapan) while at CSIRO, the
Australian Commonwealth Scientific and Research Organization
(<a href="http://www.csiro.au" class="external free"

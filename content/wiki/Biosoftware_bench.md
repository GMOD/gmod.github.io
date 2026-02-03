---
title: "Biosoftware bench"
---
# Biosoftware bench

  Overview](#Overview)
- [Dependencies](#Dependencies)
- [Features](#Features)
  - [For the
    system administrator:](#For_the_system_administrator:)
  - [For the
    end-user:](#For_the_end-user:)
- [Demos and
  Screenshots](#Demos_and_Screenshots)
- [License](#License)

# Overview

The Bioinformatic Software Bench (BSB) for Drupal allows for a rapid and
secure deployment of bioinformatic software. The BLAST, InterProScan,
SSAHA2 and annot8r software are provided by default and plugins for new
software can be readily written. An innovative graphical user interface
guides both end-user and administration of the software, including the
secure provision of pre-publication datasets.

It is available from
<a href="http://drupal.org/project/biosoftware_bench"
class="external free"
rel="nofollow">http://drupal.org/project/biosoftware_bench</a> or
<a href="http://gmod-dbsf.googlecode.com" class="external free"
rel="nofollow">http://gmod-dbsf.googlecode.com</a> with the latter being
a more complete repository.

# Dependencies

BSB is written for
<a href="http://drupal.org" class="external text" rel="nofollow">Drupal
6</a> and it depends on the Drupal gmod_dbsf module
(<a href="http://drupal.org/project/gmod_dbsf" class="external free"
rel="nofollow">http://drupal.org/project/gmod_dbsf</a>). The NCBI
BLASTALL package and other relevant software for each plugin are
required in order to provide the relevant facilities but administrators
can choose which software to enable.

# Features

It has a number of attractive features:

## For the system administrator:

- Secure & fast to deploy: the demonstration required 30' to setup from
  scratch, 10' of which was the BLAST server. The administrator has to
  merely click on a checkbox to activate the software and then choose
  which databases will be available to the plugins.
- Secure with private data: We know that laboratories often have two
  types of data: those they wish to make public and the unpublished ones
  they wish to utilize only in-house. The solution is often the creation
  of two separate servers, one password protected. The DBFS takes care
  of user management and allows you to choose which datasets are
  available to which users. An unlimited number of user groups can be
  created included the anonymous/guest visitor who has not logged in.
- Plugin format: It comes with NCBI's BLASTALL but DBFS is an API
  framework and easy to extend, our publication will have a manual as
  supplementary material to guide bioinformaticians in writing their
  plugins with 1-2 days.
- High Performance Computing (HPC) support: Optionally, it can utilise
  the Condor job management system so jobs run on a PC-farm instead of
  the often meek BLAST server. A perl daemon manages the submissions
  automatically.
- Database API is Chado-compatible: It is GMOD compatible and uses the
  robust, normalized Chado database. As Chado is sequence feature-driven
  we created sequence-less table set which follows Chado-convention. The
  future aim is to be able to integrate multiple website deploying this
  software.

## For the end-user:

- Build for wet-lab researchers. They can upload a multi-FASTA file to
  be used as the query or even the reference database: there is no need
  to restrict the user to the administrator's datasets. The file size
  limit is customizable. Users can bookmark their search and re-retrieve
  it within 7 days. Further, they can simultaneously run multiple BLAST
  algorithm searches.
- Driven by open-source software and adheres to community standards: The
  output is driven by BioPerl? (XML, HTML, TXT and a graph using
  Bio::Graphics). The database infrastructure is GMOD-compatible and the
  visualization is securely managed by Drupal.

# Demos and Screenshots

- A <a href="http://www.scivee.tv/node/20325" class="external text"
  rel="nofollow">screencast on how to install it</a>



# License

This software is GPLv2+ licensed as part of the Drupal package. It is
currently supported by [Alexie
Papanicolaou](/wiki/User%253AAlpapan) while at CSIRO, the
Australian Commonwealth Scientific and Research Organization
(<a href="http://www.csiro.au" class="external free"
rel="nofollow">http://www.csiro.au</a>).

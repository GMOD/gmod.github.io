---
title: "Bioperl Pipeline"
---
# Bioperl Pipeline

> The item described in this page is not (or is no longer) supported by
> the GMOD project.
> This page is included only for reference purposes.

See <a href="Ergatis" class="mw-redirect" title="Ergatis">Ergatis</a>,
[Galaxy](Galaxy.1 "Galaxy"), [Genome grid](Genome_grid "Genome grid"),
[DIYA](DIYA "DIYA") and [MAKER](MAKER.1 "MAKER") for currently supported
workflow and analysis packages.

  Description](#Description)
- [Requirements](#Requirements)
- [Getting the
  Software](#Getting_the_Software)
- [Mailing
  List](#Mailing_List)
- [Affiliated
  projects](#Affiliated_projects)

## Description

The <a href="http://www.genome.org/cgi/content/full/13/8/1904"
class="external text" rel="nofollow">Bioperl pipeline framework</a> is a
flexible workflow system that complements the Bioperl package by
providing job management facilities for high throughput sequence
analysis. It also known as Biopipe. This system is heavily inspired by
the EnsEMBL Pipeline system.

- Handling of various input and output data formats from various
  databases.
- A bioperl interface to non-specific loadsharing software (LSF,PBS etc)
  to ensure that the various analysis programs are run in proper order
  and are successfully completed while re-running those that fail.
- A flexible pluggable bioperl interface that allows programs to be
  'pipeline-enabled'. Setting up bioinformatics pipeline is not trivial.
  This tutorial introduces some aspects of biopipe through setting up a
  very simple blast pipeline and a protein analysis pipeline.It is hope
  that through this tutorial, two objectives are achieved:
- Iron out installation issues using a simple example.
- Familiarization with the biopipe system and introduction of the XML
  system we have develop to ameliorate some of the complexities involve
  in setting up.

## Requirements

- <a href="http://www.perl.com/" class="external text" rel="nofollow">Perl
  5.6 or later</a>
- <a href="http://www.mysql.com/" class="external text"
  rel="nofollow">MySQL</a>
- <a href="http://bioperl.org/wiki/Main_Page" class="external text"
  rel="nofollow">Bioperl Packages</a>:
  - bioperl-pipeline
  - bioperl-live
  - bioperl-run

## Getting the Software

You can download the CVS version of bioperl-pipeline from
<a href="http://code.open-bio.org/cgi/viewcvs.cgi/"
class="external text" rel="nofollow">Bioperl CVS</a>

    cvs -d :pserver:cvs@cvs.open-bio.org:/home/repository/bioperl co bioperl-pipeline



## Mailing List

<a href="http://bioperl.org/mailman/listinfo/bioperl-pipeline"
class="external text" rel="nofollow">Mailing list</a>



## Affiliated projects

<a href="http://www.maizegdb.org/" class="external text"
rel="nofollow">Maize annotation project</a>

<a href="http://www.top-registry-cleaner.org/" class="external text"
rel="nofollow">system registry cleaner</a>

[ParameciumDB](ParameciumDB "ParameciumDB")

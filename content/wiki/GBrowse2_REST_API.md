---
title: "GBrowse2 REST API"
---
# GBrowse2 REST API

This article describes the **GBrowse2 REST API**.

_For the main GBrowse 2.0 HOWTO article, see: [GBrowse 2.0
HOWTO](GBrowse_2.0_HOWTO "GBrowse 2.0 HOWTO")._

  REST API</span>](#The_GBrowse2_REST_API)
  - [Getting
    Information from the
    Server](#Getting_Information_from_the_Server)
    - [Getting a List of
      Sources](#Getting_a_List_of_Sources)
    - [Getting Tracks from a Particular
      Datasource](#Getting_Tracks_from_a_Particular_Datasource)
    - [Getting Chromosome
      Sizes](#Getting_Chromosome_Sizes)
    - [Downloading a
      Track](#Downloading_a_Track)
  - [Generating
    Static Images](#Generating_Static_Images)
  - [Focusing
    on a Region](#Focusing_on_a_Region)
  - [Managing
    Sessions](#Managing_Sessions)
  - [Centering
    on a region](#Centering_on_a_region)
  - [Selecting
    Tracks and Subtracks](#Selecting_Tracks_and_Subtracks)
  - [Uploading
    Datasets](#Uploading_Datasets)
  - [Linking to
    Remote Datasets](#Linking_to_Remote_Datasets)
  - [Obtaining
    Metadata](#Obtaining_Metadata)

# The GBrowse2 REST API

## Getting Information from the Server

You can get a list of public data sources from the GBrowse server, and
interrogate each one for a list and description of the tracks it
supports.

### Getting a List of Sources

Invoke gbrowse with "action=list":

    http://somewhere.com/gb2/gbrowse/?action=list

This will return a plain text tab-delimited document like the following:

    # Name   Description                Species                   TaxID CoordinateType  BuildAuthority  BuildVersion BuildURL
    elegans  C. elegans genes           Caenorhabditis elegans    6239  Chromosome      WS              180          http://www.dasregistry.org/coordsys/CS_DS109
    yeast    Yeast chromosomes 1+2      Saccharomyces cerevisiae  4932  Chromosome      SGD             1            http://www.dasregistry.org/coordsys/CS_DS69
    bamtest  BAM/SAM Test
    homo_36  Human NCI 36i coordinates
    volvox   Volvox Tutorial Database

Each row is a data source. The fields are:

Name
Data source name to use in subsequent calls to gbrowse.

Description
Human readable text describing the data source

Species (optional)
Human readable species name.

TaxID (optional)
NCBI taxon ID.

CoordinateType (optional)
Description of the type of coordinate, such as "Chromosome" or "Contig"

BuildAuthority (optional)
The group that maintains the coordinate system. See
<a href="http://www.dasregistry.org/help_coordsys.jsp"
class="external free"
rel="nofollow">http://www.dasregistry.org/help_coordsys.jsp</a> for a
list of codes.

BuildVersion (optional)
Version of the build.

BuildURL (optional)
URL that will provide information about the build (can also be used as a
unique ID for the build).

These fields are derived from GBrowse.conf and the "metadata" option in
the configuration file for the data source. Also see
[GBrowse_2.0_HOWTO#The_GENERAL_Section](GBrowse_2.0_HOWTO#The_GENERAL_Section "GBrowse 2.0 HOWTO").

### Getting Tracks from a Particular Datasource

Given a datasource name returned by "action=list", you may retrieve
information about each track that is publicly exported by the
datasource. Note that the maintainer of the datasource may elect not to
make information on all tracks available. Append the datasource name to
the gbrowse URL, and use "action=scan":

    http://somewhere.com/gb2/gbrowse/SOURCE/?action=scan

This will return a text/plain document similar to the following:

    # Discoverable tracks from http://localhost/gb2/gbrowse/yeast/
    [Genes]
    key      = Named gene

    [CDS]
    key      = CDS
    citation = This track shows CDS reading frames.

    [tRNAs]
    key      = tRNAs

    [Transp]
    key      = Transposons

    [LTRs]
    key      = Long Terminal Repeats

    [Translation]
    key      = 6-frame translation

    [TranslationF]
    key      = 3-frame translation (forward)

    [DNA GC content]
    key      = DNA and/or GC Content

    [TranslationR]
    key      = 3-frame translation (reverse)

    [ncRNA]
    key      = Noncoding RNAs

Each \[stanza\] contains the track name, and is followed by zero or more
option=value pairs. The possible options that can be returned are:

key
The human-readable track title.

citation
The human-readable track citation.

data source
The value of the **data source** option, which can be used to identify
where the track data originated.

track source
The value of the **track source** option, which can be used to identify
a mirrored track.

select
A space-delimited list of subtrack selection names. These can be used to
selectively turn on particular subtracks using the syntax described in
[\#Selecting Tracks and Subtracks](#Selecting_Tracks_and_Subtracks).

### Getting Chromosome Sizes

To get the list of chromosomes and their sizes from a datasource, invoke
the gbrowse URL with "action=chrom_sizes":

    http://somewhere.com/gb2/gbrowse/SOURCE/?action=chrom_sizes

You will get a text file like the following:

    ##species http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id=6239
    ##genome-build WS180
    II  15279316
    MtDNA   13794
    V   20919568
    X   17718851
    III 13783681
    IV  17493785
    I   15072421

The first column is the chromosome name. The second column is its size
in bases. If the appropriate metadata was provided, the first few lines
will contain taxon and genome build information as shown in the example.

### Downloading a Track

To download the data from a track, invoke the gbrowse URL with

    $URL/?gbgff=1;l=<trackname>

where \<trackname\> is the name of a track obtained from "scan" (see
above). This will immediately start downloading the track data in the
most appropriate format.

To limit the downloaded region to a chromosome:

    $URL/?gbgff=1;l=<trackname>;q=chrXX

To limit the downloaded region to a part of a chromosome (example 110000
to 120000:

    $URL/?gbgff=1;l=<trackname>;q=chrXX:110000..1200000

## Generating Static Images

To generate static images of a region in PNG, SVG or PDF format, invoke
gbrowse_img:

     $HOST/gb2/gbrowse_img/SOURCE/?ARGS

SOURCE
The data source, such as

## Focusing on a Region

## Managing Sessions

A user's state is stored in a cookie named "gbrowse_sess". The session
ID is a 64-character hexadecimal string (numerals 0-9 and characters
a-f). You can select different session IDs by passing gbrowse the CGI
parameter "id", as in:

     $HOST/gb2/gbrowse/yeast/?id=134947aacaa27a3c60b06f94e073b6e7

From the user interface, you can obtain the current session's id by
choosing Help-\>Show My User ID... This will also return the uploads id,
which is used for sharing uploaded track data within sharing the user's
entire session.

From within a script, you may capture the ID from the cookie as shown in
the media:gbrowse_get_sessionid.pl (unavailable)
example script. You may also obtain the ID by calling GBrowse with
"action=get_ids" (version 2.Session ID: 1e7995e8ced0494dcca25af4cee37f69
Upload ID: efee698db7bc6ebc8a69af04072a7143 23 and higher):

    $HOST/gb2/gbrowse/yeast/?action=get_ids

This will return a plain text file with the following structure:

    Session ID: 1e7995e8ced0494dcca25af4cee37f69
    Upload ID:  efee698db7bc6ebc8a69af04072a7143

## Centering on a region

## Selecting Tracks and Subtracks

To select subtracks within a track, use the syntax
**l=trackname/st1+st2+st3**, where _trackname_ is the name of the track,
and _st1_, _st2_, and so forth, are the subtrack names as indicated by
the "subtrack table" option. Note that subtrack names are separated by
spaces. Use "+" or "%20" to escape the URL. The parameter name is "l",
short for **l**abel.

## Uploading Datasets

## Linking to Remote Datasets

## Obtaining Metadata

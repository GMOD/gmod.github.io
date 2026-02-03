---
title: "GBrowse2 REST API"
---
<span id="top"></span>

# <span dir="auto">GBrowse2 REST API</span>

This article describes the **GBrowse2 REST API**.

_For the main GBrowse 2.0 HOWTO article, see: [GBrowse 2.0
HOWTO](GBrowse_2.0_HOWTO "GBrowse 2.0 HOWTO")._

## Contents

- [<span class="tocnumber">1</span> <span class="toctext">The GBrowse2
  REST API</span>](#The_GBrowse2_REST_API)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Getting
    Information from the
    Server</span>](#Getting_Information_from_the_Server)
    - [<span class="tocnumber">1.1.1</span>
      <span class="toctext">Getting a List of
      Sources</span>](#Getting_a_List_of_Sources)
    - [<span class="tocnumber">1.1.2</span>
      <span class="toctext">Getting Tracks from a Particular
      Datasource</span>](#Getting_Tracks_from_a_Particular_Datasource)
    - [<span class="tocnumber">1.1.3</span>
      <span class="toctext">Getting Chromosome
      Sizes</span>](#Getting_Chromosome_Sizes)
    - [<span class="tocnumber">1.1.4</span>
      <span class="toctext">Downloading a
      Track</span>](#Downloading_a_Track)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Generating
    Static Images</span>](#Generating_Static_Images)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Focusing
    on a Region</span>](#Focusing_on_a_Region)
  - [<span class="tocnumber">1.4</span> <span class="toctext">Managing
    Sessions</span>](#Managing_Sessions)
  - [<span class="tocnumber">1.5</span> <span class="toctext">Centering
    on a region</span>](#Centering_on_a_region)
  - [<span class="tocnumber">1.6</span> <span class="toctext">Selecting
    Tracks and Subtracks</span>](#Selecting_Tracks_and_Subtracks)
  - [<span class="tocnumber">1.7</span> <span class="toctext">Uploading
    Datasets</span>](#Uploading_Datasets)
  - [<span class="tocnumber">1.8</span> <span class="toctext">Linking to
    Remote Datasets</span>](#Linking_to_Remote_Datasets)
  - [<span class="tocnumber">1.9</span> <span class="toctext">Obtaining
    Metadata</span>](#Obtaining_Metadata)

# <span id="The_GBrowse2_REST_API" class="mw-headline">The GBrowse2 REST API</span>

## <span id="Getting_Information_from_the_Server" class="mw-headline">Getting Information from the Server</span>

You can get a list of public data sources from the GBrowse server, and
interrogate each one for a list and description of the tracks it
supports.

### <span id="Getting_a_List_of_Sources" class="mw-headline">Getting a List of Sources</span>

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

### <span id="Getting_Tracks_from_a_Particular_Datasource" class="mw-headline">Getting Tracks from a Particular Datasource</span>

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

### <span id="Getting_Chromosome_Sizes" class="mw-headline">Getting Chromosome Sizes</span>

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

### <span id="Downloading_a_Track" class="mw-headline">Downloading a Track</span>

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

## <span id="Generating_Static_Images" class="mw-headline">Generating Static Images</span>

To generate static images of a region in PNG, SVG or PDF format, invoke
gbrowse_img:

     $HOST/gb2/gbrowse_img/SOURCE/?ARGS

SOURCE  
The data source, such as

## <span id="Focusing_on_a_Region" class="mw-headline">Focusing on a Region</span>

## <span id="Managing_Sessions" class="mw-headline">Managing Sessions</span>

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

## <span id="Centering_on_a_region" class="mw-headline">Centering on a region</span>

## <span id="Selecting_Tracks_and_Subtracks" class="mw-headline">Selecting Tracks and Subtracks</span>

To select subtracks within a track, use the syntax
**l=trackname/st1+st2+st3**, where _trackname_ is the name of the track,
and _st1_, _st2_, and so forth, are the subtrack names as indicated by
the "subtrack table" option. Note that subtrack names are separated by
spaces. Use "+" or "%20" to escape the URL. The parameter name is "l",
short for **l**abel.

## <span id="Uploading_Datasets" class="mw-headline">Uploading Datasets</span>

## <span id="Linking_to_Remote_Datasets" class="mw-headline">Linking to Remote Datasets</span>

## <span id="Obtaining_Metadata" class="mw-headline">Obtaining Metadata</span>

[Categories](Special%253ACategories "Special%253ACategories"):

- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")
- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse2_REST_API" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 15:29 on 27 August 2012.</span>
<!-- - <span id="footer-info-viewcount">51,608 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

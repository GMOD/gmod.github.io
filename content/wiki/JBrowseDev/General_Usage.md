---
title: "JBrowse Configuration Guide"
---
# JBrowse Configuration Guide

(Redirected from [JBrowseDev/General
Usage](JBrowseDev/General_Usage)

**This page has been replaced with this page (<a
href="https://github.com/GMOD/jbrowse/wiki/JBrowse_Configuration_Guide"
class="external free"
rel="nofollow">https://github.com/GMOD/jbrowse/wiki/JBrowse_Configuration_Guide</a>)
at github. Please don't edit this page as changes will be discarded.**

This page provides a comprehensive reference guide for configuring
JBrowse. If you find something that is missing or inaccurate, please
feel very free to edit it!

Note: this is a **reference guide**. It is not meant to be read from
beginning to end. If this is your first time setting up JBrowse, you
probably want to read the <a
href="http://jbrowse.org/code/latest-release/docs/tutorial/index.html"
class="external text" rel="nofollow">Quick-start tutorial</a> first, and
then consult this guide when you need information on specific things you
want to do with your JBrowse.

  
Check out the new [JBrowse FAQ](../JBrowse_FAQ "JBrowse FAQ") page for
more tips on setup and configuration
<a href="../JBrowse_FAQ" class="external free"
rel="nofollow">http://gmod.org/wiki/JBrowse_FAQ</a>

Also see the [JBrowse Desktop](../JBrowse_Desktop "JBrowse Desktop")
guide here <a href="../JBrowse_Desktop" class="external free"
rel="nofollow">http://gmod.org/wiki/JBrowse_Desktop</a>

  

  Installation](#Installation)
  - [Making a
    New JBrowse](#Making_a_New_JBrowse)
  - [Upgrading
    an Existing JBrowse](#Upgrading_an_Existing_JBrowse)
  - [Configuration Loading, Files, and
    Formats](#Configuration_Loading.2C_Files.2C_and_Formats)
    - [JavaScript Object Notation (JSON)
      Configuration Format
      (.json)](#JavaScript_Object_Notation_.28JSON.29_Configuration_Format_.28.json.29)
      - [Considerations for the JSON
        format](#Considerations_for_the_JSON_format)
    - [Text
      Configuration Format
      (.conf)](#Text_Configuration_Format_.28.conf.29)
      - [Considerations for the text-based .conf
        format](#Considerations_for_the_text-based_.conf_format)
      - [Callback-function specific considerations
        for the text-based .conf
        format](#Callback-function_specific_considerations_for_the_text-based_.conf_format)
    - [Configuration loading
      details](#Configuration_loading_details)
- [Reference
  Sequences](#Reference_Sequences)
  - [Reference
    Sequence Selector
    Configuration](#Reference_Sequence_Selector_Configuration)
    - [Reference Sequence Display
      Order](#Reference_Sequence_Display_Order)
    - [Explicitly Specifying a Reference Sequence
      List](#Explicitly_Specifying_a_Reference_Sequence_List)
  - [prepare-refseqs.pl](#prepare-refseqs.pl)
- [Formatting
  Feature Data](#Formatting_Feature_Data)
  - [flatfile-to-json.pl](#flatfile-to-json.pl)
  - [biodb-to-json.pl](#biodb-to-json.pl)
  - [ucsc-to-json.pl](#ucsc-to-json.pl)
- [Feature Tracks
  (HTMLFeatures and
  CanvasFeatures)](#Feature_Tracks_.28HTMLFeatures_and_CanvasFeatures.29)
  - [HTMLFeatures Configuration
    Options](#HTMLFeatures_Configuration_Options)
  - [CanvasFeatures Configuration
    Options](#CanvasFeatures_Configuration_Options)
    - [Customizing CanvasFeatures tracks with
      callbacks](#Customizing_CanvasFeatures_tracks_with_callbacks)
  - [Generic
    Track Configuration
    Options](#Generic_Track_Configuration_Options)
  - [Customizing parts of the 'View details'
    Pop-ups with
    callbacks](#Customizing_parts_of_the_.27View_details.27_Pop-ups_with_callbacks)
    - [Additional customizations to the pop-up
      boxes](#Additional_customizations_to_the_pop-up_boxes)
  - [Customizing Left-click
    Behavior](#Customizing_Left-click_Behavior)
  - [Customizing Mouse-over
    behavior](#Customizing_Mouse-over_behavior)
  - [Configuring Summary
    Histograms](#Configuring_Summary_Histograms)
  - [Customizing Right-click Context
    Menus](#Customizing_Right-click_Context_Menus)
  - [Click
    Configuration Options](#Click_Configuration_Options)
  - [Using
    callbacks to customize feature
    tracks](#Using_callbacks_to_customize_feature_tracks)
- [Alignment
  Tracks (BAM)](#Alignment_Tracks_.28BAM.29)
  - [Alignments2](#Alignments2)
    - [Alignments2 coloring
      schemes](#Alignments2_coloring_schemes)
  - [SNPCoverage](#SNPCoverage)
    - [Example SNPCoverage
      Configuration](#Example_SNPCoverage_Configuration)
  - [Alignments](#Alignments)
  - [BAM Data
    Configuration Options](#BAM_Data_Configuration_Options)
  - [Example
    BAM Alignments2 track
    configuration](#Example_BAM_Alignments2_track_configuration)
  - [Apache
    Configuration Note](#Apache_Configuration_Note)
- [Wiggle/BigWig
  Tracks (XYPlot,
  Density)](#Wiggle.2FBigWig_Tracks_.28XYPlot.2C_Density.29)
  - [Example
    BigWig-based Wiggle XY-Plot Track
    Configuration](#Example_BigWig-based_Wiggle_XY-Plot_Track_Configuration)
  - [Example
    BigWig-based Wiggle Color Density Track
    Configuration](#Example_BigWig-based_Wiggle_Color_Density_Track_Configuration)
  - [Wiggle
    track configuration
    options](#Wiggle_track_configuration_options)
  - [BigWig
    File Compatibility](#BigWig_File_Compatibility)
- [Variant Tracks
  (VCF)](#Variant_Tracks_.28VCF.29)
  - [Example
    VCF-based Variant Track
    Configuration](#Example_VCF-based_Variant_Track_Configuration)
    - [Using
      VCF Filters in
      configuration](#Using_VCF_Filters_in_configuration)
- [Feature
  Coverage Tracks](#Feature_Coverage_Tracks)
  - [Example
    Feature Coverage Track Configuration for a BAM
    file](#Example_Feature_Coverage_Track_Configuration_for_a_BAM_file)
- [Sequence
  track](#Sequence_track)
- [Pre-rendered
  Image Tracks](#Pre-rendered_Image_Tracks)
  - [wig-to-json.pl](#wig-to-json.pl)
    - [Basic
      usage](#Basic_usage)
    - [System-specific tips for building
      wig2png](#System-specific_tips_for_building_wig2png)
      - [Apple OS X](#Apple_OS_X)
      - [Ubuntu / Debian
        Linux](#Ubuntu_.2F_Debian_Linux)
      - [Red Hat/CentOS/Fedora
        Linux](#Red_Hat.2FCentOS.2FFedora_Linux)
  - [draw-basepair-track.pl](#draw-basepair-track.pl)
    - [Basic
      usage](#Basic_usage_2)
- [Name
  Searching and
  Autocompletion](#Name_Searching_and_Autocompletion)
  - [Autocompletion
    Configuration](#Autocompletion_Configuration)
  - [generate-names.pl](#generate-names.pl)
- [Removing
  Tracks](#Removing_Tracks)
- [Authentication and Access
  Control](#Authentication_and_Access_Control)
  - [HTTP
    Basic LDAP under Nginx](#HTTP_Basic_LDAP_under_Nginx)
- [Cross-origin
  resource sharing (CORS): showing data on multiple
  servers](#Cross-origin_resource_sharing_.28CORS.29:_showing_data_on_multiple_servers)
- [Compressing
  data on the server](#Compressing_data_on_the_server)
- [Controlling
  JBrowse with the URL Query
  String](#Controlling_JBrowse_with_the_URL_Query_String)
  - [Overview
    of URL Query String
    params](#Overview_of_URL_Query_String_params)
  - [data](#data)
  - [loc](#loc)
  - [tracks](#tracks)
  - [highlight](#highlight)
  - [addFeatures](#addFeatures)
  - [addTracks](#addTracks)
  - [addStores](#addStores)
  - [addBookmarks](#addBookmarks)
  - [Embedded
    mode](#Embedded_mode)
- [Data
  Export](#Data_Export)
  - [Data
    Formats](#Data_Formats)
  - [Export
    Configuration](#Export_Configuration)
- [Data from a
  SPARQL Endpoint](#Data_from_a_SPARQL_Endpoint)
  - [Example
    SPARQL Configuration](#Example_SPARQL_Configuration)
  - [Variable
    Interpolation](#Variable_Interpolation)
- [Track
  Metadata](#Track_Metadata)
  - [Embedding
    Track Metadata in JBrowse
    Configuration](#Embedding_Track_Metadata_in_JBrowse_Configuration)
  - [Loading
    Track Metadata from
    Files](#Loading_Track_Metadata_from_Files)
    - [Example](#Example)
    - [Track
      metadata options](#Track_metadata_options)
- [Faceted Track
  Selector](#Faceted_Track_Selector)
  - [Example
    Faceted Track Selector
    Configuration](#Example_Faceted_Track_Selector_Configuration)
- [Hierarchical
  Track Selector](#Hierarchical_Track_Selector)
- [General
  configuration options](#General_configuration_options)
  - [General
    track configuration
    options](#General_track_configuration_options)
- [Dataset
  Selector](#Dataset_Selector)
  - [Example
    Dataset Switching
    Configuration](#Example_Dataset_Switching_Configuration)
- [Anonymous
  Usage Statistics](#Anonymous_Usage_Statistics)
- [Plugins](#Plugins)
  - [Installing
    Plugins](#Installing_Plugins)
  - [Activating
    Plugins](#Activating_Plugins)
- [Advanced
  Topics](#Advanced_Topics)
  - [Using
    JBrowse with Existing
    Databases](#Using_JBrowse_with_Existing_Databases)
    - [Extract data and
      reformat](#Extract_data_and_reformat)
      - [Example
        Configuration](#Example_Configuration)
  - [Configure
    a Loading Page](#Configure_a_Loading_Page)
  - [Milestone
    functions](#Milestone_functions)
  - [Configuring track locations with
    Apache](#Configuring_track_locations_with_Apache)
  - [Feature
    API and Feature Store
    API](#Feature_API_and_Feature_Store_API)
    - [Other
      useful classes](#Other_useful_classes)
  - [Using
    JBrowse with Existing Web
    Services](#Using_JBrowse_with_Existing_Web_Services)
    - [Example custom JBrowse store
      class](#Example_custom_JBrowse_store_class)
  - [Writing
    JBrowse-compatible Web
    Services](#Writing_JBrowse-compatible_Web_Services)
    - [JBrowse REST Feature Store
      API](#JBrowse_REST_Feature_Store_API)
      - [GET
        (base)/stats/global](#GET_.28base.29.2Fstats.2Fglobal)
      - [GET
        (base)/stats/region/(refseq_name)?start=123&end=456](#GET_.28base.29.2Fstats.2Fregion.2F.28refseq_name.29.3Fstart.3D123.26end.3D456)
      - [GET
        (base)/stats/regionFeatureDensities/(refseq_name)?start=123&end=456&basesPerBin=20000](#GET_.28base.29.2Fstats.2FregionFeatureDensities.2F.28refseq_name.29.3Fstart.3D123.26end.3D456.26basesPerBin.3D20000)
      - [GET
        (base)/features/(refseq_name)?start=234&end=5678](#GET_.28base.29.2Ffeatures.2F.28refseq_name.29.3Fstart.3D234.26end.3D5678)
    - [Configuring Tracks to Use a REST Feature
      Store](#Configuring_Tracks_to_Use_a_REST_Feature_Store)
    - [Other
      Dynamically-Servable
      Formats](#Other_Dynamically-Servable_Formats)
      - [trackList.json
        format](#trackList.json_format)
      - [refSeqs.json
        format](#refSeqs.json_format)
      - [Sequence data
        format](#Sequence_data_format)
    - [JBrowse REST Names
      API](#JBrowse_REST_Names_API)
      - [GET
        (url)?equals=Apple1](#GET_.28url.29.3Fequals.3DApple1)
      - [GET
        (url)?startswith=Ap](#GET_.28url.29.3Fstartswith.3DAp)
    - [Configuring JBrowse to Use REST Name
      Lookup](#Configuring_JBrowse_to_Use_REST_Name_Lookup)
  - [Publishing and Subscribing to JBrowse
    Events](#Publishing_and_Subscribing_to_JBrowse_Events)
  - [Writing
    JBrowse Plugins](#Writing_JBrowse_Plugins)
    - [Plugin
      Components](#Plugin_Components)
      - [Example main.js](#Example_main.js)
      - [Example plugin directory
        contents](#Example_plugin_directory_contents)
      - [Distributing a plugin via
        npm](#Distributing_a_plugin_via_npm)
    - [Plugin build
      notes](#Plugin_build_notes)
  - [Data
    Format Specification: JSON LazyNCList Feature
    Store](#Data_Format_Specification:_JSON_LazyNCList_Feature_Store)
    - [Array Representation
      (ArrayRepr)](#Array_Representation_.28ArrayRepr.29)
    - [Lazy
      Nested-Containment Lists
      (LazyNCList)](#Lazy_Nested-Containment_Lists_.28LazyNCList.29)
  - [Data
    Format Specification: Fixed-Resolution Tiled Image
    Store](#Data_Format_Specification:_Fixed-Resolution_Tiled_Image_Store)
  - [Including external files and functions in
    trackList.json](#Including_external_files_and_functions_in_trackList.json)
  - [Rendering high resolution screenshots using
    PhantomJS](#Rendering_high_resolution_screenshots_using_PhantomJS)
    - [Export as SVG](#Export_as_SVG)
    - [Using pageres wrapper for PNG
      output](#Using_pageres_wrapper_for_PNG_output)
    - [Other links](#Other_links)
  - [Rendering high resolution screenshots using
    Puppeteer](#Rendering_high_resolution_screenshots_using_Puppeteer)
- [External
  Links](#External_Links)

# Installation

At the most basic level, setting up JBrowse consists of:

- Placing a copy of the JBrowse directory somewhere in the web-servable
  part of your server's file system (often `/var/www` by default)
- Running the JBrowse setup script to install a few server-side
  dependencies
- Running one or more server-side scripts to create a directory
  containing a JBrowse-formatted copy of your data.

Both the JBrowse code and these data files must be in a location where
the web server can serve them to users. Then, a user pointing their web
browser at the appropriate URL for the index.html file in the JBrowse
directory will see the JBrowse interface, including sequence and feature
tracks reflecting the data source.

Reference sequence data should be added first (using
`prepare-refseqs.pl`\`), followed by annotation data. Once all of
annotation data has been added, use `generate-names.pl` to make the
feature names searchable.

## Making a New JBrowse

0\. Install build prerequisites, plus make and a C compiler. On Ubuntu,
you could do this with:

     sudo apt-get install zlib1g-dev libpng-dev libgd2-noxpm-dev build-essential

Some other things that sometimes need to be manually installed if your
setup.sh is failing includes these

     sudo apt-get install libexpat-dev libxml2-dev libdb-dev

If you need a web server you can add apache2 to the list

1\. <a href="http://jbrowse.org/install/" class="external text"
rel="nofollow">Download JBrowse</a> onto your web server.

2\. Unpack JBrowse into a directory that is served by your web browser.
On many systems, this defaults to `/var/www` or `/var/www/html` for
apache2

       cd /var/www/html
       unzip JBrowse-*.zip

**Make sure you have permissions to write to the contents of the
jbrowse/ directory you have just created.**

3\. Run the automated-setup script, `./setup.sh`, which will attempt to
install all of JBrowse's (modest) prerequisites for you in the
`jbrowse/` directory itself. Note that `setup.sh` should not be run as
root or with `sudo`.

4\. Visit <a
href="http://your.machine.address/jbrowse/index.html?data=sample_data/json/volvox"
class="external free"
rel="nofollow">http://your.machine.address/jbrowse/index.html?data=sample_data/json/volvox</a>.
If you can see the included Volvox example data, you are ready to
configure JBrowse to show your own data! The
<a href="http://jbrowse.org/code/latest-release/docs/tutorial/"
class="external text" rel="nofollow">Getting Started with JBrowse
Tutorial</a> provides a very basic step-by-step guide to formatting your
own data, and in-depth configuration reference information can be found
on this page.

  
Note: if there is an error installing the perl pre-requisites, and you
get an error in your setup.log such as
"/home.local/username/.cpanm/build.log: No such file or directory at
/loader/0x10b108f0/App/cpanminus/script.pm line 224."

Then you can clear out your users locallib with `rm -rf ~/.cpanm` and
re-run setup.sh. Only do this if you are not concerned about your
personal cpanm folder in the first place. Otherwise, you can use your
system's cpanm to install jbrowse pre-requisites with "cpanm ." inside
the jbrowse directory.

## Upgrading an Existing JBrowse

To upgrade an existing JBrowse (1.3.0 or later) to the latest version,
simply move its data directory (and `jbrowse_conf.json` if you are using
it) into the directory of a newer JBrowse, and the new JBrowse will
display that data.

To upgrade a 1.2.x JBrowse, copy its data directory into the new JBrowse
directory, and point your browser at compat_121.html in the new JBrowse
directory, instead of index.html. Or, if desired, you could simply
overwrite index.html with compat_121.html.

If you are upgrading from a version of JBrowse older than 1.2.0, a fresh
installation is required.

## Configuration Loading, Files, and Formats

JBrowse supports **two configuration formats**, a JSON-based format and
a GBrowse-like textual format that is easier to edit and maintain by
hand than JSON. Sites can use either format, or a mixture of both. The
default shipped configuration of JBrowse uses both: jbrowse.conf in the
main JBrowse directory for global settings, and trackList.json in each
data directory for dataset-specific configuration in JSON, and
tracks.conf in the data directory for dataset-specific configuration in
.conf format.

### JavaScript Object Notation (JSON) Configuration Format (.json)

The JSON configuration format was the first format supported by JBrowse,
and is easy for software programs to read and modify. Before version
1.11.0, this was the only format supported by JBrowse.

  

As an example, the trackList.json file might have something like this.
Here is an example of a BAM track

    {
     "tracks": [
       {
         "urlTemplate" : "volvox-sorted.bam",
         "storeClass"  : "JBrowse/Store/SeqFeature/BAM",
         "type"        : "JBrowse/View/Track/Alignments2",
         "label"       : "BAM_track",
         "key"         : "My BAM track"
         "style": { "color": "red" }
       }
     ]
    }

  
The specifics of this config are not essential, we are specifying an
array of tracks in a trackList.json style, and each track is an object
that includes some parameters like the urlTemplate to refer to the
location of the BAM file on the server relative to the data directory,
the color of the features, etc.

#### Considerations for the JSON format

- Nested objects are specified using typical JSON format, using curly
  brackets
- Booleans and numbers should remain unquoted
- Functions do remain quoted however e.g. "style": { "color":
  "function() { /\* your code here \*/ }" }
- JSON strings should not contain line breaks (see Text .conf format for
  info on multiline callbacks)
- Configuration values can be stored in both jbrowse_conf.json or in
  trackList.json (or conf files) i.e. the trackList.json does not only
  have to contain tracks, can contain other config entries

### Text Configuration Format (.conf)

JBrowse 1.11.0 introduced support for a new text-based configuration
format that users of GBrowse will find very familiar, since its design
borrows heavily from GBrowse’s configuration syntax. It is fairly
comfortable to hand-edit, but rather inconvenient for automated tools to
work with. To get the best of both worlds, JBrowse supports both
formats.

This text configuration format can be used to specify

- general configuration options (i.e. jbrowse.conf
  [\[1\]](#General_configuration_options))
- track-specific options (i.e. tracks.conf
  [\[2\]](#Example_SNPCoverage_Configuration))
- standalone files with extra code (i.e. functions.conf
  [\[3\]](#Including_external_files_and_functions_in_trackList.json)).

The text format has several benefits, including the ability to specify
multi-line callbacks. Example:

    # BAM track with a new callback
    [tracks.mytrack]
    storeClass  = JBrowse/Store/SeqFeature/BAM
    type        = JBrowse/View/Track/Alignments2
    urlTemplate = myfile.bam
    key         = My BAM track
    style.color = function(feature) {
       /* comment */
       return 'red';
     }

#### Considerations for the text-based .conf format

- Comments should start with \#
- The section labels, e.g. \[tracks.testtrack\] defines an identifier
  for the track named testtrack, so you should not have dots in your
  identifier, e.g. don't use something like this \[tracks.test.track\]
- Don't quote the values in the file, e.g key=My BAM track, not key="My
  BAM track"
- Nested values can specified using 'dot' notation, e.g. "style.color"
- A "section" can be specified with square brackets, e.g.
  \[trackMetadata\] will create the config variable trackMetadata and
  the values in the section are added to it.
- Extra JSON values can be specified in the conf file using the syntax
  json:{...} (see [\[4\]](#Customizing_Right-click_Context_Menus) for
  example)
- Very large .conf files (thousands of lines) files can take longer to
  parse than equivalent JSON
- An array of values can be built up over multiple lines. NOTE: A quirk
  of the format is that there cannot be more than 4 spaces before the +
  sign in each item. Example:
        [trackMetadata]
        sources =
           + data/mymeta.csv
           + data/more_meta.csv

#### Callback-function specific considerations for the text-based .conf format

- Comments inside callbacks can use the /\* \*/ format but not the //
  format
- All lines of a multi-line callback should be spaced away from the
  left-most column, including the closing bracket (see the style.color
  example above)
- There should be no blank lines inside a multi-line callback
- Refer to
  [\[5\]](#Including_external_files_and_functions_in_trackList.json) for
  more info on multi-line functions

### Configuration loading details

When your web browser loads a page containing JBrowse, and JBrowse
starts, the following steps are done

- In index.html, read the URL params (e.g. query params like &data= and
  &tracks, &loc=, etc.)
- In index.html, create a JSON blob using URL params and pass them to
  the Browser.js constructor which you can see on index.html
- In Browser.js, the constructor is a JSON blob that becomes the "root
  configuration object"
- In Browser.js, mix the root config with the \_defaultConfig object
- In \_defaultConfig, the default is to include both jbrowse_conf.json
  and jbrowse.conf config files
- In jbrowse.conf, the default is to include {dataRoot}/trackList.json
  {dataRoot}/tracks.conf

This is how you eventually get the trackList.json and tracks.conf files
from your data directory loaded. Note that the &data=blah URL parameter
becomes the dataRoot config parameter, so dataRoot would be "blah" in
that case.

The configuration system then merges all this information, e.g. from the
URL params, from the Browser constructors, the defaultConfigs, the
jbrowse.conf, the jbrowse_conf.json, the trackList.json, the
tracks.conf, and any files that the trackList.json or tracks.conf files
themselves include, into a single config.

Generally this happens all seamlessly, and both the text-based .conf
format and .json config files can co-exist. That is because anything
that can be written as a .conf file can also be written as a .json, they
are both parsed on the client side into config objects.

# Reference Sequences

The reference sequences on which the browser will display annotations,
and which provide a common coordinate system for all tracks. At a close
enough zoom level, the sequence bases are visible in the "Reference
Sequence" track.

The exact interpretation of "reference sequence" will depend on how you
are using JBrowse. For a model organism genome database, each reference
sequence would typically represent a chromosome or a
<a href="http://en.wikipedia.org/wiki/Contig" class="external text"
rel="nofollow">contig</a>. Before any feature or image tracks can be
displayed in JBrowse, the reference sequences must be defined using the
prepare-refseqs.pl formatting tool.

## Reference Sequence Selector Configuration

JBrowse displays a dropdown selector for changing reference sequences.

For JBrowse versions 1.6.3 to 1.8.1, if more than 30 reference sequences
are loaded, this selector is not shown by default. To force JBrowse to
show the reference sequence dropdown selector, set
`refSeqDropdown: true` in the configuration. This can be done in any
configuration file, e.g. index.html, jbrowse_conf.json, or
data/trackList.json.

In JBrowse version 1.9.0 and later, the reference sequence dropdown menu
is always displayed. However, if there are too many reference sequences
to practically display in the dropdown selector, the first portion of
the sequence list is shown in the dropdown selector, along with a
message stating that there are more reference sequences than can be
shown. The maximum number of reference sequences in the selector is set
by the `refSeqSelectorMaxSize` configuration variable, and defaults to
30.

  

### Reference Sequence Display Order

The ordering of reference sequences in the selector is configurable
using the `refSeqOrder` configuration variable.

Supported values for refSeqOrder include

- `name`
- `name descending`
- `length`
- `length descending`
- `false/null/0` to disable any sorting
- `by_list` to manually specify a list of reference sequences in the
  selector

One instance in which refSeqOrder is particularly useful is in
displaying annotations on early-stage, incomplete genomic assemblies: to
display the N biggest contigs in the assembly in the reference sequence
selector dropdown, one can set `refSeqOrder` to 'length descending', and
set `refSeqSelectorMaxSize` to N.

### Explicitly Specifying a Reference Sequence List

If you set `refSeqOrder` to `by_list`, you can then set
`refSeqOrderList` to set the exact order of the reference sequence list.

Example (in data/tracks.conf)

    [GENERAL]
    refSeqOrder = by_list
    refSeqOrderList =
      + ctgB
      + ctgA
      + ctgAprime
      + bethsCrazyBananasContig
      + ctgAZed

## prepare-refseqs.pl

This script is used to format sequence data for use by JBrowse, and must
be run before adding other tracks. In addition to formatting the
sequence data, this script creates a track called "DNA" that displays
the reference sequence. The simplest way to use it is with the --fasta
option, which uses a single sequence or set of reference sequences from
a [FASTA](../Glossary#FASTA "Glossary") file:

    bin/prepare-refseqs.pl --fasta <fasta file> [options]

If the file has multiple sequences (e.g. multiple chromosomes), each
sequence will become a reference sequence by default. You may switch
between these sequences by selecting the sequence of interest via the
pull-down menu to the right of the large "zoom in" button.

You may use any alphabet you wish for your sequences (i.e., you are not
restricted to the nucleotides A, T, C, and G; any alphanumeric
character, as well as several other characters, may be used). Hence, it
is possible to browse RNA and protein in addition to DNA. However, some
characters should be avoided, because they will cause the sequence to
"split" - part of the sequence will be cut off and and continue on the
next line. These characters are the *hyphen* and *question mark*.
Unfortunately, this prevents the use of hyphens to represent gaps in a
reference sequence.

In addition to reading from a fasta file, prepare-refseqs.pl can read
sequences from a gff file or a database. In order to read fasta
sequences from a database, a config file must be used.

Syntax used to import sequences from gff files:

    bin/prepare-refseqs.pl --gff <gff file with sequence information> [options]

Syntax used to import sequences with a config file:

    bin/prepare-refseqs.pl --conf <config file that references a database with sequence information> --[refs|refid] <reference sequences> [options]

  
Syntax used to import a indexed fasta(i.e. a fasta file where you run
\`samtools faidx yourfile.fa\` which outputs yourfile.fa.fai)

    bin/prepare-refseqs.pl --indexed_fasta yourfile.fa

This will copy yourfile.fa and yourfile.fa.fai to the data directory

| Option | Value |----|----| fasta, indexed_fasta, twobit, gff, sizes, or conf | Path to the file that JBrowse will use to import sequences. With the fasta and gff options, the sequence information is imported directly from the specified file. With the sizes option, a tab delimited file with chromosome names and lengths is used, but no sequence information is added. With the conf option, the specified config file includes the details necessary to access a database that contains the sequence information. Exactly one of these three options must be used. With indexed_fasta, the samtools faidx yourfile.fa must be run before hand. With twobit, the twobit file will automatically be copied into your data directory. | out | A path to the output directory (default is 'data' in the current directory) | seqdir | The directory where the reference sequences are stored (default: \<output directory\>/seq) | noseq | Causes no reference sequence track to be created. This is useful for reducing disk usage. | refs | A comma-delimited list of the names of sequences to be imported as reference sequences. This option (or refid) is required when using the conf option. It is not required when the fasta or gff options are used, but it can be useful with these options, since it can be used to select which sequences JBrowse will import. | refids | A comma-delimited list of the database identifiers of sequences to be imported as reference sequences. This option is useful when working with a <a href="../Chado" class="mw-redirect" title="Chado">Chado</a> database that contains data from multiple different species, and those species have at least one chromosome with the same name (e.g. chrX). In this case, the desired chromosome cannot be uniquely identified by name, so it is instead identified by ID. This ID can be found in the 'feature_id' column of 'feature' table in a Chado database. |

  
Note: the \`prepare-refseqs.pl --sizes chrom.sizes\` option is maybe
underappreciated. You can technically run jbrowse without any sequence
data loaded, simply a set of chromosomes and their sizes. The
chrom.sizes file simply can contain two column tab separated list of
chromosome names and their lengths.

# Formatting Feature Data

JBrowse has several different tools that can be used to convert
range-based annotation data (genes, transcripts, etc) to range-indexed
sets of static JSON files that are very fast for JBrowse to access. Each
of these tools also adds a track configuration stanza to the
`trackList.json` configuration file in its output directory.

- [flatfile-to-json.pl](#flatfile-to-json.pl) - import GFF3 and BED
  files (**recommended for new users**)
- [biodb-to-json.pl](#biodb-to-json.pl) - import from a
  Bio::DB::SeqFeature::Store database (recommended for users with
  existing databases)
- [ucsc-to-json.pl](#ucsc-to-json.pl) - import UCSC database dumps (.sql
  and .txt.gz)

### flatfile-to-json.pl

Each run of this script formats a single track for JBrowse. A *flat
file* is a data set that exists entirely in a single file. For this
script, the file must be a [GFF3](../GFF3 "GFF3"),
<a href="http://www.ensembl.org/info/website/upload/bed.html"
class="external text" rel="nofollow">BED</a>, or GenBank text file.

Basic usage:

       bin/flatfile-to-json.pl --[gff|gbk|bed] <flat file> --tracklabel <track name> [options]

For a full list of the options supported by flatfile-to-json.pl, run it
with the --help option

       bin/flatfile-to-json.pl --help

Example

            flatfile-to-json.pl                                                         \
                ( --gff <GFF3 file> | --bed <BED file> | --gbk <GenBank file> )         \
                --trackLabel <track identifier>                                         \
                [ --trackType <JS Class> ]                                              \
                [ --out <output directory> ]                                            \
                [ --key <human-readable track name> ]                                   \
                [ --className <CSS class name for displaying features> ]                \
                [ --urltemplate "http://example.com/idlookup?id={id}" ]                 \
                [ --arrowheadClass <CSS class> ]                                        \
                [ --noSubfeatures ]                                                     \
                [ --subfeatureClasses '{ JSON-format subfeature class map }' ]          \
                [ --clientConfig '{ JSON-format style configuration for this track }' ] \
                [ --config '{ JSON-format extra configuration for this track }' ]       \
                [ --thinType <BAM -thin_type> ]                                         \
                [ --thicktype <BAM -thick_type>]                                        \
                [ --type <feature types to process> ]                                   \
                [ --nclChunk <chunk size for generated NCLs> ]                          \
                [ --compress ]                                                          \
                [ --sortMem <memory in bytes to use for sorting> ]                      \
                [ --maxLookback <maximum number of features to buffer in gff3 files> ]  \
                [ --nameAttributes "name,alias,id" ]                                    \

The --trackLabel parameter is the only required parameter, and is the
"id" to refer to your track by. The displayed name is also whatever
--trackLabel is unless --key is specified, in which case, whatever --key
is will be used as the displayed name.

By default the output is in a folder called data in your current working
directory, or whatever is specified by --out

Using --trackType CanvasFeatures is generally useful since
CanvasFeatures are newer than the default HTMLFeatures (aka
FeatureTrack)

### biodb-to-json.pl

This script uses a
<a href="Current/Usage/ConfigFiles" class="mw-redirect"
title="JBrowseDev/Current/Usage/ConfigFiles">config file</a> to produce
a set of feature tracks in JBrowse. It can be used to obtain information
from any database with appropriate
[schema](../Glossary#Database_Schema "Glossary"), or from flat files.
Because it can produce several feature tracks in a single execution, it
is useful for large-scale feature data entry into JBrowse.

Basic usage:

       bin/biodb-to-json.pl --conf <config file> [options]

  
For a full list of the options supported by biodb-to-json.pl, run it
with the --help option, like:

       bin/biodb-to-json.pl --help

### ucsc-to-json.pl

This script uses data from a local dump of the UCSC genome annotation
MySQL database. To reach this data, go to
<a href="http://hgdownload.cse.ucsc.edu/downloads.html"
class="external text" rel="nofollow">hgdownload.cse.ucsc.edu</a> and
click the link for the genome of interest. Next, click the "Annotation
Database" link. The data relevant to ucsc-to-json.pl (\*.sql and
\*.txt.gz files) can be downloaded from either this page or the FTP
server described on this page.

Together, a \*.sql and \*.txt.gz pair of files (such as
cytoBandIdeo.txt.gz and cytoBandIdeo.sql) constitute a database table.
Ucsc-to-json.pl uses the \*.sql file to get the column labels, and it
uses the \*.txt.gz file to get the data for each row of the table. For
the example pair of files above, the name of the database table is
"cytoBandIdeo". This will become the name of the JBrowse track that is
produced from the data in the table.

In addition to all of the feature-containing tables that you want to use
as JBrowse tracks, you will also need to download the trackDb.sql and
trackDb.txt.gz files for the organism of interest.

Basic usage:

      bin/ucsc-to-json.pl --in <directory with files from UCSC> --track <database table name> [options]

Hint: If you're using this approach, it might be convenient to also
download the sequence(s) from UCSC. These are usually available from the
"Data set by chromosome" link for the particular genome or from the FTP
server.

For a full list of the options supported by ucsc-to-json.pl, run it with
the --help option, like:

       bin/ucsc-to-json.pl --help

# Feature Tracks (HTMLFeatures and CanvasFeatures)

Feature tracks can be used to visualize localized annotations on a
sequence, such as gene models, transcript alignments, SNPs and so forth.

## HTMLFeatures Configuration Options

JBrowse HTMLFeatures tracks, the default legacy track type for
range-based features, have many available options for customization, not
all of which are available from the command-line formatting scripts.
Below is a comprehensive list of configuration options for HTMLFeatures
tracks. HTMLFeatures tracks are also referred to as trackType:
"FeatureTrack" or "type": "FeatureTrack".

| Option | Value |----|----| `yScalePosition` | Position of the y-axis scale indicator when the track is zoomed far enough out that density histograms are displayed. Can be "left", "right", or "center". Defaults to "center". | `maxFeatureScreenDensity` | Maximum density of features to display on the screen. If this is exceeded, will display either feature density histograms (if available), or a "too many features to show" message. The units of this number are features per screen width in pixels. Defaults to 0.5. | `description` | Comma-separated list of fields in which to look for the description of a feature. Case-insensitive. If set to `false` or `null`, no feature description will be shown. Defaults to 'note, description'. | `maxDescriptionLength` | Maximum length, in characters, for displayed feature descriptions. | `minSubfeatureWidth` | Minimum width, in pixels, of the *top-level* feature for JBrowse to attempt to display its subfeatures. Default 6. | `menuTemplate` | Optional menu configuration for right-click menus on features. Can be as large and complicated as you want. See [\#Customizing_Right-click_Context_Menus](#Customizing_Right-click_Context_Menus) below. If set to null or false, disables feature right-click menus. | `hooks→create` | JavaScript function that creates the parent feature HTML element and returns it. By default this is: `function(track,feature) { return document.createElement('div'); }`, which creates an HTML `div` element. | `hooks→modify` | JavaScript function that can be used to modify the feature HTML element in any way desired. If set, the function is called with the track object, feature object, and feature HTML element as arguments (signature: `function(track, feature, featDiv)`). | `style→featureScale` | Minimum zoom scale (pixels/basepair) for displaying individual features in the track. Not set by default, and overrides the `maxFeatureScreenDensity`. | `style→className` | CSS class for parent features. Defaults to "feature". | `style→subfeatureClasses` | Key-value pairs of CSS classes for subfeatures, organized by feature type. Example: { "CDS" : "transcript-CDS","UTR" : "transcript-UTR" } | `style→featureCss` | Text string of additional CSS rules to add to features. Example: "border-color: purple; background-color: yellow;" | `style→arrowheadClass` | CSS class of the strand arrowheads to show for this feature. Defaults to 'arrowhead'. If set to `null`, no arrowhead will be drawn. | `style→histScale` | Scale (pixels per basepair) below which the track will attempt to draw feature density histograms instead of features, if available. By default, this is set to 4 times the average feature density (features per basepair) of the track. | `style→label` | Comma-separated list of case-insensitive feature tags to use for showing the feature's label. The first one found will be used. Default 'name,id'. | `style→labelScale` | Scale (pixels per basepair) above which feature labels (names) will be shown. By default, this is set to 30 times the average feature density (features per basepair) of the track. | `style→descriptionScale` | Scale (pixels per basepair) above which long feature descriptions will be shown. By default, this is set to 170 times the average feature density (features per basepair) of the track. | `style→description` | Comma-separated list of case-insensitive feature tags to check for the feature's long description. The first one found will be used. Default 'note,description'. If blank no description is used. | `style→showLabels` | If set to true, feature labels may be shown. Defaults to true. Set this to false to disable display of feature labels. | `maxHeight` | Maximum height, in pixels, that the track is allowed to grow to. When it reaches this height, features that stack higher than this will not be shown, and a "Max height reached" message will be displayed. Default 600 pixels. | `showNoteInAttributes` | If set to true, show the feature's "Note" attribute as a regular attribute in the feature detail dialog. This is mostly useful for projects that want the blue description text on a feature to be different from the feature's Notes attribute, but still display the Notes attribute in the detail dialog | `topLevelFeatures` | Specifies which feature types should be considered "top-level" for this track. For example, if you have a track with gene-\>mRNA-\>CDS features, but for some reason want to only display the mRNA features, you can set topLevelFeatures=mRNA. Can also be an array of string types, or a function callback that returns an array of types. Default: all features are displayed. Added in 1.14.0 |

`HTMLFeatures` track configuration options

## CanvasFeatures Configuration Options

Introduced in JBrowse 1.10.0, the new JBrowse CanvasFeatures tracks are
faster and easier to configure than HTMLFeatures tracks.

| Option | Description |----|----| `maxHeight` | Maximum height, in pixels, that the track is allowed to grow to. When it reaches this height, features that stack higher than this will not be shown, and a "Max height reached" message will be displayed. Default 600 pixels. | `style→showLabels` | If true, allows feature labels to be shown if features are not too dense on the screen. Default `true`. | `style→showTooltips` | If true, allows feature name tooltips to be shown. Default true. | `displayMode` | 'normal', 'compact', or 'collapsed'. Sets the initial display mode of the track. Default 'normal'. | `style→featureScale` | Minimum zoom scale (pixels/basepair) for displaying individual features in the track. Not set by default, and overrides the `maxFeatureScreenDensity`. | `maxFeatureScreenDensity` | Maximum density of features to display on the screen. If this is exceeded, will display either feature density histograms (if available), or a "too many features to show" or "too much data to show" message. The units of this number are features per screen width in pixels. Defaults to 0.5. If increased to ~6 then it should pretty much always go away | `glyph` | JS class name of the glyph to use for each feature. By default, it tries to guess for each feature based on its `type` attribute, and uses JBrowse/View/FeatureGlyph/Box if it cannot find something better. Can be a callback with signature (feature), returning a string class name. | `menuTemplate` | Optional menu configuration for right-click menus on features. Can be as large and complicated as you want. See [\#Right-click_Context_Menus](#Right-click_Context_Menus) below. If set to null or false, disables feature right-click menus. | `style→maxDescriptionLength` | Maximum length, in characters, of long feature descriptions, for glyphs that support them. Default 70. | `style→color` | Basic color of features. Most glyphs interpret this as the fill color of the rectangle they draw. Color syntax is the same as that used for CSS, specified at <a href="http://dev.w3.org/csswg/css-color/" class="external free"
rel="nofollow">http://dev.w3.org/csswg/css-color/</a>. Default 'goldenrod'. | `style→mouseovercolor` | Color of the overlay drawn on top of features when the mouse hovers over them. Color syntax is the same as that used for CSS, specified at <a href="http://dev.w3.org/csswg/css-color/" class="external free"
rel="nofollow">http://dev.w3.org/csswg/css-color/</a>. Default rgba(0,0,0,0.3), which is semi-transparent black. | `style→borderColor` | Color of the borders drawn around boxes in glyphs. Color syntax is the same as that used for CSS, specified at <a href="http://dev.w3.org/csswg/css-color/" class="external free"
rel="nofollow">http://dev.w3.org/csswg/css-color/</a>. Default varies from glyph to glyph. | `style→borderWidth` | Width of the borders drawn around boxes in glyphs. Default 0.5 if borderColor specified | `style→height` | Height in pixels of glyphs. Default value varies from glyph to glyph. | `style→marginBottom` | Margin space to leave below each feature when arranging them in the view. Default 2 pixels. | `style→strandArrow` | If true, allow glyphs to draw strand arrowheads on features that are stranded. Default `true`. | `style→label` | Comma-separated list of case-insensitive feature tags to use for showing the feature's label. The first one found will be used. Default 'name,id'. | `style→textFont` | Font used for feature labels. Same format as CSS font rules. Default 'normal 12px Univers,Helvetica,Arial,sans-serif'. | `style→textColor` | Color of feature labels. Color syntax is the same as that used for CSS, specified at <a href="http://dev.w3.org/csswg/css-color/" class="external free"
rel="nofollow">http://dev.w3.org/csswg/css-color/</a>. Default 'black'. | `style→text2Color` | Color of feature descriptions. Color syntax is the same as that used for CSS, specified at <a href="http://dev.w3.org/csswg/css-color/" class="external free"
rel="nofollow">http://dev.w3.org/csswg/css-color/</a>. Default 'blue'. | `style→text2Font` | Font used for feature descriptions. Same format as CSS font rules. Default 'normal 12px Univers,Helvetica,Arial,sans-serif'. | `style→description` | Comma-separated list of case-insensitive feature tags to check for the feature's long description. The first one found will be used. Default 'note,description'. If blank no description is used. | `style→connectorColor` | Color of the connecting line drawn between boxes in glyphs that draw segments (like the Segments, ProcessedTranscript, and Gene glyphs). Color syntax is the same as that used for CSS, specified at <a href="http://dev.w3.org/csswg/css-color/" class="external free"
rel="nofollow">http://dev.w3.org/csswg/css-color/</a>. Default '#333'. | `style→connectorThickness` | Thickness in pixels of the connecting line drawn between boxes in glyphs that draw segments (like the Segments, ProcessedTranscript, and Gene glyphs). Default 1. | `style→utrColor` | Color of UTR regions drawn by ProcessedTranscript and Gene glyphs. Color syntax is the same as that used for CSS, specified at <a href="http://dev.w3.org/csswg/css-color/" class="external free"
rel="nofollow">http://dev.w3.org/csswg/css-color/</a>. Defaults to be a color that complements the current `style→color` value (calculated using a bit of color theory). | `subParts` | Comma-separated list of feature `type` tags that will be drawn as subparts of parent features. Defaults to all features for Segments glyphs, and 'CDS, UTR, five_prime_UTR, three_prime_UTR' for ProcessedTranscript glyphs. | `transcriptType` | For Gene glyphs, the feature `type` tag that indicates that a subfeature is a processed transcript. Defaults to 'mRNA'. | `labelTranscripts` | For Gene glyphs, if true, draw a label with the transcript's name beside each transcript, if space permits. Default true. | `style→transcriptLabelColor` | For Gene glyphs, the color of transcript name labels. Color syntax is the same as that used for CSS, specified at <a href="http://dev.w3.org/csswg/css-color/" class="external free"
rel="nofollow">http://dev.w3.org/csswg/css-color/</a>. Default 'black'. | `style→transcriptLabelFont` | For Gene glyphs, the font used for transcript name labels. Same format as CSS font rules. Default 'normal 10px Univers,Helvetica,Arial,sans-serif'. | `impliedUTRs` | Introduced in JBrowse 1.10.5. If true, indicates that UTRs are not present in the feature data, but should be inferred from the overlap of exon and CDS features in ProcessedTranscript and Gene glyphs. Default false. Can be a callback. | `maxFeatureGlyphExpansion` | A factor to expand the glyphs by so that if subfeatures go outside the bounds of the parent feature, they will still be rendered. Default: 500bp/current scale. | `inferCdsParts ` | If a single CDS span covers the whole gene except the UTRs, then it is drawn as though it only covers the exon parts (not the introns). Default: false. Added in 1.12.3 | `disableCollapsedClick` | Disables the click action when track is collapsed. Default: false. Added in 1.13.0 | `enableCollapsedMouseover` | Enables the mouseover action when track is collapsed. Default: false. Added in 1.13.0. See the ChromHMM track in volvox sample browser for example of mouseover on the collapsed track | `topLevelFeatures` | Specifies which feature types should be considered "top-level" for this track. For example, if you have a track with gene-\>mRNA-\>CDS features, but for some reason want to only display the mRNA features, you can set topLevelFeatures=mRNA. Can also be an array of string types, or a function callback that returns an array of types. Default: all features are displayed. Added in 1.14.0 | `ItemRgb` | If set to true, the RGB colors specified in BigBed or BED files will be used for the feature's background color. Default true. Added in 1.14.0 |

`CanvasFeatures` track configuration options

  
Note: the "compact" displayMode for CanvasFeatures tracks uses
style-\>height and multiplies it by 0.35 to create the compact view.
Therefore, if you adjust style-\>height to a smaller default value, then
you can create "ultra compact" visualizations.

  

  

### Customizing CanvasFeatures tracks with callbacks

Unlike HTML-based feature tracks, canvas-based feature tracks don't use
modify and create hooks. Instead, the `glyph` variable, and all of the
`style` variables, support customization callbacks.

All style callbacks are like:

       function( featureObject, variableName, glyphObject, trackObject ) {  return '#ffcccc'; }

And the glyph callback is like:

       function( featureObject ) { return 'JBrowse/View/FeatureGlyph/<glyphclassname>'; }

So, for example, if you wanted to customize a CanvasVariants track to
color all homozygous variants blue, and all heterozygous variants red,
you could set something like:

    [tracks.myvcf]
    ...
    variantIsHeterozygous = function( feature ) {
        var genotypes = feature.get('genotypes');
        for( var sampleName in genotypes ) {
          try {
              var gtString = genotypes[sampleName].GT.values[0];
              if( ! /^1([\|\/]1)*$/.test( gtString) && ! /^0([\|\/]0)*$/.test( gtString ) )
                  return true;
          } catch(e) {}
        }
        return false;
      }
    style.color = function( feature, variableName, glyphObject, track ) { 
        return track.config.variantIsHeterozygous(feature) ? 'red' : 'blue'; 
      }

Note: the multiline callbacks are only enabled in the tracks.conf form.
See [Text Configuration Format
(.conf)](#Text_Configuration_Format_.28.conf.29) for more considerations
about this format.

## Generic Track Configuration Options

| Option | Description |----|----| `subfeatureDetailLevel ` | Set the level of detail of the View details box. If set to 1, only displays one level of subfeatures for example. Default: 0 which displays all subfeature levels. Added in 1.12.3 |

`Generic track` configuration options

  

## Customizing parts of the 'View details' Pop-ups with callbacks

Starting in JBrowse version 1.11.3, the ability to customize parts of
the 'View details' Pop-ups was added. This lets you specify functions
that have the format fmtDetailValue\_\* or fmtDetailField\_\* to either
change the value section of an attribute in the config, or the fieldname
of an attribute in the config.

  
Here is an example in tracks.conf format for formatting the "Name" field
by adding a link to it:

    [tracks.mygff]
    key = My Gene Track
    storeClass = JBrowse/Store/SeqFeature/NCList
    type = FeatureTrack
    fmtDetailValue_Name = function(name) {
       return "<a href='http://www.example.com?featurename="+name+"'>"+name+"</a>";
     }

Note: It is also easy to specify these methods in trackList.json format.

    {
     "key": "My Gene Track",
     "storeClass" : "JBrowse/Store/SeqFeature/NCList",
     "type" : "FeatureTrack",
     "label": "mygff",
     "fmtDetailValue_Name": "function(name) { return '<a href=\"http://www.example.com?featurename='+name+'\">'+name+'</a>'; }"
    }

  
Addendum: If the field has multiple values (e.g. multiple DBXrefs or GO
terms), then the callback will receive an array as it's argument, and
then you can also return an array which indicates that each element will
be formatted inside its own \ In this case you will check that the
input is an array, because it will also be called on the individual
elements too. For example

     "fmtDetailValue_links": "function(links) { if(Array.isArray(links)) { return links; } else return `<a href=\"${link}\">${link}</a>`; }"

This shows that you could, in essence, pre-process the array if you
wanted, but the same callback is then called on the individual elements,
so you handle both these cases.

### Additional customizations to the pop-up boxes

In JBrowse 1.11.5, some additional customizations to the pop-up boxes
were added.

1\. The ability to access the feature data was added to the callback
signature of the fmtDetailValue\_\* functions. Example:

    fmtDetailValue_Name = function(name, feature) {
        /* only add links to the top-level feature */
        if(feature.get('type')=='mRNA') {
            return name + ' [<a href=http://www.ncbi.nlm.nih.gov/gquery/?term='+name+'>Search NCBI</a>]';
        }
      }

2\. The ability to customize the 'About track' popups was added. These
callbacks are named fmtMetaValue\_\* and fmtMetaField\_\*

3\. The ability to customize mouseover descriptions of the fieldnames
was also added. These callbacks are named fmtDetailDescription\_\* and
fmtMetaDescription\_\*

4\. The ability to remove a field from the popup was added. You can do
this by returning null from a fmtDetailField\_\* and fmtMetaField\_\*
callback;

## Customizing Left-click Behavior

Beginning with JBrowse 1.5.0, the left-clicking behavior of feature
tracks (both HTMLFeatures and CanvasFeatures) is highly configurable. To
make something happen when left-clicking features on a track, add an
onClick option to the feature track's configuration.

  
In the example configuration below, left-clicks on features will open an
embedded popup window showing the results of searching for that
feature's name in NCBI's global search, and "search at NCBI" will show
in a tooltip when the user hovers over a feature with the mouse:

``` de1
   "tracks": [
      {
         "label"    : "ReadingFrame",
         "category" : "Genes",
         "class"    : "dblhelix",
         "key"      : "Frame usage",
         "onClick"  : {
             "label": "search at NCBI",
             "url": "http://www.ncbi.nlm.nih.gov/gquery/?term={name}"
         }
      }
   ...
```

For details on all the options supported by **onClick**, see [Click
Configuration Options](#Click_Configuration_Options).

Note: the style→linkTemplate variable can also be used to specify a URL
for left-click on features, but this is a legacy option.

## Customizing Mouse-over behavior

The onClick-\>label attribute from the [previous
section](#Customizing_Left-click_Behavior) is used as the mouse-over
description for features on the HTMLFeatures and CanvasFeatures tracks.

In JBrowse 1.11.6, the onClick-\>label attribute was extended further to
allow the mouse-over description to be customized using callbacks and
template strings.

  
Example for CanvasFeatures, allows full HTML tooltips. Here the {name}
template is automatically filled in with the feature info:

  

``` de1
    "onClick": {
        "label" : "Feature name: {name}",
        "title" : "{name} {type}",
        "action": "defaultDialog"
    }
```

Example for HTMLFeatures, which only allows plain text descriptions but
can support newlines (essentially uses \ for
mouseover).

``` de1
    "onClick": {
        "label": "Feature name {name}\nFeature start {start}\nFeature end {end}",
        "title" : "{name} {type}",
        "action": "defaultDialog"
    }
```

  
Example using a callback (for either HTMLFeatures or CanvasFeatures),
using this.feature to access the feature details

  

``` de1
    "onClick": {
        "label": "function() { return 'Feature name: '+this.feature.get('name'); }",
        "title" : "{name} {type}",
        "action": "defaultDialog"
    }
```

  
Note: on CanvasFeatures, the action "defaultDialog" isn't necessary, but
it is necessary for HTMLFeatures to keep the default dialog (as of
writing, 1.11.6).

Also note: The "label" which is used in the text for mouseover will be
used for the title of any popup by default, so you might also specify a
different title.

Also also note: Your mouseover will crash if your features do not have
an ID or name, even if you coded the mouseover to not use ID or name.

## Configuring Summary Histograms

Canvas-based feature tracks (CanvasFeatures) support an optional
`histograms` configuration subsection that can contain a definition for
a second datastore that holds quantitative data (usually either coverage
depth or feature density) to be displayed when zoomed further out than
`featureScale` (or if `featureScale` is not set, the scale determined by
the store's feature density divided by `maxFeatureScreenDensity`). This
is often used for BAM coverage on Alignments2 tracks using the
`histograms.urlTemplate` and `histograms.storeClass` arguments.

  
Example track

    [ tracks.mytrack ]
    histograms.storeClass = JBrowse/Store/SeqFeature/BigWig
    histograms.urlTemplate = coverage.bw
    storeClass = JBrowse/Store/SeqFeature/BAM
    urlTemplate = file.bam
    type = Alignments2

## Customizing Right-click Context Menus

Feature tracks can be configured to display a context menu of options
when a user right-clicks a feature item. Here is an example of a track
configured with a multi-level right-click context menu:

         {
            "feature" : [
               "match"
            ],
            "track" : "Alignments",
            "category" : "Alignments",
            "class" : "feature4",
            "key" : "Example alignments",
            "hooks": {
                "modify": "function( track, feature, div ) { div.style.height = (Math.random()*10+8)+'px';  div.style.backgroundColor = ['green','blue','red','orange','purple'][Math.round(Math.random()*5)];}"
            },
            "menuTemplate" : [
                {
                  "label" : "Item with submenu",
                  # hello this is a comment
                  "children" : [
                  {
                    "label" : "Check gene on databases",
                    "children" : [
                    {
                      "label" : "Query trin for {name}",
                      "iconClass" : "dijitIconBookmark",
                      "action": "newWindow",
                      "url" : "http://wiki.trin.org.au/{name}-{start}-{end}"
                    },
                    {
                    "label" : "Query example.com for {name}",
                    "iconClass" : "dijitIconSearch",
                    "url" : "http://example.com/{name}-{start}-{end}"
                    }
                    ]
                  },
                  { "label" : "2nd child of demo" },
                  { "label" : "3rd child: this is a track" }
                ]
                },
                {
                  "label" : "Open example.com in an iframe popup",
                  "title" : "The magnificent example.com (feature {name})",
                  "iconClass" : "dijitIconDatabase",
                  "action": "iframeDialog",
                  "url" : "http://www.example.com?featurename={name}"
                },
                {
                  "label" : "Open popup with XHR HTML snippet (btw this is feature {name})",
                  "title": "function(track,feature,div) { return 'Random XHR HTML '+Math.random()+' title!'; }",
                  "iconClass" : "dijitIconDatabase",
                  "action": "xhrDialog",
                  "url" : "sample_data/test_snippet.html?featurename={name}:{start}-{end}"
                },
                {
                  "label" : "Open popup with content snippet (btw this is feature {name})",
                  "title": "function(track,feature,div) { return 'Random content snippet '+Math.random()+' title!'; }",
                  "iconClass" : "dijitIconDatabase",
                  "action": "contentDialog",
                  "content" : "function(track,feature,div) { return '<h2>{name}</h2><p>This is some test content about feature {name}!</p><p>This message brought to you by the number <span style=\"font-size: 300%\">'+Math.round(Math.random()*100)+'</span>.</p>
                },
                {
                  "label" : "function(track,feature,div) { return 'Run a JS callback '+Math.random()+' title!'; }",
                  "iconClass" : "dijitIconDatabase",
                  "action": "function( evt ){ alert('Hi there! Ran the callback on feature '+this.feature.get('name')); }"
                },
                {
                  "label": "Create a url with a callback",
                  "action": "iframeDialog",
                  "iconClass": "dijitIconDatabase",
                  "title": "Create a url with a callback",
                  "url": "function(track,feature) { return
                      'http://www.example.com?refseq='+track.refSeq.name
                      +'&featurename='+feature.get('name')+'&start='+feature.get('start')+'&end='+feature.get('end'); }"
                 },
            ]
         }

This configuration results in a context menu like the one pictured
below. For details on what each of the options supported by menu items
does, see [\#Click Configuration Options](#Click_Configuration_Options).

<a href="../File:Jbrowse_rightclick.png" class="image"></a>

## Rendering high resolution screenshots using Puppeteer

The Google Chrome headless browser "Puppeteer" is an alternative to
PhantomJS

The jbrowse-rasterize tool from cpgJBrowseToolkit provides a tool for
automating puppeteer
<a href="https://github.com/cancerit/cgpJBrowseToolkit/"
class="external free"
rel="nofollow">https://github.com/cancerit/cgpJBrowseToolkit/</a>

A stripped down puppeteer example is as follows

First run "npm install puppeteer" in a new directory, then create a file
screenshot.js

       const puppeteer = require('puppeteer');
       function delay(ms) {
           return new Promise(r => setTimeout(r, ms));
       }
       (async () => {
         const browser = await puppeteer.launch();
         const page = await browser.newPage();
         const argv=process.argv;
         await page.goto(argv[2]);
         //debug
         //page.on('console', msg => console.log('PAGE LOG:', msg.text()));
         await page.setViewport({
           width:+argv[4]|1000,
           height:+argv[5]|600,
           deviceScaleFactor:argv[6]|2
         });
         // wait five seconds for rendering, add or remove time as needed
         await delay(5000);
         await page.screenshot({path: argv[3]|"example.png"});
         await browser.close();
       })();

Then you can run "node screenshot.js
<a href="http://localhost/jbrowse/" class="external free"
rel="nofollow">http://localhost/jbrowse/</a>" or other URL argument as
needed. The third, fourth, fifth and sixth arguments are optional a)
output filename b) output width c) output height and d) zoom factor to
make it higher resolution

  

# External Links

- <a href="http://genome.cshlp.org/content/19/9/1630.full"
  class="external text" rel="nofollow">JBrowse: A Next Generation Genome
  Browser</a> paper

:

- [JBrowse](../Category%253AJBrowse "Category%253AJBrowse")

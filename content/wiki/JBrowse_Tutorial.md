---
title: "JBrowse Tutorial 2013"
---
# JBrowse Tutorial 2013

(Redirected from [JBrowse
Tutorial](/wiki/JBrowse_Tutorial)

This [JBrowse](/wiki/JBrowse.1) tutorial was presented by [Robert
Buels](/wiki/User%253ARobertBuels) at the [2013 GMOD Summer
School](/wiki/2013_GMOD_Summer_School) in July 2013
using JBrowse 1.9.8.

This tutorial uses the AWS AMI **ami-d2c8b1bb** named **2013 GMOD start
day 3** in the US-East region.

  Prerequisites](#Prerequisites)
- [JBrowse
  Introduction](#JBrowse_Introduction)
- [Setting up
  JBrowse](#Setting_up_JBrowse)
  - [Getting
    JBrowse](#Getting_JBrowse)
  - [Starting
    Point](#Starting_Point)
  - [Basic
    Steps](#Basic_Steps)
  - [Features
    from a directory of
    files](#Features_from_a_directory_of_files)
    - [Specify reference
      sequences](#Specify_reference_sequences)
    - [Load
      Feature Data](#Load_Feature_Data)
    - [Index
      feature names](#Index_feature_names)
  - [Features
    from GFF3 or BED files](#Features_from_GFF3_or_BED_files)
  - [BAM
    alignments](#BAM_alignments)
  - [BAM
    coverage](#BAM_coverage)
  - [Quantitative data](#Quantitative_data)
    - [BigWig](#BigWig)
  - [Variation
    Data](#Variation_Data)
    - [VCF
      tracks](#VCF_tracks)
  - [Faceted
    Track Selection](#Faceted_Track_Selection)
- [JBrowse
  Features](#JBrowse_Features)
  - [Highlighting interesting
    things](#Highlighting_interesting_things)
  - [Opening
    local files](#Opening_local_files)
  - [Combination tracks (coming in
    1.10.0)](#Combination_tracks_.28coming_in_1.10.0.29)
- [Upgrading an
  Existing JBrowse](#Upgrading_an_Existing_JBrowse)
- [Common
  Problems](#Common_Problems)
- [Future JBrowse
  Plans](#Future_JBrowse_Plans)
- [Other
  links](#Other_links)

## Prerequisites

These have **already been set up** on the VM image.

Optional, for generating images from Wiggle files:

- libpng12-0
- libpng12-dev
- a C++ compiler

Optional, for BAM files (`setup.sh` tries to install these for you in
the JBrowse directory):

- samtools, and its dependency libncurses5-dev
- perl module: <a href="http://search.cpan.org/perldoc?Bio::DB::SAM"
  class="external text" rel="nofollow">Bio::DB::SAM</a>

Other prerequisites are installed by JBrowse automatically.

This is how they were installed: **(don't do this yourself)**

``` dont
  sudo apt-get install libpng12-0 libpng12-dev build-essential libncurses5-dev
```

Make sure you can copy/paste from the wiki.

It's also very useful to know how to tab-complete in the shell.

## JBrowse Introduction

How and why [JBrowse](/wiki/JBrowse.1) is different from most other
web-based genome browsers, including [GBrowse](/wiki/GBrowse.1).

More detail: <a href="http://genome.cshlp.org/content/19/9/1630.full"
class="external text" rel="nofollow">paper</a>

<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/90/JBrowse_gmod_summerschool_jul2013.pdf"
class="internal" title="JBrowse gmod summerschool jul2013.pdf">JBrowse
presentation</a>

## Setting up JBrowse

### Getting JBrowse

- prepare a directory for JBrowse
    cd /var/www
    sudo mkdir jbrowse_demo
    sudo chown ubuntu.ubuntu jbrowse_demo
    cd jbrowse_demo

- download the demo bundle from jbrowse.org and unzip it
    wget http://jbrowse.org/info/GMOD_Jul_2013/GMOD_Summer_School_2013_JBrowse.zip
    unzip GMOD_Summer_School_2013_JBrowse.zip
    cd GMOD_Summer_School_2013_JBrowse/
    unzip JBrowse-1.9.8.zip
    mv JBrowse-1.9.8 jbrowse

- run `setup.sh` to configure this copy of JBrowse
    cd jbrowse
    ./setup.sh

### Starting Point

Visit in web browser:

http://ec2-##-##-##-##.compute-1.amazonaws.com/jbrowse_demo/GMOD_Summer_School_2013_JBrowse/jbrowse/index.html

You should see a "Congratulations" page.

### Basic Steps

There are four basic steps to setting up an instance of JBrowse:

1.  Load and format reference sequences
2.  Format data for tracks
3.  Configure direct-access tracks
4.  Index feature names



### Features from a directory of files

Here, we'll use the
<a href="http://search.cpan.org/perldoc?Bio::DB::SeqFeature::Store"
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a>
adaptor in "memory" mode to read a directory of files. There are
adaptors available for use with many other databases, such as
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> and
<a href="http://search.cpan.org/perldoc?Bio::DB::GFF"
class="external text" rel="nofollow">Bio::DB::GFF</a>.

Config file: `pythium-1.conf`

    {
      "description": "GMOD Summer School 2013 P. ultima Example",
      "db_adaptor": "Bio::DB::SeqFeature::Store",
      "db_args" : {
          "-adaptor" : "memory",
          "-dir" : ".."
       },
    ...

#### Specify reference sequences

The first script to run is `bin/prepare-refseqs.pl`; that script is the
way you tell JBrowse about what your reference sequences are. Running
`bin/prepare-refseqs.pl` also sets up the "DNA" track.

Run this from within the `jbrowse` directory (you could run it
elsewhere, but you'd have to explicitly specify the location of the data
directory on the command line).

    cd /var/www/jbrowse_demo/GMOD_Summer_School_2013_JBrowse/jbrowse
    bin/prepare-refseqs.pl --gff ../scf1117875582023.gff

Refresh it in your web browser, you should new see the JBrowse UI and a
sequence track, which will show you the DNA base pairs if you zoom in
far enough.

#### Load Feature Data

Next, we'll use `biodb-to-json.pl` to get feature data out of the
database and turn it into [JSON](/wiki/Glossary#JSON) data that the
web browser can use.

In this case, we have specified all of our track configurations in
`pythium-1.conf`.

``` de1
...

  "TRACK DEFAULTS": {
    "class": "feature"
  },

 "tracks": [
    {
      "track": "Genes",
      "key": "Genes",
      "feature": ["mRNA"],
      "autocomplete": "all",
      "class": "transcript",
      "subfeature_classes" : {
            "CDS" : "transcript-CDS",
            "UTR" : "transcript-UTR"
      }
    },
   ...
]
```

`track` specifies the track identifier (a unique name for the track, for
the software to use). This should be just letters and numbers and - and
\_ characters; using other characters makes things less convenient.

`key` specifies a human-friendly name for the track, which can use any
characters you want.

`feature` gives a list of feature types to include in the track.

`autocomplete` including this setting makes the features in the track
searchable.

`urltemplate` specifies a URL pattern that you can use to link genomic
features to specific web pages.

`class` specifies the [CSS](/wiki/Glossary#CSS) class that
describes how the feature should look.

For this particular track, I've specified the `transcript` feature
class.

Run the `bin/biodb-to-json.pl` script with this config file to format
this track, and the others in the file:

    bin/biodb-to-json.pl --conf ../pythium-1.conf

Refresh JBrowse in your web browser. You should now see a bunch of
annotation tracks.

#### Index feature names

When you generate JSON for a track, if you specify `"autocomplete"` then
a listing of all of the feature names from that track (along with
feature locations) will also be generated and used to provide feature
searching and autocompletion.

The `bin/generate-names.pl` script collects those lists of names from
all the tracks and combines them into one big tree that the client uses
to search.

    bin/generate-names.pl -v

Visit in web browser, try typing a feature name, such as
**maker-scf1117875582023-snap-gene-0.26-mRNA-1**. Notice that JBrowse
tries to auto-complete what you type.

### Features from GFF3 or BED files

We're going to add a couple more tracks that come from a flat file,
`repeats.gff`. To get feature data from flat files into JBrowse, we use
`flatfile-to-json.pl`.

- We'll add a RepeatMasker track:
    bin/flatfile-to-json.pl --trackLabel repeatmasker \
        --type match:repeatmasker --key RepeatMasker \
        --className generic_parent \
        --subfeatureClasses '{"match_part" : "feature"}' --gff ../repeats.gff

- And then a RepeatRunner track:
    bin/flatfile-to-json.pl --trackLabel repeatrunner \
        --type protein_match:repeatrunner \
        --key RepeatRunner --className generic_parent \
        --subfeatureClasses '{"match_part" : "feature"}' --gff ../repeats.gff

Visit in web browser; you should see the two new RepeatMasker and
RepeatRunner tracks.

### BAM alignments

JBrowse can display alignments directly from a BAM file on your web
server. Simply place the BAM file in a directory accessible to your web
server, and add a snippet of configuration to JBrowse to add the track,
similar to:

``` de1
     {
        "label" : "bam_alignments",
        "key" : "BAM alignments",
        "storeClass" : "JBrowse/Store/SeqFeature/BAM",
        "urlTemplate" : "../../simulated-sorted.bam",
        "type" : "Alignments2"
      }
```

This can be added by either editing the `data/trackList.json` file with
a text editor, or by running something like this at the command line to
inject the track configuration:

    echo '{
           "label" : "bam_alignments",
           "key" : "BAM alignments",
           "storeClass" : "JBrowse/Store/SeqFeature/BAM",
           "urlTemplate" : "../../simulated-sorted.bam",
           "type" : "Alignments2"
         }' | bin/add-track-json.pl data/trackList.json

### BAM coverage

``` de1
     {
        "label" : "bam_coverage",
        "key" : "BAM Coverage",
        "storeClass" : "JBrowse/Store/SeqFeature/BAM",
        "urlTemplate" : "../../simulated-sorted.bam",
        "type" : "SNPCoverage"
      }
```

### Quantitative data

#### BigWig

JBrowse can display quantitative data directly from a BigWig file on
your web server. Simply place the BigWig file in a directory accessible
to your web server, and add a snippet of configuration to JBrowse to add
the track, similar to:

``` de1
     {
        "label" : "bigwig_bam_coverage",
        "key" : "BigWig - BAM coverage",
        "storeClass" : "BigWig",
        "urlTemplate" : "../../simulated-sorted.bam.coverage.bw",
        "type" : "JBrowse/View/Track/Wiggle/XYPlot",
        "variance_band" : true
      }
```

This can be added by either editing the `data/trackList.json` file with
a text editor, or by running something like this at the command line to
inject the track configuration:

    echo ' {
           "label" : "bam_coverage",
           "key" : "BAM coverage",
           "storeClass" : "BigWig",
           "urlTemplate" : "../../simulated-sorted.bam.coverage.bw",
           "type" : "JBrowse/View/Track/Wiggle/XYPlot",
           "variance_band" : true
         } ' | bin/add-track-json.pl data/trackList.json

### Variation Data

#### VCF tracks

JBrowse can also display VCF variation data directly from a VCF file on
your web server that has been compressed with Heng Li's bgzip and tabix.
Simply place the .vcf.gz and .vcf.gz.tbi files in a directory accessible
to your web server, and add a snippet of configuration to JBrowse to add
the track, similar to:

``` de1
      {
        "label" : "bam_variation",
        "key" : "VCF simulated variation",
        "storeClass" : "JBrowse/Store/SeqFeature/VCFTabix",
        "urlTemplate" : "../../simulated-sorted.vcf.gz",
        "type" : "HTMLVariants"
      }
```

This can be added by either editing the `data/trackList.json` file with
a text editor, or by running something like this at the command line to
inject the track configuration:

    echo ' {
           "label" : "bam_variation",
           "key" : "VCF simulated variation",
           "storeClass" : "JBrowse/Store/SeqFeature/VCFTabix",
           "urlTemplate" : "../../simulated-sorted.vcf.gz",
           "type" : "HTMLVariants"
         } ' | bin/add-track-json.pl data/trackList.json



### Faceted Track Selection

JBrowse has a very powerful faceted track selector that can be used to
search for tracks using metadata associated with them.

The track metadata is kept in a CSV-format file, with any number of
columns, and with a "label" column whose contents must correspond to the
track labels in the JBrowse configuration.

The demo bundle contains an example `trackMetadata.csv` file, which can
be copied into the `data` directory for use with this configuration.

    cp trackMetadata.csv jbrowse/data

Then a simple faceted track selection configuration might look like:

``` de1
   trackSelector: {
       type: 'Faceted',
   },
   trackMetadata: {
       sources: [
          { type: 'csv', url: 'data/trackMetadata.csv' }
       ]
   }
```

The `jbrowse_conf.json` file in the `jbrowse` directory already
conveniently contains this stanza, commented out. Uncomment it, refresh
your browser, and you should now see the faceted track selector
activated.

## JBrowse Features

### Highlighting interesting things

To highlight a region, you can either right-click on a feature and
select 'highlight this', or you can set the highlight explicitly to a
certain genomic region by clicking "View -\> Set highlight" in the menu
bar.

Beginning in JBrowse 1.10.0 you can also highlight a region with the
mouse by clicking the highlighter tool (next to the Go button) and
clicking and dragging to highlight a region.

### Opening local files

JBrowse can display GFF3, BAM, BigWig, and VCF+Tabix files directly from
your local machine without the need to transfer any data to the server.
Just use the "File -\> Open" tool from the menu bar to add tracks using
local files.

### Combination tracks (coming in 1.10.0)

Starting in version 1.10.0, users can define tracks that are
combinations of the data in other tracks. The operations used to combine
these tracks can be set operations (union, intersection, subtraction),
arithmetic operations for quantitative tracks (addition, subtraction,
multiplication, division), and/or masking operations to just highlight
or mask some regions based on data in another track.

To add a combination track, select "File-\>Add combination track" from
the menu bar, and drag existing tracks into the new combination track to
start combining them.

## Upgrading an Existing JBrowse

If the old JBrowse is 1.3.0 or later, simply move the data directory
from the old JBrowse directory into the new JBrowse directory.

## Common Problems

- JSON syntax errors in configuration files (2.x series will stop this
  madness!)

## Future JBrowse Plans

See the
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/90/JBrowse_gmod_summerschool_jul2013.pdf"
class="internal"
title="JBrowse gmod summerschool jul2013.pdf">accompanying slides
(PDF)</a>

## Other links

- Config file ref:
  <a href="http://jbrowse.org/code/jbrowse-master/docs/config.html"
  class="external free"
  rel="nofollow">http://jbrowse.org/code/jbrowse-master/docs/config.html</a>
- DIV test: <a href="http://jbrowse.org/test/boatdiv/boat.html"
  class="external free"
  rel="nofollow">http://jbrowse.org/test/boatdiv/boat.html</a>

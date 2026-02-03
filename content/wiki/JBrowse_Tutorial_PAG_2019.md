---
title: "JBrowse Tutorial PAG 2019"
---
# JBrowse Tutorial PAG 2019

This [JBrowse](JBrowse.1 "JBrowse") tutorial was presented by [Scott
Cain](User%253AScott "User%253AScott") at the
<a href="http://www.intlpag.org" class="external text"
rel="nofollow">Plant and Animal Genomes</a> meeting using JBrowse
1.16.1.

This tutorial assumes a
<a href="https://www.virtualbox.org" class="external text"
rel="nofollow">VirtualBox</a> Ubuntu 18.04 (LTS) instance with the
tutorial bundle zip file, also available on Amazon S3: <a
href="https://s3.amazonaws.com/jbrowse-tutorials/JBrowse+PAG+2019.ova.bz2"
class="external text" rel="nofollow">JBrowse PAG 2019.ova.bz2</a> (about
4GB).

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
  - [A Short
    Detour for GFF](#A_Short_Detour_for_GFF)
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
  - [Paired
    read CRAM data](#Paired_read_CRAM_data)
    - [Paired Read Glyph
      Options](#Paired_Read_Glyph_Options)
  - [Faceted
    Track Selection](#Faceted_Track_Selection)
- [Changing the
  way tracks look](#Changing_the_way_tracks_look)
  - [Making
    changes based on the data](#Making_changes_based_on_the_data)
  - [Making
    links open something else](#Making_links_open_something_else)
- [Using
  Plugins](#Using_Plugins)
- [JBrowse
  Features](#JBrowse_Features)
  - [Highlighting interesting
    things](#Highlighting_interesting_things)
  - [Opening
    local files](#Opening_local_files)
  - [Combination
    tracks](#Combination_tracks)
- [Upgrading an
  Existing JBrowse](#Upgrading_an_Existing_JBrowse)
- [Common
  Problems](#Common_Problems)
- [Other
  links](#Other_links)

## Prerequisites

Prerequisites are installed by JBrowse automatically. A few things may
fail to install (like legacy support for wiggle files), but that doesn't
matter.

Make sure you can copy/paste from the wiki.

It's also very useful to know how to tab-complete in the shell.

It's probably a good idea to use a browser like Chrome or Firefox that
has the ability to turn off caching while working on this tutorial. To
do this in Chrome, with the browser open to the JBrowse page you're
working on, select Developer-\>Javascript Console from the View menu. In
the console, click the "gear" icon (settings) and check the box labeled
"Disable Cache".

## JBrowse Introduction

How and why [JBrowse](JBrowse.1 "JBrowse") is different from most other
web-based genome browsers, including [GBrowse](GBrowse.1 "GBrowse").

More detail: <a href="http://genome.cshlp.org/content/19/9/1630.full"
class="external text" rel="nofollow">paper</a>

<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e2/JBrowse_PAG_2017.pdf" class="internal"
title="JBrowse PAG 2017.pdf">JBrowse presentation</a>

## Setting up JBrowse

### Getting JBrowse

- download the demo bundle from Amazon and unzip it. Don't do the things
  in yellow; they were done ahead in the interests of time.
    cd html

``` dont
 ##curl -O https://s3.amazonaws.com/jbrowse-tutorials/PAG_2019_JBrowse.zip</span> #that's a capital dash"O" not a zero/zed.
```

    cp ~/PAG_2019_JBrowse.zip . ## if we don't need to update the zip file
    unzip PAG_2019_JBrowse.zip

``` dont
 unzip jbrowse-1.16.1-release.zip
 mv jbrowse-1.16.1-release jbrowse
```

- run `setup.sh` to configure this copy of JBrowse
    cd jbrowse

``` dont
 ./setup.sh
```

Typically, this setup step doesn't take very long, but on these virtual
machines on an already slow laptop, they can take a while.

### Starting Point

Visit in web browser (ie, Firefox inside the virtual machine):

    http://localhost/jbrowse/index.html

You should see a "Congratulations" page.

### Basic Steps

There are four basic steps to setting up an instance of JBrowse:

1.  Load and format reference sequences
2.  Format data for tracks
3.  Configure direct-access tracks
4.  Index feature names

### A Short Detour for GFF

[GFF](GFF "GFF") (Generic Feature Format) is a very commonly used text
format for describing features that exist on sequences. We'll head off
to [that page](GFF "GFF") to talk about it a bit.

### Features from a directory of files

Here, we'll use the
<a href="http://search.cpan.org/perldoc?Bio::DB::SeqFeature::Store"
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a>
adaptor in "memory" mode to read a directory of files. There are
adaptors available for use with many other databases, such as
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> and
<a href="http://search.cpan.org/perldoc?Bio::DB::GFF"
class="external text" rel="nofollow">Bio::DB::GFF</a>.

Config file: `pythium-1.conf`

    {
      "description": "PAG 2017 P. ultima Example",
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

    cd ~/html/jbrowse
    bin/prepare-refseqs.pl --gff ../PAG_2019_JBrowse/scf1117875582023.gff

Refresh it in your web browser, you should new see the JBrowse UI and a
sequence track, which will show you the DNA base pairs if you zoom in
far enough.

#### Load Feature Data

Next, we'll use `biodb-to-json.pl` to get feature data out of the
database and turn it into [JSON](Glossary#JSON "Glossary") data that the
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

`class` specifies the [CSS](Glossary#CSS "Glossary") class that
describes how the feature should look.

For this particular track, I've specified the `transcript` feature
class.

Run the `bin/biodb-to-json.pl` script with this config file to format
this track, and the others in the file:

    bin/biodb-to-json.pl --conf ../PAG_2019_JBrowse/pythium-1.conf

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
    bin/flatfile-to-json.pl --trackLabel "repeat masker" \
        --trackType CanvasFeatures \
        --type match:repeatmasker --key RepeatMasker \
        --className generic_parent \
        --subfeatureClasses '{"match_part" : "feature"}' --gff ../PAG_2019_JBrowse/repeats.gff

- And then a RepeatRunner track:
    bin/flatfile-to-json.pl --trackLabel "repeat runner" \
        --trackType CanvasFeatures \
        --type protein_match:repeatrunner \
        --key RepeatRunner --className generic_parent \
        --subfeatureClasses '{"match_part" : "feature"}' --gff ../PAG_2019_JBrowse/repeats.gff

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
        "urlTemplate" : "../../PAG_2019_JBrowse/simulated-sorted.bam",
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
           "urlTemplate" : "../../PAG_2019_JBrowse/simulated-sorted.bam",
           "type" : "Alignments2"
         }' | bin/add-track-json.pl data/trackList.json

### BAM coverage

This time we'll use a text editor and will edit the track configuration
file directly. Type

      gedit data/trackList.json

and insert the text below in the "tracks" array (the easiest thing to do
is find the "\[" after "tracks", paste there and then add a comma after
the "}").

``` de1
     {
        "label" : "bam_coverage",
        "key" : "BAM Coverage",
        "storeClass" : "JBrowse/Store/SeqFeature/BAM",
        "urlTemplate" : "../../PAG_2019_JBrowse/simulated-sorted.bam",
        "type" : "SNPCoverage"
      }
```

and then press the Save button.

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
        "urlTemplate" : "../../PAG_2019_JBrowse/simulated-sorted.bam.coverage.bw",
        "type" : "JBrowse/View/Track/Wiggle/XYPlot",
        "variance_band" : true
      }
```

This can be added by either editing the `data/trackList.json` file with
a text editor, or by running something like this at the command line to
inject the track configuration:

    echo ' {
           "label" : "bigwig_bam_coverage",
           "key" : "BigWig - BAM coverage",
           "storeClass" : "BigWig",
           "urlTemplate" : "../../PAG_2019_JBrowse/simulated-sorted.bam.coverage.bw",
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
        "urlTemplate" : "../../PAG_2019_JBrowse/simulated-sorted.vcf.gz",
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
           "urlTemplate" : "../../PAG_2019_JBrowse/simulated-sorted.vcf.gz",
           "type" : "HTMLVariants"
         } ' | bin/add-track-json.pl data/trackList.json

### Paired read CRAM data

We can use a text editor again to edit track configuration file
directly. So, if you don't already have gedit open, once again, type

      gedit data/trackList.json

and insert the text below in the "tracks" array (the easiest thing to do
is find the "\[" after "tracks", paste there and then add a comma after
the "}").

``` de1
     {
        "label" : "paired_cram",
        "key" : "Paired CRAM",
        "glyph": "JBrowse/View/FeatureGlyph/PairedAlignment",
        "storeClass" : "JBrowse/Store/SeqFeature/CRAM",
        "urlTemplate" : "../../PAG_2019_JBrowse/simulated.cram",
        "type" : "Alignments2"
      }
```

and then press the Save button.

#### Paired Read Glyph Options

Now is also a good time to look at the plethora of options available for
working with the paired read glyph. To access them, hover the mouse over
the the track label (where it says "Paired CRAM") and click the down
triangle to display an options menu. Feel free to play, but because this
track's data are simulated, they are kind of boring. Be sure to check
out the track visualization types.

### Faceted Track Selection

JBrowse has a very powerful faceted track selector that can be used to
search for tracks using metadata associated with them.

The track metadata is kept in a CSV-format file, with any number of
columns, and with a "label" column whose contents must correspond to the
track labels in the JBrowse configuration.

The demo bundle contains an example `trackMetadata.csv` file, which can
be copied into the `data` directory for use with this configuration.

    cp ../PAG_2019_JBrowse/trackMetadata.csv data/

Then a simple faceted track selection configuration might look like:

``` de1
   "trackSelector": {
       "type": 'Faceted',
   },
   "trackMetadata": {
       "sources": [
          { "type": 'csv', "url": 'data/trackMetadata.csv' }
       ]
   }
```

Copy the section above and put it in the empty curly braces in the
`jbrowse_conf.json` file in the `jbrowse` directory, save it, refresh
your browser, and you should now see the faceted track selector
activated.

## Changing the way tracks look

Tracks can be modified by changing several aspects of how the images are
created. While this can be done be done both with HTML and Canvas
tracks, this tutorial will focus on Canvas tracks only (the repeat
tracks created above).

The configuration for the RepeatMasker track looks like this:

``` de1
      {
         "key" : "RepeatMasker",
         "trackType" : "CanvasFeatures",
         "storeClass" : "JBrowse/Store/SeqFeature/NCList",
         "urlTemplate" : "tracks/repeat masker/{refseq}/trackData.json",
         "style" : {
            "subfeatureClasses" : {
               "match_part" : "feature"
            },
            "className" : "generic_parent"
         },
         "type" : "CanvasFeatures",
         "compress" : 0,
         "label" : "repeat masker"
      }
```

Open the `data/trackList.json` file in your favorite editor and
Control-F will open a "find" window; search for "repeatmasker". A simple
change we can make is to the color; in the line starting with "style",
add:

``` de1
  "color" : "black",
```

save the changes and select the RepeatMasker track or reload the browser
to see the change. Many attributes of the display can be modified in
this way, see the [JBrowse Configuration
Guide](JBrowse_Configuration_Guide#CanvasFeatures_Configuration_Options "JBrowse Configuration Guide")
for a list of options.

### Making changes based on the data

Much like GBrowse's perl callbacks that can change the track display, in
the JBrowse configuration file you can include JavaScript functions to
change the way tracks look. For example, in the RepeatMasker track, we
can change the color of the glyph depending on what kind of repeat it is
(where we happen to know that the type of repeat is encoded in the
name). In this example, we leave the glyph black, unless it is a low
complexity repeat, where we'll color it red. A function to do that would
look like this:

``` de1
  "color" : "function(feature) { var name = feature.get('Name'); if (name.match('Low_complexity') ) { return 'red'; } return 'black';  }",
```

When editing the trackList.json file directly in this way, the function
has to go all on one line, but if we create an "include file" (not
covered here) the function can have carriage returns in it. Replace the
simple "color : black" section we just created in the configuration file
with the function above, save the file and reload the browser page to
see the changes (you might have to mouse around to find a low complexity
repeat).

### Making links open something else

The default action when you click on a glyph is to open a "floating"
window that displays everything JBrowse knows about a feature. If you'd
like something else to happen, you have several options ([outlined
here](JBrowse_Configuration_Guide#Click_Configuration_Options "JBrowse Configuration Guide")),
including having a different floating window open or executing any
JavaScript function you define. For this example, we'll create a link
that will Google the repeat's name and open the result in a new window.
In the RepeatMasker section of the JBrowse configuration, we'll add a
section that looks like this after the style section:

``` de1
        "onClick" : {
           "iconClass" : "dijitIconDatabase",
           "action" : "newWindow",
           "url" : "http://www.google.com/search?q={name}",
           "label" : "Search for {name} at Google",
           "title" : "function(track,feature,div) { return 'Searching for '+feature.get('name')+' at Google'; }"
        },
```

If you're having difficulties, the RepeatMasker section of the
configuration file should now look something like this:

``` de1
      {
         "type" : "CanvasFeatures",
         "trackType" : "CanvasFeatures",
         "style" : {
            "color" : "function(feature) { var name = feature.get('Name'); if (name.match('Low_complexity') ) { return 'red'; } return 'black';  }",
            "subfeatureClasses" : {
               "match_part" : "feature"
            },
            "className" : "generic_parent"
         },
         "onClick" : {
           "iconClass" : "dijitIconDatabase",
           "action" : "newWindow",
           "url" : "http://www.google.com/search?q={name}",
           "label" : "Search for {name} at Google",
           "title" : "function(track,feature,div) { return 'Searching for '+feature.get('name')+' at Google'; }"
         },
         "compress" : 0,
         "storeClass" : "JBrowse/Store/SeqFeature/NCList",
         "label" : "repeatmasker",
         "urlTemplate" : "tracks/repeatmasker/{refseq}/trackData.json",
         "key" : "RepeatMasker"
      },
```

## Using Plugins

JBrowse is built with a very flexible and powerful plugin system. The
JBrowse developers are working on a plugin registry website, but for the
time being, you can look at the source code for what will drive the
website in the <a
href="https://www.google.com/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=1&amp;ved=0ahUKEwjyssGCz7fPAhUK2IMKHfcODEkQFggeMAA&amp;url=https%253A%2F%2Fgithub.com%2FGMOD%2Fjbrowse-registry&amp;usg=AFQjCNEZ9oH5eRRhbZtDcN-W78HcFuAxZw&amp;sig2=J5pff9m409Qv0eQ5Hnli8g"
class="external text" rel="nofollow">jbrowse-registry github repo</a>,
and in particular, the file that contains the info about the available
plugins, <a
href="https://github.com/GMOD/jbrowse-registry/blob/master/plugins.yaml"
class="external text" rel="nofollow">plugins.yaml</a>.

For this tutorial, we'll look at a plugin that is shipped with JBrowse
but isn't turned on by default. JBrowse plugins are typically stored in
the `plugins` directory, and in 1.12.1's plugin directory there are 6
plugins:

     CategoryUrl
     DebugEvents
     HideTrackLabels
     NeatCanvasFeatures
     NeatHTMLFeatures
     RegexSequenceSearch

and the RegexSequenceSearch plugin is already activated (look under the
"Track" menu for it). We will turn on the NeatHTMLFeatures plugin. Right
now the Genes track has relatively "boring" glyphs composed of pink
rectangles connected by black lines. To turn on NeatHTMLFeatures, just
add

       "plugins": [ 
          'NeatHTMLFeatures'
       ],

to the top of `data/trackList.json`, just inside the first open curly
brace. Reload JBrowse and turn on the Genes track if it isn't already
and see the wonder of the pseudo-3D gene glyphs.

Note that not all plugins are activated this way: typically, if the
plugin modifies the way tracks look, it will go here. If it modifies the
way JBrowse \*works\*, it will go in the `jbrowse.conf` file.

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

### Combination tracks

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
from the old JBrowse directory into the new JBrowse directory after
running the `setup.sh` script.

## Common Problems

- JSON syntax errors in configuration files (2.x series will stop this
  madness!)

## Other links

- Config file ref: [JBrowse Configuration
  Guide](JBrowse_Configuration_Guide "JBrowse Configuration Guide")
- DIV test: <a href="http://jbrowse.org/test/boatdiv/boat.html"
  class="external free"
  rel="nofollow">http://jbrowse.org/test/boatdiv/boat.html</a>

<span class="smwfactboxhead">Facts about
"<span class="swmfactboxheadbrowse"></span>"</span>

|----|----| [Has topic](Property%253AHas_topic "Property:Has topic") | [JBrowse](JBrowse.1 "JBrowse")  |

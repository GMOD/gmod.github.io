<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">JBrowse Tutorial PAG 2017</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

This [JBrowse](JBrowse.1 "JBrowse") tutorial was presented by [Scott
Cain](User:Scott "User:Scott") at the
<a href="http://www.intlpag.org" class="external text"
rel="nofollow">Plant and Animal Genomes</a> meeting using JBrowse
1.12.1.

This tutorial assumes a
<a href="https://www.virtualbox.org" class="external text"
rel="nofollow">VirtualBox</a> Ubuntu 16.10 instance with the tutorial
bundle zip file, also available on Amazon S3: <a
href="https://s3.amazonaws.com/jbrowse-tutorials/JBrowse+PAG+2017.ova.bz2"
class="external text" rel="nofollow">JBrowse PAG 2017.ova.bz2</a> (about
3GB).

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span>
  <span class="toctext">Prerequisites</span>](#Prerequisites)
- [<span class="tocnumber">2</span> <span class="toctext">JBrowse
  Introduction</span>](#JBrowse_Introduction)
- [<span class="tocnumber">3</span> <span class="toctext">Setting up
  JBrowse</span>](#Setting_up_JBrowse)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Getting
    JBrowse</span>](#Getting_JBrowse)
  - [<span class="tocnumber">3.2</span> <span class="toctext">Starting
    Point</span>](#Starting_Point)
  - [<span class="tocnumber">3.3</span> <span class="toctext">Basic
    Steps</span>](#Basic_Steps)
  - [<span class="tocnumber">3.4</span> <span class="toctext">A Short
    Detour for GFF</span>](#A_Short_Detour_for_GFF)
  - [<span class="tocnumber">3.5</span> <span class="toctext">Features
    from a directory of
    files</span>](#Features_from_a_directory_of_files)
    - [<span class="tocnumber">3.5.1</span>
      <span class="toctext">Specify reference
      sequences</span>](#Specify_reference_sequences)
    - [<span class="tocnumber">3.5.2</span> <span class="toctext">Load
      Feature Data</span>](#Load_Feature_Data)
    - [<span class="tocnumber">3.5.3</span> <span class="toctext">Index
      feature names</span>](#Index_feature_names)
  - [<span class="tocnumber">3.6</span> <span class="toctext">Features
    from GFF3 or BED files</span>](#Features_from_GFF3_or_BED_files)
  - [<span class="tocnumber">3.7</span> <span class="toctext">BAM
    alignments</span>](#BAM_alignments)
  - [<span class="tocnumber">3.8</span> <span class="toctext">BAM
    coverage</span>](#BAM_coverage)
  - [<span class="tocnumber">3.9</span>
    <span class="toctext">Quantitative data</span>](#Quantitative_data)
    - [<span class="tocnumber">3.9.1</span>
      <span class="toctext">BigWig</span>](#BigWig)
  - [<span class="tocnumber">3.10</span> <span class="toctext">Variation
    Data</span>](#Variation_Data)
    - [<span class="tocnumber">3.10.1</span> <span class="toctext">VCF
      tracks</span>](#VCF_tracks)
  - [<span class="tocnumber">3.11</span> <span class="toctext">Faceted
    Track Selection</span>](#Faceted_Track_Selection)
- [<span class="tocnumber">4</span> <span class="toctext">Changing the
  way tracks look</span>](#Changing_the_way_tracks_look)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Making
    changes based on the data</span>](#Making_changes_based_on_the_data)
  - [<span class="tocnumber">4.2</span> <span class="toctext">Making
    links open something else</span>](#Making_links_open_something_else)
- [<span class="tocnumber">5</span> <span class="toctext">Using
  Plugins</span>](#Using_Plugins)
- [<span class="tocnumber">6</span> <span class="toctext">JBrowse
  Features</span>](#JBrowse_Features)
  - [<span class="tocnumber">6.1</span>
    <span class="toctext">Highlighting interesting
    things</span>](#Highlighting_interesting_things)
  - [<span class="tocnumber">6.2</span> <span class="toctext">Opening
    local files</span>](#Opening_local_files)
  - [<span class="tocnumber">6.3</span>
    <span class="toctext">Combination
    tracks</span>](#Combination_tracks)
- [<span class="tocnumber">7</span> <span class="toctext">Upgrading an
  Existing JBrowse</span>](#Upgrading_an_Existing_JBrowse)
- [<span class="tocnumber">8</span> <span class="toctext">Common
  Problems</span>](#Common_Problems)
- [<span class="tocnumber">9</span> <span class="toctext">Other
  links</span>](#Other_links)

</div>

## <span id="Prerequisites" class="mw-headline">Prerequisites</span>

Prerequisites are installed by JBrowse automatically. A few things may
fail to install (like legacy support for wiggle files), but that doesn't
matter.

Make sure you can copy/paste from the wiki.

It's also very useful to know how to tab-complete in the shell.

It's probably a good idea to use a browser like Chrome that has the
ability to turn off caching while working on this tutorial. To do this
in Chrome, with the browser open to the JBrowse page you're working on,
select Developer-\>Javascript Console from the View menu. In the
console, click the "gear" icon (settings) and check the box labeled
"Disable Cache".

## <span id="JBrowse_Introduction" class="mw-headline">JBrowse Introduction</span>

How and why [JBrowse](JBrowse.1 "JBrowse") is different from most other
web-based genome browsers, including [GBrowse](GBrowse.1 "GBrowse").

More detail: <a href="http://genome.cshlp.org/content/19/9/1630.full"
class="external text" rel="nofollow">paper</a>

<a href="../mediawiki/images/e/e2/JBrowse_PAG_2017.pdf" class="internal"
title="JBrowse PAG 2017.pdf">JBrowse presentation</a>

## <span id="Setting_up_JBrowse" class="mw-headline">Setting up JBrowse</span>

### <span id="Getting_JBrowse" class="mw-headline">Getting JBrowse</span>

- download the demo bundle from Amazon and unzip it

<!-- -->

    cd html
    ##curl -O https://s3.amazonaws.com/jbrowse-tutorials/PAG_2017_JBrowse.zip #that's a capital dash"O" not a zero/zed.
    cp ~/PAG_2017_JBrowse.zip . ## if we don't need to update the zip file
    unzip PAG_2017_JBrowse.zip
    cd PAG_2017_JBrowse
    unzip JBrowse-1.12.1.zip
    mv JBrowse-1.12.1 jbrowse

- run `setup.sh` to configure this copy of JBrowse

<!-- -->

    cd jbrowse
    ./setup.sh

### <span id="Starting_Point" class="mw-headline">Starting Point</span>

Visit in web browser:

    http://localhost/PAG_2017_JBrowse/jbrowse/index.html

You should see a "Congratulations" page.

### <span id="Basic_Steps" class="mw-headline">Basic Steps</span>

There are four basic steps to setting up an instance of JBrowse:

1.  Load and format reference sequences
2.  Format data for tracks
3.  Configure direct-access tracks
4.  Index feature names

### <span id="A_Short_Detour_for_GFF" class="mw-headline">A Short Detour for GFF</span>

[GFF](GFF "GFF") (Generic Feature Format) is a very commonly used text
format for describing features that exist on sequences. We'll head off
to [that page](GFF "GFF") to talk about it a bit.

### <span id="Features_from_a_directory_of_files" class="mw-headline">Features from a directory of files</span>

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

#### <span id="Specify_reference_sequences" class="mw-headline">Specify reference sequences</span>

The first script to run is `bin/prepare-refseqs.pl`; that script is the
way you tell JBrowse about what your reference sequences are. Running
`bin/prepare-refseqs.pl` also sets up the "DNA" track.

Run this from within the `jbrowse` directory (you could run it
elsewhere, but you'd have to explicitly specify the location of the data
directory on the command line).

    cd ~/html/PAG_2017_JBrowse/jbrowse
    bin/prepare-refseqs.pl --gff ../scf1117875582023.gff

Refresh it in your web browser, you should new see the JBrowse UI and a
sequence track, which will show you the DNA base pairs if you zoom in
far enough.

#### <span id="Load_Feature_Data" class="mw-headline">Load Feature Data</span>

Next, we'll use `biodb-to-json.pl` to get feature data out of the
database and turn it into [JSON](Glossary#JSON "Glossary") data that the
web browser can use.

In this case, we have specified all of our track configurations in
`pythium-1.conf`.

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="javascript source-javascript">

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

</div>

</div>

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

    bin/biodb-to-json.pl --conf ../pythium-1.conf

Refresh JBrowse in your web browser. You should now see a bunch of
annotation tracks.

#### <span id="Index_feature_names" class="mw-headline">Index feature names</span>

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

### <span id="Features_from_GFF3_or_BED_files" class="mw-headline">Features from GFF3 or BED files</span>

We're going to add a couple more tracks that come from a flat file,
`repeats.gff`. To get feature data from flat files into JBrowse, we use
`flatfile-to-json.pl`.

- We'll add a RepeatMasker track:

<!-- -->

    bin/flatfile-to-json.pl --trackLabel "repeat masker" \
        --trackType CanvasFeatures \
        --type match:repeatmasker --key RepeatMasker \
        --className generic_parent \
        --subfeatureClasses '{"match_part" : "feature"}' --gff ../repeats.gff

- And then a RepeatRunner track:

<!-- -->

    bin/flatfile-to-json.pl --trackLabel "repeat runner" \
        --trackType CanvasFeatures \
        --type protein_match:repeatrunner \
        --key RepeatRunner --className generic_parent \
        --subfeatureClasses '{"match_part" : "feature"}' --gff ../repeats.gff

Visit in web browser; you should see the two new RepeatMasker and
RepeatRunner tracks.

### <span id="BAM_alignments" class="mw-headline">BAM alignments</span>

JBrowse can display alignments directly from a BAM file on your web
server. Simply place the BAM file in a directory accessible to your web
server, and add a snippet of configuration to JBrowse to add the track,
similar to:

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="javascript source-javascript">

``` de1
     {
        "label" : "bam_alignments",
        "key" : "BAM alignments",
        "storeClass" : "JBrowse/Store/SeqFeature/BAM",
        "urlTemplate" : "../../simulated-sorted.bam",
        "type" : "Alignments2"
      }
```

</div>

</div>

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

### <span id="BAM_coverage" class="mw-headline">BAM coverage</span>

This time we'll use a text editor and will edit the track configuration
file directly. Type

      gedit data/trackList.json

and insert the text below in the "tracks" array (the easiest thing to do
is find the "\[" after "tracks", paste there and then add a comma after
the "}").

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="javascript source-javascript">

``` de1
     {
        "label" : "bam_coverage",
        "key" : "BAM Coverage",
        "storeClass" : "JBrowse/Store/SeqFeature/BAM",
        "urlTemplate" : "../../simulated-sorted.bam",
        "type" : "SNPCoverage"
      }
```

</div>

</div>

and then press the Save button.

### <span id="Quantitative_data" class="mw-headline">Quantitative data</span>

#### <span id="BigWig" class="mw-headline">BigWig</span>

JBrowse can display quantitative data directly from a BigWig file on
your web server. Simply place the BigWig file in a directory accessible
to your web server, and add a snippet of configuration to JBrowse to add
the track, similar to:

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="javascript source-javascript">

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

</div>

</div>

This can be added by either editing the `data/trackList.json` file with
a text editor, or by running something like this at the command line to
inject the track configuration:

    echo ' {
           "label" : "bigwig_bam_coverage",
           "key" : "BigWig - BAM coverage",
           "storeClass" : "BigWig",
           "urlTemplate" : "../../simulated-sorted.bam.coverage.bw",
           "type" : "JBrowse/View/Track/Wiggle/XYPlot",
           "variance_band" : true
         } ' | bin/add-track-json.pl data/trackList.json

### <span id="Variation_Data" class="mw-headline">Variation Data</span>

#### <span id="VCF_tracks" class="mw-headline">VCF tracks</span>

JBrowse can also display VCF variation data directly from a VCF file on
your web server that has been compressed with Heng Li's bgzip and tabix.
Simply place the .vcf.gz and .vcf.gz.tbi files in a directory accessible
to your web server, and add a snippet of configuration to JBrowse to add
the track, similar to:

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="javascript source-javascript">

``` de1
      {
        "label" : "bam_variation",
        "key" : "VCF simulated variation",
        "storeClass" : "JBrowse/Store/SeqFeature/VCFTabix",
        "urlTemplate" : "../../simulated-sorted.vcf.gz",
        "type" : "HTMLVariants"
      }
```

</div>

</div>

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

  

### <span id="Faceted_Track_Selection" class="mw-headline">Faceted Track Selection</span>

JBrowse has a very powerful faceted track selector that can be used to
search for tracks using metadata associated with them.

The track metadata is kept in a CSV-format file, with any number of
columns, and with a "label" column whose contents must correspond to the
track labels in the JBrowse configuration.

The demo bundle contains an example `trackMetadata.csv` file, which can
be copied into the `data` directory for use with this configuration.

    cp ../trackMetadata.csv data/

Then a simple faceted track selection configuration might look like:

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="javascript source-javascript">

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

</div>

</div>

Copy the section above and put it in the empty curly braces in the
`jbrowse_conf.json` file in the `jbrowse`, save it, refresh your
browser, and you should now see the faceted track selector activated.

## <span id="Changing_the_way_tracks_look" class="mw-headline">Changing the way tracks look</span>

Tracks can be modified by changing several aspects of how the images are
created. While this can be done be done both with HTML and Canvas
tracks, this tutorial will focus on Canvas tracks only (the repeat
tracks created above).

The configuration for the RepeatMasker track looks like this:

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="javascript source-javascript">

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

</div>

</div>

Open the `data/trackList.json` file in your favorite editor and
Control-F will open a "find" window; search for "repeatmasker". A simple
change we can make is to the color; in the line starting with "style",
add:

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="javascript source-javascript">

``` de1
  "color" : "black",
```

</div>

</div>

save the changes and select the RepeatMasker track or reload the browser
to see the change. Many attributes of the display can be modified in
this way, see the [JBrowse Configuration
Guide](JBrowse_Configuration_Guide#CanvasFeatures_Configuration_Options "JBrowse Configuration Guide")
for a list of options.

### <span id="Making_changes_based_on_the_data" class="mw-headline">Making changes based on the data</span>

Much like GBrowse's perl callbacks that can change the track display, in
the JBrowse configuration file you can include JavaScript functions to
change the way tracks look. For example, in the RepeatMasker track, we
can change the color of the glyph depending on what kind of repeat it is
(where we happen to know that the type of repeat is encoded in the
name). In this example, we leave the glyph black, unless it is a low
complexity repeat, where we'll color it red. A function to do that would
look like this:

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="javascript source-javascript">

``` de1
  "color" : "function(feature) { var name = feature.get('Name'); if (name.match('Low_complexity') ) { return 'red'; } return 'black';  }",
```

</div>

</div>

When editing the trackList.json file directly in this way, the function
has to go all on one line, but if we create an "include file" (not
covered here) the function can have carriage returns in it. Replace the
simple "color : black" section we just created in the configuration file
with the function above, save the file and reload the browser page to
see the changes (you might have to mouse around to find a low complexity
repeat).

### <span id="Making_links_open_something_else" class="mw-headline">Making links open something else</span>

The default action when you click on a glyph is to open a "floating"
window that displays everything JBrowse knows about a feature. If you'd
like something else to happen, you have several options ([outlined
here](JBrowse_Configuration_Guide#Click_Configuration_Options "JBrowse Configuration Guide")),
including having a different floating window open or executing any
JavaScript function you define. For this example, we'll create a link
that will Google the repeat's name and open the result in a new window.
In the RepeatMasker section of the JBrowse configuration, we'll add a
section that looks like this after the style section:

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="javascript source-javascript">

``` de1
        "onClick" : {
           "iconClass" : "dijitIconDatabase",
           "action" : "newWindow",
           "url" : "http://www.google.com/search?q={name}",
           "label" : "Search for {name} at Google",
           "title" : "function(track,feature,div) { return 'Searching for '+feature.get('name')+' at Google'; }"
        },
```

</div>

</div>

If you're having difficulties, the RepeatMasker section of the
configuration file should now look something like this:

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="javascript source-javascript">

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

</div>

</div>

## <span id="Using_Plugins" class="mw-headline">Using Plugins</span>

JBrowse is built with a very flexible and powerful plugin system. The
JBrowse developers are working on a plugin registry website, but for the
time being, you can look at the source code for what will drive the
website in the <a
href="https://www.google.com/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=1&amp;ved=0ahUKEwjyssGCz7fPAhUK2IMKHfcODEkQFggeMAA&amp;url=https%3A%2F%2Fgithub.com%2FGMOD%2Fjbrowse-registry&amp;usg=AFQjCNEZ9oH5eRRhbZtDcN-W78HcFuAxZw&amp;sig2=J5pff9m409Qv0eQ5Hnli8g"
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
and see the wonder of the psuedo-3D gene glyphs.

Note that not all plugins are activated this way: typically, if the
plugin modifies the way tracks look, it will go here. If it modifies the
way JBrowse \*works\*, it will go in the `jbrowse.conf` file.

## <span id="JBrowse_Features" class="mw-headline">JBrowse Features</span>

### <span id="Highlighting_interesting_things" class="mw-headline">Highlighting interesting things</span>

To highlight a region, you can either right-click on a feature and
select 'highlight this', or you can set the highlight explicitly to a
certain genomic region by clicking "View -\> Set highlight" in the menu
bar.

Beginning in JBrowse 1.10.0 you can also highlight a region with the
mouse by clicking the highlighter tool (next to the Go button) and
clicking and dragging to highlight a region.

### <span id="Opening_local_files" class="mw-headline">Opening local files</span>

JBrowse can display GFF3, BAM, BigWig, and VCF+Tabix files directly from
your local machine without the need to transfer any data to the server.
Just use the "File -\> Open" tool from the menu bar to add tracks using
local files.

### <span id="Combination_tracks" class="mw-headline">Combination tracks</span>

Starting in version 1.10.0, users can define tracks that are
combinations of the data in other tracks. The operations used to combine
these tracks can be set operations (union, intersection, subtraction),
arithmetic operations for quantitative tracks (addition, subtraction,
multiplication, division), and/or masking operations to just highlight
or mask some regions based on data in another track.

To add a combination track, select "File-\>Add combination track" from
the menu bar, and drag existing tracks into the new combination track to
start combining them.

## <span id="Upgrading_an_Existing_JBrowse" class="mw-headline">Upgrading an Existing JBrowse</span>

If the old JBrowse is 1.3.0 or later, simply move the data directory
from the old JBrowse directory into the new JBrowse directory after
running the `setup.sh` script.

## <span id="Common_Problems" class="mw-headline">Common Problems</span>

- JSON syntax errors in configuration files (2.x series will stop this
  madness!)

## <span id="Other_links" class="mw-headline">Other links</span>

- Config file ref: [JBrowse Configuration
  Guide](JBrowse_Configuration_Guide "JBrowse Configuration Guide")
- DIV test: <a href="http://jbrowse.org/test/boatdiv/boat.html"
  class="external free"
  rel="nofollow">http://jbrowse.org/test/boatdiv/boat.html</a>

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=JBrowse_Tutorial_PAG_2017&oldid=27334>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Category](Special:Categories "Special:Categories"):

- <a
  href="http://gmod.org/mediawiki/index.php?title=Category:Tutorial&amp;action=edit&amp;redlink=1"
  class="new" title="Category:Tutorial (page does not exist)">Tutorial</a>

</div>

</div>

<div id="mw-data-after-content">

<div class="smwfact">

<span class="smwfactboxhead">Facts about
"<span class="swmfactboxheadbrowse">[JBrowse Tutorial PAG
2017](Special:Browse/JBrowse-20Tutorial-20PAG-202017 "Special:Browse/JBrowse-20Tutorial-20PAG-202017")</span>"</span><span class="smwrdflink"><span class="rdflink">[RDF
feed](http://gmod.org/wiki/Special:ExportRDF/JBrowse_Tutorial_PAG_2017 "Special:ExportRDF/JBrowse Tutorial PAG 2017")</span></span>

|  |  |
|----|----|
| [Has topic](Property:Has_topic "Property:Has topic") | [JBrowse](JBrowse.1 "JBrowse") <span class="smwsearch">[+](Special:SearchByProperty/Has-20topic/JBrowse "Special:SearchByProperty/Has-20topic/JBrowse")</span> |

</div>

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">



<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces

- <span id="ca-nstab-main"><a href="JBrowse_Tutorial_PAG_2017" accesskey="c"
  title="View the content page [c]">Page</a></span>
- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:JBrowse_Tutorial_PAG_2017&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>

<div id="right-navigation">

<div id="p-views" class="vectorTabs" role="navigation"
aria-labelledby="p-views-label">

### Views

- <span id="ca-view">[Read](JBrowse_Tutorial_PAG_2017)</span>
- <span id="ca-viewsource"><a
  href="http://gmod.org/mediawiki/index.php?title=JBrowse_Tutorial_PAG_2017&amp;action=edit"
  accesskey="e" title="This page is protected.
  You can view its source [e]">View source</a></span>
- <span id="ca-history"><a
  href="http://gmod.org/mediawiki/index.php?title=JBrowse_Tutorial_PAG_2017&amp;action=history"
  accesskey="h" title="Past revisions of this page [h]">View history</a></span>

</div>

<div id="p-cactions" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-cactions-label">

### Actions[](#)

<div class="menu">

</div>

</div>

<div id="p-search" role="search">

### Search

<div id="simpleSearch">

</div>

</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>
- <span id="n-View-all-pages">[View all pages](Special:AllPages)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category:FAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category:HOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">

- <span id="t-whatlinkshere"><a href="Special:WhatLinksHere/JBrowse_Tutorial_PAG_2017" accesskey="j"
  title="A list of all wiki pages that link here [j]">What links here</a></span>
- <span id="t-recentchangeslinked"><a href="Special:RecentChangesLinked/JBrowse_Tutorial_PAG_2017"
  accesskey="k"
  title="Recent changes in pages linked from this page [k]">Related
  changes</a></span>
- <span id="t-specialpages"><a href="Special:SpecialPages" accesskey="q"
  title="A list of all special pages [q]">Special pages</a></span>
- <span id="t-print"><a
  href="http://gmod.org/mediawiki/index.php?title=JBrowse_Tutorial_PAG_2017&amp;printable=yes"
  rel="alternate" accesskey="p"
  title="Printable version of this page [p]">Printable version</a></span>
- <span id="t-permalink">[Permanent
  link](http://gmod.org/mediawiki/index.php?title=JBrowse_Tutorial_PAG_2017&oldid=27334 "Permanent link to this revision of the page")</span>
- <span id="t-info">[Page
  information](http://gmod.org/mediawiki/index.php?title=JBrowse_Tutorial_PAG_2017&action=info)</span>
- <span id="t-smwbrowselink"><a href="Special:Browse/JBrowse_Tutorial_PAG_2017"
  rel="smw-browse">Browse properties</a></span>
- <span id="t-pdf">[Print as
  PDF](http://gmod.org/mediawiki/index.php?title=Special:PdfPrint&page=JBrowse_Tutorial_PAG_2017)</span>

</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 19:38 on 15 January
  2017.</span>
- <span id="footer-info-viewcount">25,578 page views.</span>
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->

- <span id="footer-copyrightico">[<img src="http://www.gnu.org/graphics/gfdl-logo-small.png" width="88"
  height="31" alt="a GNU Free Documentation License" />](http://www.gnu.org/licenses/fdl-1.3.html)</span>
- <span id="footer-poweredbyico">[<img
  src="../mediawiki/skins/common/images/poweredby_mediawiki_88x31.png"
  width="88" height="31" alt="Powered by MediaWiki" />](http://www.mediawiki.org/)
  [<img
  src="../mediawiki/extensions/SemanticMediaWiki/resources/images/smw_button.png"
  width="88" height="31" alt="Powered by Semantic MediaWiki" />](https://www.semantic-mediawiki.org/wiki/Semantic_MediaWiki)</span>

<div style="clear:both">

</div>

</div>

---
title: "GMOD Online Training 2014/JBrowse Tutorial"
---




<span id="top"></span>




# <span dir="auto">GMOD Online Training 2014/JBrowse Tutorial</span>










## Contents



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
  - [<span class="tocnumber">3.4</span> <span class="toctext">Features
    from a directory of
    files</span>](#Features_from_a_directory_of_files)
    - [<span class="tocnumber">3.4.1</span>
      <span class="toctext">Specify reference
      sequences</span>](#Specify_reference_sequences)
    - [<span class="tocnumber">3.4.2</span> <span class="toctext">Load
      Feature Data</span>](#Load_Feature_Data)
    - [<span class="tocnumber">3.4.3</span> <span class="toctext">Index
      feature names</span>](#Index_feature_names)
  - [<span class="tocnumber">3.5</span> <span class="toctext">Features
    from GFF3 or BED files</span>](#Features_from_GFF3_or_BED_files)
  - [<span class="tocnumber">3.6</span> <span class="toctext">BAM
    alignments</span>](#BAM_alignments)
  - [<span class="tocnumber">3.7</span> <span class="toctext">BAM
    coverage</span>](#BAM_coverage)
  - [<span class="tocnumber">3.8</span>
    <span class="toctext">Quantitative data</span>](#Quantitative_data)
    - [<span class="tocnumber">3.8.1</span>
      <span class="toctext">BigWig</span>](#BigWig)
  - [<span class="tocnumber">3.9</span> <span class="toctext">Variation
    Data</span>](#Variation_Data)
    - [<span class="tocnumber">3.9.1</span> <span class="toctext">VCF
      tracks</span>](#VCF_tracks)
  - [<span class="tocnumber">3.10</span> <span class="toctext">Faceted
    Track Selection</span>](#Faceted_Track_Selection)
- [<span class="tocnumber">4</span> <span class="toctext">JBrowse
  Features</span>](#JBrowse_Features)
  - [<span class="tocnumber">4.1</span>
    <span class="toctext">Highlighting interesting
    things</span>](#Highlighting_interesting_things)
  - [<span class="tocnumber">4.2</span> <span class="toctext">Opening
    local files</span>](#Opening_local_files)
  - [<span class="tocnumber">4.3</span>
    <span class="toctext">Combination tracks (coming in
    1.10.0)</span>](#Combination_tracks_.28coming_in_1.10.0.29)
- [<span class="tocnumber">5</span> <span class="toctext">Upgrading an
  Existing JBrowse</span>](#Upgrading_an_Existing_JBrowse)
- [<span class="tocnumber">6</span> <span class="toctext">Common
  Problems</span>](#Common_Problems)
- [<span class="tocnumber">7</span> <span class="toctext">Future JBrowse
  Plans</span>](#Future_JBrowse_Plans)
- [<span class="tocnumber">8</span> <span class="toctext">Other
  links</span>](#Other_links)



## <span id="Prerequisites" class="mw-headline">Prerequisites</span>

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

## <span id="JBrowse_Introduction" class="mw-headline">JBrowse Introduction</span>

How and why [JBrowse](../JBrowse.1 "JBrowse") is different from most
other web-based genome browsers, including
[GBrowse](../GBrowse.1 "GBrowse").

More detail: <a href="http://genome.cshlp.org/content/19/9/1630.full"
class="external text" rel="nofollow">paper</a>

<a
href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/90/JBrowse_gmod_summerschool_jul2013.pdf"
class="internal" title="JBrowse gmod summerschool jul2013.pdf">JBrowse
presentation</a>

## <span id="Setting_up_JBrowse" class="mw-headline">Setting up JBrowse</span>

### <span id="Getting_JBrowse" class="mw-headline">Getting JBrowse</span>

- prepare a directory for JBrowse

<!-- -->

    cd /var/www
    sudo mkdir jbrowse_demo
    sudo chown ubuntu.ubuntu jbrowse_demo
    cd jbrowse_demo

- download the demo bundle from jbrowse.org and unzip it

<!-- -->

    wget https://s3.amazonaws.com/gmod-online-2014/GMOD_Summer_School_2014_JBrowse.tar.gz
    tar zxvf GMOD_Summer_School_2014_JBrowse.tar.gz
    cd GMOD_Summer_School_2014_JBrowse/
    unzip JBrowse-1.11.4.zip
    mv JBrowse-1.11.4 jbrowse

- run `setup.sh` to configure this copy of JBrowse

<!-- -->

    cd jbrowse
    ./setup.sh

### <span id="Starting_Point" class="mw-headline">Starting Point</span>

Visit in web browser:

http://ec2-##-##-##-##.compute-1.amazonaws.com/jbrowse_demo/GMOD_Summer_School_2014_JBrowse/jbrowse/index.html

You should see a "Congratulations" page.

### <span id="Basic_Steps" class="mw-headline">Basic Steps</span>

There are four basic steps to setting up an instance of JBrowse:

1.  Load and format reference sequences
2.  Format data for tracks
3.  Configure direct-access tracks
4.  Index feature names

  

### <span id="Features_from_a_directory_of_files" class="mw-headline">Features from a directory of files</span>

Here, we'll use the
<a href="http://search.cpan.org/perldoc?Bio::DB::SeqFeature::Store"
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a>
adaptor in "memory" mode to read a directory of files. There are
adaptors available for use with many other databases, such as
<a href="../Chado" class="mw-redirect" title="Chado">Chado</a> and
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

#### <span id="Specify_reference_sequences" class="mw-headline">Specify reference sequences</span>

The first script to run is `bin/prepare-refseqs.pl`; that script is the
way you tell JBrowse about what your reference sequences are. Running
`bin/prepare-refseqs.pl` also sets up the "DNA" track.

Run this from within the `jbrowse` directory (you could run it
elsewhere, but you'd have to explicitly specify the location of the data
directory on the command line).

    cd /var/www/jbrowse_demo/GMOD_Summer_School_2014_JBrowse/jbrowse
    bin/prepare-refseqs.pl --gff ../scf1117875582023.gff

Refresh it in your web browser, you should new see the JBrowse UI and a
sequence track, which will show you the DNA base pairs if you zoom in
far enough.

#### <span id="Load_Feature_Data" class="mw-headline">Load Feature Data</span>

Next, we'll use `biodb-to-json.pl` to get feature data out of the
database and turn it into [JSON](../Glossary#JSON "Glossary") data that
the web browser can use.

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

`class` specifies the [CSS](../Glossary#CSS "Glossary") class that
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

    bin/flatfile-to-json.pl --trackLabel repeatmasker \
        --type match:repeatmasker --key RepeatMasker \
        --className generic_parent \
        --subfeatureClasses '{"match_part" : "feature"}' --gff ../repeats.gff

- And then a RepeatRunner track:

<!-- -->

    bin/flatfile-to-json.pl --trackLabel repeatrunner \
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

### <span id="BAM_coverage" class="mw-headline">BAM coverage</span>


``` de1
     {
        "label" : "bam_coverage",
        "key" : "BAM Coverage",
        "storeClass" : "JBrowse/Store/SeqFeature/BAM",
        "urlTemplate" : "../../simulated-sorted.bam",
        "type" : "SNPCoverage"
      }
```


### <span id="Quantitative_data" class="mw-headline">Quantitative data</span>

#### <span id="BigWig" class="mw-headline">BigWig</span>

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

### <span id="Variation_Data" class="mw-headline">Variation Data</span>

#### <span id="VCF_tracks" class="mw-headline">VCF tracks</span>

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

  

### <span id="Faceted_Track_Selection" class="mw-headline">Faceted Track Selection</span>

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

### <span id="Combination_tracks_.28coming_in_1.10.0.29" class="mw-headline">Combination tracks (coming in 1.10.0)</span>

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
from the old JBrowse directory into the new JBrowse directory.

## <span id="Common_Problems" class="mw-headline">Common Problems</span>

- JSON syntax errors in configuration files (2.x series will stop this
  madness!)

## <span id="Future_JBrowse_Plans" class="mw-headline">Future JBrowse Plans</span>

See the <a
href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/90/JBrowse_gmod_summerschool_jul2013.pdf"
class="internal"
title="JBrowse gmod summerschool jul2013.pdf">accompanying slides
(PDF)</a>

## <span id="Other_links" class="mw-headline">Other links</span>

- Config file ref:
  <a href="http://jbrowse.org/code/jbrowse-master/docs/config.html"
  class="external free"
  rel="nofollow">http://jbrowse.org/code/jbrowse-master/docs/config.html</a>
- DIV test: <a href="http://jbrowse.org/test/boatdiv/boat.html"
  class="external free"
  rel="nofollow">http://jbrowse.org/test/boatdiv/boat.html</a>








## Navigation menu







<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>


### Navigation



- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>




### Documentation



- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/GMOD_Online_Training_2014-2FJBrowse_Tutorial"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 14:21 on 21 May
  2014.</span>
<!-- - <span id="footer-info-viewcount">12,274 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





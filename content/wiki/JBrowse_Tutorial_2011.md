---
title: "JBrowse Tutorial 2011"
---




<span id="top"></span>




# <span dir="auto">JBrowse Tutorial 2011</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Prerequisites</span>](#Prerequisites)
- [<span class="tocnumber">2</span> <span class="toctext">JBrowse
  Introduction</span>](#JBrowse_Introduction)
- [<span class="tocnumber">3</span> <span class="toctext">JBrowse
  arch</span>](#JBrowse_arch)
- [<span class="tocnumber">4</span> <span class="toctext">Setting up
  JBrowse</span>](#Setting_up_JBrowse)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Getting
    JBrowse</span>](#Getting_JBrowse)
  - [<span class="tocnumber">4.2</span> <span class="toctext">Starting
    Point</span>](#Starting_Point)
  - [<span class="tocnumber">4.3</span> <span class="toctext">Basic
    Steps</span>](#Basic_Steps)
  - [<span class="tocnumber">4.4</span> <span class="toctext">Data from
    a database</span>](#Data_from_a_database)
    - [<span class="tocnumber">4.4.1</span>
      <span class="toctext">Specify reference
      sequences</span>](#Specify_reference_sequences)
    - [<span class="tocnumber">4.4.2</span> <span class="toctext">Load
      Feature Data</span>](#Load_Feature_Data)
    - [<span class="tocnumber">4.4.3</span> <span class="toctext">More
      complex track</span>](#More_complex_track)
    - [<span class="tocnumber">4.4.4</span>
      <span class="toctext">Collect feature
      names</span>](#Collect_feature_names)
  - [<span class="tocnumber">4.5</span> <span class="toctext">Data from
    flat files</span>](#Data_from_flat_files)
    - [<span class="tocnumber">4.5.1</span>
      <span class="toctext">Sequences</span>](#Sequences)
    - [<span class="tocnumber">4.5.2</span>
      <span class="toctext">Features</span>](#Features)
    - [<span class="tocnumber">4.5.3</span> <span class="toctext">BAM
      data</span>](#BAM_data)
  - [<span class="tocnumber">4.6</span>
    <span class="toctext">Quantitative data</span>](#Quantitative_data)
- [<span class="tocnumber">5</span> <span class="toctext">Common
  Problems</span>](#Common_Problems)
- [<span class="tocnumber">6</span> <span class="toctext">Other
  links</span>](#Other_links)



## <span id="Prerequisites" class="mw-headline">Prerequisites</span>

These have **already been set up** on the VM image.

Perl:

- [BioPerl 1.6](BioPerl "BioPerl")
 data
that the web browser can use.

Add a basic track definition; this will tell `biodb-to-json.pl` what
features to put into the track, and how the track should look:

\<javascript\>...

     "TRACK DEFAULTS": {
       "class": "feature"
     },

     "tracks": [
       {
         "track": "gene",
         "key": "Gene",
         "feature": ["gene"],
         "autocomplete": "all",
         "class": "feature2",
         "urlTemplate": "http://www.google.com/search?q={name}"
       }
     ]

}\</javascript\>

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

`class` specifies the CSS class
that describes how the feature should look. The classes are specified in
the `genome.css` file:

    $ less genome.css

For this particular track, I've specified the `"feature2"` class which
looks like this in the CSS file:

\<javascript\>.plus-feature2, .minus-feature2 {

       position:absolute;
       height: 15px;
       background-repeat: repeat-x;
       cursor: pointer;
       min-width: 1px;
       z-index: 10;

}

.plus-feature2 { background-image: url('img/plus-herringbone16.png'); }

.minus-feature2 { background-image: url('img/minus-herringbone16.png');
}\</javascript\>

Run the `bin/biodb-to-json.pl` script with this config file to set up
this track:

    $ bin/biodb-to-json.pl --conf ~/Documents/Data/jbrowse/first-config.json

(visit in web browser: you should see a new gene track)

#### <span id="More_complex_track" class="mw-headline">More complex track</span>

Now we'll add a second track; this one will have subfeatures. This
snippet is from: `~/Documents/Data/jbrowse/second-config.json`

\<javascript\>...

       {
         "track": "match",
         "key": "Matches",
         "feature": ["match"],
         "autocomplete": "all",
         "subfeatures": true,
         "class": "generic_parent",
         "subfeature_classes": {
             "match_part": "match_part"
         },
         "clientConfig": {
             "subfeatureScale": 20
         }
       }

...\</javascript\>

    $ bin/biodb-to-json.pl --conf ~/Documents/Data/jbrowse/second-config.json

(visit in web browser: you should see a new track, which has subfeatures
if you're zoomed in far enough)

#### <span id="Collect_feature_names" class="mw-headline">Collect feature names</span>

When you generate JSON for a track, if you specify `"autocomplete"` then
a listing of all of the names/IDs from that track (along with the
locations of the corresponding features) will also be generated.

The `bin/generate-names.pl` script collects those lists of names from
all the tracks and combines them into one big tree that the client uses
to search.

    $ bin/generate-names.pl -v

Visit in web browser, search for feature name: e.g.,

**maker-scf1117875582023-snap-gene-0.3**

### <span id="Data_from_flat_files" class="mw-headline">Data from flat files</span>

We're going to recreate a JBrowse instance from a different data source:
flat files.

First, wipe the slate clean by removing the `data` directory:

    $ rm -r data

If you visit your JBrowse instance in a web browser, you'll see a blank
screen again

#### <span id="Sequences" class="mw-headline">Sequences</span>

To import sequence data from a fasta file into a JBrowse instance, use
`prepare-refseqs.pl` with the `--fasta` argument:

    $ bin/prepare-refseqs.pl --fasta ~/Documents/Data/jbrowse/scf1117875582023.fasta

Visit in web browser; you should see a second reference sequence.

#### <span id="Features" class="mw-headline">Features</span>

To get feature data from flat files into JBrowse, use
`flatfile-to-json.pl`. We'll use some more of the data from the
[MAKER](MAKER.1 "MAKER") session:

    $ bin/flatfile-to-json.pl \
        --gff /home/gmod/Documents/Data/maker/example2_pyu/finished.maker.output/gff/scf1117875582023.gff \
        --type match --getSubs --tracklabel "gff_match" --key "GFF match" \
        --cssclass generic_parent --subfeatureClasses '{"match_part": "generic_part_a"}'

Visit in web browser; you should see a new "GFF match" track.

#### <span id="BAM_data" class="mw-headline">BAM data</span>

To incorporate data from a BAM source:

    $  bin/bam-to-json.pl \
        --bam ~/Documents/Data/jbrowse/simulated-sorted.bam \
        --tracklabel BAM_data --key "BAM Data"

### <span id="Quantitative_data" class="mw-headline">Quantitative data</span>

JBrowse can also display quantitative data in the wiggle format. JBrowse
processes wiggle files with a C++ program, which you have to compile:

    $ make

Now you can process the wiggle file:

    $ bin/wig-to-json.pl --wig ~/Documents/Data/jbrowse/pyu.wig \
        --tracklabel "coverage_wig" --key "Wiggle Coverage" --min 0 --max 50

Visit in web browser

  
  

## <span id="Common_Problems" class="mw-headline">Common Problems</span>

- JSON syntax errors

  
  
  

## <span id="Other_links" class="mw-headline">Other links</span>

- Config file ref:
  <a href="http://jbrowse.org/code/jbrowse-master/docs/config.html"
  class="external free"
  rel="nofollow">http://jbrowse.org/code/jbrowse-master/docs/config.html</a>
- DIV test: <a href="http://jbrowse.org/test/boatdiv/boat.html"
  class="external free"
  rel="nofollow">http://jbrowse.org/test/boatdiv/boat.html</a>




[Categories](Special%253ACategories "Special%253ACategories"):

- [2011 Spring
  Training](Category%253A2011_Spring_Training "Category%253A2011 Spring Training")
- [Tutorials](Category%253ATutorials "Category%253ATutorials")
- [JBrowse](Category%253AJBrowse "Category%253AJBrowse")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/JBrowse_Tutorial_2011" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 17:58 on 14 February
  2013.</span>
<!-- - <span id="footer-info-viewcount">7,546 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





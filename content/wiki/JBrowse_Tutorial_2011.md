---
title: "JBrowse Tutorial 2011"
---
# JBrowse Tutorial 2011

  Prerequisites](#Prerequisites)
- [JBrowse
  Introduction](#JBrowse_Introduction)
- [JBrowse
  arch](#JBrowse_arch)
- [Setting up
  JBrowse](#Setting_up_JBrowse)
  - [Getting
    JBrowse](#Getting_JBrowse)
  - [Starting
    Point](#Starting_Point)
  - [Basic
    Steps](#Basic_Steps)
  - [Data from
    a database](#Data_from_a_database)
    - [Specify reference
      sequences](#Specify_reference_sequences)
    - [Load
      Feature Data](#Load_Feature_Data)
    - [More
      complex track](#More_complex_track)
    - [Collect feature
      names](#Collect_feature_names)
  - [Data from
    flat files](#Data_from_flat_files)
    - [Sequences](#Sequences)
    - [Features](#Features)
    - [BAM
      data](#BAM_data)
  - [Quantitative data](#Quantitative_data)
- [Common
  Problems](#Common_Problems)
- [Other
  links](#Other_links)

## Prerequisites

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

#### More complex track

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

#### Collect feature names

When you generate JSON for a track, if you specify `"autocomplete"` then
a listing of all of the names/IDs from that track (along with the
locations of the corresponding features) will also be generated.

The `bin/generate-names.pl` script collects those lists of names from
all the tracks and combines them into one big tree that the client uses
to search.

    $ bin/generate-names.pl -v

Visit in web browser, search for feature name: e.g.,

**maker-scf1117875582023-snap-gene-0.3**

### Data from flat files

We're going to recreate a JBrowse instance from a different data source:
flat files.

First, wipe the slate clean by removing the `data` directory:

    $ rm -r data

If you visit your JBrowse instance in a web browser, you'll see a blank
screen again

#### Sequences

To import sequence data from a fasta file into a JBrowse instance, use
`prepare-refseqs.pl` with the `--fasta` argument:

    $ bin/prepare-refseqs.pl --fasta ~/Documents/Data/jbrowse/scf1117875582023.fasta

Visit in web browser; you should see a second reference sequence.

#### Features

To get feature data from flat files into JBrowse, use
`flatfile-to-json.pl`. We'll use some more of the data from the
[MAKER](MAKER.1 "MAKER") session:

    $ bin/flatfile-to-json.pl \
        --gff /home/gmod/Documents/Data/maker/example2_pyu/finished.maker.output/gff/scf1117875582023.gff \
        --type match --getSubs --tracklabel "gff_match" --key "GFF match" \
        --cssclass generic_parent --subfeatureClasses '{"match_part": "generic_part_a"}'

Visit in web browser; you should see a new "GFF match" track.

#### BAM data

To incorporate data from a BAM source:

    $  bin/bam-to-json.pl \
        --bam ~/Documents/Data/jbrowse/simulated-sorted.bam \
        --tracklabel BAM_data --key "BAM Data"

### Quantitative data

JBrowse can also display quantitative data in the wiggle format. JBrowse
processes wiggle files with a C++ program, which you have to compile:

    $ make

Now you can process the wiggle file:

    $ bin/wig-to-json.pl --wig ~/Documents/Data/jbrowse/pyu.wig \
        --tracklabel "coverage_wig" --key "Wiggle Coverage" --min 0 --max 50

Visit in web browser




## Common Problems

- JSON syntax errors





## Other links

- Config file ref:
  <a href="http://jbrowse.org/code/jbrowse-master/docs/config.html"
  class="external free"
  rel="nofollow">http://jbrowse.org/code/jbrowse-master/docs/config.html</a>
- DIV test: <a href="http://jbrowse.org/test/boatdiv/boat.html"
  class="external free"
  rel="nofollow">http://jbrowse.org/test/boatdiv/boat.html</a>

---
title: "JBrowse Tutorial 2010"
---
# JBrowse Tutorial 2010

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/ac/JBrowseLogo.png/250px-JBrowseLogo.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/ac/JBrowseLogo.png/375px-JBrowseLogo.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/ac/JBrowseLogo.png/500px-JBrowseLogo.png 2x"
width="250" height="55" alt="JBrowse" />

This [JBrowse](/wiki/JBrowse.1) tutorial was presented by [Mitch
Skinner](/wiki/User%3AMitchSkinner) at the [2010 GMOD Summer
School -
Americas](/wiki/2010_GMOD_Summer_School_-_Americas),
May 2010. The most recent JBrowse tutorial can be found at the
<a href="/wiki/JBrowse_Tutorial" class="mw-redirect"
title="JBrowse Tutorial">JBrowse Tutorial</a> page.

This [tutorial](/wiki/Category%3ATutorials) walks you
through setting up and running a [JBrowse](/wiki/JBrowse.1) server.

  VMware](#VMware)
- [Caveats](#Caveats)
- [Prerequisites](#Prerequisites)
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
- [See
  also](#See_also)
- [Other
  links](#Other_links)

## VMware

This tutorial was taught using a VMware system image
as a starting point. If you want to start with the same system, download
and install the start image (below). See VMware for what
software you need to use a VMware system image and for directions on how
to get the image up and running on your machine.

Download the \[<a href="/wiki/ftp://ftp.gmod.org/pub/gmod/Courses/2010/SummerSchoolAmericas/GMODCourse2010Day1.vmwarevm.tar.gz"
class="external text" rel="nofollow">start image</a> and the <a href="/wiki/ftp://ftp.gmod.org/pub/gmod/Courses/2010/SummerSchoolAmericas/GMODCourse2010Day2.vmwarevm.tar.gz"
class="external text" rel="nofollow">end image</a>.

**Logins**:

| Purpose | Username | Password         | ------- | -------- | ---------------- | Shell   | gmod     | gmodamericas2010 | MySQL   | root     | gmodamericas2010 |

## Caveats

**Important Note**

This [tutorial](/wiki/Category%3ATutorials) describes the
world as it existed on the day the tutorial was given. Please be aware
that things like CPAN modules, Java libraries, and Linux packages change
over time, and that the instructions in the tutorial will slowly drift
over time. Newer versions of tutorials will be posted as they become
available.

## Prerequisites

These have **already been set up** on the VM image.

Perl:

- [BioPerl 1.6](/wiki/BioPerl)
- <a href="http://search.cpan.org/perldoc?JSON" class="external text"
  rel="nofollow">JSON</a>
- <a href="http://search.cpan.org/perldoc?JSON::XS" class="external text"
  rel="nofollow">JSON::XS</a> (optional, for speed)

System packages:

- libpng12-0
- libpng12-dev

Optional, for BAM files:

- samtools, and its dependency libncurses5-dev
- perl module: <a href="http://search.cpan.org/perldoc?Bio::DB::SAM"
  class="external text" rel="nofollow">Bio::DB::SAM</a>

And this is how they were installed: **(don't do this, this has already
been done in the VM)**

```dont
$ sudo apt-get install git-core libpng12-0 libpng12-dev libncurses5-dev
$ cd ~/Documents/Software
$ wget http://sourceforge.net/projects/samtools/files/samtools/0.1.7/samtools-0.1.7a.tar.bz2/download
$ tar xjf samtools-0.1.7a.tar.bz2
$ cd samtools-0.1.7a/
$ make
$ sudo cpan
cpan[1]> install Bio::DB::Das::Chado Bio::DB::Sam JSON JSON::XS
```

Also: make sure you can Copy/paste from wiki.

Shell tricks:

- Tab completion
- History
- History search

## JBrowse Introduction

How and why [JBrowse](/wiki/JBrowse.1) is different from most other
web-based genome browsers, including [GBrowse](/wiki/GBrowse.1).

More detail: <a href="http://genome.cshlp.org/content/19/9/1630.full"
class="external text" rel="nofollow">paper</a>

<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/02/GMODCourse2010-JBrowseIntro.pdf"
class="internal"
title="GMODCourse2010-JBrowseIntro.pdf">Media:GMODCourse2010-JBrowseIntro.pdf</a>

## JBrowse arch

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d0/Jbrowse_arch.png/600px-Jbrowse_arch.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d0/Jbrowse_arch.png/900px-Jbrowse_arch.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d0/Jbrowse_arch.png 2x"
width="600" height="776" alt="Jbrowse arch.png" />

## Setting up JBrowse

### Getting JBrowse

**This has already been done in the VMware image.**

- Git

```dont
$ sudo apt-get install git-core
$ cd /var/www
$ sudo mkdir jbrowse
$ sudo chown gmod.gmod jbrowse
$ git clone http://github.com/jbrowse/jbrowse.git jbrowse
$ cd jbrowse
$ git branch --track lazyfeatures origin/lazyfeatures
$ git checkout lazyfeatures
```

### Starting Point

Visit in web browser:

- if your web browser is in the VM:
  <a href="http://localhost/jbrowse/" class="external free"
  rel="nofollow">http://localhost/jbrowse/</a>
- if your web browser is outside the VM, use your VM's IP address
  instead of "localhost"

You should see just a blank white page.

### Basic Steps

Setting up a JBrowse instance with feature data goes in three basic
steps:

1.  Specify reference sequences
2.  Load feature data
3.  Collect feature names

### Data from a database

Here, we'll use the
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> adapter;
other common database adapters are
<a href="http://search.cpan.org/perldoc?Bio::DB::SeqFeature::Store"
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a> and
<a href="http://search.cpan.org/perldoc?Bio::DB::GFF"
class="external text" rel="nofollow">Bio::DB::GFF</a>.

Starting config file: `~/Documents/Data/jbrowse/first-config.json`

    {
      "description": "Pythium",
      "db_adaptor": "Bio::DB::Das::Chado",
      "db_args": { "-dsn": "dbi:Pg:dbname=chado",
                   "-user": "gmod",
                   "-pass": ""},

    ...

#### Specify reference sequences

The first script to run is `bin/prepare-refseqs.pl`; that script is the
way you tell JBrowse about what your reference sequences are. Running
`bin/prepare-refseqs.pl` also sets up the "DNA" track.

Run this from within the `/var/www/jbrowse` directory (you could run it
elsewhere, but you'd have to explicitly specify the location of the data
directory on the command line).

    $ cd /var/www/jbrowse
    $ bin/prepare-refseqs.pl --conf ~/Documents/Data/jbrowse/first-config.json --refs scf1117875582023

Visit in web browser: you should new see the JBrowse UI (and if you zoom
all the way in, some sequence)

#### Load Feature Data

Next, we'll use `biodb-to-json.pl` to get feature data out of the
database and turn it into JSON data that the
web browser can use.

Add a basic track definition; this will tell `biodb-to-json.pl` what
features to put into the track, and how the track should look:

    ...

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
    }

`"class"` specifies the [CSS](/wiki/Glossary#CSS) class that
describes how the feature should look. The classes are specified in the
`genome.css` file:

    $ less genome.css

For this particular track, I've specified the `"feature2"` class which
looks like this in the CSS file:

    .plus-feature2,
    .minus-feature2 {
        position:absolute;
        height: 15px;
        background-repeat: repeat-x;
        cursor: pointer;
        min-width: 1px;
        z-index: 10;
    }

    .plus-feature2 { background-image: url('img/plus-herringbone16.png'); }

    .minus-feature2 { background-image: url('img/minus-herringbone16.png'); }

Run the `bin/biodb-to-json.pl` script with this config file to set up
this track:

    $ bin/biodb-to-json.pl --conf ~/Documents/Data/jbrowse/first-config.json

(visit in web browser: you should see a new gene track)

#### More complex track

Now we'll add a second track; this one will have subfeatures. This
snippet is from: `~/Documents/Data/jbrowse/second-config.json`

    ...

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

    ...

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

First, remove the `data` directory:

    $ rm -r data

Visit in web browser, see blank screen again

#### Sequences

You can also get data into JBrowse from flat files. For sequence, use
`prepare-refseqs.pl` with the `--fasta` argument:

    $ bin/prepare-refseqs.pl --fasta ~/Documents/Data/jbrowse/scf1117875582023.fasta

Visit in web browser; you should see a second reference sequence.

#### Features

To get feature data from flat files into JBrowse, use
`flatfile-to-json.pl`. We'll use some more of the data from the
<a href="/wiki/MAKER_Tutorial" class="mw-redirect"
title="MAKER Tutorial">MAKER session</a>:

    $ bin/flatfile-to-json.pl \
        --gff /home/gmod/Documents/Data/maker/example2_pyu/finished.maker.output/finished_datastore/scf1117875582023/scf1117875582023.gff \
        --type match --getSubs --tracklabel "gff_match" --key "GFF match" \
        --cssclass generic_parent --subfeatureClasses '{"match_part": "generic_part_a"}'

Visit in web browser; you should see a new "GFF match" track.

#### BAM data

The "lazyfeatures" branch of JBrowse can generate JSON from a BAM
source:

    $ bin/flatfile-to-json.pl \
        --bam ~/Documents/Data/jbrowse/simulated-sorted.bam \
        --cssclass exon --tracklabel BAM_data --key "BAM Data"

### Quantitative data

JBrowse can also display quantitative data in the wiggle format. JBrowse
processes wiggle files with a C++ program, which you have to compile:

    $ make

Now you can process the wiggle file:

    $ bin/wig-to-json.pl --wig ~/Documents/Data/jbrowse/pyu.wig \
        --tracklabel "coverage_wig" --key "Wiggle Coverage" --min 0 --max 50

Visit in web browser

## See also

- Documentation: <a href="/wiki/JBrowseDev/Main" class="mw-redirect"
  title="JBrowseDev/Main">JBrowseDev/Main</a>

## Other links

- Config file ref:
  <a href="http://jbrowse.org/code/jbrowse-master/docs/config.html"
  class="external free"
  rel="nofollow">http://jbrowse.org/code/jbrowse-master/docs/config.html</a>
- Misc images:
  <a href="http://www.getdropbox.com/gallery/580036/1/gmod-eu?h=e103e0"
  class="external free"
  rel="nofollow">http://www.getdropbox.com/gallery/580036/1/gmod-eu?h=e103e0</a>
- DIV test: <a href="http://jbrowse.org/test/boatdiv/boat.html"
  class="external free"
  rel="nofollow">http://jbrowse.org/test/boatdiv/boat.html</a>

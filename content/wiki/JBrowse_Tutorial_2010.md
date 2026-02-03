---
title: "JBrowse Tutorial 2010"
---




<span id="top"></span>


# <span dir="auto">JBrowse Tutorial 2010</span>










<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/ac/JBrowseLogo.png/250px-JBrowseLogo.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/ac/JBrowseLogo.png/375px-JBrowseLogo.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/ac/JBrowseLogo.png/500px-JBrowseLogo.png 2x"
width="250" height="55" alt="JBrowse" />


This [JBrowse](JBrowse.1 "JBrowse") tutorial was presented by [Mitch
Skinner](User%253AMitchSkinner "User%253AMitchSkinner") at the [2010 GMOD Summer
School -
Americas](2010_GMOD_Summer_School_-_Americas "2010 GMOD Summer School - Americas"),
May 2010. The most recent JBrowse tutorial can be found at the
<a href="JBrowse_Tutorial" class="mw-redirect"
title="JBrowse Tutorial">JBrowse Tutorial</a> page.

This [tutorial](Category%253ATutorials "Category%253ATutorials") walks you
through setting up and running a [JBrowse](JBrowse.1 "JBrowse") server.


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">VMware</span>](#VMware)
- [<span class="tocnumber">2</span>
  <span class="toctext">Caveats</span>](#Caveats)
- [<span class="tocnumber">3</span>
  <span class="toctext">Prerequisites</span>](#Prerequisites)
- [<span class="tocnumber">4</span> <span class="toctext">JBrowse
  Introduction</span>](#JBrowse_Introduction)
- [<span class="tocnumber">5</span> <span class="toctext">JBrowse
  arch</span>](#JBrowse_arch)
- [<span class="tocnumber">6</span> <span class="toctext">Setting up
  JBrowse</span>](#Setting_up_JBrowse)
  - [<span class="tocnumber">6.1</span> <span class="toctext">Getting
    JBrowse</span>](#Getting_JBrowse)
  - [<span class="tocnumber">6.2</span> <span class="toctext">Starting
    Point</span>](#Starting_Point)
  - [<span class="tocnumber">6.3</span> <span class="toctext">Basic
    Steps</span>](#Basic_Steps)
  - [<span class="tocnumber">6.4</span> <span class="toctext">Data from
    a database</span>](#Data_from_a_database)
    - [<span class="tocnumber">6.4.1</span>
      <span class="toctext">Specify reference
      sequences</span>](#Specify_reference_sequences)
    - [<span class="tocnumber">6.4.2</span> <span class="toctext">Load
      Feature Data</span>](#Load_Feature_Data)
    - [<span class="tocnumber">6.4.3</span> <span class="toctext">More
      complex track</span>](#More_complex_track)
    - [<span class="tocnumber">6.4.4</span>
      <span class="toctext">Collect feature
      names</span>](#Collect_feature_names)
  - [<span class="tocnumber">6.5</span> <span class="toctext">Data from
    flat files</span>](#Data_from_flat_files)
    - [<span class="tocnumber">6.5.1</span>
      <span class="toctext">Sequences</span>](#Sequences)
    - [<span class="tocnumber">6.5.2</span>
      <span class="toctext">Features</span>](#Features)
    - [<span class="tocnumber">6.5.3</span> <span class="toctext">BAM
      data</span>](#BAM_data)
  - [<span class="tocnumber">6.6</span>
    <span class="toctext">Quantitative data</span>](#Quantitative_data)
- [<span class="tocnumber">7</span> <span class="toctext">See
  also</span>](#See_also)
- [<span class="tocnumber">8</span> <span class="toctext">Other
  links</span>](#Other_links)



## <span id="VMware" class="mw-headline">VMware</span>

This tutorial was taught using a VMware system image
as a starting point. If you want to start with the same system, download
and install the start image (below). See VMware for what
software you need to use a VMware system image and for directions on how
to get the image up and running on your machine.

Download the \[<a
href="ftp://ftp.gmod.org/pub/gmod/Courses/2010/SummerSchoolAmericas/GMODCourse2010Day1.vmwarevm.tar.gz"
class="external text" rel="nofollow">start image</a> and the <a
href="ftp://ftp.gmod.org/pub/gmod/Courses/2010/SummerSchoolAmericas/GMODCourse2010Day2.vmwarevm.tar.gz"
class="external text" rel="nofollow">end image</a>.

**Logins**:

| Purpose | Username | Password         |
| ------- | -------- | ---------------- |
| Shell   | gmod     | gmodamericas2010 |
| MySQL   | root     | gmodamericas2010 |

## <span id="Caveats" class="mw-headline">Caveats</span>



**Important Note**

This [tutorial](Category%253ATutorials "Category%253ATutorials") describes the
world as it existed on the day the tutorial was given. Please be aware
that things like CPAN modules, Java libraries, and Linux packages change
over time, and that the instructions in the tutorial will slowly drift
over time. Newer versions of tutorials will be posted as they become
available.



## <span id="Prerequisites" class="mw-headline">Prerequisites</span>

These have **already been set up** on the VM image.

Perl:

- [BioPerl 1.6](BioPerl "BioPerl")
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

## <span id="JBrowse_Introduction" class="mw-headline">JBrowse Introduction</span>

How and why [JBrowse](JBrowse.1 "JBrowse") is different from most other
web-based genome browsers, including [GBrowse](GBrowse.1 "GBrowse").

More detail: <a href="http://genome.cshlp.org/content/19/9/1630.full"
class="external text" rel="nofollow">paper</a>

<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/02/GMODCourse2010-JBrowseIntro.pdf"
class="internal"
title="GMODCourse2010-JBrowseIntro.pdf">Media:GMODCourse2010-JBrowseIntro.pdf</a>

## <span id="JBrowse_arch" class="mw-headline">JBrowse arch</span>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d0/Jbrowse_arch.png/600px-Jbrowse_arch.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/d0/Jbrowse_arch.png/900px-Jbrowse_arch.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d0/Jbrowse_arch.png 2x"
width="600" height="776" alt="Jbrowse arch.png" />

## <span id="Setting_up_JBrowse" class="mw-headline">Setting up JBrowse</span>

### <span id="Getting_JBrowse" class="mw-headline">Getting JBrowse</span>



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



### <span id="Starting_Point" class="mw-headline">Starting Point</span>

Visit in web browser:

- if your web browser is in the VM:
  <a href="http://localhost/jbrowse/" class="external free"
  rel="nofollow">http://localhost/jbrowse/</a>
- if your web browser is outside the VM, use your VM's IP address
  instead of "localhost"

You should see just a blank white page.

### <span id="Basic_Steps" class="mw-headline">Basic Steps</span>

Setting up a JBrowse instance with feature data goes in three basic
steps:

1.  Specify reference sequences
2.  Load feature data
3.  Collect feature names

### <span id="Data_from_a_database" class="mw-headline">Data from a database</span>

Here, we'll use the
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> adapter;
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

#### <span id="Specify_reference_sequences" class="mw-headline">Specify reference sequences</span>

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

#### <span id="Load_Feature_Data" class="mw-headline">Load Feature Data</span>

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

`"class"` specifies the [CSS](Glossary#CSS "Glossary") class that
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

#### <span id="More_complex_track" class="mw-headline">More complex track</span>

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

First, remove the `data` directory:

    $ rm -r data

Visit in web browser, see blank screen again

#### <span id="Sequences" class="mw-headline">Sequences</span>

You can also get data into JBrowse from flat files. For sequence, use
`prepare-refseqs.pl` with the `--fasta` argument:

    $ bin/prepare-refseqs.pl --fasta ~/Documents/Data/jbrowse/scf1117875582023.fasta

Visit in web browser; you should see a second reference sequence.

#### <span id="Features" class="mw-headline">Features</span>

To get feature data from flat files into JBrowse, use
`flatfile-to-json.pl`. We'll use some more of the data from the
<a href="MAKER_Tutorial" class="mw-redirect"
title="MAKER Tutorial">MAKER session</a>:

    $ bin/flatfile-to-json.pl \
        --gff /home/gmod/Documents/Data/maker/example2_pyu/finished.maker.output/finished_datastore/scf1117875582023/scf1117875582023.gff \
        --type match --getSubs --tracklabel "gff_match" --key "GFF match" \
        --cssclass generic_parent --subfeatureClasses '{"match_part": "generic_part_a"}'

Visit in web browser; you should see a new "GFF match" track.

#### <span id="BAM_data" class="mw-headline">BAM data</span>

The "lazyfeatures" branch of JBrowse can generate JSON from a BAM
source:

    $ bin/flatfile-to-json.pl \
        --bam ~/Documents/Data/jbrowse/simulated-sorted.bam \
        --cssclass exon --tracklabel BAM_data --key "BAM Data"

### <span id="Quantitative_data" class="mw-headline">Quantitative data</span>

JBrowse can also display quantitative data in the wiggle format. JBrowse
processes wiggle files with a C++ program, which you have to compile:

    $ make

Now you can process the wiggle file:

    $ bin/wig-to-json.pl --wig ~/Documents/Data/jbrowse/pyu.wig \
        --tracklabel "coverage_wig" --key "Wiggle Coverage" --min 0 --max 50

Visit in web browser

## <span id="See_also" class="mw-headline">See also</span>

- Documentation: <a href="JBrowseDev/Main" class="mw-redirect"
  title="JBrowseDev/Main">JBrowseDev/Main</a>

## <span id="Other_links" class="mw-headline">Other links</span>

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




[Categories](Special%253ACategories "Special%253ACategories"):

- [Tutorials](Category%253ATutorials "Category%253ATutorials")
- [JBrowse](Category%253AJBrowse "Category%253AJBrowse")



<span class="smwfactboxhead">Facts about
"<span class="swmfactboxheadbrowse">[JBrowse Tutorial
2010](Special%253ABrowse/JBrowse-20Tutorial-202010 "Special%253ABrowse/JBrowse-20Tutorial-202010")</span>"</span>

|                                                        |                                                                                                                                                                    |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [Has topic](Property%253AHas_topic "Property:Has topic") | [JBrowse](JBrowse.1 "JBrowse") <span class="smwsearch">[+](Special%253ASearchByProperty/Has-20topic/JBrowse "Special%253ASearchByProperty/Has-20topic/JBrowse")</span> |






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



- <span id="t-smwbrowselink"><a href="Special%253ABrowse/JBrowse_Tutorial_2010" rel="smw-browse">Browse
  properties</a></span>





- <span id="footer-info-lastmod">Last updated at 22:46 on 3 October 2012.</span>
<!-- - <span id="footer-info-viewcount">10,893 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->



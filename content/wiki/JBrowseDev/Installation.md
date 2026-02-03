---
title: "JBrowse"
---
# JBrowse

<a href="../File:JBrowseLogo.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/ac/JBrowseLogo.png/400px-JBrowseLogo.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/ac/JBrowseLogo.png/600px-JBrowseLogo.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/ac/JBrowseLogo.png 2x"
width="400" height="88" alt="JBrowse logo" /></a>

Status

- Mature release
- Development: active
- Support: active

Licence

<a href="http://opensource.org/" rel="nofollow"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/66/Osi_symbol.png/40px-Osi_symbol.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/66/Osi_symbol.png/60px-Osi_symbol.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/66/Osi_symbol.png/80px-Osi_symbol.png 2x"
width="40" height="39" alt="} is open source" /></a>

<a href="http://opensource.org/licenses/LGPL-3.0" class="external text"

<a href="http://opensource.org/licenses/Artistic-2.0"
class="external text" rel="nofollow">Artistic License 2.0</a>

- <a href="http://jbrowse.org" class="external text" rel="nofollow">Home
  page</a>
- <a href="http://jbrowse.org/install/" class="external text"
  rel="nofollow">Download</a>
- <a href="http://github.com/GMOD/jbrowse" class="external text"
  rel="nofollow">Source code</a>
- <a href="http://jbrowse.org/demos" class="external text"
  rel="nofollow">Demo server</a>

  JBrowse</span>](#About_JBrowse)
  - [Features](#Features)
  - [Screenshots](#Screenshots)
- [Downloads](#Downloads)
- [Using
  JBrowse](#Using_JBrowse)
  - [System
    Requirements](#System_Requirements)
  - [Installation](#Installation)
  - [Configuration](#Configuration)
- [Upgrading
  JBrowse](#Upgrading_JBrowse)
- [Documentation](#Documentation)
- [Publications,
  Tutorials, and
  Presentations](#Publications.2C_Tutorials.2C_and_Presentations)
  - [Publications on or mentioning
    JBrowse](#Publications_on_or_mentioning_JBrowse)
  - [Tutorials](#Tutorials)
  - [Presentations](#Presentations)
- [Contacts and
  Mailing Lists](#Contacts_and_Mailing_Lists)
- [JBrowse in the
  wild](#JBrowse_in_the_wild)
- [JBrowse
  Development](#JBrowse_Development)
  - [Current
    status](#Current_status)
- [More on
  JBrowse](#More_on_JBrowse)

## About JBrowse

JBrowse is a genome browser with a fully dynamic AJAX interface, being
developed as the eventual successor to GBrowse. It is very fast and
scales well to large datasets. JBrowse is javascript-based and does
almost all of its work directly in the user's web browser, with minimal
requirements for the server.

### Features

- Fast, smooth scrolling and zooming. Explore your genome with
  unparalleled speed.
- Scales easily to multi-gigabase genomes and deep-coverage sequencing.
- Supports GFF3, BED, FASTA, Wiggle, BigWig, BAM, VCF (with tabix),
  REST, and more. BAM, BigWig, and VCF data are displayed directly from
  the compressed binary file with no conversion needed.
- Very light server resource requirements. In fact, JBrowse has no
  back-end server code, just tools for formatting data files to be read
  directly over HTTP. Serve huge datasets from a single low-cost cloud
  instance.

Visit the <a href="http://jbrowse.org" class="external text"

### Screenshots

<a href="../File:JBrowse_alignment_and_coverage.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7e/JBrowse_alignment_and_coverage.png/600px-JBrowse_alignment_and_coverage.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7e/JBrowse_alignment_and_coverage.png/900px-JBrowse_alignment_and_coverage.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/7e/JBrowse_alignment_and_coverage.png 2x"
width="600" height="373" alt="JBrowse alignment and coverage.png" /></a>

## Downloads

- <a href="http://jbrowse.org/install/" class="external text"
  rel="nofollow">Download JBrowse</a>.
- <a href="http://github.com/GMOD/jbrowse" class="external text"
  rel="nofollow">Download the source code for JBrowse</a>.

## Using JBrowse

The <a href="http://jbrowse.org/code/latest-release/docs/tutorial/"
class="external text" rel="nofollow">JBrowse Quick-Start Tutorial</a>
provides a basic step-by-step recipe for quickly getting up and running
with JBrowse.

### System Requirements

JBrowse requires libpng, Zlib, and GD development libraries, plus make
and a C compiler. On Ubuntu, you can install these prerequisites using
the command:

     sudo apt-get install libpng-dev libgd2-noxpm-dev build-essential

For tips on installing these baseline libraries, see [JBrowse
Troubleshooting](../JBrowse_Troubleshooting).

### Installation

The <a href="http://jbrowse.org/code/latest-release/docs/tutorial/"
class="external text" rel="nofollow">JBrowse Quick-Start Tutorial</a>
provides a basic step-by-step recipe for quickly getting up and running
with JBrowse.

1. <a href="http://jbrowse.org/install/" class="external text"
   rel="nofollow">Download JBrowse</a> onto your web server.

2\. Unpack JBrowse into a directory that is served by your web browser.
On many systems, this defaults to `/var/www`.

       cd /var/www
       unzip JBrowse-*.zip

**Make sure you have permissions to write to the contents of the
`jbrowse/` directory you have just created.**

3\. Run the automated-setup script, `./setup.sh`, which will attempt to
install all of JBrowse's (modest) prerequisites for you in the
`jbrowse/` directory itself. Note that `setup.sh` does not need to be
run as root or with `sudo`. For help troubleshooting failures of
setup.sh, see [JBrowse
Troubleshooting](../JBrowse_Troubleshooting).

4\. Visit JBrowse on your machine, substituting the
http://(your_machine/path_to_jbrowse)/index.html?data=sample_data/json/volvox.
If you can see the included Volvox example data, you are ready to
configure JBrowse to show your own data!

### Configuration

See the [JBrowse Configuration
Guide](../JBrowse_Configuration_Guide) for
information on:

- [Formatting reference
  sequences](../JBrowse_Configuration_Guide#Reference_Sequences)
  (e.g. from FASTA files, or a Chado database)
- [Feature
  Tracks](../JBrowse_Configuration_Guide#Feature_Tracks)
  (e.g. from BED or GFF files, a Chado database, or the UCSC genome
  browser)
- [Image
  Tracks](../JBrowse_Configuration_Guide#Image_Tracks)
  (e.g. from WIG files)
- [Wiggle/BigWig
  Tracks](../JBrowse_Configuration_Guide#Wiggle_Tracks)
- [Name Search and
  Autocompletion](../JBrowse_Configuration_Guide#Name_Searching_and_Autocompletion)
- [Removing
  tracks](../JBrowse_Configuration_Guide#Removing_Tracks)
- [Compressing data stored on the
  server](../JBrowse_Configuration_Guide#Compressing_data_on_the_server)
- [URL
  control](../JBrowse_Configuration_Guide#URL_Control)
- [Faceted track
  selection](../JBrowse_Configuration_Guide#Faceted_Track_Selection)
- [Anonymous usage
  statistics](../JBrowse_Configuration_Guide#Anonymous_Usage_Statistics)

Additional topics:

- <a href="/wiki/Using_a_Database_With_JBrowse" class="mw-redirect"
  title="JBrowseDev/Using a Database With JBrowse">Using an Existing
  Database with JBrowse</a>

## Upgrading JBrowse

To upgrade an existing JBrowse (1.3.0 or later) to the latest version,
simply move its data directory (and `jbrowse_conf.json` if you are using
it) into the directory of a newer JBrowse, and the new JBrowse will
display that data.

To upgrade a 1.2.x JBrowse, copy its data directory into the new JBrowse
directory, and point your browser at compat_121.html in the new JBrowse
directory, instead of index.html.

If you are upgrading from a version of JBrowse older than 1.2.0, a fresh
installation is required.

## Documentation

- <a href="../JBrowse_Configuration_Guide" class="external text"
  rel="nofollow">JBrowse configuration reference</a>
- <a href="http://jbrowse.org/code/latest-release/docs/tutorial"
  class="external text" rel="nofollow">JBrowse quick start</a>
- <a href="../JBrowse_FAQ" class="external text" rel="nofollow">JBrowse
  setup FAQ</a>

## Publications, Tutorials, and Presentations

### Publications on or mentioning JBrowse

- JBrowse: a next-generation genome browser
  (2009)<sup>[\[1\]](#cite_note-PMID:19570905-1)</sup>
- Setting up the JBrowse genome browser
  (2010)<sup>[\[2\]](#cite_note-PMID:21154710-2)</sup>
- Visualizing next-generation sequencing data with JBrowse
  (2013)<sup>[\[3\]](#cite_note-PMID:22411711-3)</sup>
- JBrowse: a dynamic web platform for genome visualization and analysis
  (2016)<sup>[\[4\]](#cite_note-PMID:_27072794-4)</sup>

### Tutorials

<a href="../JBrowse_Tutorial" class="mw-redirect"
title="JBrowse Tutorial">JBrowse Tutorial</a> covering installation and configuration
part of the [2013 GMOD Summer
School](../2013_GMOD_Summer_School)

<a href="http://jbrowse.org/code/latest-release/docs/tutorial/"
class="external text" rel="nofollow">Getting Started with JBrowse
Tutorial</a>
part of the JBrowse documentation

<a
href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/44/Exploring_structural_variation_in_the_tomato_clade_using_JBrowse.pdf"

title="Exploring structural variation in the tomato clade using JBrowse.pdf">Exploration
of structural variation in the tomato clade using JBrowse</a>
Tutorial explaining how to browse structural variants from the
<a href="http://www.tomatogenome.net" class="external text"

### Presentations

- April 2013 - Bio-IT World, Robert Buels:
  <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/0c/JBrowse_bioit_world_apr2013.pdf"
  class="internal" title="JBrowse bioit world apr2013.pdf">PDF</a>
- August 2012 - presentation given as part of the [2012 GMOD Summer
  School](../2012_GMOD_Summer_School):
  <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fa/JBrowse_gmod_aug2012.pdf"
  class="internal" title="JBrowse gmod aug2012.pdf">PDF</a>
- April 2012 - GMOD 2012 Community Meeting, Robert Buels:
  <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/ba/RBuels_JBrowse_apr2012.pdf"
  class="internal" title="RBuels JBrowse apr2012.pdf">PDF</a>
- January 2012 - Plant and Animal Genome (PAG) XX:
  <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ed/Rbuels_jbrowse_pag2012.pdf"
  class="internal" title="Rbuels jbrowse pag2012.pdf">PDF</a>
- April 2010 - UCSC genome browser group ("genecats") meeting:
  <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/67/JBrowse-UCSC-4-21-10.pdf"
  class="internal" title="JBrowse-UCSC-4-21-10.pdf">PDF</a>
- August 2009 - [GMOD Community
  Meeting](../August_2009_GMOD_Meeting):
  [Talk
  summary](../August_2009_GMOD_Meeting#JBrowse)

## Contacts and Mailing Lists

Please direct questions and inquiries regarding JBrowse to the mailing
lists below._Requests for help should be directed to
<a href="mailto:gmod-ajax@lists.sourceforge.net" class="external text"

|                                                                  | -------------------------------------------------- | ---------------------------------------------------------------- | ----------------------------------------------------------------------- | ---------- |                                                    | Mailing List Link                                                | Description                                                             | Archive(s) | **JBrowse**                                        | <a href="https://lists.sourceforge.net/lists/listinfo/gmod-ajax" | class="external text" rel="nofollow">gmod-ajax</a> | **JBrowse** help and general questions.                          | <a href="http://gmod.827538.n3.nabble.com/JBrowse-Support-f815920.html" |

class="external text" rel="nofollow">Nabble</a> (2010/05+), <a href="https://lists.sourceforge.net/lists/listinfo/gmod-ajax"
class="external text" rel="nofollow">Sourceforge</a> | | <a
href="https://calmail.berkeley.edu/manage/list/listinfo/jbrowse-dev@lists.berkeley.edu"
class="external text" rel="nofollow">jbrowse-dev</a> | **JBrowse** development discussions. | <a
href="http://gmod.827538.n3.nabble.com/JBrowse-Development-f3296666.html"
class="external text" rel="nofollow">Nabble</a> (2011/08+) |

gmod-ajax@lists.sourceforge.net

## JBrowse in the wild

Public installations of JBrowse:

- <a href="http://genomesunzipped.org/jbrowse" class="external text"
  rel="nofollow">Genomes Unzipped: Public Personal Genomics</a>
- <a href="http://beetlebase.org" class="external text"
  rel="nofollow">BeetleBase</a>
- <a href="http://www.medicinalgenomics.com/the-jane-ome/"
  class="external text" rel="nofollow">The Jane-Ome, medicinal marijuana
  project</a>
- <a href="http://icemangenome.net/‎" class="external text"
  rel="nofollow">Ice Man Genome</a>
  Browse the genome of Ötzi the ice man

## JBrowse Development

### Current status

The <a href="http://github.com/GMOD/jbrowse" class="external text"

Please feel very free to fork the code on GitHub and make modifications
and improvements, submitting pull requests. GitHub has a very nice
<a href="http://help.github.com/fork-a-repo/" class="external text"

development.

## More on JBrowse

See [Category:JBrowse](../Category:JBrowse)

1.  <span id="cite_note-PMID:19570905-1"><span class="mw-cite-backlink">[↑](#cite_ref-PMID:19570905_1-0)</span>
    <span class="reference-text">\*JBrowse: a next-generation genome
    browser </span></span>
2.  <span id="cite_note-PMID:21154710-2"><span class="mw-cite-backlink">[↑](#cite_ref-PMID:21154710_2-0)</span>
    <span class="reference-text">\*Setting up the JBrowse genome browser
    </span></span>
3.  <span id="cite_note-PMID:22411711-3"><span class="mw-cite-backlink">[↑](#cite_ref-PMID:22411711_3-0)</span>
    <span class="reference-text">\* Visualizing next-generation
    sequencing data with JBrowse</span></span>
4.  <span id="cite_note-PMID:_27072794-4"><span class="mw-cite-backlink">[↑](#cite_ref-PMID:_27072794_4-0)</span>
    <span class="reference-text">\* JBrowse: a dynamic web platform for
    genome visualization and analysis</span></span>

</span>

[Available on platform](../Property:Available_on_platform)

web

[Has URL](../Property:Has_URL)

<a href="http://jbrowse.org/install/" class="external free"

,
<a href="http://jbrowse.org" class="external free"

,
<a href="http://twitter.com/usejbrowse" class="external free"

,
<a href="http://github.com/GMOD/jbrowse" class="external free"

,
<a href="http://jbrowse.org/demos" class="external free"

,
<a href="http://icemangenome.net/%E2%80%8E" class="external free"

,
<a href="http://genomesunzipped.org/jbrowse" class="external free"

,
<a href="http://beetlebase.org" class="external free"

and <a href="http://www.medicinalgenomics.com/the-jane-ome/"

[Has description](../Property:Has_description)

JBrowse is a genome browser with a fully d<span class="smw-highlighter"
data-type="2" state="persistent"
data-title="Information"><span class="smwtext"> …
</span><span class="smwttcontent">JBrowse is a genome browser with a
fully dynamic AJAX interface, being developed as the eventual successor
to GBrowse. It is very fast and scales well to large datasets. JBrowse
is javascript-based and does almost all of its work directly in the
user's web browser, with minimal requirements for the server.
</span></span>

### Features

- Fast, smooth scrolling and zooming. Explore your genome with
  unparalleled speed.
- Scales easily to multi-gigabase genomes and deep-coverage sequencing.
- Supports GFF3, BED, FASTA, Wiggle, BigWig, BAM, VCF (with tabix),
  REST, and more. BAM, BigWig, and VCF data are displayed directly from
  the compressed binary file with no conversion needed.
- Very light server resource requirements. In fact, JBrowse has no
  back-end server code, just tools for formatting data files to be read
  directly over HTTP. Serve huge datasets from a single low-cost cloud
  instance.ets from a single low-cost cloud instance.
   and Browse the
  genome of Ötzi the ice man

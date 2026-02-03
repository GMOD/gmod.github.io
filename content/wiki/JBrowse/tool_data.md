---
title: "JBrowse/tool data"
---
# JBrowse/tool data


This page stores the data that populates the
[JBrowse](../JBrowse.1 "JBrowse") wiki page.

\| name = JBrowse \| full_name = \| contact_email =
rbuels@gmail.com \| status = mature \| dev = active \| support = active
\| type = Genome visualization \| platform = web \| logo =
JBrowseLogo.png \| input = [GFF3](../GFF3 "GFF3"), BED, FASTA, Wiggle,
BigWig, BAM \| output = \| licence =
<a href="http://www.gnu.org/licenses/lgpl.txt" class="external text"
rel="nofollow">LGPL</a> and
<a href="http://www.perlfoundation.org/artistic_license_2_0"
class="external text" rel="nofollow">Artistic license</a> \| open source
= yes \| language = Javascript, Perl \| release date = 2008 \| home =
<a href="http://jbrowse.org" class="external free"
rel="nofollow">http://jbrowse.org</a> \| demo_server = <a
href="http://jbrowse.org/code/JBrowse-1.5.0-full/index.html?loc=ctgA%253A5947..26686&amp;tracks=DNA%2CCDS%2CTranscript%2Cvolvox_microarray.wig%2Cvolvox_microarray.bw&amp;data=sample_data%2Fjson%2Fvolvox"
class="external text" rel="nofollow">Volvox example data</a> \|
wild_urls = \| about = JBrowse is a genome browser with a fully dynamic
HTML5 user interface, being developed as the successor to GBrowse. It is
very fast and scales well to large datasets. JBrowse does almost all of
its work directly in the user's web browser, with minimal requirements
for the server.

### Features

- Fast, smooth scrolling and zooming. Explore your genome with
  unparalleled speed.
- Scales easily to multi-gigabase genomes.
- Supports GFF3, BED, FASTA, Wiggle, BigWig, BAM, and more.
- Very light server resource requirements. Serve huge datasets from a
  single low-cost cloud instance.

\| screenshot =


<a href="../File:JBrowse_alignment_and_coverage.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7e/JBrowse_alignment_and_coverage.png/600px-JBrowse_alignment_and_coverage.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7e/JBrowse_alignment_and_coverage.png/900px-JBrowse_alignment_and_coverage.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/7e/JBrowse_alignment_and_coverage.png 2x"
width="600" height="373" alt="JBrowse alignment and coverage.png" /></a>


\| public_server = \| dl = \| dl_url =
<a href="http://jbrowse.org/install/" class="external free"
rel="nofollow">http://jbrowse.org/install/</a> \| dl_src = \| dl_src_url
= <a href="http://github.com/GMOD/jbrowse" class="external free"
rel="nofollow">http://github.com/GMOD/jbrowse</a> \|
getting_started_preamble = The
<a href="http://jbrowse.org/code/latest-release/docs/tutorial/"
class="external text" rel="nofollow">JBrowse Quick-Start Tutorial</a>
provides a basic step-by-step recipe for quickly getting up and running
with JBrowse. \| req = JBrowse requires libpng, Zlib, and GD development
libraries, plus make and a C compiler. On Ubuntu, you can install these
prerequisites using the command:

     sudo apt-get install libpng-dev libgd2-noxpm-dev build-essential

For tips on installing these baseline libraries, see [JBrowse
Troubleshooting](../JBrowse_Troubleshooting "JBrowse Troubleshooting").

\| install = The
<a href="http://jbrowse.org/code/latest-release/docs/tutorial/"
class="external text" rel="nofollow">JBrowse Quick-Start Tutorial</a>
provides a basic step-by-step recipe for quickly getting up and running
with JBrowse.

1\. <a href="http://jbrowse.org/install/" class="external text"
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
Troubleshooting](../JBrowse_Troubleshooting "JBrowse Troubleshooting").

4\. Visit JBrowse on your machine, substituting the
http://(your_machine/path_to_jbrowse)/index.html?data=sample_data/json/volvox.
If you can see the included Volvox example data, you are ready to
configure JBrowse to show your own data!

\| config = See the [JBrowse Configuration
Guide](../JBrowse_Configuration_Guide "JBrowse Configuration Guide") for
information on:

- [Formatting reference
  sequences](../JBrowse_Configuration_Guide#Reference_Sequences "JBrowse Configuration Guide")
  (e.g. from FASTA files, or a Chado database)
- [Feature
  Tracks](../JBrowse_Configuration_Guide#Feature_Tracks "JBrowse Configuration Guide")
  (e.g. from BED or GFF files, a Chado database, or the UCSC genome
  browser)
- [Image
  Tracks](../JBrowse_Configuration_Guide#Image_Tracks "JBrowse Configuration Guide")
  (e.g. from WIG files)
- [Wiggle/BigWig
  Tracks](../JBrowse_Configuration_Guide#Wiggle_Tracks "JBrowse Configuration Guide")
- [Name Search and
  Autocompletion](../JBrowse_Configuration_Guide#Name_Searching_and_Autocompletion "JBrowse Configuration Guide")
- [Removing
  tracks](../JBrowse_Configuration_Guide#Removing_Tracks "JBrowse Configuration Guide")
- [Compressing data stored on the
  server](../JBrowse_Configuration_Guide#Compressing_data_on_the_server "JBrowse Configuration Guide")
- [URL
  control](../JBrowse_Configuration_Guide#URL_Control "JBrowse Configuration Guide")
- [Faceted track
  selection](../JBrowse_Configuration_Guide#Faceted_Track_Selection "JBrowse Configuration Guide")
- [Anonymous usage
  statistics](../JBrowse_Configuration_Guide#Anonymous_Usage_Statistics "JBrowse Configuration Guide")

Additional topics:


- [GMOD in the
  Cloud](../Category%253AGMOD_in_the_Cloud "Category%253AGMOD in the Cloud")
- [JBrowse](../Category%253AJBrowse "Category%253AJBrowse")
- [GMOD
  Components](../Category%253AGMOD_Components "Category%253AGMOD Components")
- [Tool data](../Category%253ATool_data "Category%253ATool data")

---
title: "GBrowse syn/tool data"
---
# GBrowse syn/tool data

\| name = GBrowse_syn \| full_name = Generic Synteny
Browser \| status = beta release \| dev = active \| support = active \|
type = Comparative genome visualization \| platform = web \| logo =
GBrowse_syn_logo.png \| home = \| about = GBrowse_syn, or the Generic
Synteny Browser, is a [GBrowse](../GBrowse.1 "GBrowse")-based
<a href="../Synteny" class="mw-redirect" title="Synteny">synteny</a>
browser designed to display multiple genomes, with a central reference
species compared to two or more additional species. It can be used to
view multiple sequence alignment data, synteny or co-linearity data from
other sources against genome annotations provided by GBrowse.
GBrowse_syn is included with the standard GBrowse package (version 1.69
and later).

\| screenshot =

<a href="../File:GBrowse_syn.png" class="image"></a>

GBrowse_syn, as implemented at WormBase

\| public_server = \| dl = \| dl_url =
<a href="https://github.com/GMOD/GBrowse" class="external free"
rel="nofollow">https://github.com/GMOD/GBrowse</a> \| dl_src = \|
dl_src_url = \| dl_dev = \| dl_dev_url =
<a href="https://github.com/GMOD/GBrowse" class="external free"
rel="nofollow">https://github.com/GMOD/GBrowse</a> \|
getting_started_preamble = GBrowse_syn has been part of the
[GBrowse](../GBrowse.1 "GBrowse") distribution since version 1.69; we
recommend using the most up-to-date version of GBrowse 2. Please follow
the [installation instructions for
GBrowse](../GBrowse_2.0_Install_HOWTO.1 "GBrowse 2.0 Install HOWTO"). \|
req = \| install = \| config = Configuration of GBrowse_syn is much the
same as for [GBrowse](../GBrowse.1 "GBrowse"), with database and display
options controlled by a configuration file. GBrowse_syn uses a main
configuration file for general options plus an individual configuration
for each species represented in the multiple sequence alignments.

More information on [GBrowse_syn
configuration](../GBrowse_syn_Configuration "GBrowse syn Configuration")
\| doc = See the [help for
GBrowse_syn](../GBrowse_syn_Help "GBrowse syn Help")

#### Alignment data

- GBrowse_syn uses a central 'joining' database that contains
  information about the multiple sequence alignments
- There is an additional GBrowse database for each species represented
  in the alignments
- The databases for each species are configured in the same way as a
  regular GBrowse installations
- [Details on the GBrowse_syn
  database](../GBrowse_syn_Database "GBrowse syn Database")

#### User interface

The overall look of Gbrowse_syn resembles GBrowse but has some key
differences to accommodate the more complex comparative genome data (see
the screenshot
above).

GBrowse_syn uses a central "reference species" panel, with inset panels
above and below for two or more aligned species. There is no upper limit
to the number of species that can be displayed. \| papers = Please refer
to the following paper when citing GBrowse_syn:

- Using the Generic Synteny Browser (GBrowse_syn)
  <sup>[\[1\]](#cite_note-PMID:20836076-1)</sup>

\| presentations = \*
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d4/GBrowse_syn_EBI2009.pdf"
class="internal" title="GBrowse syn EBI2009.pdf">Challenges in
Comparative Genome Browsing</a> - Presented by [Sheldon
McKay](../User%253AMckays "User%253AMckays") at the
<a href="http://www.ebi.ac.uk" class="external text"
rel="nofollow">European Bioinformatics Institute</a>, Hinxton, UK.

 for notes on further GBrowse_syn development. \| contact_email
= <a href="mailto:mckays@cshl.edu" class="external text"
rel="nofollow">Sheldon Mckay</a> \| input = \| output = \| see_also =
The focus of this documentation is the GBrowse_syn application. However,
the generation of whole genome alignments and identification of
orthologous regions are the subject of considerable interest, so some
background reading is listed below:

- [GMOD in the
  Cloud](../Category%253AGMOD_in_the_Cloud "Category%253AGMOD in the Cloud")
- [GMOD
  Components](../Category%253AGMOD_Components "Category%253AGMOD Components")
- [Tool data](../Category%253ATool_data "Category%253ATool data")
- [GBrowse syn](../Category%253AGBrowse_syn "Category%253AGBrowse syn")

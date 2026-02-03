---
title: "GBrowse syn Configuration"
---




<span id="top"></span>




# <span dir="auto">GBrowse syn Configuration</span>









[GBrowse_syn](GBrowse_syn.1 "GBrowse syn") is a
<a href="Synteny" class="mw-redirect" title="Synteny">synteny</a> viewer
based on [GBrowse](GBrowse.1 "GBrowse"). This page describes how to
configure GBrowse_syn.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Main
  Configuration File</span>](#Main_Configuration_File)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">Purpose</span>](#Purpose)
    - [<span class="tocnumber">1.1.1</span>
      <span class="toctext">Example config
      file</span>](#Example_config_file)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">Configuration
    settings</span>](#Configuration_settings)
  - [<span class="tocnumber">1.3</span> <span class="toctext">The
    species' configuration
    stanzas</span>](#The_species.27_configuration_stanzas)



# <span id="Main_Configuration_File" class="mw-headline">Main Configuration File</span>

## <span id="Purpose" class="mw-headline">Purpose</span>

The main configuration file specifies the alignment database, the
species to be included and their corresponding configuration files and
display options.

- The file ends with the extension ".synconf".

### <span id="Example_config_file" class="mw-headline">Example config file</span>

This example contains information about the alignment (joining) database
and the individual database for of the species in the browser. For
details of each setting, see below.

    [GENERAL]
    description =  PECAN alignments for Caenorhabditis

    # The synteny database
    join        = dbi:mysql:database=pecan;host=localhost;user=nobody

    #     symbolic src   config file (without the ".conf")  Description
    source_map =      c_elegans      c_elegans     "C. elegans"
                      c_remanei      c_remanei     "C. remanei"
                      c_briggsae     c_briggsae    "C. briggsae"
                      c_brenneri     c_brenneri    "C. brenneri"
                      c_japonica     c_japonica    "C. japonica"

    tmpimages     = /gbrowse/tmp
    imagewidth    = 800
    stylesheet    = /gbrowse/gbrowse.css
    cache time    = 1

    # example searches to display
    examples = c_elegans X:1050000..1150000
               c_briggsae chrX:620000..670000
               c_elegans R193.2


    zoom levels = 5000 10000 25000 50000 100000 200000 400000

    # species-specific databases
    [c_elegans]
    tracks    = CG
    color     = green

    [c_remanei]
    tracks    = CG
    color     = red

    [c_briggsae]
    tracks    = CG
    color     = black

    [c_brenneri]
    tracks    = CG
    color     = purple

    [c_japonica]
    tracks    = CG
    color     = blue

- Another example can be found in the
  <span class="pops"><a href="GBrowse_syn_Tutorial#The_GBrowse_syn_Config_File"
  class="mw-redirect"
  title="GBrowse syn Tutorial">GBrowse_syn_Tutorial</a></span>

## <span id="Configuration_settings" class="mw-headline">Configuration settings</span>

See above for examples.

<table class="x" data-border="1">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>Option</th>
<th>Required option?</th>
<th>Default Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>join</td>
<td>Yes</td>
<td></td>
<td>The database source name (DSN) for the alignment database</td>
</tr>
<tr class="even">
<td>source_map</td>
<td>Yes</td>
<td></td>
<td>This option maps the relationship between the species data sources,
names and descriptions. See the example above.
<ul>
<li>The value for "name" (the first column) is the symbolic name that
gbrowse_syn uses to identify each species.</li>
<li>This value is also used in two other places in the gbrowse_syn
configuration:
<ol>
<li>it is used as the species name in the "examples" directive</li>
<li>it is used as the species name in the .aln file</li>
</ol></li>
<li>The value for "conf. file" is the basename of the corresponding
gbrowse .conf file. This value is also used to identify the species
configuration stanzas at the bottom of the configuration file.</li>
</ul></td>
</tr>
<tr class="odd">
<td>tmpimages</td>
<td></td>
<td></td>
<td>The URL for cached image and session data</td>
</tr>
<tr class="even">
<td>buttons</td>
<td></td>
<td></td>
<td>The URL for stock <a href="GBrowse.1" title="GBrowse">GBrowse</a>
images, etc</td>
</tr>
<tr class="odd">
<td>stylesheet</td>
<td></td>
<td>/gbrowse/gbrowse.css</td>
<td>The URL for the stylesheet</td>
</tr>
<tr class="even">
<td>examples</td>
<td></td>
<td></td>
<td>Example searches to show at the top of the page The species names
used much match those used in the first column of the source_map
directive.</td>
</tr>
<tr class="odd">
<td>zoom levels</td>
<td></td>
<td></td>
<td>which zoom levels will be available in the navigation menu</td>
</tr>
<tr class="even">
<td>config_extension</td>
<td></td>
<td>syn</td>
<td>This specifies the extension of species-specific configuration
files.
<ul>
<li>If GBrowse_syn is used with stand-alone <a href="GBrowse.1"
title="GBrowse">GBrowse</a> data sources, change this option to
'conf'.</li>
<li>To avoid confusing the configuration files parser, take care to
select names for species-specific configuration files that are not
similar to other file names. For example, do not use both elegans.conf
(for GBrowse) and elegans.syn (for GBrowse_syn).</li>
<li>NOTE: If you are using multiple data sources for gbrowse_syn, all
must use the same config extension, you can not mix and match ".syn" and
".conf".</li>
</ul></td>
</tr>
<tr class="odd">
<td>description</td>
<td></td>
<td>none</td>
<td>The description of the GBrowse_syn data source for public
display</td>
</tr>
<tr class="even">
<td>max_segment</td>
<td></td>
<td>400_000</td>
<td>The maximum allowed segment size (sequence length) for the central
reference panel. Take care not to set this value too high. Very large
segments take a long time to render and may even time out the web
server!</td>
</tr>
<tr class="odd">
<td>max_span</td>
<td></td>
<td>0.3</td>
<td>The maximum fraction of the reference sequence size that will
trigger merging of adjacent inset (aligned sequence) panels.</td>
</tr>
<tr class="even">
<td>min_alignment_size</td>
<td></td>
<td>0.01</td>
<td>The minimum alignment size, expressed as a fraction of the total
reference sequence length, that will be used to create an inset
panel.</td>
</tr>
<tr class="odd">
<td>imagewidth</td>
<td></td>
<td>800</td>
<td>The width of the displayed sequence in pixels.</td>
</tr>
<tr class="even">
<td>interimage_pad</td>
<td></td>
<td>5</td>
<td>The space between inset panels in pixels. Of course you know what
the inset panels are. Of course you do!</td>
</tr>
<tr class="odd">
<td>vertical_pad</td>
<td></td>
<td>5</td>
<td>The vertical space between panels in pixels.</td>
</tr>
<tr class="even">
<td>align_height</td>
<td></td>
<td>6</td>
<td>The height of the alignment syntenic block features in pixels.</td>
</tr>
<tr class="odd">
<td>max_gap</td>
<td></td>
<td>200_000</td>
<td>The maximum gap allowed between chained alignment features.</td>
</tr>
<tr class="even">
<td>overview_ratio</td>
<td></td>
<td>0.9</td>
<td>The relative width of the overview panel in relation to the width of
the detailed display panel.</td>
</tr>
<tr class="odd">
<td>overview bgcolor</td>
<td></td>
<td>gainsboro</td>
<td>The background color of the overview panel. Allowed values are named
web colors or RGB hex codes (eg: '#FFFFFF').</td>
</tr>
</tbody>
</table>

## <span id="The_species.27_configuration_stanzas" class="mw-headline">The species' configuration stanzas</span>

- Each individual species (or equivalent) that has a configuration file
  specified in the source map should also have a config stanza
  specifying which tracks to display and the theme color for the
  species.
- Note that the label of each stanza must match one of those in the
  second column of the source_map.

<!-- -->

    [elegans_synteny]
    tracks    = CG
    color     = blue

    [briggsae_synteny]
    tracks    = CG
    color     = purple

    [remanei_synteny]
    tracks    = CG
    color     = black




[Category](Special%253ACategories "Special%253ACategories"):

- [GBrowse syn](Category%253AGBrowse_syn "Category%253AGBrowse syn")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse_syn_Configuration"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 19:51 on 18 October
  2011.</span>
<!-- - <span id="footer-info-viewcount">102,179 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





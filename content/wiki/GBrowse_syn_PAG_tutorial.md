---
title: "GBrowse syn PAG tutorial"
---




<span id="top"></span>




# <span dir="auto">GBrowse syn PAG tutorial</span>









  

This [tutorial](Category%253ATutorials "Category%253ATutorials") walks you
through how to install and configure the
[GBrowse_syn](GBrowse_syn.1 "GBrowse syn") comparative genomics viewer.
This tutorial was originally taught by [Sheldon
McKay](User%253AMckays "User%253AMckays") at the 2009 [GMOD
Schools](GMOD_Schools "GMOD Schools") -
[Europe](2009_GMOD_Summer_School_-_Europe "2009 GMOD Summer School - Europe")
&
[Americas](2009_GMOD_Summer_School_-_Americas "2009 GMOD Summer School - Americas").
The notes and [VMware image](#VMware) used on this page are from the
Europe course.

  


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">VMware</span>](#VMware)
- [<span class="tocnumber">2</span>
  <span class="toctext">Caveats</span>](#Caveats)
- [<span class="tocnumber">3</span> <span class="toctext">The Generic
  Synteny Browser</span>](#The_Generic_Synteny_Browser)
  - [<span class="tocnumber">3.1</span>
    <span class="toctext">Gbrowse_syn
    Introduction</span>](#Gbrowse_syn_Introduction)
  - [<span class="tocnumber">3.2</span>
    <span class="toctext">GBrowse_syn
    Documentation</span>](#GBrowse_syn_Documentation)
  - [<span class="tocnumber">3.3</span> <span class="toctext">Whole
    Genome Alignments</span>](#Whole_Genome_Alignments)
- [<span class="tocnumber">4</span> <span class="toctext">Installing
  GBrowse_syn</span>](#Installing_GBrowse_syn)
- [<span class="tocnumber">5</span> <span class="toctext">Installing
  Gbrowse_syn</span>](#Installing_Gbrowse_syn_2)
- [<span class="tocnumber">6</span> <span class="toctext">Configuration
  of GBrowse_syn</span>](#Configuration_of_GBrowse_syn)
  - [<span class="tocnumber">6.1</span> <span class="toctext">Create a
    MySQL database</span>](#Create_a_MySQL_database)
  - [<span class="tocnumber">6.2</span> <span class="toctext">Loading
    the alignment data</span>](#Loading_the_alignment_data)
    - [<span class="tocnumber">6.2.1</span> <span class="toctext">The
      alignment data file</span>](#The_alignment_data_file)
      - [<span class="tocnumber">6.2.1.1</span>
        <span class="toctext">**Note on
        CLUSTALW**</span>](#Note_on_CLUSTALW)
      - [<span class="tocnumber">6.2.1.2</span>
        <span class="toctext">Note on the sequence ID
        syntax</span>](#Note_on_the_sequence_ID_syntax)
    - [<span class="tocnumber">6.2.2</span> <span class="toctext">The
      database loading script</span>](#The_database_loading_script)
      - [<span class="tocnumber">6.2.2.1</span>
        <span class="toctext">Running in the background with the linux
        *screen*
        command</span>](#Running_in_the_background_with_the_linux_screen_command)
  - [<span class="tocnumber">6.3</span> <span class="toctext">Setting up
    the species' databases</span>](#Setting_up_the_species.27_databases)
    - [<span class="tocnumber">6.3.1</span>
      <span class="toctext">GFF3</span>](#GFF3)
    - [<span class="tocnumber">6.3.2</span>
      <span class="toctext">Loading</span>](#Loading)
  - [<span class="tocnumber">6.4</span> <span class="toctext">Setting up
    the Configuration Files</span>](#Setting_up_the_Configuration_Files)
  - [<span class="tocnumber">6.5</span> <span class="toctext">A Species
    Config File</span>](#A_Species_Config_File)
  - [<span class="tocnumber">6.6</span> <span class="toctext">The
    GBrowse_syn Config File</span>](#The_GBrowse_syn_Config_File)
  - [<span class="tocnumber">6.7</span> <span class="toctext">Testing
    the rice and wild_rice data sources in
    GBrowse</span>](#Testing_the_rice_and_wild_rice_data_sources_in_GBrowse)
  - [<span class="tocnumber">6.8</span> <span class="toctext">Viewing
    the data in GBrowse_syn</span>](#Viewing_the_data_in_GBrowse_syn)
- [<span class="tocnumber">7</span> <span class="toctext">Optional
  Advanced Section</span>](#Optional_Advanced_Section)



  

# <span id="VMware" class="mw-headline">VMware</span>

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top">This tutorial was taught using a VMware system image
as a starting point. If you want to start with that same system,
download and install the <em>Starting</em> image.
<p><em><strong>See VMware for what
software you need to use a VMware system image, and for directions on
how to get the image setup and running on your
machine.</strong></em></p></td>
<td><table class="wikitable" style="margin-left: 1em; margin-top: 0;">
<thead>
<tr class="header">
<th>Download Links will be added here</th>
</tr>
</thead>
&#10;</table></td>
</tr>
</tbody>
</table>

# <span id="Caveats" class="mw-headline">Caveats</span>



**Important Note**

This [tutorial](Category%253ATutorials "Category%253ATutorials") describes the
world as it existed on the day the tutorial was given. Please be aware
that things like CPAN modules, Java libraries, and Linux packages change
over time, and that the instructions in the tutorial will slowly drift
over time. Newer versions of tutorials will be posted as they become
available.



# <span id="The_Generic_Synteny_Browser" class="mw-headline">The Generic Synteny Browser</span>






# <span id="Optional_Advanced_Section" class="mw-headline">Optional Advanced Section</span>

We will setup up a five-genome database if time permits.








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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse_syn_PAG_tutorial"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:53 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">42,788 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





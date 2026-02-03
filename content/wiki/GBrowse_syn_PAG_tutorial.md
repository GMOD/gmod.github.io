---
title: "GBrowse syn PAG tutorial"
---
# GBrowse syn PAG tutorial



This [tutorial](/wiki/Category%3ATutorials) walks you
through how to install and configure the
[GBrowse_syn](/wiki/GBrowse_syn.1) comparative genomics viewer.
This tutorial was originally taught by [Sheldon
McKay](/wiki/User%3AMckays) at the 2009 [GMOD
Schools](/wiki/GMOD_Schools) -
[Europe](/wiki/2009_GMOD_Summer_School_-_Europe)
&
[Americas](/wiki/2009_GMOD_Summer_School_-_Americas).
The notes and [VMware image](#VMware) used on this page are from the
Europe course.



  VMware](#VMware)
- [Caveats](#Caveats)
- [The Generic
  Synteny Browser](#The_Generic_Synteny_Browser)
  - [Gbrowse_syn
    Introduction](#Gbrowse_syn_Introduction)
  - [GBrowse_syn
    Documentation](#GBrowse_syn_Documentation)
  - [Whole
    Genome Alignments](#Whole_Genome_Alignments)
- [Installing
  GBrowse_syn](#Installing_GBrowse_syn)
- [Installing
  Gbrowse_syn](#Installing_Gbrowse_syn_2)
- [Configuration
  of GBrowse_syn](#Configuration_of_GBrowse_syn)
  - [Create a
    MySQL database](#Create_a_MySQL_database)
  - [Loading
    the alignment data](#Loading_the_alignment_data)
    - [The
      alignment data file](#The_alignment_data_file)
      - [**Note on
        CLUSTALW**](#Note_on_CLUSTALW)
      - [Note on the sequence ID
        syntax](#Note_on_the_sequence_ID_syntax)
    - [The
      database loading script](#The_database_loading_script)
      - [Running in the background with the linux
        *screen*
        command](#Running_in_the_background_with_the_linux_screen_command)
  - [Setting up
    the species' databases](#Setting_up_the_species.27_databases)
    - [GFF3](#GFF3)
    - [Loading](#Loading)
  - [Setting up
    the Configuration Files](#Setting_up_the_Configuration_Files)
  - [A Species
    Config File](#A_Species_Config_File)
  - [The
    GBrowse_syn Config File](#The_GBrowse_syn_Config_File)
  - [Testing
    the rice and wild_rice data sources in
    GBrowse](#Testing_the_rice_and_wild_rice_data_sources_in_GBrowse)
  - [Viewing
    the data in GBrowse_syn](#Viewing_the_data_in_GBrowse_syn)
- [Optional
  Advanced Section](#Optional_Advanced_Section)



# VMware

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

# Caveats

**Important Note**

This [tutorial](/wiki/Category%3ATutorials) describes the
world as it existed on the day the tutorial was given. Please be aware
that things like CPAN modules, Java libraries, and Linux packages change
over time, and that the instructions in the tutorial will slowly drift
over time. Newer versions of tutorials will be posted as they become
available.

# The Generic Synteny Browser

# Optional Advanced Section

We will setup up a five-genome database if time permits.

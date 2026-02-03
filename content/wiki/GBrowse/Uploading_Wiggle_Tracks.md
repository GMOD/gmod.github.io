---
title: "GBrowse/Uploading Wiggle Tracks"
---




<span id="top"></span>




# <span dir="auto">GBrowse/Uploading Wiggle Tracks</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Dense Feature
  and Quantitative Data</span>](#Dense_Feature_and_Quantitative_Data)
- [<span class="tocnumber">2</span> <span class="toctext">Wiggle
  tracks</span>](#Wiggle_tracks)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Format
    Descriptions</span>](#Format_Descriptions)
    - [<span class="tocnumber">2.1.1</span> <span class="toctext">Wiggle
      (BED)</span>](#Wiggle_.28BED.29)
    - [<span class="tocnumber">2.1.2</span> <span class="toctext">Wiggle
      (variable step)</span>](#Wiggle_.28variable_step.29)
    - [<span class="tocnumber">2.1.3</span> <span class="toctext">Wiggle
      (fixed step)</span>](#Wiggle_.28fixed_step.29)
  - [<span class="tocnumber">2.2</span>
    <span class="toctext">Configuring Data Processing and
    Display</span>](#Configuring_Data_Processing_and_Display)
    - [<span class="tocnumber">2.2.1</span> <span class="toctext">Wiggle
      Track Options Supported by
      GBrowse</span>](#Wiggle_Track_Options_Supported_by_GBrowse)
    - [<span class="tocnumber">2.2.2</span>
      <span class="toctext">Formatting
      Examples</span>](#Formatting_Examples)
      - [<span class="tocnumber">2.2.2.1</span>
        <span class="toctext">Smoothing</span>](#Smoothing)
  - [<span class="tocnumber">2.3</span>
    <span class="toctext">Quantitative Data Examples: *C. elegans*
    Tiling
    Arrays</span>](#Quantitative_Data_Examples:_C._elegans_Tiling_Arrays)
    - [<span class="tocnumber">2.3.1</span> <span class="toctext">*C.
      elegans* BED</span>](#C._elegans_BED)
    - [<span class="tocnumber">2.3.2</span> <span class="toctext">*C.
      elegans* Wiggle</span>](#C._elegans_Wiggle)
- [<span class="tocnumber">3</span> <span class="toctext">Uploading the
  tracks</span>](#Uploading_the_tracks)
- [<span class="tocnumber">4</span> <span class="toctext">Making a
  Wiggle Track Permanent</span>](#Making_a_Wiggle_Track_Permanent)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Specifying
    the Order of Glyphs within a Displayed
    Track</span>](#Specifying_the_Order_of_Glyphs_within_a_Displayed_Track)
    - [<span class="tocnumber">4.1.1</span>
      <span class="toctext">Illustrative
      Script</span>](#Illustrative_Script)
- [<span class="tocnumber">5</span> <span class="toctext">Email
  Threads</span>](#Email_Threads)



## <span id="Dense_Feature_and_Quantitative_Data" class="mw-headline">Dense Feature and Quantitative Data</span>




<a href="../File:Fly_12pt_spen.png" class="image"></a>

  

## <span id="Making_a_Wiggle_Track_Permanent" class="mw-headline">Making a Wiggle Track Permanent</span>

The upload mechanism creates a temporary private track. If you are a
GBrowse administrator and wish to create a permanent wiggle track, the
process is simple.

1.  Format and save a wiggle file to disk in the manner described
    earlier.
2.  Run the script *wiggle2gff3.pl* on this file to create the binary
    wig file. Use the --path option to specify the directory in which
    you want the binary wig file to be stored (default is the temporary
    directory), and the --method option to set the feature type (the
    default is "example"). This will create a binary .wig file in the
    indicated directory and send a GFF3 file to standard output. You
    should capture this output using the "\>" redirect.
3.  Load the GFF3 file into your gbrowse database using
    bp_seqfeature_load.pl or bp_load_gff.pl.
4.  Configure a stanza for the data using the "wiggle_density" or
    "wiggle_xyplot" glyphs:

<!-- -->

    [TEST WIG]
    feature = example
    glyph   = wiggle_density
    key     = my first wiggle file

If you later need to move the wig file somewhere else, simply edit the
GFF3 file to change the path specified in the wigfile attribute. One
neat trick is to use a relative path for the wigfile attribute, as in:

    wigfile=track003.chr19.1199828298.wig

You can then use the **basedir** track option to tell the glyph which
directory contains the wigfile:

  

    [TEST WIG]
    feature = example
    glyph   = wiggle_density
    basedir = /var/data/wigfiles/
    key     = my first wiggle file

### <span id="Specifying_the_Order_of_Glyphs_within_a_Displayed_Track" class="mw-headline">Specifying the Order of Glyphs within a Displayed Track</span>

In the figure at the top of this page, there is a single GBrowse track
composed of several horizontal charts, one for each time period. One way
to ensure that these charts are displayed in the appropriate order is to
use the "source" field in the GFF3 file, in conjunction with the **sort
order** attribute in the stanza for the track.

For example, if the time periods are t=0, t=1, ..., t=9, and the primary
source is "Quelle", then the source for the data at t=0 could be called
Quelle_0, and similarly for the other time periods, and one would add
the following line to the relevant stanza:

    sort order = name

#### <span id="Illustrative_Script" class="mw-headline">Illustrative Script</span>

Assuming there is a .BED file named study_TT.BED for each time period
TT, where TT is 00, 01, 02, ...., then the following script illustrates
how to generate the .gff3 files for subsequent uploading:

    #!/bin/sh
    SOURCE=Quelle  # a string representing the primary source
    STUDY=study    # ${STUDY}_$t.BED
    METHOD=example # the "feature"
    for t in 00 01 02 03 04 05 06 07 08 09 10
    do
      wiggle2gff3.pl --method $METHOD --source ${SOURCE}_$t ${STUDY}_$t.BED \
        > ${STUDY}_$t.gff3
    done

  

## <span id="Email_Threads" class="mw-headline">Email Threads</span>

- <a
  href="http://gmod.827538.n3.nabble.com/wiggle-xyplot-smoothing-td839973.html"
  class="external text" rel="nofollow">wiggle_xyplot smoothing</a>,
  2010/06




[Categories](../Special%253ACategories "Special%253ACategories"):

- [GBrowse](../Category%253AGBrowse "Category%253AGBrowse")
- [HOWTO](../Category%253AHOWTO "Category%253AHOWTO")






## Navigation menu







<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>


### Navigation



- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>




### Documentation



- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/GBrowse-2FUploading_Wiggle_Tracks"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:22 on 25 April
  2013.</span>
<!-- - <span id="footer-info-viewcount">123,320 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





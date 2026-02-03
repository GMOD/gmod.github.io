---
title: "GBrowse/Uploading Wiggle Tracks"
---
# GBrowse/Uploading Wiggle Tracks

  and Quantitative Data</span>](#Dense_Feature_and_Quantitative_Data)
- [Wiggle
  tracks](#Wiggle_tracks)
  - [Format
    Descriptions](#Format_Descriptions)
    - [Wiggle
      (BED)](#Wiggle_.28BED.29)
    - [Wiggle
      (variable step)](#Wiggle_.28variable_step.29)
    - [Wiggle
      (fixed step)](#Wiggle_.28fixed_step.29)
  - [Configuring Data Processing and
    Display](#Configuring_Data_Processing_and_Display)
    - [Wiggle
      Track Options Supported by
      GBrowse](#Wiggle_Track_Options_Supported_by_GBrowse)
    - [Formatting
      Examples](#Formatting_Examples)
      - [Smoothing](#Smoothing)
  - [Quantitative Data Examples: *C. elegans*
    Tiling
    Arrays](#Quantitative_Data_Examples:_C._elegans_Tiling_Arrays)
    - [*C.
      elegans* BED](#C._elegans_BED)
    - [*C.
      elegans* Wiggle](#C._elegans_Wiggle)
- [Uploading the
  tracks](#Uploading_the_tracks)
- [Making a
  Wiggle Track Permanent](#Making_a_Wiggle_Track_Permanent)
  - [Specifying
    the Order of Glyphs within a Displayed
    Track](#Specifying_the_Order_of_Glyphs_within_a_Displayed_Track)
    - [Illustrative
      Script](#Illustrative_Script)
- [Email
  Threads](#Email_Threads)

## Dense Feature and Quantitative Data

<a href="../File:Fly_12pt_spen.png" class="image"></a>

## Making a Wiggle Track Permanent

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

### Specifying the Order of Glyphs within a Displayed Track

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

#### Illustrative Script

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

## Email Threads

- <a
  href="http://gmod.827538.n3.nabble.com/wiggle-xyplot-smoothing-td839973.html"
  class="external text" rel="nofollow">wiggle_xyplot smoothing</a>,
  2010/06

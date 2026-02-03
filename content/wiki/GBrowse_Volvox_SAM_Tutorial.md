---
title: "GBrowse Volvox SAM Tutorial"
---
# GBrowse Volvox SAM Tutorial

This is a short tutorial intended to add on to the
[GBrowse](GBrowse.1 "GBrowse") tutorial that ships with it using the
"volvox" data set. The SAM file that is linked to here was created by
running wgsim, a read simulator to create FASTQ files and then using
[Galaxy](Galaxy.1 "Galaxy") to run Bowtie and produce a SAM file. In
order to use this tutorial, SAMtools and Bio::DB::Sam must be installed.
This is based on the [NGS
tutorial](GBrowse_NGS_Tutorial "GBrowse NGS Tutorial") that Dave
Clements wrote.

  file</span>](#Create_the_BAM_file)
- [Add a database
  stanza to the volvox
  config](#Add_a_database_stanza_to_the_volvox_config)
- [Add a coverage
  track](#Add_a_coverage_track)
- [Add individual
  reads](#Add_individual_reads)
- [Semantic
  zooming](#Semantic_zooming)
- [Read
  pairs](#Read_pairs)
- [Coloring reads
  according to quality](#Coloring_reads_according_to_quality)

## Create the BAM file

Start with a
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/22/Volvox.sam.gz" class="internal"
title="Volvox.sam.gz">SAM file</a> and save in the GBrowse database
directory for the volvox tutorial. Also make sure that the volvox fasta
file, volvox.fa, is in the directory as well. Alternatively, you can
download this
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/70/Volvox_sam.zip" class="internal"
title="Volvox sam.zip">Volvox_sam.zip</a> file that has a directory with
all of the files in it. Now convert the SAM file to a BAM file and index
it:

     samtools faidx volvox.fa
     samtools import volvox.fa.fai volvox.sam volvox.bam
     samtools sort volvox.bam volvox.sort
     samtools index volvox.sort.bam

## Add a database stanza to the volvox config

The database stanza goes just above the "TRACK DEFAULTS" stanza:

    [samdb:database]
    db_adaptor     = Bio::DB::Sam
    db_args        = -fasta /var/lib/gbrowse2/databases/volvox/volvox.fa
                     -bam  /var/lib/gbrowse2/databases/volvox/volvox.sort.bam
    search options = none

It's not a bad idea to move the data adaptor information from the top of
the conf file (that points at the volvox database directory) down here
and add a database stanza for it as well; though if you do that, you
must also add a `database` line to the TRACK DEFAULTS section that
points at that database name so that the other tracks continue to work.

## Add a coverage track

Now add a stanza that will create a coverage density track.

    [CoverageDensity]
    feature        = coverage
    glyph          = wiggle_density
    database       = samdb
    height         = 20
    bicolor_pivot  = 15
    pos_color      = blue
    neg_color      = red
    key            = Coverage (density)
    category       = Reads
    label          = 0

Note that the value of the `database` is `samdb`, which is the name it
was given in the database stanza above. The `bicolor_pivot` value is the
coverage value below which the density plot will turn red (the
neg_color).

## Add individual reads

This stanza will show the individual reads as glyphs, though there will
be a lot of them:

    [Reads]
    feature        = match
    glyph          = segments
    draw_target    = 1
    show_mismatch  = 1
    mismatch_color = red
    database       = samdb
    bgcolor        = blue
    fgcolor        = white
    height         = 5
    label density  = 50
    bump           = fast
    key            = Reads
    category       = Reads

The `draw_target` option tells the glyph to put the sequence of the read
in the glyph when zoomed in far enough to see it and the `show_mismatch`
option highlights the base in red when it doesn't match the contig
sequence.

Now, the problem with this track is that if you are at a zoom level
higher than a few kb, rendering the track will take a long time (my
laptop can't manage 4kb), so we need a way to turn this track on and off
according to the zoom level. Fortunately, GBrowse has semantic zooming
built in, and so what we'd like is to turn on the coverage glyph when
zoomed out and individual reads when zoomed in.

## Semantic zooming

To use semantic zooming, we give the coverage and read tracks the same
name, and then we add to the coverage track name (the one we want to
appear as we zoom out) the base pair level at which we want it to "turn
on", like this:

    [Reads:1500]
    feature        = coverage
    glyph          = wiggle_density
    database       = samdb
    height         = 20
    bicolor_pivot  = 15
    pos_color      = blue
    neg_color      = red

so that if you look at a range that is 1499 bp wide, you'll see
individual reads, then if you move out a little bit and look at a
segment 1500 bp wide, it will switch to a coverage density plot.

## Read pairs

Bio::DB::Sam tools will also show read pairs matched up. To do this you
use the "read_pair" feature type along with the segments glyph, like
this:

    [Pairs]
    feature        = read_pair
    glyph          = segments
    draw_target    = 1
    show_mismatch  = 1
    mismatch_color = red
    database       = samdb
    bgcolor        = violet
    height         = 5
    label density  = 50
    bump           = fast
    key            = Read pairs
    category       = Reads

    [Pairs:1000]
    feature        = coverage
    glyph          = wiggle_density
    database       = samdb
    height         = 20
    bicolor_pivot  = 15
    pos_color      = purple
    neg_color      = red

## Coloring reads according to quality

With real SAM data, you could color your reads according to the quality
score of the read. Since this tutorial is using fake data with uniform
quality, it is somewhat boring, but if you have your own data, you can
do this for bgcolor:

    bgcolor = sub {
            my $feature = shift;
            my $blueness = 255 - int($feature->qual * 2.40);
            my $colour = chr(35) . sprintf("%X", $blueness) .
                                   sprintf("%X", $blueness) . "FF";
            return $colour;
            }

where the callback will make the feature background more blue the higher
the quality. How do you suppose it does that?

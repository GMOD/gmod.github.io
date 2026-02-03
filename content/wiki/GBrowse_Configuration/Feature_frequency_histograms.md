---
title: "GBrowse Configuration/Feature frequency histograms"
---
# GBrowse Configuration/Feature frequency histograms


This article describes **feature frequency histograms** and how to
configure them in GBrowse.

*For the main GBrowse configuration article, see:
<a href="../GBrowse_Configuration" class="mw-redirect"
title="GBrowse Configuration">GBrowse Configuration</a>.*

## Generating Feature Frequency Histograms

*Note: this applies to GFF2 databases only and needs to be rewritten
slightly for GFF3*

With a little bit of additional effort, you can set one or more tracks
up to display a density histogram of the features contained within the
track. For example, the human data source in the
<a href="http://www.wormbase.org/db/seq/gbrowse/human"
class="external text" rel="nofollow">GBrowse demo</a> uses density
histograms in the chromosomal overview. In addition, when the features
in the SNP track become too dense to view, this track converts into a
histogram. To see this in action, turn on the SNP track and then zoom
out beyond 150K - Link plz?

There are four steps for making histograms:

1.  generate the density data using the `bp_generate_histogram.pl`
    script.
2.  load the density data using `bp_load_gff.pl` or
    `bp_fast_load_gff.pl`.
3.  declare a density aggregator to the gbrowse configuration file
4.  add the density aggregator to the appropriate track in the
    configuration file.

The first step is to generate the density data. Currently this is done
by generating a GFF file containing a set of "bin" feature types. Use
the `bp_generate_histogram.pl` script to do this. You will find it in
[BioPerl](../BioPerl "BioPerl") under the `scripts/Bio-DB-GFF`
directory.

Assuming that your database is named "dicty", you have a feature named
SNP, and you wish to generate a density distribution across 10,000 bp
bins, here is the command you would use:

     bp_generate_histogram.pl -merge -d dicty -bin 10000 SNP >snp_density.gff

This is saying to use the "dicty" database (-d) option, to use 10,000 bp
bins (the -bin option) and to count the occurrences of the SNP feature
throughout the database. In addition, the -merge option says to merge
all types of SNPs into a single bin. Otherwise they will be stratified
by their source. The resulting GFF file contains a series of entries
like these ones:

     Chr1  SNP bin 1     10000 49 + . bin Chr1:SNP
     Chr1  SNP bin 10001 20000 29 + . bin Chr1:SNP

What this is saying is that there are now a series of pseudo-features of
type "bin:SNP" that occupy successive 10,000 bp regions of the genome.
The score field contains the number of times a SNP was seen in that bin.

You'll now load this file using `bp_load_gff.pl` or
`bp_fast_load_gff.pl`:

     bp_load_gff.pl -d dicty snp_density.gff

The next step is to tell GBrowse how to use this information. You do
this by creating a new aggregator for the SNP density information. Open
the GBrowse configuration file and find the aggregators option. Add a
new aggregator that looks like this:

     aggregators = snp_density{bin:SNP}

This is declaring a new feature named "snp_density" that is composed of
subparts of type bin:SNP.

The last step is to declare a track for the density information. You
will use the "xyplot" glyph, which can draw a number of graphs,
including histograms. To add the SNP density information as a static
track in the overview, create a section like this one:

    [SNP:overview]
    feature       = snp_density
    glyph         = xyplot
    graph_type    = boxes
    scale         = right
    bgcolor       = red
    fgcolor       = red
    height        = 20
    key           = SNP Density

This article describes **glyphs** and **glyph configuration options** in
GBrowse.

*For the main GBrowse configuration article, see:
<a href="../GBrowse_Configuration" class="mw-redirect"
title="GBrowse Configuration">GBrowse Configuration</a>.*

  

This is declaring a new constant track in the overview named "SNP
Density." The feature is "snp_density", corresponding to the aggregator
declared earlier. The glyph is "xyplot" using the graph type of "boxes"
to generate a column graph.

To set up a track so that the histogram appears when the user zooms out
beyond 100,000 bp but shows the detailed information at higher
magnifications, generate two track sections like these:

     [SNPs]
     feature       = snp
     glyph         = triangle
     point         = 1
     orient        = N
     height        = 6
     bgcolor       = blue
     fgcolor       = blue
     key           = SNPs

     [SNPs:100000]
     feature       = snp_density
     glyph         = xyplot
     graph_type    = boxes
     scale         = right

The first track section sets up the defaults for the SNP track. SNPs are
represented as blue triangles pointing North. The second track
declaration declares that when the user zooms out to over 100K base
pairs, GBrowse should display the snp_density feature using the xyplot
glyph.

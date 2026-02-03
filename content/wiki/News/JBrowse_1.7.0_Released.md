---
title: "News/JBrowse 1.7.0 Released"
---
# News/JBrowse 1.7.0 Released

*from Rob Buels, JBrowse developer*

I am pleased to announce the release of JBrowse 1.7.0, which includes a
great many enhancements both large and small. Very exciting!

It can be downloaded from
<a href="http://jbrowse.org/jbrowse-1-7-0/" class="external text"

[JBrowse Configuration
Guide](../JBrowse_Configuration_Guide) for
documentation on how to use the new features.

Firstly, JBrowse can now quickly and efficiently display alignment data
directly from BAM files over the web, with no need for any intermediate
formatting steps. Just put your .bam and .bai files on your web server,
add a few lines of configuration to point JBrowse at them, and go!
Moreover, JBrowse has two new track types optimized for displaying
alignment data: new “Alignments” track type, showing basepair
differences and insertions between aligned reads and the reference
(using a BAM alignment’s MD field), and a new FeatureCoverage track type
that generates a depth-of-coverage plot from a BAM file (or from any
other source of feature data). Many thanks to Thomas Down and his
Dalliance Genome Browser project, from which the JBrowse BAM data
backend was derived.

The second headline feature of this release is long-awaited support for
exporting and saving sequence and annotation data in FASTA, GFF3, bed,
bedGraph, and Wiggle formats. Just turn on the track of interest and
click on its track label to bring up a new menu of things you can do
with that track, one of which is “Save track data”. This has been one of
the top features users have been requesting for a long time, and now
it’s finally here!

Third, we have two important enhancements to JBrowse’s already-excellent
support for BigWig quantitative data: a new Wiggle/Density track type,
analogous to GBrowse’s popular wiggle_density track type, that shows
quantitative data using varying intensity of color. Additionally, the
existing Wiggle/XYPlot supports a new bg_color option that, if set,
provides a background color for all data points in the track, making it
easy to distinguish between regions with no data, and regions with
0-valued data. Many thanks to Steffi Geisen at the University of Granada
for her continued help driving progress on this and many other issues.

For full details, check out the
<a href="http://jbrowse.org/jbrowse-1-7-0/" class="external text"

<a href="http://jbrowse.org/" class="external text"

*Posted to the [GMOD News](../GMOD_News) on 2012/11/05*

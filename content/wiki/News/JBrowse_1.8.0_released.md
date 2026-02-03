---
title: "News/JBrowse 1.8.0 released"
---
# News/JBrowse 1.8.0 released

I am pleased to announce the release of JBrowse 1.8.0, a major new
JBrowse release with some great new features, and lots of smaller
improvements.

It can be downloaded from
<a href="http://jbrowse.org/jbrowse-1-8-0/" class="external free"
rel="nofollow">http://jbrowse.org/jbrowse-1-8-0/</a>.

The number 1 new feature is: JBrowse **can now open local BAM, BigWig,
and GFF3 files** that reside on the user’s computer, without the need to
transfer any data over the network. For example, if a user is viewing a
genome in JBrowse 1.8 at her favorite database website, and she has a
20GB BAM file on her computer for that same genome, she can just open
her local BAM file and view it alongside the data from the website,
without needing to upload the BAM file anywhere. Give this new feature a
try, and let us know how it goes! The File-\>Open dialog works for
remote URLs too, or even mixtures of local files and URLs.

There are also two new track types designed for even better display of
BAM data:

First, there is the **new Alignments2 track type, which is a faster,
\<canvas\>-based track for viewing alignments**, including base-level
indels and mismatches. It is much more performant when viewing very
dense or deep sets of alignments, and is meant to largely replace the
HTML-based Alignments track type that was introduced in JBrowse 1.7.0.

Second, there is a **new SNPCoverage track, that draws the coverage of
alignment features along the genome**, along with a graphical
representation of SNP distribution, and tables showing frequencies for
each SNP. Many thanks to Julien Smith-Roberge, a co-op student at the
Ontario Institute for Cancer Research for the initial implementation of
this!

### SNPCoverage track

![snpcoverage.png](http://jbrowse.org/wordpress/wp-content/uploads/2013/01/snpcoverage.png)

The last headline feature, which will be of interest primarily for
developers, is the introduction of a **new plugin system for JBrowse**.
It’s still a work in progress, the details of the plugin API will
probably not be finalized for a while, but the broad strokes of it are
set out on the JBrowse Plugin API page on the GMOD wiki. If you are
interested in living on the bleeding edge and developing a JBrowse
plugin, contact the gmod-ajax mailing list, or contact me directly.

Happy browsing.  ;-)

Robert Buels
Lead Developer
JBrowse - <a href="http://jbrowse.org" class="external free"
rel="nofollow">http://jbrowse.org</a>



*Posted to the [GMOD News](../GMOD_News) on 2013/01/31*


- [News Items](../Category%253ANews_Items)

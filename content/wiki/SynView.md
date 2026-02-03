---
title: "SynView"
---
# SynView

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b3/SynView_Icon.gif" width="173" height="66"
alt="SynView Icon.gif" />



  Documentation](#Documentation)
  - [Publications](#Publications)
  - [Presentations](#Presentations)
  - [README](#README)

Jessica Kissinger's group at University of Georgia have contributed a
very sophisticated [GBrowse](GBrowse.1 "GBrowse") configuration file
that creates a simple synteny viewer inside of GBrowse, which they have
called SynView. This viewer is in use at
<a href="http://www.plasmodb.org" class="external text"
rel="nofollow">PlasmoDB</a>, and creates views like <a
href="http://plasmodb.org/cgi-bin/gbrowse/plasmodb/?name=Pf3D7_11:1278854..1310722;label=AnnotatedGenes-SyntenySpansVivaxMC-SyntenyGenesVivaxMC-SyntenySpansYoeliiMC-SyntenyGenesYoeliiMC-SyntenySpansChabaudiMC-SyntenyGenesChabaudiMC-SyntenySpansKnowlesiMC-SyntenyGenesKnowlesiMC-SyntenySpansBergheiMC-SyntenyGenesBergheiMC;h_feat=PF11_0344@yellow"
class="external text" rel="nofollow">this one</a>.

SynView is found within the [GBrowse](GBrowse.1 "GBrowse") distribution,
in the gbrowse/contrib/ directory. Also included in the SynView contrib
directory is a GUSdb adaptor for GBrowse, but that is not required for
making SynView work.



## Documentation

See
<a href="http://www.eupathdb.org/apps/SynView/" class="external free"
rel="nofollow">http://www.eupathdb.org/apps/SynView/</a>.

### Publications

- <a
  href="http://bioinformatics.oxfordjournals.org/cgi/content/abstract/22/18/2308"
  class="external text" rel="nofollow">SynView: a GBrowse-compatible
  approach to visualizing comparative genome data</a>

### Presentations

- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/19/SyntenyModeling.pdf" class="internal"
  title="SyntenyModeling.pdf">Modeling and Displaying Synteny w/
  SynView</a> from the [November 2007 GMOD
  Meeting](November_2007_GMOD_Meeting "November 2007 GMOD Meeting").

### README

The files in this directory were supplied by Haiming Wang and Jessica
Kissinger at University of Georgia's Center for Tropical & Emerging
Global Diseases & Department of Genetics. There are two components:

1.  A GUSdb adaptor (DAS::GUS) based on Bio::DB::Das::Chado in this
    distribution. This adaptor is written to be reasonably generic, and
    so it may be possible to use this as a template for creating an
    adaptor for any database.
2.  A sample configuration file (plasmodb.conf) that is similar to what
    drives the synteny tracks in the gbrowse installation at
    <a href="http://www.plasmodb.org/" class="external free"
    rel="nofollow">http://www.plasmodb.org/</a>. For an example of what
    the display looks like, see <a
    href="http://plasmodb.org/cgi-bin/gbrowse/plasmodb/?name=Pf3D7_11_v3:380000..398999&amp;label=Gene-Synteny"
    class="external free"
    rel="nofollow">http://plasmodb.org/cgi-bin/gbrowse/plasmodb/?name=Pf3D7_11_v3:380000..398999&amp;label=Gene-Synteny</a>

This synteny view can use any GBrowse data adaptor, including the
Bio::DB::GFF and memory adaptors. Note that SynView requires
Tie::IxHash.

An example dataset is also included in the MAL11 directory; this
directory contains a GFF3 file, fasta file and a GBrowse configuration
file set up to use the memory adaptor.

This of course is a very brief introduction to SynView, for more
information, please see
<a href="http://www.eupathdb.org/apps/SynView/" class="external free"
rel="nofollow">http://www.eupathdb.org/apps/SynView/</a>, contact
Jessica or Haiming, or see their paper in Bioinformatics:

Wang, H., Su, Y., Mackey, A., Kraemer, E., and \*Kissinger, J.C.\*
(2006) SynView: A GBrowse-compatible Approach to Visualizing Comparative
Genome Data. Bioinformatics 22(18), 2308-2309

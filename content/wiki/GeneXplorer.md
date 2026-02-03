---
title: "GeneXplorer"
---
# GeneXplorer

GeneXplorer is a web application that allows clustered
 data to be
browsed interactively via the web, and can be used either for research
purposes, or for providing web supplements to accompany microarray
publication.

  Status](#Status)
- [Demo &
  Screenshots](#Demo_.26_Screenshots)
- [Requirements](#Requirements)
- [Documentation](#Documentation)
- [Contact](#Contact)
- [Downloads](#Downloads)

## Status

GeneXplorer is still actively supported (see [Contact](#Contact) below),
but as of January 2009, we are not developing any new features for it.
One thing that we may consider in the future is allowing it to use the
"extended pcl" file, which allows arbitrary numbers of columns of
annotation, as we are trying to do this throughout our microarray
infrastructure.

## Demo & Screenshots

GeneXplorer has been used to provide several web supplements for papers
arising from data in the Stanford Microarray Database. As an example,
see:

<a
href="http://microarray-pubs.stanford.edu/cgi-bin/gx?n=prostate1&amp;rx=5"
class="external text" rel="nofollow">J Lapointe, C Li, JP Higgins, M van
de Rijn, E Bair, K Montgomery, M Ferrari, L Egevad, W Rayford, U
Bergerheim, et al: Gene expression profiling identifies clinically
relevant subtypes of prostate cancer. Proc Natl Acad Sci U S A 2004,
101:811-6.</a>

It has been published in:

<a href="http://www.biomedcentral.com/1471-2105/5/141"
class="external text" rel="nofollow">Rees CA, Demeter J, Matese JC,
Botstein D, Sherlock G. (2004). GeneXplorer: an interactive web
application for microarray data visualization and analysis. <em>BMC
Bioinformatics</em> <strong>5</strong>:141</a>

## Requirements

GeneXplorer is written in Perl, and thus requires a system that is
capable of running Perl. GeneXplorer also requires the following Perl
modules:

- <a href="http://search.cpan.org/dist/GD/" class="external text"
  rel="nofollow">GD</a>
- <a href="http://search.cpan.org/dist/Getopt-Long/" class="external text"
  rel="nofollow">Getopt::Long</a>

In addition, GeneXplorer requires the C-program, correlations, which is
included in the distribution. This must be compiled with an ANSI
compatible compiler, such as
<a href="http://gcc.gnu.org/" class="external text"

The Clustered datafiles must be created using a clustering program that
produces files in the
<a href="http://smd.stanford.edu/help/formats.shtml#cdt#cdt"
class="external text" rel="nofollow">cdt format</a>. Such software
includes Mike Eisen's
<a href="http://rana.lbl.gov/EisenSoftware.htm" class="external text"

<a href="http://genetics.stanford.edu/~sherlock/cluster.html"
class="external text" rel="nofollow">XCluster</a>.

## Documentation

See the README file at the download site (see below).

## Contact

<a href="mailto:sherlock@genome.stanford.edu" class="external text"

## Downloads

GeneXplorer is freely available under the MIT license from
<a href="http://search.cpan.org/dist/Microarray-GeneXplorer/"
class="external text" rel="nofollow">CPAN</a>.

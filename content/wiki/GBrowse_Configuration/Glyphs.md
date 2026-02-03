---
title: "GBrowse Configuration/Glyphs"
---
# GBrowse Configuration/Glyphs


This article describes **glyphs** and **glyph configuration options** in
GBrowse.

- *For the main GBrowse configuration article, see:
  <a href="../GBrowse_Configuration" class="mw-redirect"
  title="GBrowse Configuration">GBrowse Configuration</a>.*
- *See also: [Glyphs and Glyph
  Options](../Glyphs_and_Glyph_Options "Glyphs and Glyph Options"), a
  competing document.*
- *See also: <a href="http://webgbrowse.cgb.indiana.edu/glyphdoc.html"
  class="external text" rel="nofollow">The Glyph Gallery</a> at
  webgbrowse.*

  

## Glyphs and Glyph Options

A large variety of glyphs are available, and more are being added as the
<a href="http://search.cpan.org/~lds/Bio-Graphics/"
class="external text" rel="nofollow">Bio::Graphics module</a> grows.

A list of the common glyphs and their options is provided by the GBrowse
itself. Click on the "\[Help\]" link in the section labeled "Upload your
own annotations". This page also lists the valid foreground and
background colors. Most of the glyphs are found in the BioPerl
distribution, but a few are distributed directly with GBrowse.

Predefined glyphs are:

| Glyph | Description |
|----|----|
| <a href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph"
class="extiw" title="bp:Module:Bio::Graphics::Glyph">Glyph</a> | Common options for all glyphs. (*Glyph* is the parent class of all the glyphs). |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::allele_tower"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::allele tower">allele_tower</a> | genotype found at a SNP position |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::anchored_arrow"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::anchored arrow">anchored_arrow</a> | a span with vertical bases \|-----\|. If one or the other end of the feature is off-screen, the base will be replaced by an arrow. |
| <a href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::arrow"
class="extiw" title="bp:Module:Bio::Graphics::Glyph::arrow">arrow</a> | an arrow |
| <a href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::box"
class="extiw" title="bp:Module:Bio::Graphics::Glyph::box">box</a> | another rectangle; doesn't show subparts of features |
| <a href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::cds"
class="extiw" title="bp:Module:Bio::Graphics::Glyph::cds">cds</a> | shows the reading frame of spliced transcripts; used in conjunction with the "coding" aggregator ([GFF2](../GFF2 "GFF2")). |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::crossbox"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::crossbox">crossbox</a> |  |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::diamond"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::diamond">diamond</a> | a point-like feature represented as a triangle |
| <a href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::dna"
class="extiw" title="bp:Module:Bio::Graphics::Glyph::dna">dna</a> | DNA and GC content |
| <a href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::dot"
class="extiw" title="bp:Module:Bio::Graphics::Glyph::dot">dot</a> |  |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::ellipse"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::ellipse">ellipse</a> |  |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::extending_arrow"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::extending arrow">extending_arrow</a> |  |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::generic"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::generic">generic</a> | a rectangle |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::graded_segments"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::graded segments">graded_segments</a> |  |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::heterogeneous_segments"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::heterogeneous segments">heterogeneous_segments</a> | a multi-segmented feature in which each segment can have a distinctive color. For Jim Kent's WABA features, this works with the waba_alignment aggregator. |
| idiogram | This takes specially-formatted feature data and turns it into an idiogram of a Giemsa-stained metaphase chromosome. (This is included in the GBrowse distribution, not in BioPerl.) |
| <a href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::image"
class="extiw" title="bp:Module:Bio::Graphics::Glyph::image">image</a> | this embeds photographic images and/or diagrams on features processed_transcript multi-purpose representation of a spliced mRNA, including positions of UTRs |
| <a href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::line"
class="extiw" title="bp:Module:Bio::Graphics::Glyph::line">line</a> |  |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::primers"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::primers">primers</a> |  |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::processed_transcript"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::processed transcript">processed_transcript</a> |  |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::rndrect"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::rndrect">rndrect</a> |  |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::ruler_arrow"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::ruler arrow">ruler_arrow</a> |  |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::segments"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::segments">segments</a> | a multi-segmented feature such as an alignment |
| <a href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::span"
class="extiw" title="bp:Module:Bio::Graphics::Glyph::span">span</a> | like anchored_arrow, except that the ends are truncated at the edge of the panel, not turned into an arrow |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::toomany"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::toomany">toomany</a> |  |
| trace | reads an SCF trace file and draws a graphic representation |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::transcript"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::transcript">transcript</a> | a gene model |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::transcript2"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::transcript2">transcript2</a> | a slightly different representation of a gene model |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::translation"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::translation">translation</a> | 1-, 3- and 6-frame translations |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::triangle"
class="extiw"
title="bp:Module:Bio::Graphics::Glyph::triangle">triangle</a> | a point-like feature represented as a diamond |
| wormbase_transcript | yet another gene model that can show UTR segments (for features that conform to the WormBase gene schema). Used in conjunction with the "wormbase_gene" aggregator ([GFF2](../GFF2 "GFF2")). |
| <a
href="http://search.cpan.org/~lds/Bio-Graphics/lib/Bio/Graphics/Glyph/wiggle_density.pm"
class="external text" rel="nofollow">wiggle_density</a> | Quantitative information from wiggle files (.wig) shown as color intensity. See [GBrowse/Uploading Wiggle Tracks](../GBrowse/Uploading_Wiggle_Tracks "GBrowse/Uploading Wiggle Tracks"). |
| <a
href="http://search.cpan.org/~lds/Bio-Graphics/lib/Bio/Graphics/Glyph/wiggle_xyplot.pm"
class="external text" rel="nofollow">wiggle_xyplot</a> | Quantitative information from wiggle files shown as an xyplot. |
| <a
href="http://www.bioperl.org/wiki/Module:Bio::Graphics::Glyph::xyplot"
class="extiw" title="bp:Module:Bio::Graphics::Glyph::xyplot">xyplot</a> | histograms and line plots |

A more definitive list of glyph options can be found in the
Bio::Graphics manual pages. Consult the manual pages for the following
modules:

  
The "perldoc" command is handy for reading the documentation from the
Unix command line. For example:

      perldoc Bio::Graphics::Glyph::primers

This will provide you with a summary of the options that apply to the
"primers" glyph.

In the manual pages, the glyph options are presented the way they are
called from Perl. For example, the documentation will tell you to use
the -connect_color option to set the color to use when drawing the line
that connects the two inward pointing arrows in the primer pair glyph.
This translates to the configuration file as an option named
"connect_color". For example:

    [PCR Products]
    glyph = primer
    connect_color = blue

When referring to colors, you can use a variety of color names such as
"blue" and "green". To get the full list, cut and paste the following
magic incantation into the command line:

    perl -MBio::Graphics::Panel -e 'print join "\n",Bio::Graphics::Panel->color_names'

or see this URL:

     http://www.wormbase.org/db/seq/gbrowse?help=annotation

Alternatively, you can use the \#RRGGBB notation to specify the red,
green and blue components of the color. Refer to any book on HTML for
the details on using the notation.

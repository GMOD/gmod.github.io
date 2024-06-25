<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">GBrowse Configuration/Glyphs</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

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

  

## <span id="Glyphs_and_Glyph_Options" class="mw-headline">Glyphs and Glyph Options</span>

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

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=GBrowse_Configuration/Glyphs&oldid=24473>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](../Special:Categories "Special:Categories"):

- [HOWTO](../Category:HOWTO "Category:HOWTO")
- [Configuration](../Category:Configuration "Category:Configuration")
- [GBrowse](../Category:GBrowse "Category:GBrowse")

</div>

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">

<div id="p-personal" role="navigation"
aria-labelledby="p-personal-label">

### Personal tools

- <span id="pt-login"><a
  href="http://gmod.org/mediawiki/index.php?title=Special:UserLogin&amp;returnto=GBrowse+Configuration%2FGlyphs"
  accesskey="o"
  title="You are encouraged to log in; however, it is not mandatory [o]">Log
  in / create account</a></span>

</div>

<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces

- <span id="ca-nstab-main"><a href="Glyphs" accesskey="c"
  title="View the content page [c]">Page</a></span>
- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:GBrowse_Configuration/Glyphs&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>

<div id="right-navigation">

<div id="p-views" class="vectorTabs" role="navigation"
aria-labelledby="p-views-label">

### Views

- <span id="ca-view">[Read](Glyphs)</span>
- <span id="ca-viewsource"><a
  href="http://gmod.org/mediawiki/index.php?title=GBrowse_Configuration/Glyphs&amp;action=edit"
  accesskey="e" title="This page is protected.
  You can view its source [e]">View source</a></span>
- <span id="ca-history"><a
  href="http://gmod.org/mediawiki/index.php?title=GBrowse_Configuration/Glyphs&amp;action=history"
  accesskey="h" title="Past revisions of this page [h]">View history</a></span>

</div>

<div id="p-cactions" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-cactions-label">

### Actions[](#)

<div class="menu">

</div>

</div>

<div id="p-search" role="search">

### Search

<div id="simpleSearch">

</div>

</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category:FAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category:HOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">

- <span id="t-whatlinkshere"><a href="../Special:WhatLinksHere/GBrowse_Configuration/Glyphs"
  accesskey="j" title="A list of all wiki pages that link here [j]">What
  links here</a></span>
- <span id="t-recentchangeslinked"><a href="../Special:RecentChangesLinked/GBrowse_Configuration/Glyphs"
  accesskey="k"
  title="Recent changes in pages linked from this page [k]">Related
  changes</a></span>
- <span id="t-specialpages"><a href="../Special:SpecialPages" accesskey="q"
  title="A list of all special pages [q]">Special pages</a></span>
- <span id="t-print"><a
  href="http://gmod.org/mediawiki/index.php?title=GBrowse_Configuration/Glyphs&amp;printable=yes"
  rel="alternate" accesskey="p"
  title="Printable version of this page [p]">Printable version</a></span>
- <span id="t-permalink">[Permanent
  link](http://gmod.org/mediawiki/index.php?title=GBrowse_Configuration/Glyphs&oldid=24473 "Permanent link to this revision of the page")</span>
- <span id="t-info">[Page
  information](http://gmod.org/mediawiki/index.php?title=GBrowse_Configuration/Glyphs&action=info)</span>
- <span id="t-smwbrowselink"><a href="../Special:Browse/GBrowse_Configuration-2FGlyphs"
  rel="smw-browse">Browse properties</a></span>
- <span id="t-pdf">[Print as
  PDF](http://gmod.org/mediawiki/index.php?title=Special:PdfPrint&page=GBrowse_Configuration/Glyphs)</span>

</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 18:49 on 4 September
  2013.</span>
- <span id="footer-info-viewcount">35,212 page views.</span>
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](../GMOD:About "GMOD:About")</span>

<!-- -->

- <span id="footer-copyrightico">[<img src="http://www.gnu.org/graphics/gfdl-logo-small.png" width="88"
  height="31" alt="a GNU Free Documentation License" />](http://www.gnu.org/licenses/fdl-1.3.html)</span>
- <span id="footer-poweredbyico">[<img
  src="../../mediawiki/skins/common/images/poweredby_mediawiki_88x31.png"
  width="88" height="31" alt="Powered by MediaWiki" />](http://www.mediawiki.org/)
  [<img
  src="../../mediawiki/extensions/SemanticMediaWiki/resources/images/smw_button.png"
  width="88" height="31" alt="Powered by Semantic MediaWiki" />](https://www.semantic-mediawiki.org/wiki/Semantic_MediaWiki)</span>

<div style="clear:both">

</div>

</div>

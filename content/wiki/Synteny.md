---
title: "Comparative Genomics"
---




<span id="top"></span>




# <span dir="auto">Comparative Genomics</span>





(Redirected from
[Synteny](Synteny)





GMOD includes several components for managing and visualizing
[comparative genomics and
synteny](Category%253AComparative_Genomics "Category%253AComparative Genomics")
data.


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
- [<span class="tocnumber">2</span> <span class="toctext">Presentations
  and Posters</span>](#Presentations_and_Posters)
- [<span class="tocnumber">3</span> <span class="toctext">GMOD
  Components</span>](#GMOD_Components)
  - [<span class="tocnumber">3.1</span>
    <span class="toctext">CMap</span>](#CMap)
  - [<span class="tocnumber">3.2</span>
    <span class="toctext">GBrowse_syn</span>](#GBrowse_syn)
  - [<span class="tocnumber">3.3</span>
    <span class="toctext">Sybil</span>](#Sybil)
  - [<span class="tocnumber">3.4</span>
    <span class="toctext">SynView</span>](#SynView)



## <span id="Introduction" class="mw-headline">Introduction</span>

[Comparative
genomics](Category%253AComparative_Genomics "Category%253AComparative Genomics")
and synteny are hot topics in biology and are frequently discussed at
GMOD [Meetings](Meetings "Meetings"). GMOD offers several solutions for
managing and [visualizing](Visualization "Visualization") comparative
genomics data.

## <span id="Presentations_and_Posters" class="mw-headline">Presentations and Posters</span>

- **<a
  href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/cf/GMODToolsForComparativeGenomicsIGERTPoster.pdf"
  class="internal"
  title="GMODToolsForComparativeGenomicsIGERTPoster.pdf">GMOD Tools for
  Comparative Genomics</a>** - Poster about the tools described on this
  page.
- **<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/19/SyntenyModeling.pdf" class="internal"
  title="SyntenyModeling.pdf">Modeling and Displaying Synteny w/
  SynView</a>** - presented by Steve Fischer at the [November 2007 GMOD
  Meeting](November_2007_GMOD_Meeting "November 2007 GMOD Meeting"), is
  a good overview of many issues encountered when displaying synteny.
- **<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d1/BoG2006.pdf" class="internal"
  title="BoG2006.pdf">An Example Comparative Genome Database for Yeasts
  Using GMOD Tools</a>** - poster by [Scott
  Cain](User%253AScott "User%253AScott") showing how six GMOD tools are used to
  create an example comparative genome model organism database.
- **<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/61/04-Stajich_NESCENT_GMOD.pdf"
  class="internal" title="04-Stajich NESCENT GMOD.pdf">Comparative
  Genomics With GMOD and BioPerl</a>** - a 2004 presentation by [Jason
  Stajich](User%253AStajich "User%253AStajich").

## <span id="GMOD_Components" class="mw-headline">GMOD Components</span>

### <span id="CMap" class="mw-headline">CMap</span>

[CMap](CMap.1 "CMap") is a web-based tool that allows users to view
comparisons of a wide variety of data including genetic maps, physical
maps, sequence assemblies, QTL and deletion maps. Unlike the other tools
listed here, it does not require sequence data.

CMap can display correspondences between features such as markers, HSPs
or any other annotation. The distribution comes with tools for creating
these correspondences based on feature names or correspondences can be
imported directly. CMap can display correspondences as either lines or
ribbons.

See [CMap](CMap.1 "CMap") for more.

### <span id="GBrowse_syn" class="mw-headline">GBrowse_syn</span>






GBrowse_syn, as implemented at WormBase




[GBrowse_syn](GBrowse_syn.1 "GBrowse syn"), or the Generic Synteny
Browser, is a [GBrowse](GBrowse.1 "GBrowse")-based
<a href="Synteny" class="mw-redirect" title="Synteny">synteny</a>
browser designed to display multiple genomes, with a central reference
species compared to two or more additional species.  It can be used to
view multiple sequence alignment data, synteny or co-linearity data from
other sources against genome annotations provided by GBrowse.
GBrowse_syn is included with the standard GBrowse package (version 1.69
and later).  Working examples can be seen at <a
href="http://www.arabidopsis.org/cgi-bin/gbrowse_syn/arabidopsis/?name=Chr1%253A8367000..8370501"
class="external text" rel="nofollow">TAIR</a>, <span class="pops"><a
href="http://dev.wormbase.org/db/seq/gbrowse_syn/compara?search_src=Cele;name=X:1050001..1150000"
class="external text" rel="nofollow">WormBase</a></span>, and
<a href="http://solgenomics.net/gbrowse2/bin/gbrowse_syn/sol3/"
class="external text" rel="nofollow">SGN</a>.

### <span id="Sybil" class="mw-headline">Sybil</span>

[Sybil](Sybil "Sybil") is a web-based system for comparative genomics
visualizations. It is currently developed by engineers at
<a href="http://jcvi.org" class="external text" rel="nofollow">JCVI</a>
and at <a href="http://medschool.umaryland.edu" class="external text"
rel="nofollow">IGS at the University of Maryland School of Medicine</a>.
Sybil supports several visualizations: Whole genome comparisons,
regional comparisons (synteny) and orthologous gene comparisons.

See the
[Sybil/IGS](Chado_Comparative_Schema#Sybil.2FIGS "Chado Comparative Schema")
section of the [Chado Comparative
Schema](Chado_Comparative_Schema "Chado Comparative Schema") page for
how Sybil represents syntenic data in
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>.

### <span id="SynView" class="mw-headline">SynView</span>

[SynView](SynView "SynView") displays synteny at the region and/or gene
level. Users select a reference genome and then synteny with other
selected genomes is displayed relative to that genome. SynView is based
on [GBrowse](GBrowse.1 "GBrowse"). It can be layered on top of an
existing GBrowse instance and uses the full range of GBrowse's display
and configuration options. SynView is included in the GBrowse
distribution.




[Category](Special%253ACategories "Special%253ACategories"):

- [Comparative
  Genomics](Category%253AComparative_Genomics "Category%253AComparative Genomics")






## Navigation menu









### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>




### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Comparative_Genomics" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:26 on 2 November
  2009.</span>
<!-- - <span id="footer-info-viewcount">82,474 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





---
title: "Comparative Genomics"
---
# Comparative Genomics

(Redirected from
[Synteny](/wiki/Synteny)

GMOD includes several components for managing and visualizing

data.

 Introduction](#Introduction)
- [Presentations
 and Posters](#Presentations_and_Posters)
- [GMOD
 Components](#GMOD_Components)
 - [CMap](#CMap)
 - [GBrowse_syn](#GBrowse_syn)
 - [Sybil](#Sybil)
 - [SynView](#SynView)

## Introduction

and synteny are hot topics in biology and are frequently discussed at
GMOD [Meetings](/wiki/Meetings). GMOD offers several solutions for
managing and [visualizing](/wiki/Visualization) comparative
genomics data.

## Presentations and Posters

- **<a
 href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/cf/GMODToolsForComparativeGenomicsIGERTPoster.pdf"
 class="internal"
 title="GMODToolsForComparativeGenomicsIGERTPoster.pdf">GMOD Tools for
 Comparative Genomics</a>** - Poster about the tools described on this
 page.
- **<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/19/SyntenyModeling.pdf" class="internal"
 title="SyntenyModeling.pdf">Modeling and Displaying Synteny w/
 SynView</a>** - presented by Steve Fischer at the [November 2007 GMOD
 Meeting](/wiki/November_2007_GMOD_Meeting), is
 a good overview of many issues encountered when displaying synteny.
- **<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d1/BoG2006.pdf" class="internal"
 title="BoG2006.pdf">An Example Comparative Genome Database for Yeasts
 Using GMOD Tools</a>** - poster by Scott
 Cain showing how six GMOD tools are used to
 create an example comparative genome model organism database.
- **<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/61/04-Stajich_NESCENT_GMOD.pdf"
 class="internal" title="04-Stajich NESCENT GMOD.pdf">Comparative
 Genomics With GMOD and BioPerl</a>** - a 2004 presentation by Jason
 Stajich.

## GMOD Components

### CMap

[CMap](/wiki/CMap) is a web-based tool that allows users to view
comparisons of a wide variety of data including genetic maps, physical
maps, sequence assemblies, QTL and deletion maps. Unlike the other tools
listed here, it does not require sequence data.

CMap can display correspondences between features such as markers, HSPs
or any other annotation. The distribution comes with tools for creating
these correspondences based on feature names or correspondences can be
imported directly. CMap can display correspondences as either lines or
ribbons.

See [CMap](/wiki/CMap) for more.

### GBrowse_syn

GBrowse_syn, as implemented at WormBase

[GBrowse_syn](/wiki/GBrowse_syn), or the Generic Synteny
Browser, is a [GBrowse](/wiki/GBrowse)-based
<a href="/wiki/Synteny" class="mw-redirect" title="Synteny">synteny</a>
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

### Sybil

[Sybil](/wiki/Sybil) is a web-based system for comparative genomics
visualizations. It is currently developed by engineers at
<a href="http://jcvi.org" class="external text" rel="nofollow">JCVI</a>
and at <a href="http://medschool.umaryland.edu" class="external text"

Sybil supports several visualizations: Whole genome comparisons,
regional comparisons (synteny) and orthologous gene comparisons.

See the
[Sybil/IGS](/wiki/Chado_Comparative_Schema#Sybil.2FIGS)
section of the [Chado Comparative
Schema](/wiki/Chado_Comparative_Schema) page for
how Sybil represents syntenic data in
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>.

### SynView

[SynView](/wiki/SynView) displays synteny at the region and/or gene
level. Users select a reference genome and then synteny with other
selected genomes is displayed relative to that genome. SynView is based
on [GBrowse](/wiki/GBrowse). It can be layered on top of an
existing GBrowse instance and uses the full range of GBrowse's display
and configuration options. SynView is included in the GBrowse
distribution.

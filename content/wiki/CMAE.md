---
title: "CMAE"
---
# CMAE

> The item described in this page is not (or is no longer) supported by
> the GMOD project.
> This page is included only for reference purposes.

Work on CMAE was started, but never completed.

The [CMap](/wiki/CMap.1) Assembly Editor (CMAE) is a desktop
application that is being developed to assist in visualizing and editing
large scale sequence assemblies for the maize sequencing project. Using
the [CMap](/wiki/CMap.1) comparative mapping database, CMAE allows
sequence assemblies to be superimposed on top of diverse other types of
mapping data, allowing the finisher to view assemblies in the context of
a cascade of mapping data at a variety of resolutions. For example, the
editor can show sequence contigs aligned to fingerprinted physical map
contigs, which are aligned in turn to genetic maps. Correspondence links
between the different objects indicate the quality of the assembly and
highlight possible mis-assemblies. The editor will then allow
mis-assembled contigs to be split, merged or moved, or the troubled
contigs can be exported to a more specialized program. (L. Stein)

  Requirements](#Requirements)
- [Documentation](#Documentation)
- [Screenshots](#Screenshots)
- [Code](#Code)
- [Mailing
  List](#Mailing_List)
- [Contact](#Contact)

## Requirements

- [CMap](/wiki/CMap.1)
- <a href="http://www.perltk.org/" class="external text"
  rel="nofollow">Perl/Tk</a>
- <a href="http://www.tkzinc.org/tkzinc/index.php" class="external text"
  rel="nofollow">Tkzinc</a>

## Documentation

- [Integrating_CMAE](/wiki/Integrating_CMAE) (<a
  href="http://gmod.cvs.sourceforge.net/gmod/cmap/editor/Integrating_CMAE.pod?view=markup"
  class="external text" rel="nofollow">CVS</a>)
- [CMap_API](/wiki/CMap_API) (<a
  href="http://gmod.cvs.sourceforge.net/gmod/cmap/docs/CMAP_API.pod?view=markup"
  class="external text" rel="nofollow">CVS</a>)

## Screenshots

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a1/CMAE_Screenshot1.png" width="700"
height="492" alt="CMAE Screenshot1.png" />

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a4/CMAE_Screenshot2.png" width="600"
height="471" alt="CMAE Screenshot2.png" />

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5f/CMAE_Screenshot3.png" width="700"
height="384" alt="CMAE Screenshot3.png" />

## Code

The CMAE code is located in the SourceForge CVS repository for CMap.

- <a href="http://gmod.cvs.sourceforge.net/gmod/cmap/"
  class="external text" rel="nofollow">CMap CVS</a>

The CMAE specific information is located in the "editor" directory.

- <a href="http://gmod.cvs.sourceforge.net/gmod/cmap/editor/"
  class="external text" rel="nofollow">CMap/editor CVS</a>

## Mailing List

- gmod-cmae@lists.sourceforge.net: Discussion of development,
  installation problems, etc.

## Contact

- [Ben Faga](/wiki/User%3AFaga)

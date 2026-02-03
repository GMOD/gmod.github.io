---
title: "News/CMap 1.01 Released"
---
# News/CMap 1.01 Released

Version 1.01 of [CMap](../CMap.1) has been released.

I'm quite excited about using [GFF3](../GFF3) for data
import/export which is possible with this release.

You can get the new version from SourceForge, <a
href="http://sourceforge.net/project/showfiles.php?group_id=27707&amp;package_id=55129"

Highlights of this release are:

- Added a GFF3 parser and producer for easier and more complete data
  import and export (requires latest version of
  [bioperl-live](../BioPerl) to import GFF).
- Added a module to serve data to
  <a href="http://acpfg.imb.uq.edu.au/cmap3d.php" class="external text"
  rel="nofollow">CMap3D</a>, a 3D viewer being developed by Chris Duran
  and Dave Edwards.

If you have any questions, please
<a href="mailto:faga@cshl.edu" class="external text" rel="nofollow">let
me know</a>.

This is only an incremental update. For anyone who installed [version
1.0](#CMap_1.0_Released), simply download the new release and run

    perl Build.PL; ./Build; sudo ./Build install

No updates to the database or config files are needed.

If you are updating from an older version, see the documentation in the
`upgrade/` directory included in the package.

[Ben](../User:Faga)

*Posted to the [GMOD News](../GMOD_News) on 2008/07/01*

- [News Items](../Category:News_Items)

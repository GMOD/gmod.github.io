---
title: "News/GBrowse 1.70 Released"
---
# News/GBrowse 1.70 Released

Hello,

I am pleased to announce the official release of
[GBrowse](../GBrowse.1) 1.70. This is a bug fix release for
GBrowse 1.69. It introduces no new functionality to the GBrowse portion
of the application, however,
[GBrowse_syn](../GBrowse_syn.1) is considerably improved
along with [documentation](../GBrowse_syn.1) and a
<a href="../GBrowse_syn_Tutorial" class="mw-redirect"
title="GBrowse syn Tutorial">tutorial</a>.

There will likely be one more release in the GBrowse 1 development path,
which will introduce improved support for circular genomes. After that,
development on this path will end and further development will focus on
[GBrowse 2](../Category:GBrowse_2).

GBrowse can be installed with the [GBrowse
netinstaller](../GBrowse_Install_HOWTO).

GBrowse 1.70 can be <a
href="http://sourceforge.net/projects/gmod/files/Generic%20Genome%20Browser/GBrowse-1.70/Generic-Genome-Browser-1.70.tar.gz/download"
class="external text" rel="nofollow">downloaded directly from
SourceForge</a>.

A big thanks to [Lincoln Stein](../User:Lstein), the lead
developer of GBrowse, [Sheldon McKay](../User:Mckays), the
developer of GBrowse_syn, and all of the GBrowse users who debug and
provide help on the [GBrowse mailing
list](../GMOD_Mailing_Lists).

Changes from 1.69 to 1.70:

- Bug fixes for the Chado adapter, including improving wildcard
  searching and fixing a bug that caused ALL features on a reference
  sequence to be returned when the segment was at the beginning of the
  reference sequence.
- Fixed [Galaxy](../Galaxy.1) support bug which caused
  prevented features from multiple tracks being selected.
- Fixed problem with feature highlighting which caused highlighting to
  get "stuck"on beige.
- Removed annoying debugging statements from log files
- Fixed character encoding issues for onClick popup balloons
- Killed annoying "missing path" warning on windows systems
- Fixed issue in which the selected region shown in the overview is
  offset from true region.
- Silenced log file warnings when inkscape isn't present.
- Added "merge searches" option to turn merging of similarly-named
  features on and off.
- Moved Bio::DB::Das::Chado and Bio::DB::BioSQL to their own packages
  and out of the GBrowse distribution so they can be updated
  independently via CPAN
- Fixed encoding of version number at the bottom of the page.
- Made the <a href="../DAS" class="mw-redirect" title="DAS">DAS</a>
  script compatible with DAS Registry

[Scott](../User:Scott)

*Posted to the [GMOD News](../GMOD_News) on 2009/08/24*

- [News Items](../Category:News_Items)

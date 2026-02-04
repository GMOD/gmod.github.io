---
title: "News/Chado 1.11 Release"
---
# News/Chado 1.11 Release

I am pleased to announce the <a
href="https://sourceforge.net/projects/gmod/files/gmod/chado-1.11/chado-1.11.tar.gz/download"
class="external text" rel="nofollow">1.11 release of Chado</a>, the GMOD
schema and related tools. The file can be downloaded from <a
href="https://sourceforge.net/projects/gmod/files/gmod/chado-1.11/chado-1.11.tar.gz/download"
class="external text" rel="nofollow">SourceForge</a>

In this release, the schema itself has not changed since the 1.1 release
in May of this year, but there have been bug fixes (see <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/schema/tags/chado-1.11/chado/Changes?revision=23640&amp;view=markup"
class="external text" rel="nofollow">release notes</a>; thanks to [Naama
Menda](../User:NaamaMenda) for those fixes) and one
added functionality to the materialized view tool. This functionality
was required to support full text searching that will be included in the
up coming release of the
<a href="../Chado" class="mw-redirect" title="Chado">Chado</a> [GBrowse
adaptor](../GBrowse_Adaptors),
<a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a>.

Also note that the name of the release has changed: previously, releases
of the <a href="../Chado" class="mw-redirect" title="Chado">Chado</a>
schema were called "gmod" (gmod-0.003, gmod-1.0, and gmod-1.1), but that
led to a couple of different kinds of confusion, so with this release
going forward, the releases will be called "chado-\*".

Since the schema didn't change, if you already have a 1.1 schema and
want the bug fixes and added functionality, all you need to do for
installation is to go up to the install step and stop there, i.e.:

 perl Makefile.PL
 make
 sudo make install

Happy *GMODing* and please direct questions about this release to the
<a href="https://lists.sourceforge.net/lists/listinfo/gmod-schema"
class="external text" rel="nofollow">schema mailing list</a>,

[Scott Cain](../User:Scott)

*Posted to the [GMOD News](../GMOD_News) on 2010/08/06*

- [News Items](../Category:News_Items)

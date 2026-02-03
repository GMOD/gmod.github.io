---
title: "News/Chado 1.11 Release"
---




<span id="top"></span>




# <span dir="auto">News/Chado 1.11 Release</span>









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
Menda](../User%253ANaamaMenda "User%253ANaamaMenda") for those fixes) and one
added functionality to the materialized view tool. This functionality
was required to support full text searching that will be included in the
up coming release of the
<a href="../Chado" class="mw-redirect" title="Chado">Chado</a> [GBrowse
adaptor](../GBrowse_Adaptors "GBrowse Adaptors"),
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

[Scott Cain](../User%253AScott "User%253AScott")

  



*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2010/08/06*






[Category](../Special%253ACategories "Special%253ACategories"):

- [News Items](../Category%253ANews_Items "Category%253ANews Items")






## Navigation menu







<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>


### Navigation



- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>




### Documentation



- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/News-2FChado_1.11_Release"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:20 on 24 January
  2011.</span>
<!-- - <span id="footer-info-viewcount">6,695 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





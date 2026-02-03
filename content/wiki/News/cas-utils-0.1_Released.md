---
title: "News/cas-utils-0.1 Released"
---




<span id="top"></span>




# <span dir="auto">News/cas-utils-0.1 Released</span>









In the wake of the <a href="../GMOD_Summer_School" class="mw-redirect"
title="GMOD Summer School">GMOD Summer School</a> a little over a week
ago, I decided that I should create a release that has the tools that I
used to tie together [GBrowse](../GBrowse.1 "GBrowse"),
[Apollo](../Apollo.1 "Apollo") and
<a href="../Chado" class="mw-redirect" title="Chado">Chado</a>. It can
be downloaded at:

    http://sourceforge.net/project/showfiles.php?group_id=27707&package_id=284978

These utilities consist of 4 main tools:

- A CGI for selecting a region in GBrowse, extracting the data for

that region from Apollo and creating an
[XML](../Glossary#XML "Glossary") file and a Java Webstart (.jnlp) file
for Apollo.

- A CGI for accepting uploads of edited XML files to either be

immediately loaded into Chado or to be held for validation.

- A configuration perl module to make modifying the CGI's behavior easy.
- A Module::Build based installer that queries the user for needed setup
  data.

While this release of cas-utils assumes that the port for connecting to
the database is blocked for outside users, future releases of these
tools could be configured to assume the reverse. Another item planned
for a future release is tools for integrating Chado with a MediaWiki
site for more text-based annotation. Of course, because of the nature of
these tools, it is assumed that several things are already in place and
working:

- Chado with computational analysis and annotation data already loaded.
- GBrowse (either 1.69 (to be released soon) or from the stable cvs
  branch).
- Apollo, both as an installed application (like in /usr/bin), and as

source that has been built into a webstart application and installed for
the web server to use.

If you have questions about either cas-utils or any of the
prerequisites, please send questions to the most appropriate mailing
list:

- Chado:
  <a href="mailto:gmod-schema@lists.sourceforge.net" class="external text"
  rel="nofollow">gmod-schema@lists.sourceforge.net</a>
- GBrowse: <a href="mailto:gmod-gbrowse@lists.sourceforge.net"
  class="external text"
  rel="nofollow">gmod-gbrowse@lists.sourceforge.net</a>
- Apollo: <a href="mailto:apollo@fruitfly.org" class="external text"
  rel="nofollow">apollo@fruitfly.org</a>

I've only tested this application on CentOS 4.6 and Ubuntu 8.04, though
there is no reason to believe that this wouldn't work on any Linux and
probably on MacOS as well. I am considerably less sure that this would
work out of the box on Windows, but support for that could probably be
in a future release if the demand is there.

Thanks and happy curating! [Scott Cain](../User%253AScott "User%253AScott")

  



*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2008/07/22*






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

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/News-2Fcas-2Dutils-2D0.1_Released"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:20 on 24 January
  2011.</span>
<!-- - <span id="footer-info-viewcount">6,353 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





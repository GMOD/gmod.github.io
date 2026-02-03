---
title: "News/GBrowse Version 2.40 Released"
---




<span id="top"></span>




# <span dir="auto">News/GBrowse Version 2.40 Released</span>









GBrowse version 2.40 is now available for downloading from <a
href="http://sourceforge.net/projects/gmod/files/Generic%20Genome%20Browser/GBrowse-2.40/GBrowse-2.40.tar.gz/download"
class="external text" rel="nofollow">SourceForge</a> and CPAN.

Here is the recent changelog:

- Quash a few uninitialized variable warnings when bringing up track
  configuration dialog.
- Fix inability to toggle visibility & favorite status of plugin tracks
  from the track titlebar.
- Added caching of inverted configuration file data structure to speed
  up track rendering on really huge configuration files with many
  stanzas. Cache structure is stored in
  /tmp/bio_graphics_ff_cache\_\$UID
- Add ability to save and restore named snapshots of current state.
- Changed behavior of render slave to a prefork model. Activate by
  including PREFORK=5 (or other desired number of servers) in
  /etc/default/gbrowse-slave.
- Added support script for Amazon cloud image: gbrowse_attach_slaves.pl
  creates slave instances for AMI ami-c6ca31af.
- Change default tmpfile location to /var/tmp/gbrowse2 (was
  /tmp/gbrowse2).

The most significant change is actually the third from the top, which
improves speed dramatically when used with data sources that have lots
of complex track definitions.

[Lincoln Stein](../User%253ALstein "User%253ALstein")

  



*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2011/09/30*






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

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/News-2FGBrowse_Version_2.40_Released"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 19:39 on 30 September
  2011.</span>
<!-- - <span id="footer-info-viewcount">6,865 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





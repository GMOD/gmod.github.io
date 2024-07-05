









<span id="top"></span>







# <span dir="auto">GBrowse Run Process</span>





From GMOD









Jump to: [navigation](#mw-navigation), [search](#p-search)





When GBrowse 2.0 is called (at { HTTP_HOST }/cgi-bin/gb2/gbrowse/{
DATABASE }/, where {HTTP_HOST} is the server on which GBrowse resides
and { DATABASE } is the name of the current genomic data set being
viewed) it runs the following process. It is described here for
developers to get used to the structure of the program.

The script that initiates the whole process is <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/cgi-bin/gbrowse?view=markup"
class="external text" rel="nofollow">/cgi-bin/gbrowse</a>. It calls
FastCGI, if applicable and sets the variables there. Then it calls the
following objects:

### <span id="Setting_Globals" class="mw-headline">Setting Globals</span>

Then it initiates the **globals** object (containing the config details)
by calling Bio::Graphics::Browser2-\>open_globals(), which calls the
new() constructor.

### <span id="Render" class="mw-headline">Render</span>

Lastly, it creates a new rendering process with
Bio::Graphics::Browser2::Render::HTML-\>new(\$globals), and then run()s
it.





Retrieved from
"<http://gmod.org/mediawiki/index.php?title=GBrowse_Run_Process&oldid=13737>"







[Category](Special%3ACategories "Special%3ACategories"):

- [GBrowse
  Developer](Category%3AGBrowse_Developer "Category%3AGBrowse Developer")















## Navigation menu









### Namespaces


- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk%3AGBrowse_Run_Process&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>





### 

### Variants[](#)























<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>





### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>







### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%3AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%3AHOWTO)</span>
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




- <span id="t-smwbrowselink"><a href="Special%3ABrowse/GBrowse_Run_Process" rel="smw-browse">Browse
  properties</a></span>












- <span id="footer-info-lastmod">Last updated at 19:11 on 22 July
  2010.</span>
<!-- - <span id="footer-info-viewcount">8,456 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD%3AAbout "GMOD%3AAbout")</span>

<!-- -->








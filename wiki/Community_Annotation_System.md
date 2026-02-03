



<span id="top"></span>




# <span dir="auto">Community Annotation System</span>









This is placeholder page for the community annotation system information
page. The live version of the CAS is running at
<a href="http://cas.gmod.org/" class="external free"
rel="nofollow">http://cas.gmod.org/</a>

You can download a copy of the currently running annotation server from
here: <a href="http://www.gmod.org/live_annotation_server.tar.bz2"
class="external free"
rel="nofollow">http://www.gmod.org/live_annotation_server.tar.bz2</a>
(it's big: 1.3GB). Be warned however that this virtual appliance is
still quite rough.

Items that are working:

- A recent (pre-1.69) instance of
  <a href="http://cas.gmod.org/cgi-bin/gbrowse/dicty"
  class="external text" rel="nofollow">GBrowse</a>, with popup balloons
  enabled, that provide:
  - A gene popup balloon that gives an 'Edit in the wiki' option
  - An overview selection balloon that gives an 'Edit in Apollo' option
- A CGI that takes a gene name and copies name, description and synonym
  data from Chado to the MediaWiki database and then redirects to the
  newly created page.
- A CGI that takes a chromosomal range and creates GAME-XML and jnlp
  files and a link to download and run Apollo WebStart.

  
Items that need to be addressed soon are:

- Make networking generic again (currently it is hard coded to run at
  CSHL). This should be pretty easy (writing a bash script similar to
  what Eric wrote for the original [Modware](Modware "Modware") VM).
- Address the hard coding of stuff in the
  <a href="Chado" class="mw-redirect" title="Chado">Chado</a> -\>
  Mediawiki and Mediawiki -\> Chado scripts.
- ~~Hook up the cgi for generating GameXML from
  [GBrowse](GBrowse.1 "GBrowse") (so that the click to edit with
  [Apollo](Apollo.1 "Apollo") will work).~~DONE!
- Documentation, Documentation, Documentation!

For more information or help, send email to the [GMOD Help
Desk](GMOD_Help_Desk "GMOD Help Desk") at
<a href="mailto:help@gmod.org" class="external text"
rel="nofollow">help@gmod.org</a>.




[Categories](Special%253ACategories "Special%253ACategories"):

- [GMOD Components](Category%253AGMOD_Components "Category%253AGMOD Components")
- [Community
  Annotation](Category%253ACommunity_Annotation "Category%253ACommunity Annotation")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Community_Annotation_System"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:57 on 29 February
  2008.</span>
<!-- - <span id="footer-info-viewcount">44,842 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





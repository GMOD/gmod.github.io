---
title: "News/Apollo 1.7.0 Released"
---




<span id="top"></span>




# <span dir="auto">News/Apollo 1.7.0 Released</span>









Version 1.7.0 of [Apollo](../Apollo.1 "Apollo") has just been released.
You can access the updated Apollo page at
<a href="http://www.fruitfly.org/annot/apollo" class="external free"
rel="nofollow">http://www.fruitfly.org/annot/apollo</a>

Changes in this version include

- Added [GFF3](../Glossary#GFF "Glossary") support
- Added program source filtering for reading off
  <a href="../Chado" class="mw-redirect" title="Chado">Chado</a>
  databases
- Lots of work on the ensj adapter to allow it to work better with
  recent ensembl schemas, handle ditags, give finer control of gene
  loading, increase speed of gene loading, bug fixes to history, cigar
  parsing in ensj layer, loading of contig features
- Allow layout of display to be saved to / loaded from a file. Most
  useful for synteny where initial display set up can take time. The
  saved layout also includes the current base position and zoom factor,
  and on loading you can choose to use those.
- Ability to edit settings for a type (new popup menu item in feature
  popup). The settings which can be edited are the glyph used for
  drawing the feature and the columns in the table displayed in the
  evidence panel.
- New drawing glyph which shades exons darker or lighter depending on
  their phase (DrawablePhaseHighlightGeneFeatureSet). Also a version of
  that which uses straight lines to join exons rather than 'hats'
  (DrawablePhaseHighlightNoHatGeneFeatureSet)
- Work on ensembl synteny adapter so it works with latest ensembl
  compara db schema, and basic support for allowing different alignment
  sets to be selected.
- PureJDBCTransactionWriter added. This entailed some changes to other
  classes, but in almost every case the changes are 1. reverse
  compatible and 2. invisible to the end user.
- Uses of Log4J for generating log files.

Plus many other changes. See the <a
href="http://gmod.cvs.sourceforge.net/gmod/apollo/doc/release-notes/release-1.7.0-notes?view=markup"
class="external text" rel="nofollow">release notes</a> for more.

We are hoping to cut releases on a more regular basis (after the year
and a half long hiatus). So please [let us
know](../Apollo.1#Contact "Apollo") if you find any bugs and they will
be addressed and put into a new release as soon as possible.

  



*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2008/01/11*






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

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/News-2FApollo_1.7.0_Released"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:56 on 24 January
  2011.</span>
<!-- - <span id="footer-info-viewcount">6,542 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





---
title: "News/Pathway Tools 17.0 Released"
---




<span id="top"></span>




# <span dir="auto">News/Pathway Tools 17.0 Released</span>









Version 17.0 of [Pathway Tools](../Pathway_Tools.1 "Pathway Tools") has
been released, and can be downloaded from the
<a href="http://bioinformatics.ai.sri.com/ptools/" class="external text"
rel="nofollow">Pathway Tools website</a>.

Version 17.0 is a major release that includes updates to the BioCyc Web
site, downloadable data files, and downloadable [Pathway
Tools](../Pathway_Tools.1 "Pathway Tools") software/database bundle.
Version 17.0 of BioCyc contains 2,920 Pathway/Genome Databases.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">General
  Changes</span>](#General_Changes)
- [<span class="tocnumber">2</span> <span class="toctext">Navigator --
  Web</span>](#Navigator_--_Web)
- [<span class="tocnumber">3</span> <span class="toctext">Navigator --
  Desktop</span>](#Navigator_--_Desktop)
- [<span class="tocnumber">4</span> <span class="toctext">RouteSearch --
  Metabolic Route Search</span>](#RouteSearch_--_Metabolic_Route_Search)
- [<span class="tocnumber">5</span>
  <span class="toctext">PathoLogic</span>](#PathoLogic)



### <span id="General_Changes" class="mw-headline">General Changes</span>

Groups Enhancements  
A number of enhancements have been made to both Web Groups and Desktop
Groups including re-organization of Web Groups menus and addition of new
transformations.

<!-- -->

Rate-Limiting Reactions  
A reaction can now be designated as rate limiting with respect to a
given metabolic pathway, using the pathway editor. Rate-limiting
reactions are identified as such in pathway diagrams using an hourglass
icon.

### <span id="Navigator_--_Web" class="mw-headline">Navigator -- Web</span>

Web Omics Pop-ups  
When using the Cellular Omics Viewer you can view a graph of omics data
(e.g., plotting gene-expression data over time for a given gene). To do
so, paint expression data on the Cellular Overview. Then mouse over a
reaction (or metabolite) of interest. Click "Omics" in the menu of the
resulting pop-up window, which will graph the omics data for that
reaction.

### <span id="Navigator_--_Desktop" class="mw-headline">Navigator -- Desktop</span>

PGDB Registry Speedups  
The PGDB registry is a facility whereby Pathway Tools users can share
and download PGDBs via the Internet. As the number of PGDBs in the
registry grew, the speed of the registry became far too slow; the
registry interface has been re-designed so that finding PGDBs within the
registry is much faster.

### <span id="RouteSearch_--_Metabolic_Route_Search" class="mw-headline">RouteSearch -- Metabolic Route Search</span>

The new Web-based RouteSearch tool, accessible from command Tools -\>
Metabolic Route Search, supports two types of searches in metabolic
networks. For both types of search, the user specifies a starting and
ending metabolite of interest, and the software generates alternative
reaction pathways connecting those metabolites.

Mode 1 -- Within Organism Searches  
In this mode the search makes use of reactions within the selected PGDB
only.

Mode 2 -- Synthetic Pathway Searches  
In this mode the search makes use of reactions within the selected PGDB
plus reactions within the MetaCyc DB. The user may specify a higher
penalty for introducing reactions from MetaCyc. This mode is not
available within public Pathway Tools web servers but may be accessed by
installing Pathway Tools locally and running a web server accessible on
an intranet.

### <span id="PathoLogic" class="mw-headline">PathoLogic</span>

Pathway Abundance Scores for Metagenome Data  
PathoLogic can now compute abundance scores for pathways based on gene
abundance values provided in a .PF input file. Gene entries in a .PF
file may contain ABUNDANCE fields that specify the number of times that
gene was observed in a metagenomics dataset. The abundance scores are
present in file pathways-report.txt in the PGDB reports directory. More
information on calculation of abundance scores will be provided in a
future blog post.

Full details in the
<a href="http://bioinformatics.ai.sri.com/ptools/release-notes.html"
class="external text" rel="nofollow">Pathway Tools release notes</a>.

  



*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2013/04/03*






[Categories](../Special%253ACategories "Special%253ACategories"):

- [News Items](../Category%253ANews_Items "Category%253ANews Items")
- [GMOD
  Components](../Category%253AGMOD_Components "Category%253AGMOD Components")
- [Pathway Tools](../Category%253APathway_Tools "Category%253APathway Tools")






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

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/News-2FPathway_Tools_17.0_Released"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 13:37 on 15 April
  2013.</span>
<!-- - <span id="footer-info-viewcount">12,281 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





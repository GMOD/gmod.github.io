---
title: "CMap Version 2 Design"
---




<span id="top"></span>




# <span dir="auto">CMap Version 2 Design</span>









The hopes and dreams for a new generation....

Up to [CMap](CMap.1 "CMap").


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">User
  Interface</span>](#User_Interface)
- [<span class="tocnumber">2</span>
  <span class="toctext">Schema</span>](#Schema)
- [<span class="tocnumber">3</span>
  <span class="toctext">Visualizations</span>](#Visualizations)
- [<span class="tocnumber">4</span> <span class="toctext">Data
  Loading</span>](#Data_Loading)
- [<span class="tocnumber">5</span>
  <span class="toctext">DAS</span>](#DAS)



# <span id="User_Interface" class="mw-headline">User Interface</span>

- The new interface will be all Web 2.0 goodness, using tons of
  JavaScript/AJAX/CSS (which I so studiously avoided in early versions)

# <span id="Schema" class="mw-headline">Schema</span>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/b8/Cmap_2.0_schema.png/100px-Cmap_2.0_schema.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/b8/Cmap_2.0_schema.png/150px-Cmap_2.0_schema.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/b8/Cmap_2.0_schema.png/200px-Cmap_2.0_schema.png 2x"
width="100" height="234" alt="Cmap 2.0 schema.png" />

- No more "cmap\_" table prefix
- Move to support only [MySQL](MySQL "MySQL") InnoDB tables to get
  proper foreign keys, not worry about implementing common db functions
  in Perl
- New, slimmer schema
- Eschew evidence table
- In the past, there was a canonical "feature_correspondence" table and
  the "f1-\>f2" correspondence was duplicated into a
  "correspondence_lookup" table where "f1-\>f2" and "f2-\>f1" in order
  to write simple [SQL](Glossary#SQL "Glossary"). The new version will
  remove the lookup table and simply have correspondences be repeated in
  the one table (making them essentially one-way).
- Map and feature types originally existed in the database but were
  moved into configuration files in past versions. They will be restored
  to there previous tables because any mismatch in configuration files
  and incoming data can easily cause data to be quietly ignored,
  creating many headaches for the author. Back in the db, code will be
  able to instantiate the needed types, and SQL will make cleanup of
  types easy.
- Steal the binning idea from
  <a href="http://genome.cshlp.org/content/12/10/1599.full"
  class="external text" rel="nofollow">Gbrowse</a> to speed up feature
  retrieval, group features into chunks for display as
  <a href="http://en.wikipedia.org/wiki/Sparkline" class="external text"
  rel="nofollow">sparklines</a>

# <span id="Visualizations" class="mw-headline">Visualizations</span>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/da/CMap_circos.png/100px-CMap_circos.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/da/CMap_circos.png/150px-CMap_circos.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/d/da/CMap_circos.png/200px-CMap_circos.png 2x"
width="100" height="100" alt="CMap circos.png" />

- All output to SVG, convert to other formats as needed
- Each "slot" holding maps in a comparative view will be generated and
  cached individually on server side; they will be assembled into a
  larger SVG container with an additional SVG to show the correspondence
  lines; changes to one slot will necessitate only changes to that image
- It will be possible to pregenerate all initial map views (e.g., whole
  chromosomes) for immediate viewing; other images can be labeled and
  cached as users create views, enabling re-use of images
- <a href="http://mkweb.bcgsc.ca/circos" class="external text"
  rel="nofollow">Circos</a> to be used to generate circular views
- I've written to Dave Edwards and Chris Duran at the Univ. of
  Queensland (Australia) about including their 3-D Java desktop app as a
  server-side tool; no word back
- Investigate
  <a href="http://code.google.com/apis/o3d/" class="external text"
  rel="nofollow">Google's O3D</a>
- Also can investigate using GraphViz, gnuplot and
  <a href="http://pdl.perl.org/" class="external text"
  rel="nofollow">PDL</a> for other presentations

# <span id="Data_Loading" class="mw-headline">Data Loading</span>

Write loaders for:

- Tab-delimited
- [GFF](GFF "GFF")
- Ensembl
- Compara
- <a href="Chado" class="mw-redirect" title="Chado">Chado</a>

# <span id="DAS" class="mw-headline">DAS</span>

- Will write a module to plug into
  <a href="http://www.sanger.ac.uk/Software/analysis/proserver/"
  class="external text" rel="nofollow">Proserver</a> to create
  <a href="DAS" class="mw-redirect" title="DAS">DAS</a> server to share
  directly from [CMap](CMap.1 "CMap"); docs to explain to users how to
  do this
- As a DAS client to show additional features




[Categories](Special%253ACategories "Special%253ACategories"):

- [DAS](Category%253ADAS "Category%253ADAS")
- [CMap](Category%253ACMap "Category%253ACMap")
- [Proposals](Category%253AProposals "Category%253AProposals")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/CMap_Version_2_Design" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:22 on 12 May
  2009.</span>
<!-- - <span id="footer-info-viewcount">57,329 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





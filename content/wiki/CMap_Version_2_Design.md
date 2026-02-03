---
title: "CMap Version 2 Design"
---
# CMap Version 2 Design


The hopes and dreams for a new generation....

Up to [CMap](CMap.1 "CMap").


  Interface</span>](#User_Interface)
- [Schema](#Schema)
- [Visualizations](#Visualizations)
- [Data
  Loading](#Data_Loading)
- [DAS](#DAS)


# User Interface

- The new interface will be all Web 2.0 goodness, using tons of
  JavaScript/AJAX/CSS (which I so studiously avoided in early versions)

# Schema

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

# Visualizations

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

# Data Loading

Write loaders for:

- Tab-delimited
- [GFF](GFF "GFF")
- Ensembl
- Compara
- <a href="Chado" class="mw-redirect" title="Chado">Chado</a>

# DAS

- Will write a module to plug into
  <a href="http://www.sanger.ac.uk/Software/analysis/proserver/"
  class="external text" rel="nofollow">Proserver</a> to create
  <a href="DAS" class="mw-redirect" title="DAS">DAS</a> server to share
  directly from [CMap](CMap.1 "CMap"); docs to explain to users how to
  do this
- As a DAS client to show additional features

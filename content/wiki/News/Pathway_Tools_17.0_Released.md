---
title: "News/Pathway Tools 17.0 Released"
---
# News/Pathway Tools 17.0 Released

Version 17.0 of [Pathway Tools](../Pathway_Tools.1 "Pathway Tools") has
been released, and can be downloaded from the
<a href="http://bioinformatics.ai.sri.com/ptools/" class="external text"
rel="nofollow">Pathway Tools website</a>.

Version 17.0 is a major release that includes updates to the BioCyc Web
site, downloadable data files, and downloadable [Pathway
Tools](../Pathway_Tools.1 "Pathway Tools") software/database bundle.
Version 17.0 of BioCyc contains 2,920 Pathway/Genome Databases.

  Changes</span>](#General_Changes)
- [Navigator --
  Web](#Navigator_--_Web)
- [Navigator --
  Desktop](#Navigator_--_Desktop)
- [RouteSearch --
  Metabolic Route Search](#RouteSearch_--_Metabolic_Route_Search)
- [PathoLogic](#PathoLogic)

### General Changes

Groups Enhancements  
A number of enhancements have been made to both Web Groups and Desktop
Groups including re-organization of Web Groups menus and addition of new
transformations.
Rate-Limiting Reactions  
A reaction can now be designated as rate limiting with respect to a
given metabolic pathway, using the pathway editor. Rate-limiting
reactions are identified as such in pathway diagrams using an hourglass
icon.

### Navigator -- Web

Web Omics Pop-ups  
When using the Cellular Omics Viewer you can view a graph of omics data
(e.g., plotting gene-expression data over time for a given gene). To do
so, paint expression data on the Cellular Overview. Then mouse over a
reaction (or metabolite) of interest. Click "Omics" in the menu of the
resulting pop-up window, which will graph the omics data for that
reaction.

### Navigator -- Desktop

PGDB Registry Speedups  
The PGDB registry is a facility whereby Pathway Tools users can share
and download PGDBs via the Internet. As the number of PGDBs in the
registry grew, the speed of the registry became far too slow; the
registry interface has been re-designed so that finding PGDBs within the
registry is much faster.

### RouteSearch -- Metabolic Route Search

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

### PathoLogic

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

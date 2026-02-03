---
title: "PubFetch"
---
# PubFetch

> The item described in this page is not (or is no longer) supported by
> the GMOD project.
> This page is included only for reference purposes.

PubFetch is part of the
<a href="http://tesuque.stanford.edu/pubsearch.org/index.html"
class="external text" rel="nofollow">PubSearch</a> web-based literature
curation toolset and functions as the interface between the literature
curation tools and the online literature databases, such as PubMed. The
aim of PubFetch is to provide a generic way of searching and retrieving
literature data from online literature datasources so that the
downstream applications dont have to deal with the idiosyncrasies of the
individual literature databases.

Initially PubFetch will act as the interface between PubSearch and the
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed"
class="external text" rel="nofollow">PubMed</a>\] and
<a href="http://www.nal.usda.gov/ag98/" class="external text"
rel="nofollow">Agricola</a> databases used by
<a href="http://rgd.mcw.edu/" class="external text"
rel="nofollow">RGD</a> and
<a href="http://www.arabidopsis.org/" class="external text"
rel="nofollow">TAIR</a>. A standard API and data format will be created
to provide database queries and return results, popular existing formats
and protocols will be used/supported wherever possible.

## Documentation

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/4f/Pubfetch_overview.jpg" width="496"
height="370" alt="Pubfetch overview.jpg" />


**Figure 1 - Overview diagram of PubFetch showing how the PubFetch
module will provide a generic literature access interface to PubMed and
Agricola which could be expanded to other literature sources as
desired.**


The codebase will be developed initially in perl by adapting existing
RGD perl modules designed to retrieve data from PubMed in a standard XML
format. This code will be reviewed and adapted to create the main
PubFetch module and appropriate database interface modules. Figure 2
below is a schematic diagram of the existing RGD literature download
modules.


<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/6a/Existing_PubMed_flow.jpg" width="400"
height="197" alt="Existing PubMed flow.jpg" />


**Figure 2- Current RGD literature download process showing perl modules
used to interact with PubMed, create XML data and load into RGD.**


The fundamental actions required of PubFetch are:

- Search LitDb for articles matching certain query criteria (eg.
  keywords, date, author, etc).
  - This will most likely entail passing the search criteria to
    PubFetch and retrieving a set of accession numbers (eg. PubMed IDs,
    PMIDs) for matching references.
- Retrieve the text information from the LitDb corresponding to a
  supplied accession number (e.g. *bring me the PubMed entry for
  <a href="http://www.ncbi.nlm.nih.gov/pubmed/12345?dopt=Abstract"
  class="external mw-magiclink-pmid" rel="nofollow">PMID 12345</a>*)



### PubFetch as a BioMOBY webservice

To provide generic access to PubFetch we intend to make the core
functionality available as a webservice, following the
<a href="http://www.biomoby.org/" class="external text"
rel="nofollow">BioMOBY</a> service model. The two actions described
above will be implemented as two classes of Web services, the first
taking keywords and returning PubMed IDs (or other LitDb accession) ,
the second taking LitDb accessions and returning the text information in
a simple, standardized XML format. We will endeavour to provide the data
in existing formats (raw data from the LitDb, a BioPerl-compatible
format, etc) in addition to a simple XML format that is not dependent on
other codebases



## Downloads

The source code can be downloaded from <a
href="http://sourceforge.net/project/showfiles.php?group_id=27707&amp;package_id=126656"
class="external text" rel="nofollow">SourceForge</a>.

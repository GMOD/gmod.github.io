<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">Chado Phylogeny Module</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

> **This page or section needs to be edited.**
> <span class="small">Please help by <span class="plainlinks"><a
> href="http://gmod.org/mediawiki/index.php?title=Chado_Phylogeny_Module&amp;action=edit"
> class="external text" rel="nofollow">editing this page</a></span> to
> add your revisions or additions.</span>

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Annotating
    nodes</span>](#Annotating_nodes)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Open
    Issues</span>](#Open_Issues)
- [<span class="tocnumber">2</span> <span class="toctext">More
  Information</span>](#More_Information)
- [<span class="tocnumber">3</span>
  <span class="toctext">Tables</span>](#Tables)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Table:
    phylonode</span>](#Table:_phylonode)
  - [<span class="tocnumber">3.2</span> <span class="toctext">Table:
    phylonode_dbxref</span>](#Table:_phylonode_dbxref)
  - [<span class="tocnumber">3.3</span> <span class="toctext">Table:
    phylonode_organism</span>](#Table:_phylonode_organism)
  - [<span class="tocnumber">3.4</span> <span class="toctext">Table:
    phylonode_pub</span>](#Table:_phylonode_pub)
  - [<span class="tocnumber">3.5</span> <span class="toctext">Table:
    phylonode_relationship</span>](#Table:_phylonode_relationship)
  - [<span class="tocnumber">3.6</span> <span class="toctext">Table:
    phylonodeprop</span>](#Table:_phylonodeprop)
  - [<span class="tocnumber">3.7</span> <span class="toctext">Table:
    phylotree</span>](#Table:_phylotree)
  - [<span class="tocnumber">3.8</span> <span class="toctext">Table:
    phylotree_pub</span>](#Table:_phylotree_pub)

</div>

# <span id="Introduction" class="mw-headline">Introduction</span>

For representing phylogenetic trees; the trees represent the phylogeny
of some some kind of sequence feature, protein or nucleotide, or actual
organism taxonomy trees.

This module also has the ability to easily create multiple trees, to
easily create super trees, to retrieve nodes easily from different
levels in a tree without recursion (nested sets), and the ability to
associate trees with algorithms (referencing the [Chado Companalysis
Module](Chado_Companalysis_Module "Chado Companalysis Module")).

This module relies heavily on the [Sequence
module](Chado_Sequence_Module "Chado Sequence Module"). In particular,
all the leaf nodes in a tree correspond to features; these will usually
be features of type SO:protein or SO:polypeptide (but other trees are
possible - e.g. intron trees). If it is desirable to store multiple
alignments for each non-leaf node, then each node can be mapped to a
feature of type SO:match. Please refer to the [sequence module
docs](Chado_Sequence_Module "Chado Sequence Module") for details on
storing multiple alignments.

  

### <span id="Annotating_nodes" class="mw-headline">Annotating nodes</span>

Each node can have a feature attached; this 'feature' is the multiple
alignment for non-leaf nodes. It is these features that are annotated
rather than annotating the nodes themselves. This has lots of
advantages - we can piggyback off of the sequence module and reuse the
tables there the leaf nodes may have annotations already attached - for
example, GO associations. In fact, it is even possible to annotate
ranges along an alignment - this would entail creating a new feature
which has a featureloc on the alignment feature.

The nested set tree implementation by way of Joe Celko; see the
excellent introduction by Aaron Mackey at <a
href="http://www.oreillynet.com/pub/a/network/2002/11/27/bioconf.html"
class="external free"
rel="nofollow">http://www.oreillynet.com/pub/a/network/2002/11/27/bioconf.html</a>.

  

### <span id="Open_Issues" class="mw-headline">Open Issues</span>

Should there be an additional table, phylonode_relationshipprop? This
table would Increase the detail with which one can describe the edges
between phylonodes, and these details could include such things as
bootstrapping details or divergence times. The current thinking is that
such a table should be created but input from the Chado designers would
be useful here.

  

# <span id="More_Information" class="mw-headline">More Information</span>

See the page on the related [Organism
module](Chado_Organism_Module "Chado Organism Module").

  

# <span id="Tables" class="mw-headline">Tables</span>

## <span id="Table:_phylonode" class="mw-headline">Table: phylonode</span>

This is the most pervasive element in the phylogeny module, cataloging
the "phylonodes" of tree graphs. Edges are implied by the
parent_phylonode_id reflexive closure. For all nodes in a nested set
implementation the left and right index will be \*between\* the parents
left and right indexes. See <a
href="http://www.oreillynet.com/pub/a/network/2002/11/27/bioconf.html"
class="external free"
rel="nofollow">http://www.oreillynet.com/pub/a/network/2002/11/27/bioconf.html</a>
for details on a method of assigning values to the left and right
indices.

<table data-border="1" data-cellpadding="3">
<caption>phylonode Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phylonode_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_phylotree"
title="Chado Tables">phylotree</a></p></td>
<td>phylotree_id</td>
<td>integer</td>
<td><em>UNIQUE#1 UNIQUE#2 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_phylonode"
title="Chado Tables">phylonode</a></p></td>
<td>parent_phylonode_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Root phylonode can have null parent_phylonode_id value.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>left_idx</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>right_idx</td>
<td>integer</td>
<td><em>UNIQUE#2 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Type: e.g. root, interior, leaf.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Phylonodes can have optional features attached to them e.g. a protein or
nucleotide sequence usually attached to a leaf of the phylotree for
non-leaf nodes, the feature may be a feature that is an instance of
SO:match; this feature is the alignment of all leaf features beneath
it.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>label</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>distance</td>
<td>double precision</td>
<td><em></em></td>
</tr>
</tbody>
</table>

phylonode Structure

Tables referencing this one via Foreign Key Constraints:

- [phylonode](Chado_Tables#Table:_phylonode "Chado Tables")

<!-- -->

- [phylonode_dbxref](Chado_Tables#Table:_phylonode_dbxref "Chado Tables")

<!-- -->

- [phylonode_organism](Chado_Tables#Table:_phylonode_organism "Chado Tables")

<!-- -->

- [phylonode_pub](Chado_Tables#Table:_phylonode_pub "Chado Tables")

<!-- -->

- [phylonode_relationship](Chado_Tables#Table:_phylonode_relationship "Chado Tables")

<!-- -->

- [phylonodeprop](Chado_Tables#Table:_phylonodeprop "Chado Tables")

------------------------------------------------------------------------

## <span id="Table:_phylonode_dbxref" class="mw-headline">Table: phylonode_dbxref</span>

For example, for orthology, paralogy group identifiers; could also be
used for NCBI taxonomy; for sequences, refer to phylonode_feature,
feature associated dbxrefs.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phylonode_dbxref_id | serial | *PRIMARY KEY* |
| [phylonode](Chado_Tables#Table:_phylonode "Chado Tables") | phylonode_id | integer | *UNIQUE#1 NOT NULL* |
| [dbxref](Chado_Tables#Table:_dbxref "Chado Tables") | dbxref_id | integer | *UNIQUE#1 NOT NULL* |

phylonode_dbxref Structure

------------------------------------------------------------------------

  

## <span id="Table:_phylonode_organism" class="mw-headline">Table: phylonode_organism</span>

This linking table should only be used for nodes in taxonomy trees; it
provides a mapping between the node and an organism. One node can have
zero or one organisms, one organism can have zero or more nodes
(although typically it should only have one in the standard NCBI
taxonomy tree).

<table data-border="1" data-cellpadding="3">
<caption>phylonode_organism Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phylonode_organism_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_phylonode"
title="Chado Tables">phylonode</a></p></td>
<td>phylonode_id</td>
<td>integer</td>
<td><em>UNIQUE NOT NULL</em><br />
<br />
One phylonode cannot refer to &gt;1 organism.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_organism"
title="Chado Tables">organism</a></p></td>
<td>organism_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
</tbody>
</table>

phylonode_organism Structure

------------------------------------------------------------------------

  

## <span id="Table:_phylonode_pub" class="mw-headline">Table: phylonode_pub</span>

| FK | Name | Type | Description |
|----|----|----|----|
|  | phylonode_pub_id | serial | *PRIMARY KEY* |
| [phylonode](Chado_Tables#Table:_phylonode "Chado Tables") | phylonode_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |

phylonode_pub Structure

------------------------------------------------------------------------

  

## <span id="Table:_phylonode_relationship" class="mw-headline">Table: phylonode_relationship</span>

This is for relationships that are not strictly hierarchical; for
example, horizontal gene transfer. Most phylogenetic trees are strictly
hierarchical, nevertheless it is here for completeness.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phylonode_relationship_id | serial | *PRIMARY KEY* |
| [phylonode](Chado_Tables#Table:_phylonode "Chado Tables") | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [phylonode](Chado_Tables#Table:_phylonode "Chado Tables") | object_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | rank | integer |  |
| [phylotree](Chado_Tables#Table:_phylotree "Chado Tables") | phylotree_id | integer | *NOT NULL* |

phylonode_relationship Structure

------------------------------------------------------------------------

  

## <span id="Table:_phylonodeprop" class="mw-headline">Table: phylonodeprop</span>

<table data-border="1" data-cellpadding="3">
<caption>phylonodeprop Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phylonodeprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_phylonode"
title="Chado Tables">phylonode</a></p></td>
<td>phylonode_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
type_id could designate phylonode hierarchy relationships, for example:
species taxonomy (kingdom, order, family, genus, species),
"ortholog/paralog", "fold/superfold", etc.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>text</td>
<td><em>UNIQUE#1 NOT NULL DEFAULT ''::text</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
</tbody>
</table>

phylonodeprop Structure

------------------------------------------------------------------------

  

## <span id="Table:_phylotree" class="mw-headline">Table: phylotree</span>

Global anchor for phylogenetic tree.

<table data-border="1" data-cellpadding="3">
<caption>phylotree Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phylotree_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_dbxref"
title="Chado Tables">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Type: protein, nucleotide, taxonomy, for example. The type should be any
SO type, or "taxonomy".</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_analysis"
title="Chado Tables">analysis</a></p></td>
<td>analysis_id</td>
<td>integer</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>comment</td>
<td>text</td>
<td><em></em></td>
</tr>
</tbody>
</table>

phylotree Structure

Tables referencing this one via Foreign Key Constraints:

- [phylonode](Chado_Tables#Table:_phylonode "Chado Tables")

<!-- -->

- [phylonode_relationship](Chado_Tables#Table:_phylonode_relationship "Chado Tables")

<!-- -->

- [phylotree_pub](Chado_Tables#Table:_phylotree_pub "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_phylotree_pub" class="mw-headline">Table: phylotree_pub</span>

Tracks citations global to the tree e.g. multiple sequence alignment
supporting tree construction.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phylotree_pub_id | serial | *PRIMARY KEY* |
| [phylotree](Chado_Tables#Table:_phylotree "Chado Tables") | phylotree_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |

phylotree_pub Structure

------------------------------------------------------------------------

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=Chado_Phylogeny_Module&oldid=26569>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](Special:Categories "Special:Categories"):

- [Needs Editing](Category:Needs_Editing "Category:Needs Editing")
- [Chado Modules](Category:Chado_Modules "Category:Chado Modules")
- [Evolution](Category:Evolution "Category:Evolution")
- [!Lacking ERD](Category:!Lacking_ERD "Category:!Lacking ERD")

</div>

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">



<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces

- <span id="ca-nstab-main"><a href="Chado_Phylogeny_Module" accesskey="c"
  title="View the content page [c]">Page</a></span>
- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:Chado_Phylogeny_Module&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>

<div id="right-navigation">

<div id="p-views" class="vectorTabs" role="navigation"
aria-labelledby="p-views-label">

### Views

- <span id="ca-view">[Read](Chado_Phylogeny_Module)</span>
- <span id="ca-viewsource"><a
  href="http://gmod.org/mediawiki/index.php?title=Chado_Phylogeny_Module&amp;action=edit"
  accesskey="e" title="This page is protected.
  You can view its source [e]">View source</a></span>
- <span id="ca-history"><a
  href="http://gmod.org/mediawiki/index.php?title=Chado_Phylogeny_Module&amp;action=history"
  accesskey="h" title="Past revisions of this page [h]">View history</a></span>

</div>

<div id="p-cactions" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-cactions-label">

### Actions[](#)

<div class="menu">

</div>

</div>

<div id="p-search" role="search">

### Search

<div id="simpleSearch">

</div>

</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>
- <span id="n-View-all-pages">[View all pages](Special:AllPages)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category:FAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category:HOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">

- <span id="t-whatlinkshere"><a href="Special:WhatLinksHere/Chado_Phylogeny_Module" accesskey="j"
  title="A list of all wiki pages that link here [j]">What links here</a></span>
- <span id="t-recentchangeslinked"><a href="Special:RecentChangesLinked/Chado_Phylogeny_Module"
  accesskey="k"
  title="Recent changes in pages linked from this page [k]">Related
  changes</a></span>
- <span id="t-specialpages"><a href="Special:SpecialPages" accesskey="q"
  title="A list of all special pages [q]">Special pages</a></span>
- <span id="t-print"><a
  href="http://gmod.org/mediawiki/index.php?title=Chado_Phylogeny_Module&amp;printable=yes"
  rel="alternate" accesskey="p"
  title="Printable version of this page [p]">Printable version</a></span>
- <span id="t-permalink">[Permanent
  link](http://gmod.org/mediawiki/index.php?title=Chado_Phylogeny_Module&oldid=26569 "Permanent link to this revision of the page")</span>
- <span id="t-info">[Page
  information](http://gmod.org/mediawiki/index.php?title=Chado_Phylogeny_Module&action=info)</span>
- <span id="t-smwbrowselink"><a href="Special:Browse/Chado_Phylogeny_Module" rel="smw-browse">Browse
  properties</a></span>
- <span id="t-pdf">[Print as
  PDF](http://gmod.org/mediawiki/index.php?title=Special:PdfPrint&page=Chado_Phylogeny_Module)</span>

</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 04:39 on 18 February
  2015.</span>
- <span id="footer-info-viewcount">88,661 page views.</span>
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->

- <span id="footer-copyrightico">[<img src="http://www.gnu.org/graphics/gfdl-logo-small.png" width="88"
  height="31" alt="a GNU Free Documentation License" />](http://www.gnu.org/licenses/fdl-1.3.html)</span>
- <span id="footer-poweredbyico">[<img
  src="../mediawiki/skins/common/images/poweredby_mediawiki_88x31.png"
  width="88" height="31" alt="Powered by MediaWiki" />](http://www.mediawiki.org/)
  [<img
  src="../mediawiki/extensions/SemanticMediaWiki/resources/images/smw_button.png"
  width="88" height="31" alt="Powered by Semantic MediaWiki" />](https://www.semantic-mediawiki.org/wiki/Semantic_MediaWiki)</span>

<div style="clear:both">

</div>

</div>

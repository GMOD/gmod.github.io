<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">Bio GMOD GenericGenePage</span>

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

Bio::GMOD::GenericGenePage is an abstract
[Perl](Glossary#Perl "Glossary") class that provides a render_xml method
to crete [Common Gene Page](Common_Gene_Page "Common Gene Page")
[XML](Glossary#XML "Glossary"), but does not fetch the data. In order to
effectively use this module, you need to subclass it and implement all
of the methods that are listed under ABSTRACT CLASSES below for your
database. These abstract methods are responsible for providing
Bio::GMOD::GenericGenePage with the data to create the XML.

There are two example implementations included with this module.
Bio::GMOD::GenericGenePage::Chado is a simple implementation for a Chado
database populated with *S. cerevisiae* data obtained from
[SGD](Category:SGD "Category:SGD") as GFF3. Currently, the output of
this implementation can be seen at

<a href="http://gmod.org/cgi-bin/gbrowse/chado_yeast/"
class="external free"
rel="nofollow">http://gmod.org/cgi-bin/gbrowse/chado_yeast/</a>

and by clicking on any of the genes (red arrows).

The other implementation, CXGN::Phenome::GenericGenePage, is from [SGN,
the Sol Genomics Network](Category:SGN "Category:SGN"). The XML they
provide can be seen by clicking on the "Download GMOD XML" link on any
of there locus pages; for example, this one:

<a href="http://sgn.cornell.edu/phenome/locus_display.pl?locus_id=1238"
class="external free"
rel="nofollow">http://sgn.cornell.edu/phenome/locus_display.pl?locus_id=1238</a>

For more information see
<a href="Bio_GMOD_GenericGenePage" class="external free"
rel="nofollow">http://gmod.org/wiki/Bio_GMOD_GenericGenePage</a> or
contact Scott Cain, scain@cpan.org.

While there is no example CGI included in this distribution that show
how this module can be used, that could be included in future
distribution if there is interest in it.

## <span id="FlyBase_implementation" class="mw-headline">FlyBase implementation</span>

<a
href="http://flybase.org/genome/Drosophila_melanogaster/current/genepage/FBgn0000490"
class="external free"
rel="nofollow">http://flybase.org/genome/Drosophila_melanogaster/current/genepage/FBgn0000490</a>

## <span id="EcoliWiki_implementation" class="mw-headline">EcoliWiki implementation</span>

The EcoliWiki implementation is written as a REST-like service in PHP.

<a href="http://ecoliwiki.net/rest/gmod_gene.php/gene_symbol/pfkA"
class="external free"
rel="nofollow">http://ecoliwiki.net/rest/gmod_gene.php/gene_symbol/pfkA</a>

See the discussion page for issues arising.

# <span id="Abstract_Classes" class="mw-headline">Abstract Classes</span>

Methods below should be overridden by each GenericGenePage
implementation.

  

     name
         Usage: my $name = $genepage->name();
         Desc : get the string name of this gene
         Args : none
         Ret  : string gene name, e.g. 'Pax6'
         Side Effects: none

     accessions
         Usage: my @accessions = $genepage->accessions();
         Desc : get a list of local accession values
         Args : none
         Ret  : a list of local accessions
         Side Effects: none
       Note that these are the accessions that are used by the MOD providing
       the information, not accessions in external databases like GenBank.

     data_provider
         Usage: my $data_provider = $genepage->data_provider();
         Desc : The name of the data providing authority (ie, WormBase, SGD, etc)
         Args : none
         Ret  : string, name of the data provider
         Side Effects: none

     synonyms
         Usage: my @syn = $genepage->synonyms();
         Desc : get a list of synonyms for this gene
         Args : none
         Ret : list of strings,
               e.g. (  '1500038E17Rik',
                       'AEY11',
                       'Dey',
                       "Dickie's small eye",
                       'Gsfaey11',
                       'Pax-6',
                    )
         Side Effects: none

     map_locations
         Usage: my @locs = $genepage->map_locations()
         Desc : get a list of known map locations for this gene
         Args : none
         Ret  : list of map locations, each a hashref as:
                {  map_name => string map name,
                   chromosome => string chromosome name,
                   marker     => (optional) associated marker name,
                   position   => numerical position on the map,
                   units      => map units, either 'cm', for centimorgans,
                                 or 'b', for bases
                }
         Side Effects: none

     ontology_terms
         Usage: my @terms = $genepage->ontology_terms();
         Desc : get a list of ontology terms
         Args : none
         Ret  : hash-style list as:
                  termname => human-readable description,
         Side Effects: none
         Example:
            my %terms = $genepage->ontology_terms()
            # and %terms is now
            (  GO:0016711 => 'F:flavonoid 3'-monooxygenase activity',
               ...
            )
       Note that the value in that has is the the concatenation of F:, B: or C:
       for molecular_function, biological_process, or cellular_component GO
       terms respectively. If the term does not belong to GO, there is no
       prepended identifier.

     dbxrefs
         Usage: my @dbxrefs = $genepage->dbxrefs();
         Desc : get a list of database cross-references for info related to this gene
         Args : none
         Ret  : list of strings, like type:id e.g. ('PFAM:00012')
         Side Effects: none

     comments
         Usage: my @comments = $genepage->comments();
         Desc : get a list of comments with types
         Args : none
         Ret  : a hash of comment=>type, where type is optional (empty string)
         Side Effects: none

     literature_references
         Usage: my @refs = $genepage->lit_refs();
         Desc : get a list of literature references for this gene
         Args : none
         Ret  : list of literature reference identifers, as type:id,
                like ('PMID:0023423',...)
         Side Effects: none

     summary_text
         Usage: my $summary = $page->summary_text();
         Desc : get a text string of plain-English summary text for this gene
         Args : none
         Ret  : string of summary text
         Side Effects: none

     organism
         Usage: my $species_info = $genepage->organism
         Desc : get a handful of species-related information
         Args : none
         Ret  : hashref as:
                { ncbi_taxon_id => ncbi taxon id, (e.g. 3702),
                  binomial      => e.g. 'Arabidopsis thaliana',
                  common        => e.g. 'Mouse-ear cress',
                }
         Side Effects: none

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=Bio_GMOD_GenericGenePage&oldid=9029>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](Special:Categories "Special:Categories"):

- [XML](Category:XML "Category:XML")
- <a
  href="http://gmod.org/mediawiki/index.php?title=Category:Generic_Gene_Pages&amp;action=edit&amp;redlink=1"
  class="new"
  title="Category:Generic Gene Pages (page does not exist)">Generic Gene
  Pages</a>

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

- <span id="ca-nstab-main"><a href="Bio_GMOD_GenericGenePage" accesskey="c"
  title="View the content page [c]">Page</a></span>
- <span id="ca-talk"><a href="Talk:Bio_GMOD_GenericGenePage" accesskey="t"
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

- <span id="t-whatlinkshere"><a href="Special:WhatLinksHere/Bio_GMOD_GenericGenePage" accesskey="j"
  title="A list of all wiki pages that link here [j]">What links here</a></span>
- <span id="t-recentchangeslinked"><a href="Special:RecentChangesLinked/Bio_GMOD_GenericGenePage"
  accesskey="k"
  title="Recent changes in pages linked from this page [k]">Related
  changes</a></span>
- <span id="t-specialpages"><a href="Special:SpecialPages" accesskey="q"
  title="A list of all special pages [q]">Special pages</a></span>
- <span id="t-print"><a
  href="http://gmod.org/mediawiki/index.php?title=Bio_GMOD_GenericGenePage&amp;printable=yes"
  rel="alternate" accesskey="p"
  title="Printable version of this page [p]">Printable version</a></span>
- <span id="t-permalink">[Permanent
  link](http://gmod.org/mediawiki/index.php?title=Bio_GMOD_GenericGenePage&oldid=9029 "Permanent link to this revision of the page")</span>
- <span id="t-info">[Page
  information](http://gmod.org/mediawiki/index.php?title=Bio_GMOD_GenericGenePage&action=info)</span>
- <span id="t-smwbrowselink"><a href="Special:Browse/Bio_GMOD_GenericGenePage"
  rel="smw-browse">Browse properties</a></span>
- <span id="t-pdf">[Print as
  PDF](http://gmod.org/mediawiki/index.php?title=Special:PdfPrint&page=Bio_GMOD_GenericGenePage)</span>

</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 01:16 on 19 August
  2009.</span>
- <span id="footer-info-viewcount">25,824 page views.</span>
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

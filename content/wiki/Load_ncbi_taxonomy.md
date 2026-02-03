---
title: "Load ncbi taxonomy"
---




<span id="top"></span>




# <span dir="auto">Load ncbi taxonomy</span>









`load_ncbi_taxonomy.pl` is a perl script for loading NCBI taxonomy trees
in the
[**`phylotree`**](Chado_Phylogeny_Module#Table:_phylotree "Chado Phylogeny Module")[phylotree
table](Chado_Phylogeny_Module#Table:_phylotree "Chado Phylogeny Module").
This script was contributed by [Naama
Menda](User%253ANaamaMenda "User%253ANaamaMenda") at
<a href="http://www.sgn.cornell.edu/" class="external text"
rel="nofollow">Sol Genomics Network (SGN)</a> led by Lukas Mueller.

## <span id="Where_to_find_it" class="mw-headline">Where to find it</span>

### <span id="gmod_1.1" class="mw-headline">gmod 1.1</span>

In the 1.1 release,load_ncbi_taxonomy.pl is installed with other scripts
with the distribution and will typically go in /usr/bin or
/usr/local/bin.

## <span id="Command_line_options" class="mw-headline">Command line options</span>

- `-H hostname` for database \[required if `-g` isn't used\]

<!-- -->

- `-D database name</t> [required if <tt>-g` isn't used\]

<!-- -->

- `-g GMOD database profile name` (can provide host and DB name)
  Default: `default`

<!-- -->

- `-p phylotree name` (optional - defaults to `NCBI taxonomy tree`. You
  want to set this if you plan to load more than one tree)

<!-- -->

- `-i input file` - list of taxonomy ids to be stored (optional- without
  this the entire NCBI taxonomy will be loaded)

<!-- -->

- `-v` verbose output

<!-- -->

- `-t` trial mode. Don't perform any store operations at all. (trial
  mode cannot test inserting associated data for new terms)

For storing phylonodes a new phylotree will be stored with the name
'NCBI taxonomy tree'. Each organism will get a phylonode id and will be
stored in a tmp table, since each phylonode (except for the root) has a
parent_phylonode_id, which is an internal foreign key. Next each
phylonode will get a left and right indexes, which are calculated by
walking down the entire tree structure (see article by Aaron Mackey: <a
href="http://www.oreillynet.com/pub/a/network/2002/11/27/bioconf.html?page=2"
class="external free"
rel="nofollow">http://www.oreillynet.com/pub/a/network/2002/11/27/bioconf.html?page=2</a>).
Only after each phylonode will have calculated indexes, the phylonode
table will be populated from the tmp table.




[Categories](Special%253ACategories "Special%253ACategories"):

- [SGN](Category%253ASGN "Category%253ASGN")
- [Chado](Category%253AChado "Category%253AChado")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Load_ncbi_taxonomy" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:29 on 29 December
  2010.</span>
<!-- - <span id="footer-info-viewcount">11,778 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





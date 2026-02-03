---
title: "Chado Group Module"
---




<span id="top"></span>




# <span dir="auto">Chado Group Module</span>









This module will facilitate comparative methods and analyses in Chado.
It mainly consists of the *grp* (group) table and supporting tables.


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Discussion</span>](#Discussion)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Use
    cases</span>](#Use_cases)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Potential
    issues</span>](#Potential_issues)
- [<span class="tocnumber">2</span> <span class="toctext">Integration
  with Chado</span>](#Integration_with_Chado)
- [<span class="tocnumber">3</span> <span class="toctext">SQL
  Implementation</span>](#SQL_Implementation)
- [<span class="tocnumber">4</span>
  <span class="toctext">Resources</span>](#Resources)



## <span id="Discussion" class="mw-headline">Discussion</span>

### <span id="Use_cases" class="mw-headline">Use cases</span>

- Protein families
- Candidate genes (QTL)
- Coexpression analysis
- Ortholog groups
- Organisms used in a study
- Stocks used in a study
- Metabolic pathways
- Functional sets
- Gene sets (a la
  <a href="http://www.broadinstitute.org/gsea/msigdb/index.jsp"
  class="external text" rel="nofollow">MSigDB</a>)
- Collections of genes/organisms (a la Entrez)

### <span id="Potential_issues" class="mw-headline">Potential issues</span>

You could potentially link an organism and a feature (and anything else
with a grpmember linker table) to the same grpmember_id.

Current schema is incompatible with chado-xml.

Should grpmember have a type_id column?

## <span id="Integration_with_Chado" class="mw-headline">Integration with Chado</span>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/c9/ChadoComparativeModule.png/1200px-ChadoComparativeModule.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c9/ChadoComparativeModule.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c9/ChadoComparativeModule.png 2x"
width="1200" height="670" alt="ChadoComparativeModule.png" />

Tables in blue would be part of the Comparative module proper, while
tables in red would be part of submodules.

Not shown: grp_cvterm, analysisgrpmember

## <span id="SQL_Implementation" class="mw-headline">SQL Implementation</span>

<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/48/ChadoGroupModule.sql" class="internal"
title="ChadoGroupModule.sql">Source Code</a>

<a href="https://github.com/autochthe/Chado-group-module.git"
class="external text" rel="nofollow">GitHub</a>

## <span id="Resources" class="mw-headline">Resources</span>

Mailing list <a
href="http://generic-model-organism-system-database.450254.n5.nabble.com/Chado-Group-Module-td5712158.html"
class="external text" rel="nofollow">discussion</a>

Original <a
href="http://generic-model-organism-system-database.450254.n5.nabble.com/Chado-Comparative-Module-tp5712078.html"
class="external text" rel="nofollow">discussion</a>

<a href="http://youtu.be/Soam8O3g1jg" class="external text"
rel="nofollow">Video</a> of original talk




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [Chado Modules](Category%253AChado_Modules "Category%253AChado Modules")
- [Comparative
  Genomics](Category%253AComparative_Genomics "Category%253AComparative Genomics")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Group_Module" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 19:50 on 23 September
  2014.</span>
<!-- - <span id="footer-info-viewcount">60,076 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





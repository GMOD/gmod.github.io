---
title: "Sybil Chado Comparative Genomics Data"
---




<span id="top"></span>




# <span dir="auto">Sybil Chado Comparative Genomics Data</span>









## <span id="Sybil_Chado_Comparative_Genomics_Data_storage" class="mw-headline">Sybil Chado Comparative Genomics Data storage</span>

This page will detail the TIGR/JCVI/IGS Sybil way of storing comparative
genomics data.

The following diagram describes how protein clusters are stored for
Sybil:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2a/ChadoSybilComparative.png" width="621"
height="355" alt="ChadoSybilComparative.png" />

The purple line represents the protein cluster and is stored in feature.

The proteins that are members of the cluster are shown with the labels
'member sequence' and are linked to the cluster feature via featurloc
(where feature_id = protein feature and srcfeature_id = cluster
feature). The featureloc rank column is incremented for each cluster
member.

------------------------------------------------------------------------

Cluster assignments are based on bi-directional best BLASTP hit. Top
BLASTP hits are stored in the database via 'match' and 'match_part'
features independent of the clustering analysis. In this way multiple
clustering analyses may be loaded which use the same set of BLASTP hits.
Loading multiple clustering analyses can be useful when one wants to try
out/compare some new clustering parameters or would like to cluster on
only a subset of the loaded genomes.

The use of featureloc to join matching regions allows for the method to
include storage of locatable syntenic regions based on whole genome
alignment or other genomic DNA based comparison methods. Doing this
would simply require replacing the 'polypeptide' feature with an
'assembly' feature in the featureloc table.

------------------------------------------------------------------------

I propose adding another link to this scheme as I feel it could help
with performance and simplify some queries. The new relationship would
be as follows:

A feature_relationship of type derived_from (Seems the most
appropriate?) that links the cluster Match feature with each of the
blastp match features that were used to generate this cluster. The new
picture would look like this:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/95/ChadoSybilComparative_new.png" width="604"
height="398" alt="ChadoSybilComparative new.png" />

  

  

  

------------------------------------------------------------------------

[Proposed schema extensions related to Sybil/IGS
needs](Proposed_schema_extensions_related_to_Sybil/IGS_needs "Proposed schema extensions related to Sybil/IGS needs")




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [Comparative
  Genomics](Category%253AComparative_Genomics "Category%253AComparative Genomics")
- [Sybil](Category%253ASybil "Category%253ASybil")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Sybil_Chado_Comparative_Genomics_Data"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:04 on 12 April
  2008.</span>
<!-- - <span id="footer-info-viewcount">21,929 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





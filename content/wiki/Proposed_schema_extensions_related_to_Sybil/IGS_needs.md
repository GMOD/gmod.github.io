---
title: "Proposed schema extensions related to Sybil/IGS needs"
---




<span id="top"></span>




# <span dir="auto">Proposed schema extensions related to Sybil/IGS needs</span>









## <span id="Representation_of_feature_graphs" class="mw-headline">Representation of feature graphs</span>

The feature_relationship table allows us to store feature graphs. In
this model, feature records are nodes and feature_relationship records
are edges. For example, consider gene annotations, such as a polypeptide
feature, and a computational pipeline that generates a graph of related
polypeptides. In this case, we seek to model the graph output of this
pipeline in feature_relationship records.

We propose adding a feature_relationship_analysis table to associate the
feature_relationship records with the analysis that generated them.




[Categories](../Special%253ACategories "Special%253ACategories"):

- [Chado](../Category%253AChado "Category%253AChado")
- [Proposals](../Category%253AProposals "Category%253AProposals")
- [Sybil](../Category%253ASybil "Category%253ASybil")






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

- <span id="t-smwbrowselink"><a
  href="../Special%253ABrowse/Proposed_schema_extensions_related_to_Sybil-2FIGS_needs"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 05:34 on 28 January
  2008.</span>
<!-- - <span id="footer-info-viewcount">10,694 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





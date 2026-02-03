---
title: "Talk:Chado Natural Diversity Module/natdiv schema changes call"
---




<span id="top"></span>




# <span dir="auto">Talk:Chado Natural Diversity Module/natdiv schema changes call</span>









This is the place to discuss the issues we have with the phenotype
module. We would like to revise it since currently the phenotype table
does not address well post-composing terms.

**Assumptions**

    1. The phenotype table is the place for storing the actual value

    2. The phenotype (the descriptor) is the cvterm

    3. Post composing cvterms can be done now in the phenotype table (using observable_id and attr_id), but we cannot reuse it 
    since it is tied with a specific value.

- To break this postcomposed phenotype - value connection can we use
  phenotype_cvterm?
  - e.g. phenotype_cvterm.cvterm_id ='mM' type_id ='unit' , cvterm_id =
    'length' , phenotype.value = 12 , observable_id = 'cotyledon'








## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="natdiv_schema_changes_call" accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>



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




- <span id="footer-info-lastmod">Last updated at 13:38 on 2 June
  2011.</span>
<!-- - <span id="footer-info-viewcount">5,567 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





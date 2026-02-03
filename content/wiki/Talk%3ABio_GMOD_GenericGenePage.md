---
title: "Talk:Bio GMOD GenericGenePage"
---




<span id="top"></span>




# <span dir="auto">Talk:Bio GMOD GenericGenePage</span>









## <span id="Stuff_Jim_made_up_while_implementing_this_for_EcoliWiki_after_the_Jan_2009_GMOD_meeting" class="mw-headline">Stuff Jim made up while implementing this for EcoliWiki after the Jan 2009 GMOD meeting</span>

In the absence of a schema to check against, I developed this by example
from Josh's Flybase example. In the process, I made some arbitrary
decisions that may be incompatible with what people want for the spec.
Please suggest changes!

- We noticed that the examples did not provide strand information, which
  makes sense, because UniProt doesn't care about strand. We added a
  strand attribute with values + and -, following GFF3
- EcoliWiki represents an E. coli K-12 "pangenome", for which we
  currently have two strains (more coming soon). For this reason, we
  have multiple entries for mapLocation elements.
- For the GO terms:
  - following the FlyBase example, I only showed GO term and evidence
    code. The list is a nonredundant list of GO term:Evidence code
    pairs; in many cases there may be multiple annotations using the
    same pairs, but based on different publications.
  - The GO list omits IEA annotations.
  - The evidence code includes the code for the evidence code type (IDA,
    IMP, etc). Flybase omits this.
- The parameters are passed to PHP without using cgi parameters or
  mod_rewrite, by using the PHP global \$\_SERVER\["PATH_INFO"\].
  - gene_symbol in the example is only one way to get this return. You
    can also use different URLs for locus tags.

--[JimHu](User%253AJimHu.1 "User%253AJimHu") 08:06, 17 January 2009 (UTC)








## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253ABio_GMOD_GenericGenePage" accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>





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




- <span id="footer-info-lastmod">Last updated at 08:06 on 17 January
  2009.</span>
<!-- - <span id="footer-info-viewcount">5,463 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





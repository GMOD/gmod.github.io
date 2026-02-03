---
title: "Talk%253AGFF"
---




<span id="top"></span>




# <span dir="auto">Talk%253AGFF</span>









The gene examples are not a valid GFF3 files

    ctg123 example mRNA            1050 9000 . + . ID=EDEN.1;Parent=EDEN;Name=EDEN.1;Index=1
    ctg123 example five_prime_UTR  1050 1200 . + . Parent=EDEN.1
    ctg123 example CDS             1201 1500 . + 0 Parent=EDEN.1
    ...
    ctg123 example three_prime_UTR 7609 9000 . + . Parent=EDEN.1

  
"Index" is not a application defined attribute, the GFF3 specification
states:

"All attributes that begin with an uppercase letter are reserved for
later use. Attributes that begin with a lowercase letter can be used
freely by applications."

As far a I can tell, the type values are case-sensitive, and UTR should
have the types

    five_prime_utr SO:0000204
    three_prime_utr SO:0000205








## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AGFF" accesskey="t"
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




- <span id="footer-info-lastmod">Last updated at 20:51 on 14 April
  2010.</span>
<!-- - <span id="footer-info-viewcount">9,807 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





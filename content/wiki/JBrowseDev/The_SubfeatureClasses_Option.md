---
title: "JBrowseDev/The SubfeatureClasses Option"
---




<span id="top"></span>




# <span dir="auto">JBrowseDev/The SubfeatureClasses Option</span>









In order to make subfeatures appear in
[JBrowse](../JBrowse.1 "JBrowse"), it is necessary to assign a
genome.css class to them. This is done in with an association list in
JSON syntax, where the key is the type of subfeature (e.g. CDS, UTR,
match_part, mRNA), and the value is the genome.css class that will be
used as the appearance of that subfeature.

As an example, the '--subfeatureClasses' argument to flatfile-to-json
might look something like '{ "CDS" : "transcript-CDS", "UTR" :
"transcript-UTR" }'. This could be rewritten as:

    '{
       "CDS" : "transcript-CDS",
       "UTR" : "transcript-UTR"  
     }'

This second format makes the JSON structure more obvious, but the first
format is easier to use as a command line argument.

# <span id="See_also" class="mw-headline">See also</span>

- <a href="General_Usage" class="mw-redirect"
  title="JBrowseDev/General Usage">General Usage Notes</a>




[Category](../Special%253ACategories "Special%253ACategories"):

- [JBrowse](../Category%253AJBrowse "Category%253AJBrowse")






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

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/JBrowseDev-2FThe_SubfeatureClasses_Option"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 17:47 on 29 July
  2011.</span>
<!-- - <span id="footer-info-viewcount">11,870 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





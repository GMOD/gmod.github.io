---
title: "JBrowseDev/The CssClass Option"
---




<span id="top"></span>




# <span dir="auto">JBrowseDev/The CssClass Option</span>









The cssClass option makes it possible to choose how a
[JBrowse](../JBrowse.1 "JBrowse") track will look by selecting a
pre-existing template. Every built-in JBrowse track template is defined
as a [Cascading Style Sheet](../Glossary#CSS "Glossary") (CSS) class in
the file 'genome.css'. This file can be edited as a regular text file,
and classes can be added, changed, or removed (although direct editing
is not necessary; it is possible to use the
[clientConfig](The_ClientConfig_Option "JBrowseDev/The ClientConfig Option")
option to avoid changing genome.css). The argument to the cssClass
option is the name of a class in genome.css.

# <span id="JBrowse_CSS_Classes" class="mw-headline">JBrowse CSS Classes</span>

As of JBrowse v1.2.1, these classes are available:

| Class Name | Shows Strand Information | Other Details |
|----|----|----|
| basic | No | Useful when it is desirable for the track appearance to be defined entirely by clientConfig. |
| cds0 | Yes |  |
| cds1 | Yes |  |
| cds2 | Yes |  |
| dblhelix | No | A black double helix outline is superimposed over the light red background. |
| est | No |  |
| exon | No |  |
| feature | Yes |  |
| feature2 | Yes |  |
| feature3 | Yes |  |
| feature4 | Yes | Pacman design. |
| feature5 | Yes |  |
| generic_parent | No |  |
| generic_part_a | No |  |
| helix | No | A single black coil outline is superimposed over a faint green background. |
| transcript | No |  |
| transcript-CDS | No |  |
| transcript-exon | No |  |
| transcript-five_prime_UTR | No | Identical to transcript-exon. |
| transcript-three_prime_UTR | No | Identical to transcript-exon. |
| transcript-UTR | No | Identical to transcript-exon. |
| triangle | No |  |

# <span id="See_also" class="mw-headline">See also</span>

- <a href="General_Usage" class="mw-redirect"
  title="JBrowseDev/General Usage">General Usage Notes</a>

# <span id="External_Links" class="mw-headline">External Links</span>




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

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/JBrowseDev-2FThe_CssClass_Option"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 17:11 on 21 June
  2013.</span>
<!-- - <span id="footer-info-viewcount">18,741 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





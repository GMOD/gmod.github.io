---
title: "Distributed Annotation System"
---




<span id="top"></span>




# <span dir="auto">Distributed Annotation System</span>





(Redirected from
[DAS](DAS)







<a href="http://www.biodas.org/" rel="nofollow"
title="Distributed Annotation System"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/32/Das_logo_64x64.jpg" width="64" height="64"
alt="Distributed Annotation System" /></a>



The Distributed Annotation System, or DAS, is a protocol for exchanging
and retrieving sequence annotations, possibly from multiple sources.
With DAS you don't have to store annotation data to use or display it.
You only have to know how to retrieve it from a DAS server.

See the <a href="http://www.biodas.org/" class="external text"
rel="nofollow">BioDas web site</a> for a full explanation of DAS

  


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">DAS/1 and
  DAS/2</span>](#DAS.2F1_and_DAS.2F2)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Preserving
    DAS/1 Strengths in
    DAS/2</span>](#Preserving_DAS.2F1_Strengths_in_DAS.2F2)
- [<span class="tocnumber">2</span> <span class="toctext">DAS in
  GMOD</span>](#DAS_in_GMOD)
- [<span class="tocnumber">3</span>
  <span class="toctext">Presentations</span>](#Presentations)



## <span id="DAS.2F1_and_DAS.2F2" class="mw-headline">DAS/1 and DAS/2</span>

DAS/1 was the original release of DAS. It is widely used, and that use
revealed some weaknesses in the design. DAS/2 attempts to address these
weaknesses.

### <span id="Preserving_DAS.2F1_Strengths_in_DAS.2F2" class="mw-headline">Preserving DAS/1 Strengths in DAS/2</span>

- Keep focus on location-based annotation of biological sequences.
- Protocol, not an implementation.
  - HTTP for transport,
  - URLs for queries
  - XML for responses
  - REST-like style.
- No Required central authority.
- Couple XML response to URL request formats.
- XML has been shortened, but big gain comes from client-server content
  format negotiation, including binary. Empty elements dropped.
- Uses HTTP caching in the client.
- [IGB](IGB "IGB") - reference client for DAS2. Integrated Genome
  Browser

  

## <span id="DAS_in_GMOD" class="mw-headline">DAS in GMOD</span>

These components work with DAS servers:

- [GBrowse](GBrowse.1 "GBrowse") - See
  <a href="GBrowse_adaptors" class="mw-redirect"
  title="GBrowse adaptors">GBrowse adaptors</a>

## <span id="Presentations" class="mw-headline">Presentations</span>

- [DAS
  Update](August_2009_GMOD_Meeting#DAS_update "August 2009 GMOD Meeting"),
  [August 2009 GMOD
  Meeting](August_2009_GMOD_Meeting "August 2009 GMOD Meeting")
- [Distributed Annotation Systems/2
  (DAS/2)](November_2007_GMOD_Meeting#Distributed_Annotation_System.2F2_.28DAS.2F2.29 "November 2007 GMOD Meeting"),
  [November 2007 GMOD
  Meeting](November_2007_GMOD_Meeting "November 2007 GMOD Meeting")
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/74/Das.ppt" class="internal"
  title="Das.ppt">DAS2</a>, [May 2005 GMOD
  Meeting](May_2005_GMOD_Meeting "May 2005 GMOD Meeting")




[Category](Special%253ACategories "Special%253ACategories"):

- [DAS](Category%253ADAS "Category%253ADAS")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Distributed_Annotation_System"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:47 on 17 September
  2012.</span>
<!-- - <span id="footer-info-viewcount">48,584 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





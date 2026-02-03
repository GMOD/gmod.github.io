---
title: "PostgreSQL Performance Tips"
---




<span id="top"></span>




# <span dir="auto">PostgreSQL Performance Tips</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Background</span>](#Background)
- [<span class="tocnumber">2</span> <span class="toctext">General
  Tips</span>](#General_Tips)
- [<span class="tocnumber">3</span> <span class="toctext">Database
  initialization</span>](#Database_initialization)
- [<span class="tocnumber">4</span> <span class="toctext">Configuration
  options</span>](#Configuration_options)
- [<span class="tocnumber">5</span>
  <span class="toctext">Vacuuming</span>](#Vacuuming)
  - [<span class="tocnumber">5.1</span> <span class="toctext">Auto
    vacuuming</span>](#Auto_vacuuming)
- [<span class="tocnumber">6</span> <span class="toctext">Powering
  GBrowse</span>](#Powering_GBrowse)
- [<span class="tocnumber">7</span> <span class="toctext">Installing
  Schema</span>](#Installing_Schema)



## <span id="Background" class="mw-headline">Background</span>

This page is for collecting tips on tuning
[PostgreSQL](PostgreSQL "PostgreSQL"), especially when using it with
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>. Feel free
to place information from your own experience on this page. Unless
otherwise indicated the tips on this page refer to PostgreSQL servers in
the 8.x series.

## <span id="General_Tips" class="mw-headline">General Tips</span>


- [PostgreSQL](Category%253APostgreSQL "Category%253APostgreSQL")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/PostgreSQL_Performance_Tips"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 17:57 on 5 February
  2014.</span>
<!-- - <span id="footer-info-viewcount">117,518 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





---
title: "Apollo PureJDBCTransactionWriter HOWTO"
---




<span id="top"></span>




# <span dir="auto">Apollo PureJDBCTransactionWriter HOWTO</span>









This HOWTO contains instructions for using the
[Apollo](Apollo.1 "Apollo") PureJDBCTransactionWriter, a component of
the chado/JDBC adapter that allows Apollo to save changes directly to a
<a href="Chado" class="mw-redirect" title="Chado">chado</a> database via
JDBC, without having to install any stored procedures or triggers in the
target database.

  


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Background</span>](#Background)
- [<span class="tocnumber">2</span>
  <span class="toctext">Prerequisites</span>](#Prerequisites)
- [<span class="tocnumber">3</span> <span class="toctext">Edit
  configuration files</span>](#Edit_configuration_files)
  - [<span class="tocnumber">3.1</span>
    <span class="toctext">conf/apollo.cfg</span>](#conf.2Fapollo.cfg)
  - [<span class="tocnumber">3.2</span>
    <span class="toctext">conf/chado-adapter.xml</span>](#conf.2Fchado-adapter.xml)
  - [<span class="tocnumber">3.3</span> <span class="toctext">Style and
    tiers files</span>](#Style_and_tiers_files)
- [<span class="tocnumber">4</span> <span class="toctext">Configure
  and/or create name
  adapter</span>](#Configure_and.2For_create_name_adapter)
- [<span class="tocnumber">5</span> <span class="toctext">Test saving
  edits</span>](#Test_saving_edits)
- [<span class="tocnumber">6</span> <span class="toctext">Other
  notes</span>](#Other_notes)
- [<span class="tocnumber">7</span> <span class="toctext">Known
  limitations</span>](#Known_limitations)
- [<span class="tocnumber">8</span> <span class="toctext">Known
  bugs</span>](#Known_bugs)
- [<span class="tocnumber">9</span>
  <span class="toctext">FAQ</span>](#FAQ)
  - [<span class="tocnumber">9.1</span> <span class="toctext">Is it
    possible to use both JDBCTransactionWriter and
    PureJDBCTransactionWriter in the same Apollo
    install?</span>](#Is_it_possible_to_use_both_JDBCTransactionWriter_and_PureJDBCTransactionWriter_in_the_same_Apollo_install.3F)
- [<span class="tocnumber">10</span>
  <span class="toctext">Authors</span>](#Authors)



# <span id="Background" class="mw-headline">Background</span>

The [Apollo](Apollo.1 "Apollo")
<a href="Chado" class="mw-redirect" title="Chado">chado</a>/JDBC data
adapter currently supports **two** methods for saving changes made in
Apollo to a chado database via JDBC. These two methods are implemented
by the following (Java) classes:






[Categories](Special%253ACategories "Special%253ACategories"):

- [Apollo](Category%253AApollo "Category%253AApollo")
- [Chado](Category%253AChado "Category%253AChado")
- [Java](Category%253AJava "Category%253AJava")
- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Apollo_PureJDBCTransactionWriter_HOWTO"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:58 on 15 September
  2009.</span>
<!-- - <span id="footer-info-viewcount">51,821 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





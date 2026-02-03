---
title: "News/Chado 1.23 released"
---




<span id="top"></span>




# <span dir="auto">News/Chado 1.23 released</span>









From [Scott Cain](../User%253AScott "User%253AScott"):

I've just released Chado 1.23. This is a bug fix release with no changes
to the schema from the 1.22 release. If you are upgrading from Chado 1.2
or later, installing this bug fix release is easy; type the following
commands:

      perl Makefile.PL
      make
      sudo make install

If you're installing from before Chado 1.2, you can add

      make update

which should update the schema (after backing up your database, of
course). See [Updating Chado](../Updating_Chado "Updating Chado") for
more information. Chado 1.23 can be
<a href="https://sourceforge.net/projects/gmod/files/gmod/chado-1.23/"
class="external text" rel="nofollow">downloaded from SourceForge</a>.

  
Here are the changes from the last release:

- Added \$VERSION to Bio%253A%253AGMOD::DB::Config so that when installing
  Bio::DB::Das::Chado it would be happy.
- Changed all perl script \#! lines to use /usr/bin/env perl instead of
  the mishmash that was being used in various scripts.
- Fixed the GFF3 preprocessor so that if an insert into the sorting
  table fails, the script will die to avoid losing GFF lines in the
  resulting file.
- Modified Makefile.PL so that if using PREFIX it won't stomp on the
  GMOD_ROOT environment variable (that is, everything goes in PREFIX,
  except what goes in GMOD_ROOT).

  



*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2012/12/13*






[Categories](../Special%253ACategories "Special%253ACategories"):

- [News Items](../Category%253ANews_Items "Category%253ANews Items")
- [Chado](../Category%253AChado "Category%253AChado")






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

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/News-2FChado_1.23_released"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:13 on 14 December
  2012.</span>
<!-- - <span id="footer-info-viewcount">7,559 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





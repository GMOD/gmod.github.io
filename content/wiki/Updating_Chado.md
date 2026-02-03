---
title: "Updating Chado"
---




<span id="top"></span>




# <span dir="auto">Updating Chado</span>









As of <a href="Chado" class="mw-redirect" title="Chado">Chado</a>
version 1.2, the Chado software distribution comes with a tool to
upgrade the Chado schema from an old version (1.0 or newer) to a new
one. This tool, gmod_update_chado.pl, will get installed with other
scripts when you execute "make install" and depends on another tool,
gmod_chado_properties.pl, which determines the version of the current
Chado database and is also installed when you install Chado.

**NOTE:** Since this is a new tool, I strongly suggest you back up your
database before trying to upgrade via this method! You have been
warned! :-)

To use the updater, you can start the installation like you normally
would:

     perl Makefile.PL
     make
     sudo make install

and then, rather than doing the next step (make load_schema) which would
wipe out the current database, do

     make update

which will (hopefully) do the updating for you. Note that if you
modified the schema after you installed Chado the last time, this update
may fail. Please watch the output from the PostgreSQL server to look for
"ERROR" statements.

You can also run this updater on the command line to update any Chado
database by providing it's name, like this:

     gmod_update_chado.pl --dbprofile chado_db_name

which will make use of the database connection parameters stored in that
database's configuration file in \$GMOD_ROOT/conf.

If you experience problems with this updating protocol, please send
comments, questions and issue reports to
gmod-schema@lists.sourceforge.net.




[Category](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Updating_Chado" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:48 on 22 July
  2013.</span>
<!-- - <span id="footer-info-viewcount">11,382 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





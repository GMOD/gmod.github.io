---
title: "Chado GBrowse Summary View"
---




<span id="top"></span>




# <span dir="auto">Chado GBrowse Summary View</span>









Starting in [GBrowse](GBrowse.1 "GBrowse") version 2.13, administrators
have the option of configuring a *summary view* (feature density) for
tracks when zoomed out too far to effectively show individual features,
and starting with the 0.30 release of
<a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a> this
functionality is supported for browsing
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> databases
with GBrowse.

## <span id="Prerequisites" class="mw-headline">Prerequisites</span>

- [GBrowse](GBrowse.1 "GBrowse") 2.13
- <a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
  class="external text" rel="nofollow">Bio::DB::Das::Chado</a> 0.31
- [PostgreSQL](PostgreSQL "PostgreSQL") 8.1 (probably--I only tested
  with 8.4, but I'm reasonably sure it will work with versions back to
  8.1)

## <span id="Configuration" class="mw-headline">Configuration</span>

To support the summary view,
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> needs an
additional table that the Chado [GBrowse
adaptor](GBrowse_Adaptors "GBrowse Adaptors") will use to calculate the
summary view. To create this table (gff_interval_stats) and populate it
with data, the
<a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a>
distribution comes with a perl script,
`gmod_create_summary_statistics.pl`. Executing this script, optionally
with a `--dbprofile` flag to indicate the database to work on, will
create the table if it doesn't exist, as well as a few stored procedures
for populating the table, and then execute the stored procedure. This
script can also be used in a
<a href="http://linuxmanpages.com/man8/cron.8.php" class="external text"
rel="nofollow"><code>cron</code></a> job to periodically recreate the
data in the summary statistics data when the data in the table becomes
stale due to added data.

To turn on summaries, add this line to your data source's conf file in
the main section:

     show summary   = 100000

which will make all tracks go to the summary view when the region shown
is greater than 100000. To turn summaries off for a given track, add

     show summary   = 0

to the track configuration.




[Categories](Special%253ACategories "Special%253ACategories"):

- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")
- [Chado](Category%253AChado "Category%253AChado")






## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AChado_GBrowse_Summary_View" accesskey="t"
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_GBrowse_Summary_View"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 12:55 on 4 May
  2011.</span>
<!-- - <span id="footer-info-viewcount">17,392 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





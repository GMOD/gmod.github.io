---
title: "Chado Full Text Search"
---




<span id="top"></span>




# <span dir="auto">Chado Full Text Search</span>









Starting with the 0.30 release of the
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> [GBrowse
adaptor](GBrowse_Adaptors "GBrowse Adaptors")
(<a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a>), there is
support for full text searching of names and attributes of features in
Chado through the GBrowse "Landmark or Region" search box. This
functionality is present largely due to the initial work by
<a href="http://www.scri.ac.uk/staff/leightonpritchard"
class="external text" rel="nofollow">Leighton Pritchard</a>, and we'd
like to thank him for contributing to the Chado GBrowse adaptor.

## <span id="Prerequisites" class="mw-headline">Prerequisites</span>

- [PostgreSQL](PostgreSQL "PostgreSQL") 8.4
- <a href="Chado" class="mw-redirect" title="Chado">Chado</a> 1.11
- [GBrowse](GBrowse.1 "GBrowse") 1.70 or 2.0

## <span id="Configuration" class="mw-headline">Configuration</span>

Before full text searching can be used, the database must be prepared.
Full text searching requires that a view that is present in the standard
Chado distribution be materialized (that is, turned into a table), as
well as adding a column to a few tables. The Chado GBrowse adaptor comes
with a script, `gmod_chado_fts_prep.pl`, that will perform these
actions:

- Validate that you have the prerequisite software.
- Add "searchable_name" column to the
  [feature](Chado_Sequence_Module#Table:_feature "Chado Sequence Module")
  table.
- Add "searchable_synonym_sgml" column to the
  [synonym](Chado_Sequence_Module#Table:_synonym "Chado Sequence Module")
  table.
- Add "searchable_accession" column to the
  [dbxref](Chado_General_Module#Table:_dbxref "Chado General Module")
  table.
- Add triggers on these tables so that when the name or accession is
  added or modified, the "searchable" column will be updated too.
- Execute the `gmod_materialized_view_tool.pl` to materialize the
  all_feature_names view.

In order to turn on full text searching through GBrowse, the
`-fulltext 1` argument must be passed to the Chado GBrowse adaptor from
the configuration file. Like this example:

    [main:database]
    db_adaptor    = Bio::DB::Das::Chado
    db_args       = -dsn dbi:Pg:dbname=chado;host=localhost;port=5432
                   -user cain
                   -organism 'Saccharomyces cerevisiae'
                   -srcfeatureslice 1
                   -fulltext 1

## <span id="Maintaining_the_materialized_view" class="mw-headline">Maintaining the materialized view</span>

If the data in your
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> database is
changing, it is a good idea to periodically update the all_feature_names
materialized view. The `gmod_materialized_view_tool.pl` has a function
for examining the database and updating materialized views. This
functionality can be run via a
<a href="http://linuxmanpages.com/man8/cron.8.php" class="external text"
rel="nofollow"><code>cron</code></a> job to make it happen on a regular
basis:

     1 0 * * * gmod_materialized_view_tool.pl --automatic

In this example, `cron` will examine the database, and if a view hasn't
be updated recently, it will update the materialized at one minute past
midnight, everyday.

To determine if a materialized view is out of date, the script only
checks when was the last time it was updated, and if it is older than
the configured time, the script recreates the materialized view (that
is, there is no process for "marking" a view as out of date, because for
instance, data has been inserted into one of the underlying tables).
When the all_feature_names materialized view was created with the above
script, the frequency was set at daily, but this can be modified by
updating the materialized_view table, and changing the value in
refresh_time, which is an integer number of seconds. The default value
is 86400 (24 hours \* 60 minutes \* 60 seconds), but can be changed to
weekly (604800) or any other value desired:


``` de1
  UPDATE materialized_view SET refresh_time = 604800 WHERE name = 'all_feature_names';
```





[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Full_Text_Search" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:33 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">26,787 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





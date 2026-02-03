---
title: "Chado Full Text Search"
---
# Chado Full Text Search

Starting with the 0.30 release of the
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> [GBrowse
adaptor](/wiki/GBrowse_Adaptors)
(<a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a>), there is
support for full text searching of names and attributes of features in
Chado through the GBrowse "Landmark or Region" search box. This
functionality is present largely due to the initial work by
<a href="http://www.scri.ac.uk/staff/leightonpritchard"
class="external text" rel="nofollow">Leighton Pritchard</a>, and we'd
like to thank him for contributing to the Chado GBrowse adaptor.

## Prerequisites

- [PostgreSQL](/wiki/PostgreSQL) 8.4
- <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> 1.11
- [GBrowse](/wiki/GBrowse) 1.70 or 2.0

## Configuration

Before full text searching can be used, the database must be prepared.
Full text searching requires that a view that is present in the standard
Chado distribution be materialized (that is, turned into a table), as
well as adding a column to a few tables. The Chado GBrowse adaptor comes
with a script, `gmod_chado_fts_prep.pl`, that will perform these
actions:

- Validate that you have the prerequisite software.
- Add "searchable_name" column to the
  [feature](/wiki/Chado_Sequence_Module#Table:_feature)
  table.
- Add "searchable_synonym_sgml" column to the
  [synonym](/wiki/Chado_Sequence_Module#Table:_synonym)
  table.
- Add "searchable_accession" column to the
  [dbxref](/wiki/Chado_General_Module#Table:_dbxref)
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

## Maintaining the materialized view

If the data in your
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> database is
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

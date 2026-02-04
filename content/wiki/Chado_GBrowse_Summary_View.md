---
title: "Chado GBrowse Summary View"
---
# Chado GBrowse Summary View

Starting in [GBrowse](/wiki/GBrowse) version 2.13, administrators
have the option of configuring a *summary view* (feature density) for
tracks when zoomed out too far to effectively show individual features,
and starting with the 0.30 release of
<a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a> this
functionality is supported for browsing
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> databases
with GBrowse.

## Prerequisites

- [GBrowse](/wiki/GBrowse) 2.13
- <a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
 class="external text" rel="nofollow">Bio::DB::Das::Chado</a> 0.31
- [PostgreSQL](/wiki/PostgreSQL) 8.1 (probably--I only tested
 with 8.4, but I'm reasonably sure it will work with versions back to
 8.1)

## Configuration

To support the summary view,
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> needs an
additional table that the Chado [GBrowse
adaptor](/wiki/GBrowse_Adaptors) will use to calculate the
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

 show summary = 100000

which will make all tracks go to the summary view when the region shown
is greater than 100000. To turn summaries off for a given track, add

 show summary = 0

to the track configuration.

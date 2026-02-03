---
title: "Materialized views"
---
# Materialized views

Materializing a view is the process of taking a view (which is a sort of
virtual table) and turning it into a real table that can be indexed for
better performance. While [PostgreSQL](/wiki/PostgreSQL) doesn't
support maintenance of materialized views, we have written a command
line tool that will handle the creation and maintenance of materialized
views in <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>
running on PostgreSQL.

  gmod_materialized_view_tool.pl](#gmod_materialized_view_tool.pl)
  - [Creating a
    materialized view
    example](#Creating_a_materialized_view_example)
  - [Example
    crontab entry to maintain materialized
    views](#Example_crontab_entry_to_maintain_materialized_views)
  - [Authors](#Authors)

# gmod_materialized_view_tool.pl

The perl script gmod_materialized_view_tool.pl (which resides in
schema/chado/bin, and gets installed in your path when you do
`sudo make install`) has several options for creating and maintaining
materialized views:

           -c|--create_view

           Guides the user through a series of prompts to create a new material‐
           ized view.

           -u|--update_view viewname

           Updates the data in a materialized view by first deleting the data in
           the table and then running the query that defines the data to repopu‐
           late it.

           -a|--automatic

           Automatically updates all of the MVs that are currently marked out of
           date according to the update frequency that was specified when the MV
           was created.  This option is very useful in a cron job to update MVs on
           a regular basis.

           --dematerialize viewname

           Takes a MV and turns into a standard view.  This might be done if the
           database administrator decides that the downsides of the MV scheme is
           not working for a given view, if for example, the data in the underly‐
           ing tables is changing to frequently or the MV is taking up too much
           disk space.

           --dbprofile

           The name of the DB profile to use for database connectivity.  These
           profiles are kept in $GMOD_ROOT/conf (typically /usr/local/gmod/conf)
           and contain information like the database name, user name and password.
           The default value is ’default’ which was created when the Chado
           database was created.

           -l|--list

           Gives a list of current MVs.

           -s|--status

           Gives the status of all MVs, including whether they are considered cur‐
           rent or out of date.

           -h|--help

           Prints documentation and quits.

## Creating a materialized view example

     gmod_materialized_view_tool.pl -c

    ==========================================
    Viewing 'chado' database on host localhost
    ==========================================

    =================================
    Creating a new materialized view!
    =================================

    Give your materialized view a name (word characters only):all_feature_names

    Where will this MV be located? (schemaname.tablename):public.all_feature_names

    A view with this name already exists; do you want to replace it
    with a materialized view? [y|n] y

    How often, in seconds, should the MV be refreshed?
    You can also type 'daily', 'weekly', 'monthly' (30 days), or 'yearly' (365 days):daily
    Using refresh_time of 86400 seconds

    Enter specifications for the materialized view, OR provide a file in which
    the specs are written ('? for help):feature_id integer,name varchar(255)

    Enter the SQL query for the materialized view,
    or a file containing only the query:SELECT feature_id,uniquename FROM feature UNION SELECT feature_id, name FROM feature UNION SELECT fs.feature_id,s.name FROM feature_synonym fs, synonym s WHERE fs.synonym_id = s.synonym_id

    Enter a comma separated list of fields to index (or return for none):feature_id,name

    Enter the SQL queries for special indexes,
    or a file containing only the query (or return for none):create index all_feature_names_lower_name on all_feature_names (lower(name))

    Confirm that the following is correct:
    Name: all_feature_names
    Location: public.all_feature_names
    Refresh Time (sec): 86400
    MV creation query: CREATE TABLE public.test_view ( feature_id integer,name varchar(255) )
    Query: SELECT feature_id,uniquename FROM feature UNION SELECT feature_id, name FROM feature UNION SELECT fs.feature_id,s.name FROM feature_synonym fs, synonym s WHERE fs.synonym_id = s.synonym_id
    Indexes on: feature_id,name
    Special index query: create index all_feature_names_lower_name on all_feature_names (lower(name))

    Enter 'y' to confirm, 'n' to re-enter data: y

And it goes on to create the table and populate it, giving real time
estimates of completion time.

## Example crontab entry to maintain materialized views

<a href="http://en.wikipedia.org/wiki/Crontab" class="external text"
rel="nofollow">Cron</a> is a unix tool for executing commands on a
regular specified interval. To create a new crontab entry, execute the
command `crontab -e`, and enter the special syntax and the command to be
run. For example, if you wanted the materialized view tool to run every
night at 1:16AM, you would enter this:

     16 1 * * * /usr/bin/gmod_materialized_view_tool.pl -a

Where the stars mean 'every day of the month', 'every month of the year'
and 'every day of the week' respectively.

## Authors

The script described in this page was originally written by Chris
Carpita and modified by [Scott Cain](/wiki/User%253AScott)

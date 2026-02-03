---
title: "GBrowse Tutorial 2010"
---
# GBrowse Tutorial 2010

TutorialHeader \| what = GBrowse \| where = [2010 GMOD Summer
School -
Americas](/wiki/2010_GMOD_Summer_School_-_Americas)
\| who = [Scott Cain](/wiki/User%253AScott) \| when = May 2010 \|
logo = GBrowseLogo.png

  VMware](#VMware)
- [Caveats](#Caveats)
- [Prerequisites](#Prerequisites)
- [Install
  GBrowse](#Install_GBrowse)
- [Tutorial](#Tutorial)
- [Basic Chado
  Configuration (if we have
  time)](#Basic_Chado_Configuration_.28if_we_have_time.29)
  - [Materialized views for
    searching](#Materialized_views_for_searching)

## VMware

This tutorial was taught using a VMware system image
as a starting point. If you want to start with the same system, download
and install the start image (below). See VMware for what
software you need to use a VMware system image and for directions on how
to get the image up and running on your machine.

Download the <a href="/wiki/ftp://ftp.gmod.org/pub/gmod/Courses/2010/SummerSchoolAmericas/GMODCourse2010Day1.vmwarevm.tar.gz"
class="external text" rel="nofollow">start image</a> and the <a href="/wiki/ftp://ftp.gmod.org/pub/gmod/Courses/2010/SummerSchoolAmericas/GMODCourse2010Day2.vmwarevm.tar.gz"
class="external text" rel="nofollow">end image</a>.

**Logins**:

| Purpose | Username | Password         | ------- | -------- | ---------------- | Shell   | gmod     | gmodamericas2010 | MySQL   | root     | gmodamericas2010 |

## Caveats

**Important Note**

This [tutorial](/wiki/Category%253ATutorials) describes the
world as it existed on the day the tutorial was given. Please be aware
that things like CPAN modules, Java libraries, and Linux packages change
over time, and that the instructions in the tutorial will slowly drift
over time. Newer versions of tutorials will be posted as they become
available.

## Prerequisites

Installed before using apt or cpan.

## Install GBrowse

Easily installed via the cpan shell:

     sudo cpan
     cpan> install Bio::Graphics::Browser2

Which gets all of the prereqs that aren't installed on the machine.

## Tutorial

Go to <a href="http://localhost/gbrowse" class="external free"
rel="nofollow">http://localhost/gbrowse</a>

## Basic <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> Configuration (if we have time)

<a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a> was
installed when we created the image, but I've since released a new
version, so we can install the new version with the cpan shell:

     sudo cpan
     cpan> install Bio::DB::Das::Chado</enter>

Simple config file in `/etc/gbrowse2/pythium.conf`

Some simple tweaks and additions:

- fix the dbi string
- add nucleotide matches
- strip out stuff that is in `/etc/gbrowse2/GBrowse.conf`

### Materialized views for searching

Chado comes with a tool to materialize views written by developers at
the [SOL Genomics Network (SGN)](/wiki/Category%253ASGN). A
materialized view is faster (at the expense of more disk space) to
search than a regular view (which is really a query over potentially
several tables). To create a materialized view that makes searching a
GBrowse <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>
instance a faster, we can do this:

     gmod_materialized_view_tool.pl -c

which will ask us several obscure questions for which we need to provide
obscure answers:

     Give your materialized view a name (word characters only):
     all_feature_names

     Where will this MV be located? (schemaname.tablename):
     public.all_feature_names

     A view with this name already exists; do you want to replace it
     with a materialized view? [y|n]
     y

     How often, in seconds, should the MV be refreshed?
     You can also type 'daily', 'weekly', 'monthly' (30 days), or 'yearly' (365 days):
     weekly

     Enter specifications for the materialized view, OR provide a file in which
     the specs are written ('? for help):
     feature_id integer,name varchar(255)

     Enter the SQL query for the materialized view,
     or a file containing only the query:
     SELECT feature_id,CAST(substring(uniquename from 0 for 255) as varchar(255)) as name FROM feature UNION SELECT feature_id, name FROM feature where name is not null UNION SELECT fs.feature_id,s.name FROM feature_synonym fs, synonym s WHERE fs.synonym_id = s.synonym_id

     Enter a comma separated list of fields to index (or return for none):
     feature_id,name

     Enter the SQL queries for special indexes,
     or a file containing only the query (or return for none):
     create index all_feature_names_lower_name on all_feature_names (lower(name))

     Enter 'y' to confirm, 'n' to re-enter data:
     y

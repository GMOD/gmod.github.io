---
title: "GBrowse Tutorial 2010"
---




<span id="top"></span>


# <span dir="auto">GBrowse Tutorial 2010</span>









TutorialHeader \| what = GBrowse \| where = [2010 GMOD Summer
School -
Americas](2010_GMOD_Summer_School_-_Americas "2010 GMOD Summer School - Americas")
\| who = [Scott Cain](User%253AScott "User%253AScott") \| when = May 2010 \|
logo = GBrowseLogo.png


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">VMware</span>](#VMware)
- [<span class="tocnumber">2</span>
  <span class="toctext">Caveats</span>](#Caveats)
- [<span class="tocnumber">3</span>
  <span class="toctext">Prerequisites</span>](#Prerequisites)
- [<span class="tocnumber">4</span> <span class="toctext">Install
  GBrowse</span>](#Install_GBrowse)
- [<span class="tocnumber">5</span>
  <span class="toctext">Tutorial</span>](#Tutorial)
- [<span class="tocnumber">6</span> <span class="toctext">Basic Chado
  Configuration (if we have
  time)</span>](#Basic_Chado_Configuration_.28if_we_have_time.29)
  - [<span class="tocnumber">6.1</span>
    <span class="toctext">Materialized views for
    searching</span>](#Materialized_views_for_searching)



## <span id="VMware" class="mw-headline">VMware</span>

This tutorial was taught using a VMware system image
as a starting point. If you want to start with the same system, download
and install the start image (below). See VMware for what
software you need to use a VMware system image and for directions on how
to get the image up and running on your machine.

Download the <a
href="ftp://ftp.gmod.org/pub/gmod/Courses/2010/SummerSchoolAmericas/GMODCourse2010Day1.vmwarevm.tar.gz"
class="external text" rel="nofollow">start image</a> and the <a
href="ftp://ftp.gmod.org/pub/gmod/Courses/2010/SummerSchoolAmericas/GMODCourse2010Day2.vmwarevm.tar.gz"
class="external text" rel="nofollow">end image</a>.

**Logins**:

| Purpose | Username | Password         |
| ------- | -------- | ---------------- |
| Shell   | gmod     | gmodamericas2010 |
| MySQL   | root     | gmodamericas2010 |

## <span id="Caveats" class="mw-headline">Caveats</span>



**Important Note**

This [tutorial](Category%253ATutorials "Category%253ATutorials") describes the
world as it existed on the day the tutorial was given. Please be aware
that things like CPAN modules, Java libraries, and Linux packages change
over time, and that the instructions in the tutorial will slowly drift
over time. Newer versions of tutorials will be posted as they become
available.



## <span id="Prerequisites" class="mw-headline">Prerequisites</span>

Installed before using apt or cpan.

## <span id="Install_GBrowse" class="mw-headline">Install GBrowse</span>

Easily installed via the cpan shell:

     sudo cpan
     cpan> install Bio::Graphics::Browser2

Which gets all of the prereqs that aren't installed on the machine.

## <span id="Tutorial" class="mw-headline">Tutorial</span>

Go to <a href="http://localhost/gbrowse" class="external free"
rel="nofollow">http://localhost/gbrowse</a>

## <span id="Basic_Chado_Configuration_.28if_we_have_time.29" class="mw-headline">Basic <a href="Chado" class="mw-redirect" title="Chado">Chado</a> Configuration (if we have time)</span>

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

### <span id="Materialized_views_for_searching" class="mw-headline">Materialized views for searching</span>

Chado comes with a tool to materialize views written by developers at
the [SOL Genomics Network (SGN)](Category%253ASGN "Category%253ASGN"). A
materialized view is faster (at the expense of more disk space) to
search than a regular view (which is really a query over potentially
several tables). To create a materialized view that makes searching a
GBrowse <a href="Chado" class="mw-redirect" title="Chado">Chado</a>
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




[Categories](Special%253ACategories "Special%253ACategories"):

- [GBrowse 2](Category%253AGBrowse_2 "Category%253AGBrowse 2")
- [Tutorials](Category%253ATutorials "Category%253ATutorials")






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



- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse_Tutorial_2010" rel="smw-browse">Browse
  properties</a></span>





- <span id="footer-info-lastmod">Last updated at 21:38 on 2 October 2012.</span>
<!-- - <span id="footer-info-viewcount">16,535 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->



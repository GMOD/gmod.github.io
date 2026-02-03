---
title: "Chado FAQ"
---




<span id="top"></span>




# <span dir="auto">Chado FAQ</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">About this
  FAQ</span>](#About_this_FAQ)
  - [<span class="tocnumber">1.1</span> <span class="toctext">What is
    this FAQ?</span>](#What_is_this_FAQ.3F)
  - [<span class="tocnumber">1.2</span> <span class="toctext">How is it
    maintained?</span>](#How_is_it_maintained.3F)
- [<span class="tocnumber">2</span> <span class="toctext">Chado
  Questions</span>](#Chado_Questions)
  - [<span class="tocnumber">2.1</span> <span class="toctext">How do you
    pronounce *chado*?</span>](#How_do_you_pronounce_chado.3F)
  - [<span class="tocnumber">2.2</span> <span class="toctext">How does
    one represent BLAST results in Chado? or alignments?
    or...</span>](#How_does_one_represent_BLAST_results_in_Chado.3F_or_alignments.3F_or...)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Where do I
    find a list of tables in
    Chado?</span>](#Where_do_I_find_a_list_of_tables_in_Chado.3F)
  - [<span class="tocnumber">2.4</span> <span class="toctext">What are
    the modules in Chado?</span>](#What_are_the_modules_in_Chado.3F)
  - [<span class="tocnumber">2.5</span> <span class="toctext">Is there a
    *Chado for Beginners*?</span>](#Is_there_a_Chado_for_Beginners.3F)
  - [<span class="tocnumber">2.6</span> <span class="toctext">Loading
    data into Chado</span>](#Loading_data_into_Chado)
  - [<span class="tocnumber">2.7</span> <span class="toctext">Why is
    loading GFF3 data so slow and what can I do about
    it?</span>](#Why_is_loading_GFF3_data_so_slow_and_what_can_I_do_about_it.3F)
  - [<span class="tocnumber">2.8</span> <span class="toctext">I get a
    weird error when loading ontologies; what do I
    do?</span>](#I_get_a_weird_error_when_loading_ontologies.3B_what_do_I_do.3F)
  - [<span class="tocnumber">2.9</span> <span class="toctext">Is it
    possible to load ontologies without the DBIx::DBStag
    Module?</span>](#Is_it_possible_to_load_ontologies_without_the_DBIx::DBStag_Module.3F)
  - [<span class="tocnumber">2.10</span> <span class="toctext">Loading
    Ontologies takes forever! There has to be a better
    way?</span>](#Loading_Ontologies_takes_forever.21_There_has_to_be_a_better_way.3F)



  

## <span id="About_this_FAQ" class="mw-headline">About this FAQ</span>

### <span id="What_is_this_FAQ.3F" class="mw-headline">What is this FAQ?</span>

It is the list of Frequently Asked Questions about
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>. It
summarises the questions that have come up on the Chado
<a href="Mailing_list" class="mw-redirect" title="Mailing list">mailing
list</a>.

### <span id="How_is_it_maintained.3F" class="mw-headline">How is it maintained?</span>

It is now maintained as a
<a href="http://en.wikipedia.org/wiki/Wiki" class="extiw"
title="wp:Wiki">Wiki</a> on this site. You can help maintain it by
adding questions and answers.

## <span id="Chado_Questions" class="mw-headline">Chado Questions</span>

### <span id="How_do_you_pronounce_chado.3F" class="mw-headline">How do you pronounce *chado*?</span>

*Chado* is usually pronounced
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e4/Chado.mp3" class="internal"
title="Chado.mp3">like this</a>.

### <span id="How_does_one_represent_BLAST_results_in_Chado.3F_or_alignments.3F_or..." class="mw-headline">How does one represent BLAST results in Chado? or alignments? or...</span>

Questions about the best ways to represent a variety of observations are
answered at the [Chado Best
Practices](Chado_Best_Practices "Chado Best Practices") page. There is
also a worked example for this at
[Load_BLAST_Into_Chado](Load_BLAST_Into_Chado "Load BLAST Into Chado").

### <span id="Where_do_I_find_a_list_of_tables_in_Chado.3F" class="mw-headline">Where do I find a list of tables in Chado?</span>

The [Chado Tables](Chado_Tables "Chado Tables") page.

### <span id="What_are_the_modules_in_Chado.3F" class="mw-headline">What are the modules in Chado?</span>

They are listed in the [Chado
Manual](Chado_Manual#Modules "Chado Manual") page.

### <span id="Is_there_a_Chado_for_Beginners.3F" class="mw-headline">Is there a *Chado for Beginners*?</span>

The best place to start would be the [Chado
Manual](Chado_Manual#Modules "Chado Manual") or
[Overview](Overview "Overview").

### <span id="Loading_data_into_Chado" class="mw-headline">Loading data into Chado</span>

When I try to load data into Chado using the [GFF](GFF "GFF") bulk
loader (gmod_bulk_load_gff3.pl), I get this error:

     DBD::Pg::db pg_endcopy failed: ERROR:  invalid input syntax for integer: ""

     CONTEXT:  COPY feature_relationship, line 1, column type_id: "" at /usr/lib/perl5/site_perl/5.8.8/Bio/GMOD/DB/Adapter.pm line 2723, <$fh> line 64298.

Why is that and what do I do?

Unfortunately there is a bug in one of the prerequisites for the Chado
loader, a perl module called DBIx::DBStag, which does the actual writing
of ontology data to the database. When it loads the Gene Ontology (and
possibly other ontologies), it destroys the 'part_of' cvterm that
belongs to the relationship ontology and makes it part of GO instead.
This is the wrong behavior, but at the moment, there is nothing we can
do about it.

Instead, you must run a SQL command to repair the database:


``` de1
 UPDATE cvterm SET cv_id = (SELECT cv_id FROM cv WHERE name = 'relationship')
  WHERE name = 'part_of'
   AND cv_id IN (SELECT cv_id FROM cv WHERE name='gene_ontology');
```


Then, rerunning the loader with the --recreate_cache option should allow
the database to load. Sorry for the hassle.

### <span id="Why_is_loading_GFF3_data_so_slow_and_what_can_I_do_about_it.3F" class="mw-headline">Why is loading GFF3 data so slow and what can I do about it?</span>

The gmod_bulk_load_gff3.pl script has to do quite a bit of work that the
similarly named bp_bulk_load_gff.pl does not have to do. Since Chado
makes extensive use of constraints and foreign key relationships, the
bulk loader has to keep track of all of those constraints while parsing
the [GFF3](GFF3 "GFF3") file. Also, when it is loading data, it does it
in a single database transaction, which can take quite a while if there
is a lot of data.

So, what to do about it. First, I would suggest breaking up the load in
to several smaller chunks and loading them sequentially. The script
gmod_gff3_preprocessor.pl has options for splitting GFF3 files in
several ways, like by chromosome or by the "source" (the value in the
second column of the GFF3 file). Typically, when I do this, I create a
simple bash script that will load the files one by one and then run it
and check back periodically to make sure it is doing ok. By breaking the
load up into several smaller files, the load process is easier to follow
typically goes faster (particularly if the load fails for some reason,
the database will rollback to the last known good state and you only
have to continue the load from where things went bad).

Also, there are command line options for trying to increase speed, but I
haven't spent much time benchmarking them. In particular, their is an
option to drop indexes and then recreate them after the load, as well as
an option to not load the database in a single transaction.

### <span id="I_get_a_weird_error_when_loading_ontologies.3B_what_do_I_do.3F" class="mw-headline">I get a weird error when loading ontologies; what do I do?</span>

When I try to use \`make ontologies\` to load ontologies, I get this
message:

     install_driver(Pg) failed: DBD::Pg object version v2.15.1 does not match bootstrap parameter 2.15.1 at /System/Library/Perl/5.8.8/darwin-thread-multi-2level/DynaLoader.pm line 253, <STDIN> line 1.
     Compilation failed in require at (eval 91) line 3, <STDIN> line 1.

What can I do about it?

This problem has happened to me a few times and usually indicates that
there was a problem when DBD::Pg was installed. The first option to try
is to reinstall it, using the UNINST=1 directive on the install command,
like this:

     perl Makefile.PL
     make
     make test
     sudo make install UNINST=1

If that doesn't solve the problem, it is possible to edit DBD::Pg in
place to fix the version string. In the particular example sited above,
I think it is fairly safe to change the version string in Pg.pm from
'2.15.1' to 'v2.15.1', but making a real change between version numbers
could cause DBD::Pg to fail, or worse, could cause it to seem to work
but fail in some subtle, not very noticeable, way.

### <span id="Is_it_possible_to_load_ontologies_without_the_DBIx::DBStag_Module.3F" class="mw-headline">Is it possible to load ontologies without the DBIx::DBStag Module?</span>

I have errors associated with loading ontologies that appear to be
related to the DBIx::DBStag module. When attempting to load ontologies
with stag-storenode.pl, I get the error message:

     Cannot quote a reference at /Library/Perl/5.8.8/DBIx/DBStag.pm line 3732.

I am using the latest version (0.10) of the Module, and installed it by
hand. The tests on Installation also failed with a similar error message
for 'cv.t' . Are there alternatives for loading ontologies that do not
require the DBIx::DBStag module.

FWIW: I got around this by using CPAN to "install Bundle::GMOD" - which
installs v0.12 of DBIx::DBStag and maybe that's the key. Installing
Bundle::GMOD had trouble with both XML::LibXSLT and DBIx:DBStag. Whereas
using "force" worked for the latter, the former required installing
related packages (ex: via aptitude) such as libxslt and libxml -
including the \*-dev packages. (This was on Ubuntu 10.04 Lucid.)

### <span id="Loading_Ontologies_takes_forever.21_There_has_to_be_a_better_way.3F" class="mw-headline">Loading Ontologies takes forever! There has to be a better way?</span>

There are [Precompiled Chado
Databases](Precompiled_Chado_Databases "Precompiled Chado Databases")
(including all five ontologies), made available online. These are
updated on a weekly basis.




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [FAQ](Category%253AFAQ "Category%253AFAQ")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_FAQ" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 17:50 on 5 February
  2014.</span>
<!-- - <span id="footer-info-viewcount">160,734 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





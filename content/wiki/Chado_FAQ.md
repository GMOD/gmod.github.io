---
title: "Chado FAQ"
---
# Chado FAQ

  FAQ</span>](#About_this_FAQ)
  - [What is
    this FAQ?](#What_is_this_FAQ.3F)
  - [How is it
    maintained?](#How_is_it_maintained.3F)
- [Chado
  Questions](#Chado_Questions)
  - [How do you
    pronounce *chado*?](#How_do_you_pronounce_chado.3F)
  - [How does
    one represent BLAST results in Chado? or alignments?
    or...](#How_does_one_represent_BLAST_results_in_Chado.3F_or_alignments.3F_or...)
  - [Where do I
    find a list of tables in
    Chado?](#Where_do_I_find_a_list_of_tables_in_Chado.3F)
  - [What are
    the modules in Chado?](#What_are_the_modules_in_Chado.3F)
  - [Is there a
    *Chado for Beginners*?](#Is_there_a_Chado_for_Beginners.3F)
  - [Loading
    data into Chado](#Loading_data_into_Chado)
  - [Why is
    loading GFF3 data so slow and what can I do about
    it?](#Why_is_loading_GFF3_data_so_slow_and_what_can_I_do_about_it.3F)
  - [I get a
    weird error when loading ontologies; what do I
    do?](#I_get_a_weird_error_when_loading_ontologies.3B_what_do_I_do.3F)
  - [Is it
    possible to load ontologies without the DBIx::DBStag
    Module?](#Is_it_possible_to_load_ontologies_without_the_DBIx::DBStag_Module.3F)
  - [Loading
    Ontologies takes forever! There has to be a better
    way?](#Loading_Ontologies_takes_forever.21_There_has_to_be_a_better_way.3F)



## About this FAQ

### What is this FAQ?

It is the list of Frequently Asked Questions about
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>. It
summarises the questions that have come up on the Chado
<a href="Mailing_list" class="mw-redirect" title="Mailing list">mailing
list</a>.

### How is it maintained?

It is now maintained as a
<a href="http://en.wikipedia.org/wiki/Wiki" class="extiw"
title="wp:Wiki">Wiki</a> on this site. You can help maintain it by
adding questions and answers.

## Chado Questions

### How do you pronounce *chado*?

*Chado* is usually pronounced
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e4/Chado.mp3" class="internal"
title="Chado.mp3">like this</a>.

### How does one represent BLAST results in Chado? or alignments? or...

Questions about the best ways to represent a variety of observations are
answered at the [Chado Best
Practices](Chado_Best_Practices "Chado Best Practices") page. There is
also a worked example for this at
[Load_BLAST_Into_Chado](Load_BLAST_Into_Chado "Load BLAST Into Chado").

### Where do I find a list of tables in Chado?

The [Chado Tables](Chado_Tables "Chado Tables") page.

### What are the modules in Chado?

They are listed in the [Chado
Manual](Chado_Manual#Modules "Chado Manual") page.

### Is there a *Chado for Beginners*?

The best place to start would be the [Chado
Manual](Chado_Manual#Modules "Chado Manual") or
[Overview](Overview "Overview").

### Loading data into Chado

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

### Why is loading GFF3 data so slow and what can I do about it?

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

### I get a weird error when loading ontologies; what do I do?

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

### Is it possible to load ontologies without the DBIx::DBStag Module?

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

### Loading Ontologies takes forever! There has to be a better way?

There are [Precompiled Chado
Databases](Precompiled_Chado_Databases "Precompiled Chado Databases")
(including all five ontologies), made available online. These are
updated on a weekly basis.

---
title: "Jim's installation notes"
---
# Jim's installation notes

Back to [Chado New Users](/wiki/Chado_New_Users)

  on PPC mac</span>](#Installation_on_PPC_mac)
  - [Prerequisites](#Prerequisites)
    - [PostgreSQL](#PostgreSQL)
    - [Apache](#Apache)
    - [BioPerl](#BioPerl)
    - [GO
      perl](#GO_perl)
    - [Other
      Perl Dependencies](#Other_Perl_Dependencies)
  - [Set up
    default gmod location](#Set_up_default_gmod_location)
  - [Install
    chado](#Install_chado)
    - [A few
      more prereq issues](#A_few_more_prereq_issues)
    - [Makefile.pl etc.](#Makefile.pl_etc.)
      - [make ontologies](#make_ontologies)
      - [make html](#make_html)
      - [make images](#make_images)
      - [make rm_locks and make
        clean](#make_rm_locks_and_make_clean)
      - [make
        instructions](#make_instructions)
  - [Load the
    yeast sample data](#Load_the_yeast_sample_data)
  - [Set up
    Gbrowse to work with
    Chado](#Set_up_Gbrowse_to_work_with_Chado)
    - [Set up
      www user](#Set_up_www_user)
    - [Make a
      gbrowse conf file](#Make_a_gbrowse_conf_file)

## Installation on PPC mac

- First do this on my G4 laptop. Then consider whether to install on the
  XServe.

[Installation section of Getting
Started](/wiki/Chado_-_Getting_Started#Installation)
describes how to get Chado from CVS. Note, when updating, be sure to be
at the directory level just above schema. Getting Started refers to <a
href="http://gmod.cvs.sourceforge.net/*checkout*/gmod/schema/chado/INSTALL"
class="external text" rel="nofollow">the INSTALL document</a>

### Prerequisites

#### PostgreSQL

- I installed PostgreSQL using the
  <a href="http://www.entropy.ch/software/macosx/postgresql/"
  class="external text" rel="nofollow">Installer Package from Marc
  Liyanage</a>
  - There are a couple of tools to make working with PostgreSQL easier
    - <a href="http://www.pgadmin.org/" class="external text"
      rel="nofollow">pgAdmin</a> is a GUI desktop app. I have this but
      haven't figured out how to do anything useful with it.
    - <a href="http://phppgadmin.sourceforge.net/" class="external text"
      rel="nofollow">phppgadmin</a> web based admin tool analogous to
      <a href="http://www.phpmyadmin.net/" class="external text"
      rel="nofollow">phpmyadmin</a> for mysql

#### Apache

Comes installed on OS X

#### BioPerl

BioPerl is currently not installed on my laptop, as I ran into the
dreaded gd installation problems. Let's try again.
<a href="http://www.bioperl.org/wiki/Installing_Bioperl_for_Unix"
class="external text" rel="nofollow">Installing BioPerl on Unix</a>
applies to Mac OSX once the prereqs are done (I think). Some incomplete
notes <a
href="http://dimer.tamu.edu/simplog/archive.php?blogid=1&amp;pid=3535"
class="external text" rel="nofollow">here</a> from installing on the
server. As I recall, this failed the last time I tried on my laptop.
However, I think Matías Giovannini updated his
<a href="http://www.paginar.net/matias/articles/gd_x_howto.html"
class="external text" rel="nofollow">Installation guide for gd</a> since
the last time I tried it. With the new instructions gd went smoothly. <a
href="http://dimer.tamu.edu/simplog/archive.php?blogid=1&amp;pid=4789"
class="external text" rel="nofollow">notes here</a>.

To get BioPerl from cvs see
<a href="http://www.bioperl.org/wiki/Using_CVS" class="external text"
rel="nofollow">here</a>

#### GO perl

- The url provided in the <a
  href="http://gmod.cvs.sourceforge.net/*checkout*/gmod/schema/chado/INSTALL"
  class="external text" rel="nofollow">Chado install document</a> is not
  working for me. Contacted Mike Cherry, who provided an alternative
  url: <a href="http://171.65.76.113/latest-full/" class="external free"
  rel="nofollow">http://171.65.76.113/latest-full/</a>. Downloaded <a
  href="http://171.65.76.113/latest-full/go_200703-utilities-src.tar.gz"
  class="external free"
  rel="nofollow">http://171.65.76.113/latest-full/go_200703-utilities-src.tar.gz</a>
  (this URL will change with their next update, use the other to browse
  the available downloads from the GO consortium).
- go_perl is only one module inside the utilities. From its install
  docs, there are more CPAN modules to install:
  - install GO::Parser

    got this warning:

    > NOTICE: \*\* You do not have XML::Parser::PerlSAX installed \*\*
    >
    > This module is not required for go-perl, but it is required if you
    > wish to parse Obo-XML files. It is also required by the go-db-perl
    > library for loading the GO Database.
    >
    > If you do not intend to use either Obo-XML or go-db-perl, then you
    > may continue. Even if you do care about these, you may continue
    > and install XML::Parser::PerlSAX at some future time.

  - I'm going to need the XML::Parser at some point, I suspect. I recall
    having problems with this during BioPerl installation. install
    XML::Parser::PerlSAX follows dependency to install XML::Parser,
    which complains about not having expat.
    - installing expat: get it from
      <a href="http://sourceforge.net/projects/expat/" class="external free"
      rel="nofollow">http://sourceforge.net/projects/expat/</a>
    - install XML::Parser. Note that quitting and restarting CPAN helps
      if an installation already failed once.
    - install XML::Parser::PerlSAX

  - install
    <a href="http://www.ryandesign.com/graphviz/" class="external text"
    rel="nofollow">GraphViz</a> - also optional, but likely to be useful

Curiously, the install instructions suggest that this is all I need to
do for go_perl. So despite downloading the tarball, all I needed was the
CPAN installation??

#### Other Perl Dependencies

install Bundle::GMOD

As is often the case with the CPAN modules, watching the Terminal window
shows lots of tests failing. Also, it looks for modules I'm pretty sure
I've already installed.

    Failed during this command:
     GAAS/libwww-perl-5.805.tar.gz                : make_test NO
     MIYAGAWA/Class-DBI-Pager-0.08.tar.gz         : make_test NO
     CAPTTOFU/DBD-mysql-4.003.tar.gz              : make_test NO
     TJMATHER/XML-DOM-1.44.tar.gz                 : make_test NO
     JROBINSON/SQL-Translator-0.08.tar.gz         : make_test NO
     TMTM/Class-DBI-v3.0.16.tar.gz                : make_test NO
     ADAMK/AppConfig-1.64.tar.gz                  : make_test NO
     ABW/Template-Toolkit-2.18.tar.gz             : install NO
     DMAKI/Class-DBI-Pg-0.08.tar.gz               : make_test NO
     SZABGAB/Spreadsheet-ParseExcel-0.28.tar.gz   : make_test NO
     BYRNE/SOAP-Lite-0.69.tar.gz                  : make_test NO
     MIROD/XML-DOM-XPath-0.13.tar.gz              : make_test NO

### Set up default gmod location

    mkdir /usr/local/gmod

Is that it? I don't feel like this is right. Since I installed bundle
GMOD using CPAN, I'm not sure where it's gone. Probably /Library/Perl...
Forge ahead anyway.

### Install chado

#### A few more prereq issues

     perl Makefile.PL
    ************************************************************************
    The following environment variables not detected:
      GMOD_ROOT
      CHADO_DB_NAME
    Please read the INSTALL document and set required environment variables.
    ************************************************************************

Oops. Went back and edited .profile

    export GMOD_ROOT="/usr/local/gmod"
    export CHADO_DB_NAME="chado_trial"

also did these on command line, since .profile settings don't refresh
until opening a new Terminal (I think).

     perl Makefile.PL

Lots of output. Failed. Possible culprits:

    --WARNING-------------------------------------------------
    The environment variable GO_ROOT is not set.
    Ontology loading may not work correctly without it.
    ----------------------------------------------------------

    Extracting /Users/jimhu/schema/chado/bin/../lib/Chado/AutoDBI.pm (with variable substitutions)
    Can't locate LWP/Simple.pm in @INC (@INC contains: lib /System/Library/Perl/5.8.6/darwin-thread-multi-2level /System/Library/Perl/5.8.6 /Library/Perl/5.8.6/darwin-thread-multi-2level /
    Library/Perl/5.8.6 /Library/Perl /Network/Library/Perl/5.8.6/darwin-thread-multi-2level /Network/Library/Perl/5.8.6 /Network/Library/Perl /System/Library/Perl/Extras/5.8.6/darwin-
    thread- multi-2level /System/Library/Perl/Extras/5.8.6 /Library/Perl/5.8.1 .) at lib/Chado/Builder.pm line 15.
    BEGIN failed--compilation aborted at lib/Chado/Builder.pm line 15.
    Compilation failed in require at load/Build.PL line 3.
    BEGIN failed--compilation aborted at load/Build.PL line 3.
    sh: line 1: ./Build: No such file or directory
    unable to create Build from load/Build.PL:

Added the line to .profile to set GMOD_ROOT (this was in the install doc
and I must have missed it earlier).

    export GO_ROOT=$HOME/go-dev

I assume this was set up during install of GO::Parser??

    cpan>install LWP::Simple

failed tests. I think these are based on failing to connect to localhost
via apache...it may reflect something about OSX that should be set in
the config. Try forcing it.

#### Makefile.pl etc.

Do the Makefile.pl again. End of output is

    Warning: the following files are missing in your kit:
           chado-xml/doc/Chado-XML-overview.asc
           chado-xml/doc/Chado-XML-overview.html
           chado-xml/doc/Chado-XML-overview.pdf
           chado-xml/doc/makefile
           chaos-xml/doc/chaos-and-chado.html
           chaos-xml/doc/css/stylesheet.css
           chaos-xml/index.html
           modules/cv/doc/deductive_closure.txt
    Please inform the author.
    Warning: prerequisite DBIx::DBStag 0.07 not found.
    Checking if your kit is complete...
    Looks good
    Writing Makefile for Bio-Chaos
    Writing Makefile for gmod

    -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    Makefile written.  Now you should do the following, in order:
      1. make              (creates necessary build files)
      2. sudo make install (creates $GMOD_ROOT and subdirectories)
    -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*WARNING-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
            STEP 3 WILL DELETE ANY DATA IN A DATABASE WITH THE
               DATABASE NAME YOU PROVIDED!
    -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*WARNING-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      3. make load_schema (loads SQL schema into database)
      4. make prepdb      (loads basic data)
      5. make ontologies  (loads data for various ontologies)

    Optional Targets:
      make html         (auto-generates html documentation for each module)
      make images       (generates images of the schema in several formats)
      make rm_locks     (removes ontology lock files, allowing installation
                         of ontologies on successive builds of the database
                         without removing the ontology files altogether)
      make clean        (remove build related files and ontology tmp dir)
      make instructions (at any moment display these instructions)

    -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Followed steps 1-5. Chose to load all the ontologies.

##### make ontologies

./Build ontologies

    Available ontologies:
    [1] Relationship Ontology
    [2] Sequence Ontology
    [3] Gene Ontology
    [4] Chado Feature Properties
    [5] Cell Ontology
    [6] Plant Ontology

    Which ontologies would you like to load (Comma delimited)? [0]  1,2,3,4,5,6
    fetching files for Relationship Ontology
     +http://obo.cvs.sourceforge.net/obo/obo/ontology/OBO_REL/relationship.obo?rev=HEAD
       updated
       loading...sh: line 1: stag-storenode.pl: command not found
    System call 'stag-storenode.pl -d 'dbi:Pg:dbname=chado_trial;host=localhost;port=5432' --user jimhu  --password lambda  tmp/obo/OBO_REL/rel.oboxml' failed: 32512
    Died at lib/Chado/Builder.pm line 315, <STDIN> line 1.
    make: *** [ontologies] Error 2

Back to cpan.

    install DBIx::DBStag

failed. Force it. The output during force is more informative. Need to
create a role for root in postgres...or is it supposed to work with my
username, which has a role? After force, make ontologies seems to work
without creating a role for root.

Getting lots of warnings while loading SO. example:

    HINT:  Use the escape string syntax for backslashes, e.g., E'\\'.
    WARNING:  nonstandard use of \\ in a string literal
    LINE 1: ... (cvterm_id, value, type_id, rank) VALUES ('222', 'gene\\:<g...

GO is taking a long time...not surprising. It would be nice if there was
some kind of progress indicator. Went to group meeting upon return,
seems like all loaded, but:

    ...
    done!
    DBD::Pg::db do failed: ERROR:  duplicate key violates unique constraint "cvterm_c1"
    DBD::Pg::db do failed: ERROR:  duplicate key violates unique constraint "cvterm_c1"

This has been observed before and is noted in the install docs.

##### make html

Failed.

    Can't locate SQL/Translator.pm

Back to CPAN. install SQL::Translator failed. Force it. During make
test, saw (excerpts)

           all skipped: Missing dependency: Text::RecordParser
           all skipped: Missing dependency: Spreadsheet::ParseExcel

Could have sworn an Excel parser was already installed. I don't think I
need that, but Text::RecordParser sounds useful. CPAN installed it
successfully (along with yet another dependency).

After that, make html works. As for using it...

##### make images

Failed.

    Can't load producer 'GraphViz' : Error loading GraphViz as SQL::Translator::Producer::GraphViz

Wait a minute! I know I installed a GraphViz earlier today.

    cpan[12]> install SQL::Translator::Producer::GraphViz
    SQL::Translator::Producer::GraphViz is up to date (1.12).

It's a different GraphViz. I still need GraphViz.

    cpan>install GraphViz

identifies a C library dependency, graphviz. Shades of gd. Follow
<a href="http://www.graphviz.org/" class="external free"
rel="nofollow">http://www.graphviz.org/</a> and find that there are Mac
OS X package installers, which is a good thing, since graphviz has many
other dependencies of its own. Download 2.12 revision 1 for PPC and
install. graphviz installs into /usr/local as /usr/local/graphviz-2.12.
Make symlink.

    ln -s /usr/local/graphviz-2.12 /usr/local/graphviz
    export PATH=/usr/local/graphviz/bin:$PATH

Try installing the CPAN Graphviz again. Need to export in that session,
but then it installs, following dependencies. Do make images again.
Takes a long time. The good news is that it runs. The bad news is that
it:

- creates image files in the wrong place - they're showing up in the
  directory where chado was downloaded.
- the image files are nonfunctional. They're showing up as 0K.

I wonder if there's a versions problem with graphviz.

##### make rm_locks and make clean

I think they worked.

##### make instructions

Failed

    make: *** No rule to make target `instructions'.  Stop.

No idea how to deal with this one, but it shouldn't stop me from going
on.

### Load the yeast sample data

Per instructions: get the yeast file from <a href="/wiki/ftp://ftp.yeastgenome.org/pub/yeast/data_download/chromosomal_feature/saccharomyces_cerevisiae.gff"
class="external free"
rel="nofollow">ftp://ftp.yeastgenome.org/pub/yeast/data_download/chromosomal_feature/saccharomyces_cerevisiae.gff</a>.
cd to my downloads directory and do

    gmod_bulk_load_gff3.pl --organism yeast --gfffile saccharomyces_cerevisiae.gff

gmod_bulk_load_gff3.pl was installed in /usr/bin, so it can be run from
anywhere. Messages during load (with comments/questions):

    (Re)creating the uniquename cache in the database...
    Creating table...

What table is being created? Chado installation already created a
zillion tables.

    Populating table...
    Creating indexes...Done.
    Preparing data for inserting into the chado_trial database
    (This may take a while ...)

    This GFF file has CDS and/or UTR features that do not belong to a
    'central dogma' gene (ie, gene/transcript/CDS).  The features of
    this type are being stored in the database as is.

Should be interesting to look at these.

    Loading data into feature table ...
    Loading data into featureloc table ...
    Loading data into feature_relationship table ...
    Loading data into featureprop table ...
    Loading data into feature_cvterm table ...
    Loading data into synonym table ...
    Loading data into feature_synonym table ...
    Loading data into dbxref table ...
    Loading data into feature_dbxref table ...
    Skipping analysisfeature table since the load file is empty...

No BLAST reports etc. Loading sequences (if any) ...

    Optimizing database (this may take a while) ...
      (feature featureloc feature_relationship featureprop feature_cvterm synonym feature_synonym dbxref feature_dbxref analysisfeature ) Done.

    While this script has made an effort to optimize the database, you
    should probably also run VACUUM FULL ANALYZE on the database as well

### Set up Gbrowse to work with Chado

#### Set up www user

    psql chado_trial

Altered the instructions, since I'm pretty sure that OSX uses username
www instead of nobody for apache. Actually I'm not sure the username
matters as long as it matches the name in the gbrowse conf file, at
least for gbrowse.

    CREATE USER www;
     GRANT SELECT ON feature_synonym      TO www;
     GRANT SELECT ON synonym              TO www;
     GRANT SELECT ON feature_dbxref       TO www;
     GRANT SELECT ON dbxref               TO www;
     GRANT SELECT ON feature              TO www;
     GRANT SELECT ON featureloc           TO www;
     GRANT SELECT ON cvterm               TO www;
     GRANT SELECT ON feature_relationship TO www;
     GRANT SELECT ON cv                   TO www;
     GRANT SELECT ON gffatts              TO www;
     GRANT SELECT ON feature_cvterm       TO www;
     GRANT SELECT ON feature_gcontext     TO www;
     GRANT SELECT ON gcontext             TO www;
     GRANT SELECT ON featureprop          TO www;
     GRANT SELECT ON pub                  TO www;
     GRANT SELECT ON feature_pub          TO www;
     GRANT SELECT ON db                   TO www;

The two GRANT statements for feature_gcontext and gcontext gave errors,
since these tables don't exist. Additional GRANTs may be needed if
Gbrowse is adapted to display additional views.

#### Make a gbrowse conf file

Copy the example file from gbrowse.

    sudo cp /Library/WebServer/Documents/gbrowse/contrib/conf_files/07.chado.conf chado_yeast.conf

Edit it.

Gbrowse displays everything except the gbrowse image. Check the error
logs.

    DBD::Pg::st execute failed: ERROR:  permission denied for relation analysisfeature

fix with:

    GRANT SELECT ON analysisfeature                  TO www;

Features from yeast sample GFF imported to Chado

It works!!!

<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">Jim's installation notes</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

Back to [Chado New Users](Chado_New_Users "Chado New Users")

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span> <span class="toctext">Installation
  on PPC mac</span>](#Installation_on_PPC_mac)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">Prerequisites</span>](#Prerequisites)
    - [<span class="tocnumber">1.1.1</span>
      <span class="toctext">PostgreSQL</span>](#PostgreSQL)
    - [<span class="tocnumber">1.1.2</span>
      <span class="toctext">Apache</span>](#Apache)
    - [<span class="tocnumber">1.1.3</span>
      <span class="toctext">BioPerl</span>](#BioPerl)
    - [<span class="tocnumber">1.1.4</span> <span class="toctext">GO
      perl</span>](#GO_perl)
    - [<span class="tocnumber">1.1.5</span> <span class="toctext">Other
      Perl Dependencies</span>](#Other_Perl_Dependencies)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Set up
    default gmod location</span>](#Set_up_default_gmod_location)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Install
    chado</span>](#Install_chado)
    - [<span class="tocnumber">1.3.1</span> <span class="toctext">A few
      more prereq issues</span>](#A_few_more_prereq_issues)
    - [<span class="tocnumber">1.3.2</span>
      <span class="toctext">Makefile.pl etc.</span>](#Makefile.pl_etc.)
      - [<span class="tocnumber">1.3.2.1</span>
        <span class="toctext">make ontologies</span>](#make_ontologies)
      - [<span class="tocnumber">1.3.2.2</span>
        <span class="toctext">make html</span>](#make_html)
      - [<span class="tocnumber">1.3.2.3</span>
        <span class="toctext">make images</span>](#make_images)
      - [<span class="tocnumber">1.3.2.4</span>
        <span class="toctext">make rm_locks and make
        clean</span>](#make_rm_locks_and_make_clean)
      - [<span class="tocnumber">1.3.2.5</span>
        <span class="toctext">make
        instructions</span>](#make_instructions)
  - [<span class="tocnumber">1.4</span> <span class="toctext">Load the
    yeast sample data</span>](#Load_the_yeast_sample_data)
  - [<span class="tocnumber">1.5</span> <span class="toctext">Set up
    Gbrowse to work with
    Chado</span>](#Set_up_Gbrowse_to_work_with_Chado)
    - [<span class="tocnumber">1.5.1</span> <span class="toctext">Set up
      www user</span>](#Set_up_www_user)
    - [<span class="tocnumber">1.5.2</span> <span class="toctext">Make a
      gbrowse conf file</span>](#Make_a_gbrowse_conf_file)

</div>

## <span id="Installation_on_PPC_mac" class="mw-headline">Installation on PPC mac</span>

- First do this on my G4 laptop. Then consider whether to install on the
  XServe.

[Installation section of Getting
Started](Chado_-_Getting_Started#Installation "Chado - Getting Started")
describes how to get Chado from CVS. Note, when updating, be sure to be
at the directory level just above schema. Getting Started refers to <a
href="http://gmod.cvs.sourceforge.net/*checkout*/gmod/schema/chado/INSTALL"
class="external text" rel="nofollow">the INSTALL document</a>

### <span id="Prerequisites" class="mw-headline">Prerequisites</span>

#### <span id="PostgreSQL" class="mw-headline">PostgreSQL</span>

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

#### <span id="Apache" class="mw-headline">Apache</span>

Comes installed on OS X

#### <span id="BioPerl" class="mw-headline">BioPerl</span>

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

#### <span id="GO_perl" class="mw-headline">GO perl</span>

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

#### <span id="Other_Perl_Dependencies" class="mw-headline">Other Perl Dependencies</span>

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

### <span id="Set_up_default_gmod_location" class="mw-headline">Set up default gmod location</span>

    mkdir /usr/local/gmod

Is that it? I don't feel like this is right. Since I installed bundle
GMOD using CPAN, I'm not sure where it's gone. Probably /Library/Perl...
Forge ahead anyway.

### <span id="Install_chado" class="mw-headline">Install chado</span>

#### <span id="A_few_more_prereq_issues" class="mw-headline">A few more prereq issues</span>

     perl Makefile.PL 
    ************************************************************************
    The following enviroment variables not detected:
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
    The envirnment variable GO_ROOT is not set.
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

#### <span id="Makefile.pl_etc." class="mw-headline">Makefile.pl etc.</span>

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

##### <span id="make_ontologies" class="mw-headline">make ontologies</span>

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

##### <span id="make_html" class="mw-headline">make html</span>

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

##### <span id="make_images" class="mw-headline">make images</span>

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

##### <span id="make_rm_locks_and_make_clean" class="mw-headline">make rm_locks and make clean</span>

I think they worked.

##### <span id="make_instructions" class="mw-headline">make instructions</span>

Failed

    make: *** No rule to make target `instructions'.  Stop.

No idea how to deal with this one, but it shouldn't stop me from going
on.

### <span id="Load_the_yeast_sample_data" class="mw-headline">Load the yeast sample data</span>

Per instructions: get the yeast file from <a
href="ftp://ftp.yeastgenome.org/pub/yeast/data_download/chromosomal_feature/saccharomyces_cerevisiae.gff"
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

### <span id="Set_up_Gbrowse_to_work_with_Chado" class="mw-headline">Set up Gbrowse to work with Chado</span>

#### <span id="Set_up_www_user" class="mw-headline">Set up www user</span>

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

#### <span id="Make_a_gbrowse_conf_file" class="mw-headline">Make a gbrowse conf file</span>

Copy the example file from gbrowse.

    sudo cp /Library/WebServer/Documents/gbrowse/contrib/conf_files/07.chado.conf chado_yeast.conf

Edit it.

Gbrowse displays everything except the gbrowse image. Check the error
logs.

    DBD::Pg::st execute failed: ERROR:  permission denied for relation analysisfeature

fix with:

    GRANT SELECT ON analysisfeature                  TO www;

<div class="thumb tright">

<div class="thumbinner" style="width:602px;">

<a href="File:Chado_test_in_gbrowse.jpg" class="image"><img
src="../mediawiki/images/thumb/1/12/Chado_test_in_gbrowse.jpg/600px-Chado_test_in_gbrowse.jpg"
class="thumbimage"
srcset=" http://gmod.org/wiki/1.5x,  http://gmod.org/wiki/2x"
width="600" height="436" /></a>

<div class="thumbcaption">

<div class="magnify">

<a href="File:Chado_test_in_gbrowse.jpg" class="internal"
title="Enlarge"><img
src="../mediawiki/skins/common/images/magnify-clip.png" width="15"
height="11" /></a>

</div>

Features from yeast sample GFF imported to Chado

</div>

</div>

</div>

It works!!!

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=Jim%27s_installation_notes&oldid=4304>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Category](Special:Categories "Special:Categories"):

- [User
  Experiences](Category:User_Experiences "Category:User Experiences")

</div>

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">



<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces

- <span id="ca-nstab-main"><a href="Jim&#39;s_installation_notes" accesskey="c"
  title="View the content page [c]">Page</a></span>
- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:Jim%27s_installation_notes&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>

<div id="right-navigation">





</div>



</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>
- <span id="n-View-all-pages">[View all pages](Special:AllPages)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category:FAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category:HOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">


- <span id="t-smwbrowselink"><a href="Special:Browse/Jim&#39;s_installation_notes"
  rel="smw-browse">Browse properties</a></span>


</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 23:54 on 25 January
  2008.</span>
<!-- - <span id="footer-info-viewcount">41,306 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->






</div>

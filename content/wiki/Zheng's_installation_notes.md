---
title: "Zheng's installation notes"
---
# Zheng's installation notes

Back to [Chado New Users](Chado_New_Users "Chado New Users")

  information</span>](#general_information)
- [before you
  start](#before_you_start)
- [get chado
  schema from cvs](#get_chado_schema_from_cvs)
- [install
  prerequisites](#install_prerequisites)
  - [install
    Ant](#install_Ant)
  - [install
    postgresql](#install_postgresql)
  - [install
    several general perl
    modules](#install_several_general_perl_modules)
  - [install
    bioperl live](#install_bioperl_live)
  - [install
    go-dev](#install_go-dev)
- [install
  chado](#install_chado)
- [install
  gbrowse to work with
  chado](#install_gbrowse_to_work_with_chado)

## general information

There suppose to be an easy way and a hard way to install Chado database
on Fedora:

- the easy way: use an existing rpm package. I have not tried it. but
  you can find information at [installation using an
  RPM](Chado_-_Getting_Started#Installation_using_an_RPM "Chado - Getting Started")
- the hard way: install by source. But
  <a href="http://en.wikipedia.org/wiki/Yellow_dog_Updater,_Modified"
  class="external text" rel="nofollow">yum</a> makes it easier. The
  following is my note on installation of Chado on Fedora 6.

## before you start

- you can be a superuser or you can sudo to install packages;
- you have read <a
  href="http://gmod.cvs.sourceforge.net/*checkout*/gmod/schema/chado/INSTALL"
  class="external text" rel="nofollow">the chado INSTALL document</a>

## get chado schema from cvs

see [Chado From
CVS](Chado_-_Getting_Started#Chado_From_CVS "Chado - Getting Started"),
issue cvs command at my home directory.

## install prerequisites

### install <a href="http://en.wikipedia.org/wiki/Apache_Ant" class="external text"
rel="nofollow">Ant</a>

    sudo yum install ant

### install <a href="http://www.postgresql.org/" class="external text"
rel="nofollow">postgresql</a>

- install both client and server by yum
    [zha@localhost ~] sudo yum install postgresql
    [zha@localhost ~] sudo yum install postgresql-server

right now the version is 8.1.8 (in yum package pool)

- make server run
    [zha@localhost ~] sudo /sbin/service postgres start

to make it run at boot

    [zha@localhost ~] sudo /sbin/chkconfig postgres on

- in .bash_profile add line
    export PGDATA="/var/lib/pgsql/data/"

But I still can't get rid of the -D /var/lib/pgsql/data/ **why???**

    [zha@localhost gff3]$ sudo -u postgres postgres
    postgres does not know where to find the server configuration file.
    You must specify the --config-file or -D invocation option or set the PGDATA environment variable.
    [zha@localhost gff3]$ sudo -u postgres postgres -D /var/lib/pgsql/data
    FATAL:  lock file "postmaster.pid" already exists
    HINT:  Is another postmaster (PID 2785) running in data directory "/var/lib/pgsql/data"?

- create PL language, template, several roles
    [zha@localhost ~] sudo -u postgres creatlang plpgsql template1
    [zha@localhost ~] sudo -u postgres createuser zha

replace zha with your own account name at your home directory. this must
be a user with privilege to create and drop database. this is purely for
the purpose of smooth installation.

    [zha@localhost ~] sudo -u postgres createuser root

this must be a superuser of postgresql (same privilege as postgres),
this is for installing DBIx::DBStag.

- edit the pg_hba.conf

the pg_hba.conf is in /var/lib/pgsql/data/pg_hba.conf, you probably need
to chown to postgres.

    # TYPE  DATABASE    USER        CIDR-ADDRESS          METHOD
    local   all         all                               trust
    host    all         all         127.0.0.1/32          trust
    host    all         all         ::1/128               trust

**need revisit for local access and access method (MD5)**

- tune the server

haven't done yet.

### install several general perl modules

use sudo cpan to do it. install

<a href="http://search.cpan.org/~lds/CGI.pm-3.27/CGI.pm"
class="external text" rel="nofollow">CGI</a> (GBrowse)

<a href="http://search.cpan.org/~lds/GD-2.35/GD.pm"
class="external text" rel="nofollow">GD</a> (GBrowse)

<a href="http://search.cpan.org/~timb/DBI-1.54/DBI.pm"
class="external text" rel="nofollow">DBI</a> (GBrowse,chado)

<a href="http://search.cpan.org/~dbdpg/DBD-Pg-1.49/Pg.pm"
class="external text" rel="nofollow">DBD::Pg</a> (1.49 or better)
(GBrowse,chado)

you can also install it by

    yum install perl-DBD-Pg
        

<a href="http://search.cpan.org/~gaas/Digest-MD5-2.36/MD5.pm"
class="external text" rel="nofollow">Digest::MD5</a> (GBrowse)

<a
href="http://search.cpan.org/search?query=Text%253A%253AShellwords&amp;mode=all"
class="external text" rel="nofollow">Text::Shellwords</a> (GBrowse)

<a href="http://search.cpan.org/~cmungall/Data-Stag-0.10/"
class="external text" rel="nofollow">Data::Stag</a> (chado)

<a
href="http://search.cpan.org/~kmacleod/libxml-perl-0.08/lib/XML/Parser/PerlSAX.pm"
class="external text" rel="nofollow">XML::Parser::PerlSAX</a> (chado)

<a
href="http://search.cpan.org/~kwilliams/Module-Build-0.2806/lib/Module/Build.pm"
class="external text" rel="nofollow">Module::Build</a> (chado)

<a
href="http://search.cpan.org/~tmtm/Class-DBI-v3.0.16/lib/Class/DBI.pm"
class="external text" rel="nofollow">Class::DBI</a> (GMODWeb, or with a
custom Chado schema)

<a
href="http://search.cpan.org/~dmaki/Class-DBI-Pg-0.09/lib/Class/DBI/Pg.pm"
class="external text" rel="nofollow">Class::DBI::Pg</a> (GMODWeb, or
with a custom Chado schema)

<a
href="http://search.cpan.org/~miyagawa/Class-DBI-Pager-0.08/lib/Class/DBI/Pager.pm"
class="external text" rel="nofollow">Class::DBI::Pager</a> (GMODWeb, or
with a custom Chado schema)

<a
href="http://search.cpan.org/~cmungall/DBIx-DBStag-0.08/DBIx/DBStag.pm"
class="external text" rel="nofollow">DBIx::DBStag</a> (chado)

<a
href="http://search.cpan.org/~grantm/XML-Simple-2.16/lib/XML/Simple.pm"
class="external text" rel="nofollow">XML::Simple</a> (chado)

<a href="http://search.cpan.org/~gaas/libwww-perl-5.805/lib/LWP.pm"
class="external text" rel="nofollow">LWP</a> (chado)

<a
href="http://search.cpan.org/~abw/Template-Toolkit-2.18/lib/Template.pm"
class="external text" rel="nofollow">Template</a> (chado)

<a
href="http://search.cpan.org/~mschilli/Log-Log4perl-1.09/lib/Log/Log4perl.pm"
class="external text" rel="nofollow">Log::Log4perl</a> (chado)

<a
href="http://search.cpan.org/~fluffy/Term-ProgressBar-2.09/lib/Term/ProgressBar.pm"
class="external text" rel="nofollow">Term::ProgressBar</a> (2.06 or
better) (chado)

### install <a href="http://search.cpan.org/~sendu/bioperl-1.5.2_102/"
class="external text" rel="nofollow">bioperl live</a>

    [zha@localhost ~]$ sudo cpan
    Password:
    cpan[1]> install S/SE/SENDU/bioperl-1.5.2_102

this is the live bioperl right now

### install <a href="http://sourceforge.net/projects/geneontology"
class="external text" rel="nofollow">go-dev</a>

download and unpack the go-dev package since need to set the GO_ROOT
environment variable. Although right now only a perl parser module for
GO is needed.

- in .bash_profile add line
    export GO_ROOT="$HOME/go-dev"

- install GO::Parser
    [zha@localhost ~]$ sudo cpan
    Password:
    cpan[1]> install GO::Parser

## install chado

- in .bash_profile add lines
    export GMOD_ROOT="/usr/local/gmod"
    export CHADO_DB_NAME="yeast_chado"
    export CHADO_DB_USERNAME="zha"

- standard perl package install
    perl Makefile.PL
    make
    sudo make install

and then:

    make load_schema
    make prepdb
    make ontologies

- backup ontologies
    pg_dump wormbase_chado > onto_only.sql

- load sample yeast genome data

download yeast genome gff3 file. load by bulk load

    gmod_bulk_load_gff3.pl --organism yeast --gfffile saccharomyces_cerevisiae.gff

## install gbrowse to work with chado

- install gbrowse

download
<a href="http://sourceforge.net/forum/forum.php?forum_id=672152"
class="external text" rel="nofollow">Gbrowse</a>, unpack it. standard
install procedure. But be sure to read **README.fedora** and disable
SELINUX for apache!!!

    perl Makefile.PL HTDOCS=/var/www/html CONF=/etc/httpd/conf CGIBIN=/var/www/cgi-bin --SELINUX=1
    make
    sudo make install UNINST=1

- work with chado

who is running apache?

    [zha@localhost ~]$ ps -ef |grep httpd

in my machine it is 'apache'. configure gbrowse to work with chado.

    cp /home/zha/Generic-Genome-Browser-1.67/contrib/conf_files/07.chado.conf /etc/httpd/conf/gbrowse.conf/yeast_chado.conf

make two-line-change to yeast_chado.conf

    database      = dbi:Pg:dbname=yeast_chado;host=localhost;port=5432
    user          = apache

grant select privilege on several tables to apache

    grant select on feature to apache;

in Mac it is www, see [Jim's installation
notes](Jim's_installation_notes "Jim's installation notes").

it is a little bit surprise to me that I need

    grant select on analysisfeature to apache;

since no analysisfeature exists in dataset (?)

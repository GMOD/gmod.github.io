---
title: "Installing Chado on Ubuntu HOWTO"
---
# Installing Chado on Ubuntu HOWTO

## Ubuntu version

This method has been tested on Ubuntu 8.4 with PostgreSQL 8.1 and on
Ubuntu 11.10 and 12.04 with PostgreSQL 9.1. Note also that starting with
the 12.10 Ubuntu release (October, 2012) this became even easier since a
Debian package for Chado (libchado-perl) was added to the official
repository making installation a real snap. That package is available
for Debian installations as well.

## Notes

Installing prereqs with Synaptic:

- postgresql
- postgresql-client
- postgresql-contrib
- postgresql-plperl
- libpq-dev
- libdbd-pg-perl
- libtemplate-perl -- Template toolkit
- libxml-simple-perl
- liblog-log4perl-perl
- ant
- libparse-recdescent-perl \# needed by DBIx::DBStag
- xsltproc
- bioperl
 sudo apt-get install postgresql postgresql-client postgresql-contrib postgresql-plperl libpq-dev libdbd-pg-perl libtemplate-perl libxml-simple-perl liblog-log4perl-perl ant libparse-recdescent-perl xsltproc bioperl

Create a db user for yourself - your Ubuntu username:

 $ sudo su - postgres
 $ createuser <username>
 Shall the new role be a superuser? (y/n) y
 CREATE ROLE
 $ vi /etc/postgresql/9.1/main/pg_hba.conf
 #changed "local all all" and "host all all" lines from ident sameuser to trust
 $ exit
 $ sudo /etc/init.d/postgresql restart

It is useful to actually have a password, even using trust, otherwise
problems with DBD::Pg pop up telling you that no password was supplied.

 $ sudo su - postgres
 $ psql -d template1
 $ alter USER <username> with password '<password>';
 $ exit #from psql
 $ exit #from sudo

Installing prereqs with cpan shell:

- install Bio%253A%253AChado%253A%253ASchema
- install GO::Parser (go-perl)
- install DBIx::DBSchema \# needed by DBIx::DBStag

Installed DBIx::DBStag 'by hand':

(Note that if you have the cpan shell set up to do "sudo make" rather
than running the whole shell as root (via "sudo cpan"), you can install
DBIx::DBStag from the cpan shell.)

 wget http://search.cpan.org/CPAN/authors/id/C/CM/CMUNGALL/DBIx-DBStag-0.10.tar.gz
 tar zxvf DBIx-DBStag-0.10.tar.gz
 cd DBIx-DBStag-0.10
 createdb test # needed for the make test step
 perl Makefile.PL
 make
 make test #all tests pass
 sudo make install

Create the file ~/.gmod_profile, with the contents:

 export GMOD_ROOT=/usr/local/gmod
 export CHADO_DB_NAME=chado
 export CHADO_DB_USER=<username>
 export CHADO_DB_PASS=<password>
 export CHADO_DB_HOST=localhost
 export CHADO_DB_PORT=5432
 export GO_ROOT=/usr/local/share/perl/5.8.8/GO

and add this line to the end of ~/.bash_profile:

 . ~/.gmod_profile #sources the gmod profile on login

If you haven't already, download gmod, either from

 http://sourceforge.net/projects/gmod/files/gmod/

or via <a href="/wiki/SVN" class="mw-redirect" title="SVN">SVN</a>.

Then, in the gmod directory

 perl Makefile.PL
 make
 sudo make install
 make load_schema
 make prepdb
 make ontologies #selected 1,2,3,4

Get and load yeast [GFF3](/wiki/GFF3) file:

 wget http://downloads.yeastgenome.org/sequence/S288C_reference/genome_releases/S288C_reference_genome_Current_Release.tgz

 gmod_bulk_load_gff3.pl --analysis --organism=yeast -g saccharomyces_cerevisiae.gff --noexon

- Note you may have to install the perl module "version::vxs" for some
 reason--it is not a prerequisite for any GMOD software, but must be an
 undeclared prereq for something that GMOD software depends on.
 Hopefully this will be fixed by the author soon.

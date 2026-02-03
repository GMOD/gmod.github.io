---
title: "Argos"
---
# Argos

  Status](#Status)
- [Contact](#Contact)
- [Description](#Description)
- [Developer
  notes](#Developer_notes)
- [Demo &
  Screenshots](#Demo_.26_Screenshots)
  - [Flybase
    Servers](#Flybase_Servers)
    - [Last
      generation](#Last_generation)
    - [Next
      Generation](#Next_Generation)
- [Requirements](#Requirements)
- [Documentation](#Documentation)
  - [Summary of
    steps to installation of an Argos server
    system](#Summary_of_steps_to_installation_of_an_Argos_server_system)
- [Downloads](#Downloads)

## Status

Actively supported

Last release: 0.7 (2005)

## Contact

<a href="mailto:argos@eugenes.org" class="external text"
rel="nofollow">argos@eugenes.org</a>

## Description

Argos, *a.k.a.* Flybase-NG, *a.k.a.* biodb, is designed to provide
automatic replication, installation and updates of genome and organism
databases and information servers, including FlyBase and euGenes. It
should be not too difficult to add other organism/genome services to
this replication structure.

Its main value is a collection of pre-tested and implemented common
database/information service tools needed for organism database systems,
which can be automatically distributed and updated to any computer.

The replication includes scripts, configurations, data, and Unix
binaries for all needed programs except Perl, Java and rsync. Rsync is
used as the primary distribution program.

This is server distribution system is still in development. It will be
possible to use this for automated updates of mirrored servers. Uses of
an automated server distribution system include local use for load
distribution (apache backhand module is included for this), world-wide
mirror sites for rapid local access, institution/company mirror servers
for local projects and data mining. An automatable mirroring system
differs from the method of providing software and data downloads by FTP
in that packages of data and software in this system are kept up-to-date
without human intervention. Similar package management systems such as
RPM, pacman and others are well developed tools but don't quite meet the
needs of this bio-database distribution.

The basic system structure is:

      common/
         java/ ; perl/ -- language packages
         servers/ -- major programs (blast, dbms, internet servers)
         systems/ -- operating system binaries of programs, packages
      docs/      -- general documents
      logs/      -- server logs
      template/  -- template information system structure
      flybase/   -- implemented genome information system structures
      eugenes/
      daphnia/

This design allows segregation common infrastructure from
project-specific parts. Projects may contain any needed software along
with data, web docs, database files, etc. A common symbolic link folder
in each project is used to access the common software structure.

Per-package installations and updates are available, to allow customer
choices of packages. This includes logic to update infrastructure
software from different source sites, and focuses on using rsync as
primary distribution/update tool (ftp, http, others are possible; rsync
has needed file-system aware updating methods).

Evaluation of RPM, pacman, cluster-backup/mirror tools, grid packaging
tools found none were quite right, so a 'quick hack' perl installation
program has been built.

  

## Developer notes

Current developers are [Don Gilbert](User%253ADongilbert "User%253ADongilbert"),
Nihar Sheth and Victor Strelets for FlyBase-NG and euGenes uses. We hope
others will try it and join us in using and developing it. Email us at
<a href="mailto:argos@eugenes.org" class="external text"
rel="nofollow">argos@eugenes.org</a>.

Contents in <a href="http://gmod.svn.sourceforge.net/viewvc/gmod/argos"
class="external text" rel="nofollow">SourceForge</a> for this project
are installation and configuration files.
<a href="Subversion" class="mw-redirect"
title="Subversion">Subversion</a> is not designed for storage and
distribution of bulk data, program binaries, and the many package
installations included in Argos repositories.

For this, `argos/install/packages.conf` configurations point to source
servers for fetching ready-to-use packages, similar to the distribution
system used by Globus.org for grid computing packages that are
distributed to multiple grid node computers.

Also it is presumed that each implemented service will maintain software
and documents separately from Argos, as the open-source software
collected into the Argos commons are separately maintained, but
installed for use with Argos.

GMOD developers can add new package sets to the
`argos/install/packages.conf` which point to rsync servers for the
packages.

## Demo & Screenshots

A slide set outlines Argos/FlyBase-NG:
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5b/Flybase-ng-may03.pdf" class="internal"
title="Flybase-ng-may03.pdf">flybase-ng-may03.pdf</a>

  

### Flybase Servers

These are overviews of FlyBase's server system structures.

#### Last generation

    -- flybase last-generation file system structure (1996-2002)
    -- all runs via Apache web server (no separate standalone servers beyond FTP)
    -- plus nightly cron job to FTP mirror data and software from main server
    -- installs and runs in any Unix path

    (any)/flybase-server/

     cgi-bin/     -- web CGI programs

     bin-local -> sun-sparc-solaris-bin/   -- OS specific programs

     data -> ~ftp/flybase/data    -- primary public data files

     indices/ -- data search index files

     logs/    -- web logs

     mirror/  -- FTP mirroring software

     server/    -- public web pages and other accessory data
       .etc/    -- accessory data, miscellany
       .srs/    -- search engine
       aberrations/ -- subject class folders seen in public interface
       anatomy/
       genes/
       others...

     source/    -- program source code

     sun-sparc-solaris-bin/  -- OS specific binaries
     dec-alpha-osf4-bin/
     sgi-irix-bin/
     linux-i86-elf-bin/

     -- installation documents
     Install*
     Readme

#### Next Generation

    -- flybase+ next-generation information system structure
     -- 2003- in progress

    /bio/biodb/
     common/
       java/ ; perl/ -- language packages
       servers/ -- major programs (blast, dbms, internet servers)
       systems/ -- operating system binaries of programs, packages

     docs/
     logs/

     myorg/     -- template information system structure

     flybase/   -- implemented information system structures
     eugenes/
     daphnia/

  

    -- segregate common infrastructure from project-specific parts

    -- want per-package installations and updates
      -- allow customer choices of packages
      -- need to find/make package distribution management utility
         -- should include logic to update infrastructure software from source sites
      -- focus on 'rsync' now as main distribution tool
      -- evaluating of RPM, pacman, cluster-backup/mirror tools,
         grid packaging tools - none quite right
      -- want CVS management of biodb structure, package info, configs
         but not main programs, data, binaries

    -- per-project packages should be fairly flexible in structure, content
      -- need to specify necessary infrastructure packages
      -- need to include security/authentication options (private and
      public sections and methods)

    -- retain daily mirror-ability of current server,
      for distribution & updating of active servers to others
      and for local clusters to manage high-volume traffic
       -- more issues now with rdbms and other stand-alone server updates
       -- fixed unix path currently is used to solve configuration needs
       -- need install/update script to allow path choices, auto-restart servers

  

    -- current structure details
    /bio/biodb:

       common:

           java:
                axis:
                lsid:
                lucene:
                ogsa:
                xindice:

           perl:
                lsid:

           servers:
              -- hope to use 'plain vanilla' copies of these tools so updates are easy
                 and customers can replace with own versions
              -- customize per project and via configurations
                apache:
                berkeleydb:
                blast:
                ldap:
                mirror:
                mysql:
                postgresql:
                rsync:
                srs:
                tomcat:
                wuftpd:

           source:
                apache:
                    fbapache_1.3.26.tar.gz
                    mod_backhand-1.2.2.tar.gz
                    mod_layout-3.2.tar.gz
                    mod_throttle312.tgz
                postgresql-7.3.2.tar.gz
                berkeleydb, mysql, rsync, blast, ...

           system-local
        -- symlink to active systems binaries for common symlinks

           systems:
            -- compiled binaries for common servers
                apple-powerpc-darwin:
                intel-linux:
                sgi-irix:
                sun-sparc-solaris:
                rsync.exclude.local

       docs:

       logs:

       rsync.exclude

  

       myorg:
     -- template folder
            cgi-bin:
            common
            conf:
                apache.conf
                apache.conf.in
            data:
            etc:
            indices:
            secure:
            tmp:
            web:
            webapps:
            rsync.exclude.local

  

       daphnia:
      -- another genome organism

       eugenes:
     -- multi organism system

       flybase:
            cgi-bin:
            -- standard web CGI programs

           common
            -- symlink to common programs

           conf:
                apache.conf
                apache.conf.in
                apache.conf.local
                cvsweb.conf

           data:
            -- public data files area, symlink to anon-FTP folder
                aberrations:
                allied-data:
                docs:
                extdb:
                genes:
                images:
                maps:
                news:
                nomenclature:
                refs:
                work:

           dbs:
                blast:
                srs:

           etc:
            -- miscellany data, others; some should be relocated
                cytodb:
                expdb:
                gmod-fb:
                gnomap:
                icons:
                insitus:
                jdata:
                jlib:
                kevin:
                other:
                people:
                perlbio:
                pix:
                plib:
                prefs:
                sean:
                stockxgene:
                templates:
                tomcat
                transmolmaps:
                transseq:

  

           indices:
            -- data search/database files (? add postgres/mysql data here)
                blast:
                srs:

           fbwebstart.sh
            rsync.exclude.local
            tmp:

           usenet:
                bionet:

           web:
            --  public web interface folders
                aberrations:
                allied-data:
                alt-views:
                anatomy:
                annotfb:
                clones:
                docs:
                fbservlet:
                gbrowse_fb
                genes:
                genome-projects:
                images:
                index.html
                maps:
                people:
                pep:
                refs:
                robots.txt
                search:
                sequences:
                stocks:
                tmp
                transposons:

  

               webapps:
            -- standard web Servlet programs
                cvservlet:
                fbchado:

## Requirements

A current Unix computer, with several free Gigabytes of disk space,
depending on which system packages are to be installed. The following
software needs to be pre-installed on the system. Argos includes all
other packages needed for its operation, drawn from common open-source
software tools and packages used for bioinformatics databases and
information systems.

These packages need to be and commonly are preinstalled

- Perl v5.6 or later -
  <a href="http://www.perl.com/" class="external free"
  rel="nofollow">http://www.perl.com/</a>
- Java v1.3 or later -
  <a href="http://java.sun.com/" class="external free"
  rel="nofollow">http://java.sun.com/</a>
- rsync v2.5 or later -
  <a href="http://rsync.samba.org/" class="external free"
  rel="nofollow">http://rsync.samba.org/</a>

The Argos system will replicate updates to compiled programs for these
operating systems, obviating need for any human-attended compiling and
installation. Unix systems that have binary package support are:

- Apple MacOSX (v10.2 build)
- Intel Linux (kernel 2.4 build)
- Sun Solaris (v8 build)

In this alpha 0.3 (june 2003) release, installation of common Argos
packages uses ~ 200 MB of disk. Installation of a full FlyBase service
uses ~ 2.5 GB of disk. Installation of a full euGenes service uses ~ 4
GB of disk.

## Documentation

**Quick start:**

See the <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/argos/trunk/install/README.txt?revision=HEAD"
class="external text" rel="nofollow">Argos README</a> for installation
instructions.

  

#### Summary of steps to installation of an Argos server system

1.  Fetch the install script from a command line
    with`rsync rsync://flybase.net/biodb/install/installng.pl .` (or use
    web link on this page)
2.  Run `perl installng.pl` for summary help.
3.  Run `perl installng.pl -root=/usr/local/biodb -install` to create
    root folder and fetch the installation package (location for -root=
    is your choice; change below steps to match)
4.  Edit `/usr/local/biodb/install/install.conf.local` to set
    configuration. Change package set, paths and ports as desired in
    this install.conf.
5.  Run `/usr/local/biodb/install/installng.pl -install ` to add the
    full set of packages. Packages selected from packages.conf will by
    copied from servers.
6.  Run `/usr/local/biodb/install/run-apache` to start servers
7.  Run `/usr/local/biodb/install/installng.pl -update ` to update
    server periodically.

  

## Downloads

- Argos-based servers:
  <a href="http://eugenes.org/argos/" class="external free"
  rel="nofollow">http://eugenes.org/argos/</a> for euGenes genome
  database, and other services in development.
- Main package distribution: \[rsync://eugenes.org/argos\]
- With project-specific packages distributed from other servers, as
  specified in the <a
  href="http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/gmod/argos/install/packages.conf?rev=HEAD"
  class="external text" rel="nofollow">argos/install/packages.conf</a>

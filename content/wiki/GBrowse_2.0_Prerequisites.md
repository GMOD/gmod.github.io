---
title: "GBrowse 2.0 Prerequisites"
---
# GBrowse 2.0 Prerequisites

Before [installing GBrowse
2.0](/wiki/GBrowse_2.0_Install_HOWTO), you will
need to install some prerequisites on your system. Most prerequisites
come as prepackaged binaries which can be installed from the command
line or via GUI tools. This document describes the prerequisites for
Linux, Mac OSX, and Microsoft Windows systems.

 systems</span>](#Linux_systems)
 - [Applications and
 Libraries](#Applications_and_Libraries)
 - [Binary
 Packages](#Binary_Packages)
 - [DEB
 Systems (apt)](#DEB_Systems_.28apt.29)
 - [Ubuntu 10.04/11.04
 Issue](#Ubuntu_10.04.2F11.04_Issue)
 - [RPM
 Systems (yum)](#RPM_Systems_.28yum.29)
 - [Installing
 BioPerl](#Installing_BioPerl)
- [MacOSX](#MacOSX)
 - [Fink
 Way](#Fink_Way)
 - [Mac Ports
 Way](#Mac_Ports_Way)
 - [Perl
 Modules](#Perl_Modules)

# Linux systems

The following prerequisites are needed to run GBrowse on Linux systems:

## Applications and Libraries

- The <a href="http://httpd.apache.org" class="external text"
 rel="nofollow">Apache2 web server</a>
- <a href="http://www.perl.org" class="external text" rel="nofollow">Perl
 5.8</a> or higher
- The <a href="http://www.boutell.com/gd/" class="external text"
 rel="nofollow">libgd2 library</a>

Although not required for basic operation, you will probably want at
least one relational database backend. One or both of:

- <a href="http://www.mysql.org" class="external text"
 rel="nofollow">MySQL</a>
- <a href="http://www.postgresql.org" class="external text"
 rel="nofollow">PostgreSQL</a>

Those who want to obtain the best performance should consider the
mod_perl, or FastCGI Apache modules:

- <a href="http://perl.apache.org/" class="external text"
 rel="nofollow">mod_perl</a>
- <a href="http://www.fastcgi.com/drupal/" class="external text"
 rel="nofollow">FastCGI</a>

Those who wish to generate publication-ready PDFs from GBrowse tracks
should install the inkscape package:

- <a href="http://www.inkscape.org" class="external text"
 rel="nofollow">Inkscape</a>

These applications can be installed from source code or from binary
packages using one of the binary packaging systems described below.

## Binary Packages

If you use a modern Linux distribution, most prerequisites are available
as binary packages. There are two common package managers, Debian (DEB)
and RedHat Package Manager (RPM). The next section shows you how to use
command-line package management tools to install the prerequisites.

### DEB Systems (apt)

Distributions on which apt is installed by default include Ubuntu (and
its variants), Debian, and Mint. To install all prerequisites except for
BioPerl, run the following commands as the root or using sudo (comments
begin with the \# sign). Some of these packages may already be installed
on your system.

 #Utilities to help with fetching components distributed in source code
 sudo apt-get install wget subversion git-core libc6-dev build-essential libgd2-noxpm-dev

 #apache2 with acceleration
 sudo apt-get install apache2 libapache2-mod-fcgid libapache2-mod-perl2

 #fast lightweight database for managing user accounts
 sudo apt-get install sqlite3 libdbd-sqlite3-perl

 #Perl libraries
 sudo apt-get install libmodule-build-perl libio-string-perl \
 libcapture-tiny-perl libcgi-session-perl libwww-perl libstatistics-descriptive-perl \
 libjson-perl libjson-any-perl libsvg-perl perl-doc libtemplate-perl libgd-gd2-perl libgd-svg-perl \
 libdata-stag-perl libterm-readkey-perl libhttp-daemon-perl libfcgi-perl

 # optional libraries for using MySQL and PostgreSQL backends
 sudo apt-get install mysql-server mysql-client libdbd-mysql-perl libmysqlclient-dev postgresql libdbd-pg-perl

 # optional libraries for e-mail-based user registration and OpenID logins
 sudo apt-get install libdigest-sha-perl libssl-dev libmath-bigint-gmp-perl \
 libnet-openid-consumer-perl libnet-smtp-ssl-perl libauthen-sasl-perl libcrypt-ssleay-perl

All these installation steps must be executed as root (shown here using
*sudo*).

Packaged versions of BioPerl contain a bug that prevents GBrowse from
displaying DNA sequences from in-memory databases. Install Bioperl from
source code this way:

 git clone https://github.com/bioperl/bioperl-live.git
 cd bioperl-live
 perl Build.PL
 ./Build test
 sudo ./Build install

#### Ubuntu 10.04/11.04 Issue

The binary version of the GD Perl module that is packaged for Ubuntu
10.04 (Lucid Lynx) and 11.04 (Natty Narwhal) contains a bug that causes
BioPerl to fail several of its tests, blocking GBrowse installation. To
fix:

 sudo apt-get remove libgd-gd2-perl
 sudo apt-get install libgd2-noxpm-dev
 sudo perl -MCPAN -e 'install GD'

Then proceed to install Bio::Graphics::Browser2 from the CPAN shell as
described in [GBrowse 2.0 Install
HOWTO](/wiki/GBrowse_2.0_Install_HOWTO).

### RPM Systems (yum)

This includes Fedora, RedHat, SuSE, Mandriva, PCLinuxOS, and CentOS.
Most of these distributions have the command line package management
tool *yum* which is used in the following command examples. These
commands will need to be run as root (or equivalently by using *sudo* in
the manner shown above):

 # build utilities
 yum install make gcc gmp-devel

 #Utilities to help with fetching components distributed in source code
 yum install wget git

 #apache2
 yum install httpd mod_fcgid fcgi-perl

 # various Perl modules
 yum install perl-GD perl-Module-Build perl-CPAN perl-IO-String perl-Capture-Tiny perl-CGI-Session \
 perl-JSON perl-JSON-Any perl-libwww-perl perl-DBD-SQLite perl-File-NFSLock perl-Net-SMTP-SSL \
 perl-Crypt-SSLeay perl-Net-SSLeay perl-Template-Toolkit

 # bioperl
 yum install perl-bioperl perl-Bio-Graphics

 #optionally...
 yum install mysql-server mysql-libs perl-DBD-MySQL
 yum install postgresql postgresql-server perl-DBD-Pg
 yum install inkscape
 yum install perl-GD-SVG

## Installing BioPerl

You should use version 1.7.1 of BioPerl, currently available from CPAN:

 perl -MCPAN -e 'install Bio::Perl'

You're done installing prerequisites! You can now go back to the
[GBrowse 2.0 Install
HOWTO](/wiki/GBrowse_2.0_Install_HOWTO), and
follow the installation instructions for your platform.

# MacOSX

## Fink Way

These instructions apply to Macintosh OSX version 10.5, using the *fink*
binary installer. First, download and install
<a href="http://fink.sourceforge.net" class="external text"

following commands as the root user or with *sudo* (as shown):

 #Utility to help components distributed in source code
 sudo fink install wget

 #libgd2 and its Perl library
 sudo fink install gd2 gd2-bin
 sudo perl -MCPAN -e 'install GD'

 #other Perl modules
 sudo perl -MCPAN -e 'install IO::String'
 sudo perl -MCPAN -e 'install CGI::Session'
 sudo perl -MCPAN -e 'install JSON'
 sudo perl -MCPAN -e 'install JSON::Any'

 #optionally.
 sudo fink install mysql
 '''more to come here'''
 sudo perl -MCPAN -e 'install GD::SVG'

**this section is unfinished**

If it isn't already activated, turn the Apache server on by activating
*Control Panel-\>Sharing-\>Web Sharing*.

## Mac Ports Way

First, download and install MySQL Community Server form
<a href="http://dev.mysql.com/downloads/mysql/" class="external free"

You can download and install macports from
<a href="http://www.macports.org/" class="external free"

Edit your .profile '/Users/youname/.profile'

 export DYLD_LIBRARY_PATH=/usr/local/mysql-5.5.9-osx10.6-x86_64/lib:$DYLD_LIBRARY_PATH
 export PATH=/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin/:$PATH

Then, logout and login.

 # sudo port install perl5
 # sudo port install apache2
 # sudo port install p5-gd
 # sudo port install git-core

Using cpan install these modules

 GD::SVG
 SVG
 CGI
 DBI
 DBD::mysql
 DBD::SQLite
 Statistics::Descriptive
 Data::Stag
 GD::Graph
 GD::Graph::smoothlines
 Statistics::Lite
 Statistics::LineFit
 Compress::Zlib
 IO::Zlib
 Config::Simple
 Pod::Usage
 Algorithm::Cluster

Install Bioperl

 git clone https://github.com/bioperl/bioperl-live.git
 cd bioperl-live
 git checkout bioperl-release-1-6-901
 perl Build.PL
 ./Build test
 sudo ./Build install

## Perl Modules

GBrowse depends on the following standard Perl libraries:

- Module::Build
- GD
- Bio::Perl (version 1.6.0 or higher)
- Bio::Graphics
- JSON
- LWP
- Storable
- IO::String
- Capture::Tiny
- File::Temp
- Digest::MD5
- CGI::Session
- Statistics::Descriptive

In addition, the following optional Perl libraries are recommended:

- GD::SVG (for PDFs and editable high-resolution images)
- DBI (for relational database access)
- DBD::mysql (for MySQL database backends)
- DBD::Pg (for PostgreSQL database access)
- DB_File::Lock (for load balancing in rendering slavesstrongly)
- File::NFSLock (if two or more servers are sharing the same NFS-mounted
 directory for sessions)
- Template (to run the population allele frequency visualization demo)
- Crypt::SSLeay, Math::BigInt, Net::OpenID::Consumer, Net::SMTP::SSL
 (for user account registration)
 - **Note:** The Math::BigInt and Net::OpenId::Consumer library
 installation tests will run **very** slowly unless supported by the
 Math::BigInt::GMP or Math::BigInt::Pari libraries. It is suggested
 that you install these libraries before trying to install
 Math::BigInt and Net::OpenId::Consumer.

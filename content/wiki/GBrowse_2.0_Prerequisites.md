---
title: "GBrowse 2.0 Prerequisites"
---




<span id="top"></span>




# <span dir="auto">GBrowse 2.0 Prerequisites</span>









Before [installing GBrowse
2.0](GBrowse_2.0_Install_HOWTO.1 "GBrowse 2.0 Install HOWTO"), you will
need to install some prerequisites on your system. Most prerequisites
come as prepackaged binaries which can be installed from the command
line or via GUI tools. This document describes the prerequisites for
Linux, Mac OSX, and Microsoft Windows systems.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Linux
  systems</span>](#Linux_systems)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">Applications and
    Libraries</span>](#Applications_and_Libraries)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Binary
    Packages</span>](#Binary_Packages)
    - [<span class="tocnumber">1.2.1</span> <span class="toctext">DEB
      Systems (apt)</span>](#DEB_Systems_.28apt.29)
      - [<span class="tocnumber">1.2.1.1</span>
        <span class="toctext">Ubuntu 10.04/11.04
        Issue</span>](#Ubuntu_10.04.2F11.04_Issue)
    - [<span class="tocnumber">1.2.2</span> <span class="toctext">RPM
      Systems (yum)</span>](#RPM_Systems_.28yum.29)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Installing
    BioPerl</span>](#Installing_BioPerl)
- [<span class="tocnumber">2</span>
  <span class="toctext">MacOSX</span>](#MacOSX)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Fink
    Way</span>](#Fink_Way)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Mac Ports
    Way</span>](#Mac_Ports_Way)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Perl
    Modules</span>](#Perl_Modules)



# <span id="Linux_systems" class="mw-headline">Linux systems</span>

The following prerequisites are needed to run GBrowse on Linux systems:

## <span id="Applications_and_Libraries" class="mw-headline">Applications and Libraries</span>

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

## <span id="Binary_Packages" class="mw-headline">Binary Packages</span>

If you use a modern Linux distribution, most prerequisites are available
as binary packages. There are two common package managers, Debian (DEB)
and RedHat Package Manager (RPM). The next section shows you how to use
command-line package management tools to install the prerequisites.

### <span id="DEB_Systems_.28apt.29" class="mw-headline">DEB Systems (apt)</span>

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
     libcapture-tiny-perl  libcgi-session-perl libwww-perl libstatistics-descriptive-perl \
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



#### <span id="Ubuntu_10.04.2F11.04_Issue" class="mw-headline">Ubuntu 10.04/11.04 Issue</span>

The binary version of the GD Perl module that is packaged for Ubuntu
10.04 (Lucid Lynx) and 11.04 (Natty Narwhal) contains a bug that causes
BioPerl to fail several of its tests, blocking GBrowse installation. To
fix:

    sudo apt-get remove libgd-gd2-perl
    sudo apt-get install libgd2-noxpm-dev
    sudo perl -MCPAN -e 'install GD'

Then proceed to install Bio::Graphics::Browser2 from the CPAN shell as
described in [GBrowse 2.0 Install
HOWTO](GBrowse_2.0_Install_HOWTO.1 "GBrowse 2.0 Install HOWTO").



### <span id="RPM_Systems_.28yum.29" class="mw-headline">RPM Systems (yum)</span>

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

## <span id="Installing_BioPerl" class="mw-headline">Installing BioPerl</span>

You should use version 1.7.1 of BioPerl, currently available from CPAN:

     perl -MCPAN -e 'install Bio::Perl'

You're done installing prerequisites! You can now go back to the
[GBrowse 2.0 Install
HOWTO](GBrowse_2.0_Install_HOWTO.1 "GBrowse 2.0 Install HOWTO"), and
follow the installation instructions for your platform.

# <span id="MacOSX" class="mw-headline">MacOSX</span>

## <span id="Fink_Way" class="mw-headline">Fink Way</span>

These instructions apply to Macintosh OSX version 10.5, using the *fink*
binary installer. First, download and install
<a href="http://fink.sourceforge.net" class="external text"
rel="nofollow">Fink</a>. Next open up the terminal window and type the
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

## <span id="Mac_Ports_Way" class="mw-headline">Mac Ports Way</span>

First, download and install MySQL Community Server form
<a href="http://dev.mysql.com/downloads/mysql/" class="external free"
rel="nofollow">http://dev.mysql.com/downloads/mysql/</a>.

You can download and install macports from
<a href="http://www.macports.org/" class="external free"
rel="nofollow">http://www.macports.org/</a>.

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

## <span id="Perl_Modules" class="mw-headline">Perl Modules</span>

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




[Category](Special%253ACategories "Special%253ACategories"):

- [GBrowse 2](Category%253AGBrowse_2 "Category%253AGBrowse 2")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse_2.0_Prerequisites"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:20 on 15 January
  2017.</span>
<!-- - <span id="footer-info-viewcount">269,705 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





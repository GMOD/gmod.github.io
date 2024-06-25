<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">GBrowse Install HOWTO</span>

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

This page contains detailed installation instructions for **installing
[GBrowse 1.x](GBrowse.1 "GBrowse")**, suitable for use on Linux and
other Unix-like platforms. It also contains performance and maintenance
hints useful for all systems.

Note that these instructions are specific to GBrowse 1.x versions. See
the [installation instructions for GBrowse
2.x](GBrowse_2.0_Install_HOWTO.1 "GBrowse 2.0 Install HOWTO").

See also the following OS-specific instructions:

- [Install on MacOSX](GBrowse_MacOSX_HOWTO "GBrowse MacOSX HOWTO")
- [Install on Windows](GBrowse_Windows_HOWTO "GBrowse Windows HOWTO")
- [Install on Ubuntu and other Debian-based
  systems](GBrowse_Ubuntu_HOWTO "GBrowse Ubuntu HOWTO")
- [Install on Fedora Core and other RPM-based
  systems](GBrowse_RPM_HOWTO "GBrowse RPM HOWTO")
- [Install on Gentoo Linux
  system](GBrowse_Gentoo_HOWTO "GBrowse Gentoo HOWTO")
- **Source Code Install (for other Linux systems)**

  

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span> <span class="toctext">The
  NetInstaller</span>](#The_NetInstaller)
- [<span class="tocnumber">2</span>
  <span class="toctext">Prerequisites</span>](#Prerequisites)
  - [<span class="tocnumber">2.1</span>
    <span class="toctext">Apache</span>](#Apache)
  - [<span class="tocnumber">2.2</span> <span class="toctext">MySQL
    (recommended)</span>](#MySQL_.28recommended.29)
  - [<span class="tocnumber">2.3</span>
    <span class="toctext">Perl</span>](#Perl)
    - [<span class="tocnumber">2.3.1</span>
      <span class="toctext">Standard Perl
      modules</span>](#Standard_Perl_modules)
    - [<span class="tocnumber">2.3.2</span>
      <span class="toctext">BioPerl</span>](#BioPerl)
    - [<span class="tocnumber">2.3.3</span>
      <span class="toctext">Bio::Graphics and
      Bio::DB::Das::Chado</span>](#Bio::Graphics_and_Bio::DB::Das::Chado)
    - [<span class="tocnumber">2.3.4</span>
      <span class="toctext">Optional Perl
      modules</span>](#Optional_Perl_modules)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Important
    Note for Macintosh
    Systems</span>](#Important_Note_for_Macintosh_Systems)
- [<span class="tocnumber">3</span> <span class="toctext">Basic
  Installation</span>](#Basic_Installation)
  - [<span class="tocnumber">3.1</span>
    <span class="toctext">Details</span>](#Details)
  - [<span class="tocnumber">3.2</span> <span class="toctext">Installing
    into your Home
    Directory</span>](#Installing_into_your_Home_Directory)
- [<span class="tocnumber">4</span> <span class="toctext">Try the
  Browser Out</span>](#Try_the_Browser_Out)
- [<span class="tocnumber">5</span> <span class="toctext">Populating the
  Database (MySQL)</span>](#Populating_the_Database_.28MySQL.29)
  - [<span class="tocnumber">5.1</span>
    <span class="toctext">Synopsis</span>](#Synopsis)
  - [<span class="tocnumber">5.2</span>
    <span class="toctext">Details</span>](#Details_2)
    - [<span class="tocnumber">5.2.1</span> <span class="toctext">GFF3
      Loading</span>](#GFF3_Loading)
- [<span class="tocnumber">6</span> <span class="toctext">Loading Other
  Data Sets</span>](#Loading_Other_Data_Sets)
- [<span class="tocnumber">7</span> <span class="toctext">Loading
  DNA</span>](#Loading_DNA)
- [<span class="tocnumber">8</span> <span class="toctext">Creating your
  own Genome Database</span>](#Creating_your_own_Genome_Database)
- [<span class="tocnumber">9</span> <span class="toctext">Making the
  Browser Run Faster</span>](#Making_the_Browser_Run_Faster)
- [<span class="tocnumber">10</span> <span class="toctext">Making the
  Server Run Safer</span>](#Making_the_Server_Run_Safer)
- [<span class="tocnumber">11</span> <span class="toctext">The
  gbrowse_img Script</span>](#The_gbrowse_img_Script)
- [<span class="tocnumber">12</span>
  <span class="toctext">Plugins</span>](#Plugins)
- [<span class="tocnumber">13</span> <span class="toctext">The
  Genbank/EMBL Proxy</span>](#The_Genbank.2FEMBL_Proxy)
- [<span class="tocnumber">14</span> <span class="toctext">Removing
  Out-of-Date Image Files</span>](#Removing_Out-of-Date_Image_Files)
- [<span class="tocnumber">15</span> <span class="toctext">Bug Reports
  and Support Requests</span>](#Bug_Reports_and_Support_Requests)

</div>

# <span id="The_NetInstaller" class="mw-headline">The NetInstaller</span>

One of the easiest ways to install GBrowse is with the network installer
script, <a
href="https://github.com/GMOD/GBrowse/raw/master/bin/gbrowse_netinstall.pl"
class="external text"
rel="nofollow"><code>gbrowse_netinstall.pl</code></a>

- You will need to have Perl 5.8.6 or higher, and the Apache web server
  installed. See [Prerequisites](#Prerequisites) before running the
  installer for discussion of prerequisites needed. Once these are
  installed, save the above link to your home directory as
  gbrowse_netinstall.pl, and then run "perl gbrowse_netinstall.pl". On
  Windows platforms, you will need to be logged in as a user with
  administrative privileges. On Mac OSX, Linux or Solaris platforms, you
  will need to be logged in as root, or to run the command using "sudo"
  (*sudo perl gbrowse_netinstall.pl*).

The install script has a few useful options:

     -h|--help                Show this message
     -d|--dev                 Use the development version of both GBrowse
                                and bioperl from GitHub
     --bioperl_dev            Use the development version of BioPerl from GitHub
     --gbrowse_dev            Use the development version of GBrowse from GitHub
     --build_param_str=<args> Use this string to set Makefile.PL parameters
                                such as CONF or PREFIX for GBrowse
                                installation
     --install_param_str=<args>
                               Use this string to predefine 'make install'
                                parameters such as CONF or PREFIX for
                                GBrowse installation
     --gbrowse_path           Path to GBrowse tarball (will not download
                                GBrowse); Assumes a resulting
                                'Generic-Genome-Browser' directory
     --bioperl_path           Path to BioPerl tarball (will not download
                                BioPerl); Assumes a resulting'bioperl-live'
                                directory
     --skip_start             Don't wait for 'Enter' at program start
     --skip_bioperl           Don't fetch and install BioPerl; assumes a
                                working bioperl is already installed

So, for example, if you want to install the most recent developments in
GBrowse and BioPerl, you can do this:

     sudo perl gbrowse_netinstall.pl -d

This option is useful for getting new options just added to GBrowse (for
example, the Balloon pop up windows added before the release of GBrowse
1.69) or for getting a new BioPerl that has recent bugs fixed.

# <span id="Prerequisites" class="mw-headline">Prerequisites</span>

GBrowse runs on top of several software packages. These must be
installed and configured before you can run GBrowse. Most preconfigured
Linux systems will have some of these packages installed already.

  

## <span id="Apache" class="mw-headline">Apache</span>

The Apache web server
<a href="http://www.apache.org" class="external autonumber"
rel="nofollow">[1]</a> is the industry standard open source web server
for Unix and Windows systems.

## <span id="MySQL_.28recommended.29" class="mw-headline">MySQL (recommended)</span>

The [MySQL](MySQL "MySQL") database
<a href="http://www.mysql.com" class="external autonumber"
rel="nofollow">[2]</a> is a fast open source relational database that is
widely used for web applications. It is required for most real-live
genome annotation projects. For small projects (a few thousands of
annotated features), you can skip installing MySQL and use an in-memory
database instead.

## <span id="Perl" class="mw-headline">Perl</span>

The Perl language
<a href="http://www.cpan.org" class="external autonumber"
rel="nofollow">[3]</a> is widely used for web applications. You will
need version 5.8.6 or higher.

### <span id="Standard_Perl_modules" class="mw-headline">Standard Perl modules</span>

The following Perl modules must be installed for GBrowse to work. They
can be found on the Comprehensive Perl Archive Network (CPAN)
<a href="http://www.cpan.org" class="external autonumber"
rel="nofollow">[4]</a>:

- CGI (2.56 or higher)
- GD (2.07 or higher)
- CGI::Session (4.03 or higher)
- DBI (any version)
- DBD::mysql (any version)
- Digest::MD5 (any version)
- Text::Shellwords (any version)
- Class::Base (any version)

### <span id="BioPerl" class="mw-headline">BioPerl</span>

The [BioPerl](BioPerl "BioPerl") project
<a href="http://www.bioperl.org" class="external autonumber"
rel="nofollow">[5]</a> is a set of Perl modules for working with common
bioinformatics applications. GBrowse requires BioPerl version 1.6 or
greater.

For full details on installing BioPerl, see
<a href="http://www.bioperl.org" class="external free"
rel="nofollow">http://www.bioperl.org</a>

Note that in addition to the above Perl modules required by GBrowse,
BioPerl has its own set of required Perl modules. The BioPerl install
process ('perl Build.PL' within the bioperl-live directory) will try to
automatically install these modules for you. However, it may help you to
keep track of potential errors if you install them separately first
(using CPAN, for example). They are: Data::Stag \| IO::String \| DB_File
\| Scalar::Util \| ExtUtils::Manifest \| Test::More \| Module::Build \|
Test::Harness \| CPAN

Optionally: Test::Pod \| Statistics::Frequency \| XML::LibXML::Reader \|
Bio::ASN1::EntrezGene \| Bio::Ext::Align \| Inline::MakeMaker \|
Bio::SeqIO::staden::read \| Ace \| Spreadsheet::ParseExcel \|
Math::Random \| Graph \| SVG::Graph \| SOAP::Lite \| GraphViz \|
Array::Compare \| Convert::Binary::C \| Algorithm::Munkres \|
Set::Scalar \| Spreadsheet::WriteExcel \| XML::SAX::Writer \| Clone \|
XML::DOM::XPath \| PostScript::TextBlock

### <span id="Bio::Graphics_and_Bio::DB::Das::Chado" class="mw-headline">Bio::Graphics and Bio::DB::Das::Chado</span>

Previously, Bio::Graphics and Bio::DB::Das::Chado were a part of BioPerl
but since version 1.6.0, they have been split out into a separate
package. They can be installed from the CPAN shell like any other Perl
module.

### <span id="Optional_Perl_modules" class="mw-headline">Optional Perl modules</span>

The following Perl modules are not needed for a functional GBrowse
install. We recommend that you install them as needed to obtain
additional features.

XML::Parser, XML::Writer, XML::Twig, XML::DOM  
If these modules are present, the "Sequence Dumper" plugin will be able
to produce GAME and BSML output. They can be downloaded from CPAN.

<!-- -->

LWP  
To load remote 3d party annotations. Available from CPAN.

<!-- -->

Bio::Das  
To display remote annotations using the [Distributed Annotation
System](Distributed_Annotation_System "Distributed Annotation System").
The current version is available at CPAN:
<a href="http://search.cpan.org/~lds/Bio-Das/" class="external free"
rel="nofollow">http://search.cpan.org/~lds/Bio-Das/</a> and can be
installed from the cpan shell.

<!-- -->

BioMOBY  
Needed by gbrowse_moby to fetch and display data from BioMOBY providers.
Available from biomoby.org; obtain via anonymous cvs until it is
released. Directions are at
<a href="http://www.biomoby.org/GettingTheCode.html"
class="external free"
rel="nofollow">http://www.biomoby.org/GettingTheCode.html</a>.

<!-- -->

GD::SVG  
To save images as publication-quality editable images in Scalar Vector
Graphics format. Available from CPAN.

<!-- -->

Bio::SCF File::Temp io-lib(v1.7+)  
Needed by the sequencing trace glyph to parse SCF files and display the
trace graph. The io-lib library can be downlowded from <a
href="https://sourceforge.net/project/showfiles.php?group_id=100316&amp;package_id=108243"
class="external free"
rel="nofollow">https://sourceforge.net/project/showfiles.php?group_id=100316&amp;package_id=108243</a>
which is part of the Staden Package
<a href="https://sourceforge.net/projects/staden/" class="external free"
rel="nofollow">https://sourceforge.net/projects/staden/</a>.

<!-- -->

Math::FFT Statistics::Descriptive  
Needed by the Spectrogram plugin to calculate Fast Fourier Transforms.
This module is available from CPAN.

<!-- -->

Bio::PrimerDesigner, Math::Round, primer3  
Needed by the PrimerDesigner plugin. The perl modules are available from
CPAN. The linux primer3 binary is packaged with the Bio::PrimerDesigner
distribution. The binary (or source code) can also be obtained from
<a href="http://frodo.wi.mit.edu/primer3/primer3_code.html"
class="external free"
rel="nofollow">http://frodo.wi.mit.edu/primer3/primer3_code.html</a>. If
you are using this plugin, the primer3 binary must be installed in
/usr/local/bin and named 'primer3'. If it is installed in another path,
edit the following section in the PrimerDesigner plugin:

<!-- -->

             use constant BINARY            => 'primer3';
             use constant BINPATH           => '/usr/local/bin';

## <span id="Important_Note_for_Macintosh_Systems" class="mw-headline">Important Note for Macintosh Systems</span>

For Intel-based Macintoshes, you may need to be a bit careful about the
DBD libraries you install. Joan Pontius reports that you must use the
32-bit MySQL server and DBD::mysql version 2.9007 in order for the
preinstalled Perl to work nicely with MySQL. You can get the correct
DBD::mysql version at
<a href="http://search.cpan.org/~capttofu/DBD-mysql-2.9007/"
class="external text" rel="nofollow">CPAN</a>.

  

# <span id="Basic_Installation" class="mw-headline">Basic Installation</span>

Once the prerequisites are installed, download the most recent version
of the Generic-Genome-Browser source code from:

          http://prdownloads.sourceforge.net/gmod

This will give you a .tar.gz file, which must be uncompressed and
unpacked. Then run the following commands (in brief):

               perl Makefile.PL
               make
               make test (optional)
               make install UNINST=1

This will install the software in the default location for your
platform. See [Installation Details](#Installation_Details) to change
this, or to install gbrowse into your home directory. The 'UNINST=1'
will insure that older versions of Perl modules being installed will be
removed to help prevent conflicts.

To further configure GBrowse, see <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/docs/pod/CONFIGURE_HOWTO.pod"
class="external text" rel="nofollow">CONFIGURE_HOWTO.pod</a>. To run
GBrowse on top of Oracle and [PostgreSQL](PostgreSQL "PostgreSQL")
databases see <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/docs/pod/ORACLE_AND_POSTGRESQL.pod"
class="external text" rel="nofollow">ORACLE_AND_POSTGRESQL.pod</a>. To
run on top of a [BioSQL](BioSQL "BioSQL") database, see <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/docs/pod/BIOSQL_ADAPTER_HOWTO.pod"
class="external text" rel="nofollow">BIOSQL_ADAPTER_HOWTO.pod</a>. *Note
that these are in Perl "POD" format. To get rid of the formatting
instructions, save to disk and run "perldoc CONFIGURE_HOWTO.pod"*

## <span id="Details" class="mw-headline">Details</span>

The browser consists of a CGI script named "gbrowse", a Perl module that
handles some of the gory details, a small number of static image files,
and a configuration directory that contains configuration files for each
data source. The correct locations of these CGI script, configuration
directory and static files depend on how Apache was installed on your
system, which varies from operating system to operating system, and are
controlled by the following installation options:

| Setting | Default | Description |
|----|----|----|
| CONF | The system wide Apache configuration directory (e.g. /etc/httpd/ in Centos 5.2). | CONF is the directory in which you will place the gbrowse configuration files. A directory called gbrowse.conf will be created under this location to contain the GBrowse configuration files. |
| HTDOCS | The system wide Apache document root (e.g. /var/www/html/ in Centos 5.2). | The document root in which the HTML files for your web server reside. The **static** GBrowse HTML files will be created in a subdirectory under this location. |
| GBROWSE_ROOT | gbrowse | The location under HTDOCS in which you would like GBrowse's static files (stylesheets, images, documentation, etc.) to be stored. For example, if you specify "HTDOCS=/var/www/html" and "GBROWSE_ROOT=genomes/gbrowse" then the static files will be stored at "/var/www/html/genomes/gbrowse". |
| CGIBIN | The system wide Apache cgi-bin (e.g. /var/www/cgi-bin/ in Centos 5.2). | The Perl scripts responsible for generating the **dynamic** content will be created in a subdirectory under this location. |
| APACHE | none | A convenience option that defines CONF, HTDOCS and CGIBIN as APACHE/conf, APACHE/htdocs and APACHE/cgi-bin respectively. |
| LIB | The system wide Perl library path | The Perl modules that are part of GBrowse are created under this location. This location will be added to Perl's INC path, telling GBrowse where to look for these Perl modules. **Note**, if you see errors like "Can't locate Bio/Graphics.pm in @INC (@INC contains: ...", you probably need to set the servers \$PERL5LIB to match the one you used at install time. |
| BIN |  ? | Perl executable scripts directory - but I don't know what that means! |

  
Some additional configuration settings include:

| Setting | Default | Description |
|----|----|----|
| YES | 0 | Don't talk, do. Accept the defaults for all settings (in addition to those provided). |
| NONROOT | 0 | If set to a non-zero value (e.g. NONROOT=1) then install gbrowse in a way that does not require root access (in theory). |
| DO_XS | 1 | Compile fast alignment algorithm (XS C extension). If you have a C compiler and wish to compile the XS extensions, set DO_XS=1. Currently all this does is to speed up the multiple alignment plugin. |
| SELINUX | 0 | Avoid the message to warn you about SELinux that appears when SELinux could be a problem. |

  
You can manually set these locations by passing Makefile.PL one or more
NAME=VALUE pairs, like so:

         perl Makefile.PL CONF=/etc HTDOCS=/home/html

Fortunately, this isn't usually necessary. The Makefile.PL script
attempts to guess the appropriate directory locations for your system,
but sometimes you will have to specify them manually. For example, if
you are on an unusual system, where the Apache installation uses
/opt/www/html for HTML files, /opt/run/cgi-bin for CGI scripts, and
/etc/httpd/conf for the configuration files, you should specify the
following configuration:

         perl Makefile.PL HTDOCS=/opt/www/html \
                          CONF=/etc/httpd/conf \
                          CGIBIN=/opt/run/cgi-bin

(The backslashes are there to split the command across multiple lines
only). To make it easier when upgrading to new versions of the software,
you can put this command into a shell script.

As a convenience, you can use the configuration option APACHE, in which
case the static and CGI files will be placed into APACHE/conf,
APACHE/htdocs and APACHE/cgi-bin respectively, where APACHE is the
location you specified on the command line:

         perl Makefile.PL APACHE=/home/www

Note that the configuration files are always placed in a subdirectory
named gbrowse.conf. You cannot change this. Similarly, the static files
are placed in a directory named gbrowse. The install script will detect
if there are already configuration files in the selected directory and
not overwrite them if so. The same applies to the cascading stylesheet
file (gbrowse.css) located in the gbrowse subdirectory. However, neither
the GIF files in the "buttons" subdirectory nor the plugin modules in
the gbrowse.conf/plugins directory are checked before overwriting them,
so be careful to copy the new copies somewhere safe if you have modified
them.

The DO_XS flag, if true (perl Makefile.PL DO_XS=1), will compile a small
C subroutine for nucleotide alignments. This will vastly improve the
performance of the gbrowse_details script when displaying alignments. To
use this feature, you will need a C compiler.

You can always manually move the files around after install. See <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/docs/pod/CONFIGURE_HOWTO.pod"
class="external text" rel="nofollow">CONFIGURE_HOWTO.pod</a> for
details.

When installing the static files, the install script also creates an
empty directory named "tmp". This directory is set to be world writable
so that the GBrowse server can use it to manage temporary image files
that it creates on the fly. If you would prefer not to have a world
writable directory on your system, simply change the ownership and
permissions to allow the web server account to write into it. The
directory is located in *HTDOCS*/gbrowse/tmp by default.

The first time you run Makefile.PL, a file named GGB.def will be created
your file path settings. When Makefile.PL is run again, it will ask you
whether you wish to reuse the settings stored in the file.

## <span id="Installing_into_your_Home_Directory" class="mw-headline">Installing into your Home Directory</span>

Read this section only if you are on a Unix system and do not have root
privileges. You will need to configure Apache to run out of your home
directory. One way to do this is to install Apache from source code and
to specify your home directory when you first configure it:

          % cd apache_x.xx.xx
          % ./configure --prefix=$HOME/apache
          % make
          % make install

This will place Apache into your home directory under ~/apache. You
should then edit ~/apache/conf/httpd.conf and replace the directive:

         Listen 80

with

         Listen 8000

so that Apache will listen for connections to the unprivileged port 8000
rather than the usual port 80. If you also see a "Port 80" directive,
change it to read "Port 8000." You'll now be able to talk to Apache
using URLs like
<a href="http://your.host.edu:8000/" class="external free"
rel="nofollow">http://your.host.edu:8000/</a>.

You may not need to install Apache from scratch if your Unix
distribution already has Apache installed. What you will do is to create
an Apache directory tree in your home directory and then start Apache
using command-line arguments that tell it to start up from the home
directory rather than its default system-wide directory.

Create an Apache directory and its subdirectories using the following
series of commands:

         % cd ~
         % mkdir apache
         % mkdir apache/conf
         % mkdir apache/logs
         % mkdir apache/htdocs
         % mkdir apache/cgi-bin

Now copy the system-wide httpd.conf into ~/apache/conf. You may need to
search around a bit to find out where the system-wide httpd.conf lives
(try running the command "locate httpd.conf):

         % cp /etc/httpd/conf/httpd.conf ~/apache/conf

Now open up ~/apache/conf/httpd.conf with a text editor and add the
following four directives, replacing \$HOME with the full path to your
home directory (for example "/home/fred"):

         Listen       8000
         ServerRoot   $HOME/apache
         DocumentRoot $HOME/apache/htdocs
         SetEnv       PERL5LIB $HOME/lib

You should search the httpd.conf file for older versions of these
directives, and delete them if they're there. If you see a Port
directive, change it to read "Port 8000".

Somewhere in httpd.conf there will be a ScriptAlias directives, as well
as a \<Directory\> section that refers to "cgi-bin". Delete the
ScriptAlias directive and the entire \<Directory\> section through to
the \</Directory\> line. Replace both these sections with the following:

        ScriptAlias /cgi-bin/ "cgi-bin/"

        <Location "/cgi-bin">
           AllowOverride None
           Options None
           Order allow,deny
           Allow from all
        </Location>

You can now start Apache from the command line using the "apachectl"
script:

        % /usr/sbin/apachectl -d ~/apache -k start

If Apache starts successfully, then this command will return silently.
Otherwise, it will print an error message. More error messages may be
found in ~/apache/logs/error_log. To confirm that Apache is running from
your home directory, create a file named index.html and copy it into
~/apache/htdocs. You should then be able to open a browser, connect to
<a href="http://localhost:8000/" class="external free"
rel="nofollow">http://localhost:8000/</a>, and see the index.html file
that you just created.

Now you can build and install gbrowse with the following incantation:

        % cd Generic-Genome-Browser-X.XX
        % perl Makefile.PL APACHE=~/apache LIB=~/lib BIN=~/bin NONROOT=1
        % make
        % make install

When you are prompted to load gbrowse using
<a href="http://localhost/gbrowse" class="external free"
rel="nofollow">http://localhost/gbrowse</a>, use
<a href="http://localhost:8000/gbrowse" class="external free"
rel="nofollow">http://localhost:8000/gbrowse</a> instead.

# <span id="Try_the_Browser_Out" class="mw-headline">Try the Browser Out</span>

The installation procedure will create a small in-memory database of
yeast chromosome 1 and 2 for you to play with. To try the browser out,
use your favorite browser to open:

         http://localhost/cgi-bin/gbrowse

Try searching for "chrI" (the name of the first chromosome of yeast), or
a gene such as NUT21 or TEL01L. Then try searching for "membrane
trafficking."

For your interest, the feature and DNA files for this database is
located in the web server's document root at
HTDOCS/GBROWSE_ROOT/databases/yeast_chr1+2. The configuration file is in
the web server's configuration directory under
CONF/gbrowse.conf/yeast.conf.

More configuration information and a short tutorial are located at:

          http://localhost/gbrowse

# <span id="Populating_the_Database_.28MySQL.29" class="mw-headline">Populating the Database (MySQL)</span>

This step takes you through populating the database with the full yeast
genome. You can skip this step if you use the in-memory database for
small projects.

## <span id="Synopsis" class="mw-headline">Synopsis</span>

         mysql -uroot -ppassword -e 'create database yeast'

         mysql -uroot -ppassword -e 'grant all privileges on yeast.* to me@localhost'
         mysql -uroot -ppassword -e 'grant file on *.* to me@localhost'
         mysql -uroot -ppassword -e 'grant select on yeast.* to nobody@localhost'

         bp_bulk_load_gff.pl -d yeast sample_data/yeast_data.gff

## <span id="Details_2" class="mw-headline">Details</span>

*Note: This section refers to the user account under which Apache runs
as "nobody" because that is the most common case. However, many systems
use a different user account. Mac OSX uses "www", Fedora Core uses
"apache" and Ubuntu uses "www-data." In the instructions that follow,
replace 'nobody' with the appropriate Apache account name.*

You will need an installation of [MySQL](MySQL "MySQL") for this
section. Using the mysql command line, create a database (called "yeast"
in the synopsis above), and ensure that you have update and file
privileges on it. The example above assumes that you have a username of
"me" and that you will allow updates from the local machine only. It
also gives all privileges to "me". You may be comfortable with a more
restricted set of privileges, but be sure to provide at least SELECT,
UPDATE and INSERT privileges. You will need to provide the
administrator's name and correct password for these commands to succeed.

In addition, grant the "nobody" user the SELECT privilege. The web
server usually runs as nobody, and must be able to make queries on the
database. Modify this as needed if the web server runs under a different
account.

The next step is to load the database with data. This is accomplished by
loading the database from a tab-delimited file containing the genomic
annotations in [GFF](GFF "GFF") format. The [BioPerl](BioPerl "BioPerl")
distribution comes with three tools for loading Bio::DB::GFF databases:

bp_load_gff.pl  
This will incrementally load a database, optionally initializing it if
it does not already exist. This script will work correctly even if the
[MySQL](MySQL "MySQL") server is located on another host.

<!-- -->

bp_bulk_load_gff.pl  
This Perl script will initialize a new Bio::DB::GFF database with a
fresh schema, deleting anything that was there before. It will then load
the file. Only suitable for use the very first time you create a
database, or when you want to start from scratch! The bulk loader is as
much as 10x faster than bp_load_gff.pl, but does not work in the
situation in which the MySQL database is running on a remote host.

<!-- -->

bp_fast_load_gff.pl  
This will incrementally load a database. On UNIX systems, it will
activate a fast loader that makes the speed almost the same as the bulk
loader. Be careful, though, because this software relies on features
that are unevenly implemented across platforms. For example, it does not
work correctly on Mac OSX.

You will find these scripts in the BioPerl distribution, in the
subdirectory `scripts/Bio-DB-GFF`. If you requested that BioPerl scripts
be installed during installation, they will also be found in your
command path.

For testing purposes, this distribution includes a [GFF](GFF "GFF") file
with yeast genome annotations. The file can be found in the `test_data`
subdirectory. If the load is successful, you should see a message
indicating that 13298 features were successfully loaded.

Provided that the yeast load was successful, you may now run
`make test`. This invokes a small test script that tests that the
database is accessible by the "nobody" user and that the basic feature
retrieval functions are working.

You may also wish to load the yeast DNA, so that you can test the
three-frame translation and GC content features of the browser. Because
of its size, the file containing the complete yeast genome is
distributed separately and can be downloaded from:

<a
href="http://prdownloads.sourceforge.net/gmod/yeast.fasta.gz?download"
class="external free"
rel="nofollow">http://prdownloads.sourceforge.net/gmod/yeast.fasta.gz?download</a>

Load the file with this command:

      bp_load_gff.pl -d yeast -fasta yeast.fasta.gz

You should now be able to browse the yeast genome. Type the following
URL into your favorite browser:

<a href="http://name.of.your.host/cgi-bin/gbrowse/yeast"
class="external free"
rel="nofollow">http://name.of.your.host/cgi-bin/gbrowse/yeast</a>

This will display the genome browser instructions and a search field.
Type in "III" to start searching chromosome III, or search for "glucose"
to find a bunch of genes that are involved in glucose metabolism.

*IF YOU GET AN ERROR* examine the Apache server error log (depending on
how Apache was installed, it may be located in
`/usr/local/apache/logs/`, `/var/log/httpd/`, `/var/log/apache`, or
elsewhere). Usually there will be an informative error message in the
error log. The most common problem is [MySQL](MySQL "MySQL") password or
permissions problems.

### <span id="GFF3_Loading" class="mw-headline">GFF3 Loading</span>

An increasing number of model organism databases are distributing genome
annotation in [GFF3](GFF3 "GFF3") format. An example of this format can
be found at <a
href="ftp://genome-ftp.stanford.edu/pub/yeast/chromosomal_feature/saccharomyces_verevisiae.gff"
class="external text" rel="nofollow">SGD</a>. Although these files will
load into the standard Bio::DB::GFF database, some of the features of
[GFF3](GFF3 "GFF3"), such as the ability to represent multiple
alternative splice forms as a single gene, will be lost. We suggest
instead that you use a Bio::DB::SeqFeature::Store database.

Here is a quick recipe.

Get a GFF3 file (available from SGD, WormBase, FlyBase and many other
sites) and save it as `genome.gff3`.

         mysql -uroot -p password -e 'create database genomegff3'
         mysql -uroot -p password -e 'grant all privileges on genomegff3.* to me@localhost'
         mysql -uroot -p password -e 'grant select on genomegff3.* to nobody@localhost'
         bp_seqfeature_load.pl -d genomegff3 -f -c genome.gff3

Create a <a href="GBrowse_Configuration_HOWTO" class="mw-redirect"
title="GBrowse Configuration HOWTO">GBrowse config</a> file by copying
one of the existing examples, and modify the top lines to read like the
following:

    db_adaptor    = Bio::DB::SeqFeature::Store
    db_args       = -adaptor DBI::mysql
                    -dsn     dbi:mysql:database=genomegff3
                    -user    nobody

The database should now be browsable. For more details, see
[GFF3](GFF3 "GFF3").

# <span id="Loading_Other_Data_Sets" class="mw-headline">Loading Other Data Sets</span>

Go to the individual model organism database's web sites to find the
[GFF3](GFF3 "GFF3") (or [GFF2](GFF2 "GFF2")) format files you need. A
few notable sites are:

WormBase (C. elegans and related nematodes)  
<a
href="ftp://ftp.wormbase.org/pub/wormbase/species/c_elegans/gff/c_elegans.current.annotations.gff2.gz"
class="external free"
rel="nofollow">ftp://ftp.wormbase.org/pub/wormbase/species/c_elegans/gff/c_elegans.current.annotations.gff2.gz</a>

SGD (S. cerevisiae)  
<a href="ftp://genome-ftp.stanford.edu/pub/yeast/chromosomal_feature/"
class="external free"
rel="nofollow">ftp://genome-ftp.stanford.edu/pub/yeast/chromosomal_feature/</a>

FlyBase (D. melanogaster)  
<a
href="ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/gff/"
class="external free"
rel="nofollow">ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/gff/</a>

*Other MODs - please feel free to add your download URLs here*

In addition, the `bin/` subdirectory of the GBrowse distribution
contains a series of scripts to convert annotation files in various
formats into GFF3 (or [GFF2](GFF2 "GFF2")) format. For example, the
`ucsc_genes2gff.pl` script will convert gene models in Table Browser
format files from
<a href="http://www.genome.ucsc.edu" class="external free"
rel="nofollow">http://www.genome.ucsc.edu</a> into [GFF3](GFF3 "GFF3")
format. `load_genbank.pl` will download and load sequence annotation
files in GenBank format from NCBI. The sample configuration file
`08.genbank.conf` (located in `contrib/conf_files`) is appropriate for
data loaded with `load_genbank.pl`.

# <span id="Loading_DNA" class="mw-headline">Loading DNA</span>

To display the DNA sequence and to run sequence-dependent glyphs such as
the three-frame translation, you will need to load the DNA as well as
the annotations. The DNA must be formatted as a series of one or more
FASTA-format files in which each entry in the file corresponds to a
top-level sequence such as a chromosome pseudomolecule. You can then run
the bp_load_gff.pl or bp_bulk_load_gff.pl script using the -fasta
argument. For example, if the yeast genome is contained in a FASTA file
named yeast.fa, you would run the command:

         bp_bulk_load_gff.pl -d yeast -fasta yeast.fa sample/yeast_data.gff

Alternatively, you may put several FASTA files into a directory, and
provide the directory name as the argument to -fasta. (The yeast DNA is
too large to be included in this distribution, but you can get a copy of
it from
<a href="ftp://genome-ftp.stanford.edu/pub/yeast/" class="external free"
rel="nofollow">ftp://genome-ftp.stanford.edu/pub/yeast/</a>)

Run `bp_bulk_load_gff.pl -h` to see usage instructions.

[GFF3](GFF3 "GFF3") allow you to include FASTA sequence at the bottom of
the file, following the sequence annotations. If you are loading one of
these GFF files, the DNA will be recognized automatically and loaded by
any of the loaders.

# <span id="Creating_your_own_Genome_Database" class="mw-headline">Creating your own Genome Database</span>

See the <a href="GBrowse_Configuration_HOWTO" class="mw-redirect"
title="GBrowse Configuration HOWTO">GBrowse Configuration HOWTO</a> for
information on how to create new databases from scratch, add new browser
tracks, and how to get the browser to dump the DNA from the region
currently under display.

# <span id="Making_the_Browser_Run_Faster" class="mw-headline">Making the Browser Run Faster</span>

Three factors are major contributors to the length of time it takes to
load a gbrowse page:

1.  Loading the Perl interpreter and parsing BioPerl and all the other
    Perl libraries that gbrowse uses.
2.  Query speed on the database
3.  The conversion at the Perl layer of database data into BioPerl
    objects for rendering.

To improve (1), I recommend that you install the mod_perl module for
Apache.(<a href="http://perl.apache.org" class="external free"
rel="nofollow">http://perl.apache.org</a>). By configuring an
Apache::Registry directory and placing gbrowse inside it (rather than in
the default cgi-bin directory). The overhead for loading Perl and its
libraries are eliminated, thereby increasing the performance of the
script noticeably.

*Be aware that there is a bad interaction between the Apache::DBI module
(often used to speed up database accesses) and Bio::DB::GFF. This will
cause the GFF dumper plugin to fail intermittently. GBrowse does not
need Apache::DBI to achieve performance increases under mod_perl and it
is suggested that you disable Apache::DBI. If you cannot do this, then
you should remove the file GFFDumper.pm from the gbrowse.conf/plugins
directory.*

Database query performance (2) is also a major factor. If you are using
MySQL as the backend, you will see dramatic performance increases by
increasing the amount of memory available to the key buffer, sort
buffer, table cache and other in-memory data structures. I suggest that
you replace the default MySQL configuration file (usually stored in
/etc/my.cnf) with one of the large-memory sample configuration files
provided in the support-files subdirectory of the MySQL distribution. Of
course, if you tell MySQL to use more memory than you have, then
performance will degrade again.

Finally, there is a slowdown when gbrowse converts the results of
database SQL queries into renderable biological objects. This becomes
particularly noticeable when there are lots of multi-segment objects to
be displayed. You can work around this slowdown by using semantic
zooming (see CONFIGURE_HOWTO). Otherwise, there's not much that can be
done about this short of buying a faster machine. The GMOD team is
working hard to reduce this performance hit.

# <span id="Making_the_Server_Run_Safer" class="mw-headline">Making the Server Run Safer</span>

Whenever you are running a server-side Web script using information
provided by a web client, there is a risk that maliciously-formatted
data provided by the use will trick the server-side script into
performing some unintentional action, such as modifying a file on the
server. Perl's "taint" checks are designed to catch places in the code
where such malicious data could cause harm, and GBrowse has been tested
extensively with these taint checks activated.

Because of taint checks' noticeable impact on performance, they have
been turned off in the distributed version of gbrowse. If you wish to
reactivate the extra checking (at the expense of a performance hit), go
to the file "gbrowse" located in the Web scripts directory and edit the
top line of the file to read:

         #!/usr/bin/perl -w -T

The -T switch turns on taint checks.

If you are running GBrowse under mod_perl, add the following line to the
httpd.conf configuration file:

         PerlTaintCheck  On

This will affect all mod_perl scripts globally.

# <span id="The_gbrowse_img_Script" class="mw-headline">The gbrowse_img Script</span>

The gbrowse_img CGI script is a stripped-down version of gbrowse which
just generates images. It is suitable for incorporating into \<img\>
tags in order to make a thumbnail of a region of interest. The thumbnail
can then be linked to the full-featured gbrowse. Here is an example of
how this works using the WormBase site:

      http://www.wormbase.org/db/seq/gbrowse_img/wormbase?name=mec-3;width=200

This will generate a 200-pixel inline image of the region.

You can also use gbrowse_img to superimpose temporary features (like
BLAST hits) on the existing genome features.

If the script is called without CGI arguments, it will generate usage
instructions. Select
<a href="http://your.host/cgi-bin/gbrowse_img" class="external free"
rel="nofollow">http://your.host/cgi-bin/gbrowse_img</a> to see this
internal documentation.

# <span id="Plugins" class="mw-headline">Plugins</span>

Gbrowse has a plugin architecture which makes it easy for third-party
developers to expand its functionality. The plugins are Perl .pm files
located in the directory gbrowse.conf/plugins/. To install plugins,
simply copy them into this directory. To uninstall, remove them.

If you wish to install your own or third party plugins, it is suggested
that you create a separate directory outside the gbrowse.conf/ hierarchy
in which to store them and then to indicate the location of these
plugins using the plugin_path setting:

         plugin_path = /usr/local/gbrowse_plugins

This setting should be somewhere in the \[GENERAL\] section of the
relevant gbrowse configuration file.

# <span id="The_Genbank.2FEMBL_Proxy" class="mw-headline">The Genbank/EMBL Proxy</span>

Sample configuration number 5 ("05.embl.conf") corresponds to a
pass-through proxy for Genbank. At least in theory, if you enter a
landmark that isn't recognized, gbrowse will go to EMBL using the
bioperl BioFetch facility, parse the record, and enter it into the local
database. This allows you to browse arbitrary Genbank/EMBL/Refseq
entries.

This functionality is not well supported, nor widely used, but here is a
recipe for giving it a try:

1.  Create a local database named "embl" and initialize it this way:
2.  Set up permissions for this database so that "nobody@localhost" has
    SELECT, INSERT, UPDATE and DELETE privileges
3.  Initialize the database for use with this command:

<!-- -->

     % bp_load_gff.pl -c -d embl

4.  If you need to use a proxy to access remote web sites, uncomment the
    -proxy line in the conf file, and adjust the URL of the proxy as
    appropriate.
5.  Go to
    <a href="http://localhost/cgi-bin/gbrowse/embl" class="external free"
    rel="nofollow">http://localhost/cgi-bin/gbrowse/embl</a>. Search for
    a Genbank or embl accession number, such as CEF58D5

# <span id="Removing_Out-of-Date_Image_Files" class="mw-headline">Removing Out-of-Date Image Files</span>

As GBrowse runs, it creates temporary image files in the gbrowse tmp
directory (typically *HTDOCS*/gbrowse/tmp). These image files are
relatively small, but if you run GBrowse for a long time they may begin
consuming significant amounts of disk space. The following Unix shell
commands will remove old image files:

         cd HTDOCS/gbrowse/tmp
         find . -type f -atime +20 -print -exec rm {} \;

*Be sure to replace HTDOCS with the path to your web server HTML
document root directory.*

You might want to run this command under cron, but be sure that the user
that the cron job runs under has the proper permissions. You may need to
install it in root's cron script.

# <span id="Bug_Reports_and_Support_Requests" class="mw-headline">Bug Reports and Support Requests</span>

Please report bugs to the
<a href="http://sourceforge.net/tracker/?group_id=27707&amp;atid=391291"
class="external text" rel="nofollow">GMOD project bug tracking
system</a>. Email support is available by sending requests for help to
<a href="mailto:gmod-gbrowse@lists.sourceforge.net"
class="external text"
rel="nofollow">gmod-gbrowse@lists.sourceforge.net</a>.

Have fun!

Lincoln Stein & the GMOD team

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=GBrowse_Install_HOWTO&oldid=21000>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](Special:Categories "Special:Categories"):

- [GBrowse](Category:GBrowse "Category:GBrowse")
- [HOWTO](Category:HOWTO "Category:HOWTO")
- [Linux](Category:Linux "Category:Linux")

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

- <span id="ca-nstab-main"><a href="GBrowse_Install_HOWTO" accesskey="c"
  title="View the content page [c]">Page</a></span>
- <span id="ca-talk"><a href="Talk:GBrowse_Install_HOWTO" accesskey="t"
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

- <span id="t-whatlinkshere"><a href="Special:WhatLinksHere/GBrowse_Install_HOWTO" accesskey="j"
  title="A list of all wiki pages that link here [j]">What links here</a></span>
- <span id="t-recentchangeslinked"><a href="Special:RecentChangesLinked/GBrowse_Install_HOWTO"
  accesskey="k"
  title="Recent changes in pages linked from this page [k]">Related
  changes</a></span>
- <span id="t-specialpages"><a href="Special:SpecialPages" accesskey="q"
  title="A list of all special pages [q]">Special pages</a></span>
- <span id="t-print"><a
  href="http://gmod.org/mediawiki/index.php?title=GBrowse_Install_HOWTO&amp;printable=yes"
  rel="alternate" accesskey="p"
  title="Printable version of this page [p]">Printable version</a></span>
- <span id="t-permalink">[Permanent
  link](http://gmod.org/mediawiki/index.php?title=GBrowse_Install_HOWTO&oldid=21000 "Permanent link to this revision of the page")</span>
- <span id="t-info">[Page
  information](http://gmod.org/mediawiki/index.php?title=GBrowse_Install_HOWTO&action=info)</span>
- <span id="t-smwbrowselink"><a href="Special:Browse/GBrowse_Install_HOWTO" rel="smw-browse">Browse
  properties</a></span>
- <span id="t-pdf">[Print as
  PDF](http://gmod.org/mediawiki/index.php?title=Special:PdfPrint&page=GBrowse_Install_HOWTO)</span>

</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 22:39 on 8 August
  2012.</span>
- <span id="footer-info-viewcount">327,091 page views.</span>
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->

- <span id="footer-copyrightico">[<img src="http://www.gnu.org/graphics/gfdl-logo-small.png" width="88"
  height="31" alt="a GNU Free Documentation License" />](http://www.gnu.org/licenses/fdl-1.3.html)</span>
- <span id="footer-poweredbyico">[<img
  src="../mediawiki/skins/common/images/poweredby_mediawiki_88x31.png"
  width="88" height="31" alt="Powered by MediaWiki" />](http://www.mediawiki.org/)
  [<img
  src="../mediawiki/extensions/SemanticMediaWiki/resources/images/smw_button.png"
  width="88" height="31" alt="Powered by Semantic MediaWiki" />](https://www.semantic-mediawiki.org/wiki/Semantic_MediaWiki)</span>

<div style="clear:both">

</div>

</div>

---
title: "GBrowse MacOSX HOWTO"
---
<span id="top"></span>

# <span dir="auto">GBrowse MacOSX HOWTO</span>

**NOTE:** These instructions are quite old and describe how to install
GBrowse 1.X. Since Mac OS X is very "unix-y", once libgd installed,
[GBrowse2](GBrowse.1 "GBrowse") can be installed just like it would on
any other unix like system. A libgd installer for Leopard and Snow
Leopard can be obtained from <a
href="https://sourceforge.net/projects/gmod/files/Generic%20Genome%20Browser/libgd-MacOSX/20100406/"
class="external text" rel="nofollow">sourceforge</a>

GBrowse runs well on both PowerPC and Intel Macs running OS X. These
instructions describe how to install GBrowse on these platforms.

Note: One of the 2009 security updates from Apple caused problems for
Perl, which affect cpan and installation of Perl packages. See: [Fixing
Perl on OSX](Fixing_Perl_on_OSX "Fixing Perl on OSX")

## Contents

- [<span class="tocnumber">1</span> <span class="toctext">Installing
  libGD with the double click
  installer</span>](#Installing_libGD_with_the_double_click_installer)
- [<span class="tocnumber">2</span>
  <span class="toctext">Prerequisites</span>](#Prerequisites)
  - [<span class="tocnumber">2.1</span> <span class="toctext">The Fink
    Way</span>](#The_Fink_Way)
  - [<span class="tocnumber">2.2</span> <span class="toctext">The
    MacPorts Way</span>](#The_MacPorts_Way)
  - [<span class="tocnumber">2.3</span> <span class="toctext">The Manual
    Way</span>](#The_Manual_Way)
- [<span class="tocnumber">3</span> <span class="toctext">Installing
  GBrowse using the net
  installer</span>](#Installing_GBrowse_using_the_net_installer)
- [<span class="tocnumber">4</span> <span class="toctext">Activate
  Apache</span>](#Activate_Apache)
- [<span class="tocnumber">5</span> <span class="toctext">Test the
  browser</span>](#Test_the_browser)
- [<span class="tocnumber">6</span> <span class="toctext">Install Perl
  MySQL driver</span>](#Install_Perl_MySQL_driver)
- [<span class="tocnumber">7</span>
  <span class="toctext">AUTHORS</span>](#AUTHORS)

# <span id="Installing_libGD_with_the_double_click_installer" class="mw-headline">Installing libGD with the double click installer</span>

You can download an installer for libGD for either Leopard or Snow
Leopard from the GMOD SourceForge site (it's possible that the Snow
Leopard installer will work for newer Mac OS systems--I haven't had a
chance to check).

# <span id="Prerequisites" class="mw-headline">Prerequisites</span>

You **MUST** have the Mac OS developer tools installed in order to
install GBrowse on a Mac, since _make_ is required. See step 1 of [The
Manual Way](#The_Manual_Way) section below for more information.

GBrowse has a number of prerequisites, including BioPerl, GD (which
requires libgd), and the [MySQL](MySQL "MySQL") database. You can
install these prerequisites using the Fink precompiled binary package
manager, or from source code.

If you are using MySQL databases, GBrowse also requires the Perl modules
to talk to MySQL, DBI and DBD::mysql, which are often not present in the
Perl installations on new Macs. These can be installed using CPAN. As of
8-1-2007, there are some problems with the CPAN installers for
[DBD::mysql on the Mac](DBD%253A%253Amysql_on_the_Mac "DBD::mysql on the Mac").

## <span id="The_Fink_Way" class="mw-headline">The Fink Way</span>

Make sure you have installed the most recent version of Fink, available
from <a href="http://www.finkproject.org/download/index.php?phpLang=en"
class="external text" rel="nofollow">finkproject.org</a>. Configure fink
and run `fink selfupdate`

Open up a command window, and install the following Fink packages:

     % fink install gd2 gd2-bin gd2-shlibs

If you use fink to install any perl modules (for instance,
`fink install dbi-pm586` will install DBI.pm), you should modify your
Apache configuration file, httpd.conf (Note, in Mac OSX the file is
located at /etc/apache2/httpd.conf). In that file, find and uncomment
(that is, remove the '#' symbols) these two lines:

     #LoadModule env_module         libexec/httpd/mod_env.so
      ...
     #AddModule mod_env.c

and add this line near the bottom of the file:

     #added to allow for fink installed perl libs to be found
     SetEnv PERL5LIB /sw/lib/perl5:/sw/lib/perl5/darwin

Now restart the webserver either via the system preferences panel for
network services, or via this command:

       sudo /System/Library/StartupItems/Apache/Apache restart

You do not need to install BioPerl, GD, or any other Perl packages using
fink. You can install GD, BioPerl, BioGraphics and GBrowse with the cpan
shell:

     %  cpan
     cpan>force install GD

Currently this fails GD test 10, but that functionality isn't needed for
GBrowse, so it is safe to force.

     cpan>install BioPerl
     cpan>install Bio::Graphics::Browser2

Which will complete the installation of GBrowse2. For installing GBrowse
1, go directly to [Installing GBrowse using the net
installer](#Installing_GBrowse_using_the_net_installer).

## <span id="The_MacPorts_Way" class="mw-headline">The MacPorts Way</span>

Installing GBrowse using MacPorts is very similar to using Fink, with
one caveat after installing libgd.

Make sure you have installed the most recent version of MacPorts,
available from
<a href="http://www.macports.org/install.php" class="external text"
rel="nofollow">MacPorts install page</a>. Configure port and run
`port selfupdate`.

Open up a command window, and install the following MacPorts packages:

     % port install gd2

This will install MANY programs (more than fink), including Perl and
several Xorg packages. Since MacPorts modifies your \$PATH variable to
search the MacPorts directories first for any application, using perl
and cpan as below without modifying \$PATH will result in the
MacPorts-installed perl to install perl modules for use with that perl.
The unfortunate result of this is that the system installed Apache web
server doesn't know anything about this perl, so GBrowse won't work. The
easiest solution to this problem is to fix the \$PATH variable before
continuing. To do this, edit the .profile file in your home directory,
and find the line that looks like this:

     export PATH=/opt/local/bin:/opt/local/sbin:$PATH

and replace it with

     export PATH=$PATH:/opt/local/bin:/opt/local/sbin

and save the file. Then to make your current terminal aware of the
changes, you need to "source" the profile:

     . ~/.profile

or close your current terminal window and open a new one.

You do not need to install BioPerl, GD, or any other Perl packages using
MacPorts. You can install GD, BioPerl, BioGraphics and GBrowse with the
cpan shell:

     %  cpan
     cpan>force install GD

Currently this fails GD test 10, but that functionality isn't needed for
GBrowse, so it is safe to force.

     cpan>install BioPerl
     cpan>install Bio::Graphics::Browser2

Which will complete the installation of GBrowse2. For installing GBrowse
1, go directly to [Installing GBrowse using the net
installer](#Installing_GBrowse_using_the_net_installer).

## <span id="The_Manual_Way" class="mw-headline">The Manual Way</span>

**1. Make sure you have installed Mac OS X Developer tools** that come
on the distribution CD. Include X11 and the X11 SDK in the tools you
install. To confirm that you have the tools, open a command window and
type:

          % which gcc
          % which autoconf
          % which xmkmf
          % which pkg-config

If any of these commands returns with the error message "command not
found," then you should (re)install the developer tools.

**2. Install MySQL** (optional; only if you want to run a mysql backend)

Go to <a
href="http://www.mysql.org/downloads/mysql/5.0.html#macosx-dmg#macosx-dmg"
class="external free"
rel="nofollow">http://www.mysql.org/downloads/mysql/5.0.html#macosx-dmg</a>,
download and run the appropriate OSX installer for your version of the
operating system. Note that there are separate installers for OS X
versions 10.3 and upward on PowerPC 32-bit, 64-bit and Intel platforms.
You may need to take care here. Joan Pontius reports that you must use
the 32-bit MySQL server and DBD::mysql version 2.9007 in order for the
Perl that is preinstalled on MacOS X systems to work nicely with MySQL.
You can get the correct DBD::mysql version at
<a href="http://search.cpan.org/~capttofu/DBD-mysql-2.9007/"
class="external text" rel="nofollow">CPAN</a>.

**3. Install libgd**

This is where many people get stuck because MacOSX is ships with an
older version of libgd that does not work properly with GBrowse. To add
to the confusion, OSX 10.3 and earlier has older developer tools that
can't build the new libgd correctly.

Worry not; just follow the recipe.

**1.** _Make sure your `PATH` environment variable includes
`/usr/local/bin`_ by running the command:

          % echo $PATH

If you do not see \</tt\>/usr/local/bin\</tt\> listed, either create or
edit a file called `.bash_login` in your home folder (note the leading
".", which hides this file from directory listings), and add the
following line to the bottom:

          export PATH="/usr/local/bin:$PATH"

**2.** _Make sure that you have at least version 2.58 of the autoconf
tool installed._ Run the command:

          % autoconf -V

This will print out the version number. It must be 2.58 or higher. If
the version is too low, then upgrade autoconf like this:

Download version 2.58 or higher from
<a href="http://ftp.gnu.org/gnu/autoconf/" class="external free"
rel="nofollow">http://ftp.gnu.org/gnu/autoconf/</a>. It's best to use
2.58 because it is known to work.

Unpack autoconf, enter the distribution directory and type:

              % ./configure --prefix=/usr
              % make
              % sudo make install

**3.** _Install libpng_

Get the latest libpng from
<a href="http://www.libpng.org/pub/png/libpng.html"
class="external text" rel="nofollow">libpng.org</a>. Look for the
version "with config script."

Unpack libpng, enter the distribution directory and type:

              % ./configure
              % make
              % sudo make install

**4.** _Install libgd_

Get the latest libgd from
<a href="http://www.libgd.org" class="external free"
rel="nofollow">http://www.libgd.org</a>.

Unpack libgd, enter the distribution directory and type:

              % ./configure
              % make
              % sudo make install

If "make" fails with errors about not being able to compile gdft.c, then
reconfigure with the following commands:

              % ./configure --without-fontconfig --without-freetype
              % make
              % sudo make install

_Do not try to fix this problem by reinstalling freetype unless you are
very brave; you will likely to make things worse. Freetype support is
not needed for GBrowse._

# <span id="Installing_GBrowse_using_the_net_installer" class="mw-headline">Installing GBrowse using the net installer</span>

Whether you installed the non-Perl prerequisites with Fink or manually,
you will now use the GBrowse net installer to install
[BioPerl](BioPerl "BioPerl"), GD and other perl-based prerequisites. You
will need a working Internet connection for this step.

Download the <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/bin/gbrowse_netinstall.pl"
class="external text"
rel="nofollow"><code>gbrowse_netinstall.pl</code></a> script from the
GBrowse distribution. Run the following command as the root user or
using "sudo":

      % perl gbrowse_netinstall.pl

See the main install page for a description of command line options for
the [netinstall script](GBrowse.1#Installation "GBrowse").

This will install the correct versions of GD, BioPerl, and all
dependencies. During the process you will be asked to respond to various
questions. It is generally safe to choose the defaults with one major
exception: if you installed libgd with fink (ie, gd2), you need to
answer the question about the location of libgd with '/sw/lib' instead
of the default.

If this installer fails, it may be because the perl module LWP::Simple
is not present. To install it, execute the command:

      % sudo cpan
      cpan> install LWP::Simple

and then rerun the GBrowse net install script.

# <span id="Activate_Apache" class="mw-headline">Activate Apache</span>

You may need to turn on the local web server if it isn't activated
already:

        Apple Menu -> System Preferences ->  Sharing.
        Activate "Personal Web Sharing".

You may also wish to adjust your firewall settings to control access to
your machine's web server from the Internet.

# <span id="Test_the_browser" class="mw-headline">Test the browser</span>

Open <a href="http://localhost/gbrowse" class="external free"
rel="nofollow">http://localhost/gbrowse</a> and click the link for the
example yeast chromosome 1 database.

# <span id="Install_Perl_MySQL_driver" class="mw-headline">Install Perl MySQL driver</span>

_Optional; only if you want to run the Mysql backend_

If you have Mysql running and wish to take advantage of the GBrowse
Mysql interface, then you will need to install the Perl DBD::mysql
driver.

From the command line, type:

     % perl -MCPAN -e 'install DBD::mysql'

If you get a lot of errors about not having read/write privileges on the
test database, download the
<a href="http://search.cpan.org/perldoc?DBD::mysql"
class="external text" rel="nofollow">DBD::mysql</a> package from CPAN,
unpack it, and follow the directions for building it manually.

There is one other issue to take care of. The bp_bulk_load_gff.pl file,
which is used to load gff files into a mysql database is located in
/usr/local/bin/. The script uses /usr/tmp as the temporary directory;
but this doesn't exist on the Mac. Edit line 347 of bp_bulk_load_gff.pl
to look like this:

     my $tmpdir = $ENV{TMPDIR} || $ENV{TMP} || '/tmp';

# <span id="AUTHORS" class="mw-headline">AUTHORS</span>

[Lincoln D. Stein](User%253ALstein "User%253ALstein") \<steinl@cshl.edu\> 20:24,
16 April 2007 (EDT) Adapted from instructions contributed by Yair Benita
\<y.benita@wanadoo.nl\>.

[Categories](Special%253ACategories "Special%253ACategories"):

- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")
- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")
- [Mac OS X](Category%253AMac_OS_X "Category%253AMac OS X")

## Navigation menu

### Namespaces

- <span id="ca-talk"><a href="Talk%253AGBrowse_MacOSX_HOWTO" accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse_MacOSX_HOWTO" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 22:55 on 15 August 2013.</span>
<!-- - <span id="footer-info-viewcount">188,519 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

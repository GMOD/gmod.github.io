<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">GBrowse 2.0 Install HOWTO</span>

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

This article describes **how to install GBrowse 2.0** on either Linux or
Mac OSX systems. Before you begin, please make sure that your system has
all the [GBrowse 2.0
Prerequisites](GBrowse_2.0_Prerequisites "GBrowse 2.0 Prerequisites")
installed. The easiest and most straightforward way to get a basic
installation up and running is through the
<a href="http://www.cpan.org/" class="external text" rel="nofollow">CPAN
system</a>, where GBrowse is available
<a href="http://search.cpan.org/dist/GBrowse/" class="external text"
rel="nofollow">as a module</a> that can be installed - see [Installing
via the CPAN Shell](#Installing_via_the_CPAN_Shell) below for more
details. This will install the newest stable version of GBrowse.

Advanced users can also install the latest, bleeding-edge, unstable
version of GBrowse manually. You will have to build it from the source
code available at our <a
href="http://sourceforge.net/projects/gmod/files/Generic%20Genome%20Browser/"
class="external text" rel="nofollow">SVN code repository</a> - see
[Installing Manually](#Installing_Manually) for a full description of
how that process works.

- *For the main GBrowse 2.0 HOWTO article, see: [GBrowse 2.0
  HOWTO](GBrowse_2.0_HOWTO "GBrowse 2.0 HOWTO").*
- *See also: [GBrowse Install
  HOWTO](GBrowse_Install_HOWTO "GBrowse Install HOWTO").*

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span> <span class="toctext">Installing via
  the CPAN Shell</span>](#Installing_via_the_CPAN_Shell)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Ubuntu
    11.04 Issue</span>](#Ubuntu_11.04_Issue)
- [<span class="tocnumber">2</span> <span class="toctext">Installing
  Manually</span>](#Installing_Manually)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Running
    the Build.PL Script</span>](#Running_the_Build.PL_Script)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Running
    the Build Script</span>](#Running_the_Build_Script)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Selecting
    Installation
    Directories</span>](#Selecting_Installation_Directories)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Configure
    in Mac OS X 10.6.6</span>](#Configure_in_Mac_OS_X_10.6.6)
  - [<span class="tocnumber">2.5</span> <span class="toctext">Running
    the GBrowse Demo
    (optional)</span>](#Running_the_GBrowse_Demo_.28optional.29)
  - [<span class="tocnumber">2.6</span>
    <span class="toctext">Registering GBrowse
    (optional)</span>](#Registering_GBrowse_.28optional.29)
  - [<span class="tocnumber">2.7</span> <span class="toctext">Final
    Installation</span>](#Final_Installation)
- [<span class="tocnumber">3</span> <span class="toctext">Debugging and
  Customizing the
  Installation</span>](#Debugging_and_Customizing_the_Installation)
- [<span class="tocnumber">4</span> <span class="toctext">Advanced
  Installation Topics</span>](#Advanced_Installation_Topics)

</div>

## <span id="Installing_via_the_CPAN_Shell" class="mw-headline">Installing via the CPAN Shell</span>

For a smooth experience, please install all [GBrowse 2.0
Prerequisites](GBrowse_2.0_Prerequisites "GBrowse 2.0 Prerequisites")
before proceeding.

You can install the latest released version of GBrowse by running the
CPAN shell. Run this command:

    sudo perl -MCPAN -e 'install Bio::Graphics::Browser2'

This will run all the steps described in the "Installing Manually"
section below, including configuring GBrowse's installation directories
and installing GBrowse and its demo databases. Among other things,
GBrowse will ask you a series of questions about where to install it.
See [\#Selecting Installation
Directories](#Selecting_Installation_Directories) for a detailed
description of each question. The suggested defaults are almost always
correct.

If any perl modules are missing from the prerequisites, the CPAN shell
will install them for you.

<div style="background-color:pink">

### <span id="Ubuntu_11.04_Issue" class="mw-headline">Ubuntu 11.04 Issue</span>

The binary version of the GD Perl module that is packaged for Ubuntu
11.04 (Natty Narwhal) contains a bug that causes BioPerl to fail several
of its tests, blocking GBrowse installation. To fix:

    sudo apt-get remove libgd-gd2-perl
    sudo apt-get install libgd2-noxpm-dev
    sudo perl -MCPAN -e 'install GD'

Then proceed to install Bio::Graphics::Browser2 as described above.

</div>

## <span id="Installing_Manually" class="mw-headline">Installing Manually</span>

Alternatively, you can download and install the bleeding edge version
via <a
href="http://gmod.org/mediawiki/index.php?title=GIT&amp;action=edit&amp;redlink=1"
class="new" title="GIT (page does not exist)">GIT</a>. For a smooth
experience, please install all [GBrowse 2.0
Prerequisites](GBrowse_2.0_Prerequisites "GBrowse 2.0 Prerequisites")
before proceeding.

The command to issue is:

    git clone https://github.com/GMOD/GBrowse

This will create a directory named *Generic-Genome-Browser*:

### <span id="Running_the_Build.PL_Script" class="mw-headline">Running the Build.PL Script</span>

Next, enter the newly-created directory and run the `Build.PL` script:

     % cd Generic-Genome-Browser
     % perl Build.PL
     Checking whether your kit is complete...
     Looks good

     Checking prerequisites...
     Looks good

     cc -I/usr/lib/perl/5.8/CORE -fPIC -c -D_REENTRANT -D_GNU_SOURCE \
       -DTHREADS_HAVE_PIDS -DDEBIAN -fno-strict-aliasing -pipe \
       -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 \
        -O2 -o /tmp/compilet.o /tmp/compilet.c
     cc -shared -L/usr/local/lib -o /tmp/compilet.so /tmp/compilet.o

     Creating new 'Build' script for 'GBrowse' version '2.00'
     Now run:
      ./Build test
      ./Build config
      ./Build demo          (optional)
      ./Build install       (as superuser/administrator)
            -or-
      ./Build install_slave (optional, for slave installations)

Among other things, this script will report all the missing Perl
libraries that you need to run GBrowse. Please be sure to [install all
prerequisites](GBrowse_2.0_Prerequisites "GBrowse 2.0 Prerequisites")
before going any further. To install any missing Perl prerequisites
automatically, you may run:

    ./Build installdeps

After running, Build.PL will create a script named `Build` in the
current directory.

### <span id="Running_the_Build_Script" class="mw-headline">Running the Build Script</span>

You will now use Build to test, configure and install GBrowse. First you
will confirm that GBrowse's libraries are completely functional by
running **./Build test** (the "./" is there to ensure that you are
running the Build script in the current directory, and not some other
Build script somewhere in your path:

     % ./Build test
     t/01yeast...................ok
     t/02.rearchitecture.........ok
     t/03.render.................ok
     ...
     All tests successful.
     Files=8, Tests=323, 12 wallclock secs
     Result: PASS

All tests should pass (you may safely ignore warnings and occasional
timeout errors). If not, please file a <a
href="http://sourceforge.net/tracker/?func=add&amp;group_id=27707&amp;atid=391291"
class="external text" rel="nofollow">bug report</a>, and/or send an
inquiry to the
<a href="https://lists.sourceforge.net/lists/listinfo/gmod-gbrowse"
class="external text" rel="nofollow">GBrowse mailing list</a>.

### <span id="Selecting_Installation_Directories" class="mw-headline">Selecting Installation Directories</span>

After passings its tests, you should configure GBrowse by running
**./Build config**:

     % ./Build config

     **Beginning interactive configuration**
     Apache loadable module directory (for demo)? [/usr/lib/apache2/modules]
     Apache CGI scripts directory? [/usr/lib/cgi-bin]
     Directory for GBrowse's config and support files? [/etc/GBrowse2]
     Directory for GBrowse's static images & HTML files? [/var/www/gbrowse2]
     Internet port to run demo web site on (for demo)? [8000]
     User account under which Apache daemon runs? [www-data]

     **Interactive configuration done. Run './Build reconfig' to reconfigure**

The configuration process will ask you to confirm six site-specific
configuration options, and will do its best to guess for you. In most
cases you can just hit return to accept the default. If you specify a
directory that does not exist, the system will ask you to confirm that
this is what you mean. If you press yes, the directory (and all its
needed parents) will be created at install time.

The configuration options are:

apachemodules  
The directory in which Apache's loadable modules are located. This is
only needed to run a demo GBrowse site before formal installation. If
you do not know the location of this directory and you do not want to
run the demo, you can safely ignore this option.

cgibin  
The directory in which Apache's executable CGI scripts are located, for
example */usr/lib/cgi-bin*. This directory is set up for you when Apache
is installed, and you must have the path correct in order for Build to
install GBrowse's CGI scripts in the right place. GBrowse will be
installed into the "gb2" subdirectory, so its path will be
"/usr/lib/cgi-bin/gb2/gbrowse".

conf  
The location of GBrowse's configuration files. The default is to place
them in */etc/gbrowse2*. This is where you will go to customize GBrowse
and add new data sources.

databases  
The default location for GBrowse's in memory databases, and the place
where the example databases will be stored. The default is to place this
into a subdirectory of the same directory in which GBrowse places its
static files, such as */var/www/gbrowse2/databases*.

htdocs  
The directory in which to install GBrowse's Javascript libraries, static
HTML pages and stylesheets. You can choose any location for this
directory and it will be added to Apache's document tree. The default is
to place the directory under the default document tree, such as
*/var/www/gbrowse2*.

portdemo  
The internet port on which the demo will run. The demo launches a new
instance of Apache running under your user privileges. Because port 80
will usually already be taken by the system Apache, Build will choose an
unused port like 8000 or 8080. You may manually select the port if you
wish.

tmp  
The directory in which GBrowse will store its working data, including
users' session information (such as preferred tracks), uploaded data
files, and temporary image files. The default is to place these files
into */var/tmp/gbrowse2*.

wwwuser  
The account under which the system Apache runs, often "nobody",
"www-data" or "httpd." If you do not know, you can find out by running
*ps aux \| grep -i apache* on a system that has Apache already running.
The first column of the output contains the name of the user account.

Once you have configured GBrowse, the values you chose will stick until
you run *./Build reconfig*. You can also bypass interactive
configuration by directly passing Build.PL one or more of the
configuration options on the command line:

    perl Build.PL --apachemodules=/usr/local/share/apache/libexec \
                  --cgibin=/var/lib/cgi \
                  --conf=/etc/gbrowse \
                  --htdocs=/usr/local/docs/gbrowse \
                  --databases=/usr/local/gbrowse/databases \
                  --tmp=/tmp/gbrowse \
                  --portdemo=9000 \
                  --wwwuser=fred

The options passed on the command line will become the defaults for
*./Build config* will be used during installation, and will also become
the defaults if you later run *./Build config* or *./Build reconfig*.

  
Here is an example of a 'non-standard' install, that allows you to
install and run GB as a non-root user (assuming you have Perl's
local-lib working properly):

    perl Build.PL \
      --cgibin=$HOME/httpd/cgi-bin/gbrowse2 \
      --conf=$HOME/httpd/conf/gbrowse2 \
      --htdocs=$HOME/httpd/htdocs/potato/gbrowse2 \
      --tmp=$HOME/httpd/tmp \
      --url_base=/potato/gbrowse2

    ./Build test
    ./Build install

  
Note that we still need to tweak \$HOME/httpd/conf/gbrowse2/GBrowse.conf
to set the 'url_base' from '/gbrowse2' to '/potato/gbrowse2' in this
case.

### <span id="Configure_in_Mac_OS_X_10.6.6" class="mw-headline">Configure in Mac OS X 10.6.6</span>

If you install apache2 using Mac Ports
(<a href="http://www.macports.org/" class="external free"
rel="nofollow">http://www.macports.org/</a>).

    sh-3.2# ./Build config

    **Beginning interactive configuration**
    Directory for GBrowse's config and support files? [/etc/gbrowse2] /opt/local/apache2/conf/gbrowse2
    Directory for GBrowse's static images & HTML files? [/Library/Webserver/Documents/gbrowse2] /opt/local/apache2/htdocs/gbrowse2
    Directory for GBrowse's temporary data [/var/tmp/gbrowse2]
    Directory for GBrowse's example databases [/Library/Webserver/Documents/gbrowse2/databases] /opt/local/apache2/htdocs/gbrowse2/databases
    Directory for GBrowse's CGI script executables? [/Library/Webserver/CGI-Executables/gb2] /opt/local/apache2/cgi-bin/gb2
    Internet port to run demo web site on (for demo)? [80]
    Apache loadable module directory (for demo)? [/usr/lib/apache/modules] /opt/local/apache2/modules
    User account under which Apache daemon runs? [www]

And after install

    sh-3.2# chmod -R 777 /var/tmp/gbrowse2

Copy configure information to the end of
'/opt/local/apache2/conf/httpd.conf'

    <Directory "/opt/local/apache2/htdocs/gbrowse2">
      AllowOverride Options
      Options -Indexes -MultiViews +FollowSymLinks
      Order allow,deny
      Allow from all
    </Directory>

    <Directory "/var/tmp/gbrowse2/images/">
      Order allow,deny
      Allow from all
    </Directory>

    <Directory "/opt/local/apache2/cgi-bin/gb2">

      SetEnv GBROWSE_CONF   "/opt/local/apache2/conf/gbrowse2"
    </Directory>

    <IfModule mod_fcgid.c>
      Alias /fgb2 "/opt/local/apache2/cgi-bin/gb2"
      <Location /fgb2>
        SetHandler   fcgid-script
        Options      ExecCGI
      </Location>
      DefaultInitEnv GBROWSE_CONF /opt/local/apache2/conf/gbrowse2
      # these directives prevent idle/busy timeouts and may need to be
      # adjusted up or down
      FcgidMinProcessesPerClass 6
      FcgidIOTimeout   600
      FcgidBusyTimeout 600

    </IfModule>

    <IfModule mod_fastcgi.c>
      Alias /fgb2 "/opt/local/apache2/cgi-bin/gb2"
      <Location /fgb2>
        SetHandler   fastcgi-script
        Options      ExecCGI
      </Location>
      # Note: you may need to increase -idle-timeout if file uploads are timing out and returning server
      # errors.
      FastCgiConfig -idle-timeout 600 -maxClassProcesses 20  -initial-env GBROWSE_CONF=/opt/local/apache2/conf/gbrowse2
    </IfModule>

    <IfModule mod_perl.c>
       Alias /mgb2 "/opt/local/apache2/cgi-bin/gb2"

       <Location /mgb2>
         SetHandler perl-script
         PerlResponseHandler ModPerl::Registry
         PerlOptions +ParseHeaders
       </Location>
    </IfModule>

  

### <span id="Running_the_GBrowse_Demo_.28optional.29" class="mw-headline">Running the GBrowse Demo (optional)</span>

Before you install GBrowse, you may wish to run its demo. This will
attempt to launch a correctly configured instance of Apache running
under your own account. To launch the demo, run **./Build demo**:

    % ./Build demo
    Demo is now running on http://localhost:8000
    Run "./Build demostop" to stop it.

You can now point your web browser at
*<a href="http://localhost:8000" class="external free"
rel="nofollow">http://localhost:8000</a>* (or whatever the build message
specifies), and interact with the GBrowse web site, browse sample
genomes and otherwise test the waters. When you are done, run *./Build
demostop* to stop Apache and clean up.

### <span id="Registering_GBrowse_.28optional.29" class="mw-headline">Registering GBrowse (optional)</span>

You may register GBrowse by running **./Build register**. This is an
optional step, but allows the GBrowse development group to track who is
using GBrowse. This information is useful when writing grant
renewals :-). The information is only used internally by the GMOD
project and is not shared with any other parties.

### <span id="Final_Installation" class="mw-headline">Final Installation</span>

To install GBrowse and its support files permanently, run **./Build
install** as the superuser. This will copy GBrowse's library and support
files into the locations chosen during configuration. It will then
configure Apache to run GBrowse by writing the appropriate configuration
directives into Apache's configuration file. Finally, it will attempt to
restart Apache. If all goes well, you will see a note telling you to
load *<a href="http://localhost/gbrowse2" class="external free"
rel="nofollow">http://localhost/gbrowse2</a>*. This will take you to an
autogenerated page that describes the install configurations you chose,
points to an example database to run, and gives pointers to
documentation, tutorials and other useful information.

## <span id="Debugging_and_Customizing_the_Installation" class="mw-headline">Debugging and Customizing the Installation</span>

If you are having trouble with the installation, see [Common Problems
with GBrowse2
Installation](Common_Problems_with_GBrowse2_Installation "Common Problems with GBrowse2 Installation").
If you wish install GBrowse in your home directory because you do not
have superuser privileges or for any other reasons, see [Installing
GBrowse2 in your Home
Directory](Installing_GBrowse2_in_your_Home_Directory "Installing GBrowse2 in your Home Directory").
(These pages aren't written yet)!

# <span id="Advanced_Installation_Topics" class="mw-headline">Advanced Installation Topics</span>

For advanced topics, such as accelerating GBrowse performance by running
it under a persistent environment, configuring the user login and custom
track upload system, and restricting access to certain databases and
tracks via user authentication, see:

- [GBrowse 2.0 Install
  HOWTO/Advanced](GBrowse_2.0_Install_HOWTO/Advanced "GBrowse 2.0 Install HOWTO/Advanced")

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=GBrowse_2.0_Install_HOWTO&oldid=19752>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](Special%3ACategories "Special%3ACategories"):

- [GBrowse](Category%3AGBrowse "Category%3AGBrowse")
- [HOWTO](Category%3AHOWTO "Category%3AHOWTO")
- [GBrowse 2](Category%3AGBrowse_2 "Category%3AGBrowse 2")
- <a
  href="http://gmod.org/mediawiki/index.php?title=Category%3AInstall&amp;action=edit&amp;redlink=1"
  class="new" title="Category%3AInstall (page does not exist)">Install</a>

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


- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:GBrowse_2.0_Install_HOWTO&amp;action=edit&amp;redlink=1"
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

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%3AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%3AHOWTO)</span>
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


- <span id="t-smwbrowselink"><a href="Special%3ABrowse/GBrowse_2.0_Install_HOWTO"
  rel="smw-browse">Browse properties</a></span>


</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 20:00 on 22 February
  2012.</span>
<!-- - <span id="footer-info-viewcount">168,464 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->






</div>

<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">Template:GMOD VM</span>

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

    {{GMOD VM
    |name=GMOD in the Cloud
    |logo=GitcLogo.png
    |intro= // introductory blurb about the VM
    |download= // info on where to download the VM
    |os= // operating system of VM
    |chado v= // versions of these tools
    |gbrowse v=
    |jbrowse v=
    |tripal v=
    |webapollo v=
    |postgres v=
    |drupal v=
    |demo= // url of public demo
    |poster=
    |getting started=
    |urltmpl=
    |extra info=
    |phone home details=
    }}

  
{{{name}}} is a [GMOD virtual
server](Category:GMOD_virtual_server "Category:GMOD virtual server")
equipped with a suite of preconfigured GMOD components, including a
**Chado** database, **GBrowse2**, **JBrowse**, **Tripal**, and **Apollo
or WebApollo**. Setting up a {{{name}}} instance is quick and easy; it
even comes with demo data to explore if you do not have your own. If you
are investigating GMOD for the first time, {{{name}}} provides an
excellent way to assess GMOD components without having to do any
installation; for longer-term uses, the virtual server can be kept
running as long as required, and data can easily be moved when new
versions of {{{name}}} are released.

  

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span> <span class="toctext">What's in
  {{{name}}}</span>](#What.27s_in_.7B.7B.7Bname.7D.7D.7D)
- [<span class="tocnumber">2</span> <span class="toctext">Where to find
  {{{name}}}</span>](#Where_to_find_.7B.7B.7Bname.7D.7D.7D)
- [<span class="tocnumber">3</span> <span class="toctext">Getting
  Started</span>](#Getting_Started)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Directory
    Structure</span>](#Directory_Structure)
  - [<span class="tocnumber">3.2</span> <span class="toctext">Updating
    from previous versions</span>](#Updating_from_previous_versions)
  - [<span class="tocnumber">3.3</span> <span class="toctext">Phoning
    home</span>](#Phoning_home)
- [<span class="tocnumber">4</span> <span class="toctext">Installed GMOD
  software</span>](#Installed_GMOD_software)
  - [<span class="tocnumber">4.1</span>
    <span class="toctext">PostgreSQL</span>](#PostgreSQL)
  - [<span class="tocnumber">4.2</span>
    <span class="toctext">Drupal</span>](#Drupal)
  - [<span class="tocnumber">4.3</span>
    <span class="toctext">Tripal</span>](#Tripal)
  - [<span class="tocnumber">4.4</span>
    <span class="toctext">Chado</span>](#Chado)
  - [<span class="tocnumber">4.5</span>
    <span class="toctext">GBrowse2</span>](#GBrowse2)
  - [<span class="tocnumber">4.6</span>
    <span class="toctext">JBrowse</span>](#JBrowse)
  - [<span class="tocnumber">4.7</span>
    <span class="toctext">WebApollo</span>](#WebApollo)

</div>

## <span id="What.27s_in_.7B.7B.7Bname.7D.7D.7D" class="mw-headline">What's in {{{name}}}</span>

[<img
src="../mediawiki/images/thumb/d/d5/ChadoLogo.png/200px-ChadoLogo.png"
srcset="../mediawiki/images/thumb/d/d5/ChadoLogo.png/300px-ChadoLogo.png 1.5x, ../mediawiki/images/thumb/d/d5/ChadoLogo.png/400px-ChadoLogo.png 2x"
width="200" height="44" alt="Chado logo" />](Chado "Chado")

[<img
src="../mediawiki/images/thumb/0/04/GBrowseLogo.png/200px-GBrowseLogo.png"
srcset="../mediawiki/images/thumb/0/04/GBrowseLogo.png/300px-GBrowseLogo.png 1.5x, ../mediawiki/images/thumb/0/04/GBrowseLogo.png/400px-GBrowseLogo.png 2x"
width="200" height="47" alt="GBrowse logo" />](GBrowse.1 "GBrowse")

[<img
src="../mediawiki/images/thumb/4/44/GBrowse_syn_logo.png/200px-GBrowse_syn_logo.png"
srcset="../mediawiki/images/thumb/4/44/GBrowse_syn_logo.png/300px-GBrowse_syn_logo.png 1.5x, ../mediawiki/images/thumb/4/44/GBrowse_syn_logo.png/400px-GBrowse_syn_logo.png 2x"
width="200" height="64" alt="GBrowse_syn logo" />](GBrowse_syn.1 "GBrowse syn")

[<img
src="../mediawiki/images/thumb/a/ac/JBrowseLogo.png/200px-JBrowseLogo.png"
srcset="../mediawiki/images/thumb/a/ac/JBrowseLogo.png/300px-JBrowseLogo.png 1.5x, ../mediawiki/images/thumb/a/ac/JBrowseLogo.png/400px-JBrowseLogo.png 2x"
width="200" height="44" alt="JBrowse logo" />](JBrowse.1 "JBrowse")

[<img
src="../mediawiki/images/thumb/5/5c/TripalLogo.jpg/200px-TripalLogo.jpg"
srcset="../mediawiki/images/thumb/5/5c/TripalLogo.jpg/300px-TripalLogo.jpg 1.5x, ../mediawiki/images/5/5c/TripalLogo.jpg 2x"
width="200" height="60" alt="Tripal logo" />](Tripal.1 "Tripal")

[<img
src="../mediawiki/images/thumb/4/4a/WebApolloLogo.png/200px-WebApolloLogo.png"
srcset="../mediawiki/images/thumb/4/4a/WebApolloLogo.png/300px-WebApolloLogo.png 1.5x, ../mediawiki/images/thumb/4/4a/WebApolloLogo.png/400px-WebApolloLogo.png 2x"
width="200" height="55" alt="WebApollo logo" />](WebApollo.1 "WebApollo")

  

## <span id="Where_to_find_.7B.7B.7Bname.7D.7D.7D" class="mw-headline">Where to find {{{name}}}</span>

{{{download}}}

*Important note:* {{{name}}} includes a small script that sends an email
to the GMOD developers to let them know that someone is using a
{{{name}}} instance. GMOD uses this to track the popularity of virtual
GMOD installations for grants and funding purposes. For more
information, see <a
href="http://gmod.org/mediawiki/index.php?title=GMOD_VM&amp;action=edit&amp;redlink=1"
class="new" title="GMOD VM (page does not exist)">the phoning home
section</a> below.

  

## <span id="Getting_Started" class="mw-headline">Getting Started</span>

{{{name}}} is running on {{{os}}}. The virtual machine is split into two
partitions, `root` and `data`. All user information should be kept in
the `data` partition to make backup and updates easy.

  

  

### <span id="Directory_Structure" class="mw-headline">Directory Structure</span>

When you first log in to the virtual machine, you will be in the
*ubuntu* user's home directory, `/home/ubuntu`, on the `root` partition
of the machine. We recommend that any information that you want to save
be kept in the `data` partition. There is a link to the `data` partition
called `dataHome`, so you can easily change directories by running
`cd /home/ubuntu/dataHome` or `cd ~/dataHome`. The `dataHome` directory
contains a `bashrc`
(<a href="http://en.wikipedia.org/wiki/Bash_(Unix_shell)‎"
class="external text" rel="nofollow">bash shell</a> configuration file)
that is automatically executed when you log in, and any shell
environment changes you want to make should be added to this file.

There are several other important directories that have been moved to
the `data` partition. In all cases, the original files have been
replaced by symlinks, so changes made to the files noted below are
picked up as if the files were in their original locations. If you need
other files moved to the `data` partition, please
<a href="mailto:gmod-devel@lists.sourceforge.net" class="external text"
rel="nofollow">email the GMOD developers list</a> so that we can
incorporate the changes into future iterations of {{{name}}}.

|  |  |
|----|----|
| /data/etc/gbrowse | The config directory for GBrowse. |
| /data/etc/postgresql | The config directory for PostgreSQL |
| /data/opt | A good place to install any other software you want to use |
| /data/var/lib/gbrowse2 | Other GBrowse files that might be modifed on your instance, including user session data and flat file databases. |
| /data/var/lib/postgresql | Files for the PostgreSQL database |
| /data/var/www/.htaccess | The htaccess file for the main Drupal site |
| /data/var/www/jbrowse/jbrowse_conf.json | Config file for JBrowse |
| /data/var/www/jbrowse/data | All of the data files needed for running JBrowse |
| /data/var/www/sites/default | Site-specific files and directories for Drupal; modules and themes go here (though Tripal is in /var/www/sites/all) |
| /data/webapollo | WebApollo data |
| /data/var/lib/tomcat7/webapps/WebApollo/config | Config options for WebApollo |
| /data/usr/share/tomcat7/bin | setenv.sh for tomcat; used to increase allocated memory for tomcat |

Note that changes made to files in any other locations will be lost.

### <span id="Updating_from_previous_versions" class="mw-headline">Updating from previous versions</span>

Instances of {{{name}}} can be updated by replacing the `data` partition
in the new instance with the `data` partition from the old instance. For
more information, see the <a
href="http://gmod.org/mediawiki/index.php?title=GMOD_VM/Updating&amp;action=edit&amp;redlink=1"
class="new" title="GMOD VM/Updating (page does not exist)">updating
guide</a>.

### <span id="Phoning_home" class="mw-headline">Phoning home</span>

When a {{{name}}} server starts up for the first time, it sends an email
to the GMOD developers with information about the instance. These data
are kept private and are strictly for statistical purposes, primarily
for funding and grant applications.

{{{phone home details}}}

## <span id="Installed_GMOD_software" class="mw-headline">Installed GMOD software</span>

### <span id="PostgreSQL" class="mw-headline">PostgreSQL</span>

Database name: `drupal`

Username: `drupal`

See the
<a href="Postgres" class="mw-redirect" title="Postgres">Postgres</a>
database connection parameters in `/var/www/sites/default/settings.php`
for more information.

There is also a Postgres user named **ubuntu** with superuser
privileges. The Postgres `search_path` for this user is set to look in
the Chado schema before the public schema; this account should be used
for tools that interact with Chado (e.g. GBrowse, Tripal, and any
command line tools from GMOD).

  

### <span id="Drupal" class="mw-headline">Drupal</span>

Version:

Source:
<a href="http://drupal.org" class="external text" rel="nofollow">Drupal
website</a>

Installation dir: `/var/www`

Web URL: {{{urltmpl}}}/

When navigating with a web browser to the Apache document root (i.e.,
<a href="http://127.0.0.1/" class="external free"
rel="nofollow">http://127.0.0.1/</a> or the IP address of your server),
you will get the Drupal home page.

New modules can be added at `/data/var/www/sites/default/modules` and
new themes can be added at `/data/var/www/sites/default/themes`.

  

### <span id="Tripal" class="mw-headline">Tripal</span>

Version:

Source: [Tripal](Tripal.1 "Tripal") svn

Installation dir: `/var/www/sites/all/modules/tripal`

  

### <span id="Chado" class="mw-headline">Chado</span>

Version:

Tripal was used to install the Chado database schema and load ontologies
and a GFF file containing yeast genome annotations from SGD (source: <a
href="http://downloads.yeastgenome.org/curation/chromosomal_feature/saccharomyces_cerevisiae.gff"
class="external free"
rel="nofollow">http://downloads.yeastgenome.org/curation/chromosomal_feature/saccharomyces_cerevisiae.gff</a>),
as well as a sample GFF contig file output from [MAKER](MAKER.1 "MAKER")
for the *Pythium ultimum* (source:
<a href="http://icebox.lbl.gov/webapollo/data/pyu_data.tgz"
class="external free"
rel="nofollow">http://icebox.lbl.gov/webapollo/data/pyu_data.tgz</a>).

The Chado software package is in the home directory, ~/sources/chado,
and was used to install many utility scripts via the standard
installation method for Perl modules
(`perl Makefile.PL; make; sudo make install`). This checkout can be
updated with "svn update" like the Tripal svn checkout.

  

### <span id="GBrowse2" class="mw-headline">GBrowse2</span>

Version:

The configuration file for the Chado database is /data/etc/gbrowse2;
config files for the demo data: yeast: `07.chado.conf`; *P. ultimum*:
`pythium.conf`.

GBrowse is configured to use
<a href="https://httpd.apache.org/mod_fcgid/" class="external text"
rel="nofollow">fcgid</a>, a web server add-on that helps speed up
GBrowse. To use it, your GBrowse URLs should look like this:

       {{{urltmpl}}}/fgb2/gbrowse/yeast

If there are problems with fcgid, you can still use the non-accelerated
GBrowse at

       {{{urltmpl}}}/cgi-bin/gb2/gbrowse/yeast

  

### <span id="JBrowse" class="mw-headline">JBrowse</span>

Version:

Source: <a href="http://jbrowse.org" class="external text"
rel="nofollow">JBrowse website</a>

Installation dir: `/var/www/jbrowse`

Web URL: {{{urltmpl}}}/jbrowse

Configuration file (defines database connection parameters, tracks):
`~/jbrowse.conf`.

The Pythium dataset was created in a way similar to the
<a href="JBrowse_Tutorial_2012" class="mw-redirect"
title="JBrowse Tutorial 2012">JBrowse tutorial</a> and using the
configuration file `~/pythium-1.conf`.

JBrowse was configured to have multiple datasets using the
jbrowse_conf.json file as described in the [JBrowse configuration
guide](JBrowse_Configuration_Guide#Dataset_Selector "JBrowse Configuration Guide").
This file is at `/data/var/www/jbrowse/jbrowse_conf.json`.

  

### <span id="WebApollo" class="mw-headline">WebApollo</span>

Version:

WebApollo was installed per the directions on the
[WebApollo](WebApollo.1 "WebApollo") page. In addition to the admin
user, a second user with limited permissions was created with username:
"guest", password: "guest".

Check out the [WebApollo setup
instructions](GMOD_in_a_Box/WebApollo "GMOD in a Box/WebApollo")
specific to the VM for help in setting up your data.

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=Template:GMOD_VM&oldid=25171>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Category](Special:Categories "Special:Categories"):

- [GMOD virtual
  server](Category:GMOD_virtual_server "Category:GMOD virtual server")

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

- <span id="ca-nstab-template"><a href="Template:GMOD_VM" accesskey="c"
  title="View the template [c]">Template</a></span>
- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Template_talk:GMOD_VM&amp;action=edit&amp;redlink=1"
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




</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 22:02 on 21 January
  2014.</span>
<!-- - <span id="footer-info-viewcount">17,764 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->






</div>

---
title: "VMware 2011 Spring Training"
---
# VMware 2011 Spring Training


In this session, we'll get the VMware image up and running on your
laptop.


  Course Images</span>](#Download_Course_Images)
- [System
  Requirements](#System_Requirements)
  - [VMware on
    Windows and Linux](#VMware_on_Windows_and_Linux)
  - [VMware on
    Mac OS X](#VMware_on_Mac_OS_X)
- [System
  Configuration](#System_Configuration)
  - [Additional
    Installed Software](#Additional_Installed_Software)
- [Getting the
  VMware Image](#Getting_the_VMware_Image)
- [Unpacking the
  Image](#Unpacking_the_Image)
- [Opening the
  Image](#Opening_the_Image)
- [Did you move
  or copy the image?](#Did_you_move_or_copy_the_image.3F)
- [Logging In and
  other useful things](#Logging_In_and_other_useful_things)
- [Resizing the
  Display](#Resizing_the_Display)
- [Linux Text
  Editors](#Linux_Text_Editors)


## Download Course Images

We took snapshots of the VMware image immediately before the 2010
course, and at the end of each day. These images have now been copied to
the GMOD FTP site and are available for download.

).

## System Configuration

Details on on how the system is configured.

<table class="wikitable sortable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th></th>
<th>Value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<th>Image Name</th>
<td>GMODCourse2010</td>
</tr>
<tr class="even">
<th>OS</th>
<td>Ubuntu 9.10<br />
server<br />
32 bit<br />
Patches current as of Feb 2011</td>
</tr>
<tr class="odd">
<th>RAM (virtual)</th>
<td>2GB</td>
</tr>
<tr class="even">
<th>Disk (virtual)</th>
<td>40GB, allocated as needed, 2 GB at a time</td>
</tr>
<tr class="odd">
<th>Networking</th>
<td>NAT</td>
</tr>
<tr class="even">
<th>Root username</th>
<td>gmod</td>
</tr>
<tr class="odd">
<th>Root password</th>
<td>gmodamericas2011</td>
</tr>
</tbody>
</table>

### Additional Installed Software

Ubuntu server comes with a lot preinstalled. Nevertheless, we wanted
more. This lists *most* additional software that we installed, and how
and why.

<table class="wikitable sortable">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Software</th>
<th>Mechanism</th>
<th>Why</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>xinit</td>
<td><code>sudo apt-get install xinit</code></td>
<td>GUI foundation (X11)</td>
</tr>
<tr class="even">
<td>Gnome</td>
<td><code>sudo apt-get install ubuntu-desktop</code></td>
<td>GUI Desktop</td>
</tr>
<tr class="odd">
<td>Subversion</td>
<td><code>sudo apt-get install subversion</code></td>
<td>Source code control</td>
</tr>
<tr class="even">
<td>libgd2 dev</td>
<td><code>sudo apt-get install libgd2-xpm-dev</code></td>
<td>Graphics. Chose not to use libgd2-noxopm-dev (what we used last
year) because it would have uninstalled ubuntu-desktop and not replaced
it with anything.</td>
</tr>
<tr class="odd">
<td>autoconf</td>
<td><code>sudo apt-get install autoconf</code></td>
<td>Package building</td>
</tr>
<tr class="even">
<td>Apache</td>
<td><code>sudo apt-get install apache2</code></td>
<td>Web server</td>
</tr>
<tr class="odd">
<td>Java 6</td>
<td><code>sudo apt-get install sun-java6-jdk</code></td>
<td>Java run time and tools; need for <a href="Apollo.1"
title="Apollo">Apollo</a>.</td>
</tr>
<tr class="even">
<td>CVS</td>
<td><code>sudo apt-get install cvs</code></td>
<td>Source code control.</td>
</tr>
<tr class="odd">
<td>CGI:;Session perl module</td>
<td><code>sudo apt-get install libcgi-session-perl</code></td>
<td>Persistent session data in CGI apps</td>
</tr>
<tr class="even">
<td>DBD::Pg perl module</td>
<td><code>sudo apt-get install libdbd-pg-perl</code></td>
<td>Perl DBI driver for PostgreSQL.</td>
</tr>
<tr class="odd">
<td>Digest::MD5::File perl module</td>
<td><code>sudo apt-get install libdigest-md5-file-perl</code></td>
<td>MD5 checksums</td>
</tr>
<tr class="even">
<td>Class::Base perl module</td>
<td><code>sudo apt-get install libclass-base-perl</code></td>
<td>Perl module class plumbing.</td>
</tr>
<tr class="odd">
<td>Module::Build</td>
<td><code>sudo apt-get install libmodule-build-perl</code></td>
<td>Subclassable and make-independent perl module builder
alternative</td>
</tr>
<tr class="even">
<td>Inkscape</td>
<td><code>sudo apt-get install inkscape</code></td>
<td>High-res image generation in <a href="GBrowse.1"
title="GBrowse">GBrowse</a>.</td>
</tr>
<tr class="odd">
<td>DBD::MySQL</td>
<td><code>sudo apt-get install libdbd-mysql-perl</code></td>
<td>Access to MySQL DBs in Perl.</td>
</tr>
<tr class="even">
<td>MySQL Server</td>
<td><code>sudo apt-get install mysql-server</code></td>
<td>MySQL database; used as a backend to <a href="GBrowse.1"
title="GBrowse">GBrowse</a>. Root password is same as for the
system.</td>
</tr>
<tr class="odd">
<td>IO::String perl module</td>
<td><code>sudo apt-get install libio-string-perl</code></td>
<td>Emulate IO::File interface for in-core strings</td>
</tr>
<tr class="even">
<td>Statistics::Descriptive perl module</td>
<td><code>sudo apt-get install libstatistics-descriptive-perl</code></td>
<td>Perl module for basic descriptive statistical functions.</td>
</tr>
<tr class="odd">
<td>GD2 in perl</td>
<td><code>sudo apt-get install libgd-gd2-perl</code></td>
<td>Perl module wrapper for libgd - gd2 variant</td>
</tr>
<tr class="even">
<td>Ant</td>
<td><code>sudo apt-get install ant</code></td>
<td>Make, but aimed specifically at Java compilation</td>
</tr>
<tr class="odd">
<td>Emacs</td>
<td><code>sudo apt-get install emacs</code></td>
<td>The emacs text editor.</td>
</tr>
<tr class="even">
<td>C++ Compiler</td>
<td><code>sudo apt-get install g++</code></td>
<td>C++ compiler from GNU. Required for <a href="MAKER.1"
title="MAKER">MAKER</a></td>
</tr>
<tr class="odd">
<td>Perldoc Reader</td>
<td><code>sudo apt-get install perl-doc</code></td>
<td>Allows you to read perldoc documentation.</td>
</tr>
<tr class="even">
<td>libgd-tools</td>
<td><code>sudo apt-get install libgd-tools</code></td>
<td>GD command line tools</td>
</tr>
<tr class="odd">
<td>PostgreSQL</td>
<td><code>sudo apt-get install postgresql</code></td>
<td>Postgres database management system. Used by <a href="Chado"
class="mw-redirect" title="Chado">Chado</a></td>
</tr>
<tr class="even">
<td>GD::SVG Perl module</td>
<td><code>sudo apt-get install libgd-svg-perl</code></td>
<td>"Seamlessly enable SVG output from scripts written using GD." - such
as <a href="GBrowse.1" title="GBrowse">GBrowse</a>.</td>
</tr>
<tr class="odd">
<td>Bio::Graphics::Browser2</td>
<td><code>sudo cpan; </code>
<p>cpan&gt; install Bio::Graphics::Browser2</p></td>
<td>This installs GBrowse2 as well as all prereqs, like GD, BioPerl and
Bio::Graphics</td>
</tr>
<tr class="even">
<td>Bio::DB::Das::Chado</td>
<td><code>sudo cpan; </code>
<p>cpan&gt; install Bio::DB::Das::Chado</p></td>
<td>Needed for GBrowse to access a Chado database</td>
</tr>
<tr class="odd">
<td>Template::Toolkit</td>
<td><code>sudo apt-get install libtemplate-perl</code></td>
<td>Needed for Chado installer</td>
</tr>
<tr class="even">
<td>XML::Simple</td>
<td><code>sudo apt-get install libxml-simple-perl</code></td>
<td>Needed for Chado installer</td>
</tr>
<tr class="odd">
<td>Log::Log4perl</td>
<td><code>sudo apt-get install liblog-log4perl-perl</code></td>
<td>Optionally logs Chado related events</td>
</tr>
<tr class="even">
<td>Parse::RecDescent</td>
<td><code>sudo apt-get install libparse-recdescent-perl</code></td>
<td>Needed for loading ontologies into Chado</td>
</tr>
<tr class="odd">
<td>Bio%253A%253AChado%253A%253ASchema</td>
<td><code>sudo cpan; </code>
<p>cpan&gt; install Bio%253A%253AChado%253A%253ASchema</p></td>
<td>Needed for DBIx::Class access to Chado; used for publication
loader</td>
</tr>
<tr class="even">
<td>GO::Parser</td>
<td><code>sudo cpan; </code>
<p>cpan&gt; install GO::Parser</p></td>
<td>Needed for ontology loading into Chado</td>
</tr>
<tr class="odd">
<td>DBIx::DBSchema</td>
<td><code>sudo cpan; </code>
<p>cpan&gt; install DBIx::DBSchema</p></td>
<td>Needed for ontology loading into Chado</td>
</tr>
<tr class="even">
<td>Module::Load</td>
<td><code>sudo cpan; </code>
<p>cpan&gt; install Module::Load</p></td>
<td>Needed for GFF loading into Chado</td>
</tr>
<tr class="odd">
<td>DBIx::DBStag</td>
<td><em>Installed by hand; cpan usually doesn't work for this</em></td>
<td>Needed for ontology loading into Chado</td>
</tr>
<tr class="even">
<td>XML::Parser::PerlSAX</td>
<td><code>sudo cpan; </code>
<p>cpan&gt; install XML::Parser::PerlSAX</p></td>
<td>Needed for ontology loading into Chado</td>
</tr>
<tr class="odd">
<td>ttf-mscorefonts-installer</td>
<td><code>sudo apt-get install ttf-mscorefonts-installer</code></td>
<td>Fonts used by Galaxy</td>
</tr>
<tr class="even">
<td>python-dev</td>
<td><code>sudo apt-get install python-dev </code></td>
<td>Used in <a href="Galaxy.1" title="Galaxy">Galaxy</a> session.</td>
</tr>
<tr class="odd">
<td>python-setuptools</td>
<td><code>sudo apt-get install python-setuptools</code></td>
<td>Used in <a href="Galaxy.1" title="Galaxy">Galaxy</a> session.</td>
</tr>
<tr class="even">
<td>python-pip</td>
<td><code>sudo apt-get install python-pip</code></td>
<td>Used in <a href="Galaxy.1" title="Galaxy">Galaxy</a> session.</td>
</tr>
<tr class="odd">
<td>bx-python scripts</td>
<td><code>sudo pip install bx-python</code></td>
<td>Scripts used by Galaxy</td>
</tr>
</tbody>
</table>

## Getting the VMware Image

**To avoid swamping the GMOD FTP server (the file is almost 4GB), we
will initially distribute the image on several flash drives and DVDs.**

The image has already been installed on the loaner laptops.

## Unpacking the Image

Once you have the image on your system you will need to uncompress it.
This will result in a new file (actually a directory) called

`GMODCourse2011.vmwarevm`.

## Opening the Image

Once you have unpacked the image, open it by double clicking on it. This
should automatically launch VMware.

  

## Did you move or copy the image?


You Moved It!


Yes you did.


VMware then asks you if you moved or copied this image. Tell it you
**moved it**. Doing anything else is bad.

  

## Logging In and other useful things

After starting up the VMware image (which will take several seconds),
the system will automatically log you in as user "gmod". (This behavior
can be changed at **System → Administration → Login Screen**.) You will
need the password, "gmodamericas2011", to run `sudo`.

At this point, you have a few options for how to use it. Either way you
will need to open a terminal window. To do this, click on the black
rectangle in the top bar. This will open a terminal window and start a
shell.

If you would like to ssh in to the server (which I suggest as a good
idea: copy and pasting commands will be easier and you will be able to
use an environment you are used to), then you will need the server's ip
address. To get it, open a terminal and type:

     $ ifconfig

which will give you output like this:


<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/16/Ifconfig.png" width="666" height="461"
alt="Ifconfig.png" />


See that `inet addr:172.16.108.130`? Those four numbers are the IP
address. You can now (from you host operating system) ssh into the
machine by typing

     $ ssh gmod@172.16.108.130

You can also go to the web server running on this server by going to
<a href="http://172.16.108.130" class="external free"
rel="nofollow">http://172.16.108.130</a> (for example). If you are on
Windows and would like to do this, you can get <a
href="http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html"
class="external text" rel="nofollow">putty</a>, which is a free ssh
client for Windows.

You can also use the graphical user interface on the server, using a
browser and terminal inside of VMware/Ubuntu.

The text console is initially configured to work with a US keyboard. If
you are not using a US keyboard you can type:

     $ sudo apt-get install console-data

Select the options for your own machine. Note that this will not affect
the X environment or any logins via SSH or PuTTY.

## Resizing the Display

**You should be able to resize your window just by clicking and
dragging.**

However, if that doesn't work, you can try the `xrandr` command to
resize your display.

    $ xrandr
    ...
       800x600
       640x480
    ...

This lists all the sizes you can resize your screen to. To resize your
screen

    $ xrandr -s widthxheight

For example,

    $ xrandr -s 1280x960 

works well on my 15" MacBook Pro.

## Linux Text Editors

You will need to do a lot of file editing in this course. If you are
going to do that editing directly in the VMware image, you will need to
pick a Linux text editor.

Examples on session pages show the text editor of choice of the
instructor who wrote the page. This is most often `vi` or `emacs`
However, **if you aren't already familiar with one of these then you are
better off using `gedit`.** It is less powerful, but is also much more
straightforward to use.

    $ gedit filename &

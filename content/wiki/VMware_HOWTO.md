---
title: "VMware HOWTO"
---
# VMware HOWTO

<a href="http://vmware.com" rel="nofollow" title="VMware"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ec/VmwareLogoSmall.jpg" width="100"
height="26" alt="VMware" /></a>

<a href="http://vmware.com" class="external text"
rel="nofollow">VMware</a> images containing GMOD software let you try
GMOD software without installing it on your local machine. Instead, the
software runs inside a virtual machine on your computer.

VMware images are used in several places in GMOD:

- The [Community Annotation
  System](/wiki/Community_Annotation_System) is
  packaged as a VMware image.
- Many GMOD [tutorials](/wiki/Category%3ATutorials) use
  VMware images as starting points.



  Players</span>](#VMware_Players)
- [Getting the
  VMware Image](#Getting_the_VMware_Image)
- [Starting the
  VMware Image](#Starting_the_VMware_Image)
- [Using the
  VMWare Image](#Using_the_VMWare_Image)
- [Fluxbox](#Fluxbox)

# VMware Players

Which software to use to run **VMware** images depends on the operating
system you will run the image under. (It does not depend on the
operating system inside the VMware image.)

VMware on Windows and Linux

<a href="http://www.microsoft.com/" rel="nofollow" title="Windoze"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a5/WindowsLogoSmall.jpg" width="49"
height="48" alt="Windoze" /></a>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b1/LinuxLogoSmall.jpg" width="45" height="50"
alt="Linux" />

A free VMware player is available for [Microsoft
Windows](/wiki/Category%3AWindows) and
[Linux](/wiki/Category%3ALinux) [operating
systems](/wiki/Glossary#Operating_System) from
<a href="http://vmware.com/products/player/" class="external text"
rel="nofollow">VMware</a>. You will need to register to download it.
There are multiple versions. Be sure to download a version that can run
on your laptop.



VMware on Mac OS X

<a href="http://www.apple.com/macosx/" rel="nofollow" title="Apple"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/82/AppleSmall.gif" width="48" height="48"
alt="Apple" /></a>

Participants can also bring *newer Macs with Intel processors*. The
Intel processor is a requirement for all the packages discussed below.
There is no free VMware player that runs *directly* under [Mac OS
X](/wiki/Category%3AMac_OS_X). However, there are several
other options, **all of which require an Intel Mac**:



VMware Fusion

<a href="http://www.vmware.com/products/fusion/" rel="nofollow"
title="Fusion"><img src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/02/VMWareFusionsLogo.jpg"
width="48" height="48" alt="Fusion" /></a>

<a href="http://www.vmware.com/products/fusion/" class="external text"
rel="nofollow">VMware Fusion</a>
(<a href="http://www.vmware.com/a/buylink/10" class="external text"
rel="nofollow">$80/corporate</a>,
<a href="http://www.vmware.com/vmwarestore/academicstore.html"
class="external text" rel="nofollow">$40/Academic</a>) allows you to run
VMware images (as well as Windows and Linux) under Mac OS. **We
recommend this option for Mac users. There is a fully functional, 30 day
free trial version of VMware Fusion available for download.**



VirtualBox

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fa/VirtualBox-logo.png" width="48"
height="48" alt="VirtualBox" />

<a href="http://www.virtualbox.org/wiki/Downloads" class="external text"
rel="nofollow">VirtualBox</a> is free and open source, and runs on Intel
Macs (and Windows, Linux and Solaris too). It claims to be capable of
running VMware images, *but we have not tested this with our images.*

# Getting the VMware Image

Anything that uses a VMware image will have a link to the image on its
wiki page. Once you have the VMware player software installed (see
[VMware Players](#VMware_Players)), download the image on to your
system. You will need to unpack the downloaded file (usually you'll need
to unzip and/or untar it) before loading it into your VMware player
software (see [VMware Players](#VMware_Players)). Most images have been
compressed with tar and/or gzip.

# Starting the VMware Image

Details on starting the VMware image vary from platform to platform. See
the documentation for your VMware player for how to do start an image on
your system.

If you are running a player from VMware (VMware Player or Fusion), the
software will ask you if you moved or copied the image.

You Moved It!

Yes you did.

If you say you copied it, you will have to do additional network
configuration once it is up and running.

# Using the VMWare Image

After starting up the VMware image (which will take several seconds),
you will be greeted with an attractive text-based terminal. Login using
the username and password for the system (which should be listed on the
wiki page you downloaded the image from.

At this point, you have a few options for how to use it. If you would
like to ssh in to the server (which I suggest as a good idea: copy and
pasting commands will be easier and you will be able to use an
environment you are used to), then you will need the server's ip
address. To get it, at the command prompt, type:

     ifconfig

which will give you output like this:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/96/Ifconfig_output.jpg" width="720"
height="500" alt="Ifconfig output.jpg" />

See that "inet addr:172.16.244.128"? Those four numbers are the IP
address. You can now (from you host operating system) ssh into the
machine by typing

     ssh gmod@172.16.244.128

You can also go to the web server running on this server by going to
<a href="http://172.16.244.128" class="external free"
rel="nofollow">http://172.16.244.128</a> (for example). If you are on
Windows and would like to do this, you can get <a
href="http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html"
class="external text" rel="nofollow">putty</a>, which is a free ssh
client for windows.

# Fluxbox

The images from most 2009
[Tutorial](/wiki/Category%3ATutorials) pages include a
basic *[graphical user interface](/wiki/Glossary#GUI)* called
*<a href="http://fluxbox.org/" class="external text"
rel="nofollow">Fluxbox</a>*. Fluxbox is a minimal GUI.

If you want to use a graphical user interface on these images, using a
browser and terminal inside the VMware image, you can start X11/Fluxbox
by typing:

     startx

on the command line, and the GUI will start up. After it starts up, you
can right click (or control-click) to get a menu that will start
applications like Firefox and terminal.

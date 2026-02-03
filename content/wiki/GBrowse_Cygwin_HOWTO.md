---
title: "GBrowse Cygwin HOWTO"
---
# GBrowse Cygwin HOWTO

  Abstract](#Abstract)
- [Installing
  Cygwin](#Installing_Cygwin)
- [Preparing the
  environment](#Preparing_the_environment)
- [Installing
  GBrowse](#Installing_GBrowse)
  - [Rebaseall](#Rebaseall)
- [Configuring
  and Running Apache](#Configuring_and_Running_Apache)
  - [Setting up
    Windows environment and
    services](#Setting_up_Windows_environment_and_services)
  - [Start
    Apache](#Start_Apache)

## Abstract

Installing [GBrowse](/wiki/GBrowse.1) on Cygwin running on Windows.
Note that this is quite old, and does not apply to GBrowse2, which has
not been tested or tried on any Windows server.

## Installing Cygwin

<a href="http://cygwin.com" class="external text"

does not partition your drive or require a dual boot. It does however
provide a shell and GNU tools.

To install Cygwin, go to the
<a href="http://cygwin.com" class="external text" rel="nofollow">Cygwin
homepage</a> and click the "install or update now" link and save the
file to your hard drive. Now double click the setup installer for
Cygwin; this will start the installation process. When presented with
the "Choose a Download Source" option, select "Install from Internet".
Accept the defaults until presented with the "Select you internet
connection" option and choose the appropriate option for you. Then you
need to pick a download mirror to get Cygwin from; it's best to choose
one near you.

This part is important: you are then presented with a "Select Packages"
option. In order for GBrowse to work properly, you should get the full
Cygwin install. To do that, click on the word "All" until the word
Install appears next to it, then press next until the install starts
downloading packages from the mirror you selected. This step will take a
long time. (Note that the full install is certainly more than is
necessary, however, identifying exactly what is needed is somewhat
difficult, so it is easier just to get the full install. X11 can be left
out to save some space.)

## Preparing the environment

Cygwin created a home directory for you using your full name associated
with your Windows account. Unfortunately, if there are any spaces in
this name (like the space in "Scott Cain"), then this will cause
problems with some of the tools in Cygwin. To fix this, you need to
rename the home directory and fix the passwd file. In this example,
assume the home directory is originally called "/home/Scott Cain" and I
want to change it to "/home/scott". First, change every occurrence of
"Scott Cain" in the file /etc/passwd to scott. Do this by executing this
perl command on the Cygwin shell command line:

     perl -pi.bak -e 's/Scott Cain/scott/g' /etc/passwd

Then you need to rename the home directory like this:

     mv "/home/Scott Cain" /home/scott

Then you need to quit Cygwin and restart so that the changes take
effect.

## Installing GBrowse

Download the net install script:

     wget http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/bin/gbrowse_netinstall.pl

and run it:

     perl gbrowse_netinstall.pl

This will set up cpan if you haven't already done that before. It is
generally safe to accept the defaults when asked questions.

### Rebaseall

If during the installation, you see messages like

     ... *** fatal error - unable to remap C:/gywin/bin/cygz.dd to same address as parent ...

you need to execute the rebaseall application. In order to run this, you
need to execute the ash shell from OUTSIDE Cygwin. To do this, quit
Cygwin and open a Windows cmd shell (select Run... from the Start menu
and type 'cmd'). In the cmd shell, change directories to the Cygwin bin
directory:

     cd C:\cygwin\bin

and start the ash shell:

     ash.exe

and then rebaseall:

     /usr/bin/rebaseall

This will take a few minutes to run. When you are done, you can exit out
of the ash shell, restart Cygwin and rerun the GBrowse netinstaller.

## Configuring and Running Apache

### Setting up Windows environment and services

The Windows environment needs to be set up to allow Apache to run under
Cygwin. First, run /usr/bin/cygserver-config. Answer yes to the question
about installing it as a Windows service. Then run

    net start cygserver

to start the Windows service.

Now you need to create Windows environment variables for Cygwin. Open
the System control panel and under the Advanced tab, press the
"Environment variables" button. In the System variables section, press
the 'New' button and enter CYGWIN in variable name and 'server' for
variable value. Now restart Windows to make sure the the environment
variable and Windows server are both running.

### Start Apache

Finally, you can start Apache:

     /usr/sbin/apachectl2 start

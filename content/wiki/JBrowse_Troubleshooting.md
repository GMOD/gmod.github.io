---
title: "JBrowse Troubleshooting"
---
# JBrowse Troubleshooting

This page collects solutions to problems that people sometimes encounter
when installing JBrowse.

 prerequisites - libpng, zlib, libgd,
 etc</span>](#Installing_prerequisites_-_libpng.2C_zlib.2C_libgd.2C_etc)
 - [Linux -
 Ubuntu / Debian](#Linux_-_Ubuntu_.2F_Debian)
 - [Linux -
 Red Hat / Fedora /
 CentOS](#Linux_-_Red_Hat_.2F_Fedora_.2F_CentOS)
 - [Mac OS
 X](#Mac_OS_X)
- [Other
 Problems](#Other_Problems)

# Installing prerequisites - libpng, zlib, libgd, etc

JBrowse requires a few fundamental prerequisites that it cannot install
itself: these are libpng, zlib, libgd, make, a C compiler, and a C++
compiler.

## Linux - Ubuntu / Debian

These commands, or similar, should install what you need:

 sudo apt-get install build-essential libpng-dev zlib1g-dev libgd2-xpm-dev

## Linux - Red Hat / Fedora / CentOS

These commands, or similar, should install what you need:

 sudo yum groupinstall "Development Tools"
 sudo yum install libpng-devel gd-devel zlib-devel perl-ExtUtils-MakeMaker

## Mac OS X

Use <a href="http://www.macports.org/" class="external text"

<a href="http://www.finkproject.org/" class="external text"

<a href="http://mxcl.github.com/homebrew/" class="external text"

compiler, libpng development headers, GD development headers, and Zlib
development headers.

# Other Problems

If nothing on this page helps you, try emailing the JBrowse mailing
list.

The setup script creates a file called `setup.log`, contains detailed
information on your installation. Email
<a href="mailto:gmod-ajax@lists.sourceforge.net" class="external text"

support, and attach your `setup.log` file to the email. Please do not
put the setup.log file directly in the email body.

As more users try `setup.sh` and report problems to the mailing list,
this wiki will be updated with fixes for common problems they encounter.

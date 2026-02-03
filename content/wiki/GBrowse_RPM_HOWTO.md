---
title: "GBrowse RPM HOWTO"
---
# GBrowse RPM HOWTO

**Important note:** The instructions below will install a relatively old
version of GBrowse (1.54 I think). To install a newer version, first
install the Apache webserver (httpd) and libgd with yum:

     sudo yum install gd-devel httpd

and then follow the directions on [the main install
page](/wiki/GBrowse_Install_HOWTO) for using the net
install script. If you don't want or need the 'bleating edge', just
ignore this note.

  Biopackages](#Biopackages)
- [Preliminaries](#Preliminaries)
- [Installing
  Packages](#Installing_Packages)
- [Authors](#Authors)

# Biopackages

RPM-based Linux distributions, including
<a href="http://fedoraproject.org/" class="external text"
rel="nofollow">Fedora</a> and
<a href="http://www.centos.org" class="external text"
rel="nofollow">CentOS</a>, can install GBrowse using the RPMs located at
<a href="http://www.biopackages.net/" class="external free"
rel="nofollow">http://www.biopackages.net/</a>. These can be installed
using the
<a href="http://en.wikipedia.org/wiki/Yellow_dog_Updater_Modified"
class="external text" rel="nofollow">yum</a> installer tool. For more
information please see the [Biopackages
HOWTO](/wiki/Biopackages_HOWTO).

# Preliminaries

See the [Biopackages HOWTO](/wiki/Biopackages_HOWTO) for
the steps to setup Biopackages on your system.

# Installing Packages

First, as root, freshen your local cache of yum header files. Yum will
print something similar to what is below:

    % yum update
    Gathering header information file(s) from server(s)
    Server: Fedora Core 2 - x86_64 - Base
    Server: BioPackages (Stable x86_64) for Fedora Core 2 - x86_64
    Server: BioPackages (Stable noarch) for Fedora Core 2 - x86_64
    Server: Fedora Core 2 - x86_64 - Released Updates
    Finding updated packages
    Downloading needed headers
    genome-Sce-annotation-gen 100% |=========================| 1.1 kB    00:00
    genome-Sce-nib-0-S228C-3. 100% |=========================| 1.7 kB    00:00
    chado-Sce-0-S228C.0.003-2 100% |=========================| 2.0 kB    00:00
    genome-Sce-annotation-aff 100% |=========================| 1.2 kB    00:00
    genome-Sce-0-S228C-3.2005 100% |=========================| 1.7 kB    00:00

Then install gbrowse:

    % yum install gbrowse

You can now visit the documentation and try out the example Yeast
database by visiting
<a href="http://localhost/gbrowse" class="external free"
rel="nofollow">http://localhost/gbrowse</a>

NOTE: One problem with the RPM install is it currently installs gbrowse
into it's own directory (e.g. /var/www/cgi-bin/gbrowse/). This means
that the yeast example referenced in
<a href="http://localhost/gbrowse" class="external free"
rel="nofollow">http://localhost/gbrowse</a> should actually point to
<a href="http://localhost/cgi-bin/gbrowse/gbrowse/yeast_chr1"
class="external free"
rel="nofollow">http://localhost/cgi-bin/gbrowse/gbrowse/yeast_chr1</a>.

# Authors

[Lincoln Stein](/wiki/User%3ALstein) 12:51, 17 April 2007 (EDT)

Some material cut and paste from www.biopackages.net, with permission
from Allen Day.

Brian
O'Connor 12:12, 19 April 2007 (PDT)

Updated the install description of Biopackages to use our new
configuration RPMs.

Brian
O'Connor 12:18, 05 June 2007 (PDT)

Added note about install path for gbrowse.

---
title: "GBrowse RPM HOWTO"
---
<span id="top"></span>

# <span dir="auto">GBrowse RPM HOWTO</span>

**Important note:** The instructions below will install a relatively old
version of GBrowse (1.54 I think). To install a newer version, first
install the Apache webserver (httpd) and libgd with yum:

     sudo yum install gd-devel httpd

and then follow the directions on [the main install
page](GBrowse_Install_HOWTO "GBrowse Install HOWTO") for using the net
install script. If you don't want or need the 'bleating edge', just
ignore this note.

## Contents

- [<span class="tocnumber">1</span>
  <span class="toctext">Biopackages</span>](#Biopackages)
- [<span class="tocnumber">2</span>
  <span class="toctext">Preliminaries</span>](#Preliminaries)
- [<span class="tocnumber">3</span> <span class="toctext">Installing
  Packages</span>](#Installing_Packages)
- [<span class="tocnumber">4</span>
  <span class="toctext">Authors</span>](#Authors)

# <span id="Biopackages" class="mw-headline">Biopackages</span>

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
HOWTO](Biopackages_HOWTO "Biopackages HOWTO").

# <span id="Preliminaries" class="mw-headline">Preliminaries</span>

See the [Biopackages HOWTO](Biopackages_HOWTO "Biopackages HOWTO") for
the steps to setup Biopackages on your system.

# <span id="Installing_Packages" class="mw-headline">Installing Packages</span>

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

# <span id="Authors" class="mw-headline">Authors</span>

[Lincoln Stein](User%253ALstein "User%253ALstein") 12:51, 17 April 2007 (EDT)

Some material cut and paste from www.biopackages.net, with permission
from Allen Day.

Brian
O'Connor 12:12, 19 April 2007 (PDT)

Updated the install description of Biopackages to use our new
configuration RPMs.

Brian
O'Connor 12:18, 05 June 2007 (PDT)

Added note about install path for gbrowse.

[Categories](Special%253ACategories "Special%253ACategories"):

- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")
- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")
- [Linux](Category%253ALinux "Category%253ALinux")

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse_RPM_HOWTO" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 11:32 on 28 October 2008.</span>
<!-- - <span id="footer-info-viewcount">78,137 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

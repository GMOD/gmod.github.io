---
title: "Biopackages HOWTO"
---
<span id="top"></span>

# <span dir="auto">Biopackages HOWTO</span>

## Contents

- [<span class="tocnumber">1</span>
  <span class="toctext">Biopackages</span>](#Biopackages)
- [<span class="tocnumber">2</span>
  <span class="toctext">Preliminaries</span>](#Preliminaries)
- [<span class="tocnumber">3</span> <span class="toctext">Installing
  Packages</span>](#Installing_Packages)
- [<span class="tocnumber">4</span> <span class="toctext">Help! Package
  Foo on Platform X Does Not Work/Is Not
  Available</span>](#Help.21_Package_Foo_on_Platform_X_Does_Not_Work.2FIs_Not_Available)
- [<span class="tocnumber">5</span> <span class="toctext">Source vs. RPM
  Installs</span>](#Source_vs._RPM_Installs)
- [<span class="tocnumber">6</span>
  <span class="toctext">Authors</span>](#Authors)

# <span id="Biopackages" class="mw-headline">Biopackages</span>

RPM-based Linux distributions, including
<a href="http://fedoraproject.org/wiki/" class="external text"
rel="nofollow">Fedora Core</a> and
<a href="http://www.centos.org" class="external text"
rel="nofollow">CentOS</a>, can install GMOD software (chado databases,
GBrowse, GMODWeb, etc) using the RPMs located at
<a href="http://www.biopackages.net/" class="external free"
rel="nofollow">http://www.biopackages.net/</a>. These can be installed
using the
<a href="http://en.wikipedia.org/wiki/Yellow_dog_Updater_Modified"
class="external text" rel="nofollow">yum</a> installer tool. This
process is an easy and quick way to install GMOD tools. The only
requirement is that you use one of the supported distributions (Centos4
is the supported & tested platform for GMOD) and you install biopackages
on a clean system (e.g. no source installed software). We recommend you
do not mix source and RPM software installs unless you really know what
you are doing since they could (silently) conflict with each other. See
the section "Source vs. RPM Installs" below for more information.

At the time of this writing (April 2007) complete RPMs for Fedora Core
2, 5, and CentOS 4 are available, and supported architectures included
32- and 64-bit Intel platforms. Check back regularly for updates at the
<a href="http://biopackages.net" class="external text"
rel="nofollow">Biopackages</a> website, you can view the build status
for our RPMs
<a href="http://biopackages.net/report" class="external text"
rel="nofollow">here</a>. The platform tested for the GMOD community is
CentOS 4 and we highly recommend using Biopackages on this distribution.

# <span id="Preliminaries" class="mw-headline">Preliminaries</span>

Biopackages.net hosts a yum repository for distribution of Linux
packages. To configure yum to be aware of the Biopackages.net
repository, install one of the following configuration RPMs:

       * Fedora Core 2
       * Fedora Core 5
       * CentOS 4 (the recommended Linux distribution)

A simple way to do this is, as root, execute the following command. Make
sure you substitute the URL below with the correct one for your
distribution:

    rpm -Uvh http://biopackages.net/biopackages/stable/centos/4/noarch/biopackages-client-config-1.0-1.2.bp.centos4.noarch.rpm

Alternatively you can manually add the following to your /etc/yum.conf
file (customize as appropriate):

    [biopackages-stable]
    name=BioPackages (Stable) for Fedora Core $releasever - $basearch
    enabled=1
    gpgkey=file:///etc/pki/rpm-gpg/BIOPACKAGES-RPM-GPG-KEY
    gpgcheck=1
    baseurl=http://yum.biopackages.net/biopackages/stable/fedora/$releasever/$basearch/

    [biopackages-stable-noarch]
    name=BioPackages (Stable) for Fedora Core $releasever - noarch
    enabled=1
    gpgkey=file:///etc/pki/rpm-gpg/BIOPACKAGES-RPM-GPG-KEY
    gpgcheck=1
    baseurl=http://yum.biopackages.net/biopackages/stable/fedora/$releasever/noarch/

And import the public key from
<a href="http://biopackages.net/BIOPACKAGES-RPM-GPG-KEY"
class="external text" rel="nofollow">here</a>, saving it to
/etc/pki/rpm-gpg.

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

You can then install any RPM package available through Biopackages. For
a list of RPMs please see the build status
<a href="http://biopackages.net/report" class="external text"
rel="nofollow">report</a>. You can also browse the repository directly
<a href="http://biopackages.net/stable" class="external text"
rel="nofollow">here</a>.

There are many GMOD RPMs available including:

- chado, chado-Sce, chado-Hsa, chado-Mmu (base empty chado with
  ontologies, chado for yeast, chado for human, chado for mouse
  respectively)
- gmod-web, gmod-web-Sce, gmod-web-Hsa (GMODWeb pre-configured)
- gbrowse
- textpresso
- AmiGO
- blastGraphic
- turnkey
- R
- bioperl
- ncbi (the NCBI toolkit)
- and many others

Use the following command as root to install one, or more, of these
packages:

    % yum install <package_name>

# <span id="Help.21_Package_Foo_on_Platform_X_Does_Not_Work.2FIs_Not_Available" class="mw-headline">Help! Package Foo on Platform X Does Not Work/Is Not Available</span>

Since the biopackages project is a relatively small group of developers
we are currently focused on Centos4. If you encounter bugs on this, or
another, platform we would like to hear about them. Please email the
Biopackages \[<a href="mailto:biopackages-main@lists.sourceforge.net"
class="external text" rel="nofollow">list</a>\] a detailed bug report.

If the package you are interested in is not available or is out-of-date
please consider becoming a Biopackages developer. More information can
be found on our developers wiki at
<a href="http://biopackages.wiki.sourceforge.net" class="external free"
rel="nofollow">http://biopackages.wiki.sourceforge.net</a>.

# <span id="Source_vs._RPM_Installs" class="mw-headline">Source vs. RPM Installs</span>

Since RPMs and source installs can silently overwrite each other
resulting in conflicts we recommend you do not mix them. If you must
install source, for example to support software development, we
recommend you specify the source installation directory to be either 1)
a specific development directory in you home directory or 2) a
non-standard system folder such as /usr/local. This way your core
operating system will be maintained as a clean, RPM-only environment.

# <span id="Authors" class="mw-headline">Authors</span>

Brian
O'Connor

[Categories](Special%253ACategories "Special%253ACategories"):

- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Biopackages_HOWTO" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 20:54 on 14 April 2010.</span>
<!-- - <span id="footer-info-viewcount">73,001 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

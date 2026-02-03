---
title: "Biopackages HOWTO"
---
# Biopackages HOWTO

  Biopackages](#Biopackages)
- [Preliminaries](#Preliminaries)
- [Installing
  Packages](#Installing_Packages)
- [Help! Package
  Foo on Platform X Does Not Work/Is Not
  Available](#Help.21_Package_Foo_on_Platform_X_Does_Not_Work.2FIs_Not_Available)
- [Source vs. RPM
  Installs](#Source_vs._RPM_Installs)
- [Authors](#Authors)

# Biopackages

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

# Preliminaries

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

# Help! Package Foo on Platform X Does Not Work/Is Not Available

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

# Source vs. RPM Installs

Since RPMs and source installs can silently overwrite each other
resulting in conflicts we recommend you do not mix them. If you must
install source, for example to support software development, we
recommend you specify the source installation directory to be either 1)
a specific development directory in you home directory or 2) a
non-standard system folder such as /usr/local. This way your core
operating system will be maintained as a clean, RPM-only environment.

# Authors

Brian
O'Connor

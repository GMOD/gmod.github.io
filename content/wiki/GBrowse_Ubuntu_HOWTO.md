---
title: "GBrowse Ubuntu HOWTO"
---




<span id="top"></span>




# <span dir="auto">GBrowse Ubuntu HOWTO</span>











NOTE: As of the 11.10 release of Ubuntu, there is a .deb package for
GBrowse (it's usable on Debian machines as well, but I don't know the
details of what repository needs to be activated to get GBrowse via
apt-get on Debian).


ANOTHER NOTE: the current version of GBrowse in that deb package is
fairly old (2.38 versus the current 2.55); below I'll outline using
apt-get to get all of the prerequisites for GBrowse but use cpan to
install GBrowse.



To install GBrowse on a recent Ubuntu distribution, just do this:

     sudo apt-get install gbrowse gbrowse-calign gbrowse-data libbio-samtools-perl apache2 libapache2-mod-fcgid
     sudo a2enmod headers
     sudo a2enmod cgid
     sudo service apache2 restart
     

And then point your browser at
<a href="http://localhost/gbrowse2" class="external free"
rel="nofollow">http://localhost/gbrowse2</a>.

The content below will be left in place for older distributions.

  

- If you plan to use a MySQL database, you may need to install mysql

<!-- -->

    sudo apt-get install mysql-server

------------------------------------------------------------------------


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Using apt-get
  just to get the
  prereqs</span>](#Using_apt-get_just_to_get_the_prereqs)
- [<span class="tocnumber">2</span>
  <span class="toctext">Prerequisites</span>](#Prerequisites)
- [<span class="tocnumber">3</span> <span class="toctext">Installing
  GBrowse with the Net
  Installer</span>](#Installing_GBrowse_with_the_Net_Installer)
- [<span class="tocnumber">4</span>
  <span class="toctext">Author</span>](#Author)



## <span id="Using_apt-get_just_to_get_the_prereqs" class="mw-headline">Using apt-get just to get the prereqs</span>

If you execute this command:

     sudo apt-get install gbrowse

You'll get a list of all of the required packages that GBrowse wants to
install, like this (**but hit N when asked if you want to continue!**):

     amap-align bedtools bioperl bioperl-run bowtie bwa
     infernal javascript-common kalign libace-perl libalgorithm-c3-perl 
     libalgorithm-munkres-perl libapache-dbi-perl libapache2-mod-perl2 
     libapache2-reload-perl libarray-compare-perl libb-hooks-endofscope-perl 
     libbio-asn1-entrezgene-perl libbio-graphics-perl libbio-perl-perl 
     libbio-perl-run-perl libbio-scf-perl libbit-vector-perl libbsd-resource-perl 
     libcarp-clan-perl libcgi-session-perl libclass-c3-perl libclass-c3-xs-perl
     libclass-load-perl libclass-load-xs-perl libconvert-binary-c-perl 
     libdata-optlist-perl libdata-stag-perl libdate-calc-perl libdate-calc-xs-perl 
     libdate-manip-perl libdbd-sqlite3-perl libdevel-globaldestruction-perl 
     libdevel-partialdump-perl libdevel-symdump-perl libeval-closure-perl 
     libfreezethaw-perl libgd-svg-perl libgraph-perl libgraphviz-perl 
     libheap-perl libjcode-pm-perl libjs-prototype libjs-scriptaculous 
     liblist-moreutils-perl libmath-derivative-perl libmath-spline-perl 
     libmldbm-perl libmodule-runtime-perl libmoose-perl libmro-compat-perl
     libnamespace-clean-perl libole-storage-lite-perl libpackage-deprecationmanager-perl
     libpackage-stash-perl libpackage-stash-xs-perl libparams-classify-perl 
     libparams-util-perl libparse-recdescent-perl libpostscript-perl libset-scalar-perl
     libsort-naturally-perl libspreadsheet-parseexcel-perl libspreadsheet-writeexcel-perl
     libstaden-read1 libstatistics-descriptive-perl libsub-exporter-perl 
     libsub-identify-perl libsub-install-perl libsvg-graph-perl libsvg-perl 
     libtree-dagnode-perl libtry-tiny-perl libunicode-map-perl libvariable-magic-perl 
     libxml-dom-perl libxml-dom-xpath-perl libxml-filter-buffertext-perl 
     libxml-libxml-perl libxml-libxslt-perl libxml-perl libxml-regexp-perl
     libxml-sax-writer-perl libxml-xpathengine-perl libyaml-syck-perl samtools 
     sim4 wise wwwconfig-common libjson-perl libterm-readkey-perl libcapture-tiny-perl
     libmodule-build-perl apache2 build-essential

You can copy this list of packages and place them in a text editor and
remove the new lines. In vim, I just hit "J" until the list is one large
line. IF gbrowse is in that list, remove it. Then I can take that list
and paste it into a long apt-get command:

     sudo apt-get install amap-align bedtools bioperl bioperl-run bowtie bwa infernal javascript-common kalign libace-perl libalgorithm-c3-perl libalgorithm-munkres-perl libapache-dbi-perl libapache2-mod-perl2 libapache2-reload-perl libarray-compare-perl libb-hooks-endofscope-perl libbio-asn1-entrezgene-perl libbio-graphics-perl libbio-perl-perl libbio-perl-run-perl libbio-scf-perl libbit-vector-perl libbsd-resource-perl libcarp-clan-perl libcgi-session-perl libclass-c3-perl libclass-c3-xs-perl libclass-load-perl libclass-load-xs-perl libconvert-binary-c-perl libdata-optlist-perl libdata-stag-perl libdate-calc-perl libdate-calc-xs-perl libdate-manip-perl libdbd-sqlite3-perl libdevel-globaldestruction-perl libdevel-partialdump-perl libdevel-symdump-perl libeval-closure-perl libfreezethaw-perl libgd-svg-perl libgraph-perl libgraphviz-perl libheap-perl libjcode-pm-perl libjs-prototype libjs-scriptaculous liblist-moreutils-perl libmath-derivative-perl libmath-spline-perl libmldbm-perl libmodule-runtime-perl libmoose-perl libmro-compat-perl libnamespace-clean-perl libole-storage-lite-perl libpackage-deprecationmanager-perl libpackage-stash-perl libpackage-stash-xs-perl libparams-classify-perl libparams-util-perl libparse-recdescent-perl libpostscript-perl libset-scalar-perl libsort-naturally-perl libspreadsheet-parseexcel-perl libspreadsheet-writeexcel-perl libstaden-read1 libstatistics-descriptive-perl libsub-exporter-perl libsub-identify-perl libsub-install-perl libsvg-graph-perl libsvg-perl libtree-dagnode-perl libtry-tiny-perl libunicode-map-perl libvariable-magic-perl libxml-dom-perl libxml-dom-xpath-perl libxml-filter-buffertext-perl libxml-libxml-perl libxml-libxslt-perl libxml-perl libxml-regexp-perl libxml-sax-writer-perl libxml-xpathengine-perl libyaml-syck-perl samtools sim4 wise wwwconfig-common libjson-perl libterm-readkey-perl libcapture-tiny-perl libmodule-build-perl apache2 build-essential

Then you can use the cpan shell to install GBrowse manually:

     cpan
     cpan> install Bio::Graphics::Browser2

This will still install a few perl modules, but it should go smoothly
and quickly since most of the prerequisites will have been installed by
the above apt-get command.



The information below is deprecated.



[GBrowse](GBrowse.1 "GBrowse") does not have a .deb package, but many of
its prerequisites are distributed in this way. This document describes
how to install GBrowse on Ubuntu and other Linux distributions that use
the Debian packaging system.

# <span id="Prerequisites" class="mw-headline">Prerequisites</span>

Install Apache and Apache-modperl

     sudo apt-get install apache2
     sudo apt-get install libapache2-mod-perl2
     sudo apt-get install libapache2-mod-perl2-dev
     sudo apt-get install libapache2-mod-perl2-doc
     sudo apt-get install apache2-doc

Make the missing cgi-bin directory

     sudo mkdir /usr/lib/cgi-bin

This is not necessary for Ubuntu 7.10, as the Apache install creates it.
For previous versions of Ubuntu, this did not happen.

Install libgd

     sudo apt-get install libgd2-dev

or

     sudo apt-get install libgd2-xpm-dev

for Ubuntu 7.10.

Install MySQL database (optional, but recommended)

     sudo apt-get install mysql-server

Install installer prereqs

     sudo apt-get install libarchive-zip-perl
     sudo apt-get install libarchive-tar-perl
     sudo apt-get install ncftp

# <span id="Installing_GBrowse_with_the_Net_Installer" class="mw-headline">Installing GBrowse with the Net Installer</span>

Get the netinstaller script from <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/bin/gbrowse_netinstall.pl"
class="external text" rel="nofollow">SourceForge</a> and save it to disk
as "gbrowse_netinstall.pl". Then run:

    sudo perl gbrowse_netinstall.pl

Be sure to double-check the paths that GBrowse guesses for the Apache
configuration, htdocs, and cgibin directories, as these may have
changed.

The script will download and install all the Perl modules on which
GBrowse depends. During the installation process, some of these modules
will ask you questions. You can almost always accept the defaults. If
you change your mind later, you can simply run the script again.

When the installer is finished, you can browse the documentation and
example database at
<a href="http://localhost/gbrowse" class="external free"
rel="nofollow">http://localhost/gbrowse</a>.

# <span id="Author" class="mw-headline">Author</span>

[Lincoln Stein](User%253ALstein "User%253ALstein") 12:36, 17 April 2007 (EDT)




[Categories](Special%253ACategories "Special%253ACategories"):

- [Linux](Category%253ALinux "Category%253ALinux")
- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")
- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")






## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AGBrowse_Ubuntu_HOWTO" accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>





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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse_Ubuntu_HOWTO" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:37 on 8 August
  2018.</span>
<!-- - <span id="footer-info-viewcount">162,054 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





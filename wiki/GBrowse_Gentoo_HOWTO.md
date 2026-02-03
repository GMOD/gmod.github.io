



<span id="top"></span>




# <span dir="auto">GBrowse Gentoo HOWTO</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Prerequisites</span>](#Prerequisites)
- [<span class="tocnumber">2</span> <span class="toctext">Installing
  GBrowse using net
  installer</span>](#Installing_GBrowse_using_net_installer)
- [<span class="tocnumber">3</span> <span class="toctext">Installing
  GBrowse with Source File</span>](#Installing_GBrowse_with_Source_File)
- [<span class="tocnumber">4</span> <span class="toctext">Starting
  GBrowse</span>](#Starting_GBrowse)
- [<span class="tocnumber">5</span>
  <span class="toctext">AUTHORS</span>](#AUTHORS)



# <span id="Prerequisites" class="mw-headline">Prerequisites</span>

Install Apache

Apache2 will now work on most systems with no problems, if it doesn't
for you, section Common Problems might be helpful.

Start by emerging apache2: add "apache2" to your USE flags in make.conf
and

     emerge apache -av

To start Apache2 run:

    /etc/init.d/apache2 start

If you'd like to have have Apache2 start on boot run:

    rc-update add apache2 default

Install Mysql (Optional, But highly recommended)

     emerge mysql -av

Or if you do not want mysql to be updated automatically with the system,

     emerge mysql -1

This will install mysql once without adding its ebuild into world
namespace. So next time when you emerge -u world, mysql will be excluded
from updating.

Create the initial mysql database

     emerge --config mysql

This will also inform you to set the root password of mysql database. If
you have more than one version of mysql installed on your machine,
please name it specifically like =dev-db/mysql-4.1.21

Install Bioperl

The advantage of this approach is it's stepwise, so it's easy to stop
and analyze in case of any problem.

Download, then unpack the
<a href="http://bioperl.org/DIST/" class="external text"
rel="nofollow">appropriate package</a>. For example:

    >gunzip bioperl-1.5.2_102.tar.gz
    >tar xvf bioperl-1.5.2_102.tar
    >cd bioperl-1.5.2_102

Now issue the build commands:

    >perl Build.PL
    >./Build test

If you've installed everything perfectly and all the network connections
are working then you may pass all the tests run in the './Build test'
phase. It's also possible that you may fail some tests. Possible
explanations: problems with local Perl installation, network problems,
previously undetected bug in Bioperl, flawed test script, problems with
CGI script using for sequence retrieval at public database, and so on.
Remember that there are over 800 modules in Bioperl and the test suite
is running more than 12000 individual tests, a few failed tests may not
affect your usage of Bioperl.

If you decide that the failed tests will not affect how you intend to
use Bioperl and you'd like to install anyway, or if all tests were fine,
do:

    >./Build install

This is what most experienced Bioperl users would do. However, if you're
concerned about a failed test and need assistance or advice then contact
**bioperl-l@bioperl.org**.

To `'./Build install'` you need write permission in the
`perl5/site_perl/source` area (or similar, depending on your
environment). Usually this will require you becoming
<a href="http://en.wikipedia.org/wiki/Superuser" class="extiw"
title="wp:Superuser">root</a>, so you will want to talk to your systems
manager if you don't have the necessary privileges.

Cite from
<a href="http://www.bioperl.org/wiki/Installing_Bioperl_for_Unix"
class="external free"
rel="nofollow">http://www.bioperl.org/wiki/Installing_Bioperl_for_Unix</a>.

# <span id="Installing_GBrowse_using_net_installer" class="mw-headline">Installing GBrowse using net installer</span>

Now we have a very convenient way to have Gbrowse and all its
prerequisites, like latest leased version of bioperl, GD, which were
absent from your computer installed.

Download the network installer script: <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/bin/gbrowse_netinstall.pl"
class="external text"
rel="nofollow"><code>gbrowse_netinstall.pl</code></a>

I edit gbrowse_netinstall.pl file, change the the gbrowse download
mirror to <a href="http://jaist.dl.sourceforge.net/sourceforge/gmod/"
class="external free"
rel="nofollow">http://jaist.dl.sourceforge.net/sourceforge/gmod/</a>,
because the mirror is faster than others, download from China.

     use constant SOURCEFORGE_MIRROR1  => 'http://jaist.dl.sourceforge.net/sourceforge/gmod/';

Make sure you have root privilege and run

     perl gbrowse_netinstall.pl

Then follow the instruction to complete installation. The default
settings are suitable from most circumstances.

The only thing need to be noticed is that the installer uses wrong
directories as apache default directories. When the question appears,
you should change them to

     Apache conf directory? [/usr/local/apache/conf] /etc/apache2/
     Apache htdocs directory? [/usr/local/apache/htdocs] /var/www/localhost/htdocs/
     Apache cgibin directory? [/usr/local/apache/cgi-bin] /var/www/localhost/cgi-bin/

You may go to the main page of Gbrowse to see more detailed instructions
about netinstaller.

# <span id="Installing_GBrowse_with_Source_File" class="mw-headline">Installing GBrowse with Source File</span>

Download GBrowse Source from  

<!-- -->

     http://prdownloads.sourceforge.net/gmod

You should be uncompressed and unpacked the source files.

Install GBrowse

Change to the directory which the source files have been uncompressed
and unpacked. We will install GBrowse in the default directory
"/var/www/localhost/htdocs/" and "/var/www/localhost/cgi-bin/".
Following these command:

     perl Makefile.PL APACHE=/var/www/localhost/ CONF=/etc/apache2/ HTDOCS=/var/www/localhost/htdocs/ CGIBIN=/var/www/localhost/cgi-bin/ DO_XS=1
     make
     make install

# <span id="Starting_GBrowse" class="mw-headline">Starting GBrowse</span>

Start mysql and apache

     /etc/init.d/mysql start
     /etc/init.d/apache2 start

Now browse the documentation and example database at
<a href="http://localhost/gbrowse" class="external free"
rel="nofollow">http://localhost/gbrowse</a>.

# <span id="AUTHORS" class="mw-headline">AUTHORS</span>

Tao Zhang \<forrest_zhang@163.com\>.




[Categories](Special%253ACategories "Special%253ACategories"):

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse_Gentoo_HOWTO" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:00 on 23 September
  2009.</span>
<!-- - <span id="footer-info-viewcount">62,187 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





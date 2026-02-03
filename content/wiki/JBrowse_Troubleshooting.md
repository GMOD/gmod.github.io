---
title: "JBrowse Troubleshooting"
---




<span id="top"></span>




# <span dir="auto">JBrowse Troubleshooting</span>









This page collects solutions to problems that people sometimes encounter
when installing JBrowse.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Installing
  prerequisites - libpng, zlib, libgd,
  etc</span>](#Installing_prerequisites_-_libpng.2C_zlib.2C_libgd.2C_etc)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Linux -
    Ubuntu / Debian</span>](#Linux_-_Ubuntu_.2F_Debian)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Linux -
    Red Hat / Fedora /
    CentOS</span>](#Linux_-_Red_Hat_.2F_Fedora_.2F_CentOS)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Mac OS
    X</span>](#Mac_OS_X)
- [<span class="tocnumber">2</span> <span class="toctext">Other
  Problems</span>](#Other_Problems)



# <span id="Installing_prerequisites_-_libpng.2C_zlib.2C_libgd.2C_etc" class="mw-headline">Installing prerequisites - libpng, zlib, libgd, etc</span>

JBrowse requires a few fundamental prerequisites that it cannot install
itself: these are libpng, zlib, libgd, make, a C compiler, and a C++
compiler.

## <span id="Linux_-_Ubuntu_.2F_Debian" class="mw-headline">Linux - Ubuntu / Debian</span>

These commands, or similar, should install what you need:

     sudo apt-get install build-essential libpng-dev zlib1g-dev libgd2-xpm-dev

## <span id="Linux_-_Red_Hat_.2F_Fedora_.2F_CentOS" class="mw-headline">Linux - Red Hat / Fedora / CentOS</span>

These commands, or similar, should install what you need:

     sudo yum groupinstall "Development Tools"
     sudo yum install libpng-devel gd-devel zlib-devel perl-ExtUtils-MakeMaker

## <span id="Mac_OS_X" class="mw-headline">Mac OS X</span>

Use <a href="http://www.macports.org/" class="external text"
rel="nofollow">MacPorts</a>,
<a href="http://www.finkproject.org/" class="external text"
rel="nofollow">Fink</a>,
<a href="http://mxcl.github.com/homebrew/" class="external text"
rel="nofollow">Homebrew</a>, or another package manager to install a C++
compiler, libpng development headers, GD development headers, and Zlib
development headers.

# <span id="Other_Problems" class="mw-headline">Other Problems</span>

If nothing on this page helps you, try emailing the JBrowse mailing
list.

The setup script creates a file called `setup.log`, contains detailed
information on your installation. Email
<a href="mailto:gmod-ajax@lists.sourceforge.net" class="external text"
rel="nofollow">gmod-ajax@lists.sourceforge.net</a> with a request for
support, and attach your `setup.log` file to the email. Please do not
put the setup.log file directly in the email body.

As more users try `setup.sh` and report problems to the mailing list,
this wiki will be updated with fixes for common problems they encounter.








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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/JBrowse_Troubleshooting" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 12:28 on 25 September
  2013.</span>
<!-- - <span id="footer-info-viewcount">39,332 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





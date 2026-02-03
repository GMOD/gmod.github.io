---
title: "Fixing Perl on OSX"
---




<span id="top"></span>




# <span dir="auto">Fixing Perl on OSX</span>









One of the Security Updates to Mac OSX 10.5 caused problems for Perl.
See

- <a
  href="http://www.theregister.co.uk/2009/02/16/apple_update_perl_breakage/"
  class="external free"
  rel="nofollow">http://www.theregister.co.uk/2009/02/16/apple_update_perl_breakage/</a>
- <a href="http://www.macosxhints.com/article.php?story=20090219082024982"
  class="external free"
  rel="nofollow">http://www.macosxhints.com/article.php?story=20090219082024982</a>

What seems to have happened is that Apple replaced some Perl modules
with their older versions. These need to be reinstalled from source to
get cpan and other things to work. Which modules need to be replaced
seems to depend on what was updated on your system and when. Generally,
you can figure out which modules you need by examining the error
messages you get when installing. I had to manually reinstall IO,
Scalar-List-Utils, Compress-Raw-Zlib, and Compress-Zlib from the tar
distributions.

The general process is illustrated by how to reinstall IO

      mkdir -p /SourceCache
      cd /SourceCache
      curl -O http://cpan.mirror.solnet.ch/authors/id/G/GB/GBARR/IO-1.2301.tar.gz
      tar xzf IO-1.2301.tar.gz
      cd IO-1.2301
      perl Makefile.PL
      make
      make install

This was copied from an Apple discussion forum. There's nothing special
about using /SourceCache as the directory for the downloaded modules. I
did have some problems with cpan mirrors failing to download the needed
code modules via curl. In most cases you can get these via ftp.

See:

- <a href="http://www.cpan.org/SITES.html" class="external free"
  rel="nofollow">http://www.cpan.org/SITES.html</a>




[Categories](Special%253ACategories "Special%253ACategories"):

- [Perl](Category%253APerl "Category%253APerl")
- [Mac OS X](Category%253AMac_OS_X "Category%253AMac OS X")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Fixing_Perl_on_OSX" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 02:50 on 9 June
  2009.</span>
<!-- - <span id="footer-info-viewcount">11,746 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





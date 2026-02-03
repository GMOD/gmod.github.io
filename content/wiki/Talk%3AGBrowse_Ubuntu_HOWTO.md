---
title: "Talk%253AGBrowse Ubuntu HOWTO"
---




<span id="top"></span>




# <span dir="auto">Talk%253AGBrowse Ubuntu HOWTO</span>









I don't want to add this to the official doc, but I think somebody who
understands the pre-req's better could cull my list of packages down to
the correct set.

From the instructions on the page, I didn't have success. I went on to
use this set of packages (from <a
href="http://www.bioperl.org/wiki/Installing_BioPerl_on_Ubuntu_Server"
class="external free"
rel="nofollow">http://www.bioperl.org/wiki/Installing_BioPerl_on_Ubuntu_Server</a>):

    lynx unzip zip ncftp gcc libc6-dev make mysql-server apache2
    perl libgd-gd2-perl libcgi-session-perl libclass-base-perl

and threw this package in for good measure:

    libmodule-build-perl

...and it worked!

I'm tempted to add everything here (other than lynx) to the package list
on the page, but I suspect it might include more packages than are
really necessary.

  

------------------------------------------------------------------------

When I installed GBrowse using the script gbrowse_netinstall.pl, I got
the error message as follows;

    Force getting a BioPerl nightly build; the most recent release is too old

    *** Installing BioPerl ***
    Downloading bioperl-live...
    Failed to get nightly bioperl-live file: 

The reason of the error is the typo in a line of the
gbrowse_netinstall.pl script

               my $url = BIOPERL_LIVE_URL."/$filename";

must be changed to

               my $url = BIOPERL_LIVE_URL."$filename";

Then, the script can download the nightly bioperl-live file correctly
and install it.

--Mgenome
09:56, 18 March 2009 (UTC)








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




- <span id="footer-info-lastmod">Last updated at 09:56 on 18 March
  2009.</span>
<!-- - <span id="footer-info-viewcount">7,830 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





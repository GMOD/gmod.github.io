---
title: "Common Problems with GBrowse2 Installation"
---




<span id="top"></span>




# <span dir="auto">Common Problems with GBrowse2 Installation</span>









Here are some common problems.

GBrowse loads, but the fonts and colors are wrong, and none of the click or drag options works.  
This happens when GBrowse can't find its css and/or javascript files. To
confirm, check the server error log. You will see messages about missing
.css and .js files. Check and correct the **url_base** setting in
GBrowse.conf. This can sometimes happen when you tell the installer to
put GBrowse's htdocs files in a non-standard location.

<!-- -->

When upgrading from an earlier version of GBrowse2, you get an "Internal Server Error" message and the server error log complains about a "Deparse" error.  
This is caused by the GBrowse2 config file parsing and caching system,
which speeds up loading of large config files. Perl can't correctly
cache certain complex callbacks. To fix this problem, try to isolate
which callback(s) are causing the problem and rewrite them to be
standard sub {} callbacks. If nothing else works, edit the Apache config
file to set the environment variable GBROWSE_NOCACHE to a true value
(such as "1") and restart the server. This will disable the caching
system.

More information on this: for standard CGI installs, find the Apache
config file that contains GBrowse configuration information (often in
/etc/apache2/conf.d/gbrowse2.conf), and add a SetEnv directive. E.g.

    <Directory "/usr/lib/cgi-bin/gb2">
     SetEnv GBROWSE_NOCACHE "1"
     SetEnv GBROWSE_CONF   "/etc/gbrowse2"  # this should already be there
    </Directory>

For mod_fcgid:

    DefaultInitEnv GBROWSE_NOCACHE "1"

For mod_fastcgi:

    FastCGIConfig -initial-env GBROWSE_NOCACHE=1








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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Common_Problems_with_GBrowse2_Installation"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 02:12 on 25 May
  2010.</span>
<!-- - <span id="footer-info-viewcount">13,214 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





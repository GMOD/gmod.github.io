---
title: "Recompiling mod fcgid to avoid truncated Perl library paths"
---




<span id="top"></span>




# <span dir="auto">Recompiling mod fcgid to avoid truncated Perl library paths</span>









Apache's
<a href="http://httpd.apache.org/mod_fcgid/" class="external text"
rel="nofollow">mod_fcgid</a> has many feature and performance advantages
over the older mod_fastcgi, but has one major gotcha. Many people will
install custom Perl libraries in non-standard locations, and then use
the PERL5LIB environment variable to point GBrowse at those locations.
The way to set environment variables for fcgid scripts is to use
FcgidInitialEnv (or DefaultInitEnv in older versions of mod_fcgid) in
the apache configuration file:

     # from /etc/apache2/conf.d/gbrowse2.conf
     Alias /fgb2 "/usr/lib/cgi-bin/gb2"
     <Location /fgb2>
       SetHandler   fcgid-script
       Options      ExecCGI
     </Location>
     IdleTimeout    300
     FcgidInitialEnv GBROWSE_CONF /etc/gbrowse2
     FcgidInitialEnv PERL5LIB /home/lstein/projects/Bio-Graphics/trunk/lib:/home/lstein/projects/bioperl-
     live:/home/lstein/projects/Generic-Genome-Browser-Trunk/lib:/home/lstein/projects/Bio-
     BigFile/lib:/home/lstein/projects/Bio-BigFile/blib/arch

Unfortunately, you will find that PERL5LIB is truncated at 127
characters, causing Perl to complain that some libraries are missing and
possibly causing an Internal Server Error.

The problem is that mod_fcgid limits environment variables to 127
characters and will truncate their values if they exceed this. To fix
this problem, you must get the source, modify one line of a header file,
reinstall the module. Here is the recipe:

    1% wget http://apache.sunsite.ualberta.ca/httpd/mod_fcgid/mod_fcgid-2.3.6.tar.gz
    2% tar zxvf mod_fcgid-2.3.6.tar.gz
    3% cd mod_fcgid-2.3.6
    4% perl -pi.bak -e 's/INITENV_VAL_LEN 128/INITENV_VAL_LEN 512/' modules/fcgid/fcgid_conf.h
    5% APXS=/usr/bin/apxs2 ./configure.apxs
    6% make
    7% sudo make install

Line 5 requires you to set the APXS environment variable to indicate
where Apache's apxs2 compiler is located. Please change it to match
where apxs2 is installed on your system. If you don't have apxs2, then
you may need to install the development version of Apache. After
reinstalling mod_fcgid, please restart Apache.








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

- <span id="t-smwbrowselink"><a
  href="Special%253ABrowse/Recompiling_mod_fcgid_to_avoid_truncated_Perl_library_paths"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 03:47 on 16 February
  2011.</span>
<!-- - <span id="footer-info-viewcount">13,229 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





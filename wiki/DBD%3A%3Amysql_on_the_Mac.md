



<span id="top"></span>




# <span dir="auto">DBD::mysql on the Mac</span>









## <span id="Problems_in_the_CPAN_installer" class="mw-headline">Problems in the CPAN installer</span>

This may have been fixed, but as of August 1, 2007: The CPAN installer
for DBD::mysql fails due to inability to find the proper locations for
various mysql configuration files. Some possible solutions are on <a
href="http://jayallen.org/journey/2006/04/dbd-mysql-build-problems-on-mac-book-pro"
class="external text" rel="nofollow">Jay Allen's blog</a>.

On a new Mac mini, getting this to work involved the manual rebuild
described in the post, and making a symlink to the config as described
in the comments.

- *Typically, installing DBD\* modules via the cpan shell is difficult,
  as tests will frequently require a connection to the database via a
  non-root account (that is, your real account that has permission to
  read, write and create databases). The stuff that Jay Allen mentioned
  about having to set lib and include directories should be handled
  properly by the* perl Makefile.PL *command, but apparently not in this
  case.* [Scott](User%253AScott "User%253AScott") 13:49, 6 August 2007 (EDT)




[Categories](Special%253ACategories "Special%253ACategories"):

- [Mac OS X](Category%253AMac_OS_X "Category%253AMac OS X")
- [MySQL](Category%253AMySQL "Category%253AMySQL")
- [Perl](Category%253APerl "Category%253APerl")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/DBD%253A%253Amysql_on_the_Mac" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:54 on 23 January
  2008.</span>
<!-- - <span id="footer-info-viewcount">12,816 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





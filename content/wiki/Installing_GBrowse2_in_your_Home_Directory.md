---
title: "Installing GBrowse2 in your Home Directory"
---
<span id="top"></span>

# <span dir="auto">Installing GBrowse2 in your Home Directory</span>

OK. This isn't as hard as most people seem to blather on about. The key
is _understanding_. If you don't want to grok Perl, you should be
talking to your sysadmin right now. Go on... click back right now and go
get help!

First, install 'local::lib' <a
href="http://search.cpan.org/~mstrout/local-lib-1.006000/lib/local/lib.pm"
class="external autonumber" rel="nofollow">[1]</a> (assuming you haven't
done that already). It is important that you understand this step in all
it's Perlish detail, otherwise you're not going to understand anything
that follows. We're going to be relying heavily on the 'cpan' installer
(as a non-root user). The magical local::lib is the Perl module designed
to let us do that! Before installing local::lib, You may want to scratch
any ~/.cpan or ~/perl5 stuff you have half-heartedly installed to date.
The magical local::lib is going to help you do that right.

Once you have local::lib correctly installed...

_I believe there must be a trick to configuring cpan at this point that
is left out of this narrative. It is probably in the lib::local docs._
[Scott](User%253AScott "User%253AScott") 18:47, 3 June 2011 (UTC)

Test that cpan is working for you as a non-root user (install a random
module or two).

Second, install BioPerl via cpan
<a href="http://bioperl.org" class="external autonumber"
rel="nofollow">[2]</a>. This can be painful. The best trick is to
install all the dependencies first, then install BioPerl.

Third, follow the GBrowse install instructions (using cpan
again)<a href="GBrowse_2.0_HOWTO" class="external autonumber"
rel="nofollow">[3]</a>. It should be easy to grab any prerequisites
(using cpan).

Finally, the trick is to specify 'user' locations for all the
directories that GBrowse expects: Here are some notes I made to help me
keep track of that:

    conf for example /etc/gbrowse2
    /home/dan/httpd/conf/gbrowse2

    htdocs for example /var/www/html/gbrowse2
    /home/dan/httpd/htdocs/gbrowse2

    tmp for example /var/tmp/gbrowse2
    /home/dan/httpd/tmp

    databases for example /var/www/html/gbrowse2/databases
    /home/dan/httpd/htdocs/gbrowse2/databases

    cgibin for example /var/www/cgi-bin/gb2
    /home/dan/httpd/cgi-bin/gbrowse2

    modules for example /etc/httpd/modules
    /etc/httpd/modules # /homes/dan/httpd/modules

    wwwuser for example www-data
    dan

I forgot to mention, installing Apache is beyond the scope of this
HOWTO.

[Categories](Special%253ACategories "Special%253ACategories"):

- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
- [BioPerl](Category%253ABioPerl "Category%253ABioPerl")
- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")
- [GBrowse 2](Category%253AGBrowse_2 "Category%253AGBrowse 2")
- [Help](Category%253AHelp "Category%253AHelp")
- [Pages with problems or
  questions](Category%253APages_with_problems_or_questions "Category%253APages with problems or questions")
- [Perl](Category%253APerl "Category%253APerl")
- [Tutorials](Category%253ATutorials "Category%253ATutorials")
- [User
  Experiences](Category%253AUser_Experiences "Category%253AUser Experiences")

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Installing_GBrowse2_in_your_Home_Directory"
  rel="smw-browse">Browse properties</a></span>

- <span id="footer-info-lastmod">Last updated at 18:47 on 3 June 2011.</span>
<!-- - <span id="footer-info-viewcount">20,776 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

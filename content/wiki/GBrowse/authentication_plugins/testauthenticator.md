---
title: "Gbrowse/authentication plugins/testauthenticator"
---




<span id="top"></span>




# <span dir="auto">Gbrowse/authentication plugins/testauthenticator</span>









The TestAuthenticator plugin is used for testing the GBrowse
authentication system. The entire module's code looks like this:


``` de1
 package Bio::Graphics::Browser2::Plugin::TestAuthenticator;
 use strict;
 use base 'Bio::Graphics::Browser2::Plugin::AuthPlugin';
 
 sub authenticate {
    my $self = shift;
    my ($name,$password) = $self->credentials;
    return unless $name eq 'lincoln' && $password eq 'foobar';
    return ($name,'Lincoln Stein');  # username, fullname
 }
 
 1;
```


The idea is very simple. The module inherits from
Bio::Graphics::Browser2::Plugin::AuthPlugin, a "template" module that
does the hard work. It then overrides the authenticate() method, which
does the actual matching of username and password. The call to
\$self-\>credentials() returns a username and password previously
entered into the login dialog box. We return false unless the username
is "lincoln" and the password is "foobar". Otherwise, we return a
two-element list consisting of the username and the user's full name.

Run **perldoc Bio::Graphics::Browser2::Plugin::AuthPlugin** for
information on how to write more sophisticated authentication plugins.




[Categories](../../Special%253ACategories "Special%253ACategories"):

- [GBrowse](../../Category%253AGBrowse "Category%253AGBrowse")
- [GBrowse
  Plugins](../../Category%253AGBrowse_Plugins "Category%253AGBrowse Plugins")






## Navigation menu







<a href="../../Main_Page"
style="background-image: url(../../../images/GMOD-cogs.png);"
title="Visit the main page"></a>


### Navigation



- <span id="n-GMOD-Home">[GMOD Home](../../Main_Page)</span>
- <span id="n-Software">[Software](../../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../../Special:AllPages)</span>




### Documentation



- <span id="n-Overview">[Overview](../../Overview)</span>
- <span id="n-FAQs">[FAQs](../../Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../../Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](../../Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](../../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD
  Promotion](../../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../../Meetings)</span>
- <span id="n-Calendar">[Calendar](../../Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a
  href="../../Special%253ABrowse/Gbrowse-2Fauthentication_plugins-2Ftestauthenticator"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:06 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">16,383 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





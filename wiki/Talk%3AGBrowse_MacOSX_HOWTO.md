



<span id="top"></span>




# <span dir="auto">Talk%253AGBrowse MacOSX HOWTO</span>









## <span id="Defaults_in_the_net_installer" class="mw-headline">Defaults in the net installer</span>

The net installer claims that going with the defaults should be just
fine, but I think a caveat should be added... especially on this page
where fink is described as the simplest way to install gbrowse's
prereqs. For example, /sw/lib would be the appropriate choice for the
first question during the script (where is libgd) rather than /usr/lib.
--[Stewarta](User%253AStewarta "User%253AStewarta") 13:14, 29 August 2007 (EDT)

*Good point; the comment about using the defaults is really referring to
the defaults for the GBrowse install proper, as opposed to the
prerequisites that get installed before GBrowse does (like GD.pm). I'll
see if I can craft a clearer explanation both in the installer script
and the MacOSX specific page. Thanks!* [Scott](User%253AScott "User%253AScott")
13:30, 29 August 2007 (EDT)

Another thing to consider is "path". This only worked for me with
non-fink perl (and who knows what else). Be default I use fink-enabled
binaries first. I had to re-order my path so that fink (as well as
darwin-ports) didn't come up. Its a little confusing since we use fink
to install the other stuff. Hope this helps Nathan 7
January 2009

## <span id="LWP::Simple_on_Tiger" class="mw-headline">LWP::Simple on Tiger</span>

I had to install LWP::Simple on Tiger via CPAN (error message: Can't
find LWP/Simple in @INC...):

% sudo cpan -i LWP::Simple

If cpan is not properly installed try

% sudo cpan install Bundle::CPAN

*I just tried using the net installer on a fresh install of Leopard and
it worked fine. Unfortunately, I don't have a Tiger install disk around
to do testing on, so I can't modify the gbrowse installer. I will add a
note about needing LWP::Simple to the mac install page though.*
[Scott](User%253AScott "User%253AScott") 17:10, 19 August 2008 (UTC)








## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AGBrowse_MacOSX_HOWTO" accesskey="t"
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




- <span id="footer-info-lastmod">Last updated at 23:07 on 7 January
  2009.</span>
<!-- - <span id="footer-info-viewcount">8,995 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->









<span id="top"></span>




# <span dir="auto">Talk%253AGBrowse Install HOWTO</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Layout</span>](#Layout)
- [<span class="tocnumber">2</span> <span class="toctext">Question about
  gbrowse_netinstall.pl</span>](#Question_about_gbrowse_netinstall.pl)
- [<span class="tocnumber">3</span> <span class="toctext">CPAN as
  non-root?</span>](#CPAN_as_non-root.3F)
- [<span class="tocnumber">4</span> <span class="toctext">Question about
  **Optional Perl
  modules**</span>](#Question_about_Optional_Perl_modules)
- [<span class="tocnumber">5</span> <span class="toctext">GBrowse Quick
  Install</span>](#GBrowse_Quick_Install)



## <span id="Layout" class="mw-headline">Layout</span>

It would be good if the content of this page could be re-organized, as
it seems to jump around a bit, and I think several sections could be
placed on other (sub) pages. I'd do it... but I'm lazy, no wait, what I
mean is that I don't want to start cutting and hacking away before I
know what I am doing. --[DanBolser](User%253ADanBolser "User%253ADanBolser")
12:21, 28 October 2008 (UTC)

  

## <span id="Question_about_gbrowse_netinstall.pl" class="mw-headline">Question about gbrowse_netinstall.pl</span>

Looking at:

<a
href="http://gmod.cvs.sourceforge.net/*checkout*/gmod/Generic-Genome-Browser/bin/gbrowse_netinstall.pl"
class="external free"
rel="nofollow">http://gmod.cvs.sourceforge.net/*checkout*/gmod/Generic-Genome-Browser/bin/gbrowse_netinstall.pl</a>

  
I wonder if its possible to install 'non-root' using this PL? Seems like
appropriate use of the '--install_param_str' could allow a non-root
install via this package... would it be something like

    perl gbrowse_netinstall.pl --install_param_str PREFIX=~/build

  

At least part of the answer to this question is: "Yes, you can use
gbrowse_netinstall.pl as 'non-root', however, you should have your cpan
configuration set up so that you can install Perl modules as a non-root
user. It seems that mostly gbrowse_netinstall.pl uses cpan, so lets
see... --[DanBolser](User%253ADanBolser "User%253ADanBolser") 15:00, 28 October
2008 (UTC)

  

I found this error so far... Using the following command:

    ./gbrowse_netinstall.pl -d --install_param_str="PREFIX=~/test"

    Manifying blib/lib/Bio/DB/Qual.pm -> blib/libdoc/Bio::DB::Qual.3pm
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ERROR: Can't create '/usr/bin'
    Do not have write permissions on '/usr/bin'
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      at /tmp/vbXS2SeDDc/bioperl-live/ModuleBuildBioperl.pm line 812

    *** Installing Generic-Genome-Browser ***

## <span id="CPAN_as_non-root.3F" class="mw-headline">CPAN as non-root?</span>

See: <a href="http://sial.org/howto/perl/life-with-cpan/non-root/"
class="external free"
rel="nofollow">http://sial.org/howto/perl/life-with-cpan/non-root/</a>

More importantly see:
<a href="http://search.cpan.org/search?query=local-lib"
class="external free"
rel="nofollow">http://search.cpan.org/search?query=local-lib</a>
--[DanBolser](User%253ADanBolser "User%253ADanBolser") 15:36, 14 January 2009
(UTC)

## <span id="Question_about_Optional_Perl_modules" class="mw-headline">Question about **Optional Perl modules**</span>

Are the Bio:: Perl modules listed in this section not part of BioPerl?
Why are these modules listed separately from BioPerl?
--[DanBolser](User%253ADanBolser "User%253ADanBolser") 15:35, 14 January 2009
(UTC)

## <span id="GBrowse_Quick_Install" class="mw-headline">GBrowse Quick Install</span>

Assuming:

- You have Apache installed and working in a way in which you understand
  ...
- You have Perl and BioPerl installed ...

<!-- -->

    # Local Perl modules:
    # /opt/perl/5.8.8/lib/perl5/

    # Local BioPerl modules:
    # /opt/bioperl/bioperl-live/lib/perl5/

    export PERL5LIB=/opt/perl/5.8.8/lib/perl5:/opt/bioperl/bioperl-live/lib/perl5

    perl Makefile.PL \
      NOROOT=1 \
      SELINUX=1 \
      APACHE=$HOME/httpd \
      GBROWSE_ROOT=gbrowse \
      LIB=$HOME/perl5/lib/perl5

    ## Apparently unused
      BIN=$HOME/perl5/bin

--[DanBolser](User%253ADanBolser "User%253ADanBolser") 13:35, 16 January 2009
(UTC)








## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AGBrowse_Install_HOWTO" accesskey="t"
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




- <span id="footer-info-lastmod">Last updated at 13:35 on 16 January
  2009.</span>
<!-- - <span id="footer-info-viewcount">15,091 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





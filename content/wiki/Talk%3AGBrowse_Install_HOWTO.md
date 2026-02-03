---
title: "Talk%253AGBrowse Install HOWTO"
---
# Talk%253AGBrowse Install HOWTO


  Layout](#Layout)
- [Question about
  gbrowse_netinstall.pl](#Question_about_gbrowse_netinstall.pl)
- [CPAN as
  non-root?](#CPAN_as_non-root.3F)
- [Question about
  **Optional Perl
  modules**](#Question_about_Optional_Perl_modules)
- [GBrowse Quick
  Install](#GBrowse_Quick_Install)


## Layout

It would be good if the content of this page could be re-organized, as
it seems to jump around a bit, and I think several sections could be
placed on other (sub) pages. I'd do it... but I'm lazy, no wait, what I
mean is that I don't want to start cutting and hacking away before I
know what I am doing. --[DanBolser](User%253ADanBolser "User%253ADanBolser")
12:21, 28 October 2008 (UTC)

  

## Question about gbrowse_netinstall.pl

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

## CPAN as non-root?

See: <a href="http://sial.org/howto/perl/life-with-cpan/non-root/"
class="external free"
rel="nofollow">http://sial.org/howto/perl/life-with-cpan/non-root/</a>

More importantly see:
<a href="http://search.cpan.org/search?query=local-lib"
class="external free"
rel="nofollow">http://search.cpan.org/search?query=local-lib</a>
--[DanBolser](User%253ADanBolser "User%253ADanBolser") 15:36, 14 January 2009
(UTC)

## Question about **Optional Perl modules**

Are the Bio:: Perl modules listed in this section not part of BioPerl?
Why are these modules listed separately from BioPerl?
--[DanBolser](User%253ADanBolser "User%253ADanBolser") 15:35, 14 January 2009
(UTC)

## GBrowse Quick Install

Assuming:

- You have Apache installed and working in a way in which you understand
  ...
- You have Perl and BioPerl installed ...
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

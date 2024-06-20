<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>

<div id="siteNotice">

<div id="localNotice" lang="en" dir="ltr">



</div>

</div>

# <span dir="auto">GBrowse karyotype ideogram.pl</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

# <span id="How_to_get_cytoband_data_for_the_ideogram_glyph_of_GBrowse_karyotype" class="mw-headline">How to get cytoband data for the ideogram glyph of [GBrowse_karyotype](GBrowse_karyotype "GBrowse karyotype")</span>

## <span id="perl_script" class="mw-headline">perl script</span>

- Cytoband data for the human genome and also for other species is in
  the ensembl database.
- Below is a perl script that can be used to grab the cytoband data from
  ensembl's public ftp server at ensembldb.ensembl.org.
- It is included with the GBrowse_karyotype distribution

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="perl source-perl">

``` de1
#!/usr/bin/perl -w
use strict;
use DBI;
 
my $database = shift;
 
unless ($database) {
  print "No database specified: Usage: ./get_ensembl_cytoband_data.pl database\n";
  print "This is a list of ensembl databases\n";
  open IN, "mysql -uanonymous -hensembldb.ensembl.org -e 'show databases' | grep core | grep -v 'expression' |";
  my @string;
  while (<IN>) {
    chomp;
    push @string, $_;
    if (@string == 4) {
      print join("\t", @string), "\n";
      @string = ();
    }
  }
 
  print join("\t", @string), "\n" if @string;
  exit;
}
 
my $host     = 'ensembldb.ensembl.org';
my $query    =
'SELECT name,seq_region_start,seq_region_end,band,stain
 FROM seq_region,karyotype
 WHERE seq_region.seq_region_id = karyotype.seq_region_id;';
 
 
my $dbh = DBI->connect( "dbi:mysql:$database:$host", 'anonymous' )
    or die DBI->errstr;
 
my $sth = $dbh->prepare($query) or die $dbh->errstr;
$sth->execute or die $sth->errstr;
 
my ($cent_start,$prev_chr,$chr_end,$segments,$gff,$chroms);
my $chr_start = 1;
while (my @band = $sth->fetchrow_array ) {
  my ($chr,$start,$end,$band,$stain) = @band;
  my $class = 'Chromosome';
  my $method;
 
  $chr =~ s/chr//;
  if ($stain eq 'acen' && !$cent_start) {
    $cent_start = $start;
    next;
  }
  elsif ($cent_start) {
    $method = 'centromere';
    $band   = "$chr\_cent";
    $start  = $cent_start;
    $stain  = '';
    $cent_start = 0;
  }
  else {
    $method = 'chromosome_band';
  }
 
  $gff .= join("\t", $chr, 'ensembl', lc $method, $start, $end,
               qw/. . ./,qq{Parent=$chr;Name=$band;Alias=$band});
  $gff .= $stain ? ";stain=$stain\n" : "\n";
 
  if ($prev_chr && $prev_chr !~ /$chr/) {
    $segments .= "\#\#sequence-region $prev_chr $chr_start $chr_end\n";
    $chroms   .=join( "\t",
                      $prev_chr,
                      qw/ensembl chromosome/,
                      $chr_start,
                      $chr_end,
                      qw/. . ./,
                      "ID=$prev_chr")."\n";
    $chr_start = 1;
  }
 
  $prev_chr = $chr;
  $chr_end  = $end;
}
 
if (!$gff) {
  print "\nSorry, there are no cytoband data for $database\n\n";
  exit;
}
 
$segments .= "\#\#sequence-region $prev_chr $chr_start $chr_end\n";
$chroms   .=join( "\t",
                  $prev_chr,
                  qw/ensembl chromosome/,
                  $chr_start,
                  $chr_end,
                  qw/. . ./,
                  "ID=$prev_chr")."\n";
 
print "##gff-version 3\n";
print "#Source ENSEMBL database: $database\n";
print $segments,$chroms,$gff;
```

</div>

</div>

## <span id="Other_information" class="mw-headline">Other information</span>

- Currently ideograms for human, rat and mouse are available
- To see the current database list, try the command:

<!-- -->

    mysql -uanonymous -hensembldb.ensembl.org -e 'show databases' \
    | grep core | grep 'sapiens\|rattus\|mus' | grep -v 'expression'

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=GBrowse_karyotype_ideogram.pl&oldid=22104>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](Special:Categories "Special:Categories"):

- [Database Tools](Category:Database_Tools "Category:Database Tools")
- [HOWTO](Category:HOWTO "Category:HOWTO")
- [GMOD Developers](Category:GMOD_Developers "Category:GMOD Developers")

</div>

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">

<div id="p-personal" role="navigation"
aria-labelledby="p-personal-label">

### Personal tools

- <span id="pt-login"><a
  href="http://gmod.org/mediawiki/index.php?title=Special:UserLogin&amp;returnto=GBrowse+karyotype+ideogram.pl"
  accesskey="o"
  title="You are encouraged to log in; however, it is not mandatory [o]">Log
  in / create account</a></span>

</div>

<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces

- <span id="ca-nstab-main"><a href="GBrowse_karyotype_ideogram.pl" accesskey="c"
  title="View the content page [c]">Page</a></span>
- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:GBrowse_karyotype_ideogram.pl&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>

<div id="right-navigation">

<div id="p-views" class="vectorTabs" role="navigation"
aria-labelledby="p-views-label">

### Views

- <span id="ca-view">[Read](GBrowse_karyotype_ideogram.pl)</span>
- <span id="ca-viewsource"><a
  href="http://gmod.org/mediawiki/index.php?title=GBrowse_karyotype_ideogram.pl&amp;action=edit"
  accesskey="e" title="This page is protected.
  You can view its source [e]">View source</a></span>
- <span id="ca-history"><a
  href="http://gmod.org/mediawiki/index.php?title=GBrowse_karyotype_ideogram.pl&amp;action=history"
  accesskey="h" title="Past revisions of this page [h]">View history</a></span>

</div>

<div id="p-cactions" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-cactions-label">

### Actions[](#)

<div class="menu">

</div>

</div>

<div id="p-search" role="search">

### Search

<div id="simpleSearch">

</div>

</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>
- <span id="n-View-all-pages">[View all pages](Special:AllPages)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category:FAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category:HOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">

- <span id="t-whatlinkshere"><a href="Special:WhatLinksHere/GBrowse_karyotype_ideogram.pl"
  accesskey="j" title="A list of all wiki pages that link here [j]">What
  links here</a></span>
- <span id="t-recentchangeslinked"><a href="Special:RecentChangesLinked/GBrowse_karyotype_ideogram.pl"
  accesskey="k"
  title="Recent changes in pages linked from this page [k]">Related
  changes</a></span>
- <span id="t-specialpages"><a href="Special:SpecialPages" accesskey="q"
  title="A list of all special pages [q]">Special pages</a></span>
- <span id="t-print"><a
  href="http://gmod.org/mediawiki/index.php?title=GBrowse_karyotype_ideogram.pl&amp;printable=yes"
  rel="alternate" accesskey="p"
  title="Printable version of this page [p]">Printable version</a></span>
- <span id="t-permalink">[Permanent
  link](http://gmod.org/mediawiki/index.php?title=GBrowse_karyotype_ideogram.pl&oldid=22104 "Permanent link to this revision of the page")</span>
- <span id="t-info">[Page
  information](http://gmod.org/mediawiki/index.php?title=GBrowse_karyotype_ideogram.pl&action=info)</span>
- <span id="t-smwbrowselink"><a href="Special:Browse/GBrowse_karyotype_ideogram.pl"
  rel="smw-browse">Browse properties</a></span>
- <span id="t-pdf">[Print as
  PDF](http://gmod.org/mediawiki/index.php?title=Special:PdfPrint&page=GBrowse_karyotype_ideogram.pl)</span>

</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 20:06 on 8 October
  2012.</span>
- <span id="footer-info-viewcount">38,107 page views.</span>
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->

- <span id="footer-copyrightico">[<img src="http://www.gnu.org/graphics/gfdl-logo-small.png" width="88"
  height="31" alt="a GNU Free Documentation License" />](http://www.gnu.org/licenses/fdl-1.3.html)</span>
- <span id="footer-poweredbyico">[<img
  src="../mediawiki/skins/common/images/poweredby_mediawiki_88x31.png"
  width="88" height="31" alt="Powered by MediaWiki" />](http://www.mediawiki.org/)
  [<img
  src="../mediawiki/extensions/SemanticMediaWiki/resources/images/smw_button.png"
  width="88" height="31" alt="Powered by Semantic MediaWiki" />](https://www.semantic-mediawiki.org/wiki/Semantic_MediaWiki)</span>

<div style="clear:both">

</div>

</div>

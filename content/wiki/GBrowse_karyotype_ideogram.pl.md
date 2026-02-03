---
title: "GBrowse karyotype ideogram.pl"
---




<span id="top"></span>




# <span dir="auto">GBrowse karyotype ideogram.pl</span>









# <span id="How_to_get_cytoband_data_for_the_ideogram_glyph_of_GBrowse_karyotype" class="mw-headline">How to get cytoband data for the ideogram glyph of [GBrowse_karyotype](GBrowse_karyotype "GBrowse karyotype")</span>

## <span id="perl_script" class="mw-headline">perl script</span>

- Cytoband data for the human genome and also for other species is in
  the ensembl database.
- Below is a perl script that can be used to grab the cytoband data from
  ensembl's public ftp server at ensembldb.ensembl.org.
- It is included with the GBrowse_karyotype distribution


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


## <span id="Other_information" class="mw-headline">Other information</span>

- Currently ideograms for human, rat and mouse are available
- To see the current database list, try the command:

<!-- -->

    mysql -uanonymous -hensembldb.ensembl.org -e 'show databases' \
    | grep core | grep 'sapiens\|rattus\|mus' | grep -v 'expression'




[Categories](Special%253ACategories "Special%253ACategories"):

- [Database Tools](Category%253ADatabase_Tools "Category%253ADatabase Tools")
- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")
- [GMOD Developers](Category%253AGMOD_Developers "Category%253AGMOD Developers")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse_karyotype_ideogram.pl"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:06 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">38,107 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





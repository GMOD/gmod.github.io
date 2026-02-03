---
title: "GBrowse (DasI) Presentation"
---
# GBrowse (DasI) Presentation

This Wiki page is an edited version of
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d8/DasI_middleware.pdf" class="internal"
title="DasI middleware.pdf">Scott's presentation</a>.

  database</span>](#Create_the_database)
- [Problem 1 -
  Loading Data](#Problem_1_-_Loading_Data)
- [Adaptor
  Components](#Adaptor_Components)
- [Use
  Bio::DB::Das::Chado](#Use_Bio::DB::Das::Chado)
- [Problem 2 -
  Use Some Accessors](#Problem_2_-_Use_Some_Accessors)
- [Bulk
  Output](#Bulk_Output)
- [Advantages](#Advantages)
- [Conclusion](#Conclusion)

##### Create the database

    $ perl Makefile.PL
    $ make
    $ sudo make install
    $ make load_schema
    $ make prepdb             # now with Xenopus!
    $ make ontologies        # load rel, SO, featureprop

##### Problem 1 - Loading Data

Create some [GFF3](/wiki/GFF3) from the specifications:

    fake_chromosome example chromosome 1  15017 .  .  . ID=fake_chromosome;Name=fake_chromosome
    fake_chromosome example gene   13691  14720 .  +  . ID=xfile;Name=xfile;Alias=mulder,scully;Note=A test gene for GMOD meeting
    fake_chromosome example mRNA   13691  14720 .  +  . ID=xfile_mRNA;Parent=xfile
    fake_chromosome example exon   13691  13767 .  +  . Parent=xfile_mRNA
    fake_chromosome example exon   14687  14720 .  +  . Parent=xfile_mRNA
    fake_chromosome example gene   12648  13136 .  +  . ID=x-men

Gene inserted as GFF3 using a standard bulk loader:

`$ gmod_bulk_load_gff3.pl -g sample.gff3`

*...lots of output...*

##### Adaptor Components

- Bio::DB::Das::Chado
  - Database connection object
- Bio::DB::Das::Chado::Segment
  - Object for any range of DNA
- Bio::DB::Das::Chado::Segment::Feature

##### Use Bio::DB::Das::Chado

``` de1
use Bio::DB::Das::Chado;

my $chado = Bio::DB::Das::Chado->new(
      -dsn => "dbi:Pg:dbname=test",
      -user=> "scott",
      -pass=> "" ) | die "no new chado";

my $gene_name = 'xfile';

my ($gene_fo) = $chado->get_features_by_name($gene_name);
```

##### Problem 2 - Use Some Accessors

``` de1
print "symbol: "      .  $gene_fo->display_name."\n";
print "synonyms: "  .  join(', ',$gene_fo->synonyms)."\n";
print "description: " . $gene_fo->notes."\n";
print "type: "        .     $gene_fo->type."\n";

my ($mRNA) = $gene_fo->sub_SeqFeature();
my @exons  = $mRNA->sub_SeqFeature();

for my $exon (@exons) {
    next unless ($exon->type->method eq 'exon');
    $exon_count++;
    print "exon$exon_count start: " . $exon->start."\n";
    print "exon$exon_count end: "  . $exon->end.  "\n";
    $cds_seq .= $exon->seq->seq; # the first seq call returns a Bio::Seq object, the second gets the DNA string from Bio::Seq
}
```

##### Bulk Output

``` de1
 my $gene_name = 'x-*';

 my @genes = $chado->get_features_by_name(
                 -name => $gene_name,
                 -class=> 'gene' );

 for my $gene (@genes) {
     print join("\t",
                $gene->feature_id,
                $gene->display_name,
                $gene->organism),"\n";
 }
```

Or see your report in [GBrowse](/wiki/GBrowse.1)

##### Advantages

- Comes 'for free' with GBrowse
  - GBrowse will run with any DasI-compatible interface
- Uses 'familiar' BioPerl idioms, very similar to widely used
  Bio::DB::GFF (though with fewer methods)

##### Conclusion

- Not suitable as a 'general'
  [middleware](/wiki/Glossary#Middleware) layer
  - May be suitable for some applications, particularly if they are
    similar to [GBrowse](/wiki/GBrowse.1) or other uses of
    Bio::DB::GFF

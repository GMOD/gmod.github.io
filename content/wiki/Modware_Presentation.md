---
title: "Modware Presentation"
---
# Modware Presentation

Eric Just, Senior Bioinformatics Scientist,
:
<a href="http://dictybase.org" class="external free"

Northwestern University. This is an edited version of
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3d/Modware.pdf" class="internal"
title="Modware.pdf">Eric's presentation</a>.

  Was Developed</span>](#Why_Modware_Was_Developed)
- [What is in the
  Feature Table?](#What_is_in_the_Feature_Table.3F)
- [Modware
  Features](#Modware_Features)
- [Architectural
  Overview](#Architectural_Overview)
- [Create and
  Insert Chromosome](#Create_and_Insert_Chromosome)
- [Problem 1 -
  Create and Insert a
  Gene](#Problem_1_-_Create_and_Insert_a_Gene)
- [Problem 1 -
  Create and Insert a
  Gene](#Problem_1_-_Create_and_Insert_a_Gene_2)
- [Problem 1 -
  Create and Insert a
  Gene](#Problem_1_-_Create_and_Insert_a_Gene_3)
- [Problem 1 -
  Create and Insert a
  Gene](#Problem_1_-_Create_and_Insert_a_Gene_4)
- [Problem 1 -
  Create mRNA BioPerl
  Object](#Problem_1_-_Create_mRNA_BioPerl_Object)
- [Problem 1 -
  Create and Insert mRNA](#Problem_1_-_Create_and_Insert_mRNA)
- [Problem 2 -
  Writing the Report](#Problem_2_-_Writing_the_Report)
- [Problem 2 -
  Writing the Report](#Problem_2_-_Writing_the_Report_2)
- [Problem 3 -
  Updating a Gene Name](#Problem_3_-_Updating_a_Gene_Name)
- [Problem 4 -
  Search and Display
  Results](#Problem_4_-_Search_and_Display_Results)
- [Problem 4 -
  Search and Display
  Results](#Problem_4_-_Search_and_Display_Results_2)
- [Problem 5 -
  Delete a Gene](#Problem_5_-_Delete_a_Gene)
- [Other Modware
  Highlights](#Other_Modware_Highlights)
- [Other Nice
  Things About Modware](#Other_Nice_Things_About_Modware)
- [Coming
  Attractions](#Coming_Attractions)
- [Discussion](#Discussion)
- [Acknowledgments](#Acknowledgments)

##### Why Modware Was Developed

- Each feature type requires different behavior
- Want to leave schema semantics out of application
- Want to leverage work done in [BioPerl](/wiki/BioPerl)
- Re-use code developed for common use cases
- DictyBase is using a superset of [Modware](/wiki/Modware)
  - Modware uses this code, but strips out all non-standard GMOD code
- Provides nice interface over stock GMOD installation

##### What is in the Feature Table?

The core of <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>

- Chromosome
- Contig
- Gene
- mRNA
- Exon
- Lots of other things - See Sequence Ontology!

##### Modware Features

- Multiple Feature classes
  - CHROMOSOME, GENE, MRNA, CONTIG
- Each class provides type specific methods
- Logic such as building exon structure of mRNA features is encapsulated
- Parent class Modware::Feature
  - Provides common methods such as name(), primary_id(), external_ids()
  - Abstract factory for various feature types
- Lazy : information is only retrieved when you ask for it, but cached
  for speedy retrieval the next time it is required
- Uses [BioPerl](/wiki/BioPerl) and its objects
  - Each different feature subclass has a bioperl() method that returns
    an appropriate BioPerl object.
  - Bioperl object manipulation used to update feature coordinates
- Subclasses provide type-specific methods
  - For example, Chromosome isn't the same as Gene which isn't the same
    as ...
- Any feature type not explicitly supported in Modware::Feature class is
  blessed as a Modware::Feature::GENERIC class
  - Has a start/stop coordinate on a genomic sequence feature (no
    structure like a transcript with exons)

##### Architectural Overview

- Object-oriented Perl interface to
  <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>
- Built on top of [Chado::AutoDBI](/wiki/Chado_AutoDBI)
- Connection handled by GMOD
- Database transactions supported
- [BioPerl](/wiki/BioPerl) used to represent and manipulate sequence
  and feature structure
- ‘Lazy’ evaluation

##### Create and Insert Chromosome

``` de1
   my $seq_io = new Bio::SeqIO(
      -file       => "../data/fake_chromosome.txt",
      -format => 'fasta'
   );

   # Bio::SeqIO will return a Bio::Seq object which
   # Modware uses as its representation
   my $seq = $seq_io->next_seq();

   my $reference_feature = new Modware::Feature(
      -type              => 'chromosome',
      -bioperl          => $seq,
      -description   => "This is a test",
      -name            => 'Fake',
      -source          => 'GMOD 2007 Demo'
   );

   # Inserts chromosome into database
   $reference_feature->insert();
```

##### Problem 1 - Create and Insert a Gene

1\) Enter the information about the following three novel genes,
including the associated mRNA structures, into your database. Print the
assigned feature_id for each inserted gene.

                            Gene Feature
                                symbol: x-ray
                                synonyms: none
                                mRNA Feature
                                    exon:
                                        start: 1703
                                        end: 1900
                                        strand: 1
                                        srcFeature_id: Id of genomic sample

##### Problem 1 - Create and Insert a Gene

1\) Enter the information about the following three novel genes,
including the associated mRNA structures, into your database. Print the
assigned feature_id for each inserted gene.

                            Gene Feature
                               symbol: x-men
                               synonyms: wolverine
                               mRNA Feature
                                   exon_1:
                                       start: 12648
                                       end: 13136
                                       strand: 1
                                       srcFeature_id:
                                           Id of genomic sample

##### Problem 1 - Create and Insert a Gene

1\) Enter the information about the following three novel genes,
including the associated mRNA structures, into your database. Print the
assigned feature_id for each inserted gene.

                         Gene Feature
                             symbol: xfile
                             synonyms: mulder, scully
                             description: A test gene for GMOD meeting
                             mRNA Feature
                                 exon_1:
                                     start: 13691
                                     end: 13767
                                     strand: 1
                                     srcFeature_id: Id of genomic sample
                                 exon_2:
                                     start: 14687
                                     end: 14720
                                      strand: 1
                                      srcFeature_id: Id of genomic sample

##### Problem 1 - Create and Insert a Gene

          symbol: xfile
                 synonyms: mulder, scully
                 description: A test gene for GMOD meeting
         …

``` de1
my $gene_feature = new Modware::Feature(
    -type             => 'gene',
    -name           => 'xfile',
    -description  => 'A test gene for GMOD meeting',
    -source         => 'GMOD 2007 Demo'
);

$gene_feature->add_synonym( 'mulder' );
$gene_feature->add_synonym( 'scully' );

# inserts object into database
$gene_feature->insert();
print 'Inserted gene with feature_id:'.$gene_feature->feature_id()."\n";
```

##### Problem 1 - Create mRNA BioPerl Object

              exon_1:
              start: 13691
              end: 13767
              strand: 1
              srcFeature_id: Id of genomic sample

              exon_2:
              start: 14687
              end: 14720
              strand: 1
              srcFeature_id: Id of genomic sample

``` de1
# First, create exon features (using Bioperl)
my $exon_1   = new Bio::SeqFeature::Gene::Exon (
   -start         => 13691,
   -end          => 13767,
   -strand      => 1,
   -is_coding => 1
);

my $exon_2   = new Bio::SeqFeature::Gene::Exon (
   -start         => 14687,
   -end          => 14720,
   -strand      => 1,
   -is_coding => 1
);

# Next, create transcript feature to 'hold' exons (using Bioperl)
my $bioperl_mrna = new Bio::SeqFeature::Gene::Transcript();

# Add exons to transcript (using Bioperl)
$bioperl_mrna->add_exon( $exon_1 );
$bioperl_mrna->add_exon( $exon_2 );
```

##### Problem 1 - Create and Insert mRNA

The BioPerl object holds the location information, but now we want to
create a Modware object and link it to the gene as well as locate it on
the chromosome.

``` de1
     # Now create Modware Feature to 'hold' bioperl object
     my $mrna_feature = new Modware::Feature(
         -type              => 'mRNA',
         -bioperl           => $bioperl_mrna,
         -source            => 'GMOD 2007 Demo',
         -reference_feature => $reference_feature
     );

     # Associate mRNA to gene (required for insertion)
     $mrna_feature->gene( $gene_feature );

    # inserts object into database
     $mrna_feature->insert();
```

##### Problem 2 - Writing the Report

2\) Retrieve and print the following report for gene xfile

       symbol: xfile
       synonyms: mulder, scully
       description: A test gene for GMOD meeting
       type: gene
       exon1 start: 13691
       exon1 end: 13767
       exon2 start: 14687
       exon2 end: 14720
       >xfile cds
       ATGGCGTTAGTATTCATGGTTACTGGTTTCGCTACTGATATCACCCAGCGTGTAGGCTGT
       GGAATCGAACACTGGTATTGTATAAATGTTTGTGAATACACTGAGAAATAA

Create new package, GMODWriter, to write the report, this package uses
Modware and Bioperl methods.

``` de1
use Modware::Gene;
use GMODWriter;

my $xfile_gene = new Modware::Gene( -name => 'xfile' );
GMODWriter->Write_gene_report( $xfile_gene );
```

- What's the difference between Modware::Gene and Modware::Feature? Gene
  is-a Feature.

##### Problem 2 - Writing the Report

2\) Retrieve and print the following report for gene xfile

- The mRNA object contains the Bioperl object
  - Why not just subclass? More flexibility the way shown here

``` de1
package GMODWriter;
sub Write_gene_report {
my ($self, $gene)      = @_;
my $symbol = $gene->name();

my @synonyms = @{ $gene->synonyms() };
my $syn_string  = join ",", @synonyms;
my $description = $gene->description();
my $type        = $gene->type();
# get features associated with the gene that are of type 'mRNA'
my ($mrna)      = grep { $_->type() eq 'mRNA' } @{ $gene->features() };
# use bioperl method to get exons from mRNA
my @exons       = $mrna->bioperl->exons_ordered();
# Modware will return a nice fasta file for you.
my $fasta       = $mrna->sequence( -type => 'cds', -format => 'fasta' );
# Now print the actual report
print "symbol: $symbol\n";
print "synonyms: $syn_string\n";
print "description: $description\n";
print "type: $type\n";

my $count = 0;
foreach my $exon (@exons ) {
   $count++;
   print "exon${count} start: ".$exon->start()."\n";

   print "exon${count} end: ".$exon->end()."\n";

  }
  print "$fasta";
}
 . . .
```

##### Problem 3 - Updating a Gene Name

3\) Update the gene xfile: change the name symbol to x-file and retrieve
the changed record. Regenerate gene report

``` de1
 use Modware::Gene;
 use Modware::DBH;
 use GMODWriter;

 eval{

    # get xfile gene
    my $xfile_gene = new Modware::Gene( -name => 'xfile' );

    # change the name
    $xfile_gene->name( 'x-file' );
     # write changes to database
    $xfile_gene->update();

    # we can use the original object if we want, but instead
    # we refetch from the database to 'prove' the name has been changed
    my $xfile_gene2 = new Modware::Gene( -name => 'x-file' );
    # use our GMODWriter package to write report for x-file
    GMODWriter->Write_gene_report( $xfile_gene2 );

 };
 if ($@){
    warn $@;
    new Modware::DBH->rollback();
 }
```

##### Problem 4 - Search and Display Results

4\) Search for all genes with symbols starting with "x-\*". With the
results produce the following simple result list (organism will vary):

       1323    x-file  Xenopus laevis
       1324    x-men   Xenopus laevis
       1325    x-ray   Xenopus laevis

``` de1
     use Modware::Gene;
     use Modware::DBH;
     use GMODWriter;

     # find genes starting with 'x-'
     my $results = Modware::Search::Gene->Search_by_name( 'x-*' );

     # write the search results
     GMODWriter->Write_search_results( $results )
```

##### Problem 4 - Search and Display Results

4\) Search for all genes with symbols starting with "x-\*". With the
results produce the following simple result list (organism will vary):

       1323    x-file  Xenopus laevis
       1324    x-men   Xenopus laevis
       1325    x-ray   Xenopus laevis

``` de1
sub Write_search_results {
  my ($self, $itr) = @_;
  # loop through iterator
  while (my $gene = $itr->next) {
    # print the requested information
    print $gene->feature_id . "\t" . $gene->name .
      "\t" . $gene->organism_name . "\n";
  }
}
```

##### Problem 5 - Delete a Gene

5\) Delete the gene x-ray. Run the search and report again.

       1323    x-file  Xenopus laevis
       1324    x-men   Xenopus laevis

``` de1
 # get the xray gene
 my $xray = new Modware::Gene( -name => 'x-ray' );

# set is_deleted = 1, this will 'hide' the gene from searches,
# also sets the is_available to 0, the gene is no longer visible
# to a search.

 $xray->is_deleted(1);

 # write change to database
 $xray->update();

 # find genes starting with 'x-'
 my $results = Modware::Search::Gene->Search_by_name( 'x-*' );

 # write the search results
 GMODWriter->Write_search_results( $results )
```

##### Other Modware Highlights

- Easy to write applications with Modware
- Extensible
- Available through Sourceforge
  - <a href="http://gmod-ware.sourceforge.net" class="external free"
    rel="nofollow">http://gmod-ware.sourceforge.net</a>
- Easy to install
- Large unit test coverage
- Current release 0.2-RC1
  - Works with GMOD’s latest release
- Sample script demoed here are available
  - sample_scripts directory

##### Other Nice Things About Modware

- Bioperl-style documentation
  - <a href="http://gmod-ware.sourceforge.net/doc/" class="external free"
    rel="nofollow">http://gmod-ware.sourceforge.net/doc/</a>
  - POD for all methods
- If <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> changes
  then...
  - Manually change [Modware](/wiki/Modware) or ...
  - [Chado::AutoDBI](/wiki/Chado_AutoDBI) will automatically
    adjust to the change, depends on the change
- Can set multiple connections through AutoDBI's `set_connection`

##### Coming Attractions

- Support for changing genomic sequence
- ncRNAs
- UTRs
- Onotology modules
- Phenotype Annotations
- Getting a new database handle returns the existing
  - Thinking about configuring modules to set what database handle can
    be used
- Pass an argument *type* to the Gene's feature() method
- Type the kind of synonym is being inserted?
  - Possible: trade-off between simplicity and functionality
- Send us your ideas!

##### Discussion

- How hard is it to extend Modware?
  - Not known absolutely, but generally thought to be not difficult

##### Acknowledgments

- Rex Chisholm, PhD
- Warren Kibbe, PhD
- [Scott Cain](/wiki/User:Scott)
- Brian O’connor
- Sohel Merchant
- Petra Fey
- Pascale Gaudet,
- Karen Pilcher
- [BioPerl](/wiki/BioPerl)
- GMOD

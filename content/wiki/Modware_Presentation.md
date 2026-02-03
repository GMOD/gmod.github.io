---
title: "Modware Presentation"
---




<span id="top"></span>




# <span dir="auto">Modware Presentation</span>









Eric Just, Senior Bioinformatics Scientist,
[dictyBase](Category%253ADictyBase "Category%253ADictyBase"):
<a href="http://dictybase.org" class="external free"
rel="nofollow">http://dictybase.org</a> Center for Genetic Medicine,
Northwestern University. This is an edited version of
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3d/Modware.pdf" class="internal"
title="Modware.pdf">Eric's presentation</a>.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Why Modware
  Was Developed</span>](#Why_Modware_Was_Developed)
- [<span class="tocnumber">2</span> <span class="toctext">What is in the
  Feature Table?</span>](#What_is_in_the_Feature_Table.3F)
- [<span class="tocnumber">3</span> <span class="toctext">Modware
  Features</span>](#Modware_Features)
- [<span class="tocnumber">4</span> <span class="toctext">Architectural
  Overview</span>](#Architectural_Overview)
- [<span class="tocnumber">5</span> <span class="toctext">Create and
  Insert Chromosome</span>](#Create_and_Insert_Chromosome)
- [<span class="tocnumber">6</span> <span class="toctext">Problem 1 -
  Create and Insert a
  Gene</span>](#Problem_1_-_Create_and_Insert_a_Gene)
- [<span class="tocnumber">7</span> <span class="toctext">Problem 1 -
  Create and Insert a
  Gene</span>](#Problem_1_-_Create_and_Insert_a_Gene_2)
- [<span class="tocnumber">8</span> <span class="toctext">Problem 1 -
  Create and Insert a
  Gene</span>](#Problem_1_-_Create_and_Insert_a_Gene_3)
- [<span class="tocnumber">9</span> <span class="toctext">Problem 1 -
  Create and Insert a
  Gene</span>](#Problem_1_-_Create_and_Insert_a_Gene_4)
- [<span class="tocnumber">10</span> <span class="toctext">Problem 1 -
  Create mRNA BioPerl
  Object</span>](#Problem_1_-_Create_mRNA_BioPerl_Object)
- [<span class="tocnumber">11</span> <span class="toctext">Problem 1 -
  Create and Insert mRNA</span>](#Problem_1_-_Create_and_Insert_mRNA)
- [<span class="tocnumber">12</span> <span class="toctext">Problem 2 -
  Writing the Report</span>](#Problem_2_-_Writing_the_Report)
- [<span class="tocnumber">13</span> <span class="toctext">Problem 2 -
  Writing the Report</span>](#Problem_2_-_Writing_the_Report_2)
- [<span class="tocnumber">14</span> <span class="toctext">Problem 3 -
  Updating a Gene Name</span>](#Problem_3_-_Updating_a_Gene_Name)
- [<span class="tocnumber">15</span> <span class="toctext">Problem 4 -
  Search and Display
  Results</span>](#Problem_4_-_Search_and_Display_Results)
- [<span class="tocnumber">16</span> <span class="toctext">Problem 4 -
  Search and Display
  Results</span>](#Problem_4_-_Search_and_Display_Results_2)
- [<span class="tocnumber">17</span> <span class="toctext">Problem 5 -
  Delete a Gene</span>](#Problem_5_-_Delete_a_Gene)
- [<span class="tocnumber">18</span> <span class="toctext">Other Modware
  Highlights</span>](#Other_Modware_Highlights)
- [<span class="tocnumber">19</span> <span class="toctext">Other Nice
  Things About Modware</span>](#Other_Nice_Things_About_Modware)
- [<span class="tocnumber">20</span> <span class="toctext">Coming
  Attractions</span>](#Coming_Attractions)
- [<span class="tocnumber">21</span>
  <span class="toctext">Discussion</span>](#Discussion)
- [<span class="tocnumber">22</span>
  <span class="toctext">Acknowledgments</span>](#Acknowledgments)



##### <span id="Why_Modware_Was_Developed" class="mw-headline">Why Modware Was Developed</span>

- Each feature type requires different behavior
- Want to leave schema semantics out of application
- Want to leverage work done in [BioPerl](BioPerl "BioPerl")
- Re-use code developed for common use cases
- DictyBase is using a superset of [Modware](Modware "Modware")
  - Modware uses this code, but strips out all non-standard GMOD code
- Provides nice interface over stock GMOD installation

##### <span id="What_is_in_the_Feature_Table.3F" class="mw-headline">What is in the Feature Table?</span>

The core of <a href="Chado" class="mw-redirect" title="Chado">Chado</a>

- Chromosome
- Contig
- Gene
- mRNA
- Exon
- Lots of other things - See Sequence Ontology!

##### <span id="Modware_Features" class="mw-headline">Modware Features</span>

- Multiple Feature classes
  - CHROMOSOME, GENE, MRNA, CONTIG
- Each class provides type specific methods
- Logic such as building exon structure of mRNA features is encapsulated
- Parent class Modware::Feature
  - Provides common methods such as name(), primary_id(), external_ids()
  - Abstract factory for various feature types
- Lazy : information is only retrieved when you ask for it, but cached
  for speedy retrieval the next time it is required
- Uses [BioPerl](BioPerl "BioPerl") and its objects
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

##### <span id="Architectural_Overview" class="mw-headline">Architectural Overview</span>

- Object-oriented Perl interface to
  <a href="Chado" class="mw-redirect" title="Chado">Chado</a>
- Built on top of [Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI")
- Connection handled by GMOD
- Database transactions supported
- [BioPerl](BioPerl "BioPerl") used to represent and manipulate sequence
  and feature structure
- ‘Lazy’ evaluation

##### <span id="Create_and_Insert_Chromosome" class="mw-headline">Create and Insert Chromosome</span>


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


  

##### <span id="Problem_1_-_Create_and_Insert_a_Gene" class="mw-headline">Problem 1 - Create and Insert a Gene</span>

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

##### <span id="Problem_1_-_Create_and_Insert_a_Gene_2" class="mw-headline">Problem 1 - Create and Insert a Gene</span>

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

##### <span id="Problem_1_-_Create_and_Insert_a_Gene_3" class="mw-headline">Problem 1 - Create and Insert a Gene</span>

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

##### <span id="Problem_1_-_Create_and_Insert_a_Gene_4" class="mw-headline">Problem 1 - Create and Insert a Gene</span>

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


##### <span id="Problem_1_-_Create_mRNA_BioPerl_Object" class="mw-headline">Problem 1 - Create mRNA BioPerl Object</span>

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


##### <span id="Problem_1_-_Create_and_Insert_mRNA" class="mw-headline">Problem 1 - Create and Insert mRNA</span>

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


##### <span id="Problem_2_-_Writing_the_Report" class="mw-headline">Problem 2 - Writing the Report</span>

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

##### <span id="Problem_2_-_Writing_the_Report_2" class="mw-headline">Problem 2 - Writing the Report</span>

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


##### <span id="Problem_3_-_Updating_a_Gene_Name" class="mw-headline">Problem 3 - Updating a Gene Name</span>

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


  

##### <span id="Problem_4_-_Search_and_Display_Results" class="mw-headline">Problem 4 - Search and Display Results</span>

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


  

##### <span id="Problem_4_-_Search_and_Display_Results_2" class="mw-headline">Problem 4 - Search and Display Results</span>

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


##### <span id="Problem_5_-_Delete_a_Gene" class="mw-headline">Problem 5 - Delete a Gene</span>

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


  

##### <span id="Other_Modware_Highlights" class="mw-headline">Other Modware Highlights</span>

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

##### <span id="Other_Nice_Things_About_Modware" class="mw-headline">Other Nice Things About Modware</span>

- Bioperl-style documentation
  - <a href="http://gmod-ware.sourceforge.net/doc/" class="external free"
    rel="nofollow">http://gmod-ware.sourceforge.net/doc/</a>
  - POD for all methods
- If <a href="Chado" class="mw-redirect" title="Chado">Chado</a> changes
  then...
  - Manually change [Modware](Modware "Modware") or ...
  - [Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI") will automatically
    adjust to the change, depends on the change
- Can set multiple connections through AutoDBI's `set_connection`

##### <span id="Coming_Attractions" class="mw-headline">Coming Attractions</span>

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

<!-- -->

- Send us your ideas!

  

##### <span id="Discussion" class="mw-headline">Discussion</span>

- How hard is it to extend Modware?
  - Not known absolutely, but generally thought to be not difficult

##### <span id="Acknowledgments" class="mw-headline">Acknowledgments</span>

- Rex Chisholm, PhD
- Warren Kibbe, PhD
- [Scott Cain](User%253AScott "User%253AScott")
- Brian O’connor
- Sohel Merchant
- Petra Fey
- Pascale Gaudet,
- Karen Pilcher

<!-- -->

- [BioPerl](BioPerl "BioPerl")
- GMOD
- [SGD](Category%253ASGD "Category%253ASGD")




[Categories](Special%253ACategories "Special%253ACategories"):

- [Modware](Category%253AModware "Category%253AModware")
- [BioPerl](Category%253ABioPerl "Category%253ABioPerl")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Modware_Presentation" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:24 on 15 August
  2013.</span>
<!-- - <span id="footer-info-viewcount">25,045 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





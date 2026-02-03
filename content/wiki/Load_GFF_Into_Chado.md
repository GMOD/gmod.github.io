---
title: "Load GFF Into Chado"
---
<span id="top"></span>

# <span dir="auto">Load GFF Into Chado</span>

This [HOWTO](Category%253AHOWTO "Category%253AHOWTO") describes a method for
loading sequence annotation data in [GFF3](GFF3 "GFF3") format into a
[Chado database](Chado_-_Getting_Started "Chado - Getting Started").

## Contents

- [<span class="tocnumber">1</span> <span class="toctext">Download the
  GFF3 Files</span>](#Download_the_GFF3_Files)
- [<span class="tocnumber">2</span> <span class="toctext">Add an Entry
  for Your Organism</span>](#Add_an_Entry_for_Your_Organism)
- [<span class="tocnumber">3</span> <span class="toctext">Load the
  GFF3</span>](#Load_the_GFF3)
- [<span class="tocnumber">4</span> <span class="toctext">Creating GFF3
  from UniProt/SwissProt
  Files</span>](#Creating_GFF3_from_UniProt.2FSwissProt_Files)
- [<span class="tocnumber">5</span> <span class="toctext">More
  Information</span>](#More_Information)
- [<span class="tocnumber">6</span>
  <span class="toctext">Authors</span>](#Authors)

## <span id="Download_the_GFF3_Files" class="mw-headline">Download the GFF3 Files</span>

An easy way to load data into the database is to use a
[GFF3](GFF3 "GFF3") file and the script
`load/bin/gmod_bulk_load_gff3.pl`. A good set of sample data is the GFF3
file prepared by the nice folks at the [Saccharomyces Genome
Database](Category%253ASGD "Category%253ASGD"):

<a
href="http://downloads.yeastgenome.org/curation/chromosomal_feature/saccharomyces_cerevisiae.gff"
class="external free"
rel="nofollow">http://downloads.yeastgenome.org/curation/chromosomal_feature/saccharomyces_cerevisiae.gff</a>

This file contains
<a href="http://geneontology.org" class="external text"
rel="nofollow">Gene Ontology (GO)</a> annotations, so if you didn't load
GO when you executed `make ontologies` you will get many warning
messages about being unable to find entries in the
[dbxref](Chado_Tables#Table:_dbxref "Chado Tables") table. If you want
to load GO you should be able to execute `make ontologies` and select
**Gene Ontology** for installation.

## <span id="Add_an_Entry_for_Your_Organism" class="mw-headline">Add an Entry for Your Organism</span>

You will need to have an entry for your species in the [Chado organism
table](Chado_Tables#Table:_organism "Chado Tables"). To add a new
organism, run the tool that came with Chado, `gmod_add_organism.pl`

This script will ask you what information about your organism:

     Both genus and species are required; please provide them below

     Organism's genus?
     Organism's species?
     Organism's abbreviation? []
     Comment (can be empty)?

## <span id="Load_the_GFF3" class="mw-headline">Load the GFF3</span>

Unless your [GFF3](GFF3 "GFF3") is sorted by location with grouped gene
models (gene, mRNA, CDS/exon/UTR), you must first do this. Use this <a
href="http://gmod.cvs.sourceforge.net/*checkout*/gmod/schema/chado/bin/gmod_gff3_preprocessor.pl"
class="external text" rel="nofollow">gmod_gff3_preprocessor.pl</a>.

    > gmod_gff3_preprocessor.pl --gfffile saccharomyces_cerevisiae.gff --outfile saccharomyces_cerevisiae.sorted.gff

Then execute `gmod_bulk_load_gff3.pl`:

    >gmod_bulk_load_gff3.pl --organism yeast  --gfffile saccharomyces_cerevisiae.sorted.gff

This loads the [GFF3](GFF3 "GFF3") file. The loading script requires
[GFF3](GFF3 "GFF3") as it has tighter control of the syntax and requires
the use of a controlled vocabulary (from
<a href="http://sequenceontology.org" class="external text"
rel="nofollow">Sequence Ontology Feature Annotation (SOFA)</a>),
allowing mapping to the relational schema. In addition to supplying the
location of the file with the `--gfffile` flag, the `--organism` tag
uses the common name (`common_name` field) from the [Chado organism
table](Chado_Tables#Table:_organism "Chado Tables"). Do
`perldoc gmod_bulk_load_gff.pl` for more information on adding other
organisms and databases, as well as other available command line flags.

Note that `gmod_load_gff3.pl` is also available, but is limited in how
much it has been supported and in how flexible it currently is. It is a
good example of how to write code using
<a href="http://search.cpan.org/perldoc?Class::DBI"
class="external text" rel="nofollow">Class::DBI</a> classes that are
created at the time of install. For more information on using these
classes, see [Modware](Modware "Modware") for a
<a href="http://search.cpan.org/perldoc?Class::DBI"
class="external text" rel="nofollow">Class::DBI</a>-based
[middleware/API](Category%253AMiddleware "Category%253AMiddleware").

## <span id="Creating_GFF3_from_UniProt.2FSwissProt_Files" class="mw-headline">Creating GFF3 from UniProt/SwissProt Files</span>

A recent update (April 2007) to `bp_genbank2gff3.pl` extends it to
handle Swiss and EMBL format input, along with GenBank. You can now
create [GFF3](GFF3 "GFF3") entries of UniProt sequences suited to
loading into
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>, including
most of the protein description, Dbxref, and related fields useful in
annotating genome matches. Use the `--format Uniprot` flag to specify
this input format (`--format EMBL` can also be useful).

      >bp_genbank2gff3.pl --noCDS --in uniprot-subset.dat --format Uniprot
      >gmod_bulk_load_gff3.pl --database mygenome --gff  uniprot-subset.dat.gff --organism fromdata

Use the `--organism fromdata` flag to load UniProt with many organisms.

## <span id="More_Information" class="mw-headline">More Information</span>

See the related HOWTO [Load RefSeq Into
Chado](Load_RefSeq_Into_Chado "Load RefSeq Into Chado").

Please send questions to the GMOD developers list:

<a href="mailto:gmod-devel@lists.sourceforge.net" class="external text"
rel="nofollow">gmod-devel@lists.sourceforge.net</a>

Or contact the [GMOD Help Desk](GMOD_Help_Desk "GMOD Help Desk")

## <span id="Authors" class="mw-headline">Authors</span>

- [Scott Cain](User%253AScott "User%253AScott")
- <a href="http://www.bioperl.org/wiki/Brian_Osborne" class="extiw"
  title="bp:Brian Osborne">Brian Osborne</a>

[Categories](Special%253ACategories "Special%253ACategories"):

- [Needs Testing](Category%253ANeeds_Testing "Category%253ANeeds Testing")
- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")
- [Chado](Category%253AChado "Category%253AChado")

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Load_GFF_Into_Chado" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 15:43 on 20 July 2015.</span>
<!-- - <span id="footer-info-viewcount">151,008 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

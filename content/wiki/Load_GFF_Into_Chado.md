---
title: "Load GFF Into Chado"
---
# Load GFF Into Chado

This [HOWTO](/wiki/Category%3AHOWTO) describes a method for
loading sequence annotation data in [GFF3](/wiki/GFF3) format into a
[Chado database](/wiki/Chado_-_Getting_Started).

  GFF3 Files</span>](#Download_the_GFF3_Files)
- [Add an Entry
  for Your Organism](#Add_an_Entry_for_Your_Organism)
- [Load the
  GFF3](#Load_the_GFF3)
- [Creating GFF3
  from UniProt/SwissProt
  Files](#Creating_GFF3_from_UniProt.2FSwissProt_Files)
- [More
  Information](#More_Information)
- [Authors](#Authors)

## Download the GFF3 Files

An easy way to load data into the database is to use a
[GFF3](/wiki/GFF3) file and the script
`load/bin/gmod_bulk_load_gff3.pl`. A good set of sample data is the GFF3
file prepared by the nice folks at the [Saccharomyces Genome
Database](/wiki/Category%3ASGD):

<a
href="http://downloads.yeastgenome.org/curation/chromosomal_feature/saccharomyces_cerevisiae.gff"
class="external free"
rel="nofollow">http://downloads.yeastgenome.org/curation/chromosomal_feature/saccharomyces_cerevisiae.gff</a>

This file contains
<a href="http://geneontology.org" class="external text"
rel="nofollow">Gene Ontology (GO)</a> annotations, so if you didn't load
GO when you executed `make ontologies` you will get many warning
messages about being unable to find entries in the
[dbxref](/wiki/Chado_Tables#Table:_dbxref) table. If you want
to load GO you should be able to execute `make ontologies` and select
**Gene Ontology** for installation.

## Add an Entry for Your Organism

You will need to have an entry for your species in the [Chado organism
table](/wiki/Chado_Tables#Table:_organism). To add a new
organism, run the tool that came with Chado, `gmod_add_organism.pl`

This script will ask you what information about your organism:

     Both genus and species are required; please provide them below

     Organism's genus?
     Organism's species?
     Organism's abbreviation? []
     Comment (can be empty)?

## Load the GFF3

Unless your [GFF3](/wiki/GFF3) is sorted by location with grouped gene
models (gene, mRNA, CDS/exon/UTR), you must first do this. Use this <a
href="http://gmod.cvs.sourceforge.net/*checkout*/gmod/schema/chado/bin/gmod_gff3_preprocessor.pl"
class="external text" rel="nofollow">gmod_gff3_preprocessor.pl</a>.

    > gmod_gff3_preprocessor.pl --gfffile saccharomyces_cerevisiae.gff --outfile saccharomyces_cerevisiae.sorted.gff

Then execute `gmod_bulk_load_gff3.pl`:

    >gmod_bulk_load_gff3.pl --organism yeast  --gfffile saccharomyces_cerevisiae.sorted.gff

This loads the [GFF3](/wiki/GFF3) file. The loading script requires
[GFF3](/wiki/GFF3) as it has tighter control of the syntax and requires
the use of a controlled vocabulary (from
<a href="http://sequenceontology.org" class="external text"
rel="nofollow">Sequence Ontology Feature Annotation (SOFA)</a>),
allowing mapping to the relational schema. In addition to supplying the
location of the file with the `--gfffile` flag, the `--organism` tag
uses the common name (`common_name` field) from the [Chado organism
table](/wiki/Chado_Tables#Table:_organism). Do
`perldoc gmod_bulk_load_gff.pl` for more information on adding other
organisms and databases, as well as other available command line flags.

Note that `gmod_load_gff3.pl` is also available, but is limited in how
much it has been supported and in how flexible it currently is. It is a
good example of how to write code using
<a href="http://search.cpan.org/perldoc?Class::DBI"
class="external text" rel="nofollow">Class::DBI</a> classes that are
created at the time of install. For more information on using these
classes, see [Modware](/wiki/Modware) for a
<a href="http://search.cpan.org/perldoc?Class::DBI"
class="external text" rel="nofollow">Class::DBI</a>-based
[middleware/API](/wiki/Category%3AMiddleware).

## Creating GFF3 from UniProt/SwissProt Files

A recent update (April 2007) to `bp_genbank2gff3.pl` extends it to
handle Swiss and EMBL format input, along with GenBank. You can now
create [GFF3](/wiki/GFF3) entries of UniProt sequences suited to
loading into
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>, including
most of the protein description, Dbxref, and related fields useful in
annotating genome matches. Use the `--format Uniprot` flag to specify
this input format (`--format EMBL` can also be useful).

      >bp_genbank2gff3.pl --noCDS --in uniprot-subset.dat --format Uniprot
      >gmod_bulk_load_gff3.pl --database mygenome --gff  uniprot-subset.dat.gff --organism fromdata

Use the `--organism fromdata` flag to load UniProt with many organisms.

## More Information

See the related HOWTO [Load RefSeq Into
Chado](/wiki/Load_RefSeq_Into_Chado).

Please send questions to the GMOD developers list:

<a href="mailto:gmod-devel@lists.sourceforge.net" class="external text"
rel="nofollow">gmod-devel@lists.sourceforge.net</a>

Or contact the [GMOD Help Desk](/wiki/GMOD_Help_Desk)

## Authors

- [Scott Cain](/wiki/User%3AScott)
- <a href="http://www.bioperl.org/wiki/Brian_Osborne" class="extiw"
  title="bp:Brian Osborne">Brian Osborne</a>

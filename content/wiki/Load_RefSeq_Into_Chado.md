---
title: "Load RefSeq Into Chado"
---
# Load RefSeq Into Chado

This [HOWTO](/wiki/Category%3AHOWTO) describes a method for
loading the sequence data in Genbank RefSeq files into the [Chado
database](/wiki/Chado_-_Getting_Started).

  Sequence Files</span>](#Download_the_Sequence_Files)
- [Convert RefSeq
  to GFF3](#Convert_RefSeq_to_GFF3)
- [Add an Entry
  for Your Organism](#Add_an_Entry_for_Your_Organism)
- [Load the
  GFF3](#Load_the_GFF3)
- [More
  Information](#More_Information)
- [Authors](#Authors)

## Download the Sequence Files

These steps have been used to load data from genomic RefSeq files. You
can recognize these files by their `NC_` and `NT_` prefixes. First
download the Genbank genome files of interest. A good source for RefSeq
files is <a href="/wiki/ftp://ftp.ncbi.nih.gov/genomes" class="external text"
rel="nofollow">NCBI's FTP site</a>. This website provides some files in
GFF3 format (suffix `.gff`). Files in the Genbank format have the suffix
`.gbk`.

## Convert RefSeq to GFF3

Use the [BioPerl](/wiki/BioPerl) script `genbank2gff3.pl`, found in
`scripts/Bio-DB-GFF/` within the BioPerl distribution. If you've
actually installed BioPerl then the installed script will have been
renamed `bp_genbank2gff3.pl`. Note that there's also an older
`genbank2gff.pl` script, don't use it.

     >bp_genbank2gff3.pl <filename>

This will create a [GFF3](/wiki/GFF3) file. It may give several
warnings about *unrecognized feature types*. If the feature types are
not part of
<a href="http://www.sequenceontology.org/" class="external text"
rel="nofollow">SOFA</a>, you will have to hand edit the resulting
[GFF3](/wiki/GFF3) file to change the feature type. Any skipped
features will be printed at the end. If you want those to be part of the
GFF3 file, you will have to add those manually as well, fixing any
non-SOFA feature types.

## Add an Entry for Your Organism

You will need to have an entry for your species in the [Chado organism
table](/wiki/Chado_Tables#Table:_organism). If you are unsure
if this entry exists log into your database and execute this
[SQL](/wiki/Glossary#SQL) command:

``` de1
SELECT genus,species,common_name FROM organism;
```

If you do not see your organism listed, execute a command equivalent to
this:

``` de1
  INSERT INTO organism (abbreviation, genus, species, common_name)
                VALUES ('H.sapiens', 'Homo', 'sapiens', 'Human');
```

Substitute in the appropriate values for your own organism.

## Load the GFF3

Run the `load/bin/gmod_bulk_load_gff3.pl` script from the GMOD
distribution:

      >gmod_bulk_load_gff3.pl --gfffile <your gfffile>

If you didn't specify this organism when installing Chado, (in response
to the question "What is the default organism (common name, or
"none")"), then you'll need to add at least the
`--organism <common_name>` flag to the command. See
`perldoc gmod_bulk_load_gff3.pl` for an explanation of the other options
this script supports.

This will load your data into the [Chado
database](/wiki/Chado_-_Getting_Started). Note that
if there are
non-<a href="http://www.sequenceontology.org/" class="external text"
rel="nofollow">SOFA</a> feature types remaining in the GFF3 file the
load will fail when they are encountered. If that happens, edit the file
to fix the incorrect term and load again. If that happens, the load will
be stopped before the database is touched, so you won't have to worry
about duplicate data.

## More Information

Please send questions to the GMOD developers list:

<a href="mailto:gmod-devel@lists.sourceforge.net" class="external text"
rel="nofollow">gmod-devel@lists.sourceforge.net</a>



## Authors

- [Scott Cain](/wiki/User%3AScott)
- <a href="http://www.bioperl.org/wiki/Brian_Osborne" class="extiw"
  title="bp:Brian Osborne">Brian Osborne</a>

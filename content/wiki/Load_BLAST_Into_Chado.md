---
title: "Load BLAST Into Chado"
---
# Load BLAST Into Chado

  Abstract](#Abstract)
- [Have an
  existing Chado genome
  database](#Have_an_existing_Chado_genome_database)
- [Convert BLAST
  analysis to GFF3](#Convert_BLAST_analysis_to_GFF3)
  - [BLAST GFF3
    sample for Chado](#BLAST_GFF3_sample_for_Chado)
- [Load Query
  Protein sequence to Chado
  DB](#Load_Query_Protein_sequence_to_Chado_DB)
- [Load BLAST
  result GFF3 to Chado DB](#Load_BLAST_result_GFF3_to_Chado_DB)
  - [Chado
    Tables Updated](#Chado_Tables_Updated)
- [See
  also](#See_also)
- [More
  Information](#More_Information)
- [Authors](#Authors)

# Abstract

This [HOWTO](Category%253AHOWTO "Category%253AHOWTO") describes steps to add a
[BLAST](Category%253ABLAST "Category%253ABLAST") analysis to a [Chado
database](Chado_-_Getting_Started "Chado - Getting Started").

# Have an existing Chado genome database

See [Load RefSeq Into
Chado](Load_RefSeq_Into_Chado "Load RefSeq Into Chado") for advice on
how to load a GenBank Genome into a database. In the following examples,
**bp\_*scriptname*** is from [BioPerl](BioPerl "BioPerl"), and
**gmod\_*scriptname*** is from GMOD. As of this date (2007 April) you
will need current modules from the [BioPerl](BioPerl "BioPerl") Git and
<a href="SVN" class="mw-redirect" title="SVN">GMOD SVN repositories</a>
to have this example work.

# Convert BLAST analysis to GFF3

For example, match yeast proteins to your genome with tBLASTn, and
reformat to [GFF3](GFF3 "GFF3").

     $ncbi/blastall -p tblastn -i MOD_Scer.fa -d dmel4 -o dmel4-modsc.tblastn

First reformat to [GFF3](GFF3 "GFF3") with the
[BioPerl](BioPerl "BioPerl") `bp_search2gff.pl` script. The Chado policy
here is to put your program and blast query data names into the GFF3
`--source` field. The GFF3 `--method` field should always be SO term
'match_part'. You also want the `--type hit` and `--target` options.

     scripts/bp_search2gff.pl --in dmel4-modsc.tblastn \
         --out dmel4-modsc.tblastn.gff -version 3 \
         --format blast \
         --method match_part --source tBLASTn.MOD_Scer \
         --type hit --target

Finally clean up the GFF3 a bit:

      perl -pi -e 's/Target=Sequence:/Target=/' dmel4-modsc.tblastn.gff

## BLAST GFF3 sample for Chado

Result should be formatted like this:

      ##gff-version 3
      # sample tBLASTn yeast protein x fly chromosome 4 (GenBank NC_004353) matches
      # GFF formatted for loading to Chado database

      NC_004353 tBLASTn.MOD_Scer  match_part  141495  141815  48.9  - 0 Target=S000003211 43 156

      NC_004353 tBLASTn.MOD_Scer  match_part  161699  162793  217 + 0 Target=S000005817 984 1204
      NC_004353 tBLASTn.MOD_Scer  match_part  160517  161407  185 + 0 Target=S000005817 455 980
         # this is a protein match with 2 HSP parts, note the identical Target=

# Load Query Protein sequence to Chado DB

You want to have your query sequences used for BLAST, such as proteins,
for reference in your
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> db. The GMOD
script `gmod_bulk_load_gff3.pl` will handle this after converting
sequence Fasta to [GFF3](GFF3 "GFF3") format.

     gmod_fasta2gff3.pl  --type protein --source SGD --fasta MOD_Scer.fa --gff MOD_Scer.fa.gff
     gmod_bulk_load_gff3.pl --dbname my_chado_01  --organism yeast --dbxref --gff MOD_Scer.fa.gff

If your query sequence comes from UniProt or GenBank formats, you can
instead use the
` `[`bp_genbank2gff.pl`](Load_GFF_Into_Chado "Load GFF Into Chado")
script that will retain more useful annotations for your Chado database.
Then BLAST matches can be linked to many known gene/protein attributes.

# Load BLAST result GFF3 to Chado DB

Use the `gmod_bulk_load_gff3.pl` script for this, indicating the input
is `--analysis`, and the Target names are unique IDs matching above
protein features.

     gmod_bulk_load_gff3.pl --dbname my_chado_01  --organism fruitfly \
       --analysis --unique_target --score raw  \
       --gff dmel4-modsc.tblastn.gff

Note: If you have pre-loaded the database with all the protein sequence
features such as the SGD:S000002445 protein, you should use

    gmod_bulk_load_gff3 --analysis --unique_target

to ensure that Target feature is linked with your Blast result.

## Chado Tables Updated

Then you should see these database updates:

Analysis table entry of the
[Chado_Companalysis_Module](Chado_Companalysis_Module "Chado Companalysis Module"):

| analysis_id | name | description | program | programversion | algorithm | sourcename |----|----|----|----|----|----|----| 10 | tBLASTn.MOD_Scer | tBLASTn | null | MOD_Scer |

Analysisfeature table entries (1/hsp)

|  |  |  |----|----|----|----|----|----|----|----| analysisfeature_id | feature_id | analysis_id | rawscore | normscore | significance | identity | 21 | 88148 | 10 | 117 |  | ← 1st HSP | 22 | 88150 | 10 | 91.7 |  | ... |  |  |  Feature table entry for Hit feature_id 88148 :

``` de1
 SELECT * FROM feature WHERE feature_id = 88148;
```

| feature_id | dbxref_id | organism_id | name | uniquename | residues | seqlen | md5checksum | type_id | is_analysis | is_obsolete |----|----|----|----|----|----|----|----|----|----|----| 88148 | 76797 | 10 | protein_match-auto88148 | auto88148 |  | 423 | t | f | ... |  |  |  |  |  Featureloc entries for Hit feature_id 88148:

| featureloc_id | feature_id | srcfeature_id | fmin | is_fmin_partial | fmax | is_fmax_partial | strand | phase | residue_info | locgroup | rank |----|----|----|----|----|----|----|----|----|----|----|----|----| 88149 | 88148 | 88149 | 69 | f | 858 | f |  | 0 | 1 | ← Target protein | 88148 | 88148 | 31118 | 24052 | f | 24448 | f | 1 |  | 0 | 0 | ← Source genome |

Featureloc entries for Target feature_id 88149:

| featureloc_id | feature_id | srcfeature_id | fmin | is_fmin_partial | fmax | is_fmax_partial | strand | phase | residue_info | locgroup | rank |----|----|----|----|----|----|----|----|----|----|----|----|----| 88149 | 88148 | 88149 | 69 | f | 858 | f |  | 0 | 1 | ← first HSP | 88151 | 88150 | 88149 | 69 | f | 858 | f |  | 0 | 1 | ← second HSP |

*I believe the ranks shown in the featureloc example above may not be
correct or at least are misleading; see the [Chado Best Practices
section for handling BLAST
results](Chado_Best_Practices#Results_from_BLAST "Chado Best Practices")
for clarification* [Scott](User%253AScott "User%253AScott") 19:18, 21 November
2008 (UTC)

# See also

- [Chado_Best_Practices#Results_from_BLAST](Chado_Best_Practices#Results_from_BLAST "Chado Best Practices")

# More Information

Please send questions to the GMOD developers list:

<a href="mailto:gmod-devel@lists.sourceforge.net" class="external text"
rel="nofollow">gmod-devel@lists.sourceforge.net</a>

# Authors

- [Dongilbert](User%253ADongilbert "User%253ADongilbert") 23:24, 3 April 2007
  (EDT)

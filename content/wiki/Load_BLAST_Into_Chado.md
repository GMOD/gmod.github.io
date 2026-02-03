---
title: "Load BLAST Into Chado"
---




<span id="top"></span>




# <span dir="auto">Load BLAST Into Chado</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Abstract</span>](#Abstract)
- [<span class="tocnumber">2</span> <span class="toctext">Have an
  existing Chado genome
  database</span>](#Have_an_existing_Chado_genome_database)
- [<span class="tocnumber">3</span> <span class="toctext">Convert BLAST
  analysis to GFF3</span>](#Convert_BLAST_analysis_to_GFF3)
  - [<span class="tocnumber">3.1</span> <span class="toctext">BLAST GFF3
    sample for Chado</span>](#BLAST_GFF3_sample_for_Chado)
- [<span class="tocnumber">4</span> <span class="toctext">Load Query
  Protein sequence to Chado
  DB</span>](#Load_Query_Protein_sequence_to_Chado_DB)
- [<span class="tocnumber">5</span> <span class="toctext">Load BLAST
  result GFF3 to Chado DB</span>](#Load_BLAST_result_GFF3_to_Chado_DB)
  - [<span class="tocnumber">5.1</span> <span class="toctext">Chado
    Tables Updated</span>](#Chado_Tables_Updated)
- [<span class="tocnumber">6</span> <span class="toctext">See
  also</span>](#See_also)
- [<span class="tocnumber">7</span> <span class="toctext">More
  Information</span>](#More_Information)
- [<span class="tocnumber">8</span>
  <span class="toctext">Authors</span>](#Authors)



# <span id="Abstract" class="mw-headline">Abstract</span>

This [HOWTO](Category%253AHOWTO "Category%253AHOWTO") describes steps to add a
[BLAST](Category%253ABLAST "Category%253ABLAST") analysis to a [Chado
database](Chado_-_Getting_Started "Chado - Getting Started").

# <span id="Have_an_existing_Chado_genome_database" class="mw-headline">Have an existing Chado genome database</span>

See [Load RefSeq Into
Chado](Load_RefSeq_Into_Chado "Load RefSeq Into Chado") for advice on
how to load a GenBank Genome into a database. In the following examples,
**bp\_*scriptname*** is from [BioPerl](BioPerl "BioPerl"), and
**gmod\_*scriptname*** is from GMOD. As of this date (2007 April) you
will need current modules from the [BioPerl](BioPerl "BioPerl") Git and
<a href="SVN" class="mw-redirect" title="SVN">GMOD SVN repositories</a>
to have this example work.

# <span id="Convert_BLAST_analysis_to_GFF3" class="mw-headline">Convert BLAST analysis to GFF3</span>

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

## <span id="BLAST_GFF3_sample_for_Chado" class="mw-headline">BLAST GFF3 sample for Chado</span>

Result should be formatted like this:

      ##gff-version 3
      # sample tBLASTn yeast protein x fly chromosome 4 (GenBank NC_004353) matches
      # GFF formatted for loading to Chado database

      NC_004353 tBLASTn.MOD_Scer  match_part  141495  141815  48.9  - 0 Target=S000003211 43 156

      NC_004353 tBLASTn.MOD_Scer  match_part  161699  162793  217 + 0 Target=S000005817 984 1204
      NC_004353 tBLASTn.MOD_Scer  match_part  160517  161407  185 + 0 Target=S000005817 455 980
         # this is a protein match with 2 HSP parts, note the identical Target=

# <span id="Load_Query_Protein_sequence_to_Chado_DB" class="mw-headline">Load Query Protein sequence to Chado DB</span>

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

# <span id="Load_BLAST_result_GFF3_to_Chado_DB" class="mw-headline">Load BLAST result GFF3 to Chado DB</span>

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

## <span id="Chado_Tables_Updated" class="mw-headline">Chado Tables Updated</span>

Then you should see these database updates:

Analysis table entry of the
[Chado_Companalysis_Module](Chado_Companalysis_Module "Chado Companalysis Module"):

| analysis_id | name | description | program | programversion | algorithm | sourcename |
|----|----|----|----|----|----|----|
| 10 | tBLASTn.MOD_Scer |  | tBLASTn | null |  | MOD_Scer |

Analysisfeature table entries (1/hsp)

|  |  |  |  |  |  |  |  |
|----|----|----|----|----|----|----|----|
| analysisfeature_id | feature_id | analysis_id | rawscore | normscore | significance | identity |  |
| 21 | 88148 | 10 | 117 |  |  |  | ← 1st HSP |
| 22 | 88150 | 10 | 91.7 |  |  |  |  |
| ... |  |  |  |  |  |  |  |

Feature table entry for Hit feature_id 88148 :


``` de1
 SELECT * FROM feature WHERE feature_id = 88148;
```


| feature_id | dbxref_id | organism_id | name | uniquename | residues | seqlen | md5checksum | type_id | is_analysis | is_obsolete |
|----|----|----|----|----|----|----|----|----|----|----|
| 88148 | 76797 | 10 | protein_match-auto88148 | auto88148 |  |  |  | 423 | t | f |
| ... |  |  |  |  |  |  |  |  |  |  |

Featureloc entries for Hit feature_id 88148:

| featureloc_id | feature_id | srcfeature_id | fmin | is_fmin_partial | fmax | is_fmax_partial | strand | phase | residue_info | locgroup | rank |  |
|----|----|----|----|----|----|----|----|----|----|----|----|----|
| 88149 | 88148 | 88149 | 69 | f | 858 | f |  |  |  | 0 | 1 | ← Target protein |
| 88148 | 88148 | 31118 | 24052 | f | 24448 | f | 1 |  |  | 0 | 0 | ← Source genome |

Featureloc entries for Target feature_id 88149:

| featureloc_id | feature_id | srcfeature_id | fmin | is_fmin_partial | fmax | is_fmax_partial | strand | phase | residue_info | locgroup | rank |  |
|----|----|----|----|----|----|----|----|----|----|----|----|----|
| 88149 | 88148 | 88149 | 69 | f | 858 | f |  |  |  | 0 | 1 | ← first HSP |
| 88151 | 88150 | 88149 | 69 | f | 858 | f |  |  |  | 0 | 1 | ← second HSP |

*I believe the ranks shown in the featureloc example above may not be
correct or at least are misleading; see the [Chado Best Practices
section for handling BLAST
results](Chado_Best_Practices#Results_from_BLAST "Chado Best Practices")
for clarification* [Scott](User%253AScott "User%253AScott") 19:18, 21 November
2008 (UTC)

# <span id="See_also" class="mw-headline">See also</span>

- [Chado_Best_Practices#Results_from_BLAST](Chado_Best_Practices#Results_from_BLAST "Chado Best Practices")

# <span id="More_Information" class="mw-headline">More Information</span>

Please send questions to the GMOD developers list:

<a href="mailto:gmod-devel@lists.sourceforge.net" class="external text"
rel="nofollow">gmod-devel@lists.sourceforge.net</a>

# <span id="Authors" class="mw-headline">Authors</span>

- [Dongilbert](User%253ADongilbert "User%253ADongilbert") 23:24, 3 April 2007
  (EDT)




[Categories](Special%253ACategories "Special%253ACategories"):

- [BLAST](Category%253ABLAST "Category%253ABLAST")
- [Chado](Category%253AChado "Category%253AChado")
- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Load_BLAST_Into_Chado" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:34 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">99,887 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





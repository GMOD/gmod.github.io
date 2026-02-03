---
title: "MAKER Tutorial 2011"
---
# MAKER Tutorial 2011

This [MAKER](/wiki/MAKER.1) tutorial was taught by [Barry
Moore](/wiki/User%253ABmoore) as part of the [2011 GMOD Spring
Training](/wiki/2011_GMOD_Spring_Training).

  Overview, Installation, and Basic Configuration for Annotating Genomic
  Sequence</span>](#Maker_Overview.2C_Installation.2C_and_Basic_Configuration_for_Annotating_Genomic_Sequence)
  - [About
    MAKER](#About_MAKER)
  - [Introduction to Genome
    Annotation](#Introduction_to_Genome_Annotation)
    - [What
      Are Annotations?](#What_Are_Annotations.3F)
    - [Importance of Genome
      Annotations](#Importance_of_Genome_Annotations)
    - [Effect
      of NextGen Sequencing on the Annotation
      Process](#Effect_of_NextGen_Sequencing_on_the_Annotation_Process)
  - [MAKER
    Overview](#MAKER_Overview)
    - [What
      does MAKER do?](#What_does_MAKER_do.3F)
    - [What
      sets MAKER apart from tools (*ab initio* gene predictors
      etc.)?](#What_sets_MAKER_apart_from_tools_.28ab_initio_gene_predictors_etc..29.3F)
    - [Emerging vs. Classic Model
      Genomes](#Emerging_vs._Classic_Model_Genomes)
    - [Comparison of Algorithm Performance on Model
      vs. Emerging
      Genomes](#Comparison_of_Algorithm_Performance_on_Model_vs._Emerging_Genomes)
  - [Installation](#Installation)
    - [Prerequisites](#Prerequisites)
    - [The
      MAKER Package](#The_MAKER_Package)
  - [Getting
    Started with MAKER](#Getting_Started_with_MAKER)
    - [Note](#Note)
    - [RUNNING MAKER WITH EXAMPLE
      DATA](#RUNNING_MAKER_WITH_EXAMPLE_DATA)
  - [Details of
    What is Going on Inside of
    MAKER](#Details_of_What_is_Going_on_Inside_of_MAKER)
    - [Repeat
      Masking](#Repeat_Masking)
    - [*Ab
      Initio* Gene Prediction](#Ab_Initio_Gene_Prediction)
    - [EST
      and Protein Evidence
      Alignment](#EST_and_Protein_Evidence_Alignment)
    - [Polishing Evidence
      Alignments](#Polishing_Evidence_Alignments)
    - [Integrating Evidence to Synthesize
      Annotations](#Integrating_Evidence_to_Synthesize_Annotations)
    - [Selecting and Revising the Final Gene
      Model](#Selecting_and_Revising_the_Final_Gene_Model)
    - [Quality Control](#Quality_Control)
  - [MAKER's
    Output](#MAKER.27s_Output)
  - [Viewing
    MAKER Annotations](#Viewing_MAKER_Annotations)
    - [Apollo](#Apollo)
- [Advanced MAKER
  Configuration, Re-annotation Options, and Improving Annotation
  Quality](#Advanced_MAKER_Configuration.2C_Re-annotation_Options.2C_and_Improving_Annotation_Quality)
  - [Configuration Files in
    Detail](#Configuration_Files_in_Detail)
    - [Basic
      Input Files](#Basic_Input_Files)
    - [Repeat
      Masking Options](#Repeat_Masking_Options)
    - [Gene
      Prediction Options](#Gene_Prediction_Options)
    - [Other
      MAKER Options](#Other_MAKER_Options)
  - [Training
    *ab initio* Gene
    Predictors](#Training_ab_initio_Gene_Predictors)
  - [MAKER Web
    Annotation Service](#MAKER_Web_Annotation_Service)
  - [mRNAseq](#mRNAseq)
  - [Merge/Resolve Legacy
    Annotations](#Merge.2FResolve_Legacy_Annotations)
  - [MPI
    Support](#MPI_Support)
  - [User
    Interface for Local MAKER
    Installation](#User_Interface_for_Local_MAKER_Installation)
  - [MAKER
    Accessory Scripts](#MAKER_Accessory_Scripts)

# Maker Overview, Installation, and Basic Configuration for Annotating Genomic Sequence

The first half of this page describes the basics of
[MAKER](/wiki/MAKER.1) - the easy-to-use genome annotation pipeline.

## About MAKER

MAKER is an easy-to-use genome annotation pipeline designed to be usable
by small research groups with little bioinformatics experience; however,
MAKER is also designed to be scalable and is appropriate for projects of
any size including use by large sequence centers. MAKER can be used for
*de novo* annotation of newly sequenced genomes, for updating existing
annotations to reflect new evidence, or just to combine annotations,
evidence, and quality control statistics for use in other GMOD programs
like [GBrowse](/wiki/GBrowse.1), [JBrowse](/wiki/JBrowse.1),
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>, and
[Apollo](/wiki/Apollo.1).

MAKER has been used in many genome annotation projects:

- The Pine genome project (A. Stambolia-Kovach, UCD). Now published.
- The Lamprey genome project (W. Li, MSU). Manuscript in preparation.
- The *Fusarium circinatum* (pine pitch canker) genome project (B.
  Wingfield, U of Pretoria). Manuscript submitted.
- Leaf-cutter Ant genome (C. Currie, U of Wis., Madison) Now published.
- Argentine Ant genome (CD. Smith, San Francisco State).
- Red Harvester Ant. Now published.
- Several parasitic nematode genomes (M. Mitreva, WASHU). Some now
  published.
- The *Conus bullatus* genome project (B. Olivera U of Utah).
  Preliminary results published.
- The *Pythium ultimum* genome project (R. Buell, MSU). Published.
- *Cardiocondyla obscurior* (ant) genome project (J. Gadau, Az. State
  University)
- Corn rootworm beetle genome project (H. Robertson, Univ. of Illinois)
- Rice re-annotation (R. Buell, MSU).
- *Arabidopsis* re-annotation (E. Huala, TAIR)
- Maize re-annotation (C. Lawrence, MaizeGDP)
- Wheat stem sawfly project (H. Robertson, Univ. of Illinois)
- Apple maggot fly (H. Robertson, Univ. of Illinois)
- Pigeon genome (M. Shapiro, Univ. of Utah)
- The fungus *Cronartium quercuum* (J. M. Davis, University of Florida)

## Introduction to Genome Annotation

### What Are Annotations?

Annotations are descriptions of different features of the genome, and
they can be structural or functional in nature.

Examples:

- Structural Annotations: exons, introns, UTRs, splice forms
  etc.


To use this feature, you must have MPICH2 installed with the the
`--enable-sharedlibs` flag set during installation (See MPICH2
Installer's Guide). I have installed this for you. So lets set up
MPI_MAKER and run the example file that comes with MAKER.

``` enter
 cd ~/Documents/Software/maker/src
 perl Build.PL
```

Accept the default that we want to build for MPI support

``` enter
 ./Build install
```

You should now see the executable `mpi_maker` listed among the MAKER
scripts (`/maker/bin`). Let's run some example data to see if MPI_MAKER
is working properly.

``` enter
 cd ~
 mkdir ~/maker_run2
 cd maker_run2
 cp ~Documents/Software/maker/data/dpp_* ~/maker_run2
 maker -CTL
 gedit maker_opts.ctl
```

Set values in maker configuration files.

``` enter
 genome=dpp_contig.fasta
 est=dpp_est.fasta
 protein=dpp_protein.fasta
 snap=/home/gmod/Documents/Software/maker/exe/snap/HMM/fly
```

We need to set up a few more things for MPI to work. Type `mpd` to see a
list of instructions.

``` enter
 mpd
```

You should see the following.

    configuration file /home/gmod/mpd.conf not found
    A file named .mpd.conf file must be present in the user's home
    directory (/etc/mpd.conf if root) with read and write access
    only for the user, and must contain at least a line with:
    MPD_SECRETWORD=<secretword>
    One way to safely create this file is to do the following:
      cd $HOME
      touch .mpd.conf
      chmod 600 .mpd.conf
    and then use an editor to insert a line like
      MPD_SECRETWORD=mr45-j9z
    into the file.  (Of course use some other secret word than mr45-j9z.)


Follow the instructions to set this file up, and start the mpi
environment with `mpdboot`. Then run `mpi_maker` through the MPI manager
`mpiexec`.

``` enter
 mpdboot
 mpiexec -n 2 mpi_maker
```

`mpiexec` is a wrapper that handles the MPI environment. The `-n 2` flag
tells `mpiexec` to use 2 cpus/nodes when running `mpi_maker`. For a
large cluster, this could be set to something like 100. You should now
know how to start a MAKER job via MPI.

## User Interface for Local MAKER Installation

This example did not work during class because a conflict with the
version of Apache that was installed. The issue has since been fixed.
Before beginning the example, open a terminal and remove the following
files otherwise the subversion update of maker fails.

``` enter
 rm ~/Documents/Software/maker/MWAS/bin/mwas_server
 rm ~/Documents/Software/maker/MWAS/cgi-bin/tt_templates/apollo_webstart.tt
```

Then update maker via subversion.

``` enter
 svn update ~/Documents/Software/maker/
```

The MWAS interface provides a very convenient method for running MAKER
and viewing results; however, because compute resources are limited
users are only allowed to submit a maximum of 2 megabases of sequence
per job. So while MWAS might be suitable for some analyses (i.e.
annotating BACs and short preliminary assemblies), if you plan on
annotating an entire genome you will need to install MAKER locally. But
if you like the convenience of the MWAS user interface, you can
optionally install the interface on top of a locally installed version
of MAKER for use in your own lab.


First under the `maker` directory there is a subdirectory called `MWAS`.
`MWAS` contains all the needed files to build the MAKER web interface.
The `maker/MWAS/bin/mwas_server` file is used to setup and run this web
interface. Lets configure that now. There are three steps to setting up
the server. First you must create and edit a server configuration file,
then load all other configuration files, and then install all files to
the appropriate web accessible directory.

``` enter
 cd /home/gmod/Documents/Software/maker/MWAS/
 bin/mwas_server PREP
```

This will create a file in `/maker/MWAS/config/` called `server.ctl`. We
will need to edit this file before continuing.

``` enter
 gedit config/server.ctl
```

Set:

``` enter
 apache_user:www-data
 web_address:http://localhost
 cgi_dir:/usr/lib/cgi-bin/maker
 cgi_web:/cgi-bin/maker
 html_dir:/var/www/maker
 html_web:/maker
 data_dir:/var/www/maker/data
 use_login:0
```

Now we need to generate other settings that are dependent on the values
in

`server_opts.ctl`.

``` enter
 bin/mwas_server CONFIG
```

Several new configuration files should now be loaded in the `config/`
directory. These new files define default MAKER options for the server
and the location of files for the server dropdown menus.

    maker_bopts.ctl
    maker_exe.ctl
    maker_opts.ctl
    menus.ctl

We shouldn't need to edit any of these file. So lets copy files to the
appropriate web accessible directories. This must be done as root or
using `sudo`.

``` enter
  sudo bin/mwas_server SETUP
```

If you set `APOLLO_ROOT` in the `server.ctl` file, then you can now
setup a special Java Web Start version of [Apollo](/wiki/Apollo.1) to
view results directly from the web interface. Web Start will be
described in more detail in the Apollo session. This must be done as
root or using `sudo`.

``` enter
 sudo bin/mwas_server APOLLO
```

We can now run MAKER examples using this web interface, but first we
need to launch a server to monitor for new job submissions.

``` enter
 sudo bin/mwas_server START
```

And then go to

<a href="http://localhost/maker" class="external free"
rel="nofollow">http://localhost/maker</a>

## MAKER Accessory Scripts

MAKER comes with a number of accessory scripts that are meant to assist
in manipulations of the MAKER input and output files.


Scripts:

- *add_utr_start_stop_gff* - Adds explicit 5' and 3' UTR as well as
  start and stop codon features to the GFF3 output file
     add_utr_start_stop_gff <gff3_file>

- *add_utr_to_gff3.pl* - Adds explicit 5' and 3' UTR features to the
  [GFF3](/wiki/GFF3) output file
     add_utr_gff.pl <gff3_directory>

- *cegma2zff' - This script converts the output of a GFF file from CEGMA
  into ZFF format for use in SNAP training. Output files are always
  genome.ann and genome.dna*
     cegma2zff <cegma_gff> <genome_fasta>

- *chado2gff3* - This script takes default CHADO database content and
  produces GFF3 files for each contig/chromosome.
     chado2gff3 [OPTION] <database_name>

- *compare* - This script compares the contents of a GFF3 file to a
  CHADO database to look for merged, split and missing genes.
     compare [OPTION] <database_name> <gff3_file>

- *cufflinks2gff3* - This script converts the cufflinks output
  transcripts.gtf file into GFF3 format for use in MAKER via GFF3
  passthrough. By default standless features which correspond to single
  exon cufflinks models will be ignored. This is because these features
  can correspond to repetitive elements and pseudogenes. Output is to
  STDOUT so you will need to redirect to a file.
     cufflinks2gff3 <transcripts1.gtf> <transcripts2.gtf> ...

- *evaluator* - Evaluate the the quality of an annotation set.
      mpi_evaluator [options] <eval_opts> <eval_bopts> <eval_exe>

- *fasta_merge* - Collects all of MAKER's fasta file output for each
  contig and merges them to make genome level fastas
     fasta_merge -d <datastore_index> -o <outfile>

- *fasta_tool* - The script can search, reformat, and manipulate a fasta
  file in a variety of ways.
- *fix_fasta* - Deprecated, use fasta_tool
- *genemark_gtf2gff3* - This converts genemark's GTF output into GFF3
  format. The script prints to STDOUT. Use the '\>' character to
  redirect output into a file.
     genemark_gtf2gff3 <filename><pre>

    ''gff3_2_gtf'' - Converts MAKER GFF3 files to GTF format (run add_utr_start_stop_gff first to get UTR features)

    <pre> gff3_2_gtf <gff3_file>

- *gff3_merge* - Collects all of MAKER's GFF3 file output for each
  contig and merges them to make a single genome level GFF3
     gff3_merge -d <datastore_index> -o <outfile>

- *gff3_preds2models* - Converts the gene prediction match/match_part
  format to annotation gene/mRNA/exon/CDS format
     gff3_preds2models <gff3 file> <pred list>

- *gff3_to_eval_gtf* - This script converts MAKER GFF3 files into GTF
  formatted files for the program EVAL (an annotation
  sensitivity/specificity evaluating program). The script will only
  extract features explicitly declared in the GFF3 file, and will skip
  implicit features (i.e. UTR, start codons, and stop codons). To
  extract implicit features to the GTF file, you will first need to
  explicitly declare them in the GFF3 file. This can be done by calling
  the script add_utr_to_gff3 to add formal declaration lines to the GFF3
  file.
     gff3_to_eval_gtf <maker_gff3_file>

- *iprscan2gff3* - Takes InerproScan (iprscan) output and generates GFF3
  features representing domains. Interesting tier for GBrowse.
     iprscan2gff3 <iprscan_file> <gff3_fasta>

- *iprscan_batch* - Wrapper for iprscan to take advantage of
  multiprocessor systems.
     iprscan_batch <file_name> <cpus> <log_file>

- *iprscan_wrap* - A wrapper that will run iprscan
- *ipr_update_gff* - Takes InterproScan (iptrscan) output and maps
  domain IDs and GO terms to the Dbxref and Ontology_term attributes in
  the GFF3 file.
     ipr_update_gff <gff3_file> <iprscan_file>

- *maker2chado* - This script takes MAKER produced GFF3 files and dumps
  them into a
  <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> database.
  You must set the database up first according to CHADO installation
  instructions. CHADO provides its own methods for loading GFF3, but
  this script makes it easier for MAKER specific data. You can either
  provide the datastore index file produced by MAKER to the script or
  add the GFF3 files as command line arguments.
      maker2chado [OPTION] <database_name> <gff3file1> <gff3file2> ...

- *maker2jbrowse* - This script will produce a JBrowse data set from
  MAKER gff3 files.
       maker2chado [OPTION] <database_name> <gff3file1> <gff3file2> ...

- *maker2zff.pl* - Pulls out MAKER gene models from the MAKER GFF3
  output and convert them into ZFF format for SNAP training.
     maker2zff.pl <gff3_file>

- *maker_functional*
- *maker_functional_fasta* - Maps putative functions identified from
  BLASTP against UniProt/SwissProt to the MAKER produced tarnscript and
  protein fasta files.
     maker_functional_fasta <uniprot_fasta> <blast_output> <fasta1> <fasta2> <fasta3> ...

- *maker_functional_gff* - Maps putative functions identified from
  BLASTP against UniProt/SwissProt to the MAKER produced GFF3 files in
  the Note attribute.
     maker_functional_gff <uniprot_fasta> <blast_output> <gff3_1>

- *maker_map_ids* - Build shorter IDs/Names for MAKER genes and
  transcripts following the NCBI suggested naming format.
     maker_map_ids --prefix PYU1_ --justify 6 genome.all.gff > genome.all.id.map

- *map2assembly* - Maps old gene models to a new assembly where
  possible.
      map2assembly <genome.fasta> <transcripts.fasta>

- *map_data_ids* - This script takes a id map file and changes the name
  of the ID in a data file. The map file is a two column tab delimited
  file with two columns: old_name and new_name. The data file is assumed
  to be tab delimited by default, but this can be altered with the
  delimit option. The ID in the data file can be in any column and is
  specified by the col option which defaults to the first column.
     map_data_ids genome.all.id.map data.txt

- *map_fasta_ids* - Maps short IDs/Names to MAKER fasta files.
     map_fasta_ids <map_file> <fasta_file>

- *map_gff_ids* - Maps short IDs/Names to MAKER GFF3 files, old
  IDs/Names are mapped to to the Alias attribute.
     map_gff_ids <map_file> <gff3_file>

- *split_fasta* - Splits multi-fasta files into the number of files
  specified by the user. Useful for breaking up MAKER jobs.
     split_fasta [count] <input_fasta>

- *tophat2gff3* - This script converts the juctions file produced by
  TopHat into GFF3 format for use with MAKER.
     tophat2gff3 <junctions.bed>

<span class="smwfactboxhead">Facts about
"<span class="swmfactboxheadbrowse"></span>"</span>

|----|----|
| [Has topic](/wiki/Property%253AHas_topic) | [MAKER](/wiki/MAKER.1) |

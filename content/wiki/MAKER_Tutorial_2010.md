---
title: "MAKER Tutorial 2010"
---




<span id="top"></span>




# <span dir="auto">MAKER Tutorial 2010</span>









  




  
To use this feature, you must have MPICH2 installed with the the
`--enable-sharedlibs` flag set during installation (See MPICH2
Installer's Guide). I have installed this for you. So lets set up
MPI_MAKER and run the example file that comes with MAKER.

``` enter
 cd ~/Documents/Software/maker/MPI
 perl Install.PL
```

You should now see the executable `mpi_maker` listed among the all the
MAKER scripts (`/maker/bin`). Let's run some example data to see if
MPI_MAKER is working properly.

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
 genome:dpp_contig.fasta
 est:dpp_transcripts.fasta
 protein:dpp_proteins.fasta
 predictor:snap
 snaphmm:fly
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

### <span id="User_Interface_for_Local_MAKER_Installation" class="mw-headline">User Interface for Local MAKER Installation</span>

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

    cd /home/gmod/Documents/Software/maker/MWAS/
    bin/mwas_server PREP

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
 JBROWSE_ROOT:/var/www/jbrowse/
 GBROWSE_MASTER:/etc/gbrowse2/GBrowse.conf
```

Now we need to generate other settings that are dependent on the values
in `server_opts.ctl`.

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

We only need to edit one of these files to let MAKER know to use NCBI
BLAST instead of WUBLAST.

    emacs maker_bopts.ctl

``` enter
 blast_type:ncbi
```

Now finally lets copy all web related files to the appropriate web
accessible directories. This must be done as root or using `sudo`.

``` enter
  sudo bin/mwas_server SETUP
```

If you set `APOLLO_ROOT` in the `server.ctl` file, then you can now
setup a special Java Web Start version of [Apollo](Apollo.1 "Apollo") to
view results directly from the web interface. Web Start will be
described in more detail in the Apollo session. This must be done as
root or using `sudo`.

``` enter
 sudo bin/mwas_server APOLLO
```

In addition, if you have JBrowse and GBrowse 2 installed you can also
use these to view results. To use these you must have `JBROWSE_ROOT` and
`GBROWSE_MASTER` set in the `server.ctl` file (already set). Then we
tell mwas_server to configure the programs.

``` enter
 sudo bin/mwas_server GBROWSE
 sudo bin/mwas_server JBROWSE
```

We can now run MAKER examples using this web interface, but first we
need to launch a server daemon to monitor for new job submissions.

``` enter
 sudo bin/mwas_server START
```

And then go to

<a href="http://localhost/maker" class="external free"
rel="nofollow">http://localhost/maker</a>

### <span id="Appendix:_MAKER_Accessory_Scripts" class="mw-headline">Appendix: MAKER Accessory Scripts</span>

MAKER comes with a number of accessory scripts that are meant to assist
in manipulations of the MAKER input and output files.

  
Scripts:

- *add_utr_gff.pl* - Adds explicit 5' and 3' UTR features to the GFF3
  output file

<!-- -->

    add_utr_gff.pl <gff3_directory>

  

- *add_utr_start_stop_gff* - Adds explicit 5' and 3' UTR as well as
  start and stop codon features to the GFF3 output file

<!-- -->

    add_utr_start_stop_gff <gff3_file>

  

- *fasta_merge* - Collects all of MAKER's fasta file output for each
  contig and merges them to make genome level fastas

<!-- -->

    fasta_merge -d <datastore_index> -o <outfile>

  

- *gff3_merge* - Collects all of MAKER's GFF3 file output for each
  contig and merges them to make a single genome level GFF3

<!-- -->

    gff3_merge -d <datastore_index> -o <outfile>

  

- *gff3_2_gtf* - Converts MAKER GFF3 files to GTF format (run
  add_utr_start_stop_gff first to get UTR features)

<!-- -->

    gff3_2_gtf <gff3_file>

  

- *gff3_preds2models* - Converts the gene prediction match/match_part
  format to annotation gene/mRNA/exon/CDS format

<!-- -->

    gff3_preds2models <gff3 file> <pred list>

  

- *iprscan2gff3* - Takes InerproScan (iprscan) output and generates GFF3
  features representing domains. Interesting tier for GBrowse.

<!-- -->

    iprscan2gff3 <iprscan_file> <gff3_fasta>

  

- *iprscan_batch* - Wrapper for iprscan to take advantage of
  multiprocessor systems.

<!-- -->

    iprscan_batch <file_name> <cpus> <log_file>

  

- *ipr_update_gff* - Takes InterproScan (iprscan) output and maps domain
  IDs and GO terms to the Dbxref and Ontology_term attributes in the
  GFF3 file.

<!-- -->

    ipr_update_gff <gff3_file> <iprscan_file>

  

- *maker2zff.pl* - Pulls out MAKER gene models from the MAKER GFF3
  output and convert them into ZFF format for SNAP training.

<!-- -->

    maker2zff.pl <gff3_file>

  

- *maker_functional_fasta* - Maps putative functions identified from
  BLASTP against UniProt/SwissProt to the MAKER produced tarnscript and
  protein fasta files.

<!-- -->

    maker_functional_fasta <uniprot_fasta> <blast_output> <fasta1> <fasta2> <fasta3> ...

  

- *maker_functional_gff* - Maps putative functions identified from
  BLASTP against UniProt/SwissProt to the MAKER produced GFF3 files in
  the Note attribute.

<!-- -->

    maker_functional_gff <uniprot_fasta> <blast_output> <gff3_1>

  

- *maker_map_ids* - Build shorter IDs/Names for MAKER genes and
  transcripts following the NCBI suggested naming format.

<!-- -->

    maker_map_ids --prefix PYU1_ --justify 6 genome.all.gff > genome.all.id.map

  

- *map_fasta_ids* - Maps short IDs/Names to MAKER fasta files.

<!-- -->

    map_fasta_ids <map_file> <fasta_file>

  

- *map_gff_ids* - Maps short IDs/Names to MAKER GFF3 files, old
  IDs/Names are mapped to to the Alias attribute.

<!-- -->

    map_gff_ids <map_file> <gff3_file>

  

- *split_fasta* - Splits multi-fasta files into the number of files
  specified by the user. Useful for breaking up MAKER jobs.

<!-- -->

    split_fasta [count] <input_fasta>




[Categories](Special%253ACategories "Special%253ACategories"):

- [Tutorials](Category%253ATutorials "Category%253ATutorials")
- [MAKER](Category%253AMAKER "Category%253AMAKER")



<span class="smwfactboxhead">Facts about
"<span class="swmfactboxheadbrowse">[MAKER Tutorial
2010](Special%253ABrowse/MAKER-20Tutorial-202010 "Special%253ABrowse/MAKER-20Tutorial-202010")</span>"</span>

|  |  |
|----|----|
| [Has topic](Property%253AHas_topic "Property:Has topic") | [MAKER](MAKER.1 "MAKER") <span class="smwsearch">[+](Special%253ASearchByProperty/Has-20topic/MAKER "Special%253ASearchByProperty/Has-20topic/MAKER")</span> |






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/MAKER_Tutorial_2010" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:41 on 14 February
  2013.</span>
<!-- - <span id="footer-info-viewcount">16,508 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





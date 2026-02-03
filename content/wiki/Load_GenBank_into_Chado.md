---
title: "Load GenBank into Chado"
---




<span id="top"></span>




# <span dir="auto">Load GenBank into Chado</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Abstract</span>](#Abstract)
- [<span class="tocnumber">2</span>
  <span class="toctext">Summary</span>](#Summary)
- [<span class="tocnumber">3</span> <span class="toctext">Fetch Genbank
  Genome Files</span>](#Fetch_Genbank_Genome_Files)
- [<span class="tocnumber">4</span> <span class="toctext">Create GFF3
  from the Genbank Files</span>](#Create_GFF3_from_the_Genbank_Files)
- [<span class="tocnumber">5</span> <span class="toctext">Load GFF3 into
  Chado</span>](#Load_GFF3_into_Chado)
- [<span class="tocnumber">6</span> <span class="toctext">Possible
  Errors</span>](#Possible_Errors)
- [<span class="tocnumber">7</span>
  <span class="toctext">Authors</span>](#Authors)



## <span id="Abstract" class="mw-headline">Abstract</span>

This [HOWTO](Category%253AHOWTO "Category%253AHOWTO") describes how to load
GenBank format files into
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>. For a
thorough discussion of this topic, including all the files that will
allow you to set up a complete test environment see:

<a href="http://eugenes.org/gmod/genbank2chado/" class="external free"
rel="nofollow">http://eugenes.org/gmod/genbank2chado/</a>

  

## <span id="Summary" class="mw-headline">Summary</span>

- Install prerequisites: latest versions of
  <a href="Chado" class="mw-redirect" title="Chado">Chado</a> and
  [GBrowse](GBrowse.1 "GBrowse")
- Fetch Genbank genome/chromosomes
- Run <a
  href="http://code.open-bio.org/svnweb/index.cgi/bioperl/view/bioperl-live/trunk/scripts/Bio-DB-GFF/genbank2gff3.PLS"
  class="external text" rel="nofollow"><code>genbank2gff3</code></a>
  script from [BioPerl](BioPerl "BioPerl") (Important: use a version of
  the script created April 2007 or later)
- Run `gmod_bulk_load_gff3.pl` script (from GMOD)
- View genome(s) with [GBrowse](GBrowse.1 "GBrowse") (see an <a
  href="http://server3.eugenes.org/cgi-bin/gmod01/gbrowse/dev_chado_ggb/"
  class="external text" rel="nofollow">example at eugenes.org</a>).

In summary, to load *Saccharomyces* chromosome X to Chado database
'mychado', from a Unix command-line, do:

     curl ftp://ftp.ncbi.nih.gov/genomes/Saccharomyces_cerevisiae/CHR_X/NC_001142.gbk \
     | perl bp_genbank2gff3.pl -noCDS -in stdin -out stdout \
     | perl gmod_bulk_load_gff3.pl -dbname mychado -organism fromdata

## <span id="Fetch_Genbank_Genome_Files" class="mw-headline">Fetch Genbank Genome Files</span>

Genbank genome data is available from NCBI genomes section,
<a href="ftp://ftp.ncbi.nih.gov/genomes" class="external free"
rel="nofollow">ftp://ftp.ncbi.nih.gov/genomes</a>, or from a current
mirror at <a href="ftp://bio-mirror.net/biomirror/ncbigenomes/"
class="external free"
rel="nofollow">ftp://bio-mirror.net/biomirror/ncbigenomes/</a>

     mkdir data; cd data

Fetch from NCBI, or this Indiana mirror

     curl ftp://bio-mirror.net/biomirror/ncbigenomes/
     curl -RO ftp://bio-mirror.net/biomirror/ncbigenomes/Saccharomyces_cerevisiae/CHR_X/NC_001142.gbk.gz

Other sample genomes of interest:

- `Drosophila_melanogaster/CHR_4/NC_004353.gbk.gz`
- `Caenorhabditis_elegans/CHR_III/NC_003281.gbk.gz`
- `Arabidopsis_thaliana/CHR_IV/NC_003075.gbk.gz`
- `M_musculus/CHR_19/mm_ref_chr19.gbk.gz`
- `H_sapiens/CHR_19/hs_ref_chr19.gbk.gz`

  

## <span id="Create_GFF3_from_the_Genbank_Files" class="mw-headline">Create GFF3 from the Genbank Files</span>

The [BioPerl](BioPerl "BioPerl") script `bp_genbank2gff3.pl`
(`scripts/Bio-DB-GFF/genbank2gff3.PLS`) will convert to
[GFF3](GFF3 "GFF3") suited to
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> loading.
**Important**: use a version of the script created April 2007 or later.

The new `-noCDS` flag is required for this. Use `-s` flag to summarize
features found.

     bp_genbank2gff3.pl -noCDS -s -o . data/NC_001142.gbk.gz

  

## <span id="Load_GFF3_into_Chado" class="mw-headline">Load GFF3 into Chado</span>

Use the GMOD script `gmod_bulk_load_gff3.pl` for this. Note that
`gmod_bulk_load_gff3` will only handle **one** organism at a time. Chose
the best `--dbxref` per organism (WormBase, SGD, MGI, FLYBASE),
depending on contents of GenBank annotations. The 'GeneID' dbxref is
standard for most GenBank genomes.

     gmod_bulk_load_gff3.pl  --dbname dev_chado_01c --dbxref GeneID --organism fromdata --gff data/NC_004353.gbk.gz.gff

Check data:

     psql -d dev_chado_01c -c 'select count(f.*), \
      (select common_name from organism where organism_id = f.organism_id) as species \
      from feature f group by f.organism_id;'
     psql -d dev_chado_01c -c 'select count(f.*), \
      (select common_name from organism where organism_id = f.organism_id) as species \
      from feature f where f.seqlen>0 group by f.organism_id;'

  

## <span id="Possible_Errors" class="mw-headline">Possible Errors</span>

It's possible that you'll run into some errors coming from the input
data itself. Some of the errors, and their fixes, are described below.

  
**couldn't open /var/lib/gmod/conf directory for reading:No such file or
directory**

Make sure the environmental variable GMOD_ROOT is set to where gmod was
installed, for example:

     setenv GMOD_ROOT /usr/local/gmod/ # tcsh

or

     set GMOD_ROOT=/usr/local/gmod/ # bash

  
**Your [GFF3](GFF3 "GFF3") file uses a tag called \<term\>, but this
term is not already in the cvterm and dbxref tables so that its value
can be inserted into the featureprop table**

Solution: This error message will be followed by
[SQL](Glossary#SQL "Glossary") statements that insert the term in the
correct way - execute them. By the way, one explanation for this error
is that the source sequence was curated but not with terms from the
<a href="http://sequenceontology.org" class="external text"
rel="nofollow">Sequence Ontology</a>.

  
**DBD::Pg::db pg_endcopy failed: ERROR: duplicate key violates unique
constraint "featureprop_c1"**  
**CONTEXT: COPY featureprop, line ...**

Solution: The CONTEXT line above is telling you what the offending data
is. This error probably means that there are 2 features sharing the same
name or ID and feature type in the [GFF3](GFF3 "GFF3") file. Correct
these errors by hand and reload.

## <span id="Authors" class="mw-headline">Authors</span>

- [Don Gilbert](User%253ADongilbert "User%253ADongilbert")
- <a href="http://www.bioperl.org/wiki/Brian_Osborne" class="extiw"
  title="bp:Brian Osborne">Brian Osborne</a>




[Categories](Special%253ACategories "Special%253ACategories"):

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Load_GenBank_into_Chado" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:49 on 30 December
  2008.</span>
<!-- - <span id="footer-info-viewcount">53,382 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





---
title: "GMODTools TestCase"
---




<span id="top"></span>




# <span dir="auto">GMODTools TestCase</span>









This is an example test case for GMOD, loading a GenBank format genome
(chromosome) to Chado database, then dumping it out, including GenBank
submission format with GenBank output to test round-trip agreement.

This is an abbreviated example, current as of May 2008. It uses a
Chado-db template in Postgres, and assumes you have installed/tested
GMOD components available.

     # get AnoGam chrX and load to chado db
     curl -OR ftp://bio-mirror.net/biomirror/ncbigenomes/Anopheles_gambiae/CHR_X/NC_004818.gbk.gz
     or curl -OR ftp://ftp.ncbi.nih.gov/genomes/Anopheles_gambiae/CHR_X/NC_004818.gbk.gz

     set dbname=anogam_x
     $pg/bin/createdb -T chado_01_template $dbname

     # fix Genbank FT to SO type map if needed
     vi  lib/Bio/SeqFeature/Tools/TypeMapper.pm : add pseudogenic tRNA

     # load chromosome X to chado
     gunzip -c NC_004818.gbk.gz |\
      perl bin/bp_genbank2gff3.pl -noCDS -in stdin -out stdout |\
      perl bin/gmod_bulk_load_gff3.pl -dbname $dbname -organism fromdata

     # create GMOD Bulkfiles conf/bulkfiles/anogam.xml from template.xml : dbname, etc. edits
     # see samples to create a new organism/project configuration

     # create standard Bulkfiles outputs for anogam_x
     perl -Ilib bin/bulkfiles.pl -config=anogam  -make >& log.anogam1 &

     # new in progress output, includes regurgitation of GenBank record to compare with original
     # you should check and edit conf/bulkfiles/genbanksubmit.xml before running this part
     perl -Ilib bin/bulkfiles.pl -config=anogam -format=genbanktbl -make

Outputs should include genbanksubmit/ folder with outputs of GMOD
Bulkfiles:

    anogam-all-anogam1.tbl    : feature table  ** new part
    anogam-all-anogam1.fsa    : genome dna     == fasta/chromosome
    anogam-all-anogam1.pep    : protein aa     == fasta/translation

and outputs of NCBI tbl2asn:

    anogam-all-anogam1.sqn : ASN.1 record to submit to NCBI
    anogam-all-anogam1.val : errors & warnings
    anogam-all-anogam1.gbf : Genbank format for review

You will find these sample outputs here <a
href="http://insects.eugenes.org/genome/Anopheles_gambiae_str._PEST/anogam_20080511/"
class="external free"
rel="nofollow">http://insects.eugenes.org/genome/Anopheles_gambiae_str._PEST/anogam_20080511/</a>

There remain caveats on reproducing the original GenBank record this
way. At this writing, the GenbankSubmit function is still in
development, and the Genbank to GFF to Chado loading has some losses.




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [Database Tools](Category%253ADatabase_Tools "Category%253ADatabase Tools")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GMODTools_TestCase" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 17:03 on 20 June
  2008.</span>
<!-- - <span id="footer-info-viewcount">16,364 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





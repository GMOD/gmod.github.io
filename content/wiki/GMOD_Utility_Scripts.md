---
title: "GMOD Utility Scripts"
---




<span id="top"></span>




# <span dir="auto">GMOD Utility Scripts</span>









This page describes several of the tools that come with the GMOD
distribution for performing various useful tasks


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">gmod_extract_dbxref_from_gff.pl</span>](#gmod_extract_dbxref_from_gff.pl)
- [<span class="tocnumber">2</span>
  <span class="toctext">gmod_fasta2gff3.pl</span>](#gmod_fasta2gff3.pl)
- [<span class="tocnumber">3</span>
  <span class="toctext">gmod_gff3_preprocessor.pl</span>](#gmod_gff3_preprocessor.pl)
- [<span class="tocnumber">4</span>
  <span class="toctext">gmod_make_gff_from_dbxref.pl</span>](#gmod_make_gff_from_dbxref.pl)
- [<span class="tocnumber">5</span>
  <span class="toctext">gmod_materialized_view_tool.pl</span>](#gmod_materialized_view_tool.pl)
- [<span class="tocnumber">6</span>
  <span class="toctext">gmod_sort_gff3.pl</span>](#gmod_sort_gff3.pl)



## <span id="gmod_extract_dbxref_from_gff.pl" class="mw-headline">gmod_extract_dbxref_from_gff.pl</span>

This tool extracts dbxrefs (ie, the DB identifier and the accession)
from GFF3 lines that have a Target attribute. This is useful if these
dbxref attributes are the only record of what the query sequence was for
a similarity analysis. It prints the extracted database and accession
information to standard out, and another script,
[gmod_make_gff_from_dbxref.pl](GMOD_Utility_Scripts#gmod_make_gff_from_dbxref.pl "GMOD Utility Scripts"),
takes this information on standard in and creates a GFF3 file.

## <span id="gmod_fasta2gff3.pl" class="mw-headline">gmod_fasta2gff3.pl</span>

In order to properly store similarity result data, it is best to have
both the query and subject features already in the database. When a
fasta file of a collection of sequences are blasted against a reference
sequence like a chromosome, frequently the only representation of those
sequence features is in the original fasta file. This tool makes it easy
to create GFF3 files from that fasta file so that they can be loaded
into Chado before the similarity results that reference them are.

## <span id="gmod_gff3_preprocessor.pl" class="mw-headline">gmod_gff3_preprocessor.pl</span>

Splits a GFF3 file into smaller more manageable files.

## <span id="gmod_make_gff_from_dbxref.pl" class="mw-headline">gmod_make_gff_from_dbxref.pl</span>

**This script currently has no perldoc, which needs to be added!**

This script takes the output of
[gmod_extract_dbxref_from_gff.pl](GMOD_Utility_Scripts#gmod_extract_dbxref_from_gff.pl "GMOD Utility Scripts")
as well as a list of fasta files and creates a GFF3 file for the
sequences that are represented in both the output from the extractor as
well as in the fasta file. This script operates in a similar manner to
[gmod_fasta2gff3.pl](GMOD_Utility_Scripts#gmod_fasta2gff3.pl "GMOD Utility Scripts")
except that it is selective in what it will make GFF3 out of, versus the
all inclusive fasta2gff3 script. This is useful if only a relatively
small proportion of the fasta file's contents are represented in the
GFF3 similarity results.

## <span id="gmod_materialized_view_tool.pl" class="mw-headline">gmod_materialized_view_tool.pl</span>

This is a tool for creating materialized views in Chado. See the page
dedicated to [it
(Materialized_views)](Materialized_views "Materialized views") for more
information.

## <span id="gmod_sort_gff3.pl" class="mw-headline">gmod_sort_gff3.pl</span>

Sorts a GFF3 file so that parent features occur before child features.
It does this using temporary tables in the Chado database, so it must be
available when the sorter is run. If the file is very large, it is a
good idea to run the
[gmod_gff3_preprocessor.pl](GMOD_Utility_Scripts#gmod_gff3_preprocessor.pl "GMOD Utility Scripts")
first. There are only two options, one for specifying the input file
(--infile or -i) and one for optionally specifying the output file
(--outfile or -o). The current implementation (which may be reworked)
only deals with 4 levels of inheritance (the typical gene annotation has
three: gene, mRNA, and exon).




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [Database Tools](Category%253ADatabase_Tools "Category%253ADatabase Tools")
- [Documentation](Category%253ADocumentation "Category%253ADocumentation")
- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GMOD_Utility_Scripts" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 17:55 on 24 March
  2008.</span>
<!-- - <span id="footer-info-viewcount">28,041 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





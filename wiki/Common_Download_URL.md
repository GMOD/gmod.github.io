



<span id="top"></span>




# <span dir="auto">Standard URL</span>





(Redirected from [Common Download
URL](Common_Download_URL)





In order to simplify the retrieval of common datasets, the Generic Model
Organisms Database (GMOD) community has recommended a series of standard
URLs, or a common download URL. Each participating MOD has an index page
like the ones below, describing the species and datasets that are
available.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">MOD Standard
  URL</span>](#MOD_Standard_URL)
- [<span class="tocnumber">2</span> <span class="toctext">About GMOD
  Standard URL</span>](#About_GMOD_Standard_URL)
- [<span class="tocnumber">3</span> <span class="toctext">Common /genome
  pages</span>](#Common_.2Fgenome_pages)
- [<span class="tocnumber">4</span> <span class="toctext">MOD
  Non-Standard URL</span>](#MOD_Non-Standard_URL)
- [<span class="tocnumber">5</span> <span class="toctext">See
  also</span>](#See_also)



# <span id="MOD_Standard_URL" class="mw-headline">MOD Standard URL</span>

| MOD | Standard URL | Description |
|----|----|----|
| <a href="http://www.wormbase.org/" class="external text"
rel="nofollow">WormBase</a> | <a href="http://www.wormbase.org/genome/" class="external free"
rel="nofollow">http://www.wormbase.org/genome/</a> | *Caenorhabditis elegans* and related nematodes |
| <a href="http://wfleabase.org/" class="external text"
rel="nofollow">wFleaBase</a> | <a href="http://wfleabase.org/genome/" class="external free"
rel="nofollow">http://wfleabase.org/genome/</a> | *Daphnia pulex* and related crustaceans |
| <a href="http://insects.eugenes.org/DroSpeGe/" class="external text"
rel="nofollow">DroSpeGe</a> | <a href="http://insects.eugenes.org/genome/" class="external free"
rel="nofollow">http://insects.eugenes.org/genome/</a> | Twelve *Drosophila* insect species genomes |

**Genome datasets available through the GMOD common URL**

  

# <span id="About_GMOD_Standard_URL" class="mw-headline">About GMOD Standard URL</span>

This standard specifies the following URLs (all located under
*http://your.org/*). Display this HTML-formatted index page that
contains links to each of the species available through common URLs. See
also <a href="http://blog.gmod.org/workshops/2005/may/harris-050517.ppt"
class="external text" rel="nofollow">Todd Harris' powerpoint
presentation</a> given at the Spring, 2005 GMOD meeting. The uses for
these common URLs are two-fold:

- Keep it simple for scientists to guess where to find a genome, when
  they may be unfamiliar with the MOD website.
- Keep it standard for computists to program a long-lasting, computer
  parsable data URL, with no guesswork on spelling, and defined data
  formats.

  

| Standard URL | Description |
|----|----|
| /genome/Binomial_name | An index page for species "Binomial_name". This will be an HTML-format page containing links to each of the genome releases. |
| /genome/Binomial_name/release | Leads to index for the named release. It should be an HTML-format page containing links to each of the data sets described below. |
| /genome/Binomial_name/current | Leads to an index of the most current release, symbolic link style. |
| /genome/Binomial_name/current/dna | Returns a FASTA file containing big DNA fragments (e.g. chromosomes). MIME type is application/x-fasta. |
| /genome/Binomial_name/current/mrna | Returns a FASTA file containing spliced mRNA transcript sequences. MIME type is application/x-fasta. |
| /genome/Binomial_name/current/ncrna | Returns a FASTA file containing non-coding RNA sequences. MIME type is application/x-fasta. |
| /genome/Binomial_name/current/protein | Returns a FASTA file containing all the protein sequences known to be encoded by the genome. MIME type is application/x-fasta |
| /genome/Binomial_name/current/feature | Returns a GFF3 file describing genome annotations. MIME type is application/x-gff3. |

Other names for this: Common download URL, Common URL, Standard URL

  
*Note: MODs may optionally provide URLs in the short form of G_species
(eg C_elegans) as a convenience for users. This should be supplied in
addition to the full Binomial_name standard.*

# <span id="Common_.2Fgenome_pages" class="mw-headline">Common /genome pages</span>

These projects provide data information at /genome/, if not yet in the
common formats described below.

<table class="wikitable">
<caption><strong>Common /genome/ data pages</strong></caption>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>MOD</th>
<th>Common URL</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><a href="http://www.medicago.org/" class="external text"
rel="nofollow">Medicago</a></td>
<td><a href="http://www.medicago.org/genome/" class="external free"
rel="nofollow">http://www.medicago.org/genome/</a></td>
<td><em>Medicago truncatula</em> plant genome</td>
</tr>
<tr class="even">
<td><a href="http://www.maizegdb.org/" class="external text"
rel="nofollow">MaizeGDB</a></td>
<td><a href="http://www.maizegdb.org/genome/" class="external free"
rel="nofollow">http://www.maizegdb.org/genome/</a></td>
<td><em>Maize</em> corn genome</td>
</tr>
<tr class="odd">
<td><a href="http://www.neurosporagenome.org/" class="external text"
rel="nofollow">Neurospora</a></td>
<td><a href="http://www.neurosporagenome.org/genome/"
class="external free"
rel="nofollow">http://www.neurosporagenome.org/genome/</a></td>
<td><em>Neurospora crassa</em></td>
</tr>
<tr class="even">
<td><a href="http://www.vectorbase.org/" class="external text"
rel="nofollow">Vectorbase</a></td>
<td><a href="http://agambiae.vectorbase.org/Genome/"
class="external free"
rel="nofollow">http://agambiae.vectorbase.org/Genome/</a><br />
<a href="http://aaegypti.vectorbase.org/Genome/" class="external free"
rel="nofollow">http://aaegypti.vectorbase.org/Genome/</a><br />
<a href="http://iscapularis.vectorbase.org/Genome/"
class="external free"
rel="nofollow">http://iscapularis.vectorbase.org/Genome/</a><br />
<a href="http://cpipiens.vectorbase.org/Genome/" class="external free"
rel="nofollow">http://cpipiens.vectorbase.org/Genome/</a><br />
<a href="http://phumanus.vectorbase.org/Genome/" class="external free"
rel="nofollow">http://phumanus.vectorbase.org/Genome/</a></td>
<td>Human vector insects genomes</td>
</tr>
</tbody>
</table>

**Common /genome/ data pages**

# <span id="MOD_Non-Standard_URL" class="mw-headline">MOD Non-Standard URL</span>

For those genome projects that haven't yet standardized their URLs there
is this site that lists what is available:

<a
href="http://wiki.geneontology.org/index.php/Reference_Genome_sequence_annotation"
class="external text" rel="nofollow">Reference Genomes</a>

# <span id="See_also" class="mw-headline">See also</span>

- [MOD](MOD "MOD")
- <a href="http://gmod.svn.sourceforge.net/viewvc/gmod/standard-urls"
  class="external text" rel="nofollow">standard-urls project in SVN</a>




[Categories](Special%253ACategories "Special%253ACategories"):

- [GMOD Best
  Practices](Category%253AGMOD_Best_Practices "Category%253AGMOD Best Practices")
- [MOD User
  Interfaces](Category%253AMOD_User_Interfaces "Category%253AMOD User Interfaces")
- [WFleaBase](Category%253AWFleaBase "Category%253AWFleaBase")
- [WormBase](Category%253AWormBase "Category%253AWormBase")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Standard_URL" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:44 on 15 September
  2009.</span>
<!-- - <span id="footer-info-viewcount">51,131 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





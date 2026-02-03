---
title: "Standard URL"
---
# Standard URL

In order to simplify the retrieval of common datasets, the Generic Model
Organisms Database (GMOD) community has recommended a series of standard
URLs, or a common download URL. Each participating MOD has an index page
like the ones below, describing the species and datasets that are
available.

  URL</span>](#MOD_Standard_URL)
- [About GMOD
  Standard URL](#About_GMOD_Standard_URL)
- [Common /genome
  pages](#Common_.2Fgenome_pages)
- [MOD
  Non-Standard URL](#MOD_Non-Standard_URL)
- [See
  also](#See_also)

# MOD Standard URL

| MOD | Standard URL | Description |
|----|----|----|
| <a href="http://www.wormbase.org/" class="external text" |  |  |
rel="nofollow">WormBase</a> | <a href="http://www.wormbase.org/genome/" class="external free"
rel="nofollow">http://www.wormbase.org/genome/</a> | *Caenorhabditis elegans* and related nematodes | <a href="http://wfleabase.org/" class="external text"
rel="nofollow">wFleaBase</a> | <a href="http://wfleabase.org/genome/" class="external free"
rel="nofollow">http://wfleabase.org/genome/</a> | *Daphnia pulex* and related crustaceans | <a href="http://insects.eugenes.org/DroSpeGe/" class="external text"
rel="nofollow">DroSpeGe</a> | <a href="http://insects.eugenes.org/genome/" class="external free"
rel="nofollow">http://insects.eugenes.org/genome/</a> | Twelve *Drosophila* insect species genomes |

**Genome datasets available through the GMOD common URL**



# About GMOD Standard URL

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

# Common /genome pages

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

# MOD Non-Standard URL

For those genome projects that haven't yet standardized their URLs there
is this site that lists what is available:

<a
href="http://wiki.geneontology.org/index.php/Reference_Genome_sequence_annotation"
class="external text" rel="nofollow">Reference Genomes</a>

# See also

- [MOD](MOD "MOD")
- <a href="http://gmod.svn.sourceforge.net/viewvc/gmod/standard-urls"
  class="external text" rel="nofollow">standard-urls project in SVN</a>

---
title: "MAKER"
---
# MAKER



<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/37/MAKERLogo.png/400px-MAKERLogo.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/37/MAKERLogo.png/600px-MAKERLogo.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/37/MAKERLogo.png/800px-MAKERLogo.png 2x"
width="400" height="136" alt="MAKER logo" />

Status

- Mature release
- Development: active
- Support: active

Licence


<a href="http://opensource.org/licenses/gpl-license"
class="external text" rel="nofollow">GNU GPL (for academics)</a>,
<a href="http://opensource.org/licenses/artistic-license-2.0"
class="external text" rel="nofollow">Artistic License 2.0 (for
academics)</a>, custom license for commercial usage

Resources

- [GMOD Components](/wiki/Category%253AGMOD_Components)
- [Annotation](/wiki/Category%253AAnnotation)
- [MAKER](/wiki/Category%253AMAKER)

<span class="smwfactboxhead">Facts about
"<span class="swmfactboxheadbrowse"></span>"</span>

<table class="smwfacttable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd row-odd">
<td class="smwpropname"><a href="/wiki/Property%253AAvailable_on_platform"
title="Property:Available on platform">Available on platform</a></td>
<td class="smwprops">linux ,
os x
and unix </td>
</tr>
<tr class="even row-even">
<td class="smwpropname"><a href="/wiki/Property%253AHas_URL"
title="Property:Has URL">Has URL</a></td>
<td class="smwprops"><a
href="http://www.yandell-lab.org/software/maker.html"
class="external free"
rel="nofollow">http://www.yandell-lab.org/software/maker.html</a> ,
<a
href="http://yandell.topaz.genetics.utah.edu/cgi-bin/maker_license.cgi"
class="external free"
rel="nofollow">http://yandell.topaz.genetics.utah.edu/cgi-bin/maker_license.cgi</a>
,
<a href="https://www.e-biogenouest.org/resources/48"
class="external free"
rel="nofollow">https://www.e-biogenouest.org/resources/48</a> ,
<a href="http://www.yandell-lab.org/software/maker-p.html"
class="external free"
rel="nofollow">http://www.yandell-lab.org/software/maker-p.html</a>
,
<a href="http://derringer.genetics.utah.edu/cgi-bin/MWAS/maker.cgi"
class="external free"
rel="nofollow">http://derringer.genetics.utah.edu/cgi-bin/MWAS/maker.cgi</a>

and <a href="http://hymenopteragenome.org/ant_genomes/"
class="external free"
rel="nofollow">http://hymenopteragenome.org/ant_genomes/</a> </td>
</tr>
<tr class="odd row-odd">
<td class="smwpropname"><a href="/wiki/Property%253AHas_description"
title="Property:Has description">Has description</a></td>
<td class="smwprops">MAKER is an easy-to-configure, portable ge<span
class="smw-highlighter" data-type="2" data-state="persistent"
data-title="Information"><span class="smwtext"> … </span><span
class="smwttcontent">MAKER is an easy-to-configure, portable genome <a href="/wiki/Category%253AAnnotation" title="Category%253AAnnotation">annotation</a>
pipeline. MAKER allows smaller <em>eukaryotic</em> genome projects and
<em>prokaryotic</em> genome projects to annotate their genomes and to
create genome databases. MAKER identifies repeats, aligns ESTs and
proteins to a genome, produces <em>ab initio</em> gene predictions and
automatically synthesizes these data into gene annotations with
evidence-based quality values. MAKER is also easily trainable: outputs
of preliminary runs can be used to automatically retrain its gene
prediction algorithm, producing higher quality gene-models on subsequent
runs. MAKER's inputs are minimal. Its outputs are in <a href="/wiki/GFF3"
title="GFF3">GFF3</a> or <a href="/wiki/Glossary#FASTA"
title="Glossary">FASTA</a> format, and can be directly loaded into <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>, <a href="/wiki/GBrowse.1" title="GBrowse">GBrowse</a>, <a href="/wiki/JBrowse.1"
title="JBrowse">JBrowse</a>, <a href="/wiki/WebApollo.1"
title="WebApollo">WebApollo</a> or <a href="/wiki/Apollo.1"
title="Apollo">Apollo</a>. </span></span>
<p>For those annotating novel plant genomes, the <a
href="http://www.yandell-lab.org/software/maker-p.html"
class="external text" rel="nofollow">MAKER-P pipeline</a> is designed to
make the annotation tractable for small groups with limited
bioinformatics experience and resources, and faster and more transparent
for large groups with more experience and resources. The MAKER-P
pipeline generates species-specific repeat libraries, as well as
structural annotations of protein coding genes, non-coding RNAs, and
pseudogenes. The <a
href="http://www.yandell-lab.org/software/maker-p.html"
class="external text" rel="nofollow">MAKER-P website</a> has more
information on the additional protocols for plant genome annotation.</p>
<p>Additional MAKER options and capabilities include:</p>
<ul>
<li>Map old annotation sets on to new assemblies.</li>
<li>Merge multiple legacy annotation sets into a consensus set of
annotations.</li>
<li>Update existing annotations to take new evidence into account.</li>
<li>Tag pre-existing gene models with evidence alignments and quality
control metrics to assist in downstream manual curation.</li>
<li>Use GFF3 pass-through to include both evidence alignments and
predicted gene models from algorithms not natively supported by
MAKER.</li>
<li>MAKER is MPI-capable for rapid parallelization across computer
clusters.</li>
<li>You can also easily integrate raw InterProScan results into MAKER,
which will identify protein domains; add GO functional categories; and
help assign putative gene functions to genome annotations. This data
then becomes accessible as part of the GFF3 output and can be loaded
into a <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>
database, <a href="/wiki/JBrowse.1" title="JBrowse">JBrowse</a>, <a href="/wiki/GBrowse.1" title="GBrowse">GBrowse</a>, <a href="/wiki/WebApollo.1"
title="WebApollo">WebApollo</a> or <a href="/wiki/Apollo.1"
title="Apollo">Apollo</a>.</li>
</ul>
MAKER comes with sample data for testing purposes. See the
<code>/data</code> directory in the download. <code>/data</code>
directory in the download. , Review article on
eukaryotic genome annotation from the MAKER team. ,
MAKER with additional software for plant genome annotation ,
online version of the MAKER tool
and The ant genomes were annotated using MAKER. </td>
</tr>
<tr class="even row-even">
<td class="smwpropname"><a href="/wiki/Property%253AHas_development_status"
title="Property:Has development status">Has development status</a></td>
<td class="smwprops">active </td>
</tr>
<tr class="odd row-odd">
<td class="smwpropname"><a href="/wiki/Property%253AHas_input_format"
title="Property:Has input format">Has input format</a></td>
<td class="smwprops"><a href="/wiki/GFF3" title="GFF3">GFF3</a>
and <a href="/wiki/Glossary#FASTA" title="Glossary">FASTA</a> </td>
</tr>
<tr class="even row-even">
<td class="smwpropname"><a href="/wiki/Property%253AHas_licence"
title="Property:Has licence">Has licence</a></td>
<td class="smwprops"><a
href="http://opensource.org/licenses/gpl-license" class="external text"
rel="nofollow">GNU GPL (for academics)</a> ,
<a href="http://opensource.org/licenses/artistic-license-2.0"
class="external text" rel="nofollow">Artistic License 2.0 (for
academics)</a>
and custom license for commercial usage </td>
</tr>
<tr class="odd row-odd">
<td class="smwpropname"><a href="/wiki/Property%253AHas_logo"
title="Property:Has logo">Has logo</a></td>
<td class="smwprops">MAKERLogo.png </td>
</tr>
<tr class="even row-even">
<td class="smwpropname"><a href="/wiki/Property%253AHas_output_format"
title="Property:Has output format">Has output format</a></td>
<td class="smwprops"><a href="/wiki/GFF3" title="GFF3">GFF3</a>
and <a href="/wiki/Glossary#FASTA" title="Glossary">FASTA</a> </td>
</tr>
<tr class="odd row-odd">
<td class="smwpropname"><a href="/wiki/Property%253AHas_software_maturity_status"
title="Property:Has software maturity status">Has software maturity
status</a></td>
<td class="smwprops">mature </td>
</tr>
<tr class="even row-even">
<td class="smwpropname"><a href="/wiki/Property%253AHas_support_status"
title="Property:Has support status">Has support status</a></td>
<td class="smwprops">active </td>
</tr>
<tr class="odd row-odd">
<td class="smwpropname"><a href="/wiki/Property%253AHas_title"
title="Property:Has title">Has title</a></td>
<td class="smwprops">A beginner's guide to eukaryotic genome annotation
,
MAKER-P ,
MAKER Web Annotation Server
and Ant Genomes Portal </td>
</tr>
<tr class="even row-even">
<td class="smwpropname"><a href="/wiki/Property%253AHas_topic"
title="Property:Has topic">Has topic</a></td>
<td class="smwprops"><strong>MAKER</strong> </td>
</tr>
<tr class="odd row-odd">
<td class="smwpropname"><a href="/wiki/Property%253AIs_open_source"
title="Property:Is open source">Is open source</a></td>
<td class="smwprops">Caveats apply </td>
</tr>
<tr class="even row-even">
<td class="smwpropname"><a href="/wiki/Property%253ALink_type"
title="Property:Link type">Link type</a></td>
<td class="smwprops">download ,
source code ,
website ,
publication ,
other  and
public server </td>
</tr>
<tr class="odd row-odd">
<td class="smwpropname"><a href="/wiki/Property%253ARelease_date"
title="Property:Release date">Release date</a></td>
<td class="smwprops">2008 </td>
</tr>
<tr class="even row-even">
<td class="smwpropname"><a href="/wiki/Property%253ATool_functionality_or_classification"
title="Property:Tool functionality or classification">Tool functionality or
classification</a></td>
<td class="smwprops">Genome Annotation </td>
</tr>
<tr class="odd row-odd">
<td class="smwpropname"><a href="/wiki/Property%253AWritten_in_language"
title="Property:Written in language">Written in language</a></td>
<td class="smwprops">Perl </td>
</tr>
<tr class="even row-even">
<td class="smwspecname"><span class="smw-highlighter" data-type="1"
data-state="inline" data-title="Property"><span class="smwbuiltin"><a href="/wiki/Property%253AHas_subobject" title="Property:Has subobject">Has
subobject</a></span><span class="smwttcontent">This property is a
special property in this wiki.</span></span></td>
<td class="smwspecs"><a href="/wiki/MAKER.1#http:.2F.2Fwww.yandell-lab.org.2Fsoftware.2Fmaker.html"
title="MAKER">MAKER#http://www.yandell-lab.org/software/maker.html</a>
,
<a href="/wiki/MAKER.1#http:.2F.2Fyandell.topaz.genetics.utah.edu.2Fcgi-bin.2Fmaker_license.cgi"
title="MAKER">MAKER#http://yandell.topaz.genetics.utah.edu/cgi-bin/maker_license.cgi</a>
,
<a href="/wiki/MAKER.1#https:.2F.2Fwww.e-biogenouest.org.2Fresources.2F48"
title="MAKER">MAKER#https://www.e-biogenouest.org/resources/48</a> ,
<a href="/wiki/MAKER.1#http:.2F.2Fwww.yandell-lab.org.2Fsoftware.2Fmaker-p.html"
title="MAKER">MAKER#http://www.yandell-lab.org/software/maker-p.html</a>
,
<a href="/wiki/MAKER.1#http:.2F.2Fderringer.genetics.utah.edu.2Fcgi-bin.2FMWAS.2Fmaker.cgi"
title="MAKER">MAKER#http://derringer.genetics.utah.edu/cgi-bin/MWAS/maker.cgi</a>

and <a href="/wiki/MAKER.1#http:.2F.2Fhymenopteragenome.org.2Fant_genomes.2F"
title="MAKER">MAKER#http://hymenopteragenome.org/ant_genomes/</a> </td>
</tr>
</tbody>
</table>

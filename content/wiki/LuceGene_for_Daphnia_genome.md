---
title: "LuceGene for Daphnia genome"
---
# LuceGene for Daphnia genome

Daphnia's genome now has lots of gene annotations, wanting both search
and reporting for these. I've dusted off
**[LuceGene](/wiki/LuceGene)** which is designed for this, and
installed over the Labor Day weekend at
<a href="http://wfleabase.org/lucegene/" class="external free"
rel="nofollow">http://wfleabase.org/lucegene/</a>. It was relatively
easy to do: most of my time was in designing an XSLT stylesheet for gene
page display. Other organism databases should be able to follow these
steps, with more detail forthcoming, and have a similar gene search and
report service without special effort.

Steps involved

- Convert Daphnia's gene annotations (some 28,000) from [GFF](/wiki/GFF)
  to GeneSummary [XML](/wiki/Glossary#XML). This took a simple perl
  script and the GeneSummary XML package, at
  <a href="http://eugenes.org/gmod/gene-report-examples/"
  class="external free"
  rel="nofollow">http://eugenes.org/gmod/gene-report-examples/</a>. See
  `bin/gff2ugpxml.pl`. This is Daphnia specific, but should be easy to
  revise for other species GFF. You also want the `lib/` and `conf/`
  sections here to generate UGP-XML. See also the
  <a href="http://gmod.svn.sourceforge.net/viewvc/gmod/genepages/"
  class="external text" rel="nofollow">genepages project</a> in
  <a href="/wiki/SVN" class="mw-redirect" title="SVN">SVN</a>.
- install from the [GMOD Lucegene distribution](/wiki/Downloads)
  the web archive (lucegene.war), having already a Tomcat servlet server
  for this.
- copy and edit the `conf/ugpxml.*` configuration files, tweaking for
  Daphnia. The `ugpxml.properties` handles Lucegene indexing
  configuration, and that mostly worked but needed some field updates
  for Daphnia. The `ugpxml.xslt` for GeneSummary page reports needed the
  most work, to tune it to the specific gene annotations for this data
  set.
- also add Daphnia fasta gene and EST sequences to Lucegene search
  configurations, and the wfleabase.org web documents (updating current
  conf/ files for those).
- run the `admin/lucegene-index.sh` script to index the gene page XML,
  fasta sequences and web documents (or use `admin/make-indices` for
  all).
- update various html documents with Daphnia search examples.
- Restart Tomcat, already configured for the wfleabase.org webapps
  folder with this lucegene web archive. View results at
  <a href="http://wfleabase.org/lucegene/" class="external free"
  rel="nofollow">http://wfleabase.org/lucegene/</a>

Note that this is all what-you-see-is-what-you-get, in that the source
gene page XML is exactly what is being searched, with no hidden or extra
search tables, and is exactly what is sent to the client web browser.
The browser does the boring job of converting it to HTML display (if it
wants). Or one can use these gene pages in XML for data processing
without tedious HTML page scraping.

Here is a Daphnia gene page example,
<a href="http://wfleabase.org/lucegene/lookup?id=NCBI_GNO_292134"
class="external free"
rel="nofollow">http://wfleabase.org/lucegene/lookup?id=NCBI_GNO_292134</a>
(view the page source to see structured gene page XML). This corresponds
to these screen shots
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e3/Daphnia-genepage.png" class="internal"
title="Daphnia-genepage.png">daphnia gene page</a> and
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/96/Daphnia-genepage-xml.png"
class="internal" title="Daphnia-genepage-xml.png">gene page xml</a>.


[Dongilbert](/wiki/User%253ADongilbert) 16:23, 4 September 2007
(EDT)

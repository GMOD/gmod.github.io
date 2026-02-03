---
title: "MAKER/tool data"
---
# MAKER/tool data


This page stores the data that populates the [MAKER](../MAKER.1 "MAKER")
wiki page.

\| name = MAKER \| full_name = \| status = mature \|
dev = active \| support = active \| type = Genome Annotation \| platform
= linux, os x, unix \| logo = MAKERLogo.png \| home =
<a href="http://www.yandell-lab.org/software/maker.html"
class="external free"
rel="nofollow">http://www.yandell-lab.org/software/maker.html</a> \|
about = MAKER is a portable and easy to configure genome
[annotation](../Category%253AAnnotation "Category%253AAnnotation") pipeline.
MAKER allows smaller _eukaryotic_ genome projects and _prokaryotic_
genome projects to annotate their genomes and to create genome
databases. MAKER identifies repeats, aligns ESTs and proteins to a
genome, produces _ab initio_ gene predictions and automatically
synthesizes these data into gene annotations with evidence-based quality
values. MAKER is also easily trainable: outputs of preliminary runs can
be used to automatically retrain its gene prediction algorithm,
producing higher quality gene-models on subsequent runs. MAKER's inputs
are minimal. Its outputs are in [GFF3](../GFF3 "GFF3") or
[FASTA](../Glossary#FASTA "Glossary") format, and can be directly loaded
into <a href="../Chado" class="mw-redirect" title="Chado">Chado</a>,
[GBrowse](../GBrowse.1 "GBrowse"), [JBrowse](../JBrowse.1 "JBrowse") or
[Apollo](../Apollo.1 "Apollo").

Additional MAKER options/capabilities include:

- Map old annotation sets on to new assemblies.
- Merge multiple legacy annotation sets into a consensus set of
  annotations.
- Update existing annotations to take new evidence into account.
- Tag pre-existing gene models with evidence alignments and quality
  control metrics to assist in downstream manual curation.
- Use GFF3 pass-through to include both evidence alignments and
  predicted gene models from algorithms not natively supported by MAKER.
- MAKER is MPI capable for rapid parallelization across computer
  clusters.
- You can also easily integrate raw InterProScan results into MAKER,
  which will identify protein domains, add GO functional categories, and
  help assign putative gene functions to genome annotations. This data
  then becomes accessible as part of the GFF3 output and can be loaded
  into a <a href="../Chado" class="mw-redirect" title="Chado">Chado</a>
  database, [GBrowse](../GBrowse.1 "GBrowse"), or
  [Apollo](../Apollo.1 "Apollo").

MAKER comes with sample data for testing purposes. See the `/data`
directory in the download. \| screenshot =


<a href="../File:MAKER_Apollo_view.jpg" class="image">` tag was found**

---
title: "News/GMODTools 1.1 Released"
---
# News/GMODTools 1.1 Released

Version 1.1 of [GMODTools](../GMODTools "GMODTools") has been released.
Version 1.1 adds these features and corrections:

- No chromosome/scaffold/golden_path files. This change is needed to
  handle partially assembled genomes with many (1000s to 100,000s) of
  scaffolds. Flag no_csomesplit=1 to use this (should become default).
- Gene Ontology association file, see go_association tags in
  configurations
- Validate main variables in chado database: \${golden_path},
  \${seq_ontology}. This step, on now by default, checks that database
  contains configured values. If failed, db is inspected for real
  values.
- Miscellany bugs cured and configuration updates, e.g., tables/overview
  now again active.

[GMODTools](../GMODTools "GMODTools") is a Perl package that generates
Fasta, [GFF](../GFF "GFF"), DNA and other bulk genome annotation files
from Chado databases.

  

*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2007/10/16*

:

- [News Items](../Category%253ANews_Items "Category%253ANews Items")

---
title: "Talk:Bio GMOD GenericGenePage"
---
# Talk:Bio GMOD GenericGenePage

## Stuff Jim made up while implementing this for EcoliWiki after the Jan 2009 GMOD meeting

In the absence of a schema to check against, I developed this by example
from Josh's Flybase example. In the process, I made some arbitrary
decisions that may be incompatible with what people want for the spec.
Please suggest changes!

- We noticed that the examples did not provide strand information, which
  makes sense, because UniProt doesn't care about strand. We added a
  strand attribute with values + and -, following GFF3
- EcoliWiki represents an E. coli K-12 "pangenome", for which we
  currently have two strains (more coming soon). For this reason, we
  have multiple entries for mapLocation elements.
- For the GO terms:
  - following the FlyBase example, I only showed GO term and evidence
    code. The list is a nonredundant list of GO term:Evidence code
    pairs; in many cases there may be multiple annotations using the
    same pairs, but based on different publications.
  - The GO list omits IEA annotations.
  - The evidence code includes the code for the evidence code type (IDA,
    IMP, etc). Flybase omits this.
- The parameters are passed to PHP without using cgi parameters or
  mod_rewrite, by using the PHP global \$\_SERVER\["PATH_INFO"\].
  - gene_symbol in the example is only one way to get this return. You
    can also use different URLs for locus tags.

--[JimHu](/wiki/User%253AJimHu.1) 08:06, 17 January 2009 (UTC)

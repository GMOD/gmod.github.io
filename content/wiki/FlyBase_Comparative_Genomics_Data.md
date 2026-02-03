---
title: "FlyBase Comparative Genomics Data"
---
# FlyBase Comparative Genomics Data


  Genomics Data Implementation in
  Chado</span>](#Comparative_Genomics_Data_Implementation_in_Chado)
  - [Background](#Background)
  - [Orthology](#Orthology)
    - [a)
      orthologous regions](#a.29_orthologous_regions)
    - [b)
      orthologous genes](#b.29_orthologous_genes)
  - [Synteny](#Synteny)


# Comparative Genomics Data Implementation in Chado

by Peili Zhang, David Emmert, Pinglei Zhou, William Gelbart, and the
FlyBase Consortium

## Background

The data implementation standard of comparative genomics in Chado is
described in this document. The stated data implementation has been
formulated by the developers at FlyBase
(<a href="http://www.flybase.org" class="external free"
rel="nofollow">http://www.flybase.org</a>) and adopted by FlyBase for
production. For the purpose of clarity, pairwise comparative genomics
results are being employed in this document as examples to illustrate
the points. Yet the same implementation can be readily generalized and
applied to multiple-genome comparative results. To store the comparative
results between two genomes in Chado, the sequence and annotation data
of each of the relevant genomes need to be implemented independently in
the same Chado database instance. The Chado standards of genomic
sequences and annotation are detailed in separate documents, which
should be followed before attempting the comparative data implementation
described here. Comparative genomics data of interest are grouped into
the following two categories: orthology and synteny, for which the Chado
standards are illustrated separately below.

## Orthology

### a) orthologous regions


Figure 3: Chado representation of syntenic relationship between a pair
of genomes, based on orthologous_regions shown in Figure 1. Dmel:
Drosophila melanogaster; Dpse: Drosophila pseudoobscura.

---
title: "Chado for Prokaryotes"
---
# Chado for Prokaryotes

This page was started as a stub for producing a set of best practices
for using Chado for prokaryotes.

 adapting Chado for
 prokaryotes</span>](#Problems_in_adapting_Chado_for_prokaryotes)
 - [Representation of
 features](#Representation_of_features)
 - [Circular
 genomes](#Circular_genomes)
 - [Pan
 genomes](#Pan_genomes)
- [Bacterial MODs
 using or planning to use
 Chado](#Bacterial_MODs_using_or_planning_to_use_Chado)
- [See
 also](#See_also)

## Problems in adapting Chado for prokaryotes

The major challenges in adapting chado for prokaryotes are:

- Representation of features as Sequence Ontology types
- Circular genomes
- "Pan genomes"

### Representation of features

Chado features are instances of ontology nodes. Genome features should
be instances of types in the Sequence Ontology (SO). However

- SO uses a eukaryotic definition of gene that is not well suited to
 bacterial genomes
- Feature relationships in SO are based on eukaryotic models
- Feature types not in SO

The ideal solution is to work with SO to modify the ontology to work
with both prokaryotes and eukaryotes. This is an ongoing activity that
prokaryotic groups can participate in, and where SO has requested help
from experts in bacterial genetics and genomics. In the meantime, MODs
need to decide how to deploy Chado.

One solution has been to ignore "gene" as a feature type.

### Circular genomes

### Pan genomes

Sequencing multiple isolates of the same bacterial species leads to the
identification of new genes in each isolate, with the rate of new gene
discovery declining as a power law. The "pan genome" is a phrase used by
<a href="http://dx.doi.org/10.1073/pnas.0506758102"
class="external text" rel="nofollow">Tettelin et al. 2005</a> to
describe the set of genes present in the union of all genomes of a
bacterial species. How should this be represented this in Chado?

## Bacterial MODs using or planning to use Chado

## See also

- [IGS Data
 Representation](/wiki/IGS_Data_Representation)

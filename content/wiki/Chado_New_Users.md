---
title: "Chado New Users"
---
# Chado New Users

This page, and it's associated discussion page follow the learning curve
for new Chado users learning the system at CSHL.

  empty Chado PostgreSQL on our
  machines</span>](#Getting_an_empty_Chado_PostgreSQL_on_our_machines)
  - [Installation
    Notes](#Installation_Notes)
- [Loading the
  Ontologies](#Loading_the_Ontologies)
- [Getting the
  Sequence Module Working](#Getting_the_Sequence_Module_Working)
- [Migration from
  other databases](#Migration_from_other_databases)
- [Sample
  Data](#Sample_Data)
- [Understanding
  how things are represented in
  Chado](#Understanding_how_things_are_represented_in_Chado)
  - [Central
    Dogma](#Central_Dogma)
    - [Gene](#Gene)
    - [mRNA](#mRNA)
      - [Polycistronic transcription
        units](#Polycistronic_transcription_units)
    - [other
      RNAs](#other_RNAs)
    - [Polypeptides](#Polypeptides)
    - [Proteins](#Proteins)
- [See
  also](#See_also)

## Getting an empty Chado PostgreSQL on our machines

- Zheng - on PC with Fedora. See [Zheng's installation
  notes](/wiki/Zheng's_installation_notes)
- Mike - on Intel Mac running Fedora partition
- Jim -
  - on PPC Mac the hard way See [Jim's installation
    notes](/wiki/Jim's_installation_notes)
  - on CentOS server in Texas

### Installation Notes

If the easy way fails, the old documentation outside the wiki can be
pretty confusing.

## Loading the Ontologies

This works via make ontologies. How to do updates?

## Getting the Sequence Module Working

We think GFF3 can be thought of as a view into Chado using the [Sequence
module](/wiki/Chado_Sequence_Module) and the [CV
module](/wiki/Chado_CV_Module), or we can think of GFF3 as a
denormalized view of Chado.

## Migration from other databases

- [Zheng's notes on wormbase
  migration](/wiki/Zheng's_notes_on_wormbase_migration)
- [Jim's notes on E. coli
  migration](/wiki/Jim's_notes_on_E._coli_migration)

## Sample Data

To understand [Chado Best
Practices](/wiki/Chado_Best_Practices), where the
documentation is sometimes incomplete, we've tried to get some samples
of Chado data in use. Things we've looked at so far, and comments on
them:

- Sample yeast data from GFF3 bulk loader. The problem with this is that
  it doesn't reflect a real use case for Chado, since SGD does not use
  the Chado Schema
- FlyBase SQL dump. Zheng got this and loaded it. One problem.
  - It's huge

## Understanding how things are represented in Chado

### Central Dogma

[Chado Best Practices](/wiki/Chado_Best_Practices)
describes some of the representations. Unfortunately it's somewhat
incomplete at present.

#### Gene

Chado uses a eukaryotic-centric gene definition which is based on
monocistronic mRNAs. In this view, the gene includes information in the
genomic DNA outside of the part that codes for the mRNA. To represent a
gene, there needs to be:

- A \[<a
  href="http://gmod.cshl.edu/wiki/index.php/Chado_Tables#Table:_feature#Table:_feature"
  class="external text" rel="nofollow">feature</a>\]
  - Note that the field seqlen could be problematic - added a note.
- If the gene is mapped to the sequence, there should be a featureloc

Completing the representation of the gene seems to require additional
features of types 'mRNA' and 'exon' (and 'polypeptide' if it's protein
coding). What happens if software tries to write a feature record as a
gene without creating these? Presumably the gene feature has to be
entered first in order to have an object_id for feature_relationship.

#### mRNA

mRNA features are entered with part_of relationships to genes. This is
straightforward in cases where the mRNA is derived from a high-quality
full length cDNA (but what's the feature_relationship type?). Does an
mRNA have to have a featureloc? What if the CDS is known but the precise
ends of the UTRs are not?

##### Polycistronic transcription units

As of this writing, the description of handling dicistronic genes is not
very clear. Based on the
<a href="http://www.sequenceontology.org/gff3.shtml"
class="external text" rel="nofollow">GFF3 spec</a>:

- Parenting a CDS/polypeptide directly on a gene is deprecated because
  the gene (sensu eukaryota) includes nontranscribed regions
- A solution is to give the mRNA feature multiple parents. Thus *lacZ*,
  *lacY* and *lacA* would all be parents of *lacZYA*, which in turn
  would be parent via a derives_from relationship to the LacZ, LacY and
  LacA polypeptides.

#### other RNAs

tRNAs, rRNAs, snRNAs etc have similar relationships to genes. Note that
even in eukaryotes, rRNAs and tRNAs are often polycistronic transcripts!

#### Polypeptides

Polypeptides derive_from mRNAs

#### Proteins

Note that proteins ≠ polypeptides. Hemoglobin is a heterotetramer of two
α and two β subunits. Is there a feature type that represents this?

## See also

- [Chado -
  Getting_Started](/wiki/Chado_-_Getting_Started) -
  and documentation links from there.
-  - the Category page
  for all pages about Chado in this wiki

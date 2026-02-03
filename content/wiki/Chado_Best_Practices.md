---
title: "Chado Best Practices"
---
# Chado Best Practices

Chado is a generic [schema](/wiki/Glossary#Database_Schema), which
means anyone writing software to query or write to chado (either
[middleware](/wiki/GMOD_Middleware) or applications) should
be aware of the different ways in which data can be stored. We want to
strike a nice balance between ﬂexibility and extensibility on the one
hand, and strong typing and rigor on the other. We want to avoid the
situation we have with GenBank entries where there are a dozen ways of
representing a gene model, but we need to be able to cope with the
constant surprises biology throws at us in an attempt to confound our
nice computable models. This page on Best Practices represents the
collective wisdom of those who use Chado on a daily basis and are also
familiar with its theoretical underpinnings.

See also:

- [Chado Sequence
  Module](/wiki/Chado_Sequence_Module) - description
  of many of the terms used here
- [Introduction to
  Chado](/wiki/Introduction_to_Chado) - useful
  visualizations of some of the models described here
- [IGS Data
  Representation](/wiki/IGS_Data_Representation) -
  further discussion on these conventions and how they were implemented
  at IGS (for comparison)

  Models</span>](#Gene_Models)
  - [Canonical
    Gene Model](#Canonical_Gene_Model)
    - [Querying for Canonical
      Genes](#Querying_for_Canonical_Genes)
    - [Application
      Support](#Application_Support)
  - [Noncoding
    Genes](#Noncoding_Genes)
    - [Application
      Support](#Application_Support_2)
  - [Pseudogene](#Pseudogene)
    - [Application
      Support](#Application_Support_3)
  - [Singleton
    Feature](#Singleton_Feature)
    - [Application
      Support](#Application_Support_4)
  - [Dicistronic Gene](#Dicistronic_Gene)
  - [xxx
    Operon](#xxx_Operon)
  - [Trans-spliced
    Gene](#Trans-spliced_Gene)
    - [Application
      Support](#Application_Support_5)
  - [xxx Gene
    with Regulatory Elements](#xxx_Gene_with_Regulatory_Elements)
  - [xxx
    Transposons](#xxx_Transposons)
  - [Gene with
    Implicit Features
    Manifested](#Gene_with_Implicit_Features_Manifested)
  - [Unlocalized Gene](#Unlocalized_Gene)
    - [Application
      Support](#Application_Support_6)
  - [Feature
    Localization](#Feature_Localization)
  - [Feature
    Localization to Contigs in
    Assembly](#Feature_Localization_to_Contigs_in_Assembly)
    - [Application
      Support](#Application_Support_7)
  - [Redundant
    Localizations to Different Assembly
    Levels](#Redundant_Localizations_to_Different_Assembly_Levels)
    - [Application
      Support](#Application_Support_8)
  - [N-level
    Assemblies](#N-level_Assemblies)
  - [Immature
    or Primary RNA](#Immature_or_Primary_RNA)
- [xxx Genomic
  Rearrangements](#xxx_Genomic_Rearrangements)
  - [Inversions](#Inversions)
  - [Translocations](#Translocations)
  - [Deletions](#Deletions)
  - [Copy
    Number Variations](#Copy_Number_Variations)
- [Single
  Nucleotide Polymorphisms
  (SNPs)](#Single_Nucleotide_Polymorphisms_.28SNPs.29)
  - [Extensions](#Extensions)
  - [Similarities to
    Alignments](#Similarities_to_Alignments)
  - [Redundant
    Storage of Coordinates on Different Assembly
    Levels](#Redundant_Storage_of_Coordinates_on_Different_Assembly_Levels)
- [Sequence
  Alignments](#Sequence_Alignments)
  - [Results
    from BLAST](#Results_from_BLAST)
  - [xxx
    Multiple Sequence
    Alignments](#xxx_Multiple_Sequence_Alignments)
- [xxx
  Posttranslational
  Modifications](#xxx_Posttranslational_Modifications)
- [xxx
  Genotypes](#xxx_Genotypes)
- [xxx
  Phenotypes](#xxx_Phenotypes)
- [xxx
  Cleavage](#xxx_Cleavage)
- [xxx Protein
  Complexes](#xxx_Protein_Complexes)
- [GO
  annotations](#GO_annotations)
- [xxx Genome
  Versions](#xxx_Genome_Versions)

### Gene Models

This section describes how one describes commonly encountered gene
models in Chado.

#### Canonical Gene Model

The <a href="http://en.wikipedia.org/wiki/Central_dogma" class="extiw"
title="wp:Central dogma">central dogma</a> model states that "gene makes
mRNA makes polypeptide" - for many people using Chado this may be the
only data model that's relevant. This typical protein-coding gene model
consists of one gene, one or more mRNAs, one or more exons, and at least
one polypeptide.

Alternately spliced genes have a 1-to-many relation between gene and
mRNA. Exons can be _part_of_ more than one mRNA. No two distinct exon
rows should have exact same [featureloc](#Table:_featureloc) coordinates
(this would indicate they are the same exon).

Every feature must have a featureloc with rank=0 and locgroup=0. The
value of the _srcfeature_id_ column should be identical (i.e. all
features are located relative to the same feature), except in rare
circumstances such as when a feature crosses two contigs (software is
not guaranteed to support this). The _srcfeature_id_ can point to a
<a href="http://www.sequenceontology.org/miSO/SO_CVS/contig.html"
class="external text" rel="nofollow">contig</a>, a
<a href="http://www.sequenceontology.org/miSO/SO_CVS/chromosome.html"
class="external text" rel="nofollow">chromosome</a>, <a
href="http://www.sequenceontology.org/miSO/SO_CVS/chromosome_arm.html"
class="external text" rel="nofollow">chromosome_arm</a> or other
appropriate assembly unit.

This scenario involves rows in the following tables:

| Table                                                                      | type_id                                                         | Number                                                                                                                             | Comments                                                                                                                                                                                                                                                                                                                                                                           | -------------------------------------------------------------------------- | --------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | feature                                                                    | <a href="http://www.sequenceontology.org/miSO/SO_CVS/gene.html" | class="external text" rel="nofollow">SO:Gene</a>                           | 1                                                               | The gene must always be provided                                                                                                   | feature                                                                    | <a href="http://www.sequenceontology.org/miSO/SO_CVS/mRNA.html" | class="external text" rel="nofollow">SO:mRNA</a>                           | 1 or more                                                       | One or more transcripts are required, and these are always of type <a href="http://www.sequenceontology.org/miSO/SO_CVS/mRNA.html" | class="external text" rel="nofollow">SO:mRNA</a> for protein-coding genes. | feature                                                                    | exon                                                            | 1 or more                                                                                                                          | Exons are always required, even if the genome under consideration has no introns.                                                                                                                                                                                                                                                                                                  | feature                                                                    | polypeptide                                                     | At least 1                                                                                                                         | A protein-coding gene always produces a polypeptide, by definition. The polypeptide is located relative to the same genomic feature as the exons, mRNAs and gene. A single featureloc is used, with _fmin_ and _fmax_ indicating the start and stop codon positions (location is inclusive of stop codon). The polypeptide sequence should be specified as an amino acid sequence. |

##### Querying for Canonical Genes

Sample query: retrieve a gene, "Dredd", along with its transcripts,
proteins and exons. Since this is a "canonical gene" we can assume that
its [feature
graph](/wiki/Introduction_to_Chado#Feature_Graphs) has
3 levels. If we follow this assumption:

```de1
    SELECT * FROM feature AS gene
         INNER JOIN
       feature_relationship AS feat0 ON (gene.feature_id = feat0.object_id)
         INNER JOIN
       feature AS subfeat1 ON (subfeat1.feature_id = feat0.subject_id)
         INNER JOIN
       feature_relationship AS feat1 ON (subfeat1.feature_id = feat1.object_id)
         INNER JOIN
       feature AS subfeat2 ON (subfeat2.feature_id = feat1.subject_id)
    WHERE
       gene.name = 'Dredd';
```

This query should fetch a 3-deep graph rooted at "Dredd".

##### Application Support

- Supported by [Apollo](/wiki/Apollo.1)
- Supported by [GBrowse](/wiki/GBrowse.1)

#### Noncoding Genes

Similar to [canonical model](#Canonical_Gene_Model), except with
noncoding-RNA not all genes are protein-coding. Genes can code for tRNA,
miRNA, snoRNA, etc. A noncoding gene model is identical to a [canonical
model](#Canonical_Gene_Model), with the following exceptions:

- There is no polypeptide feature
- Instead of an mRNA feature, there is a feature that is some other
  sub-type of RNA

##### Application Support

- Supported by [Apollo](/wiki/Apollo.1)
- Supported by [GBrowse](/wiki/GBrowse.1)

#### Pseudogene

A pseudogene is a non-functional relic of a gene. A pseudogene may look
like an ordinary gene, and may even have discernible parts such as
exons. It may sometimes be desirable to annotate the exon structure of a
pseudogene - this can in principle be done using SO types such as
<a href="http://www.sequenceontology.org/miSO/SO_CVS/decayed_exon.html"
class="external text" rel="nofollow">decayed_exon</a>. In practice
no-one is using Chado to do this. There are currently two practices:

- Pseudogenes are treated analogously to [Noncoding
  Genes](#Noncoding_Genes). That is, there are normal "gene" and "exon"
  features. However, in place of a subtype of RNA, there is a feature of
  type pseudogene. This practice is **strongly discouraged** (it is not
  compliant with the relations in
  <a href="http://sequenceontology.org" class="external text"
  rel="nofollow">SO</a>, it gives false counts to the number of real
  genes in the database). Note that this is the current default for
  <a href="http://flybase.org" class="external text"
  rel="nofollow">FlyBase</a>.
- Pseudogenes are normal [singleton features](#Singleton_Feature). There
  is no annotation of exon structure. This practice is encouraged. If at
  a later date it becomes desirable to annotated the exon structure of a
  pseudogene, it will be compatible with this.

##### Application Support

- [Apollo](/wiki/Apollo.1): status is unclear.

Apollo by default treats pseudogenes using the first method, above. It
may also be possible to configure it to the second, singleton, method.
Annotating the exon structure of pseudogenes the correct way has not yet
been attempted to our knowledge.

#### Singleton Feature

Many types of features are singletons - that is they are not related to
other features through the
[feature_relationship](#Table:_feature_relationship) table. Storage of
these is basic and as one may expect. Singleton features present no
major problems. Unlike genes, which typically have parts (with the parts
having subparts), singletons do not form feature graphs (or rather, they
form feature graphs consisting of single nodes). Singleton features are
located relative to other features (usually the genome, but once can
have singletons that are located relative to other features - this may
not be supported by all applications)

##### Application Support

- Supported by [Apollo](/wiki/Apollo.1)
- Supported by [GBrowse](/wiki/GBrowse.1)

Apollo supports singletons provided they are located relative to the
genome (singletons located relative to other features will be ignored).
It may be necessary to configure apollo to make the feature type
"1-level".

#### Dicistronic Gene

A dicistronic gene is a gene with a mRNA that codes for two distinct
non-overlapping CDSs. Dicistronic genes (see for example, the
<a href="http://www.flybase.org/reports/FBgn0000056.html"
class="external text" rel="nofollow"><em>Drosophila</em> Adh and Adhr
genes</a>) have totally distinct gene products deriving from the same
transcript. To confuse matters, the two polypeptides are commonly
referred to as being derived from two distinct genes (e.g. Adh and Adhr).
In a database such as <a href="http://flybase.org" class="external text"

database - one for each of the two non-overlapping genes, and one for
the gene cassette.

Dicistronic genes make it difficult to have a formal definition of gene
that corresponds nicely with how biologists use the term.

<table data-border="2" data-cellpadding="4" data-cellspacing="0"
style="margin: 1em 1em 1em 0; background: #ffaaaa; border: 2px #aaa solid; border-collapse: collapse;"
data-align="right" width="200px">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><span class="small"><strong>Problem/Question</strong></span>:<br />
&#10;<p>I actually find this assertion kind of offensive, since it relegates
all of prokaryotic molecular biology to being outside the realm of
biologists who use the term "gene". Note that although the test refers
to two proposals, they are not linked/or described. What the heck are
they?!!! <a href="/wiki/User%253AJimHu.1" title="User%253AJimHu">JimHu</a> 13:33, 10
April 2007 (EDT)</p></td>
</tr>
</tbody>
</table>

There are currently two proposals for handling dicistronic genes. The
first is a hack and introduces redundancy, but works well with existing
software and tools. The second is preferred from a modeling standpoint,
but introduces a lot of complexity to software.

#### xxx Operon

Bacterial genes are often transcribed in groups; e.g. _lacZ_, _lacA_ and
_lacY_ make up the
<a href="http://en.wikipedia.org/wiki/Lac_operon" class="extiw"
title="wp:Lac operon">Lac operon</a>. There are many similarities with
[dicistronic genes](#Dicistronic_Gene) here.

#### Trans-spliced Gene

A trans-spliced gene has one or more transcripts in which that
transcript may be spliced together from different parts of the genome.

A trans-spliced transcript is spliced from exons coming from different
parts of the genome. The distance between each trans-spliced part may be
large, or it may be in the same location on the opposite strand.

Most _C. elegans_ genes have a trans-spliced leader sequence. This is
different from the trans-splicing involved in _Drosophila_, where we
observe what appears to be two transcripts on separate strands (both
containing coding sequence) joining together in a single functional
transcript.

There are two proposals for dealing with this. One treats the
trans-spliced transcript as a single transcripts, with exons coming from
different locations. The other treats the trans-spliced transcript as a
mature transcript created from two distinct primary transcripts. Note
that these proposals focus on the _Drosophila_ example. A solution for
the _C. elegans_ example has not been proposed.

We treat this as an ordinary gene model, but relax our rules for exon
locations in a transcript. For example, for the canonical _Drosophila_
trans-spliced gene, we would allow transcripts to have exons on
different strands. Note that in Chado, exon ordering comes from
_feature_relationship.rank_ (between exon and transcript), **not** from
the featureloc of the exon. Chado has no problem with this. However,
some software may make assumptions that all exons are on the same
strand, or may try to order exons by their location to get a transcript
sequence. This software will have unintended consequences with
trans-spliced genes modeled using this proposal.

We would introduce extra transcripts, and have relations between the
transcripts. Only the mature, spliced, transcript would have a relation
to the polypeptide. This may model the biology better. However, it
introduces a major departure from the [canonical gene
model](#Canonical_Gene_Model). For this reason this proposal is unlikely
to be adopted.

##### Application Support

- [Apollo](/wiki/Apollo.1): status unclear.
- [GBrowse](/wiki/GBrowse.1): status unclear.

#### xxx Gene with Regulatory Elements

Regulatory elements may be implicitly or explicitly associated with a
gene.

#### xxx Transposons

Transposons can be annotated as [singleton features](#Singleton_Feature)
or as complex annotations. You would create a feature of type transposon
insertion, with a loc of type 0 for insertion sites when the insertion
is absent, 1 if present, and -1 (?) to link to the "template" -- generic
representation of the transposon?

A transposon may consist of various parts such as <a
href="http://www.sequenceontology.org/miSO/SO_CVS/long_terminal_repeats.html"
class="external text" rel="nofollow">long_terminal_repeats</a> and gene
models coding for genes like gag, pol, and env. These parts may have all
decayed over time. Transposon annotation typically ignores these
subtleties as all that is usually required is a singleton-feature of
type <a
href="http://www.sequenceontology.org/miSO/SO_CVS/transposable_element_feature.html"
class="external text" rel="nofollow">transposable_element_feature</a>.
In this case, there is no difficulty.

If one requires detailed transposon annotation then one is entering
uncharted water as far as both Chado and annotation tools are concerned
(which is why this scenario is marked as being under discussion). One
option would be to treat each transposon part as distinct singletons,
but this may be unsatisfactory as one may desire to have the appropriate
_part_of_ relations between the parts.

#### Gene with Implicit Features Manifested

Some feature types such as introns are not normally manifested as rows
in chado. They are normally derived on-the-fly from the gaps between
consecutive exons. See for an example. Occasionally it may be desirable
to store the introns as actual rows in the feature table - for example
in a report database.

#### Unlocalized Gene

A gene without sequence based localization.

Many chado instances are purely concerned with genome annotation - in
these cases it would be strange to have genes or other features such as
transcripts with no localization (i.e. no featurelocs). However, this
scenario is actually common when Chado is used in a wider context. We
may learn of the existence of genes through non-sequence evidence such
as genetics. When we have no sequence-based localization it is perfectly
valid to have gene features with no featurelocs. When the time comes to
create genome annotations for these, we just 'fill out' the gene feature
by adding transcript and exon features.

##### Application Support

- [GBrowse](/wiki/GBrowse.1): supported.
- [Apollo](/wiki/Apollo.1): supported.

GBrowse supports this scenario in that unlocalized features will be
ignored from the genome viewer, which is appropriate.

Apollo supports this scenario in that unlocalized features will be
ignored, which is appropriate behaviour for a genome annotation tool.

#### Feature Localization

All features with sequence annotation should be localized using
[featureloc](#Table:_featureloc).

Localized features must have a featureloc with rank=0 and locgroup=0.
This is the primary location of the feature. The location always
indicates the boundaries of the feature. If the feature is composed of
distinct subfeatures (e.g. a transcript composes of exons), then it is
**not** permitted to use multiple featurelocs to indicate this. Instead,
there must be rows for the subfeatures, each with their own featureloc.

In a feature graph (i.e. a group of features connected _via_
[feature_relationship](/wiki/Chado_Tables#Table:_feature_relationship)
rows, all features will typically be localized relative to the same
source feature (i.e. they will all have the same value for
[featureloc.srcfeature_id](/wiki/Chado_Tables#Table:_featureloc)).

Features are typically localized to some kind of genomic or assembly
feature, but chado does not constrain you to using only this. For
example, localizing features relative to a transcript or polypeptide or
even exon is permitted, but unusual practices will most likely not be
recognized by most software.

#### Feature Localization to Contigs in Assembly

In an assembled genome, it is common to locate relative to the top-level
assembly units (e.g. chromosomes). However, it is also permissible to
locate to smaller units such as
<a href="http://www.sequenceontology.org/miSO/SO_CVS/contig.html"
class="external text" rel="nofollow">contigs</a> or <a
href="http://www.sequenceontology.org/miSO/SO_CVS/golden_path_unit.html"
class="external text" rel="nofollow">golden_path_units</a>.

If a genome assembly is not stable, it is common to locate relative to
assembly units such as contigs. These contigs may then be localized
relative to the top-level assembly units. This is known in chado terms
as a location graph.

We discuss here location graphs of depth 2. See also [N-level
assemblies](#N-level_Assemblies). This scenario is often invisible to
software interoperating with Chado. The software is free to only look at
the main features and the contig-level feature and ignore the top-level
assembly feature. It may sometimes be desirable to have software that
can perform location transformations, mapping features from contigs to
top-level units and back.

##### Application Support

- [Apollo](/wiki/Apollo.1): status unclear.
- [GBrowse](/wiki/GBrowse.1): status unclear.

Apollo should be happy to treat contigs just as if they were top-level
units as chromosome arms. However, the user may have to explicitly
provide contigs if location queries are desired. For example, Apollo may
retrieve nothing if the user asks for a certain range on "chromosome 4",
and the features are located relative to contigs which are themselves on
"chromosome 4".

GBrowse may expect features to be located relative to top-level units
such as chromosomes.

#### Redundant Localizations to Different Assembly Levels

Features can be located relative to both contigs and top-level assembly
units.

Chado allows redundant feature localization using _featureloc.locgroup_
\> 0. This allows a database to have primary locations for features
relative to contigs, and secondary locations relative to top-level units
such as chromosomes. The converse is also allowed.

However this scenario is discouraged unless the chado db admin knows
what they are doing. They must implement solutions to ensure that
featurelocs with varying locgroup do not get out of sync. These
solutions are not part of the standard Chado software suite.
Nevertheless, this scenario may be useful for advanced users in certain
circumstances

##### Application Support

- [GBrowse](/wiki/GBrowse.1): status unclear.
- [GBrowse](/wiki/GBrowse.1): status partial.

It is not clear if GBrowse uses _locgroup_ in querying. If it constrains
by _locgroup_, then this is essentially the same as [feature
localization to contigs in
assembly](#Feature_Localization_to_Contigs_in_Assembly).

Not clear if Apollo uses _locgroup_ in querying. If it constrains by
_locgroup_, then this is essentially the same as [feature localization
to contigs in assembly](#Feature_Localization_to_Contigs_in_Assembly).
Apollo will not preserve redundant *featureloc*s when writing back to
the database. This could lead to the database getting out of sync.

#### N-level Assemblies

In theory it is possible (but rare) to have assemblies with variable
depths, or with depths \> 2. This scenario is rare. If required, then
Chado can deal with this - there is no theoretical limit to the depth of
a location graph. One can have annotated features located relative to
minicontigs which are located relative to supercontigs which are located
relative to chromosomes. Most software that interoperates with Chado
will not be able to deal with this, so this scenario is discouraged
except by advanced users who have no other option.

#### Immature or Primary RNA

Generally we do not explicitly represent primary RNA transcripts unless
there is something useful to say about them. If one wants to instantiate
these they would be represented as features, and the mature message
would be related to the primary message with _derived_from_ as _type_id_
in the
[feature_relationship](/wiki/Chado_Tables#Table:_feature_relationship)
table.

### xxx Genomic Rearrangements

#### Inversions

Create a feature of type inversion with location spanning the inverted
region with rank 0. If there is a version of the sequence containing the
inversion create a featureloc to the inverted region with rank 1. The
ranks serve to distinguish the two versions in case several sequences
carry one or the other, but the choice of which is 0 and which is 1 is
arbitrary, unless 0 is used for "wild type".

For example, for a rearrangement that exchanges the ends of two
chromosomes A and B, create two features of Afrag and Bfrag of type
rearranged segment, "locate" on A and B, then create features for A' and
B' (post-rearrangement) and locate on B' and A', respectively. How to
capture the fact that Afrag and Bfrag and A' and B' are part of same
rearrangement? Use feature relations?

#### Translocations

Create a feature of type translocation with a location spanning the
translocated region, rank 0. Rank=1 is used for insertion locations:
whether latent (i.e. the site of the insertion on a contig that lacks
the insertion) or explicit (the site of the insertion on a contig that
carries it). The coordinates are adjusted accordingly. Note that if CV
terms are used instead of rank=0, rank=1, etc. than we can be clearer
about this.

Good point; we pondered adding a CV term to featureloc (I think it's
still useful to have rank anyway - e.g. for multiple alignments).

#### Deletions

#### Copy Number Variations

### Single Nucleotide Polymorphisms (SNPs)

This outlines one way of modeling SNPs in chado. it also illustrates use
of the [featureloc](/wiki/Chado_Tables#Table:_featureloc)
table.

Most of this applies to other variation features, but we will illustrate
using SNPs for now to keep it simple.

A SNP is represented as a single feature in chado.

Let's take a basic example - a SNP that changes an A to a G on the
genome.

Here we would have one feature and two featurelocs.

    (feature
     (name "SNP_01")
     (featureloc
       (srcfeature "Chromosome_arm_2L") ;;; dna feature identifier
       (nbeg 1000000)
       (nend 1000001)
       (strand 1)
       (residue_info "A")
       (rank 0)
       (locgroup 0))
     (featureloc
       (residue_info "G")
       (rank 1)
       (locgroup 0)))

The first location is on the chromosome arm (presumably wild type). The
second location has no _srcfeature_ value (i.e. it is set to null).
However, it is effectively paired with the first location. if we later
wished to instantiate the mutant chromosome arm feature, we would fill
in the second locgroup's _srcfeature_.

Let's take another example - a SNP that has only been characterised at
the protein level. This SNP changes an _I_ to a _V_.

    (feature
     (name "SNP_02")
     (featureloc
       (srcfeature "dpp-P1")    ;;; protein feature identifier
       (nbeg 23)
       (nend 24)
       (strand 1)
       (residue_info "I")
       (rank 0)
       (locgroup 0))
     (featureloc
       (residue_info "V")
       (rank 1)
       (locgroup 0)))

Again, the second featureloc has no srcfeature. The mutant protein is
implicit. The mutant protein sequence can be inferred by taking the
sequence of _dpp-P1_ and substituting the 24th residue with a _V_.

To do a query for all SNPs that switch I to V or vice versa:

```de1
SELECT snp.*
FROM
  featureloc AS wildloc,
  featureloc AS mutloc,
  feature AS snp,
  cvterm AS ftype
WHERE
  snp.type_id = ftype.cvterm_id        AND
  ftype.termname = 'snp'               AND
  wildloc.feature_id = snp.feature_id  AND
  mutloc.feature_id = snp.feature_id   AND
  wildloc.locgroup = mutloc.locgroup   AND
  wildloc.residue_info = 'I'           AND
  mutloc.residue_info = 'I';
```

Note that this query remains the same even if mutant protein features
are instantiated as opposed to left implicit.

Let's look at a more complex example. If we have a SNP that has been
localised to the genome, and the SNP has an effect on a protein
(Isoleucine to Threonine), and we want to redundantly store the SNP
effect on the genome, transcript and translation.

Note that in this example, the transcript is on the reverse strand, so
the residue is reverse complemented.

    (feature
     (name "SNP_03")

     ;; position on genome
     (featureloc
       (srcfeature "chrom_arm_3R")
       (nbeg 2000000)
       (nend 2000001)
       (strand 1)
       (residue_info "A")
       (rank 0)                       ;; wild
       (locgroup 0))
     (featureloc
       (residue_info "G")
       (rank 1)                       ;; mutant
       (locgroup 0))

     ;; position on transcript
     (featureloc
       (srcfeature "blah-transcript001")     ;; processed transcript ID
       (nbeg 1000)
       (nend 1001)
       (strand 1)
       (residue_info "T")
       (rank 0)                       ;; wild
       (locgroup 1))
     (featureloc
       (residue_info "C")
       (rank 1)                       ;; mutant
       (locgroup 1))

     ;; position on protein
     (featureloc
       (srcfeature "blah-protein001")    ;;; protein feature identifier
       (nbeg 23)
       (nend 24)
       (strand 1)
       (residue_info "I")
       (rank 0)                       ;; wild
       (locgroup 2))
     (featureloc
       (residue_info "T")
       (rank 1)                       ;; mutant
       (locgroup 2)))

Here we have 6 locations for one SNP. The 6 locations can be imagined to
be in a 2-D matrix. The purpose of _rank_ and _locgroup_ is to specify
the column and row in the matrix.

| Allele    | Genome | Transcript | Protein | --------- | ------ | ---------- | ------- | Wild-type | A      | T          | I       | Mutant    | G      | C          | T       |

_rank_ is used to group the strain and _locgroup_ is used for the
grouping within that strain. rank=0 should be used for the wildtype, but
this is not always possible; locgroup=0 should be used for primary (as
opposed to derived) location, this is not always possible. The important
thing is consistency within a SNP to preserve the matrix.

One can imagine rare (but entirely possible) cases where by a single SNP
causes different protein level changes in two proteins (for instance,
HIV carries a doubly encoded gene - i.e. the ORFs overlap but have
different frames).

Here we would want to add another locgroup, for the second protein.

| Allele    | Genome | Transcript | Protein1 | Protein2 | --------- | ------ | ---------- | -------- | -------- | Wild-type | A      | T          | I        | Y        | Mutant    | G      | C          | T        | H        |

Again, if we don't need to instantiate the 2 mutant proteins, but their
sequence can be reconstructed from the wild type proteins plus the
corresponding mutation.

Remember chado uses [interbase
coordinates](/wiki/Introduction_to_Chado#Interbase_Coordinates),
and postgresql substring counts from 1.

The following query dynamically constructs mutant feature residues based
on the wild type feature and the mutant residue changes. this should
work for a variety of variation features, not just SNPs. Note that we
need to use _locgroup_ to properly group wild type/mutant pairs of
locations, otherwise this query will give bad data.

```de1
SELECT
 snp.name,
 wildfeat.name,
 substr(wildfeat.residues,
        1,
        wildloc.nbeg)  mutloc.residue_info   substr(wildfeat.residues,
        wildloc.nend+1)
FROM
  featureloc AS wildloc,
  feature AS wildfeat,
  featureloc AS mutloc,
  feature AS snp,
  cvterm AS ftype
WHERE
  snp.type_id = ftype.cvterm_id         AND
  ftype.termname = 'snp'                AND
  wildloc.feature_id = snp.feature_id   AND
  mutloc.feature_id = snp.feature_id    AND
  wildloc.locgroup = mutloc.locgroup    AND
  wildloc.srcfeature = wildfeat
```

#### Extensions

The above will also work if we have a polymorphic site with a number of
different possibilities across multiple strains. We just extend the
number of rows in the location matrix (i.e. we have rank \> 1).

We could also instantiate multiple SNPs, one per strain, and keep the
locations pairwise.

#### Similarities to Alignments

You should hopefully notice the parallels between modeling SNPs and
modeling pairwise (e.g. BLAST) and multiple alignments. The difference
is, alignments would always have locgroup=0, with the rank
distinguishing query from subject. Also, with an HSP feature, the
_residue_info_ is used to store the alignment string.

#### Redundant Storage of Coordinates on Different Assembly Levels

Some groups may find it advantageous to redundantly store features
relative to both BACs and chromosomes (or to mini-contigs and
scaffolds... choose your favourite assembly units). The approach
outlined above works perfectly well with this, we would simple add
another column in the location matrix (i.e. another wild type/mutant
pair with a distinct locgroup). All queries should work the same.

### Sequence Alignments

#### Results from BLAST

These steps will add a BLAST analysis to a Chado database.
[Load_BLAST_Into_Chado](/wiki/Load_BLAST_Into_Chado)
provides a worked example of this using BioPerl and GMOD scripts,
bp_search2gff.pl and gmod_bulk_load_gff3.pl

- Create a record for the BLAST search itself is an entry in the
  [analysis](/wiki/Chado_Tables#Table:_analysis) table.
- Create a feature for both the query and target sequences. If these
  have database accessions or identifiers then records in the
  [dbxref](/wiki/Chado_Tables#Table:_dbxref) table should be
  created for each.
  - Optionally include the residues of the features.
- Store the hits in both the
  [feature](/wiki/Chado_Tables#Table:_feature) and
  [analysisfeature](/wiki/Chado_Tables#Table:_analysisfeature)
  tables, as well as in the
  [featureloc](/wiki/Chado_Tables#Table:_featureloc) table,
  where the featureloc entry for the query sequence has a
  featureloc.rank of 0 and the featureloc.rank of the target sequence
  is 1. The <a href="http://sequenceontology" class="external text"
  rel="nofollow">SO</a> term is _match_.
  - Note: _featureloc.locgroup_ is not used.
- Store the HSPs in both the
  [feature](/wiki/Chado_Tables#Table:_feature) and
  [analysisfeature](/wiki/Chado_Tables#Table:_analysisfeature)
  tables, as well as in the
  [featureloc](/wiki/Chado_Tables#Table:_featureloc) table,
  where the featureloc entry for the query sequence has a
  featureloc.rank of 0 and the featureloc.rank of the target sequence
  is 1. The <a href="http://sequenceontology" class="external text"
  rel="nofollow">SO</a> term is _match_part_.
  - Note: _featureloc.locgroup_ is not used.
- Map the hits and the HSPs to each other _via_ entries in the
  [feature_relationship](/wiki/Chado_Tables#Table:_feature_relationship)
  tables.
- Standard scores (rawscore, normscore, significance, identity) are
  stored in the
  [analysisfeature](/wiki/Chado_Tables#Table:_analysisfeature)
  table. For BLAST searches those would correspond to bits, score,
  e-value and frac_identical.

#### xxx Multiple Sequence Alignments

### xxx Posttranslational Modifications

### xxx Genotypes

### xxx Phenotypes

### xxx Cleavage

### xxx Protein Complexes

### GO annotations

The details on GO annotation can be foind on the
<a href="http://www.geneontology.org/GO.annotation.shtml"
class="external text" rel="nofollow">Gene Ontology Consortium</a>
website. GO annotations can be captured in the Chado schema using the CV
and the SEQUENCE modules. The CV module can be used to store the GO
Ontology. Details of the CV module can be found at CV module
documentation. The actual GO annotation which is a association between
Gene Product/Gene is stored in the [Feature_cvterm
table](/wiki/Chado_Tables#Table:_feature_cvterm). It is
recommended that the GO term should be associated with a Gene Product
feature. But, it could be associated with Gene feature. The Evidence
code and qualifier information are stored in the
[Feature_cvtermprop](/wiki/Chado_Tables#Table:_feature_cvtermprop)
table.
[Feature_cvterm_Dbxref](/wiki/Chado_Tables#Table:_feature_cvterm_dbxref)
table should be used to store the external ids associated with the
evidence code, and
[Feature_cvterm_pub](/wiki/Chado_Tables#Table:_feature_cvterm_pub)
should link publications to annotations. For example evidence IEA with
dictyBase:DDB0185051

### xxx Genome Versions

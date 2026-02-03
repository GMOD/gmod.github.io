---
title: "Chado New Users"
---




<span id="top"></span>




# <span dir="auto">Chado New Users</span>









This page, and it's associated discussion page follow the learning curve
for new Chado users learning the system at CSHL.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Getting an
  empty Chado PostgreSQL on our
  machines</span>](#Getting_an_empty_Chado_PostgreSQL_on_our_machines)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">Installation
    Notes</span>](#Installation_Notes)
- [<span class="tocnumber">2</span> <span class="toctext">Loading the
  Ontologies</span>](#Loading_the_Ontologies)
- [<span class="tocnumber">3</span> <span class="toctext">Getting the
  Sequence Module Working</span>](#Getting_the_Sequence_Module_Working)
- [<span class="tocnumber">4</span> <span class="toctext">Migration from
  other databases</span>](#Migration_from_other_databases)
- [<span class="tocnumber">5</span> <span class="toctext">Sample
  Data</span>](#Sample_Data)
- [<span class="tocnumber">6</span> <span class="toctext">Understanding
  how things are represented in
  Chado</span>](#Understanding_how_things_are_represented_in_Chado)
  - [<span class="tocnumber">6.1</span> <span class="toctext">Central
    Dogma</span>](#Central_Dogma)
    - [<span class="tocnumber">6.1.1</span>
      <span class="toctext">Gene</span>](#Gene)
    - [<span class="tocnumber">6.1.2</span>
      <span class="toctext">mRNA</span>](#mRNA)
      - [<span class="tocnumber">6.1.2.1</span>
        <span class="toctext">Polycistronic transcription
        units</span>](#Polycistronic_transcription_units)
    - [<span class="tocnumber">6.1.3</span> <span class="toctext">other
      RNAs</span>](#other_RNAs)
    - [<span class="tocnumber">6.1.4</span>
      <span class="toctext">Polypeptides</span>](#Polypeptides)
    - [<span class="tocnumber">6.1.5</span>
      <span class="toctext">Proteins</span>](#Proteins)
- [<span class="tocnumber">7</span> <span class="toctext">See
  also</span>](#See_also)



## <span id="Getting_an_empty_Chado_PostgreSQL_on_our_machines" class="mw-headline">Getting an empty Chado PostgreSQL on our machines</span>

- Zheng - on PC with Fedora. See [Zheng's installation
  notes](Zheng's_installation_notes "Zheng's installation notes")
- Mike - on Intel Mac running Fedora partition
- Jim -
  - on PPC Mac the hard way See [Jim's installation
    notes](Jim's_installation_notes "Jim's installation notes")
  - on CentOS server in Texas

### <span id="Installation_Notes" class="mw-headline">Installation Notes</span>

If the easy way fails, the old documentation outside the wiki can be
pretty confusing.

## <span id="Loading_the_Ontologies" class="mw-headline">Loading the Ontologies</span>

This works via make ontologies. How to do updates?

## <span id="Getting_the_Sequence_Module_Working" class="mw-headline">Getting the Sequence Module Working</span>

We think GFF3 can be thought of as a view into Chado using the [Sequence
module](Chado_Sequence_Module "Chado Sequence Module") and the [CV
module](Chado_CV_Module "Chado CV Module"), or we can think of GFF3 as a
denormalized view of Chado.

## <span id="Migration_from_other_databases" class="mw-headline">Migration from other databases</span>

- [Zheng's notes on wormbase
  migration](Zheng's_notes_on_wormbase_migration "Zheng's notes on wormbase migration")
- [Jim's notes on E. coli
  migration](Jim's_notes_on_E._coli_migration "Jim's notes on E. coli migration")

## <span id="Sample_Data" class="mw-headline">Sample Data</span>

To understand [Chado Best
Practices](Chado_Best_Practices "Chado Best Practices"), where the
documentation is sometimes incomplete, we've tried to get some samples
of Chado data in use. Things we've looked at so far, and comments on
them:

- Sample yeast data from GFF3 bulk loader. The problem with this is that
  it doesn't reflect a real use case for Chado, since SGD does not use
  the Chado Schema
- FlyBase SQL dump. Zheng got this and loaded it. One problem.
  - It's huge

## <span id="Understanding_how_things_are_represented_in_Chado" class="mw-headline">Understanding how things are represented in Chado</span>

### <span id="Central_Dogma" class="mw-headline">Central Dogma</span>

[Chado Best Practices](Chado_Best_Practices "Chado Best Practices")
describes some of the representations. Unfortunately it's somewhat
incomplete at present.

#### <span id="Gene" class="mw-headline">Gene</span>

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

  

#### <span id="mRNA" class="mw-headline">mRNA</span>

mRNA features are entered with part_of relationships to genes. This is
straightforward in cases where the mRNA is derived from a high-quality
full length cDNA (but what's the feature_relationship type?). Does an
mRNA have to have a featureloc? What if the CDS is known but the precise
ends of the UTRs are not?

##### <span id="Polycistronic_transcription_units" class="mw-headline">Polycistronic transcription units</span>

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

#### <span id="other_RNAs" class="mw-headline">other RNAs</span>

tRNAs, rRNAs, snRNAs etc have similar relationships to genes. Note that
even in eukaryotes, rRNAs and tRNAs are often polycistronic transcripts!

#### <span id="Polypeptides" class="mw-headline">Polypeptides</span>

Polypeptides derive_from mRNAs

#### <span id="Proteins" class="mw-headline">Proteins</span>

Note that proteins ≠ polypeptides. Hemoglobin is a heterotetramer of two
α and two β subunits. Is there a feature type that represents this?

## <span id="See_also" class="mw-headline">See also</span>

- [Chado -
  Getting_Started](Chado_-_Getting_Started "Chado - Getting Started") -
  and documentation links from there.
- [Category%253AChado](Category%253AChado "Category%253AChado") - the Category page
  for all pages about Chado in this wiki




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [User
  Experiences](Category%253AUser_Experiences "Category%253AUser Experiences")






## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AChado_New_Users" accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>





### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>




### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_New_Users" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 19:58 on 22 April
  2008.</span>
<!-- - <span id="footer-info-viewcount">50,450 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





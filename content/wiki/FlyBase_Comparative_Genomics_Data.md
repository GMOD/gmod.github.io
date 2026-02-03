---
title: "FlyBase Comparative Genomics Data"
---




<span id="top"></span>




# <span dir="auto">FlyBase Comparative Genomics Data</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Comparative
  Genomics Data Implementation in
  Chado</span>](#Comparative_Genomics_Data_Implementation_in_Chado)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">Background</span>](#Background)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">Orthology</span>](#Orthology)
    - [<span class="tocnumber">1.2.1</span> <span class="toctext">a)
      orthologous regions</span>](#a.29_orthologous_regions)
    - [<span class="tocnumber">1.2.2</span> <span class="toctext">b)
      orthologous genes</span>](#b.29_orthologous_genes)
  - [<span class="tocnumber">1.3</span>
    <span class="toctext">Synteny</span>](#Synteny)



# <span id="Comparative_Genomics_Data_Implementation_in_Chado" class="mw-headline">Comparative Genomics Data Implementation in Chado</span>

by Peili Zhang, David Emmert, Pinglei Zhou, William Gelbart, and the
FlyBase Consortium

## <span id="Background" class="mw-headline">Background</span>

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

## <span id="Orthology" class="mw-headline">Orthology</span>

### <span id="a.29_orthologous_regions" class="mw-headline">a) orthologous regions</span>






Figure 3: Chado representation of syntenic relationship between a pair
of genomes, based on orthologous_regions shown in Figure 1. Dmel:
Drosophila melanogaster; Dpse: Drosophila pseudoobscura.







[Categories](Special%253ACategories "Special%253ACategories"):

- [Comparative
  Genomics](Category%253AComparative_Genomics "Category%253AComparative Genomics")
- [FlyBase](Category%253AFlyBase "Category%253AFlyBase")






## Navigation menu









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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/FlyBase_Comparative_Genomics_Data"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:01 on 12 April
  2008.</span>
<!-- - <span id="footer-info-viewcount">18,774 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





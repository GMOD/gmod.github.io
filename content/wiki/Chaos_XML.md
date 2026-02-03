---
title: "Chaos XML"
---




<span id="top"></span>




# <span dir="auto">Chaos XML</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Chaos-XML and
  Chado</span>](#Chaos-XML_and_Chado)
- [<span class="tocnumber">2</span> <span class="toctext">The Chaos
  Model</span>](#The_Chaos_Model)
- [<span class="tocnumber">3</span> <span class="toctext">Library
  Contents</span>](#Library_Contents)
  - [<span class="tocnumber">3.1</span>
    <span class="toctext">DTD</span>](#DTD)
  - [<span class="tocnumber">3.2</span> <span class="toctext">XSL
    Stylesheets</span>](#XSL_Stylesheets)
  - [<span class="tocnumber">3.3</span> <span class="toctext">Example
    Chaos XML</span>](#Example_Chaos_XML)
  - [<span class="tocnumber">3.4</span>
    <span class="toctext">Scripts</span>](#Scripts)
  - [<span class="tocnumber">3.5</span> <span class="toctext">Chaos Perl
    Module</span>](#Chaos_Perl_Module)
- [<span class="tocnumber">4</span> <span class="toctext">Converting
  between Chaos-XML and
  Chado-XML</span>](#Converting_between_Chaos-XML_and_Chado-XML)
- [<span class="tocnumber">5</span> <span class="toctext">Future
  Extensions</span>](#Future_Extensions)
- [<span class="tocnumber">6</span> <span class="toctext">Differences
  between Chaos XML and the Chado Relational Database
  Schema</span>](#Differences_between_Chaos_XML_and_the_Chado_Relational_Database_Schema)
  - [<span class="tocnumber">6.1</span>
    <span class="toctext">Coordinates</span>](#Coordinates)
  - [<span class="tocnumber">6.2</span> <span class="toctext">Dbxref
    Flattening</span>](#Dbxref_Flattening)
  - [<span class="tocnumber">6.3</span> <span class="toctext">Type
    Flattening</span>](#Type_Flattening)
  - [<span class="tocnumber">6.4</span> <span class="toctext">Organism
    Flattening</span>](#Organism_Flattening)



## <span id="Chaos-XML_and_Chado" class="mw-headline">Chaos-XML and Chado</span>

Chaos-XML is based on the Chado relational model and is a subset of
Chado's content. For a full explanation of the meaning of the elements
in Chaos-XML, please refer to the [Chado
manual](Chado_Manual "Chado Manual") and in particular the [sequence
module documentation](Chado_Sequence_Module "Chado Sequence Module").

Chaos XML was created at around the same time the main chado software
development team at FlyBase devised the official Chado XML format. Chado
XML and Chaos XML are semantically very similar, but they are different
in how the XML to relational database mapping is performed. Chado XML is
also considerably more verbose than Chaos XML. This is because Chaos
uses some denormalisations of the Chado model, explained below. In our
view these two formats are complementary. Conversions between the
formats should be trivial.

  

## <span id="The_Chaos_Model" class="mw-headline">The Chaos Model</span>

Elements in Chaos XML will generally have an equivalent table or column
in the Chado relational schema. Thus the Chado documentation should also
serve as documentation for the Chaos XML format.

The central concept in Chaos/Chado is a "feature". A feature can
represent any genomic or sequence entity that is typed by the
<a href="http://sequenceontology.org" class="external text"
rel="nofollow">Sequence Ontology (SO)</a>.

Features are interconnected in a feature graph using the
*feature_relationship* element. This is to indicate which exons and
proteins belong to which transcript, which transcripts belong to which
gene.

The location of a feature, relative to another feature, is described by
the *featureloc* element. All locations are interbase (i.e. counting
from 0, not 1. It is the gaps between bases that are counted, not the
bases themselves). In contrast to chado, which uses fmin/fmax to
indicate the left and right coordinates, chaos use nbeg/nend to indicate
the five prime (natural start) and three prime (natural end)
coordinates.

  

## <span id="Library_Contents" class="mw-headline">Library Contents</span>

The Chaos-XML Library consists of specifications and software for
dealing with Chaos-XML files.

### <span id="DTD" class="mw-headline">DTD</span>

The DTD specification can be found in `chaos-xml/dtd/chaos.dtd`.

Soon there will also be specifications as XML Schema and/or Relax-NG

### <span id="XSL_Stylesheets" class="mw-headline">XSL Stylesheets</span>

XSL transformations can be found in the `chaos-xml/xsl/` directory.

### <span id="Example_Chaos_XML" class="mw-headline">Example Chaos XML</span>

Example Chaos-XML can be found in the `chaos-xml/sample-data/`
directory.

### <span id="Scripts" class="mw-headline">Scripts</span>

The scripts are in the `chaos-xml/bin/` directory. You need to install
the perl chaos library before running these scripts.

### <span id="Chaos_Perl_Module" class="mw-headline">Chaos Perl Module</span>

You can browse the perl modules in the `chaos-xml/lib/` directory. To
install, download the chaos-xml library and follow the instructions in
the `chaos-xml/INSTALL` file.

  

## <span id="Converting_between_Chaos-XML_and_Chado-XML" class="mw-headline">Converting between Chaos-XML and Chado-XML</span>

There are XSLT stylesheets defined for mapping between these two similar
formats, see the `chaos-xml/xsl` directory.

If you are not familiar with XSLT, you can use these scripts, part of
this distribution (see the `chaos-xml/bin/` directory)

- cx-chaos2chadoxml.pl
- cx-chadoxml2chaos.pl

  

## <span id="Future_Extensions" class="mw-headline">Future Extensions</span>

As new modules are added to chado (for example, the [genetics
module](Chado_Genetic_Module "Chado Genetic Module") and the [phylogeny
module](Chado_Phylogeny_Module "Chado Phylogeny Module")), corresponding
chaos-xml DTDs will be generated.

## <span id="Differences_between_Chaos_XML_and_the_Chado_Relational_Database_Schema" class="mw-headline">Differences between Chaos XML and the Chado Relational Database Schema</span>

### <span id="Coordinates" class="mw-headline">Coordinates</span>

Chaos uses *nbeg* and *nend* as opposed to the *fmin* and *fmax* found
in the [feature table](Chado_Tables#Table:_feature "Chado Tables").

### <span id="Dbxref_Flattening" class="mw-headline">Dbxref Flattening</span>

Chaos collapses the normalised chado table
[dbxref](Chado_Tables#Table:_dbxref "Chado Tables") into a single
"dbxrefstr" PCDATA element.

### <span id="Type_Flattening" class="mw-headline">Type Flattening</span>

Chaos uses a PCDATA element *type* in both
[feature](Chado_Tables#Table:_feature "Chado Tables") and
[feature_relationship](Chado_Tables#Table:_feature_relationship "Chado Tables").
In Chado, types are represented as a foreign key into the [cvterm
table](Chado_Tables#Table:_cvterm "Chado Tables"). In Chaos the type
string is implicitly mapped to
[cvterm](Chado_Tables#Table:_cvterm "Chado Tables") with the same name
as the type, from the
<a href="http://sequenceontology.org" class="external text"
rel="nofollow">Sequence Ontology (SO)</a> CV.

### <span id="Organism_Flattening" class="mw-headline">Organism Flattening</span>

Chaos uses an *organismstr* PCDATA element to represent the normalised
chado table [organism](Chado_Tables#Table:_organism "Chado Tables").




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [XML](Category%253AXML "Category%253AXML")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chaos_XML" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:08 on 22 January
  2008.</span>
<!-- - <span id="footer-info-viewcount">17,768 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





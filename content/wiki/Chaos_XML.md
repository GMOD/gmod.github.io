---
title: "Chaos XML"
---
# Chaos XML

 Chado</span>](#Chaos-XML_and_Chado)
- [The Chaos
 Model](#The_Chaos_Model)
- [Library
 Contents](#Library_Contents)
 - [DTD](#DTD)
 - [XSL
 Stylesheets](#XSL_Stylesheets)
 - [Example
 Chaos XML](#Example_Chaos_XML)
 - [Scripts](#Scripts)
 - [Chaos Perl
 Module](#Chaos_Perl_Module)
- [Converting
 between Chaos-XML and
 Chado-XML](#Converting_between_Chaos-XML_and_Chado-XML)
- [Future
 Extensions](#Future_Extensions)
- [Differences
 between Chaos XML and the Chado Relational Database
 Schema](#Differences_between_Chaos_XML_and_the_Chado_Relational_Database_Schema)
 - [Coordinates](#Coordinates)
 - [Dbxref
 Flattening](#Dbxref_Flattening)
 - [Type
 Flattening](#Type_Flattening)
 - [Organism
 Flattening](#Organism_Flattening)

## Chaos-XML and Chado

Chaos-XML is based on the Chado relational model and is a subset of
Chado's content. For a full explanation of the meaning of the elements
in Chaos-XML, please refer to the [Chado
manual](/wiki/Chado_Manual) and in particular the [sequence
module documentation](/wiki/Chado_Sequence_Module).

Chaos XML was created at around the same time the main chado software
development team at FlyBase devised the official Chado XML format. Chado
XML and Chaos XML are semantically very similar, but they are different
in how the XML to relational database mapping is performed. Chado XML is
also considerably more verbose than Chaos XML. This is because Chaos
uses some denormalisations of the Chado model, explained below. In our
view these two formats are complementary. Conversions between the
formats should be trivial.

## The Chaos Model

Elements in Chaos XML will generally have an equivalent table or column
in the Chado relational schema. Thus the Chado documentation should also
serve as documentation for the Chaos XML format.

The central concept in Chaos/Chado is a "feature". A feature can
represent any genomic or sequence entity that is typed by the
<a href="http://sequenceontology.org" class="external text"

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

## Library Contents

The Chaos-XML Library consists of specifications and software for
dealing with Chaos-XML files.

### DTD

The DTD specification can be found in `chaos-xml/dtd/chaos.dtd`.

Soon there will also be specifications as XML Schema and/or Relax-NG

### XSL Stylesheets

XSL transformations can be found in the `chaos-xml/xsl/` directory.

### Example Chaos XML

Example Chaos-XML can be found in the `chaos-xml/sample-data/`
directory.

### Scripts

The scripts are in the `chaos-xml/bin/` directory. You need to install
the perl chaos library before running these scripts.

### Chaos Perl Module

You can browse the perl modules in the `chaos-xml/lib/` directory. To
install, download the chaos-xml library and follow the instructions in
the `chaos-xml/INSTALL` file.

## Converting between Chaos-XML and Chado-XML

There are XSLT stylesheets defined for mapping between these two similar
formats, see the `chaos-xml/xsl` directory.

If you are not familiar with XSLT, you can use these scripts, part of
this distribution (see the `chaos-xml/bin/` directory)

- cx-chaos2chadoxml.pl
- cx-chadoxml2chaos.pl

## Future Extensions

As new modules are added to chado (for example, the [genetics
module](/wiki/Chado_Genetic_Module) and the [phylogeny
module](/wiki/Chado_Phylogeny_Module)), corresponding
chaos-xml DTDs will be generated.

## Differences between Chaos XML and the Chado Relational Database Schema

### Coordinates

Chaos uses *nbeg* and *nend* as opposed to the *fmin* and *fmax* found
in the [feature table](/wiki/Chado_Tables#Table:_feature).

### Dbxref Flattening

Chaos collapses the normalised chado table
[dbxref](/wiki/Chado_Tables#Table:_dbxref) into a single
"dbxrefstr" PCDATA element.

### Type Flattening

Chaos uses a PCDATA element *type* in both
[feature](/wiki/Chado_Tables#Table:_feature) and
[feature_relationship](/wiki/Chado_Tables#Table:_feature_relationship).
In Chado, types are represented as a foreign key into the [cvterm
table](/wiki/Chado_Tables#Table:_cvterm). In Chaos the type
string is implicitly mapped to
[cvterm](/wiki/Chado_Tables#Table:_cvterm) with the same name
as the type, from the
<a href="http://sequenceontology.org" class="external text"

### Organism Flattening

Chaos uses an *organismstr* PCDATA element to represent the normalised
chado table [organism](/wiki/Chado_Tables#Table:_organism).

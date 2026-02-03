---
title: "Load a custom ontology in Chado"
---
# Load a custom ontology in Chado

  custom ontology in
  Chado</span>](#Howto_load_a_custom_ontology_in_Chado)
  - [The
    ontology](#The_ontology)
  - [Chado
    xml](#Chado_xml)
  - [Loading
    into Chado](#Loading_into_Chado)

# Howto load a custom ontology in Chado

We have an ontology that we want to load into Chado. The process to
follow is described in the INSTALL.Chado document.

    If you already have the desired ontology files locally, you
    can execute a command for each file to load it.  Note again that
    the Relationship Ontology is required before all others, and the
    the Sequence Ontology (SO) is absolutely required for proper
    functioning of the database.  The commands to load an ontology are:

          $  go2fmt.pl -p obo_text -w xml /path/to/obofile | \
                go-apply-xslt oboxml_to_chadoxml - > obo_text.xml

    This creates a chadoxml file of the obo file - then execute:

         $ stag-storenode.pl \
         -d 'dbi:Pg:dbname=$CHADO_DB_NAME;host=$CHADO_DB_HOST;port=$CHADO_DB_PORT' \
         --user $CHADO_DB_USERNAME --password $CHADO_DB_PASSWORD obo_text.xml

    If you have other ontology format files, the commands are similar;
    consult the documentation for go2fmt.pl and go-apply-xslt for your
    file format.

Here we explained with more detail.

## The ontology

We have an ontology stored in an obo file. As an example we can try to
load the following ontology.

    format-version: 1.2
    default-namespace: library_type

    [Term]
    id:internal_go_lib:000001
    name: library_type

    [Term]
    id: internal_go_lib:000002
    name: cDNA library
    definition: a collection of complementary DNA fragments
    is_a: cmv_internal_go_lib:000001

    [Typedef]
    id: internal_go_lib:is_a
    name: is_a
    definition: The basic subclassing relationship

    [Typedef]
    id: internal_go_lib:disjoint_from
    name: disjoint_from
    definition: Indicates that two classes are disjoint

    [Typedef]
    id: internal_go_lib:instance_of
    name: instance_of
    definition: Indicates the type of an instance

    [Typedef]
    id: internal_go_lib:inverse_of
    name: inverse_of
    definition: Indicates that one relationship type is the inverse of another

    [Typedef]
    id: internal_go_lib:union_of
    name: union_of
    definition: Indicates that a term is the union of several others

    [Typedef]
    id: internal_go_lib:intersection_of
    name: intersection_of
    definition: Indicates that a term is the intersection of several others [OBO:defs]


The name of the file should match the database that will go in the db
table (although I'm not sure about that). I've named this file as
internal_go_lib.

## Chado xml

To load the ontology into chado we have to create a Chado xml file.
There are two options to do it:

- go2fmt.pl to create a go xml and go-apply-xslt to transform it to
  chado xml (as described in the install).
- go2chadoxml to go from obo to chado xml in one go.

Let's do it with go2chadoxml

    $ go2chadoxml internal_go_lib > internal_go_lib.chado.xml

We have obtained an xml file ready to be loaded into chado.

## Loading into Chado

Now we can load the xml file into chado with the stag-storenode.pl
command.

    stag-storenode.pl -d 'dbi:Pg:dbname=chado_test;host=localhost;port=5432' --user chado_user --password chado_pass internal_go_lib.chado.xml

Prior to that loading in the cv table I had added library_type and
internal_go_lib in the db table. I don't know if that's required, I
guess that stag-storenode.pl will do it for you anyway.

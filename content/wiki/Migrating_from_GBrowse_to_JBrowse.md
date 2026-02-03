---
title: "Migrating from GBrowse to JBrowse"
---
# Migrating from GBrowse to JBrowse

  consider</span>](#Things_to_consider)
  - [New or
    Existing Server](#New_or_Existing_Server)
  - [disk space
    requirements](#disk_space_requirements)
  - [computing
    requirements](#computing_requirements)
  - [do you
    have the original GFF?](#do_you_have_the_original_GFF.3F)
  - [dealing
    with multiple species/data
    sources](#dealing_with_multiple_species.2Fdata_sources)
- [prepare-refseqs.pl](#prepare-refseqs.pl)
- [\*-to-json.pl](#.2A-to-json.pl)
  - [Mapping
    out GBrowse to JBrowse
    configuration](#Mapping_out_GBrowse_to_JBrowse_configuration)
    - 
- [Dealing with
  binary data](#Dealing_with_binary_data)
- [Where to get
  help](#Where_to_get_help)

## Things to consider

### New or Existing Server

### disk space requirements

### computing requirements

The computing requirements for a JBrowse server are generally much less
than a GBrowse server, since the JBrowse server will only be serving up
small bits of text as json and javascript files, as opposed to creating
images on the fly for GBrowse servers. On the other hand, processing the
data to create the JBrowse server is generally more intensive (or at a
minimum, as much as) that what is needed for a GBrowse instance. It is
not unreasonable therefore to have a server with a fair amount of
resources for doing the data processing and then using a "smaller"
server for serving the data. In fact, it is possible to put all of the
data in an AWS S3 store and not have a server at all once the data
processing is done. See
[Using_AWS_S3_For_JBrowse](Using_AWS_S3_For_JBrowse "Using AWS S3 For JBrowse").

### do you have the original GFF?

Generally, it Is easier to create a JBrowse instance from the original
GFF that from a GBrowse database like Bio::DB::GFF or
Bio::DB::SeqFeature::Store.

### dealing with multiple species/data sources

JBrowse can easily support having multiple species or data sources, like
you would see in a drop down menu in GBrowse. See [this
FAQ](JBrowse_FAQ#How_do_I_set_up_multiple_genomes_in_a_single_jbrowse_instance.3F "JBrowse FAQ")
and the one below it, and the section in the [JBrowse Configuration
Guide](JBrowse_Configuration_Guide "JBrowse Configuration Guide") that
they point to.

## prepare-refseqs.pl

Example command lines for GFF, FASTA and BioDB

## \*-to-json.pl

### Mapping out GBrowse to JBrowse configuration

A table would be good

#### Special note about callbacks

## Dealing with binary data

## Where to get help

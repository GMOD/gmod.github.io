---
title: "GMOD Utility Scripts"
---
# GMOD Utility Scripts


This page describes several of the tools that come with the GMOD
distribution for performing various useful tasks


  gmod_extract_dbxref_from_gff.pl](#gmod_extract_dbxref_from_gff.pl)
- [gmod_fasta2gff3.pl](#gmod_fasta2gff3.pl)
- [gmod_gff3_preprocessor.pl](#gmod_gff3_preprocessor.pl)
- [gmod_make_gff_from_dbxref.pl](#gmod_make_gff_from_dbxref.pl)
- [gmod_materialized_view_tool.pl](#gmod_materialized_view_tool.pl)
- [gmod_sort_gff3.pl](#gmod_sort_gff3.pl)


## gmod_extract_dbxref_from_gff.pl

This tool extracts dbxrefs (ie, the DB identifier and the accession)
from GFF3 lines that have a Target attribute. This is useful if these
dbxref attributes are the only record of what the query sequence was for
a similarity analysis. It prints the extracted database and accession
information to standard out, and another script,
[gmod_make_gff_from_dbxref.pl](GMOD_Utility_Scripts#gmod_make_gff_from_dbxref.pl "GMOD Utility Scripts"),
takes this information on standard in and creates a GFF3 file.

## gmod_fasta2gff3.pl

In order to properly store similarity result data, it is best to have
both the query and subject features already in the database. When a
fasta file of a collection of sequences are blasted against a reference
sequence like a chromosome, frequently the only representation of those
sequence features is in the original fasta file. This tool makes it easy
to create GFF3 files from that fasta file so that they can be loaded
into Chado before the similarity results that reference them are.

## gmod_gff3_preprocessor.pl

Splits a GFF3 file into smaller more manageable files.

## gmod_make_gff_from_dbxref.pl

**This script currently has no perldoc, which needs to be added!**

This script takes the output of
[gmod_extract_dbxref_from_gff.pl](GMOD_Utility_Scripts#gmod_extract_dbxref_from_gff.pl "GMOD Utility Scripts")
as well as a list of fasta files and creates a GFF3 file for the
sequences that are represented in both the output from the extractor as
well as in the fasta file. This script operates in a similar manner to
[gmod_fasta2gff3.pl](GMOD_Utility_Scripts#gmod_fasta2gff3.pl "GMOD Utility Scripts")
except that it is selective in what it will make GFF3 out of, versus the
all inclusive fasta2gff3 script. This is useful if only a relatively
small proportion of the fasta file's contents are represented in the
GFF3 similarity results.

## gmod_materialized_view_tool.pl

This is a tool for creating materialized views in Chado. See the page
dedicated to [it
(Materialized_views)](Materialized_views "Materialized views") for more
information.

## gmod_sort_gff3.pl

Sorts a GFF3 file so that parent features occur before child features.
It does this using temporary tables in the Chado database, so it must be
available when the sorter is run. If the file is very large, it is a
good idea to run the
[gmod_gff3_preprocessor.pl](GMOD_Utility_Scripts#gmod_gff3_preprocessor.pl "GMOD Utility Scripts")
first. There are only two options, one for specifying the input file
(--infile or -i) and one for optionally specifying the output file
(--outfile or -o). The current implementation (which may be reworked)
only deals with 4 levels of inheritance (the typical gene annotation has
three: gene, mRNA, and exon).

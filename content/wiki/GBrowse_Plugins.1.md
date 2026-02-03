---
title: "GBrowse Plugins"
---
# GBrowse Plugins

Plugins extend GBrowse

For details on how to configure plugins, see
<a href="/wiki/GBrowse_Configuration_HOWTO.1#Plugin_Options"

title="GBrowse Configuration HOWTO">GBrowse_Configuration_HOWTO#Plugin_Options</a>.

Below is an annotated list of GBrowse plugins with pointers to more
detailed documentation, where available. Developers, see: [Creating
GBrowse
Plugins](/wiki/Creating_GBrowse_Plugins).

[AlignTwoSequences.pm](/wiki/AlignTwoSequences.pm)
BLASTs an input sequence against the current display, with hits as new
sequence features.

[Aligner.pm](/wiki/Aligner.pm)
Prints out a multiple alignment of the selected features.

[AttributeHiliter.pm](/wiki/AttributeHiliter.pm)
Highlights features whose properties match certain criteria.

[BatchDumper.pm](/wiki/BatchDumper.pm)
Dumps out the currently displayed genomic segment or the segments
corresponding to the given accessions, in the requested format.

[Blat.pm](/wiki/Blat.pm)
Blats an input against the genome of the current organism.

[CMapDumper.pm](/wiki/CMapDumper.pm)
Dumps a tab delimited file that can be read by CMap.

[CreateBlastDB.pm](/wiki/CreateBlastDB.pm)
Creates a Blast-formatted database from a Bio::DB::GFF database

[FastaDumper.pm](/wiki/FastaDumper.pm)
Dumps out the currently displayed genomic segment in decorated FASTA
format.

[FilterTest.pm](/wiki/FilterTest.pm)
Filters the features.

[GeneFinder.pm](/wiki/GeneFinder.pm)
A front end to Phil Green's GeneFinder program.

[GFFDumper.pm](/wiki/GFFDumper.pm)
Dumps various versions of [GFF](/wiki/GFF).

[LDAPAuthenticate.pm](/wiki/LDAPAuthenticate.pm)
Authentication via LDAP.

[MotifFinder.pm](/wiki/MotifFinder.pm)
Finds sequence specific motifs using Position Frequency Matrix.

[OligoFinder.pm](/wiki/OligoFinder.pm)
Finds oligos between 11 and 50 bp in length.

[PamAuthenticate.pm](/wiki/Gbrowse/authentication_plugins/PamAuthenticate)
Authenticate users using Pluggable Authentication Modules.

[ProteinDumper.pm](/wiki/ProteinDumper.pm)
Dumps translated protein sequences in various formats.

[PrimerDesigner.pm](/wiki/PrimerDesigner.pm)
Real-time design PCR primers for a selected region.

[RandomGene.pm](/wiki/RandomGene.pm)
Generates random genes, designed to demonstrate annotator plugins.

[RestrictionAnnotator.pm](/wiki/RestrictionAnnotator.pm)
Generates a restriction map on the current view.

[SequenceDumper.pm](/wiki/SequenceDumper.pm)
Dumps sequences I guess.

[Spectrogram.pm](/wiki/Spectrogram.pm)
Digital signal processing of DNA sequences.

[Submitter.pm](/wiki/Submitter.pm)
Submit selected sequences to external web sites

[TrackFinder.pm](/wiki/TrackFinder.pm)
Filter and highlight the track listing according to keywords

[TestAuthenticator.pm](/wiki/Gbrowse/authentication_plugins/testauthenticator)
A simple test of the authentication plugin system that looks for a
hardcoded username/password.

[test.pm](/wiki/Test.pm)
Used to test that the dump architecture is working properly.

YourPlugin.pm
Your cool plugin described here...

---
title: "GBrowse Plugins"
---
# GBrowse Plugins

(Redirected from
[Plugins](/wiki/Plugins)

Plugins extend GBrowse

For details on how to configure plugins, see
<a href="GBrowse_Configuration_HOWTO#Plugin_Options" class="mw-redirect"
title="GBrowse Configuration HOWTO">GBrowse_Configuration_HOWTO#Plugin_Options</a>.

Below is an annotated list of GBrowse plugins with pointers to more
detailed documentation, where available. Developers, see: [Creating
GBrowse Plugins](Creating_GBrowse_Plugins "Creating GBrowse Plugins").

[AlignTwoSequences.pm](AlignTwoSequences.pm "AlignTwoSequences.pm")   
BLASTs an input sequence against the current display, with hits as new
sequence features.

[Aligner.pm](Aligner.pm "Aligner.pm")   
Prints out a multiple alignment of the selected features.

[AttributeHiliter.pm](AttributeHiliter.pm "AttributeHiliter.pm")   
Highlights features whose properties match certain criteria.

[BatchDumper.pm](BatchDumper.pm "BatchDumper.pm")   
Dumps out the currently displayed genomic segment or the segments
corresponding to the given accessions, in the requested format.

[Blat.pm](Blat.pm "Blat.pm")   
Blats an input against the genome of the current organism.

[CMapDumper.pm](CMapDumper.pm "CMapDumper.pm")   
Dumps a tab delimited file that can be read by CMap.

[CreateBlastDB.pm](CreateBlastDB.pm "CreateBlastDB.pm")   
Creates a Blast-formatted database from a Bio::DB::GFF database

[FastaDumper.pm](FastaDumper.pm "FastaDumper.pm")   
Dumps out the currently displayed genomic segment in decorated FASTA
format.

[FilterTest.pm](FilterTest.pm "FilterTest.pm")   
Filters the features.

[GeneFinder.pm](GeneFinder.pm "GeneFinder.pm")   
A front end to Phil Green's GeneFinder program.

[GFFDumper.pm](GFFDumper.pm "GFFDumper.pm")   
Dumps various versions of [GFF](GFF "GFF").

[LDAPAuthenticate.pm](LDAPAuthenticate.pm "LDAPAuthenticate.pm")   
Authentication via LDAP.

[MotifFinder.pm](MotifFinder.pm "MotifFinder.pm")   
Finds sequence specific motifs using Position Frequency Matrix.

[OligoFinder.pm](OligoFinder.pm "OligoFinder.pm")   
Finds oligos between 11 and 50 bp in length.

[PamAuthenticate.pm](Gbrowse/authentication_plugins/PamAuthenticate "Gbrowse/authentication plugins/PamAuthenticate")   
Authenticate users using Pluggable Authentication Modules.

[ProteinDumper.pm](ProteinDumper.pm "ProteinDumper.pm")   
Dumps translated protein sequences in various formats.

[PrimerDesigner.pm](PrimerDesigner.pm "PrimerDesigner.pm")   
Real-time design PCR primers for a selected region.

[RandomGene.pm](RandomGene.pm "RandomGene.pm")   
Generates random genes, designed to demonstrate annotator plugins.

[RestrictionAnnotator.pm](RestrictionAnnotator.pm "RestrictionAnnotator.pm")   
Generates a restriction map on the current view.

[SequenceDumper.pm](SequenceDumper.pm "SequenceDumper.pm")   
Dumps sequences I guess.

[Spectrogram.pm](Spectrogram.pm "Spectrogram.pm")   
Digital signal processing of DNA sequences.

[Submitter.pm](Submitter.pm "Submitter.pm")   
Submit selected sequences to external web sites

[TrackFinder.pm](TrackFinder.pm "TrackFinder.pm")   
Filter and highlight the track listing according to keywords

[TestAuthenticator.pm](Gbrowse/authentication_plugins/testauthenticator "Gbrowse/authentication plugins/testauthenticator")   
A simple test of the authentication plugin system that looks for a
hardcoded username/password.

[test.pm](Test.pm "Test.pm")   
Used to test that the dump architecture is working properly.

YourPlugin.pm   
Your cool plugin described here...

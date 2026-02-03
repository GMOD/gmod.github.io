---
title: "GBrowse Adaptors"
---
# GBrowse Adaptors

[GBrowse](/wiki/GBrowse.1) has a flexible adaptor (yes, it is
spelled that way and is not "adapter") system for running off various
types of databases/sources. A common question is "which adaptor should I
be using?" This attempts to answer that question.

| Adaptor | Other required software | Roughly how many users | Pros | Cons |
|----|----|----|----|----|
| <a href="http://bioperl.org/wiki/Module:Bio::DB::SeqFeature::Store" |  |  |  |  |
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a> (use bp_seqfeature_load.pl) | [MySQL](/wiki/MySQL), [PostgreSQL](/wiki/PostgreSQL), SQLite, BerkeleyDB | Many and growing fast. | Roughly 4X faster than Bio::DB::GFF for the same data; designed to work with [GFF3](/wiki/GFF3) | Developed for use with [GFF3](/wiki/GFF3); about 2X slower than Bio::DB::GFF to load a database | <a href="http://bioperl.org/wiki/Module:Bio::DB::GFF"
class="external text" rel="nofollow">Bio::DB::GFF</a> (use bp_load_gff.pl, bp_bulk_load_gff.pl, bp_fast_load_gff.pl) | A [relational database server](/wiki/Glossary#Database_Management_System): [MySQL](/wiki/MySQL), [PostgreSQL](/wiki/PostgreSQL), Oracle, or BerkeleyDB | Lots! (Especially [MySQL](/wiki/MySQL)) | Quite fast; large user base; Have to use this if your data is in the (now deprecated) [GFF2](/wiki/GFF2) format. | Does not work well with [GFF3](/wiki/GFF3) formatted data | <a href="http://search.cpan.org/perldoc?Bio::DB::Sam"
class="external text" rel="nofollow">Bio::DB::Sam</a> (available from CPAN) | <a href="http://samtools.sourceforge.net/" class="external text"
rel="nofollow">SAMtools</a> | Growing (particularly with GBrowse2) | Very fast access to NextGen sequencing data | Difficult to use with GBrowse 1.70 | <a href="http://search.cpan.org/perldoc?Bio::DB::BigWig"
class="external text" rel="nofollow">Bio::DB::BigWig</a> and <a href="http://search.cpan.org/perldoc?Bio::DB::BigWigSet"
class="external text" rel="nofollow">Bio::DB::BigWigSet</a> (available from CPAN) | <a href="http://genome.ucsc.edu/FAQ/FAQformat.html"
class="external text" rel="nofollow">UCSC Formats</a> | Growing (particularly with GBrowse2) | Very fast access to data in <a href="http://genome.ucsc.edu/FAQ/FAQformat.html#format6.1#format6.1"
class="external text" rel="nofollow">bigWig</a> format | Difficult to use with GBrowse 1.70 | <a href="http://search.cpan.org/perldoc?Bio::DB::BigBed"
class="external text" rel="nofollow">Bio::DB::BigBed</a> (available from CPAN) | <a href="http://genome.ucsc.edu/FAQ/FAQformat.html"
class="external text" rel="nofollow">UCSC Formats</a> | Growing (particularly with GBrowse2) | Very fast access to data in <a href="http://genome.ucsc.edu/FAQ/FAQformat.html#format1.5#format1.5"
class="external text" rel="nofollow">bigBed</a> format | Difficult to use with GBrowse 1.70 | <a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a> (available from CPAN) | [PostgreSQL](/wiki/PostgreSQL) and a <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> [schema](/wiki/Glossary#Database_Schema) | Relatively few due to the specialized nature of Chado | Allows 'live' viewing of the features in a Chado database | Slow compared to Bio::DB::GFF | <a href="http://search.cpan.org/perldoc?Bio::DB::Das::BioSQL"
class="external text" rel="nofollow">Bio::DB::Das::BioSQL</a> (available from CPAN) | [MySQL](/wiki/MySQL) and a [BioSQL](/wiki/BioSQL) schema | Relatively few due to the small number of BioSQL users | Allows 'live' viewing of the features in a BioSQL database | Slow compared to Bio::DB::GFF | Memory (ie, flat file database using either Bio::DB::GFF or SeqFeature::Store) | None | For real servers, none | Easy for rapid development and testing | Very slow for more than a few thousand features | [LuceGene](/wiki/LuceGene) | Lucene (searches indexed flat files) | Relatively few |  ## Email Threads

There have been some useful email threads on adaptor choices and
tradeoffs.

- <a href="http://gmod.827538.n3.nabble.com/Memory-Database-td862590.html"
  class="external text" rel="nofollow">Memory Database</a>, 2010/06

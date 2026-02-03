---
title: "GBrowse Adaptors"
---




<span id="top"></span>




# <span dir="auto">GBrowse Adaptors</span>









[GBrowse](GBrowse.1 "GBrowse") has a flexible adaptor (yes, it is
spelled that way and is not "adapter") system for running off various
types of databases/sources. A common question is "which adaptor should I
be using?" This attempts to answer that question.

| Adaptor | Other required software | Roughly how many users | Pros | Cons |
|----|----|----|----|----|
| <a href="http://bioperl.org/wiki/Module:Bio::DB::SeqFeature::Store"
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a> (use bp_seqfeature_load.pl) | [MySQL](MySQL "MySQL"), [PostgreSQL](PostgreSQL "PostgreSQL"), SQLite, BerkeleyDB | Many and growing fast. | Roughly 4X faster than Bio::DB::GFF for the same data; designed to work with [GFF3](GFF3 "GFF3") | Developed for use with [GFF3](GFF3 "GFF3"); about 2X slower than Bio::DB::GFF to load a database |
| <a href="http://bioperl.org/wiki/Module:Bio::DB::GFF"
class="external text" rel="nofollow">Bio::DB::GFF</a> (use bp_load_gff.pl, bp_bulk_load_gff.pl, bp_fast_load_gff.pl) | A [relational database server](Glossary#Database_Management_System "Glossary"): [MySQL](MySQL "MySQL"), [PostgreSQL](PostgreSQL "PostgreSQL"), Oracle, or BerkeleyDB | Lots! (Especially [MySQL](MySQL "MySQL")) | Quite fast; large user base; Have to use this if your data is in the (now deprecated) [GFF2](GFF2 "GFF2") format. | Does not work well with [GFF3](GFF3 "GFF3") formatted data |
| <a href="http://search.cpan.org/perldoc?Bio::DB::Sam"
class="external text" rel="nofollow">Bio::DB::Sam</a> (available from CPAN) | <a href="http://samtools.sourceforge.net/" class="external text"
rel="nofollow">SAMtools</a> | Growing (particularly with GBrowse2) | Very fast access to NextGen sequencing data | Difficult to use with GBrowse 1.70 |
| <a href="http://search.cpan.org/perldoc?Bio::DB::BigWig"
class="external text" rel="nofollow">Bio::DB::BigWig</a> and <a href="http://search.cpan.org/perldoc?Bio::DB::BigWigSet"
class="external text" rel="nofollow">Bio::DB::BigWigSet</a> (available from CPAN) | <a href="http://genome.ucsc.edu/FAQ/FAQformat.html"
class="external text" rel="nofollow">UCSC Formats</a> | Growing (particularly with GBrowse2) | Very fast access to data in <a href="http://genome.ucsc.edu/FAQ/FAQformat.html#format6.1#format6.1"
class="external text" rel="nofollow">bigWig</a> format | Difficult to use with GBrowse 1.70 |
| <a href="http://search.cpan.org/perldoc?Bio::DB::BigBed"
class="external text" rel="nofollow">Bio::DB::BigBed</a> (available from CPAN) | <a href="http://genome.ucsc.edu/FAQ/FAQformat.html"
class="external text" rel="nofollow">UCSC Formats</a> | Growing (particularly with GBrowse2) | Very fast access to data in <a href="http://genome.ucsc.edu/FAQ/FAQformat.html#format1.5#format1.5"
class="external text" rel="nofollow">bigBed</a> format | Difficult to use with GBrowse 1.70 |
| <a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a> (available from CPAN) | [PostgreSQL](PostgreSQL "PostgreSQL") and a <a href="Chado" class="mw-redirect" title="Chado">Chado</a> [schema](Glossary#Database_Schema "Glossary") | Relatively few due to the specialized nature of Chado | Allows 'live' viewing of the features in a Chado database | Slow compared to Bio::DB::GFF |
| <a href="http://search.cpan.org/perldoc?Bio::DB::Das::BioSQL"
class="external text" rel="nofollow">Bio::DB::Das::BioSQL</a> (available from CPAN) | [MySQL](MySQL "MySQL") and a [BioSQL](BioSQL "BioSQL") schema | Relatively few due to the small number of BioSQL users | Allows 'live' viewing of the features in a BioSQL database | Slow compared to Bio::DB::GFF |
| Memory (ie, flat file database using either Bio::DB::GFF or SeqFeature::Store) | None | For real servers, none | Easy for rapid development and testing | Very slow for more than a few thousand features |
| [LuceGene](LuceGene "LuceGene") | Lucene (searches indexed flat files) | Relatively few |  |  |

## <span id="Email_Threads" class="mw-headline">Email Threads</span>

There have been some useful email threads on adaptor choices and
tradeoffs.

- <a href="http://gmod.827538.n3.nabble.com/Memory-Database-td862590.html"
  class="external text" rel="nofollow">Memory Database</a>, 2010/06




[Categories](Special%253ACategories "Special%253ACategories"):

- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")
- [DAS](Category%253ADAS "Category%253ADAS")
- [BioPerl](Category%253ABioPerl "Category%253ABioPerl")
- [Chado](Category%253AChado "Category%253AChado")
- [LuceGene](Category%253ALuceGene "Category%253ALuceGene")
- [MySQL](Category%253AMySQL "Category%253AMySQL")
- [PostgreSQL](Category%253APostgreSQL "Category%253APostgreSQL")






## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AGBrowse_Adaptors" accesskey="t"
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse_Adaptors" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 16:22 on 7 August
  2012.</span>
<!-- - <span id="footer-info-viewcount">111,387 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





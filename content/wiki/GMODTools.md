---
title: "GMODTools"
---




<span id="top"></span>




# <span dir="auto">GMODTools</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Description</span>](#Description)
- [<span class="tocnumber">2</span>
  <span class="toctext">Outputs</span>](#Outputs)
- [<span class="tocnumber">3</span> <span class="toctext">Why Use
  Bulkfiles?</span>](#Why_Use_Bulkfiles.3F)
- [<span class="tocnumber">4</span>
  <span class="toctext">Downloads</span>](#Downloads)
- [<span class="tocnumber">5</span>
  <span class="toctext">Configuration</span>](#Configuration)
  - [<span class="tocnumber">5.1</span>
    <span class="toctext">GMODTools/conf/bulkfiles/</span>](#GMODTools.2Fconf.2Fbulkfiles.2F)
- [<span class="tocnumber">6</span> <span class="toctext">Sample
  Use</span>](#Sample_Use)
  - [<span class="tocnumber">6.1</span> <span class="toctext">Sample
    Output Data Folder</span>](#Sample_Output_Data_Folder)
  - [<span class="tocnumber">6.2</span> <span class="toctext">Sample Run
    Log</span>](#Sample_Run_Log)
  - [<span class="tocnumber">6.3</span> <span class="toctext">GenBank
    genome round-trip test</span>](#GenBank_genome_round-trip_test)
- [<span class="tocnumber">7</span>
  <span class="toctext">Requirements</span>](#Requirements)
- [<span class="tocnumber">8</span>
  <span class="toctext">Updates</span>](#Updates)
- [<span class="tocnumber">9</span> <span class="toctext">See
  Also</span>](#See_Also)
- [<span class="tocnumber">10</span>
  <span class="toctext">Contact</span>](#Contact)



# <span id="Description" class="mw-headline">Description</span>

Bulkfiles is a GMOD [Perl](Glossary#Perl "Glossary") package that
generates Fasta, [GFF3](GFF3 "GFF3"), DNA and other bulk genome
annotation files from
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> databases.
It works with several [FlyBase](Category%253AFlyBase "Category%253AFlyBase")
Chado releases, with SGDLite, and has been tested with other Chado
databases. Once tuned to your project's needs with its organism and site
configurations, it can generate public data releases on a regular basis.
It produces all the contents needed for a GMOD [Standard
URL](Standard_URL "Standard URL") genome data download folder.

# <span id="Outputs" class="mw-headline">Outputs</span>

These are current primary outputs, which are configurable to suit
project needs.

- DNA files (full chromosomes) in raw and fasta formats
- [GFF3](GFF3 "GFF3") feature files
- Fasta sequence for each selected feature set, with headers from
  feature files
- BLAST Index files (NCBI)
- Gene Ontology association file
- GenBank genome submission files

Additional genome outputs can be added with Perl adaptor packages from a
Bulkfiles base adaptor object.

# <span id="Why_Use_Bulkfiles.3F" class="mw-headline">Why Use Bulkfiles?</span>

Why use this package rather than using other [middleware
layers](Category%253AMiddleware "Category%253AMiddleware") to Chado db - [Chado
XML](Chado_XML "Chado XML"),
[Chado%253A%253AAutoDBI](Chado%253A%253AAutoDBI "Chado%253A%253AAutoDBI"),
[BioPerl](BioPerl "BioPerl"), ? The general logic is

1.  dump all Chado db features using simple (and quick) sql, to common
    intermediate table files, and chromosome dna to raw files. The
    feature info is simple: type, location, name/id, and a few
    attributes (db_xrefs,..)
2.  postprocess these table files to create the various public use
    formats (the time-consuming and configurable part), organized into
    per-chromosome files.

Here are some reasons we take this approach:

- using simple sql to dump all db features to intermediate table allows
  easy checks that all features get to bulk files
- simple sql dump is fast, and reliable in getting all mapped features
  by keeping logic simple
- process table output in stages - better debugging of steps in process,
  and can split processing among computers. These stages are loosely
  coupled - one can go back, tweak configurations and get a new output
  w/o redoing the complete extraction process.
- convert one common feature table + dna to several output formats in
  one step, or repeatedly as needed.
- combine features from several Chado dbs, and add other sources that
  may not be in your Chado database.
- model organism projects need fairly complex and data specific
  configurations - moving that to config files keeps code reusable.
- each genome Chado database has different policy and choices with
  respect to feature, vocabulary and other data. A highly configurable
  tool, with data extraction and correction methods that are separate
  and tunable is needed to adapt to such variation in genome databases.

# <span id="Downloads" class="mw-headline">Downloads</span>

Here is a candidate release package for
<a href="http://eugenes.org/gmod/GMODTools/" class="external text"
rel="nofollow">GMODTools</a>:

     curl -O http://eugenes.org/gmod/GMODTools/GMODTools-1.2.zip
     unzip GMODTools*.zip

If you want to try out GMODTools from
<a href="SVN" class="mw-redirect" title="SVN">SVN</a> check out using
these commands:

     svn co https://gmod.svn.sourceforge.net/svnroot/gmod/schema/trunk/GMODTools

These commands will create a directory named `GMODTools`, with a
directory named `GMODTools` in it. Note that you don't need to supply a
password, and it may be very slow.

# <span id="Configuration" class="mw-headline">Configuration</span>

Bulkfiles has extensive configurations, in a simple
[XML](Glossary#XML "Glossary") format. This is both a strength and
weakness. The strength is that most aspects for genome data publication,
such as feature names, types, aspects of the output format, are under
your project's control. The weakness is these need detailed
documentation to make it easier to tune your site's configuration.

All of the organism and project-specific logic is in these configuration
files, including output documentation, feature controls and naming, file
choices.

Once configured for your organism(s) and project database, it is quick
to generate new bulk data release files, and link into a collection of
public releases. A new release needs only a minor configuration update
(release number and date), and can be generated automatically if
desired.

## <span id="GMODTools.2Fconf.2Fbulkfiles.2F" class="mw-headline">GMODTools/conf/bulkfiles/</span>

These are the main contents of the configuration files

- `sgdbulk.xml` : main release configuration for tested sample

This main release [XML](Glossary#XML "Glossary") controls what other
configurations are used.

A new release configuration with date, release name should be added as
needed.

- `bulkfiles_template.xml` : documented template for creating your
  project/organism configuration
- `site_defaults.xml`  : common database and output settings for your
  site.
- `chadofeatsql.xml`  : primary Chado [SQL](Glossary#SQL "Glossary")
  used to extract data from database.

If you have a complex Chado database, you may well want to add to or
update this.

- `chadofeatconv.xml` : logic to convert Chado view to public view of
  features.

What features are to be published, the structure of features, and much
of the messy genome detail are included here. It is complex but that is
part of the territory with genome databases.

- per-output configurations like
  `fastawriter.xml, blastfiles.xml, genbanksubmit.xml` have some site
  configurations such as path to NCBI tools that will need attention for
  proper use.

# <span id="Sample_Use" class="mw-headline">Sample Use</span>

Load a genome Chado db to [PostgreSQL](PostgreSQL "PostgreSQL")
database:

     curl -O http://sgdlite.princeton.edu/download/sgdlite/sgdlite.sql.gz
     createdb sgdlite
     (gunzip -c sgdlite.sql.gz | psql -d sgdlite -f - ) >& log.load

Extract bulk files from database:

     cd GMODTools
     perl -Ilib bin/bulkfiles.pl -conf sgdbulk -make

If your test fails, pleas re-run with the `-debug` option and send the
result log file to the developer contact below.

     perl -Ilib bin/bulkfiles.pl -conf sgdbulk -make -debug >& gmodtools-debug.log

## <span id="Sample_Output_Data_Folder" class="mw-headline">Sample Output Data Folder</span>

Output data folder looks like this. It is suited to linking to a public
web server for data downloading, e.g. the GMOD
[Standard_URL](Standard_URL "Standard URL").

     data/genomes/Saccharomyces_cerevisiae/sgdlite_2005_08_23/
     Example.txt  README.html  blast/       fasta/       gff/         tmp/
     HEADER.html  Release.txt  dna/         fff/         tables/

See the `tables/` folder for summary tables. The contents including web
HEADER, README and others are configured with the `conf/bulkfiles/`
configurations.

## <span id="Sample_Run_Log" class="mw-headline">Sample Run Log</span>

    microbe%  perl -Ilib bin/bulkfiles.pl -conf sgdbulk -make
    - Setting GMOD_ROOT=/bio/argos/gmod/GMODTools
    Config: title = SGD Lite; date = 20051129;  from conf/bulkfiles/sgdbulk.xml
    Config: title = Site Default settings for GMODTools;  from conf/bulkfiles/site_defaults.xml
    Config: title = Species abbreviations; date = 20051129;  from conf/bulkfiles/organisms.xml
    Config: title = Bulkfiles fileset definitions; date = 20040821;  from conf/bulkfiles/filesets.xml
    Config: title = Chado Feature mapping info; date = 20040821;  from conf/bulkfiles/featuresets.xml
     missing data dir data/genomes/Saccharomyces_cerevisiae
    Config: title = Chado DB SQL; date = 20051129;  from conf/bulkfiles/chadofeatsql.xml
    Automaking feature_table files
    Config: title = Blast index writer; date = 20040821;  from conf/bulkfiles/blastfiles.xml
    Config: title = Summary Tables; date = 20051217;  from conf/bulkfiles/tablewriter.xml
    Config: title = Gbrowse conf generator; date = 20040826;  from conf/bulkfiles/gbrowseconf.xml
    Config: title = Genome Web docs; date = 20051225;  from conf/bulkfiles/genomeweb.xml
    Changed 'current' release symlink to data/genomes/Saccharomyces_cerevisiae/sgdlite_2005_08_23; ok=1
    Bulkfiles done. result=overviews:, fff+gff=146661, fasta=19849, blast=14, tables=ok,
    Bulkfiles are located at data/genomes/Saccharomyces_cerevisiae/sgdlite_2005_08_23

## <span id="GenBank_genome_round-trip_test" class="mw-headline">GenBank genome round-trip test</span>

See also this brief [GMODTools
TestCase](GMODTools_TestCase "GMODTools TestCase") that describes how to
load a GenBank genome to Chado then regurgitate it via Bulkfiles as a
GenBank submission file set.

# <span id="Requirements" class="mw-headline">Requirements</span>

Bulkfiles is mostly a self-contained Perl package. It uses a few
[BioPerl](BioPerl "BioPerl") parts plus
<a href="http://search.cpan.org/perldoc?XML::Simple"
class="external text" rel="nofollow">XML::Simple</a> for configuration
files.

- <a href="http://www.postgresql.org/" class="external text"
  rel="nofollow">Postgres</a> and GMOD Chado database.
- Basic Perl tool set used for other GMOD packages.

# <span id="Updates" class="mw-headline">Updates</span>

Version 1.2 (2008 May) IN PROGRESS

- adding GenbankSubmitWriter, that creates a genome submission (new or
  update) for NCBI.

There now is enough of a GMODTools framework for dumping Chado genome
databases to Genbank Submit format that it likely will save effort for
those who need to do this job. This is open source and collaborators are
welcome to add code here

<a href="http://gmod.cvs.sourceforge.net/gmod/schema/GMODTools/"
class="external free"
rel="nofollow">http://gmod.cvs.sourceforge.net/gmod/schema/GMODTools/</a>

esp. lib/Bio/GMOD/Bulkfiles/GenbankSubmitWriter.pm and
conf/bulkfiles/genbanksubmit.xml

The above code is packaged at
<a href="http://eugenes.org/gmod/GMODTools/" class="external free"
rel="nofollow">http://eugenes.org/gmod/GMODTools/</a> as
GMODTools-1.2.zip

Here are sample Bulkfiles outputs from DrosMel CHR_4 and AnoGam CHR_X

<a
href="http://insects.eugenes.org/genome/Drosophila_melanogaster/dromel_20080512/"
class="external free"
rel="nofollow">http://insects.eugenes.org/genome/Drosophila_melanogaster/dromel_20080512/</a>

<a
href="http://insects.eugenes.org/genome/Anopheles_gambiae_str._PEST/anogam_20080511/"
class="external free"
rel="nofollow">http://insects.eugenes.org/genome/Anopheles_gambiae_str._PEST/anogam_20080511/</a>

Version 1.1 (2007 October) adds these features and corrections:

- No chromosome/scaffold/golden_path files. This change is needed to
  handle partially assembled genomes with many (1000s to 100,000s) of
  scaffolds. Flag no_csomesplit=1 to use this (should become default).
- Gene Ontology association file, see go_association tags in
  configurations
- Validate main variables in Chado database: \${golden_path},
  \${seq_ontology}. This step, on now by default, checks that database
  contains configured values. If failed, db is inspected for real
  values.
- Miscellany bugs cured and configuration updates, e.g., tables/overview
  now again active.

# <span id="See_Also" class="mw-headline">See Also</span>

- [XORT](XORT.1 "XORT") offers an alternative approach to bulk uploads
  and downloads from a Chado database.

<!-- -->

- [Sample Chado SQL](Sample_Chado_SQL "Sample Chado SQL") gives an
  overview of the feature and other Chado table
  [SQL](Glossary#SQL "Glossary") commands used for Bulkfiles output.
  Examples here can help you learn the contents of a database created by
  someone else, and are useful for GMODTools configuration.

# <span id="Contact" class="mw-headline">Contact</span>

[Dongilbert](User%253ADongilbert "User%253ADongilbert")




[Categories](Special%253ACategories "Special%253ACategories"):

- [BLAST](Category%253ABLAST "Category%253ABLAST")
- [Chado](Category%253AChado "Category%253AChado")
- [Database Tools](Category%253ADatabase_Tools "Category%253ADatabase Tools")
- [GMOD Components](Category%253AGMOD_Components "Category%253AGMOD Components")
- [WFleaBase](Category%253AWFleaBase "Category%253AWFleaBase")






## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AGMODTools" accesskey="t"
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GMODTools" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:00 on 15 August
  2013.</span>
<!-- - <span id="footer-info-viewcount">200,455 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





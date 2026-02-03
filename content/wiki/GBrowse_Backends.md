---
title: "GBrowse Backends"
---
<span id="top"></span>

# <span dir="auto">GBrowse Backends</span>

This page describes the [GBrowse](GBrowse.1 "GBrowse") database back
ends. It is incomplete.

## Contents

- [<span class="tocnumber">1</span> <span class="toctext">The
  Bio::DB::SeqFeature::Store
  Adaptor</span>](#The_Bio::DB::SeqFeature::Store_Adaptor)
  - [<span class="tocnumber">1.1</span> <span class="toctext">The GFF3
    Format</span>](#The_GFF3_Format)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Using
    Bio::DB::SeqFeature::Store with Flat
    Files</span>](#Using_Bio::DB::SeqFeature::Store_with_Flat_Files)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Using
    Bio::DB::SeqFeature::Store with the BerkeleyDB
    Backend</span>](#Using_Bio::DB::SeqFeature::Store_with_the_BerkeleyDB_Backend)
  - [<span class="tocnumber">1.4</span> <span class="toctext">Using
    Bio::DB::SeqFeature::Store with the MySQL
    Backend</span>](#Using_Bio::DB::SeqFeature::Store_with_the_MySQL_Backend)
- [<span class="tocnumber">2</span> <span class="toctext">The
  Bio::DB::GFF Adaptor</span>](#The_Bio::DB::GFF_Adaptor)
  - [<span class="tocnumber">2.1</span>
    <span class="toctext">Synopsis</span>](#Synopsis)
  - [<span class="tocnumber">2.2</span>
    <span class="toctext">Details</span>](#Details)
- [<span class="tocnumber">3</span>
  <span class="toctext">Bio::DB::Das::Chado</span>](#Bio::DB::Das::Chado)
  - [<span class="tocnumber">3.1</span>
    <span class="toctext">Synopsis</span>](#Synopsis_2)
  - [<span class="tocnumber">3.2</span>
    <span class="toctext">Performance</span>](#Performance)

# <span id="The_Bio::DB::SeqFeature::Store_Adaptor" class="mw-headline">The Bio::DB::SeqFeature::Store Adaptor</span>

This is a quick and easy adaptor to use. It allows you to load both
[GFF2](GFF2 "GFF2") and [GFF3](GFF3 "GFF3") formatted files, and
provides storage via flat files, BerkeleyDB-formatted files, and
[MySQL](MySQL "MySQL") and [PostgreSQL](PostgreSQL "PostgreSQL")
databases.

## <span id="The_GFF3_Format" class="mw-headline">The GFF3 Format</span>

An increasing number of model organism databases are distributing genome
annotation in [GFF3](GFF3 "GFF3") format. An example of this format can
be found at <a
href="ftp://genome-ftp.stanford.edu/pub/yeast/chromosomal_feature/saccharomyces_verevisiae.gff"
class="external text" rel="nofollow">SGD</a>.

## <span id="Using_Bio::DB::SeqFeature::Store_with_Flat_Files" class="mw-headline">Using Bio::DB::SeqFeature::Store with Flat Files</span>

Create a directory somewhere on the filesystem that is readable by the
Apache web server. Copy into it one or more GFF3 files containing
annotations for the genome of interest.

Create a [datasource-specific configuration
file](GBrowse_2.0_HOWTO#Data_Source_Configuration_Files "GBrowse 2.0 HOWTO")
for GBrowse with a \[database\] stanza like this one:

    [my_data:database]
    db_adaptor = Bio::DB::SeqFeature::Store
    db_args    = -adaptor memory
                 -dir     /path/to/your/database/directory

The **db_adaptor _option loads the Bio::DB::SeqFeature::Store module.
The_** _db_args'_ option passes arguments to the module, namely to use
the "memory" backend (store features into memory) from flat files
located at "/path/to/your/database/directory".

The configuration file's \[GENERAL\] section should contain the entry
"database = my_data".

If you wish to create tracks that display or manipulate DNA sequences,
you will need to add [FASTA](Glossary#FASTA "Glossary") files to this
directory. The FASTA files should have one DNA entry for each
chromosome, contig, or other sequence used as reference points by the
[GFF3](GFF3 "GFF3") files. For example:

    >chr1
    CCACACCACACCCACACACCCACACACCACACCACACACCACACCACACCCACACACACA
    CATCCTAACACTACCCTAACACAGCCCTAATCTAACCCTGGCCAACCTGTCTCTCAACTT
    ACCCTCCATTACCCTGCCTCCACTCGTTACCCTGTCCCATTCAACCATACCACTCCGAAC
    CACCATCCATCCCTCTACTTACTACCACTCACCCACCGTTACCCTCCAATTACCCATATC
    ...
    >chr2
    ATATTCTATACGGCCCGACGCGACGCGCCAAAAAATGAAAAACGAAGCAGCGACTCATTT
    TTATTTAAGGACAAAGGTTGCGAAGCCGCACATTTCCAATTTCATTGTTGTTTATTGGAC
    ATACACTGTTAGCTTTATTACCGTCCACGTTTTTTCTACAATAGTGTAGAAGTTTCTTTC
    TTATGTTCATCGTATTCATAAAATGCTTCACGAACACCGTCATTGATCAAATAGGTCTAT
    ...

Because the Bio::DB::SeqFeature::Store adaptor automatically creates an
index to speed up retrieval of DNA sequence, you will need to make the
directory that contains the GFF3 and FASTA files writeable by the Apache
user. For instance, if Apache runs as the user "www-data", then you will
need to do:

    sudo chown www-data /path/to/your/database/directory

It might be preferable to create a special group named "gbrowse", add
yourself and the Apache user to that group, assign the database
directory to the "gbrowse" group, and then make the directory group
writeable:

    sudo addgroup gbrowse
    sudo adduser $USER gbrowse
    sudo adduser www-data gbrowse
    sudo chgrp gbrowse /path/to/your/database/directory
    sudo chmod g+rwx /path/to/your/database/directory

## <span id="Using_Bio::DB::SeqFeature::Store_with_the_BerkeleyDB_Backend" class="mw-headline">Using Bio::DB::SeqFeature::Store with the BerkeleyDB Backend</span>

If your [GFF3](GFF3 "GFF3") files get much larger than a 1000 features
or so, GBrowse will begin to slow down. You can increase performance by
using the BerkeleyDB backend. In exactly the way that you did with the
in-memory version, set up a database directory containing to be
writeable by the Apache user and copy into it all the GFF3 and FASTA
files you wish to add to the database. Set the db_args of the datasource
database section to read as follows:

    [my_data:database]
    db_adaptor = Bio::DB::SeqFeature::Store
    db_args    = -adaptor berkeleydb
                 -dir     /path/to/your/database/directory

The next time you access the datasource, there will be a delay while the
database indexes are built. This delay may be quite long, so do not
interrupt loading by pressing the "Cancel" button. After the indexes are
built, access will be quite fast. You may add and edit GFF3 and FASTA
files at any time, and the indexes will be rebuilt as necessary.

Note that for the BerkeleyDB backend to work at all, the database
directory **must** be writeable by the Apache user.

## <span id="Using_Bio::DB::SeqFeature::Store_with_the_MySQL_Backend" class="mw-headline">Using Bio::DB::SeqFeature::Store with the [MySQL](MySQL "MySQL") Backend</span>

More preparation is required for this backend. You will need to use the
mysql command-line tool to create a new empty database, grant yourself
all privileges on the database, and grant the Apache user SELECT access
to the database:

    mysql -uroot -p password -e 'create database genomegff3'
    mysql -uroot -p password -e 'grant all privileges on genomegff3.* to me@localhost'
    mysql -uroot -p password -e 'grant select on genomegff3.* to apache@localhost'

Now you will use the bp_seqfeature_load.pl command (installed when you
installed BioPerl) to load GFF3 and FASTA files:

    bp_seqfeature_load.pl -d genomegff3 -f -c genome1.gff3 genome2.gff3 genome3.fa

In the \[database\] section of the datasource-specific configuration
file, enter a database configuration like the following:

    db_adaptor    = Bio::DB::SeqFeature::Store
    db_args       = -adaptor DBI::mysql
                    -dsn     dbi:mysql:database=genomegff3
                    -user    apache

The database should now be browsable.

# <span id="The_Bio::DB::GFF_Adaptor" class="mw-headline">The Bio::DB::GFF Adaptor</span>

This step takes you through populating the database with the full yeast
genome. You can skip this step if you use the in-memory database for
small projects.

## <span id="Synopsis" class="mw-headline">Synopsis</span>

         mysql -uroot -ppassword -e 'create database yeast'

         mysql -uroot -ppassword -e 'grant all privileges on yeast.* to me@localhost'
         mysql -uroot -ppassword -e 'grant file on *.* to me@localhost'
         mysql -uroot -ppassword -e 'grant select on yeast.* to nobody@localhost'

         bp_bulk_load_gff.pl -d yeast sample_data/yeast_data.gff

## <span id="Details" class="mw-headline">Details</span>

_Note: This section refers to the user account under which Apache runs
as "nobody" because that is the most common case. However, many systems
use a different user account. Mac OSX uses "www", Fedora Core uses
"apache" and Ubuntu uses "www-data." In the instructions that follow,
replace 'nobody' with the appropriate Apache account name._

You will need an installation of [MySQL](MySQL "MySQL") for this
section. Using the mysql command line, create a database (called "yeast"
in the synopsis above), and ensure that you have update and file
privileges on it. The example above assumes that you have a username of
"me" and that you will allow updates from the local machine only. It
also gives all privileges to "me". You may be comfortable with a more
restricted set of privileges, but be sure to provide at least SELECT,
UPDATE and INSERT privileges. You will need to provide the
administrator's name and correct password for these commands to succeed.

In addition, grant the "nobody" user the SELECT privilege. The web
server usually runs as nobody, and must be able to make queries on the
database. Modify this as needed if the web server runs under a different
account.

The next step is to load the database with data. This is accomplished by
loading the database from a tab-delimited file containing the genomic
annotations in [GFF](GFF "GFF") format. The [BioPerl](BioPerl "BioPerl")
distribution comes with three tools for loading Bio::DB::GFF databases:

bp_load_gff.pl  
This will incrementally load a database, optionally initializing it if
it does not already exist. This script will work correctly even if the
[MySQL](MySQL "MySQL") server is located on another host.

<!-- -->

bp_bulk_load_gff.pl  
This Perl script will initialize a new Bio::DB::GFF database with a
fresh schema, deleting anything that was there before. It will then load
the file. Only suitable for use the very first time you create a
database, or when you want to start from scratch! The bulk loader is as
much as 10x faster than bp_load_gff.pl, but does not work in the
situation in which the MySQL database is running on a remote host.

<!-- -->

bp_fast_load_gff.pl  
This will incrementally load a database. On UNIX systems, it will
activate a fast loader that makes the speed almost the same as the bulk
loader. Be careful, though, because this software relies on features
that are unevenly implemented across platforms. For example, it does not
work correctly on Mac OSX.

You will find these scripts in the BioPerl distribution, in the
subdirectory `scripts/Bio-DB-GFF`. If you requested that BioPerl scripts
be installed during installation, they will also be found in your
command path.

For testing purposes, this distribution includes a [GFF](GFF "GFF") file
with yeast genome annotations. The file can be found in the `test_data`
subdirectory. If the load is successful, you should see a message
indicating that 13298 features were successfully loaded.

Provided that the yeast load was successful, you may now run
`make test`. This invokes a small test script that tests that the
database is accessible by the "nobody" user and that the basic feature
retrieval functions are working.

You may also wish to load the yeast DNA, so that you can test the
three-frame translation and GC content features of the browser. Because
of its size, the file containing the complete yeast genome is
distributed separately and can be downloaded from:

<a
href="http://prdownloads.sourceforge.net/gmod/yeast.fasta.gz?download"
class="external free"
rel="nofollow">http://prdownloads.sourceforge.net/gmod/yeast.fasta.gz?download</a>

Load the file with this command:

      bp_load_gff.pl -d yeast -fasta yeast.fasta.gz

You should now be able to browse the yeast genome. Type the following
URL into your favorite browser:

<a href="http://name.of.your.host/cgi-bin/gbrowse/yeast"
class="external free"
rel="nofollow">http://name.of.your.host/cgi-bin/gbrowse/yeast</a>

This will display the genome browser instructions and a search field.
Type in "III" to start searching chromosome III, or search for "glucose"
to find a bunch of genes that are involved in glucose metabolism.

_IF YOU GET AN ERROR_ examine the Apache server error log (depending on
how Apache was installed, it may be located in
`/usr/local/apache/logs/`, `/var/log/httpd/`, `/var/log/apache`, or
elsewhere). Usually there will be an informative error message in the
error log. The most common problem is [MySQL](MySQL "MySQL") password or
permissions problems.

# <span id="Bio::DB::Das::Chado" class="mw-headline">Bio::DB::Das::Chado</span>

Scott needs to fill this in.

## <span id="Synopsis_2" class="mw-headline">Synopsis</span>

     db_adaptor    = Bio::DB::Das::Chado
     db_args       = -dsn dbi:Pg:dbname=chado
                     -user scott
                     -srcfeatureslice 1
                     -organism yeast
                     -version 1
                     -inferCDS 1

## <span id="Performance" class="mw-headline">Performance</span>

In order to achieve the best possible performance when using this
adaptor, please read [PostgreSQL Performance
Tips](PostgreSQL_Performance_Tips "PostgreSQL Performance Tips").

[Categories](Special%253ACategories "Special%253ACategories"):

- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse_Backends" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 17:16 on 23 April 2013.</span>
<!-- - <span id="footer-info-viewcount">42,536 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

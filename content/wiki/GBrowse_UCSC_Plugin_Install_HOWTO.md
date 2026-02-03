---
title: "GBrowse UCSC Plugin Install HOWTO"
---
# GBrowse UCSC Plugin Install HOWTO


This page contains detailed installation instructions for setting up
<a href="http://genome.ucsc.edu" class="external text"
rel="nofollow">UCSC Genome Browser</a> comparative genomics track data
and [GBrowse](GBrowse.1 "GBrowse")
[plugins](GBrowse_Install_HOWTO#Plugins "GBrowse Install HOWTO") to
display them. It assumes that you already have a working installation of
[GBrowse](GBrowse.1 "GBrowse") and
<a href="http://www.mysql.com/" class="external text"
rel="nofollow">MySQL</a>.

  


  Prerequisites](#Prerequisites)
- [UCSC naming
  conventions and other relevant
  subtleties](#UCSC_naming_conventions_and_other_relevant_subtleties)
  - [UCSC
    database names](#UCSC_database_names)
  - [Chromosome
    naming](#Chromosome_naming)
  - [Naming of
    database tables for comparative genomics
    tracks](#Naming_of_database_tables_for_comparative_genomics_tracks)
  - [Assembly
    and track meta-info](#Assembly_and_track_meta-info)
- [Installation
  Overview](#Installation_Overview)
- [Installation
  Details](#Installation_Details)
  - [Which UCSC
    database?](#Which_UCSC_database.3F)
  - [Which
    tables for my track(s) of
    interest?](#Which_tables_for_my_track.28s.29_of_interest.3F)
  - [Download
    mysql dump files from
    UCSC](#Download_mysql_dump_files_from_UCSC)
  - [Create and
    load the MySQL database](#Create_and_load_the_MySQL_database)
  - [Conservation track only: download external
    files](#Conservation_track_only:_download_external_files)
  - [Download
    and install the GBrowse
    plugin(s)](#Download_and_install_the_GBrowse_plugin.28s.29)
  - [Conservation track only: C extension
    required](#Conservation_track_only:_C_extension_required)
  - [Configure
    plugins in GBrowse](#Configure_plugins_in_GBrowse)
  - [Conservation track only:
    conf/UcscTrackImage.cfg
    file](#Conservation_track_only:_conf.2FUcscTrackImage.cfg_file)
  - [Test
    GBrowse](#Test_GBrowse)
- [Performance
  tweaks](#Performance_tweaks)
  - [rsync
    mysql table binary files](#rsync_mysql_table_binary_files)
- [Bug Reports
  and Support Requests](#Bug_Reports_and_Support_Requests)
- [AUTHORS](#AUTHORS)


## Prerequisites

- A working installation of [GBrowse](GBrowse.1 "GBrowse") (see also
  [GBrowse_Install_HOWTO](GBrowse_Install_HOWTO "GBrowse Install HOWTO"))
- A working installation of
  <a href="http://www.mysql.com/" class="external text"
  rel="nofollow">MySQL http://www.mysql.com/</a>
- Plenty of disk space, ideally local to your server.
- For Conservation plugin: a C compiler and mysql client library.

Disk space requirements vary depending on how many assemblies,
alignments and types of tracks you would like to install. Things to
consider:

- Temporary disk space for MySQL dump files used to load the database
  tables.
- MySQL server disk space requirements for database tables.
- If loading a Conservation track, permanent disk space for data files
  indexed by the MySQL database tables.

Here are some example approximate sizes for various tracks and organisms
(note that each genome assembly usually has many Chain and Net tracks,
and one Conservation track):

| Track Description | MySQL dump files | MySQL table Data_length | External files |
|----|----|----|----|
| Worm-Worm Chain | 170M | 120M | n/a |
| Worm-Worm Net | 25M | 20M | n/a |
| Worm 5-way Conservation | 75M | 65M | 465M |
| Human-Mammal Chain | 3,000M | 2,000M | n/a |
| Human-Mammal Net | 510M | 400M | n/a |
| Human 28-way Conservation | 2,530M | 2,000M | 79,300M |

## UCSC naming conventions and other relevant subtleties

An understanding of UCSC conventions is not really a prerequisite, but
will be quite helpful for understanding the installation process.

### UCSC database names

UCSC builds a separate MySQL database of annotations for each genome
assembly. Each database contains at least one table for each "track"
(set of annotations). The database name begins with 2 or 6 letters
indicating the species, followed by a sequence number which usually
starts with 1 on the first assembly that UCSC processes.

Jim Kent wrote the UCSC Genome Browser while working on the Human Genome
Project, so all databases for the human genome start with "hg". For
example, hg18 is the database of annotations for the 18th assembly of
the human genome displayed in the UCSC Genome Browser; the assembly
itself is better known as NCBI Build 36.

The next species added to the browser was mouse, and the first letters
of its genus and species names were used: "mm" for Mus musculus. That
convention was followed for rat (rn), *C. elegans* (ce), *D.
melanogaster* (dm) and several other species added before mid-2003.
Then, in order to avoid name clashes among the deluge of newly sequenced
species, a new convention was established: when new species are added to
the browser, we use the first three letters of the genus in lowercase,
and first three letters of the species with the first letter capitalized
(e.g. "bosTau" for *Bos taurus*).

### Chromosome naming

Most genome assemblies use sequence names for chromosomes that match
chromosome designations in the literature -- for example, 1, 2, 3 for
human, and I, II, III for worm. UCSC prefixes those sequence names with
"chr", to make it easier for its software to recognize chromosome
sequence names. UCSC's annotations for human refer to chr1, chr2, chr3
etc., and for worm, chrI, chrII, chrIII etc.

### Naming of database tables for comparative genomics tracks

For assemblies that consist of a reasonably small number of sequences
(e.g. a few dozen chromosomes or mapping groups, possibly with
concatenated unplaced sequences in virtual "chromosomes"), a track's
data may be split into per-sequence tables instead of kept in one main
table. This applies to the Chain tracks but not Net tracks, since Chain
tracks contain much more data. When split, table names for a track end
with the same track name, prefixed by the sequence name and \_. For
example, if a track named foo is split, its database tables are named
chr\*\_foo (or using the MySQL wildcard, chr%\\foo).

On the other hand, if an assembly consists of thousands of separate
unplaced sequences (e.g. WGS scaffolds), then it would kill MySQL to
make one table per sequence for each split track. Therefore, splitting
does not apply to such assemblies, and a track named foo would have one
table named foo.

Chain tracks use two different types of database table to efficiently
store the usually quite large amounts of data. The main tables are named
chain*OtherDb*, and auxiliary "chainLink" tables are named
chain*OtherDb*Link. (Or, if split, chr\*\_chain*OtherDb* and
chr\*\_chain*OtherDb*Link.)

Chain and Net tracks contain pairwise alignments to a particular
assembly of some other species' genome. The database table names for
those tracks include the UCSC database name for that other species'
assembly. For example, the chained alignments of UCSC's first *D.
ananassae* build (the query) to UCSC's third *D. melanogaster* build
(the target or reference) would be stored in the dm3 database, as the
tables chr\*\_chainDroAna1 and chr\*\_chainDroAna1Link -- split because
dm3 consists of a manageable number of chromosomes and concatenated
unplaced sequences. The corresponding netted chains would be stored in
netDroAna1.

The Conservation track combines two data types: per-base conservation
scores and multi-species alignments. Both data types use not only
database tables, but also external files, to store the data due to its
massive size.

The scores are stored in UCSC's "wiggle" format, which utilizes both
database tables and external files. The database table is usually called
phastCons*N*way where *N* is the number of aligned species including the
reference. The database references external files that contain binary
compressed data.

The multi-species alignments are stored in external files in the MAF
format; those files are indexed in the multiz*N*way database table. The
maf table refers to numeric IDs of the files; those numeric IDs and the
actual file paths are stored in the extFile table.

### Assembly and track meta-info

UCSC's names for databases and track tables are rather opaque by
themselves, so we store information about them in separate tables.
Assembly databases are described by the dbDb table in the central
database, hgcentral. Each assembly database contains a trackDb table
that describes all tracks in that database.

  

## Installation Overview

1.  Download MySQL table data from UCSC.
2.  Create mysql database and load tables.
    - If adding the Conservation track, also download external data
      files.
3.  Download the [GBrowse
    plugin](GBrowse_Install_HOWTO#Plugins "GBrowse Install HOWTO") and
    glyph modules
4.  Install and configure plugin(s).

  

## Installation Details

### Which UCSC database?

First, identify the UCSC database name that corresponds to the assembly
version on which your GBrowse installation is built. For example,
WormBase version WS170 corresponds to UCSC database ce4. This version
correspondence is usually available on the assembly description page at
<a href="http://genome.ucsc.edu/cgi-bin/hgGateway" class="external free"
rel="nofollow">http://genome.ucsc.edu/cgi-bin/hgGateway</a> ; you might
need to change the clade and genome in order to see your species of
interest and its available assembly dates. If you still aren't sure
about the correspondence, ask
<a href="mailto:genome@soe.ucsc.edu" class="external free"
rel="nofollow">mailto:genome@soe.ucsc.edu</a> for assistance.

### Which tables for my track(s) of interest?

These are the database tables required for each type of track:

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Track type</th>
<th>MySQL table(s)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>all tracks</td>
<td>chromInfo, trackDb, hgcentral.dbDb</td>
</tr>
<tr class="even">
<td>Chain</td>
<td>chain<em>OtherDb</em>, chain<em>OtherDb</em>Link<br />
or if split:<br />
chr*_chain<em>OtherDb</em>, chr*_chain<em>OtherDb</em>Link</td>
</tr>
<tr class="odd">
<td>Net</td>
<td>net<em>OtherDb</em></td>
</tr>
<tr class="even">
<td>Conservation</td>
<td>multiz<em>N</em>way, extFile, multiz<em>N</em>wayFrames,
multiz<em>N</em>waySummary, phastCons<em>N</em>way*</td>
</tr>
</tbody>
</table>

  

### Download mysql dump files from UCSC

All UCSC Genome Browser data can be downloaded from
<a href="http://hgdownload.cse.ucsc.edu/" class="external text"
rel="nofollow">hgdownload.cse.ucsc.edu</a>. The HTTP, FTP and rsync
protocols are supported.

For each database table \$TABLE, there are two files: \$TABLE.sql, which
contains a CREATE statement for MySQL to create the table, and
\$TABLE.txt.gz, a gzip-compressed tab-separated text file with the
contents of the table. In these examples of how to fetch the data using
different protocols, \$TMPDIR is a local temporary storage directory,
\$DB is the database, and \$TABLE is the table. In practice, you will
probably write a script that loops on multiple tables and possibly even
multiple databases.

    # Example 1: use rsync to fetch .sql and .txt.gz files:
    mkdir -p $TMPDIR/$DB
    rsync -avP \
      rsync://hgdownload.cse.ucsc.edu/genome/goldenPath/$DB/database/$TABLE.{sql,txt.gz} \
      $TMPDIR/$DB/
    gunzip $TMPDIR/$DB/$TABLE.txt.gz

    # Example 2: use wget to fetch files using ftp:// or http:// :
    mkdir -p $TMPDIR/$DB
    wget -N -O $TMPDIR/$DB/$TABLE.sql \
      ftp://hgdownload.cse.ucsc.edu/genome/goldenPath/$DB/database/$TABLE.sql
    wget -N -O $TMPDIR/$DB/$TABLE.txt.gz \
      ftp://hgdownload.cse.ucsc.edu/genome/goldenPath/$DB/database/$TABLE.txt.gz
    gunzip $TMPDIR/$DB/$TABLE.txt.gz

Also download the central database .sql, which creates and populates
several assembly metadata tables.

    wget -N -O $TMPDIR/hgcentral.sql \
      http://hgdownload.cse.ucsc.edu/admin/hgcentral.sql

If you encounter any problems while fetching the files, contact
<a href="mailto:genome-mirror@soe.ucsc.edu" class="external free"
rel="nofollow">mailto:genome-mirror@soe.ucsc.edu</a> . Please include
which database and file(s), which version of downloading tool you were
using, error messages if any, and any other relevant info.

### Create and load the MySQL database

Having downloaded the necessary data files, create a local MySQL
database hgcentral and a database for each assembly version for which
you are downloading tracks. In order for the Conservation plugin to
work, your MySQL genome assembly database *must* have the same name as
the UCSC database (\$DB above).

    mysql -u root -pPassword -e "create database hgcentral;"
    mysql -u root -pPassword hgcentral < $TMPDIR/hgcentral.sql

    mysql -u root -pPassword -e "create database $DB;"

Here is how to create and populate a single table. In practice, you will
most likely write a script that loops on \$TABLE and possibly on \$DB:

    mysql $DB -u root -pPassword < $TABLE.sql
    mysql $DB -u root -pPassword -e "load data local infile '$TMPDIR/$DB/$TABLE.txt' into table $TABLE"

### Conservation track only: download external files

The Conservation track combines multiple alignments and per-base scores
for multiple species. This is a very large amount of data, and in order
to access and display it quickly, the actual data are kept in external
files, and the database tables simply index those files. So, having
installed the multiz*N*way and phastCons*N*way database tables, you can
use mysql to determine what files are needed from UCSC.

Determine the files needed for multiz*N*way and phastCons*N*way by
running by running these mysql commands:

    select distinct(path) from extFile,multizNway where extFile.id = multizNway.extFile;
    select distinct(file) from phastConsNway;

The paths all start with "/gbdb/", and can be downloaded from
hgdownload.cse.ucsc.edu using the /gbdb/... path as follows, depending
on your chosen protocol:

    rsync://hgdownload.cse.ucsc.edu/gbdb/...
    ftp://hgdownload.cse.ucsc.edu/gbdb/...
    http://hgdownload.cse.ucsc.edu/gbdb/...

Ideally, create a local /gbdb/ and install the files in the same paths
as referenced by the sql tables. If that is not possible, replace the
pathnames in the sql tables with your local paths to the corresponding
files.

### Download and install the GBrowse plugin(s)

The plugin and glyph modules are available by anonymous
[Git](Glossary#Git "Glossary"):

    git clone git://genome-source.cse.ucsc.edu/gmod-ucsc.git

The directory structure mirrors that of the main GBrowse repository.
Copy or link all files from gmod-ucsc/Generic-Genome-Browser/ into the
corresponding locations in your GBrowse installation's
Generic-Genome-Browser tree, make and make install. **NOTE: this
includes Makefile.PL and MANIFEST... hand-merge if you have local
changes!**

Note: In order for the Conservation plugin to work, your GBrowse
Makefile.PL needs to have been configured with DO_XS enabled
(compilation of C extensions).

These are the Perl module files required for each plugin:

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>plugin</th>
<th>Perl modules (glyph and plugin)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>all</strong></td>
<td>Bio/Graphics/Glyph/ucsc_glyph.pm<br />
Bio/Graphics/Browser/Plugin/UcscPlugin.pm</td>
</tr>
<tr class="even">
<td>UcscChain</td>
<td>Bio/Graphics/Glyph/ucsc_chain.pm<br />
Generic_Genome_Browser/conf/plugins/UcscChain.pm</td>
</tr>
<tr class="odd">
<td>UcscNet</td>
<td>Bio/Graphics/Glyph/ucsc_net.pm<br />
Generic_Genome_Browser/conf/plugins/UcscNet.pm</td>
</tr>
<tr class="even">
<td>UcscConservation</td>
<td>Generic_Genome_Browser/conf/plugins/UcscWiggle.pm<br />
Generic_Genome_Browser/conf/plugins/UcscConservation.pm</td>
</tr>
</tbody>
</table>

### Conservation track only: C extension required

While UcscChain and UcscNet have pure-Perl implementations,
UcscConservation requires a compiled C extension,
Bio::Graphics::Browser::UcscTrackImage. The Perl, XS, C and H files are
in Generic_Genome_Browser/libucsc/\*. The top-level "make" and "make
install" in Generic-Genome-Browser will descend into libucsc and build
the extension if Makefile.PL and MANIFEST have been appropriately
updated and if Makefile.PL was configured with DO_XS enabled.

### Configure plugins in GBrowse

Add the plugin names (UcscChain, UcscNet, and/or UcscConservation to the
plugins setting in the appropriate .conf file(s): for GBrowse 1.52,
*datasource*.conf; for GBrowse 2.0, GBrowse.conf. (see also
[GBrowse_Install_HOWTO#Plugins](GBrowse_Install_HOWTO#Plugins "GBrowse Install HOWTO"))

Add plugin settings like the following to *datasource*.conf:

    [UcscPlugin:plugin]
    db = ce4
    user = mysqlReadOnlyUser
    pass = mysqlReadOnlyUsersPassword
    seq_prefix = chr
    split_prefix = chr

    [UcscChain:plugin]
    default_enable = chainCb3

    [UcscNet:plugin]
    default_enable = netCb3 netCaeRem2

    [UcscConservation:plugin]
    default_enable = multiz5way

These are the supported `[UcscPlugin:plugin]` settings, shared by all
Ucsc plugins (but can be overridden in the section for each plugin if
necessary):

| setting | required? | description |
|----|----|----|
| <span style="font-family: Courier New;">db</span> | **Yes** | The name of the MySQL database where UCSC tables have been loaded. |
| <span style="font-family: Courier New;">user</span> | **Yes** | The name of a MySQL user that has permission to read <span style="font-family: Courier New;">db</span>. |
| <span style="font-family: Courier New;">pass</span> | **Yes** | The password for <span style="font-family: Courier New;">user</span>. |
| <span style="font-family: Courier New;">seq_prefix</span> | **probably** | If the datasource has sequence names like I, II, III or 2L, 2R, 3L, set this to <span style="font-family: Courier New;">chr</span> so that they can be translated into UCSC's names: chrI, chrII, chrIII or chr2L, chr2R, chr3L etc. This is usually the case. |
| <span style="font-family: Courier New;">split_prefix</span> | **probably** | If all of the sequences in the datasource are chromosome names (not separate scaffolds, contigs etc), set this to <span style="font-family: Courier New;">chr</span> if <span style="font-family: Courier New;">seq_prefix</span> is chr. |
| <span style="font-family: Courier New;">host</span> | prob. not | The machine on which the MySQL server, if not the same machine on which GBrowse runs. |
| <span style="font-family: Courier New;">port</span> | prob. not | The port number used by the MySQL server, if not the same as MySQL's default. |
| <span style="font-family: Courier New;">central_db</span> | prob. not | The name of the MySQL database in which the dbDb table is stored, if not hgcentral. |
| <span style="font-family: Courier New;">central_user</span> | prob. not | The MySQL user for <span style="font-family: Courier New;">central_db</span>, if not the same as <span style="font-family: Courier New;">user</span>. Must be able to read and write to <span style="font-family: Courier New;">central_db</span>. |
| <span style="font-family: Courier New;">central_pass</span> | prob. not | The password for <span style="font-family: Courier New;">central_user</span>, if not the same as <span style="font-family: Courier New;">pass</span>. |
| <span style="font-family: Courier New;">central_host</span> | prob. not | The machine on which the MySQL server that serves up <span style="font-family: Courier New;">central_db</span>, if not the same as <span style="font-family: Courier New;">host</span>. |
| <span style="font-family: Courier New;">central_port</span> | prob. not | The port number used by <span style="font-family: Courier New;">central_host</span>, if not the same as <span style="font-family: Courier New;">port</span>. |

This setting is only for actual track plugins (e.g.
`[UcscChain:plugin]`), not for the base class `[UcscPlugin:plugin]`:

| setting | required? | description |
|----|----|----|
| <span style="font-family: Courier New;">default_enable</span> | **should be** | A whitespace-separated list of chain or net tracks to display by default. E.g., <span style="font-family: Courier New;">chain*OtherDb1* chain*OtherDb2*</span> in the UcscChain:plugin section, <span style="font-family: Courier New;">net*OtherDb1* net*OtherDb2*</span> in the UcscNet:plugin section. If not specified, all tracks will be displayed by default which could overwhelm the display. |

### Conservation track only: conf/UcscTrackImage.cfg file

The Conservation plugin's C extension
(Bio::Graphics::Browser::UcscTrackImage) requires a file named
UcscTrackImage.cfg to exist in the GBrowse configuration directory,
Generic-Genome-Browser/conf/. The contents of the file have a lot in
common with the GBrowse .conf settings above:

    db.host=localhost
    db.user=mysqlReadOnlyUser
    db.password=mysqlReadOnlyUsersPassword
    db.trackDb=trackDb

    central.db=hgcentral
    central.host=localhost
    central.user=mysqlHgcentralRWUser
    central.password=mysqlHgcentralRWUser

Note that the central.user account, unlike the db.user, needs to have
write access -- but only to hgcentral.

### Test GBrowse

Reinstall GBrowse by running 'make install' in Generic_Genome_Browser/,
watch for errors at the end of the GBrowse web server's error log file,
and start using GBrowse. Here is an example command to watch the log
file that might work if you are using Apache:

    tail -f /usr/local/apache/logs/error_log

In GBrowse, below the image, in the Tracks section, Analysis subsection,
set the checkboxes by the UCSC plugin track names and click Update
Image. UCSC tracks should appear in the display. If not, there may be no
data in the current region; try viewing a region that contains an exon
or gene. Or the error log may contain a message that indicates what is
missing.

  

## Performance tweaks

### rsync mysql table binary files

If you have permissions to modify MySQL's binary files, and are
investing significant effort into developing an automated regular update
of track data, you may want to try rsyncing the binary files directly
from UCSC. That replaces the downloading of \$TABLE.{sql,txt.gz} files
and loading into MySQL.

    rsync -navP rsync://hgdownload.cse.ucsc.edu/mysql/$DB/$TABLE.\* \
      /var/lib/mysql/$DB/

  

## Bug Reports and Support Requests

Please send general questions and/or bug reports to
<a href="mailto:genome@soe.ucsc.edu" class="external free"
rel="nofollow">mailto:genome@soe.ucsc.edu</a>. If your question is
specifically about fetching data from hgdownload.cse.ucsc.edu, send to
<a href="mailto:genome_mirror@soe.ucsc.edu" class="external free"
rel="nofollow">mailto:genome_mirror@soe.ucsc.edu</a>.

  

## AUTHORS

Angie Hinrichs <a href="mailto:angiehinrichs@users.sourceforge.net"
class="external free"
rel="nofollow">mailto:angiehinrichs@users.sourceforge.net</a>

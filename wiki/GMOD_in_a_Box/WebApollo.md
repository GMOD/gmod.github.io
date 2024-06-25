<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">GMOD in a Box/WebApollo</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

GMOD in a Box has WebApollo and all its prerequisites installed and
configured. You'll only need to process your data to start using
WebApollo.

For this guide, we'll be using the included sample data located in:
~/sample_data/pyu_data

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span> <span class="toctext">User
  management</span>](#User_management)
- [<span class="tocnumber">2</span> <span class="toctext">Data
  processing</span>](#Data_processing)
  - [<span class="tocnumber">2.1</span>
    <span class="toctext">Experimental</span>](#Experimental)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Setting up
    the user database</span>](#Setting_up_the_user_database)
- [<span class="tocnumber">3</span>
  <span class="toctext">Configuration</span>](#Configuration)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Main
    configuration</span>](#Main_configuration)
  - [<span class="tocnumber">3.2</span> <span class="toctext">Alternate
    translation tables</span>](#Alternate_translation_tables)
  - [<span class="tocnumber">3.3</span> <span class="toctext">Canned
    comments</span>](#Canned_comments)
- [<span class="tocnumber">4</span> <span class="toctext">Data
  generation</span>](#Data_generation)
  - [<span class="tocnumber">4.1</span> <span class="toctext">DNA track
    setup</span>](#DNA_track_setup)
  - [<span class="tocnumber">4.2</span> <span class="toctext">WebApollo
    plugin</span>](#WebApollo_plugin)
  - [<span class="tocnumber">4.3</span> <span class="toctext">Static
    data generation</span>](#Static_data_generation)
  - [<span class="tocnumber">4.4</span> <span class="toctext">GFF3 with
    gene/transcript/exon/CDS/polypeptide
    features</span>](#GFF3_with_gene.2Ftranscript.2Fexon.2FCDS.2Fpolypeptide_features)
  - [<span class="tocnumber">4.5</span> <span class="toctext">GFF3 with
    match/match_part
    features</span>](#GFF3_with_match.2Fmatch_part_features)
  - [<span class="tocnumber">4.6</span> <span class="toctext">Generate
    searchable name index</span>](#Generate_searchable_name_index)
  - [<span class="tocnumber">4.7</span> <span class="toctext">BAM
    data</span>](#BAM_data)
  - [<span class="tocnumber">4.8</span> <span class="toctext">BigWig
    data</span>](#BigWig_data)
  - [<span class="tocnumber">4.9</span> <span class="toctext">Sequence
    searching</span>](#Sequence_searching)
- [<span class="tocnumber">5</span> <span class="toctext">Accessing
  WebApollo</span>](#Accessing_WebApollo)

</div>

# <span id="User_management" class="mw-headline">User management</span>

There are two accounts preconfigured for WebApollo. 'web_apollo_admin'
with 'web_apollo_admin' as the password and 'guest' with 'guest' as the
password. 'web_apollo_admin' has full permissions to the WebApollo
instance, while 'guest' only has read and write permissions. If you're
going to expose your instance to the outside world, you'll want to
change the passwords for these two accounts.

    $ change_user_password.pl -u web_apollo_admin -p <NEW_PASSWORD>
    $ change_user_password.pl -u guest -p <NEW_PASSWORD>

You can add, delete, and change permissions for users from
'Admin-\>Manage users' interface in the reference sequence selection
screen after processing your data. Note that you'll need to be logged in
as 'web_apollo_admin' to see this option.

# <span id="Data_processing" class="mw-headline">Data processing</span>

## <span id="Experimental" class="mw-headline">Experimental</span>

We have an experimental script to help in setting up your WebApollo
instance. The script is interactive and will setup the configuration,
database and permissions, run the JBrowse setup scripts, and setup the
BLAT database all from just a GFF3 file. Let's try it with our sample
data.

    $ sudo setup_webapollo.sh
    Enter location of GFF3: ~/sample_data/pyu_data/scf1117875582023.gff
    Enter location of genomic FASTA (leave empty to use GFF3): 
    Enter organism name (genus species): Pythium ultimum
    Enter SO term for genomic sequences (e.g., contig): contig

    Extracting seqids

    Adding annotation tracks to database
    Processing Annotations-scf1117875582023

    Setting annotation track permissions
    Processing Annotations-scf1117875582023

    Updating configuration

    Processing DNA track

    Processing evidence tracks
    Processing blastn
    Processing blastx
    Processing est2genome
    Processing maker
    Processing protein2genome
    Processing repeatmasker
    Processing repeatrunner
    Processing snap_masked

    Setting up WebApollo plugin
    parsed tracklist from file: data/trackList.json
    output modified trackList to file: data/trackList.json Generating name index (this may take a while)

    Creating search database

    Restarting Tomcat (enter the password used to login to the VM if prompted)
    * Stopping Tomcat servlet engine tomcat7                                  [ OK ] 
    * Starting Tomcat servlet engine tomcat7                                  [ OK ]

    Your WebApollo instance is ready for use.

Some things to note about this script. First, if will give default
colors for the evidence tracks. If you want to modify their look, you'll
need to configure them yourself. If you want to setup canned comments,
you'll have to do it yourself. You'll want to edit
'/data/var/lib/tomcat7/webapps/WebApollo/config/canned_comments.xml'.
This tool also won't handle adding BAM and BigWig files. You'll need to
run the corresponding scripts to add those types of files. See the
section on [BAM](#BAM) and [BigWig](#BigWig) respectively.

The script also takes a number of arguments if you want to run it from
the command line without the interactivity. Use the '-h' option to see
the available arguments. One argument of significance is '-a' which will
be used when you're adding GFF3 files to an EXISTING instance. This will
skip some of the steps and just process the GFF3 file. Running it
without the '-a' option will restart the setup process from scratch, so
you'll lose any previously processed data.

The following sections will cover the individual steps that were
automated by the script. You'll want to read through those so that you
have a better understanding of the steps involved in setting up the
installation, since this script is experimental and if something goes
wrong during the setup process, you'll need to handle the failed steps
manually.

## <span id="Setting_up_the_user_database" class="mw-headline">Setting up the user database</span>

The following steps will be using the included sample First we'll need
to setup the user database. It stores users who will have access to
WebApollo and their corresponding access level. The database uses
PostgreSQL. We have already created the PostgreSQL user for
'web_apollo_users_admin', with password 'web_apollo_users_admin' who has
full access to the database used by WebApollo. Note that this is the
user for accessing the PostgreSQL database, not a WebApollo user. You
can choose to change the password for the PostgreSQL user if you'd like,
but PostgreSQL has been setup to not accept any outside connections, so
to have unauthorized access to the database means that access to the
server has already been compromised. If you choose to change the
password, you'll need to update the WebApollo configuration to reflect
the change (as well as provide the password in all the included
scripts).

We'll add the annotation track ids for the genomic sequences for our
organism. We'll use the 'add_tracks.pl' script. We need to generate a
file of genomic sequence ids for the script. For convenience, there's a
script called 'extract_seqids_from_fasta.pl' which will go through a
FASTA file and extract all the ids from the deflines. Let's first create
the list of genomic sequence ids. We'll store it in
'~/scratch/seqids.txt'.

    $ extract_seqids_from_fasta.pl -p Annotations- -i ~/sample_data/pyu_data/scf1117875582023.fa -o ~/scratch/seqids.txt

Now we'll add those ids to the user database.

    $ add_tracks.pl -t ~/scratch/seqids.txt

Now that we have the annotation track ids loaded, we'll need to give
'web_apollo_admin' and 'guest' permissions to access the data. We'll
give all the all permissions (read, write, publish, user manager) to the
'web_apollo_admin'. We'll use the 'set_track_permissions.pl' script and
will need to provide the script a list of genomic sequence ids, like in
the previous step.

    $ set_track_permissions.pl -u web_apollo_admin -t ~/scratch/seqids.txt -a

For 'guest', we'll give read and write permissions.

    $ set_track_permissions.pl -u guest -t ~/scratch/seqids.txt -r -w

Note that we're only using a subset of the options for all the scripts
mentioned above. You can get more detailed information on any given
script (and other available options) using the '-h'? or '--help' flag
when running the script.

We're all done setting up the user database. Now we need to move on to
configuring the application.

# <span id="Configuration" class="mw-headline">Configuration</span>

Note about text editors: We'll have to edit some of the configuration
files before we're up and running. Since there's no desktop environment
installed, you'll need to use a non-graphical editor. The virtual
machine provides two options: 'nano' (easier to use) and 'vim' (super
powerful but a lot harder to use). Unless you're already familiar with
'vim', you're probably better off using 'nano'.

## <span id="Main_configuration" class="mw-headline">Main configuration</span>

Most of main configuration, located in
'/data/var/lib/tomcat7/webapps/WebApollo/config/config.xml' has been set
already. However, there're a few items you'll need to change.

First we'll need to put in your organism name (genus and species) in
'\<organism\>'. In our sample data, we're working with 'Pythium
ultimum'.

Next we'll want to put in the type for the genomic sequences for the
organism in '\<sequence_type\>'. It should be in the form of 'CV:term'.
In our sample data the genomic sequences are of the type
'sequence:contig'.

You should read the <a
href="http://www.gmod.org/wiki/WebApollo_Installation#Configuration#Configuration"
class="external text" rel="nofollow">configuration section</a> in the
server installation documentation to get details about further
customizing your WebApollo instance.

## <span id="Alternate_translation_tables" class="mw-headline">Alternate translation tables</span>

By default, WebApollo is configured to use NCBI's translation table 1.
If your organism uses an alternate translation table, you'll want to
modify the '\<translation_table\>' element in the main configuration
file. Check the contents of the
'/data/var/lib/tomcat7/webapps/WebApollo/config/translation_tables'
directory to see which translation tables are available and update the
entry accordingly.

## <span id="Canned_comments" class="mw-headline">Canned comments</span>

You can configure a set of predefined comments that will be available
for users when adding comments through a dropdown menu. The
configuration is stored in
'/data/var/lib/tomcat7/webapps/WebApollo/config/canned_comments.xml'.
Let's take a look at the configuration file.

    <?xml version="1.0" encoding="UTF-8"?>

    <canned_comments>
    </canned_comments>

You'll need one '\<comment\>' element for each predefined comment. The
element needs to have a 'feature_type' attribute in the form of
'CV:term' that this comment applies to. Let's make a few comments for
feature of type 'sequence:gene' and 'sequence:mRNA':

    <comment feature_type="sequence:gene">This is a comment for a gene</comment>
    <comment feature_type="sequence:gene">This is another comment for a gene</comment>
    <comment feature_type="sequence:mRNA">This is a comment for a mRNA</comment>

We're now done configuring WebApollo. Onto data generation.

# <span id="Data_generation" class="mw-headline">Data generation</span>

The steps for generating data (in particular static data) are mostly
similar to JBrowse data generation steps, with some extra steps
required. All the data generation steps should be done within
WebApollo's JBrowse directory. Let's change into that directory.

    $ cd /var/lib/tomcat7/webapps/WebApollo/jbrowse

Note: The following steps require root access, so you can just open a
shell as root to run each command (rather than having to sudo each
step).

    $ sudo -s

## <span id="DNA_track_setup" class="mw-headline">DNA track setup</span>

The first thing we need to do before processing our evidence is to
generate the reference sequence data to be used by JBrowse. We'll use
the 'prepare-refseqs.pl' script.

    $ bin/prepare-refseqs.pl --fasta ~/sample_data/pyu_data/scf1117875582023.fa

We now have the DNA track setup.

## <span id="WebApollo_plugin" class="mw-headline">WebApollo plugin</span>

We now need to setup the data configuration to use the WebApollo plugin.
We'll use the 'add-webapollo-plugin.pl' script to do so.

    $ bin/add-webapollo-plugin.pl -i data/trackList.json

## <span id="Static_data_generation" class="mw-headline">Static data generation</span>

Generating data from GFF3 works best by having a separate GFF3 per
source type. If your GFF3 has all source types in the same file, we need
to split up the GFF3. We can use the 'split_gff_by_source.pl' script to
do so. We'll output the split GFF3 to some temporary directory (we'll
use '~/scratch/split_gff').

    $ split_gff_by_source.pl -i ~/sample_data/pyu_data/scf1117875582023.gff -d ~/scratch/split_gff

If we look at the contents of '~/scratch/split_gff', we can see we have
the following files:

    $ ls ~/scratch/split_gff
    blastn.gff  est2genome.gff  protein2genome.gff  repeatrunner.gff
    blastx.gff  maker.gff       repeatmasker.gff    snap_masked.gff

We need to process each file and create the appropriate tracks.

## <span id="GFF3_with_gene.2Ftranscript.2Fexon.2FCDS.2Fpolypeptide_features" class="mw-headline">GFF3 with gene/transcript/exon/CDS/polypeptide features</span>

We'll start off with 'maker.gff'. We need to handle that file a bit
differently than the rest of the files since the GFF represents the
features as gene, transcript, exons, and CDSs.

    $ bin/flatfile-to-json.pl --gff ~/scratch/split_gff/maker.gff --arrowheadClass trellis-arrowhead --getSubfeatures --subfeatureClasses '{"wholeCDS": null, "CDS":"brightgreen-80pct", "UTR": "darkgreen-60pct", "exon":"container-100pct"}' --cssClass container-16px --type mRNA --trackLabel maker

Note that 'brightgreen-80pct', 'darkgreen-60pct', 'container-100pct',
'container-16px', 'gray-center-20pct' are all CSS classes defined in
WebApollo stylesheets that describe how to display their respective
features and subfeatures. WebApollo also tries to use reasonable default
CSS styles, so it is possible to omit these CSS class arguments. For
example, to accept default styles for 'maker.gff', the above could
instead be shortened to:

    $ bin/flatfile-to-json.pl --gff ~/scratch/split_gff/maker.gff --getSubfeatures --type mRNA --trackLabel maker

See the <a
href="http://www.gmod.org/wiki/WebApollo_Installation#Customizing_features#Customizing_features"
class="external text" rel="nofollow">Customizing features</a> section in
the WebApollo installation guide for more information on CSS styles.

## <span id="GFF3_with_match.2Fmatch_part_features" class="mw-headline">GFF3 with match/match_part features</span>

Now we need to process the other remaining GFF3 files. The entries in
those are stored as 'match/match_part', so they can all be handled in a
similar fashion.

We'll start off with blastn as an example.

    $ bin/flatfile-to-json.pl --gff ~/scratch/split_gff/blastn.gff --arrowheadClass webapollo-arrowhead --getSubfeatures --subfeatureClasses '{"match_part": "darkblue-80pct"}' --cssClass container-10px --trackLabel blastn

Again, 'container-10px' and 'darkblue-80pct' are CSS class names that
define how to display those elements. See the <a
href="http://www.gmod.org/wiki/WebApollo_Installation#Customizing_features#Customizing_features"
class="external text" rel="nofollow">Customizing features</a> section in
the WebApollo installation guide for more information.

We need to follow the same steps for the remaining GFF3 files. It can be
a bit tedious to do this for the remaining six files, so we can use a
simple Bash shell script to help us out. Don't worry if the script
doesn't make sense, you can always process each file manually.

    $ for i in $(ls ~/scratch/split_gff/*.gff | grep -v maker); do j=$(basename $i); j=${j/.gff/}; echo "Processing $j"; bin/flatfile-to-json.pl --gff $i --arrowheadClass webapollo-arrowhead --getSubfeatures --subfeatureClasses "{\"match_part\": \"darkblue-80pct\"}" --cssClass container-10px --trackLabel $j; done

## <span id="Generate_searchable_name_index" class="mw-headline">Generate searchable name index</span>

Once data tracks have been created, you will need to generate a
searchable index of names using the generate-names.pl script:

    $ bin/generate-names.pl

This script creates an index of sequence names and feature names in
order to enable auto-completion in the navigation text box. This index
is required, so if you do not wish any of the feature tracks to be
indexed for auto-completion, you can instead run 'generate-names.pl'
immediately after running 'prepare_refseqs.pl', but before generating
other tracks.

The script can be also rerun after any additional tracks are generated
if you wish feature names from that track to be added to the index.

## <span id="BAM_data" class="mw-headline">BAM data</span>

Now let's look how to configure BAM support. WebApollo has native
support for BAM, so no extra processing of the data is required.

First we'll copy the BAM data into the 'data/bam' directory. Keep in
mind that this BAM data was randomly generated, so there's really no
biological meaning to it. We only created it to show BAM support.

    $ cp ~/sample_data/pyu_data/*.bam* data/bam

Now we need to add the BAM track.

    $ bin/add-bam-track.pl --bam_url bam/simulated-sorted.bam --label simulated_bam --key "simulated BAM"

You should now have a simulated BAM track available.

## <span id="BigWig_data" class="mw-headline">BigWig data</span>

WebApollo has native support for BigWig files (.bw), so no extra
processing of the data is required.

Configuring a BigWig track is very similar to configuring a BAM track.
First we'll copy the BigWig data into the 'data/bigwig' directory. Keep
in mind that this BigWig data was generated as a coverage map derived
from the randomly generated BAM data, so like the BAM data there's
really no biological meaning to it. We only created it to show BigWig
support.

    $ cp ~/sample_data/pyu_data/*.bw data/bigwig

Now we need to add the BigWig track.

    $ bin/add-bw-track.pl --bw_url bigwig/simulated-sorted.coverage.bw --label simulated_bw --key "simulated BigWig"

You should now have a simulated BigWig track available.

## <span id="Sequence_searching" class="mw-headline">Sequence searching</span>

To allow sequence searching, we'll need to create a sequence database
for BLAT to use. We'll use the 'faToTwoBit' tool to convert the sample
data FASTA file into a 2bit database. The BLAT database must be stored
in '/data/webapollo/blat/db/genomic.2bit' (otherwise you'll need to
update the 'blat.xml' configuration to point to the right file).

    $ faToTwoBit ~/sample_data/pyu_data/scf1117875582023.fa /data/webapollo/blat/db/genomic.2bit

# <span id="Accessing_WebApollo" class="mw-headline">Accessing WebApollo</span>

You'll need to restart Tomcat for the changes to take affect.

    $ service tomcat7 restart

WebApollo should now be up and running. You can access it:

http://\<virtual_machine_ip_address\>/WebApollo

Enter 'web_apollo_admin' for the 'User name' and whatever password you
changed it to for 'Password' (default is 'web_apollo_admin').

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=GMOD_in_a_Box/WebApollo&oldid=24945>"

</div>

<div id="catlinks" class="catlinks catlinks-allhidden">

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">



<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces

- <span id="ca-nstab-main"><a href="WebApollo" accesskey="c"
  title="View the content page [c]">Page</a></span>
- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:GMOD_in_a_Box/WebApollo&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>

<div id="right-navigation">





</div>



</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category:FAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category:HOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">


- <span id="t-smwbrowselink"><a href="../Special:Browse/GMOD_in_a_Box-2FWebApollo"
  rel="smw-browse">Browse properties</a></span>
- <span id="t-pdf">[Print as
  PDF](http://gmod.org/mediawiki/index.php?title=Special:PdfPrint&page=GMOD_in_a_Box/WebApollo)</span>

</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 20:09 on 17 December
  2013.</span>
- <span id="footer-info-viewcount">16,582 page views.</span>
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](../GMOD:About "GMOD:About")</span>

<!-- -->

- <span id="footer-copyrightico">[<img src="http://www.gnu.org/graphics/gfdl-logo-small.png" width="88"
  height="31" alt="a GNU Free Documentation License" />](http://www.gnu.org/licenses/fdl-1.3.html)</span>
- <span id="footer-poweredbyico">[<img
  src="../../mediawiki/skins/common/images/poweredby_mediawiki_88x31.png"
  width="88" height="31" alt="Powered by MediaWiki" />](http://www.mediawiki.org/)
  [<img
  src="../../mediawiki/extensions/SemanticMediaWiki/resources/images/smw_button.png"
  width="88" height="31" alt="Powered by Semantic MediaWiki" />](https://www.semantic-mediawiki.org/wiki/Semantic_MediaWiki)</span>

<div style="clear:both">

</div>

</div>

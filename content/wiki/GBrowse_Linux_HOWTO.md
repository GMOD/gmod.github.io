---
title: "GBrowse Install HOWTO"
---
# GBrowse Install HOWTO format files you need. A
few notable sites are:

WormBase (C. elegans and related nematodes)
<a href="/wiki/ftp://ftp.wormbase.org/pub/wormbase/species/c_elegans/gff/c_elegans.current.annotations.gff2.gz"
class="external free"
rel="nofollow">ftp://ftp.wormbase.org/pub/wormbase/species/c_elegans/gff/c_elegans.current.annotations.gff2.gz</a>

SGD (S. cerevisiae)
<a href="/wiki/ftp://genome-ftp.stanford.edu/pub/yeast/chromosomal_feature/"
class="external free"
rel="nofollow">ftp://genome-ftp.stanford.edu/pub/yeast/chromosomal_feature/</a>

FlyBase (D. melanogaster)
<a href="/wiki/ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/gff/"
class="external free"
rel="nofollow">ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/gff/</a>

*Other MODs - please feel free to add your download URLs here*

In addition, the `bin/` subdirectory of the GBrowse distribution
contains a series of scripts to convert annotation files in various
formats into GFF3 (or [GFF2](/wiki/GFF2)) format. For example, the
`ucsc_genes2gff.pl` script will convert gene models in Table Browser
format files from
<a href="http://www.genome.ucsc.edu" class="external free"
rel="nofollow">http://www.genome.ucsc.edu</a> into [GFF3](/wiki/GFF3)
format. `load_genbank.pl` will download and load sequence annotation
files in GenBank format from NCBI. The sample configuration file
`08.genbank.conf` (located in `contrib/conf_files`) is appropriate for
data loaded with `load_genbank.pl`.

# Loading DNA

To display the DNA sequence and to run sequence-dependent glyphs such as
the three-frame translation, you will need to load the DNA as well as
the annotations. The DNA must be formatted as a series of one or more
FASTA-format files in which each entry in the file corresponds to a
top-level sequence such as a chromosome pseudomolecule. You can then run
the bp_load_gff.pl or bp_bulk_load_gff.pl script using the -fasta
argument. For example, if the yeast genome is contained in a FASTA file
named yeast.fa, you would run the command:

         bp_bulk_load_gff.pl -d yeast -fasta yeast.fa sample/yeast_data.gff

Alternatively, you may put several FASTA files into a directory, and
provide the directory name as the argument to -fasta. (The yeast DNA is
too large to be included in this distribution, but you can get a copy of
it from
<a href="/wiki/ftp://genome-ftp.stanford.edu/pub/yeast/" class="external free"
rel="nofollow">ftp://genome-ftp.stanford.edu/pub/yeast/</a>)

Run `bp_bulk_load_gff.pl -h` to see usage instructions.

[GFF3](/wiki/GFF3) allow you to include FASTA sequence at the bottom of
the file, following the sequence annotations. If you are loading one of
these GFF files, the DNA will be recognized automatically and loaded by
any of the loaders.

# Creating your own Genome Database

See the <a href="/wiki/GBrowse_Configuration_HOWTO" class="mw-redirect"
title="GBrowse Configuration HOWTO">GBrowse Configuration HOWTO</a> for
information on how to create new databases from scratch, add new browser
tracks, and how to get the browser to dump the DNA from the region
currently under display.

# Making the Browser Run Faster

Three factors are major contributors to the length of time it takes to
load a gbrowse page:

1.  Loading the Perl interpreter and parsing BioPerl and all the other
    Perl libraries that gbrowse uses.
2.  Query speed on the database
3.  The conversion at the Perl layer of database data into BioPerl
    objects for rendering.

To improve (1), I recommend that you install the mod_perl module for
Apache.(<a href="http://perl.apache.org" class="external free"
rel="nofollow">http://perl.apache.org</a>). By configuring an
Apache::Registry directory and placing gbrowse inside it (rather than in
the default cgi-bin directory). The overhead for loading Perl and its
libraries are eliminated, thereby increasing the performance of the
script noticeably.

*Be aware that there is a bad interaction between the Apache::DBI module
(often used to speed up database accesses) and Bio::DB::GFF. This will
cause the GFF dumper plugin to fail intermittently. GBrowse does not
need Apache::DBI to achieve performance increases under mod_perl and it
is suggested that you disable Apache::DBI. If you cannot do this, then
you should remove the file GFFDumper.pm from the gbrowse.conf/plugins
directory.*

Database query performance (2) is also a major factor. If you are using
MySQL as the backend, you will see dramatic performance increases by
increasing the amount of memory available to the key buffer, sort
buffer, table cache and other in-memory data structures. I suggest that
you replace the default MySQL configuration file (usually stored in
/etc/my.cnf) with one of the large-memory sample configuration files
provided in the support-files subdirectory of the MySQL distribution. Of
course, if you tell MySQL to use more memory than you have, then
performance will degrade again.

Finally, there is a slowdown when gbrowse converts the results of
database SQL queries into renderable biological objects. This becomes
particularly noticeable when there are lots of multi-segment objects to
be displayed. You can work around this slowdown by using semantic
zooming (see CONFIGURE_HOWTO). Otherwise, there's not much that can be
done about this short of buying a faster machine. The GMOD team is
working hard to reduce this performance hit.

# Making the Server Run Safer

Whenever you are running a server-side Web script using information
provided by a web client, there is a risk that maliciously-formatted
data provided by the use will trick the server-side script into
performing some unintentional action, such as modifying a file on the
server. Perl's "taint" checks are designed to catch places in the code
where such malicious data could cause harm, and GBrowse has been tested
extensively with these taint checks activated.

Because of taint checks' noticeable impact on performance, they have
been turned off in the distributed version of gbrowse. If you wish to
reactivate the extra checking (at the expense of a performance hit), go
to the file "gbrowse" located in the Web scripts directory and edit the
top line of the file to read:

         #!/usr/bin/perl -w -T

The -T switch turns on taint checks.

If you are running GBrowse under mod_perl, add the following line to the
httpd.conf configuration file:

         PerlTaintCheck  On

This will affect all mod_perl scripts globally.

# The gbrowse_img Script

The gbrowse_img CGI script is a stripped-down version of gbrowse which
just generates images. It is suitable for incorporating into \<img\>
tags in order to make a thumbnail of a region of interest. The thumbnail
can then be linked to the full-featured gbrowse. Here is an example of
how this works using the WormBase site:

      http://www.wormbase.org/db/seq/gbrowse_img/wormbase?name=mec-3;width=200

This will generate a 200-pixel inline image of the region.

You can also use gbrowse_img to superimpose temporary features (like
BLAST hits) on the existing genome features.

If the script is called without CGI arguments, it will generate usage
instructions. Select
<a href="http://your.host/cgi-bin/gbrowse_img" class="external free"
rel="nofollow">http://your.host/cgi-bin/gbrowse_img</a> to see this
internal documentation.

# Plugins

Gbrowse has a plugin architecture which makes it easy for third-party
developers to expand its functionality. The plugins are Perl .pm files
located in the directory gbrowse.conf/plugins/. To install plugins,
simply copy them into this directory. To uninstall, remove them.

If you wish to install your own or third party plugins, it is suggested
that you create a separate directory outside the gbrowse.conf/ hierarchy
in which to store them and then to indicate the location of these
plugins using the plugin_path setting:

         plugin_path = /usr/local/gbrowse_plugins

This setting should be somewhere in the \[GENERAL\] section of the
relevant gbrowse configuration file.

# The Genbank/EMBL Proxy

Sample configuration number 5 ("05.embl.conf") corresponds to a
pass-through proxy for Genbank. At least in theory, if you enter a
landmark that isn't recognized, gbrowse will go to EMBL using the
bioperl BioFetch facility, parse the record, and enter it into the local
database. This allows you to browse arbitrary Genbank/EMBL/Refseq
entries.

This functionality is not well supported, nor widely used, but here is a
recipe for giving it a try:

1.  Create a local database named "embl" and initialize it this way:
2.  Set up permissions for this database so that "nobody@localhost" has
    SELECT, INSERT, UPDATE and DELETE privileges
3.  Initialize the database for use with this command:
     % bp_load_gff.pl -c -d embl

4.  If you need to use a proxy to access remote web sites, uncomment the
    -proxy line in the conf file, and adjust the URL of the proxy as
    appropriate.
5.  Go to
    <a href="http://localhost/cgi-bin/gbrowse/embl" class="external free"
    rel="nofollow">http://localhost/cgi-bin/gbrowse/embl</a>. Search for
    a Genbank or embl accession number, such as CEF58D5

# Removing Out-of-Date Image Files

As GBrowse runs, it creates temporary image files in the gbrowse tmp
directory (typically *HTDOCS*/gbrowse/tmp). These image files are
relatively small, but if you run GBrowse for a long time they may begin
consuming significant amounts of disk space. The following Unix shell
commands will remove old image files:

         cd HTDOCS/gbrowse/tmp
         find . -type f -atime +20 -print -exec rm {} \;

*Be sure to replace HTDOCS with the path to your web server HTML
document root directory.*

You might want to run this command under cron, but be sure that the user
that the cron job runs under has the proper permissions. You may need to
install it in root's cron script.

# Bug Reports and Support Requests

Please report bugs to the
<a href="http://sourceforge.net/tracker/?group_id=27707&amp;atid=391291"
class="external text" rel="nofollow">GMOD project bug tracking
system</a>. Email support is available by sending requests for help to
<a href="mailto:gmod-gbrowse@lists.sourceforge.net"
class="external text"
rel="nofollow">gmod-gbrowse@lists.sourceforge.net</a>.

Have fun!

Lincoln Stein & the GMOD team

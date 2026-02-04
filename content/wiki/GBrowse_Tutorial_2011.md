---
title: "GBrowse Tutorial 2011"
---
# GBrowse Tutorial 2011

 Prerequisites](#Prerequisites)
- [Install
 GBrowse](#Install_GBrowse)
- [Tutorial](#Tutorial)
- [Basic Chado
 Configuration (if we have
 time)](#Basic_Chado_Configuration_.28if_we_have_time.29)
 - [DB
 connection info](#DB_connection_info)
 - [Add a BAM
 data source](#Add_a_BAM_data_source)
 - [Add track
 defaults](#Add_track_defaults)
 - [Add some
 tracks](#Add_some_tracks)
 - [Add our
 new database to the
 GBrowse.conf](#Add_our_new_database_to_the_GBrowse.conf)
 - [Updating
 SAMtools](#Updating_SAMtools)
 - [Add
 semantic zooming for the BAM
 tracks](#Add_semantic_zooming_for_the_BAM_tracks)
 - [Add "show
 summary"
 functionality](#Add_.22show_summary.22_functionality)
 - [Enabling
 full text searching](#Enabling_full_text_searching)

# Prerequisites

Installed before using apt or cpan.

# Install GBrowse

Easily installed via the cpan shell:

 sudo cpan
 cpan> install Bio::Graphics::Browser2

Which gets all of the prereqs that aren't installed on the machine.

# Tutorial

Go to <a href="http://localhost/gbrowse2" class="external free"

# Basic <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> Configuration (if we have time)

<a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a> was
installed when we created the image. Sample configuration files are
available with GBrowse, and we'll get the sample Chado file:

 wget http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/contrib/conf_files/07.chado.conf -O pythium.conf

Some simple tweaks and additions:

- Change description
- Get rid of `database = main`
- Remove or change examples (yeast examples don't help anybody)
- Add initial landmark (`initial landmark = scf1117875582023`)

## DB connection info

 [annotation:database]
 db_adaptor = Bio::DB::Das::Chado
 db_args = -dsn dbi:Pg:dbname=chado
 -user gmod
 -inferCDS 1
 -srcfeatureslice 1
 search options = default

## Add a BAM data source

 [bam_sample:database]
 db_adaptor = Bio::DB::Sam
 db_args = -fasta /var/www/gbrowse2/databases/pythium/scf1117875582023.fasta
 -bam /var/www/gbrowse2/databases/pythium/simulated-sorted.bam
 search options = default

## Add track defaults

 [TRACK DEFAULTS]
 glyph = generic
 database = annotation
 height = 8
 bgcolor = cyan
 fgcolor = black
 label density = 25
 bump density = 100

Note particularly the "database" entry--for most tracks we'll be using
the annotation database, but the bam_sample data source will be
available when we want it.

## Add some tracks

 [Genes]
 feature = gene
 glyph = gene
 ignore_sub_part = polypeptide
 #bgcolor = yellow
 forwardcolor = yellow
 reversecolor = turquoise
 label = sub { my $f = shift;
 my $name = $f->display_name;
 my @aliases = sort $f->attributes('Alias');
 $name .= " (@aliases)" if @aliases;
 $name;
 }
 height = 6
 description = 0
 key = Named gene

 [CDS]
 feature = mRNA
 glyph = cds
 description = 0
 ignore_sub_part = polypeptide exon
 height = 26
 sixframe = 1
 label = sub {shift->name . " reading frame"}
 key = CDS
 citation = This track shows CDS reading frames.

 [repeats]
 feature = match:repeatmasker
 glyph = generic
 bgcolor = black
 key = Repeats

 [ests]
 feature = expressed_sequence_match
 glyph = segments
 stranded = 1
 bgcolor = green
 key = EST matches

 [proteins]
 feature = protein_match
 glyph = segments
 stranded = 1
 bgcolor = pink
 fgcolor = red
 key = protein matches

 [CoverageXyplot]
 feature = coverage
 glyph = wiggle_xyplot
 database = bam_sample
 height = 50
 fgcolor = black
 bicolor_pivot = 20
 pos_color = blue
 neg_color = red
 key = Coverage (xyplot)

 [Reads]
 feature = match
 glyph = segments
 draw_target = 1
 show_mismatch = 1
 mismatch_color = red
 database = bam_sample
 bgcolor = blue
 fgcolor = white
 height = 5
 label density = 50
 bump = fast
 key = Reads

 [Pair]
 feature = read_pair
 glyph = segments
 database = bam_sample
 draw_target = 1
 show_mismatch = 1
 bgcolor = sub {
 my $f = shift;
 return $f->attributes('M_UNMAPPED') ? 'red' : 'green';
 }
 fgcolor = green
 height = 3
 label = sub {shift->display_name}
 label density = 50
 bump = fast
 connector = dashed
 balloon hover = sub {
 my $f = shift;
 return unless $f->type eq 'match';
 return 'Read: '.$f->display_name.' : '.$f->flag_str;
 }
 key = Read Pairs

## Add our new database to the GBrowse.conf

To let GBrowse know that there is a new database available, we have to
add a few lines to GBrowse.conf. Add this to the bottom:

 [pythium]
 description = Pythium ultimum
 path = pythium.conf

### Updating SAMtools

The version of SAMtools may need to be updated. Get the samtools
release:

 cd ~/Documents/Software
 wget -O samtools-0.1.13.tar.bz2 http://sourceforge.net/projects/samtools/files/samtools/0.1.13/samtools-0.1.13.tar.bz2/download
 tar jxvf samtools-0.1.13.tar.bz2
 cd samtools-0.1.13
 make

Install Bio::DB::Sam:

 sudo cpan
 cpan> install Bio::DB::Sam

when asked "Please enter the location of the bam.h and compiled libbam.a
files:", answer:

 /home/gmod/Documents/Software/samtools-0.1.13

## Add semantic zooming for the BAM tracks

Not doing this for very dense data (like BAM) is probably the number one
performance killers for GBrowse; asking GBrowse to draw a track that has
thousands of glyphs is time consuming (and ultimately, probably not very
informative).

 [Reads:5001]
 feature = coverage
 glyph = wiggle_density
 height = 15

 [Pair:5001]
 feature = coverage
 glyph = wiggle_density
 height = 15
 bgcolor = purple

## Add "show summary" functionality

For other tracks, when zoomed way out (100kb or 1MB), performance can
similarly suffer, with a decreasing "information" content. Newer
versions of GBrowse provide the ability to automatically generate
density plots when zoomed out. This functionality is available from
Chado and
<a href="http://search.cpan.org/perldoc?Bio::DB::SeqFeature::Store"
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a> data
adaptors. To prepare our Chado database to do this semantic zooming, we
need to run a script that comes with Bio::DB::Das::Chado:

 cd ~/Documents/Software/gbrowse-adaptors/Chado
 svn update
 perl bin/gmod_create_summary_statistics.pl

and then add to the pythium.conf file, somewhere near the top (ie, not
in the track definitions):

 show summary = 99999

## Enabling full text searching

If we try searching for "`gene 7.92`", we'll get "Not Found" as a
result, even though genemark-scf1117875582023-abinit-gene-7.92 does
exist. To look for partial strings, we need to enable full text
searching. To do so, we need to run another script that comes with
Bio::DB::Das::Chado:

 perl /home/gmod/Documents/Software/gbrowse-adaptors/Chado/bin/gmod_chado_fts_prep.pl

This does several things (including poorly estimating how long it will
take to finish), including creating materialized views, using a tool
provided by .
In practice, it would be a good idea to read the documentation of
`gmod_materialized_view_tool.pl` for information on keeping the view up
to date.

We also have to tell GBrowse that this Chado database can now do full
text searching, by adding this to the Chado database stanza:

 -fulltext 1

Now we can search for "`gene 7.92`" and we'll find our gene (plus its
mRNA and exons) and we can click on the gene to see it in GBrowse.

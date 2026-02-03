---
title: "GBrowse Tutorial 2012"
---
# GBrowse Tutorial 2012

This [GBrowse](/wiki/GBrowse.1) tutorial was taught at the [2012
GMOD Summer School](/wiki/2012_GMOD_Summer_School)
by [Scott Cain](/wiki/User%3AScott).

To follow along with the tutorial, you will need to use **AMI ID:
ami-5bab1c32, name: GMOD 2012 day 4 start**, available in the US East
(N. Virginia) region. See the [GMOD Cloud
Tutorial](/wiki/GMOD_Cloud_Tutorial) for information on
how to get this AMI.

  Prerequisites](#Prerequisites)
- [Install
  GBrowse](#Install_GBrowse)
- [Tutorial](#Tutorial)
- [Basic Chado
  Configuration (if we have
  time)](#Basic_Chado_Configuration_.28if_we_have_time.29)
  - [(Re)loading GFF
    data](#.28Re.29loading_GFF_data)
  - [Add a BAM
    data source](#Add_a_BAM_data_source)
  - [Add track
    defaults](#Add_track_defaults)
  - [Add some
    tracks](#Add_some_tracks)
  - [Add our
    new database to the
    GBrowse.conf](#Add_our_new_database_to_the_GBrowse.conf)
  - [Add
    semantic zooming for the BAM
    tracks](#Add_semantic_zooming_for_the_BAM_tracks)
  - [Add "show
    summary"
    functionality](#Add_.22show_summary.22_functionality)
  - [Enabling
    full text searching](#Enabling_full_text_searching)

## Prerequisites

Installed before using apt or cpan.

## Install GBrowse

Easily installed via the cpan shell:\*

     sudo cpan
     cpan> install Bio::Graphics::Browser2

Which gets all of the prereqs that aren't installed on the machine.

\*Small caveat: the 2.49 release has a small bug that makes installing
it slightly tricky; this will be fixed in the upcoming 2.50 release. For
more information about the bug, you can see the <a
href="http://gmod.827538.n3.nabble.com/Problem-updating-from-Gbrowse2-17-Can-t-locate-Bio-DB-SeqFeature-Store-Alias-pm-td3945804.html"
class="external text" rel="nofollow">mailing list archive</a>.

## Tutorial

Go to http://ec2-##-##-##-##.compute-1.amazonaws.com/gbrowse2

## Basic <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> Configuration (if we have time)

<a href="http://search.cpan.org/perldoc?Bio::DB::Das::Chado"
class="external text" rel="nofollow">Bio::DB::Das::Chado</a> was
installed when we created the image. We'll start with the sample Chado
configuration that is in /etc/gbrowse:

     sudo cp 07.chado.conf pythium.conf

Some simple tweaks and additions:

- Change description
- Remove or change examples (yeast examples don't help anybody)
- Add initial landmark (`initial landmark = scf1117875582023:1..10000`)
- Change the connection stuff to connect to drupal db

### (Re)loading GFF data

So as it turns out, there is an incompatibility between the
not-yet-released Tripal 1.0 GFF loader and the GBrowse Chado adaptor.
While I will work with Steven et al. to figure out where the problem is
(and I'm not pointing any fingers, since it could very well be my
fault). In addition, the Chado adaptor doesn't really care for the GFF
that MAKER is producing either, so we're going to munge it a little.
Make a perl script named `munge.pl` with this contents:

    #!/usr/bin/perl
    use strict;
    use warnings;
    while (<>) {
       if (/\tmatch(_part)?\t/) {
           s/Name=[^;]+?;//;
       }
       print;
    }

and run it like this:

     perl munge.pl scf1117875582023.gff > new.gff

And we'll load it into an existing Chado database like this:

     gmod_bulk_load_gff3.pl --org dicty --noexon --an -g new.gff --dbprof chado

Where:

     --org dicty    #yes, I know, but I didn't want to create a new org entry
     --noexon       #tells loader not to create exon feature from the CDS features because they're already there
     --an           #this is an analysis result (save the score)
     -g             #load this gff file
     --dbprof chado #use the database profile called chado (which is the name of the database)

After we do that, we have to change the db connection parameters to use
the database named chado:

    [main:database]
    db_adaptor    = Bio::DB::Das::Chado
    db_args       = -dsn dbi:Pg:dbname=chado
                   -user ubuntu
                   -srcfeatureslice 1
             #      -fulltext 1
                   -organism dicty

### Add a BAM data source

    [bam_sample:database]
    db_adaptor     = Bio::DB::Sam
    db_args        = -fasta /var/lib/gbrowse2/databases/pythium/scf1117875582023.fasta
                     -bam   /var/lib/gbrowse2/databases/pythium/simulated-sorted.bam
    search options = default

### Add track defaults

    [TRACK DEFAULTS]
    glyph       = generic
    database    = main
    height      = 8
    bgcolor     = cyan
    fgcolor     = black
    label density = 25
    bump density  = 100

Note particularly the "database" entry--for most tracks we'll be using
the main (ie, chado) database, but the bam_sample data source will be
available when we want it.

### Add some tracks

    [Genes]
    feature      = gene
    glyph        = gene
    ignore_sub_part = polypeptide
    #bgcolor      = yellow
    forwardcolor = yellow
    reversecolor = turquoise
    label        = sub { my $f = shift;
                        my $name = $f->display_name;
                        my @aliases = sort $f->attributes('Alias');
                        $name .= " (@aliases)" if @aliases;
                        $name;
      }
    height       = 6
    description  = 0
    key          = Named gene

    [CDS]
    feature      = mRNA
    glyph        = cds
    description  = 0
    ignore_sub_part = polypeptide exon
    height       = 26
    sixframe     = 1
    label        = sub {shift->name . " reading frame"}
    key          = CDS
    citation     = This track shows CDS reading frames.

    [repeats]
    feature      = match:repeatmasker
    glyph        = generic
    bgcolor      = black
    key          = Repeats

    [ests]
    feature      = expressed_sequence_match
    glyph        = segments
    stranded     = 1
    bgcolor      = green
    key          = EST matches

    [proteins]
    feature      = protein_match
    glyph        = segments
    stranded     = 1
    bgcolor      = pink
    fgcolor      = red
    key          = protein matches

    [CoverageXyplot]
    feature        = coverage
    glyph          = wiggle_xyplot
    database       = bam_sample
    height         = 50
    fgcolor        = black
    bicolor_pivot  = 20
    pos_color      = blue
    neg_color      = red
    key            = Coverage (xyplot)

    [Reads]
    feature        = match
    glyph          = segments
    draw_target    = 1
    show_mismatch  = 1
    mismatch_color = red
    database       = bam_sample
    bgcolor        = blue
    fgcolor        = white
    height         = 5
    label density  = 50
    bump           = fast
    key            = Reads

    [Pair]
    feature       = read_pair
    glyph         = segments
    database      = bam_sample
    draw_target   = 1
    show_mismatch = 1
    bgcolor       = sub {
                    my $f = shift;
                    return $f->attributes('M_UNMAPPED') ? 'red' : 'green';
                    }
    fgcolor       = green
    height        = 3
    label         = sub {shift->display_name}
    label density = 50
    bump          = fast
    connector     = dashed
    balloon hover = sub {
                    my $f     = shift;
                    return '' unless $f->type eq 'match';
                    return 'Read: '.$f->display_name.' : '.$f->flag_str;
                    }
    key           = Read Pairs

### Add our new database to the GBrowse.conf

To let GBrowse know that there is a new database available, we have to
add a few lines to GBrowse.conf. Add this to the bottom:

    [pythium]
    description   = Pythium ultimum
    path          = pythium.conf

### Add semantic zooming for the BAM tracks

Not doing this for very dense data (like BAM) is probably the number one
performance killers for GBrowse; asking GBrowse to draw a track that has
thousands of glyphs is time consuming (and ultimately, probably not very
informative).

    [Reads:5001]
    feature        = coverage
    glyph          = wiggle_density
    height         = 15

    [Pair:5001]
    feature        = coverage
    glyph          = wiggle_density
    height         = 15
    bgcolor        = purple

### Add "show summary" functionality

For other tracks, when zoomed way out (100kb or 1MB), performance can
similarly suffer, with a decreasing "information" content. Newer
versions of GBrowse provide the ability to automatically generate
density plots when zoomed out. This functionality is available from
Chado and
<a href="http://search.cpan.org/perldoc?Bio::DB::SeqFeature::Store"
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a> data
adaptors. To prepare our Chado database to do this semantic zooming, we
need to run a script that comes with Bio::DB::Das::Chado:

     cd ~/GBrowse-Adaptors/Chado
     git pull
     perl bin/gmod_create_summary_statistics.pl --dbprof chado

and then add to the pythium.conf file, somewhere near the top (i.e., not
in the track definitions):

     show summary = 99999

### Enabling full text searching

If we try searching for "`gene 0.27`", we'll get "Not Found" as a
result, even though maker-scf1117875582023-snap-gene-0.27 does exist. To
look for partial strings, we need to enable full text searching. To do
so, we need to run another script that comes with Bio::DB::Das::Chado:

     perl bin/gmod_chado_fts_prep.pl --dbprof chado

This does several things (including poorly estimating how long it will
take to finish), including creating materialized views, using a tool
provided by [SOL Genomics Network (SGN)](/wiki/Category%3ASGN).
In practice, it would be a good idea to read the documentation of
`gmod_materialized_view_tool.pl` for information on keeping the view up
to date.

We also have to tell GBrowse that this Chado database can now do full
text searching, by adding this to the Chado database stanza:

     -fulltext 1

Now we can search for "`gene 0.27`" and we'll find our gene (plus its
mRNA and exons) and we can click on the gene to see it in GBrowse.

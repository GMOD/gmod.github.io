---
title: "GBrowse FAQ"
---
# GBrowse FAQ


  FAQ</span>](#About_this_FAQ)
  - [What is
    this FAQ?](#What_is_this_FAQ.3F)
  - [How is it
    maintained?](#How_is_it_maintained.3F)
- [General
  Questions](#General_Questions)
  - [What is
    GBrowse good for?](#What_is_GBrowse_good_for.3F)
  - [What
    platforms does GBrowse run
    on?](#What_platforms_does_GBrowse_run_on.3F)
  - [How is
    GBrowse distributed?](#How_is_GBrowse_distributed.3F)
  - [What are
    the terms of use for
    GBrowse?](#What_are_the_terms_of_use_for_GBrowse.3F)
  - [I have a
    problem. What do I do?](#I_have_a_problem._What_do_I_do.3F)
- [Problem-solving](#Problem-solving)
  - [Where do I
    download GBrowse?](#Where_do_I_download_GBrowse.3F)
  - [How do I
    install GBrowse?](#How_do_I_install_GBrowse.3F)
  - [Where do I
    find a list of all available
    glyphs?](#Where_do_I_find_a_list_of_all_available_glyphs.3F)
  - [When I
    search, why doesn't GBrowse find my 3-letter gene
    name?](#When_I_search.2C_why_doesn.27t_GBrowse_find_my_3-letter_gene_name.3F)
  - [How do I
    use semantic zooming to hide a track
    completely?](#How_do_I_use_semantic_zooming_to_hide_a_track_completely.3F)
  - [How to add
    an outgoing link to a text on the feature detail page in
    Gbrowse?](#How_to_add_an_outgoing_link_to_a_text_on_the_feature_detail_page_in_Gbrowse.3F)
  - [I have a
    multi-segmented feature (such as a multi-exon transcript). It looks
    fine at low power, but when I zoom in the connecting lines between
    segments disappear.
    Help!](#I_have_a_multi-segmented_feature_.28such_as_a_multi-exon_transcript.29._It_looks_fine_at_low_power.2C_but_when_I_zoom_in_the_connecting_lines_between_segments_disappear._Help.21)
  - [I'm using
    the GFF database adaptor. Is it better to load it using GFF2 or
    GFF3?](#I.27m_using_the_GFF_database_adaptor._Is_it_better_to_load_it_using_GFF2_or_GFF3.3F)
  - [How do I
    pass parameters into functions of
    init_code?](#How_do_I_pass_parameters_into_functions_of_init_code.3F)
  - [How do I
    show circular genomes?](#How_do_I_show_circular_genomes.3F)
  - [There's a
    problem with my overview and detail images - they're the same
    scale](#There.27s_a_problem_with_my_overview_and_detail_images_-_they.27re_the_same_scale)
  - [Can I add
    Popup Balloon Tips to
    GBrowse?](#Can_I_add_Popup_Balloon_Tips_to_GBrowse.3F)
  - [Why is
    GBrowse on Chado so
    slow?](#Why_is_GBrowse_on_Chado_so_slow.3F)
  - [The
    "Bio::Graphics::BrowserConfig=HASH ... Bio/Graphics/Browser.pm line
    587"
    Error](#The_.22Bio::Graphics::BrowserConfig.3DHASH_..._Bio.2FGraphics.2FBrowser.pm_line_587.22_Error)
  - [Can I
    show more than one glyph in the same
    track?](#Can_I_show_more_than_one_glyph_in_the_same_track.3F)
  - [How many
    tracks can be displayed in
    GBrowse?](#How_many_tracks_can_be_displayed_in_GBrowse.3F)


## About this FAQ

### What is this FAQ?

It is the list of Frequently Asked Questions about
[GBrowse](GBrowse.1 "GBrowse").

### How is it maintained?

It is now maintained as a
<a href="http://en.wikipedia.org/wiki/Wiki" class="extiw"
title="wp:Wiki">Wiki</a> on this site. You can help maintain it by
adding questions and answers.

  

## General Questions

### What is GBrowse good for?

GBrowse was designed to view genomes. It displays a graphical
representation of a section of a genome, and shows the positions of
genes and other functional elements. It can be configured to show both
qualitative data such as the splicing structure of a gene, and
quantitative data such as microarray expression levels.

Another good way to get an overview of the features GBrowse offers is to
read the documentation at the [GBrowse](GBrowse.1 "GBrowse") Wiki page.

  

### What platforms does GBrowse run on?

GBrowse is a web-server application that is implemented in the Perl
programming language. It will run on any machine that runs Perl,
including Windows, Macintosh OS X, and most versions of Linux and UNIX.

  

### How is GBrowse distributed?

GBrowse is distributed as source code for Macintosh OS X, UNIX and Linux
platforms, and as pre-packaged binaries for Windows machines.

  

### What are the terms of use for GBrowse?

GBrowse is distributed under the Perl Artistic License, which allows for
unrestricted use and distribution, including commercial use and resale.
You may modify and distribute modified versions of GBrowse provided that
you credit the original authors for their contribution.

  

### I have a problem. What do I do?

First consult the
<a href="http://old.nabble.com/gmod-gbrowse-f3500.html"
class="external text" rel="nofollow">GBrowse mailing list archive at
Nabble</a>. Your problem may already have been reported and discussed.
If you find no help there, then send email to
gmod-gbrowse@lists.sourceforge.net. If you are pretty certain you have
found a bug, please report it to the <a
href="http://sourceforge.net/tracker/?func=add&amp;group_id=27707&amp;atid=391291"
class="external text" rel="nofollow">bug report tracking system</a> (set
the category to "GBrowse").

## Problem-solving

### Where do I download GBrowse?

From
<a href="http://sourceforge.net/project/showfiles.php?group_id=27707"
class="external text" rel="nofollow">SourceForge</a>. If you want to
live on the bleeding edge, you may try the development version of
GBrowse. Instructions for accessing the development version of GBrowse
can be found at <a href="Subversion" class="mw-redirect"
title="Subversion">Subversion</a>.

### How do I install GBrowse?

After you unpack GBrowse, detailed installation instructions will be
found in the top level directory, in the file INSTALL.

### Where do I find a list of all available glyphs?

There is a list of glyphs at the end of the documentation for
<a href="http://search.cpan.org/perldoc?Bio::Graphics::Glyph"
class="external text" rel="nofollow">Bio::Graphics::Glyph</a> which you
can also see by executing

     perldoc Bio::Graphics::Glyph

from the command line.

### When I search, why doesn't GBrowse find my 3-letter gene name?

If you are using the [MySQL](MySQL "MySQL") [GFF](GFF "GFF")
[adaptor](GBrowse_Adaptors "GBrowse Adaptors") and are storing gene
names inside Note attributes, then you may bump up against MySQL's
default four-letter limit on full text searches. To fix this, either:

- Put the gene name in an Alias attribute, e.g. "Alias LEP"

or

- Change MySQL to allow searches on 3-character words.

The latter solution is a multi-step process:

- Open /etc/my.cnf and add the following configuration line to the
  \[mysqld\] section:
        ft_min_word_len=3

- Restart the mysql server.
- Connect to your database using the mysql command-line client and run
  the command:
       mysql> repair table fattribute_to_feature quick;

### How do I use semantic zooming to hide a track completely?

If you wish to turn off a track entirely, you can use the "hide" flag to
hide the track when the display exceeds a certain size:

                [6_frame_translation:50000]
                hide = 1

  

### How to add an outgoing link to a text on the feature detail page in Gbrowse?

Add a line to the appropriate \*.conf file using *link*. For example:


``` de1
 link = http://www.ncbi.nih.gov/SNP/snp_ref.cgi?rs=$name
```


  

### I have a multi-segmented feature (such as a multi-exon transcript). It looks fine at low power, but when I zoom in the connecting lines between segments disappear. Help!

You need to structure the feature in such a way that it has a single
parent part that spans the whole feature from end to end. When using
[GFF3](GFF3 "GFF3") and a Bio::DB::SeqFeature::Store database (see
[GBrowse Adaptors](GBrowse_Adaptors "GBrowse Adaptors")), that is all
you have to do. For example, using "match" as the feature in track
configuration of the
<a href="GBrowse_Configuration_HOWTO" class="mw-redirect"
title="GBrowse Configuration HOWTO">GBrowse configuration file</a> and
GFF3 like this would work:

                Chr1 . match         1  1000 . . . ID=Hit27
                Chr1 . match_part    1   200 . . . Parent=Hit27
                Chr1 . match_part  500   600 . . . Parent=Hit27
                Chr1 . match_part  900  1000 . . . Parent=Hit27

In [GFF2](GFF2 "GFF2") format, you will need to use an aggregator, in
this case, the "match" aggregator. Example GFF2 will look like this:

                Chr1 . match    1  1000 . . . Hit Hit27
                Chr1 . HSP      1   200 . . . Hit Hit27
                Chr1 . HSP    500   600 . . . Hit Hit27
                Chr1 . HSP    900  1000 . . . Hit Hit27

And you will use "match" (the name of the aggregator, not the name of
the parent feature) as the feature in the track configuration in the
<a href="GBrowse_Configuration_HOWTO" class="mw-redirect"
title="GBrowse Configuration HOWTO">GBrowse config file</a>.

For transcripts, use the "processed_transcript" aggregator and create
features with a main part of "mRNA" and subparts of "CDS", "exon",
and/or various types of UTRs.

### I'm using the GFF database adaptor. Is it better to load it using GFF2 or GFF3?

[GFF3](GFF3 "GFF3").

[GFF2](GFF2 "GFF2"), described in the <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/branches/stable/docs/tutorial/dbgff/tutorial.html?content-type=text%2Fhtml"
class="external text" rel="nofollow">Using GBrowse with Bio::DB::GFF</a>
tutorial, is the older version of the [GFF](GFF "GFF") feature
annotation format. Its main limitation is that it cannot represent
features that have more than one level of nested subparts. For example,
you cannot represent the relationship between a gene, two alternatively
spliced transcripts, and the exons inside the transcripts.
[GFF3](GFF3 "GFF3") corrects this problem as well as a number of other
deficiencies.

### How do I pass parameters into functions of init_code?

You want to define a function in the init_code section which will then
be called within callbacks.

The answer is to do something like this:

               [GENERAL]
               init_code = sub round {
                               my $a = shift;
                               return int($a + 0.5);
                           }

               [TRACKS]
               label    = sub {
                         my $feature = shift;
                         my $score   = $feature->score;
                         return "score = ",round($score);
                         }

Note that you'll need GBrowse version 1.63 or higher for this to work.

  

### How do I show circular genomes?

A patch is currently being developed to display circular genomes. You
can **git clone** the branch code at
<a href="https://github.com/GMOD/GBrowse/tree/nliles_gbrowse_circular"
class="external free"
rel="nofollow">https://github.com/GMOD/GBrowse/tree/nliles_gbrowse_circular</a>.
The patch will display basic glyphs, but has problems showing sequences.
To implement the patch, you must add the tag **region=circular;** to
column 9 of the first line of the gff file.

### There's a problem with my overview and detail images - they're the same scale

That usually is a problem with your reference sequences. Either you
haven't set you reference class correctly in your config file (if you
are using [GFF3](GFF3 "GFF3"), it should probably be set to 'Sequence'),
or you don't have reference sequences in your [GFF](GFF "GFF")
file/database. That is, you don't have the lines in your GFF file that
correspond to the chromosomes.

### Can I add Popup Balloon Tips to GBrowse?

Yes! As of version 1.69, you can populate popup balloons similar to the
ones used by Google Maps. The balloons can contain arbitrary HTML
(including images) and can be set to appear when the user hovers over a
feature or left clicks on it. See [GBrowse
Configuration/Balloons](GBrowse_Configuration/Balloons "GBrowse Configuration/Balloons")
for details.

### Why is GBrowse on Chado so slow?

While it is convenient to run GBrowse on top of a Chado database that is
being actively edited (so that users can see "live" edits), the Chado
adaptor for GBrowse is fairly slow. This is because Chado is not
designed as a database to drive an interactive display like GBrowse.
Other adaptors like
<a href="http://bioperl.org/wiki/Module:Bio::DB::GFF"
class="external text" rel="nofollow">Bio::DB::GFF</a> and
<a href="http://bioperl.org/wiki/Module:Bio::DB::SeqFeature::Store"
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a> run
on highly denormalized but fast to query databases. Chado on the other
hand is highly normalized, which is good for preventing data handling
errors, but bad in general for speed. There are some things that can be
done, like [materializing
views](Materialized_views "Materialized views") to speed some of the
slower queries, but in practice most users find it easier to dump the
contents of their Chado database to GFF3 and and load it into a
<a href="http://bioperl.org/wiki/Module:Bio::DB::SeqFeature::Store"
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a>
database. [GMODTools](GMODTools "GMODTools") is a good tool for setting
up periodic dumps of your Chado database to GFF3.

### The "Bio::Graphics::BrowserConfig=HASH ... Bio/Graphics/Browser.pm line 587" Error

Users of GBrowse 1.69 will see this message in their Apache error logs:

    Bio::Graphics::BrowserConfig=HASH(0xnnnnnnn) at some_path/Bio/Graphics/Browser.pm line 587

This is a debugging statement that was accidentally left in the GBrowse
1.69 release. You can either ignore it (it does not affect anything), or
install the latest version of GBrowse from
<a href="Subversion" class="mw-redirect"
title="Subversion">Subversion</a>.

### Can I show more than one glyph in the same track?

Yes. To show multiple glyphs in the same track set the glyph with a Perl
*callback*. For example:

    [newtrack]
    feature = sRNA  sRNA_HL
    glyph    = sub {
                    my $f = shift;
                    my $type = $f->type->method;
                    if ($type eq 'sRNA') {
                         return 'xyplot';
                    }
                    else {
                         return 'processed_transcript';
                    }
                 }

Another example:

    glyph        = sub { my $strand = shift->strand; return $strand >=0 ? 'gene' : 'box' }

For a situation where a attribute wouldn't make sense, you could return
undef.

You can set the glyph based on any information that is available in
callbacks.

From email threads:

- <a
  href="http://gmod.827538.n3.nabble.com/more-than-one-glyph-in-same-track-tp951795p951795.html"
  class="external text" rel="nofollow">More than one glyph in the same
  track</a>, Alaguraj Veluchamy, July 2010.
- <a
  href="http://gmod.827538.n3.nabble.com/Turn-some-Wiggle-tracks-off-when-no-value-in-selected-region-td946842.html#a946982#a946982"
  class="external text" rel="nofollow">Callbacks on Glyphs</a>, Andreas
  Redl, July 2010.

### How many tracks can be displayed in GBrowse?

There is no set maximum number of tracks. As of about GBrowse 2.13,
GBrowse works with more than 1,000 tracks. From this <a
href="http://gmod.827538.n3.nabble.com/http://gmod.827538.n3.nabble.com/Turn-some-Wiggle-tracks-off-when-no-value-in-selected-region-tp946842p946842.html"
class="external text" rel="nofollow">email thread (Kai Xia, 2010/07</a>,
[Lincoln Stein](User%253ALstein "User%253ALstein") said:


I think you'll find that 20,000 track definitions are going to slow
GBrowse down to the point of unusability. I have made some fixes to
GBrowse2 that allow you to display \> 1000 tracks with reasonable
performance, but I've never tested in the 10,000 track range.

If you combine wiggle data into subtracks, then performance in GBrowse2
should be quite good. There is also an interface that lets you define
metadata for each subtrack and search, filter and sort on the basis of
this metadata (see [Creating and Managing Subtracks with
GBrowse2](Creating_and_Managing_Subtracks_with_GBrowse2 "Creating and Managing Subtracks with GBrowse2")).
I've also just now added an option that lets you hide subtracks that
have no data currently showing.

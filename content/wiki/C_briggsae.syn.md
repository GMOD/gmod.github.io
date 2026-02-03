---
title: "C briggsae.syn"
---
# C briggsae.syn

This is the species database for *C. briggsae*. This is one of the three
species currently represented in the instance of
[GBrowse_syn](GBrowse_syn.1 "GBrowse syn") that is installed at
[WormBase](Category%253AWormBase "Category%253AWormBase"). The species config
file con be a normal
<a href="GBrowse_Configuration_HOWTO" class="mw-redirect"
title="GBrowse Configuration HOWTO">GBrowse config file</a> or can a a
simplified version as shown here.

[return to GBrowse_syn](GBrowse_syn.1 "GBrowse syn")

    [GENERAL]
    description   = C. briggsae Database
    db_adaptor    = Bio::DB::GFF
    db_args       = -adaptor dbi::mysql
                    -dsn dbi:mysql:c_briggsae
                    -user nobody

    plugins = GFFDumper

    aggregators = gene{coding_exon}

    # Web site configuration info
    buttons     = images/buttons
    tmpimages   = tmp

    # max and default segment sizes for detailed view
    max segment     = 400000

    automatic classes = CDS Transcript

    [CG]
    label        = 1
    description  = 1
    feature      = gene
    category     = Genes
    glyph        = transcript2
    utr_color    = gray
    font2color   = blue
    height  = 6
    key          = Gene Models
    description = 1
    label = 1
    bgcolor = sub {
      my $flip = pop->panel->flip;
      my $strand = shift->strand;
      return $strand < 0 ? 'violet' : 'turquoise' if $flip;
      return $strand > 0 ? 'violet' : 'turquoise';
     }

    [CG:100001]
    label = 0
    description = 0

    [CG:150000]
    glyph   = generic
    feature = CDS

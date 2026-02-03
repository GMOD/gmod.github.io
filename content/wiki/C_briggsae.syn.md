---
title: "C briggsae.syn"
---




<span id="top"></span>




# <span dir="auto">C briggsae.syn</span>









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




[Category](Special%253ACategories "Special%253ACategories"):

- [GBrowse syn](Category%253AGBrowse_syn "Category%253AGBrowse syn")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/C_briggsae.syn" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 17:16 on 14 January
  2009.</span>
<!-- - <span id="footer-info-viewcount">26,052 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





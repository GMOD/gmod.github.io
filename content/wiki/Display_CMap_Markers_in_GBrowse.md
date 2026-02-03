---
title: "Display CMap Markers in GBrowse"
---




<span id="top"></span>




# <span dir="auto">Display CMap Markers in GBrowse</span>









This proposal came out of a presentation by Erick Antezana and Frederic
Potier at the [August 2009 GMOD
Meeting](August_2009_GMOD_Meeting "August 2009 GMOD Meeting") titled:

- [GBrowse: Lessons Learned and Statement of
  Interest](August_2009_GMOD_Meeting#GBrowse:_Lessons_Learned_and_Statement_of_Interest "August 2009 GMOD Meeting")

  
From Frederic and Erick:



We were thinking about having [CMap](CMap.1 "CMap") features displayed
in [GBrowse](GBrowse.1 "GBrowse") in one or more dedicated tracks. Using
now the fact that GBrowse can be connected to multiple datasources, the
GBrowse config file could be for example:


``` de1
#################################
# database definitions
#################################
# Database for genome annotations.
[GGB_TIGR_RICE_V5:database]
db_adaptor    = Bio::DB::GFF
db_args       = -adaptor  dbi::mysql
    -dsn dbi:mysql:GGB_TIGR_RICE_V5:localhost:3306
    -user ...
    -pass ...
 
# Database for NGS
[bamtest:database]
db_adaptor    = Bio::DB::Sam
db_args       = -fasta  sequence.fasta
                  -bam   bam_file.bam
 
# Database for genetic markers
[CMAP_TIGR_RICE_V5:database]
db_adaptor    = specific CMAP adaptor or maybe an already existing one  ???
db_args       = -adaptor  dbi::Oracle
    -dsn dbi:Oracle:CMAP_TIGR_RICE_V5:localhost:
    -user ...
    -pass ...
 
...
### TRACK CONFIGURATION ####
...
 
[Pair]
feature       = read_pair
glyph         = segments
database      = bamtest
draw_target   = 1
show_mismatch = 1
bgcolor      = sub {
                      my $f = shift;
                 return $f->get_tag_values('M_UNMAPPED') ? 'red' : 'green';
               }
fgcolor       = green
height        = 3
label         = sub {shift->display_name}
label density = 50
bump          = fast
connector     = dashed
key          = Read Pairs
 
[AFLP_RICE]
feature = aflp
database = CMAP_TIGR_RICE_V5
map_set = tigr_rice_v5
key = CMAP AFLP markers
category = Molecular Mapping
 
[SSR_RICE]
feature = aflp
database = CMAP_TIGR_RICE_V5
map_set = tigr_rice_v5
key = CMAP SSR markers.
category = Molecular Mapping
....
```


As you can see, both AFLP_RICE and SSR_Rice are pulled out from the CMap
database and displayed in dedicated tracks.

Then the idea is to manage the links to CMap via an url in the popup
ballon.

This configuration should be very convenient to integrate CMap/GBrowse
without requiring a lot a maintenance and administration.






[Categories](Special%253ACategories "Special%253ACategories"):

- [Proposals](Category%253AProposals "Category%253AProposals")
- [CMap](Category%253ACMap "Category%253ACMap")
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Display_CMap_Markers_in_GBrowse"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:05 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">11,444 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





---
title: "Display CMap Markers in GBrowse"
---
# Display CMap Markers in GBrowse

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

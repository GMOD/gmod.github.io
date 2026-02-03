---
title: "GBrowse Configuration/DAS"
---
# GBrowse Configuration/DAS

This article describes the **Distributed Annotation System** (DAS) and
how to configure GBrowse to work with it.

*For the main GBrowse configuration article, see:
<a href="../GBrowse_Configuration" class="mw-redirect"
title="GBrowse Configuration">GBrowse Configuration</a>.*



# Using DAS (Distributed Annotation System) Databases

You may insert features from a DAS source into any named track. Create a
stanza as usual but instead of specifying the feature type using the
"feature" option, give the desired DAS URL using the "remote feature"
option:

    remote feature = http://dev.hapmap.org/cgi-perl/das/t2d_testing?type=ldblock

Because DAS sources specify the glyph and visualization options, most of
the settings such as bgcolor will be ignored. However, the track key and
citation options are honored.

You can use the same syntax to load a GFF file or a feature file in
Gbrowse upload format into a track. Just provide a URL that returns the
desired data.

You can also run GBrowse entirely off a single DAS source. To get this
support, you must use Bio::Das version 0.90 or higher, available from
<a href="http://www.biodas.org" class="external free"
rel="nofollow">http://www.biodas.org</a>.

A sample \[GENERAL\] configuration section looks like this:

    [GENERAL]
    description   = Das Example Database (dicty)
    db_adaptor    = Bio::Das
    db_args       = -source http://www.biodas.org/cgi-bin/das
                    -dsn    dicty

The db_adaptor option must be set to "Bio::Das". The db_args option must
contain a -source pointing to the base of the remote DAS server, and a
-dsn pointing to the name of the annotation database.

The remainder of the configuration file should be configured as
described earlier. The following short script will return a list of the
feature types known to the remote DAS server. You can use the output of
this script as the basis for the tracks to configure.

``` de1
 #!/usr/bin/perl

 use strict;

 use Bio::Das;
 my $db = Bio::Das->new('http://localhost/cgi-bin/das'=>'dicty');
 print join "\n",$db->types;
```

Limitations:

The DAS implementation does not descend into subcomponents. For example,
if the user requests features on a chromosome, but the remote DAS server
has annotated genes using contig coordinates, then the genes will not
appear on the chromosome.

The gbrowse_details script does not provide useful information because
the DAS/1 protocol does not provide a way to retrieve attribute
information on a named feature.

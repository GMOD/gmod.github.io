---
title: "GBrowse DAS HOWTO"
---
# GBrowse DAS HOWTO


The Distributed Annotation System protocol (DAS;
<a href="http://www.biodas.org" class="external free"
rel="nofollow">http://www.biodas.org</a>) is a system for exchanging
genomic annotations across the Internet. It works similarly to the idea
of sharing the URLs of web-accessible GFF files, except that it is
designed to support large data sets. When a client application needs to
fetch just a subset of the data, such as a small piece of a chromosomal
arm, the DAS protocol allows only the relevant annotations to be
retrieved, rather than the whole data set.

## Installation

To take advantage of DAS functionality, you will have to install the
Perl Bio::Das module. This is available from CPAN (the Comprehensive
Perl Archive Network
(<a href="http://www.cpan.org" class="external free"
rel="nofollow">http://www.cpan.org</a>) or from the GMOD PPM repository.
Unix users can install Bio::Das with this command:

    % perl -MCPAN -e 'install Bio::Das'
    Windows users can use the PPM tool:

    C:\Windows> ppm
    ppm> install Bio::Das
    ppm> quit

You may need to issue the command "rep add gmod
<a href="http://www.gmod.org/ggb/ppm" class="external free"
rel="nofollow">http://www.gmod.org/ggb/ppm</a>" if PPM complains that it
cannot find Bio::Das.

## A Tutorial

We start out with a short tutorial that illustrates how GBrowse DAS
support works.

When you installed GBrowse, the system also installed a series of
tutorial files, the location of which you can find at
<a href="http://localhost/gbrowse2" class="external free"
rel="nofollow">http://localhost/gbrowse2</a>. We will use the *C.
elegans core* tutorial database as the basis for creating a DAS server.

To start, find the elegans_core.conf configuration file in the tutorial
**conf** directory and copy it to your GBrowse2 configuration directory
(typically /etc/gbrowse2). Edit the master /etc/gbrowse2/GBrowse.conf
configuration file to load this file by adding the following to the end
(if it is not there already from previous tutorials):

    [elegans_core]
    description = Core C. elegans annotations
    path        = elegans_core.conf

To enable the DAS server, add the following somewhere within the
\[GENERAL\] section of the elegans_core.conf file:

    # DAS reference server
    das mapmaster      = SELF

What this line is doing is to declare to the DAS system that our server
is authoritative for the coordinates on the current C. elegans genome
example. This is appropriate if you are starting out a genome for the
first time. If, however, you want to annotate against an existing set of
genome coordinates, you should replace SELF with the URL of the DAS
reference server that serves that genome. For example release hg16 of
the human genome at UCSC corresponds to DAS URL
<a href="http://genome.cse.ucsc.edu/cgi-bin/das" class="external free"
rel="nofollow">http://genome.cse.ucsc.edu/cgi-bin/das</a>. A list of
reference servers for various model organisms can be found at
<a href="http://www.biodas.org" class="external free"
rel="nofollow">http://www.biodas.org</a>.

The next step is to go through the configured tracks and add a "das
category" to each of them. DAS uses the idea of the "category" of a
feature in order to filter sets of features by their purpose. Categories
include:

|  |  |
|----|----|
| transcription | features that have to do with RNA transcription |
| translation | features that have to do with protein translation and function |
| variation | mutations, deletions, polymorphisms |
| structural | contigs, clones, reads, PCR primers |
| repeat | repetitive elements |
| experimental | a catch-all for experimental data |
| miscellaneous | anything that doesn't fit in one fo the other categories |

Find the \[Genes\] stanza and modify it to to have a das category of
"transcription" as shown here:

    [Genes]
    feature      = gene
    glyph        = gene
    height       = 8
    bgcolor      = blue
    description  = 1
    das category = transcription
    key          = Protein-coding genes

Similarly, modify the \[Alignments\] track to have a das category of
"similarity." You do not need to add a category to the DNA track, as it
is treated specially by das. You're all done! Be sure to save the
configuration file before you try the next step.

Using a web browser fetch the URL
<a href="http://localhost/cgi-bin/gb2/das/dsn" class="external free"
rel="nofollow">http://localhost/cgi-bin/gb2/das/dsn</a>. This will
return an XML document giving information about each of the data sources
that you have configured.

    <?xml version="1.0" standalone="yes"?>
    <!DOCTYPE DASDSN SYSTEM "http://www.biodas.org/dtd/dasdsn.dtd">
    <DASDSN>
      <DSN>


``` de1
elegans_core|Genes
```


         <MAPMASTER>http://localhost/cgi-bin/gb2/das/elegans_core</MAPMASTER>
         <DESCRIPTION>Core C. elegans annotations; Genes track; Protein-coding genes</DESCRIPTION>
      </DSN>
      <DSN>


``` de1
elegans_core|Alignments
```


         <MAPMASTER>http://localhost/cgi-bin/gb2/das/elegans_core</MAPMASTER>
         <DESCRIPTION>elegans_core; Alignments track; ESTs</DESCRIPTION>
      </DSN>
    </DASDSN>

This is showing that there is one configured DAS source, the
"elegans_core" data set. Next test that the DAS "types" request is
working. This request returns all the feature types that the database
knows about. Using a web browser fetch the URL
<a href="http://localhost/cgi-bin/gb2/das/elegans_core%7CGenes/types"
class="external free"
rel="nofollow">http://localhost/cgi-bin/gb2/das/elegans_core%7CGenes/types</a>.
This should return another short document confirming that the "gene"
feature type is available.

The final test that the DAS server is performing correctly is to browse
to the elegans_core database and to turn off all the tracks except for
DNA/GC content. This should give you an empty details panel. Open up the
"Upload and Share Tracks" tab, press "Import a Track URL", and type in
<a href="http://localhost/cgi-bin/gb2/das/elegans_core%7CGenes"
class="external free"
rel="nofollow">http://localhost/cgi-bin/gb2/das/elegans_core%7CGenes</a>
and press "Update URLs." The page should now reload and display the gene
models. Do this again with
<a href="http://localhost/cgi-bin/gb2/das/elegans_core%7CAlignments"
class="external free"
rel="nofollow">http://localhost/cgi-bin/gb2/das/elegans_core%7CAlignments</a>
in order to view the alignments. These tracks are not coming directly
from the local database, but from the database via the DAS protocol.


[Category](Special%253ACategories "Special%253ACategories"):

- [MOD User
  Interfaces](Category%253AMOD_User_Interfaces "Category%253AMOD User Interfaces")

---
title: "GBrowse Configuration/BioMOBY"
---
# GBrowse Configuration/BioMOBY

This article describes **BioMOBY and Bio::MOBY Browse** and how to
configure it for use in GBrowse.

*For the main GBrowse configuration article, see:
<a href="../GBrowse_Configuration" class="mw-redirect"
title="GBrowse Configuration">GBrowse Configuration</a>.*

# The Bio::MOBY Browse

The BioMOBY \[\] project aims to design and deploy platforms that enable
and simplify biological database interoperability.

To date, the MOBY-Services (MOBY-S) branch of the BioMOBY project has
published a fairly stable API that is now being used by data providers
worldwide to publish their data in an interoperable manner. A simple
MOBY browser has been written for Gbrowse that allows the end-user to
"surf" out of their Gbrowse view and begin exploring data related to the
genomic features displayed in Gbrowse.

Configuration of the gbrowse_moby script does, at this time, require
some VERY simple code-editing, and small modifications to your
XX.organism.conf configuration file. These are described in detail
below:

SYNOPSIS
In 0X.organism.conf, for example:
    [ORIGIN]
    link         = http://yoursite.com/cgi-bin/gbrowse_moby?source=$source&name=$name&class=$class&method=$method&ref=$ref&description=$description
    feature      = origin:Sequence
    glyph        = anchored_arrow
    fgcolor      = orange
    font2color   = red
    linewidth    = 2
    height       = 10
    description  = 1
    key          = Definition line
    link_target  = _MOBY

AND/OR

    [db_xref:DETAILS]
    URL = http://yoursite.com/cgi-bin/gbrowse_moby?namespace=$tag;id=$value

Note that all you are doing in each case is to associate a mouse click
on a particular feature type with an invocation of the gbrowse_moby
script, passing a few of the common Gbrowse variables in the GET string.
The gbrowse_moby script will take information passed from a click on a
Gbrowse feature, or a click on a configured DETAILS GFF attribute type,
and initiate a MOBY browsing session with information from that link.
Most information is discarded. The only useful information to MOBY is a
"namespace" and an "id" within that namespace. Generally speaking,
namespaces in Gbrowse will have to be mapped to a namespace in the MOBY
namespace ontology (which is derived from the Gene Ontology Database
Cross-Reference Abbreviations list). Currently, this requires editing of
the gbrowse_moby code, where a Perl hash named %source2namespace maps
the GFF source (column 2) to a MOBY namespace:

     $source2namespace{$source} = moby_namespace

REQUIRED LIBRARIES
This script requires libraries from the BioMOBY project. Currently these
are only available from the [CVS](../Glossary#CVS). Anonymous
checkout of the BioMOBY project can be accomplished as follows:
     cvs -d :pserver:cvs@cvs.open-bio.org:/home/repository/moby login

When prompted for a password, type "cvs".

     cvs -d :pserver:cvs@cvs.open-bio.org:/home/repository/moby co moby-live
     cvs update -dP

You will then need to enter the moby-live/Perl folder and run

    perl Makefile.PL; make; make install

to install the MOBY libraries into your system.

USAGE
gbrowse_moby understands the following variables, some of which (\*) may
be passed from Gbrowse through a mouse-click into the GET string:
    * $source    - converted into a MOBY namespace by parsing
                 the 'source' GFF tag against the %source2namespace
                 hash.
                (see more detailed explanation in the examples below)
    $namespace - used verbatim as a valid MOBY namespace
    * $name      - used verbatim as a MOBY id interpreted in the namespace
    * $id        - used verbatim as a MOBY id interpreted in the namespace
    * $class     - this is the GFF column 9 class; used for the page title
    $objectclass - this should be a MOBY Class ontology term
                  (becomes Class 'Object' by default, and this
                   is usually correct)
    $object      - contains the raw XML of a valid MOBY object

Note that you MUST at least pass a namespace-type variable
(source/namespace) and an id-type variable (name/id) in order to have a
successful MOBY call.

EXAMPLES
Simple GFF: If your GFF were:
         A22344  Genbank  origin  1000  2000  87  +  .

You would set your configuration file as follows:

        [ORIGIN]
        link         = http://yoursite.com/cgi-bin/gbrowse_moby?source=$source&name=$name&class=$class
        feature      = origin:Genbank

and you would edit the gbrowse_moby script as follows:

         my %source2namespace = (
            #   GFF-source           MOBY-namespace
               'Genbank'       =>      'NCBI_Acc',
         );

this maps the GFF source tag "Genbank" to the MOBY namespace "NCBI_Acc"
GFF With non-MOBY Attributes: If your GFF were:

         A22344  Genbank origin  1000  2000 87 + . Locus CDC23

You would set your configuration file as follows:

        [ORIGIN]
        link         = http://yoursite.com/cgi-bin/gbrowse_moby?source=$source&name=$name&class=$class
        feature      = origin:Genbank

and you might also set a DETAILS call to handle the Locus Xref: (notice
that we use the 'source' tag to force a translation of the foreign
namespace into a MOBY namespace)

        [db_xref:DETAILS]
        URL = http://brie4.cshl.org:9320/cgi-bin/gbrowse_moby?source=$tag;id=$value

then to handle the mapping of Locus to YDB_Locus as well as the Genbank
GFF source tag you would edit the source2namespace hash in gbrowse_moby
to read:

         my %source2namespace = (
            #   GFF-source           MOBY-namespace
               'Genbank'       =>      'NCBI_Acc',
               'Locus'         =>      'YDB_Locus',
         );

GFF With MOBY Attributes: If your GFF were (NCBI_gi is a valid MOBY
namespace):

         A22344  Genbank origin  1000  2000 87 + . NCBI_gi 118746

You would set your configuration file as follows:

        [ORIGIN]
        link         = http://yoursite.com/cgi-bin/gbrowse_moby?source=$source&name=$name&class=$class
        feature      = origin:Genbank

and you might also set a DETAILS call to handle the NCBI_gi Xref:
(notice that we now use the 'namespace' tag to indicate that the tag is
already a valid MOBY namespace)

        [db_xref:DETAILS]
        URL = http://brie4.cshl.org:9320/cgi-bin/gbrowse_moby?namespace=$tag;id=$value

Since there is no need to map the namespace portion, we now only need to
handle the Genbank GFF source as before:

         my %source2namespace = (
            #   GFF-source           MOBY-namespace
               'Genbank'       =>      'NCBI_Acc',
         );

HINTS
-The full listing of valid MOBY namespaces is available at:
       http://mobycentral.cbr.nrc.ca/cgi-bin/types/Namespaces

-A useful mapping to make is to put the organism name into the
Global_Keyword namespace. This will trigger discovery of MedLine
searches for papers about that organism.

## BioMOBY Services

A selection of services are distributed with the Gbrowse package that
will allow you to serve your underlying data using the BioMOBY Services
architecture.

To enable these, simply do the following:

. Set-up and fill your database
as per the normal Gbrowse instructions

. Edit the moby.conf file
in the /\$CONFIG/gbrowse.conf/MobyServices folder. It should be set up
as follows:

a\. Reference: Your reference sequences will be based on some type of
identifier - e.g. they will be from Genbank or from Embl or from
Flybase, etc. Look-up the BioMOBY namespace corresponding to the type of
identifier you are using for your Reference sequences and put that
identifier here. -The full listing of valid MOBY namespaces is available
at:

       http://mobycentral.cbr.nrc.ca/cgi-bin/types/Namespaces

b\. authURI: You are required to identify yourself when registering MOBY
Services. Your authURI is a URI uniquely identifying you. This is
generally your domain (e.g. flybase.org) c. contactEmail: You are
required to provide a contact email address to which people can contact
you v.v. the services you are providing. d. CGI_URL: This is simply the
URL to the folder from which you are serving your gbrowse scripts. e.g.
<a href="http://flybase.org/cgi-bin/gbrowse/" class="external free"

the script name in this parameter! It is the folder only!! e.
\[Namespace_Class_Mappings\]: This section is just a list of tuples
indicating the relationship between various entities in your database
(e.g. Genes, Transcripts) and their equivalent BioMOBY namespaces. For
example, if you are TAIR, and you have entities in your database called
"Locus", you would add the line:

           Locus = TAIR_Locus

to this section of the config file. This will allow people who have
TAIR_Locus identifiers in-hand to discover your service and request
information about that locus from your database. You may add as many
Namespace-\>Class mappings as you wish; one per line.

. REGISTERING SERVICES
To register your services with the MOBY Central web service registry
simply run the `register_moby_services.pl` script, located in the
`Generic-Genome-Browser/bin` folder. The script documentation can be
retrieved with POD or simple documentation can be printed by simply
running the script with no command-line parameters. Generally speaking
you need only run:
    perl register_moby_services.pl -register

As services are registered they will be added to a file:
`registeredMOBYServices.dat`. This file is used to de-register your
services if you wish to do so. To deregister, simply run:

    perl register_moby_services.pl -clean

If your .dat file is not available, cleaning your services will be
unsuccessful.

. Service script
Your services are served by the script `moby_server` in your
`cgi-bin folder`. This is auto-configured by the register_services step
above, so generally speaking you do not need to edit this script.

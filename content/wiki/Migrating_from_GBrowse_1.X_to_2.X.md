---
title: "Migrating from GBrowse 1.X to 2.X"
---
# Migrating from GBrowse 1.X to 2.X

This is a guide for existing users of the GBrowse 1.X series to help
them migrate to version 2.0 and higher. For first-time users, please see
[GBrowse 2.0 HOWTO](/wiki/GBrowse_2.0_HOWTO).

GBrowse 2.0 is mostly backward compatible with the 1.0 series, but there
have been some changes to the layout of configuration files that make
the system easier to configure and maintain. A small amount of work is
needed to make your existing system work with the 2.0 series.

  Environment Variables</span>](#Apache_Environment_Variables)
- [GBrowse.conf
  and Data Source Config
  Files](#GBrowse.conf_and_Data_Source_Config_Files)
- [Specifying
  Databases](#Specifying_Databases)
  - [Specifying
    Rendering Slaves](#Specifying_Rendering_Slaves)

# Apache Environment Variables

GBrowse 1.X found the location of its configuration files by consulting
a hard-coded variable located in the CGI script itself. This made it
hard to move the configuration files around. In contrast, GBrowse 2.0
finds its configuration directory by consulting an environment variable
named GBROWSE_CONF that is set by Apache. You must add a '*SetEnv*
directive in the Apache configuration file in order to create this
variable and pass it through. Usually this directive will be located in
the "cgi-bin" \<Directory\> section as follows:

     <Directory /usr/lib/cgi-bin>
       SetEnv GBROWSE_CONF /etc/GBrowse2
       ... # other stuff # ...
     </Directory>

Other environment variables that can be set in the Apache configuration
file include:

**GBROWSE_DOCS**
Location of GBrowse's static HTML files and images in the file system
(e.g. "/var/www/gbrowse2")

**GBROWSE_ROOT**
Location of GBrowse's static HTML files and images in URL space (e.g.
"/gbrowse2")

**GBROWSE_MASTER**
Name of the GBrowse master configuration file located in the
configuration directory, "GBrowse.conf" by default.

**PERL5LIB**
Colon-delimited list of directories to search for Perl modules. Useful
if some modules, such as bioperl, are installed in non-standard
locations.

The Build script will guide you through selecting most of these options
when you run "./Build config". You can then create a suitable fragment
of Apache configuration file code to cut and paste into its
configuration file by running *./Build apache_config*.

# GBrowse.conf and Data Source Config Files

In GBrowse 1.X, each data source had its own configuration file.
However, many or most of the options in each file, such as file paths,
stylesheets, and header/footer options, were the same, causing config
file bloat. In GBrowse 2.0, all common configuration options have been
moved into a master configuration file, usually located at
*/etc/GBrowse2/GBrowse.conf*.

GBrowse.conf contains a \[GENERAL\] stanza that sets such options as the
location of the data-specific configuration files, static HTML,
Javascript and CSS files, timeouts, session settings and global
appearance settings. It also contains one or more data-source stanzas,
one for each species (or genome annotation release) you want to make
available for browsing. Each data-source specific stanza looks like
this:

     [datasource]
     description = This is a description
     path        = datasource.conf

The *description* appears in the pop-up menu that allows users to select
the genome to browser. The *path* specifies the path to the
configuration file for that data source. The Build process installs an
example GBrowse.conf for you, so you can see how this is done.

Each data-source specific configuration file also has a \[GENERAL\]
stanza. Options in this stanza supplement or override settings in
GBrowse.conf. Usually there will be only a very few options in this
stanza. Following this there is a \[TRACK DEFAULTS\] stanza that sets
default options for tracks, followed by a series of \[TRACK_NAME\]
stanzas for configuring individual tracks.

To migrate your GBrowse 1.X configuration files to 2.0, simply customize
the \[GENERAL\] section of the new GBrowse.conf file to meet your needs,
and then create a \[*datasource*\] section that points to each of your
existing GBrowse 1.X config files. In most cases, these config files
will work as is. Later, you may wish to consolidate redundant options
that are shared among your config files in order to simplify
maintenance.

# Specifying Databases

In GBrowse 1.X each data source could be attached to one and only one
database. In GBrowse 2.0, you can declare as many databases as you like,
and attach them to one or more tracks. The syntax is simple. Somewhere
in the data source configuration file (suggested: between \[GENERAL\]
and the track stanzas) declare one or more \[*name*:database\] stanzas.
For example:

      [volvox_genbank:database]
      db_adaptor    = Bio::DB::SeqFeature::Store
      db_args       = -adaptor memory
                      -dir    /usr/share/databases/volvox_gb_mirror

      [volvox_ncRNA:database]
      db_adaptor   = Bio::DB::SeqFeature::Store
      db_args      = -adaptor DBI::mysql
                     -dsn     volvox_ncRNA

This declares two databases, one named "volvox_genbank" and the other
"volvox_local". You then assign these to the tracks as follows:

      [GENES]
      database = volvox_genbank
      feature  = gene:genbank
      ... etc...

      [miRNAs]
      database = volvox_ncRNA
      feature  = miRNA
      ... etc...

The default database is specified in the \[GENERAL\] or \[TRACK
DEFAULTS\] section, with the latter taking precedence over the former:

     [GENERAL]
     database = volvox_genbank   # this will be the default
     ... etc...

For backward compatibility, you can forego the \[:database\] sections
entirely and just place db_adaptor and db_args options directly in the
\[GENERAL\] and/or \[*TRACK*\] stanzas. The system will do its best to
minimize the amount of redundancy and uniqueify the databases.

## Specifying Rendering Slaves

GBrowse 2.0 supports rendering slaves, which are small network-based
servers that receive track rendering requests from the GBrowse server
and generate the text and graphics needed for a track. By judiciously
spreading out the work among multiple slaves, you can speed up rendering
considerably. On multiprocessor systems, there is also an advantage to
having one or more rendering slaves running on the local host.

To attach a rendering slave to a track, add the *remote renderer*
option, giving the host and port of the slave in URL format:

      [GENES]
      feature  = gene:genbank
      remote renderer = http://node22.serverfarm.org:1800
      ... etc...

      [miRNAs]
      database = volvox_ncRNA
      feature  = miRNA
      remote renderer = http://node23.serverfarm.org:1800

The *database* and *remote renderer* options are independent of each
other, and can be mixed and matched according to your needs. See Running
GBrowse 2.0 Rendering Slaves for more information on setting up
renderers.

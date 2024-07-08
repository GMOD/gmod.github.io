



<span id="top"></span>




# <span dir="auto">Migrating from GBrowse 1.X to 2.X</span>









This is a guide for existing users of the GBrowse 1.X series to help
them migrate to version 2.0 and higher. For first-time users, please see
[GBrowse 2.0 HOWTO](GBrowse_2.0_HOWTO "GBrowse 2.0 HOWTO").

GBrowse 2.0 is mostly backward compatible with the 1.0 series, but there
have been some changes to the layout of configuration files that make
the system easier to configure and maintain. A small amount of work is
needed to make your existing system work with the 2.0 series.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Apache
  Environment Variables</span>](#Apache_Environment_Variables)
- [<span class="tocnumber">2</span> <span class="toctext">GBrowse.conf
  and Data Source Config
  Files</span>](#GBrowse.conf_and_Data_Source_Config_Files)
- [<span class="tocnumber">3</span> <span class="toctext">Specifying
  Databases</span>](#Specifying_Databases)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Specifying
    Rendering Slaves</span>](#Specifying_Rendering_Slaves)



# <span id="Apache_Environment_Variables" class="mw-headline">Apache Environment Variables</span>

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

# <span id="GBrowse.conf_and_Data_Source_Config_Files" class="mw-headline">GBrowse.conf and Data Source Config Files</span>

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

# <span id="Specifying_Databases" class="mw-headline">Specifying Databases</span>

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

## <span id="Specifying_Rendering_Slaves" class="mw-headline">Specifying Rendering Slaves</span>

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
other, and can be mixed and matched according to your needs. See <a
href="http://gmod.org/mediawiki/index.php?title=Running_GBrowse_2.0_Rendering_Slaves&amp;action=edit&amp;redlink=1"
class="new"
title="Running GBrowse 2.0 Rendering Slaves (page does not exist)">Running
GBrowse 2.0 Rendering Slaves</a> for more information on setting up
renderers.




[Categories](Special%3ACategories "Special%3ACategories"):

- [GBrowse](Category%3AGBrowse "Category%3AGBrowse")
- [HOWTO](Category%3AHOWTO "Category%3AHOWTO")
- [GBrowse 2](Category%3AGBrowse_2 "Category%3AGBrowse 2")






## Navigation menu






### 





### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>




### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%3AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%3AHOWTO)</span>
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

- <span id="t-smwbrowselink"><a href="Special%3ABrowse/Migrating_from_GBrowse_1.X_to_2.X"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 06:14 on 26 August
  2010.</span>
<!-- - <span id="footer-info-viewcount">40,731 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD%3AAbout "GMOD%3AAbout")</span>

<!-- -->





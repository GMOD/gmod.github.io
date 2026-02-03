---
title: "GBrowse 2.0 HOWTO"
---
# GBrowse 2.0 HOWTO.
By default this support is enabled, but there no particular performance
penalty if you choose not to take advantage of it. If you plan never to
use the feature, set it to a false (zero) value:

     renderfarm = 0

slave_timeout
When [running a GBrowse2 render
farm](/wiki/Running_a_GBrowse2_render_farm),
this option controls how long the master server will wait for one of its
slaves before it times out and considers the slave "down". The units are
seconds, 45 seconds by default.
global_timeout
If a database query, search or plugin takes longer than the number of
seconds given by this option, GBrowse will time out and return an error
to the user. The default is 60 seconds.
allow remote callbacks
If this option is set to a true (non-zero) value, then uploaded and
remote track files will be able to contain configuration stanzas with
Perl callbacks. The callbacks will be executed if and only if the Perl
<a href="http://search.cpan.org/perldoc?Safe::World"
class="external text" rel="nofollow">Safe::World</a> module is installed
on your server. This module provides a restricted execution environment
that mitigates (but does not eliminate) the risk from untrusted code
accessing local files and other sensitive content. *Note that
Safe::World does not currently work with Perl 5.10 and higher.*

max_render_processes

GBrowse launches a subprocess for each track it renders. This option
will limit the number of simultaneous subprocesses that can be launched
in order to avoid overloading the system. The default is four; you may
wish to adjust this upward on a system with 4 or more CPUs. A good
choice is between one and two times the number of CPUs/cores on the
server system:

    max_render_processes = 8

#### Appearance Settings

The following options control the appearance and behavior of GBrowse.
Unlike the earlier options, any of them can be overridden on a
per-datasource basis in datasource-specific configuration files simply
by inserting the option into the \[GENERAL\] section of the
datasource-specific config file.

autocomplete
This is a true/false option. If true, then any databases that have the
"autocomplete" option set will be searched when the user types three or
more letters into the GBrowse search field. Proposed matches will be
displayed in a popup menu. Please see [Database Search
Options](#Database_Search_Options) for more information.

The autocomplete setting also applies to the "Custom Tracks" and
"Community Tracks" sections, and allows users to search the user account
database for public tracks via autocomplete. See
[GBrowse_Configuration/Authentication](/wiki/GBrowse_Configuration/Authentication)
for more information on the user account database.

balloon tips
This is a true/false option. If true, popup balloons are activated such
that when the user mouses over a feature, additional information about
that feature appears in a balloon.
titles are balloons
This is a true/false option. If true, popup balloons are automatically
populated by default information about the feature unless a track has a
**balloon hover** option that overrides the content. If false, then you
will need to set the **balloon hover** option for the track in order for
balloons to appear at all.

stylesheet

This option sets the path to the GBrowse cascading stylesheet (CSS)
file. This sets such options as the page background color, font size,
background image, and so forth. Edit this option here to change the
appearance of all data sources, or add a **stylesheet** option to the
\[GENERAL\] section of datasource-specific configuration files to change
the appearance on a case-by-case basis.

You can also specify multiple stylesheets by separating them by spaces
or newlines. To associate specific stylesheets with different media
types, place the media type(s) in parentheses and append them to the
stylesheet, as in the following example:

     stylesheet = css/gbrowse.css(screen)
                  http://www.example.com/hires.css(paper,projection)
                  http://www.example.com/audio.css(audio)

truecolor
If set to a true value, then the tracks will be rendered as full-color
24-bit images, improving appearance at the cost of larger images. The
effect may be noticeable on a slow internet connection.
truetype
If set to a true value, then the fonts in track images will be rendered
using truetype fonts installed on the server. A value of "1" selects a
safe default font. A string value can be used to select a particular
font, such as "Droid Sans" or "Helvetica-9". This option only works on
versions of GBrowse from 2.55 onward, and only if Bio::Graphics 2.33 or
higher is installed.
plugins
This option selects which, if any, of the GBrowse plugins to offer to
the user. It is a space-delimited list of plugin names. Plugins are Perl
.pm modules that can be found in the plugins subdirectory of the
GBrowse2 configuration directory. Select the ones you wish to activate,
and put their in this configuration directive, minus the ".pm"
extension. See GBrowse2
Plugins for a description of what each plugin does.
overview grid, region grid, detail grid
These three options control whether the background grid should be
displayed in the overview, region, and detail panels by default. They
are either true (1) or false (0) values. The user can later turn the
detail panel grid on and off, but currently there is no user interface
for deselecting the overview and region grids.

image widths, default width

These two options control the width of the panels displayed to the user.
**image widths** is a space-delimited list of numeric widths to be made
available to the user to select from. **default width** is a single
numeric value indicating the default width when the user first loads the
browser. In this example, the browser assumes a default width of 1024
pixels, but offers the user a menu of five widths ranging from 450 to
1280 pixels.

    image widths    = 450 640 800 1024 1280
    default width   = 1024

pad_left, pad_right
These options control how much additional whitespace (in pixels) to
surround the detail panel with on the left and the right. This is
sometimes necessary for glyphs that need extra space to the left or
right for additional information. An example of this is the [UCSC
multiple alignment
glyph](/wiki/GBrowse_UCSC_Plugin_Install_HOWTO).
too many landmarks
This option controls the maximum number of results to return when the
user performs a wildcard search on the database. The default is 100.
hilite fill
This option controls the interior color of the selection rectangle that
appears when the user clicks and drags on a scalebar, as well as the
highlighted region of the currently selected region. It accepts a
[Bio::Graphics color
value](/wiki/Glyphs_and_Glyph_Options#Colors), such
as "beige:0.8" for a beige background at 80% opacity.
hilite outline
This option controls the outline color of the selection rectangle that
appears when the user clicks and drags on a scalebar, as well as the
highlighted region of the currently selected region. It accepts a
[Bio::Graphics color
value](/wiki/Glyphs_and_Glyph_Options#Colors), such
as "red:0.8".
hilite height
This option controls the height of the draggable region marker, which
highlights the currently selected region
overview bgcolor, region bgcolor, detail bgcolor
These three options control the background colors of the overview,
region and detail panels respectively. They each accept [Bio::Graphics
color
value](/wiki/Glyphs_and_Glyph_Options#Colors).
grid color, grid major color
These options control the appearance of the grid lines in the overview,
region and detail panels. The first controls the color of the minor grid
lines, and the second controls the color of the major grid lines. They
each accept a [Bio::Graphics color
value](/wiki/Glyphs_and_Glyph_Options#Colors).
show sources
Ordinarily GBrowse generates a popup menu showing all configured data
sources; the user can change the datasource by selecting from this menu.
To inhibit generation of this menu, set **show sources** to zero.
instructions section, upload_tracks section, search section, overview section, region section, detail section, tracks section, display_settings section
These options control whether a section is toggled open initially
("open"), or toggled closed ("closed"). In addition, for the "overview
section", "region section" and "detail section", you can specify a value
of "hide" in which case the section isn't shown at all. Generally this
only makes sense for the region section.
category default state
As described in the track configuration section, a track can be placed
in a category or subcategory. The categories can be toggled open and
closed. The "category state" option, described next, allows you to
configure the toggle state of each category and subcategory when the
user first accesses the page. If a category is not explicitly named,
then this option is consulted to find the default. Values are either
"open" to make each category open by default, or "closed". For
convenience, you may use the integer value 0 for "closed" or 1 for
"open".

category state

This option controls whether a category or subcategory is open or closed
when the user first visits the page, or resets his state with the
"Reset" menu choice. The format is as shown in this example:

    category state = Genes           open
                     Genes:Coding    open
                     Genes:Noncoding closed

Categories are identified by their names; subcategories and
sub-subcategories are indicated by dividing the subcategories by ":"
characters. You may use "open" to indicate that a category is open at
first, or "closed" to collapse it on the first page load. "1" and "0"
can be used instead of "open" and "closed".

#### Fast Track Panning (new in version 2.20)

This configures fast track panning, the ability for a user to drag/pan
the details tracks back and forth to instantly see more of the image.
Extra wide images are preloaded from the server to accomplish this, so
it may affect the initial image load time.

details multiplier
How much extra image data to load. A value of 3.0 means that three times
the viewable image width will be loaded. The default is 1.0, which means
that fast track panning is turned off and GBrowse behaves as usual.

#### Cleanup Settings

These settings are used by the
[gbrowse_clean.pl](/wiki/Gbrowse_clean.pl) script to remove
stale temporary files of various sorts.

expire cache
How long generated tracks will be cached before they are regenerated.
This speeds up page load speed for frequently-accessed pages. The format
is a number followed by a time unit, where units are **s** for second,
**m** for minute, **h** for hour, **d** for day, **w** for week, and
**M** for month. The default is "2h", or two hours.
expire sessions
This option controls how long the user's track configuration, which
includes which tracks are turned on and their customized settings, will
be remembered in his or her session. The format is the same as **expire
cache** and is set to one month by default.
expire uploads
This option controls controls how long to keep user uploaded data for
custom tracks on disk. It makes sense to keep it on disk for as long or
longer than the session. Even if the user’s session expires, he can
still get at the uploaded data if he bookmarked his session or shared
the uploaded track at any point. The format is the same as **expire
cache** and defaults to six weeks.

#### Upload Database Settings

These options configure the backend database that is used to store the
information that a user uploads when he or she creates custom tracks.
The default is to choose a workable database system based on the Perl
DBI drivers installed on the system. See [Configuring the Uploaded Track
Database](/wiki/GBrowse_2.0_Install_HOWTO/Advanced#Configuring_the_Uploaded_Track_Database)
for detailed configuration information.

upload_db_adaptor
Which database backend to use for custom tracks. Valid options are
"DBI::SQLite", "DBI::mysql", "berkeleydb" and "memory". The SQLite
database backend combines great performance with little or no
maintenance, but does require the perl
<a href="http://search.cpan.org/perldoc?DBI::SQLite"
class="external text" rel="nofollow">DBI::SQLite</a> module to be
installed. The memory backend requires no additional Perl modules, but
is only appropriate for very small uploads (less than 10,000 features).
The <a href="http://search.cpan.org/perldoc?DBI::mysql"
class="external text" rel="nofollow">DBI::mysql</a> backend has the best
performance, but needs additional configuration in order to make it
possible for GBrowse to create and drop databases dynamically.
upload_db_host
When using the DBI::mysql backend, this specifies the host on which the
mysql DBMS is running. (Default "localhost").
upload_db_user
When using the DBI::mysql backend, this specifies the user that has
access to the mysql server. This user must have database create/drop
privileges for databases beginning with the string "userdata\_".
(Default "gbrowse").
upload_db_pass
When using the DBI::mysql backend, this specifies the password for the
user named by **upload_db_user**. (Default no password).
admin_account
The name of the administrator account that has privileges to upload and
configure public tracks. See [The Admin
Interface](/wiki/GBrowse_2.0_Install_HOWTO/Advanced#The_Admin_Interface)
for more details.
admin_dbs
The path used to store data files uploaded by the administrator named in
**admin_account**. See [The Admin
Interface](/wiki/GBrowse_2.0_Install_HOWTO/Advanced#The_Admin_Interface)
for more details.

#### Debug Settings

The next set of options toggles on or off various debug flags, enabling
you to watch what GBrowse2 is doing and help the developers catch and
fix bugs. Their values are either 0 (no debugging messages) or 1
(activate debugging messages). When debugging is active, the messages
will appear in the Apache error log, typically
/var/log/apache2/error_log.

debug
This turns on messages about general GBrowse operations.
debug_external
This turns on messages concerning the uploading and processing of
user-supplied tracks, as well as tracks fetched from remote sources via
the
<a href="http://www.biodas.org" class="external text" rel="nofollow">DAS
protocol</a>.
debug_plugins
This turns on debugging messages concerning the operation of GBrowse's
user-contributed [plugins](/wiki/GBrowse_Plugins).

#### Configuring Genomic Regions

Several options allow you to configure the behaviour of genomic regions,
such as the levels of zoom you wish to offer and the largest segment of
genome that it is safe to display in the detail panel.

| option | default value | description |
|----|----|----|
| region segment | 50000 (?) | NOT DESCRIBED HERE PREVIOUSLY! DOES IT APPLY TO 2.0?? DESCRIBED ELSEWHERE (*If this configuration option is set, a new "region panel" will appear that is intermediate in size between the overview and the detail panel. The value of this option becomes the size of the region panel in base pairs.*) |
| max segment | 5000000 (?) | The maximum size (in base pairs) that the detail panel can display. If the user tries to display a region that is too large, he will be given a message to select a smaller region. GBrowse performance degrades as the number of features per track increases, so you can use this setting to avoid making the user wait unreasonable lengths of time for the region to display. |
| zoom levels | 100 500 1000 5000 50000 100000 (?) | A space-delimited list of region sizes (in base pair) that the user can zoom through. Each zoom level will be listed in a popup menu in the navigation bar. |
| fine zoom | 10% | This option controls the increment that the user will zoom in or out when pressing the "+" and "-" buttons in the navigation bar. |
| default segment | 5000 (?) | If the user has selected a region that is too large to display, then single-clicks on one of the scale bars, he will be centered on a region this many base pairs in length. |
| region sizes | 1000 5000 10000 20000 (?) | This option is similar to **zoom levels** except that the list of zoom levels applies to the region panel. |
| default region | 5000 (?) | This option specifies the default length of the region panel, in bp. |
| max keyword results | (?) | If the user does a wildcard or keyword search, this option limits the maximum number of results that can be displayed. |

#### HTML Customization Settings

Several settings in the \[GENERAL\] section allow you to insert
fragments of HTML (including images) into the GBrowse screen. This lets
you create banners and other customizations for visual integration with
other pages on your site.

header, footer

These two options place HTML at the top or bottom of the page. Example:

     header =

You can create an unlimited number of subtracks within a single major
track in order to group a series of datasets that are logically linked,
such as a timecourse. You can choose which subtracks to show by default
and the order in which they will appear. The user can use a dialog box
to select which subtracks to make visible and to reorder the subtracks.

See [Creating and Managing Subtracks with
GBrowse2](/wiki/Creating_and_Managing_Subtracks_with_GBrowse2)
for full details.

# Advanced Datasource Configuration Topics

This section describes how to further customize your GBrowse data
sources to provide for an exceptional end-user experience.

## Computed Options

Many configuration file options can be computed at run time by using
Perl subroutines as their values. These are known as "callbacks."
Currently callbacks work with all options that can be placed in a
\[TRACK\] section except for the "database" and "remote renderer"
options. In addition, the "header", "footer" and "html1" through "html6"
options in the GBrowse.conf and datasource \[GENERAL\] sections accept
callbacks.

You need to know the Perl programming language to take advantage of this
feature. The general format of this type of option is:

``` de1
  option name = sub {
              some perl code;
              some more perl code;
              even more perl code;
              }
```

The value must begin with the sequence "sub {" in order to be recognized
as a subroutine declaration. After this, you can have one or more lines
of Perl code followed by a closing brace. Continuation lines must begin
with whitespace.

When the browser first encounters an option like this one, it will
attempt to compile it into Perl runtime code. If successful, the
compiled code will be stored for later use and invoked whenever the
value of the option is needed. (Otherwise, an error message will appear
in your server error log).

For options of type "footer", "header", and "html1" through "html6", the
subroutine is passed no arguments. It is expected to produce some HTML
and return it as a string value.

For glyph-specific features, such as "bgcolor" the subroutine will be
called at run time with five arguments consisting of the feature, the
name of the option, the current part number of the feature, the total
number of parts in this feature, and the glyph corresponding to the
feature. Usually you will just look at the first argument. The return
value is treated as the value of the corresponding option. For example,
this bgcolor subroutine will call the feature's primary_tag() method,
and return "blue" if it is an exon, "orange" otherwise:

``` de1
  bgcolor = sub {
          my $feature = shift;
          return "blue" if $feature->primary_tag eq 'exon';
          return "orange";
          }
```

See the manual page for
<a href="http://search.cpan.org/perldoc?Bio::Graphics::Feature"
class="external text" rel="nofollow">Bio::Graphics::Feature</a> and
<a href="http://search.cpan.org/perldoc?Bio::SeqFeature::Lite"
class="external text" rel="nofollow">Bio::SeqFeature::Lite</a> for
information on how to interrogate the feature object.

For special effects, such as coloring the first and last exons
differently, you may need access to all five arguments. Here is an
example that draws the first and last parts of a feature in blue and the
rest in red:

``` de1
   sub {
         my($feature,$option_name,$part_no,$total_parts,$glyph) = @_;
         return 'blue' if $part_no == 0;                # zero-based indexing!
         return 'blue' if $part_no == $total_parts-1;   # zero-based indexing!
         return 'red';
         }
```

If you need access to information in the parent of the feature (e.g. in
a multipart feature), you can call the glyph's parent_feature() method:

``` de1
  sub {
         my($feature,$option_name,$part_no,$total_parts,$glyph) = @_;
         my $parent = $glyph->parent_feature;
         return 'blue' if $parent->name =~ /Blue\d+/;
         return 'red';
         }
```

The parent_feature() method was added to Bioperl on 17 April 2008. If
you are using an earlier version, parent_feature() will not be
available.

See the Bio::Graphics::Panel manual page for more details.

Callbacks for the "link", "title", and "link_target" options have a
slightly different call signature. They receive three arguments
consisting of the feature, the Bio::Graphics::Panel object, and the
Bio::Graphics::Glyph object corresponding to the current track within
the panel:

``` de1
  link = sub {
             my ($feature, $panel, $track) = @_;
             ... do something
             }
```

Ordinarily you will only need to use the feature object. The other
arguments are useful to look up panel-specific settings such as the
pixel width of the panel or the state of the "flip" setting:

``` de1
  title = sub {
          my ($feature,$panel,$track) = @_;
          my $name = $feature->display_name;
          return $panel->flip ? "$name (flipped)" : $name;
       }
```

### Named Subroutine References

If you use a version of BioPerl after April 15, 2003, you can also use
references to named subroutines as option arguments. To use named
subroutines, add an init_code section to the \[GENERAL\] section of the
configuration file. init_code should contain nothing but subroutine
definitions and other initialization routines. For example:

``` de1
  init_code = sub score_color {
                my $feature = shift;
                if ($feature->score > 50) {
                  return 'red';
                } else {
                  return 'green';
                }
              }
              sub score_height {
                my $feature = shift;
                if ($feature->score > 50) {
                  return 10;
                } else {
                  return 5;
                }
              }
```

Then simply refer to these subroutines using the \\name syntax:

       [EST_ALIGNMENTS]
       glyph = generic
       bgcolor = \&score_color
       height  = \&score_height

You can declare global variables in the init_code subroutine if you use
"no strict 'vars';" at the top of the section:

``` de1
    init_code = no strict 'vars';
                $HEIGHT = 10;
                sub score_height {
                  my $feature = shift;
                  $HEIGHT++;
                  if ($feature->score > 50) {
                    return $HEIGHT*2;
                  } else {
                    return $HEIGHT;
                  }
                }
```

Due to the way the configuration file is parsed, there must be no empty
lines in the init_code section. Either use comments to introduce white
space, or "use" a .pm file to do anything fancy.

Subroutines that you define in the init_code section, as well as
anonymous subroutines, will go into a package that changes unpredictably
each time you load the page. If you need a predictable package name, you
can define it this way:

       init_code = package My; sub score_height { .... }

       [EST_ALIGNMENTS]
       height = \&My::score_height

### Using Pipes in the GBrowse.conf Data Source Name

It is sometimes convenient to generate datasource files programmatically
rather than using a static file. To do this, you can give GBrowse.conf a
"path" option that uses Perl's "piped open" syntax to read the output of
a script. For example:

     # this is in GBrowse.conf
     [modENCODE_preview]
     description = modENCODE preview database
     path        = /usr/local/modencode/bin/preview.pl |

The script (preview.pl in this example) must print a correctly formatted
GBrowse datasource configuration file to its standard output.

\[*Available in 2.09 and higher*\] To get even more elaborate than this,
you can use a regular expression as the stanza datasource name, allowing
you to pass extracted subexpressions to the script. For example:

    [=~modENCODE_preview_v(\d+)]
     description = modENCODE preview database
     path        = /usr/local/modencode/bin/preview.pl $1 |

The "=~" prefix is required to turn on regular expression scanning. This
will match any data source of the format "modENCODE_preview_v123" where
"123" is a series of digits. The digits will be extracted using the
regular expression and passed to preview.pl as an argument:

    /usr/local/modencode/bin/preview.pl 123 |

You can then invoke GBrowse with any of the following URLs and have the
indicated script return the appropriate data source configuration data
on its standard output:

    http: //your.host/gb2/gbrowse/modENCODE_preview_v1
    http: //your.host/gb2/gbrowse/modENCODE_preview_v2
    http: //your.host/gb2/gbrowse/modENCODE_preview_v42

## Controlling the gbrowse_details page

If a track definition's "link" option is set to AUTO, the
gbrowse_details script will be invoked when the user clicks on a feature
contained within the track. This will generate a simple table of all
feature information available in the database. This includes the
user-defined tag/value attributes set in Column 9 of the
[GFF](/wiki/GFF) for that feature.

You can control, to some extent, the formatting of the tag value table
by providing a configuration stanza with the following format:

     [feature_type:details]
     tag1 = formatting rule
     tag2 = formatting rule
     tag3 = formatting rule

"feature_type" is the type of the feature you wish to control. For
example, "gene:sgd" or simply "gene". You may also specify a
feature_type of "default" to control the formatting for all features.
"tag1", "tag2" and so forth are the tags that you wish to control the
formatting of. The tags "Name," "Class", "Type", "Source", "Position",
and "Length" are valid for all features, while "Target" and "Matches"
are valid for all features that have a target alignment. In addition,
you can use the names of any attributes that you have defined. Tags
names are NOT case sensitive, and you may use a tag named "default" to
define a formatting rule that is general to all tags (more specific
formatting rules will override less specific ones).

A formatting rule can be a string with (possible) substitution values,
or a callback. If a string, it can contain one or more of the
substitution variable "\$name", "\$start", "\$end", "\$stop",
"\$strand", "\$method", "\$type", "\$description" and "\$class", which
are replaced with the corresponding values from the current feature. In
addition, the substitution variable "\$value" is replaced with the
current value of the attribute, and the variable "\$tag" is replaced
with the current tag (attribute) name. HTML characters are passed
through.

For example, here is a simple way to boldface the Type field, italicize
the Length field, and turn the Notes into a Google search:

     [gene:details]
     Type   = <b>$value</b>
     Length = <b>$value</b>
     Note  = <a href="http://www.google.com/search?q=$value">$value</a>

If you provide a callback, the callback subroutine will be invoked with
three arguments. WARNING: the three arguments are different from the
ones passed to other callbacks, and consist of the tag value, the tag
name, and the current feature:

     Note = sub {
                my($value,$tag_name,$feature) = @_;
                do something....
                }

You can use this feature to format sequence attributes nicely. For
example, if your features have a Translation attribute which contains
their protein translations, then you are probably unsatisified with the
default formatting of these features. You can modify this with a
callback that word-wraps the value into lines of at most 60 characters,
and puts the whole thing in a \<pre\> section.



    [gene:details]
    Translation = sub {
                   my $value = shift;
                   $value =~ s/(\S{1,60})/$1\n/g;
                   "<pre>$value</pre>";
                }

## Linking out from gbrowse_details

The formatting rule mechanism described in the previous section is the
recommended way of creating a link out from the gbrowse_details page.
However, an older mechanism is available for backward compatibility.

To use this legacy mechanism, create a stanza header named
\[TagName:DETAILS\], where TagName is the name of the tag (attribute
name) whose values you wish to turn into URLs, and where DETAILS must be
spelled with capital letters. Put the option "URL" inside this stanza,
containing a string to be transformed into the URL.

For example, to link to a local cgi script from the following
[GFF2](/wiki/GFF2) line:

    IV     curated exon    518     550     . + .   Transcript B0273.1; local_id 11723

one might add the following stanza to the configuration file:

       [local_id:DETAILS]
       URL   = http://localhost/cgi-bin/localLookup.cgi?tag=$tag;id=$value

The URL option's value should be a URL containing one or more variables.
Variables begin with a dollar sign (\$), and are replaced at run time
with the information relating to the selected feature attribute.
Recognized variables are:

        $tag        The "tag" of the tag/value pair
        $value      The "value" of the tag/value pair

The value of URL can also be an anonymous subroutine, in which case the
subroutine will be invoked with a two-element argument list consisting
of the name of the tag and its value. This example, provided by Cyril
Pommier, will convert Dbxref tags into links to NCBI, provided that the
value of the tag looks like an NCBI GI number:

    [Dbxref:DETAILS]
    URL = sub {
          my ($tag,$value)=@_;
          if ($value =~ /NCBI_gi:(.+)/){
           return "http://www.ncbi.nlm.nih.gov/gquery/gquery.fcgi?term=$1";
           }
           return;
         }

## Restricting Access to Data Sources and Tracks with Usernames and Passwords

See: [GBrowse
Configuration/Authentication](/wiki/GBrowse_Configuration/Authentication)

## Configuring Balloon Tooltips

See: [GBrowse
Configuration/Balloons](/wiki/GBrowse_Configuration/Balloons).

## Generating Static Images: PNGs, SVGs and PDFs

See: [GBrowse
Configuration/Images](/wiki/GBrowse_Configuration/Images).

## Describing a GBrowse data source using structured meta-data

If you wish, you can enter options into the datasource config file that
will described the data in a structured way. This in turn can be used by
automated scripts to discover the species, genomic build, the name of
the maintainer, and other descriptive information about the data source.
The information is compatible with the
<a href="http://www.dasregistry.org/" class="external text"
rel="nofollow">DAS Registration server</a> and in a coming GBrowse
release will allow GBrowse instances to automatically register
themselves so that users and automated scripts can easily find and
extract information from the browser.

To enter metadata about a particular data source, go to the \[GENERAL\]
section of its configuration file and enter a **metadata** option
formatted like this one:

     metadata =
            -description             Example GBrowse database containing information from WormBase
                     (www.wormbase.org) and modENCODE (www.modencode.org).
            -maintainer              Lincoln Stein <lincoln.stein@gmail.com>
            -created                 2010-1-4
            -modified                2009-9-1
            -authority               WS
            -coordinates_version     180
            -coordinates             http://www.dasregistry.org/coordsys/CS_DS109
            -source                  Chromosome
            -testrange               I:7385068..7387651
            -species                 Caenorhabditis elegans
            -taxid                   6239

The **metadata** option has multiple suboptions (note the required
leading whitespace in front of them):

**-description**
A free text description of the data source. It can span multiple lines.

**-maintainer**
An email address for the person or mailing list to contact concerning
issues with the data source.

**-created**,**-modified**
The creation and modification date of the resource, in the format
YYYY-MM-DD.

**-authority**,**-coordinates_version** and **-coordinates**
These fields establish the genome build and build version. The authority
is a short prefix indicating the organization that is responsible for
the build, such as "NCBI" (human), "WS" (WormBase), or SGD (Yeast), and
coordinates_version indicates the version of the build. In the example
above, therefore, the build is described as WS180. For greatest power,
you can use **-coordinates** to provide a DAS registry coordinate system
URL so that software that uses the DAS system can reliably combine
tracks from different data sources. Many coordinate systems are already
registered <a href="http://www.dasregistry.org/help_coordsys.jsp"
class="external text" rel="nofollow">at the DAS registry</a>; you may
register a new one if needed.

**-source**
This describes the type of coordinate system used, either "Chromosome"
or "Contig".

**-testrange**
This provides an example range for new users to look at.

**-species**,**-taxid**
These indicate the species name (in long binomial format) and the
<a href="http://www.ncbi.nlm.nih.gov/Taxonomy/" class="external text"
rel="nofollow">NCBI taxon id</a>.

Note that the support for automatic registration and discovery of
GBrowse data sources is not available in the 2.00 release, but is
expected to be added in a subsequent point release.

# Advanced Configuration Topics

## Maintaining the User Accounts Database

If you have the requisite modules installed (DBI, DBD::SQLite or
DBD::mysql), then **./Build install** will run a script called
"gbrowse_metadb_config.pl", which creates and initializes a user account
database for managing user logins and shared tracks. If you take
advantage of the user accounts feature (described in more detail in
[GBrowse_Configuration/Authentication](/wiki/GBrowse_Configuration/Authentication)),
you may wish to run gbrowse_metadb_config.pl periodically. It checks for
database inconsistencies, removes unused uploads, and does other routine
maintenance on the user accounts database.

## Removing Unused Sessions, Uploads and Cached Images

Over time GBrowse will accumulate unused sessions left by users who
visit once and never return. Eventually these unused sessions will use
up disk space and may adversely affect performance. The same issue
affects custom tracks (uploaded files) and cached images.

You can clean up these files using the Unix "find" command:

        cd /var/tmp/gbrowse2
        sudo -u www-data find . -type f -atime +20 -print -exec rm {} \;

This will remove all files that have not been accessed for more than 20
days. Note that the command should run as the Apache web user
("www-data" in this example). The number of days is specified with
**-atime +20**. Change 20 to some other value if you desire.

You may wish to run this as a daily cron job, either by adding it to the
web user's cron table, or by running it in root's cron table.

## Other Advanced Topics

More installation and maintenance tips, including support for next
generation sequencing data, user accounts, and more, are given in
[GBrowse 2.0 Install HOWTO#Advanced Installation
Topics](/wiki/GBrowse_2.0_Install_HOWTO.1#Advanced_Installation_Topics)

# The GBrowse2 REST API

See: [GBrowse2 REST API](/wiki/GBrowse2_REST_API) (section
under construction)

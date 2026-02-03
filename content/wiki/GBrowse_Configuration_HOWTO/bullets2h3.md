---
title: "GBrowse 1 Configuration HOWTO"
---
# GBrowse 1 Configuration HOWTO adaptor.

GBrowse needs to know the class of the reference sequences that other
features are placed on. The default is Sequence. If you want to use
another class, such as Contig, please indicate the class here (if you
don't, certain features such as the keyword search will fail):

drag and drop

If this is set to true, then code will be activated that lets the user
pick up and drag individual tracks in order to change their vertical
stacking order. For this to work, the user must have a relatively recent
browser (IE 5 or higher, Firefox 1.5 or higher) and must have JavaScript
activated.

It is off by default for compatibility with older browsers.

disable wildcards
Ordinarily a user can type in "YAL\*" to find all features with names
beginning with "YAL". This option, if set to a true value, disables
wildcard searching.
merge searches
If this is set to true (the default), then features with the same name,
chromosome and type will be merged into one feature during searches. If
this is set to false (zero), then no merging will occur. Set this to
true (1) if searches are returning many results, and to false (0) if
searches are returning too few. (This option was added in version 1.70).

max segment, min segment

These options control the size of segments that will be shown in the
detailed view.

The max segment option sets an upper bound on the maximum size segment
that will be displayed on the detailed view. Its value is in the
selected units. Above this limit, the user will be prompted to select a
smaller region on the birds-eye view. The default is 1,000,000 base
pairs.

If the user tries to view a segment smaller than the `min segment`
option, then the segment will be resized to be this size. The default is
20 bp.

default segment
The default segment option sets the width of the segment (bp) that will
be displayed when the user clicks on the birds-eye view without
previously having set a desired magnification. You may want to adjust
this value.
keyword search max
By default, GBrowse will limit the number of keyword search results to
1,000. The order in which the 1,000 hits are returned depends on how the
database was loaded, and so you may see odd patterns, such as only hits
on a particular chromosome being displayed. To raise the limit on
keyword search results, set `keyword search max` to the desired maximum
value.

cache time

The server will cache track images for a period of time in order to
speed up performance. After the time has expired, the cached version of
the image will not be used. This option specifies the time, in hours,
that images will be cached. The default is 1 hour.

If you are debugging your config file and want to see uncached images,
call GBrowse with the CGI option `nocache=1`. There is no equivalent
configuration option.

version

An optional numeric version for this configuration file. Every time
GBrowse runs a user's request, it checks the value of the config file
version against a version number saved in the user's settings. Of the
current version is higher than the saved version, then GBrowse will
reset the user's page session to its default values. Use this if you
want to reset all users sessions to a known working state, or to draw
their attention to a new feature you've added.

Example:

      version = 1.1

request timeout
This is the timeout value for requests. If a user requests a large
region and the request takes more than the indicated number of seconds,
then the request will timeout and the user will be advised to choose a
smaller region. The default is 60 seconds (one minute). You can make the
timeout longer or shorter than this.
head
This is content to insert into the HTML \<head\>\</head\> section. It is
the appropriate place to stick JavaScript code, etc. It can be a code
reference if you wish.

onload

This is the name of JavaScript function(s) to be called via the page
body's onload event handler. Any text included here will be used to
mark-up the \<body\> element of the HTML printed by the gbrowse script.
The onload event handler will fire **after** the page is finished
loading, so this setting will be useful for running JavaScript functions
that rely on all or part of the HTML having been loaded and interpreted
by the browser. The `onload` text must use correct JavaScript syntax.
For example:

     onload = alert('I am about to do something');doSomething('arg1','arg2')

will result in

     <body onload="alert('I am about to do something');doSomething('arg1','arg2')">

automatic classes

When the user types in a search string that is not qualified by a class
(as in `EST:yk1234.5`), GBrowse will automatically search for a matching
feature of class "Sequence". You can have it search for the name in
other classes as well by defining the `automatic classes` option.

Example:

           automatic classes = Symbol Gene Clone

When the user types in `hb3`, the browser will search first for a
Sequence feature of class hb3, followed in turn by matching features in
Symbol, Gene and Clone. The search stops when the first match is found.
Otherwise, the browser will proceed to a full text search of all the
comment fields.

search attributes (<a href="http://bioperl.org/wiki/Module:Bio::DB::SeqFeature::Store"
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a> [adaptor](../GBrowse_Adaptors) only)
When the browser has searched the name and alias of features without
success, it will do a whole database keyword search by calling the
database's `search_notes()` method. By default this will search the text
of all attributes, including such things as protein sequence. The
<a href="http://bioperl.org/wiki/Module:Bio::DB::SeqFeature::Store"
class="external text" rel="nofollow">Bio::DB::SeqFeature::Store</a>
database is a bit smarter about searching, and will only, by default,
search attributes named "Note". You can expand the search by giving a
list of attribute names to the `search attributes` option.

no search

If you don't want the "Landmark or Region" textbox to appear, set this
to true. The user will still be able to search the database by appending
`q=<search term>` to the URL.

             no search = 1

no autosearch
If this option is set to a true value, then users' previous search will
not be automatically re-executed the next time they visit GBrowse.
Instead, the previous search will be pasted into the "Landmark or
Region" box and the user will have to press "Search" to reexecute it.

das mapmaster

This option, which should appear somewhere in the `[GENERAL]` section,
indicates that the database should be made available as a
<a href="../DAS" class="mw-redirect" title="DAS">DAS</a> source. The
value of the option corresponds to the URL of the DAS reference server
for this data source, or `SELF` if this database is its own reference
server. (See <a href="http://www.biodas.org/" class="external text"
rel="nofollow">the BioDAS web site</a> for an explanation of what
reference servers are.)

Please see DAS_HOWTO for more information on using
<a href="../DAS" class="mw-redirect" title="DAS">DAS</a> with GBrowse.

proxy, http proxy, ftp proxy

If your web server is behind a firewall and needs to use a proxy in
order to access remote HTTP or FTP sites, then one or more of these
options needs to be specified in order for the "add remote annotations"
feature to work (both for file-based and
<a href="../DAS" class="mw-redirect" title="DAS">DAS</a>-based remote
annotations). `http proxy` will set the proxy to use for outgoing HTTP
connections, `ftp proxy` will set the proxy to use for outgoing FTP
connections, and "proxy" will set both. The value is the URL of the
proxy:

      proxy = http://myproxy.myorg.com:9000

session driver, session args

These options fine-tune how GBrowse manages its state-maintaining
sessions. GBrowse uses
<a href="http://search.cpan.org/perldoc?CGI::Session"
class="external text" rel="nofollow">CGI::Session</a> to store session
data on the server. By default (if neither of these options is present),
it uses CGI::Session's `file` driver and `default` serializer. The
session files are stored in the `sessions` directory underneath the
directory specified by the `tmpimages` option (e.g.
`/usr/local/apache/htdocs/gbrowse/tmpimages/sessions`).

The `session driver` option will be passed to `CGI::Session->new()` as
the first argument. It specifies the driver, serializer and ID generator
according to the syntax described in the CGI::Session manual page. The
`session args` option will be passed to `CGI::Session->new()` as the
third argument. It specifies additional parameters to be passed to the
selected driver.

For example, here is how to create session data that is stored in the
[MySQL](../MySQL) "test" database under a table named
"gbrowse_sessions." The session data will be stored in binary form by
the Storable module:

    session driver = driver:mysql;serializer:storable
    session args   = DataSource test
                     TableName  gbrowse_sessions

See the <a href="http://search.cpan.org/perldoc?CGI::Session"
class="external text" rel="nofollow">CGI::Session</a> documentation for
information about setting up the MySQL table and appropriate
permissions.

You might also want to read about
<a href="http://search.cpan.org/perldoc?CGI::Session::ID::salted_md5"
class="external text" rel="nofollow">CGI::Session::ID::salted_md5</a>
for an ID generation algorithm that should be more secure (but slightly
slower) than the default one.

You will not ordinarily need to use these settings, as the defaults seem
to work well. If you change these defaults, be sure to change them in
**all** configuration files; otherwise weird stuff will happen when
moving from one data source to another.

remember settings time

The length of time to remember page-specific settings in the format
`+NNNu`, where `NNN` is a number and `u` is a unit (`w` = weeks, `d` =
days, `M` = months). For example:

     remember settings time = +3M   # remember settings for 3 months

The users' settings, which includes uploaded files, track options and
plugin configuration, will be reset to the default if he or she fails to
visit the site within the time specified.

The default value is 1 month.

See the CGI manual page for more information on the time format.

remember cookie time
This is the length of time before the user's session cookie will stay on
disk before it expires. It should be significantly longer than
`remember settings time`. The default is 12 months.
remember source time
**Deprecated.** Use `remember cookie time` instead.

msie hack

GBrowse uses HTTP POST to transfer the current page settings to the web
server. Because of the way that Microsoft Internet Explorer caches
pages, when users of this browser press the "Back" button, MSIE will
display an annoying alert that prompts the user to reload the page.

When you set `msie hack` to a true value, GBrowse will use the GET
request when it detects MSIE in use. This will fix the "Back" button
issue, but will put very long URLs in the Location box. It is your
choice which of these is more annoying to your users.

suppress_menu
This option will cause the browser to ignore your configuration file
when building the source menu. Your sources will still be accessible by
URL using the `gbrowse/yourSource` or `gbrowse?src=yourSource` syntax.
One possible application for this feature would be to your data source
while you are testing a new configuration.

### Directory and URL Options

These options specify where GBrowse should find or put different types
of files.

- **gbrowse root**

This specifies the URL of GBrowse's static files on your server, such as
stylesheets, images and JavaScript files. The default is /gbrowse.

- **stylesheet**

Location of the stylesheet used to create the GBrowse look and feel. You
can give a relative address (e.g. "gbrowse.css"), in which case GBrowse
will look relative to the URL specified by "gbrowse root."
Alternatively, you can specify an absolute URL (e.g.
"/stylesheets/mysite.css").

*New in version 1.70:* You can specify multiple stylesheets by
separating them by spaces. You can also specify a media type by
following this format:

     stylesheet = http://www.example.com/stylesheets/lowres.css(screen)
                  http://www.example.com/stylesheets/audio.css(audio)
                  http://www.example.com/stylesheets/hires.css(paper)

- **buttons**

URL in which the various graphical buttons used by GBrowse are located.
The relative and absolute addressing rules described for "stylesheet"
apply here as well. (You will probably not need to change this.)

- **js**

URL in which the gbrowse javascript helper function files are located.
The relative and absolute addressing rules described for "stylesheet"
apply here as well. (You will probably not need to change this).

- **tmpimages**

URL of a writable directory in which GBrowse can write its temporary
images. The format is:

     tmpimages = <tmpimages_url> <tmpimages_path>

Where \<tmpimages_url\> is the directory as it appears as a URL and
\<tmpimages_path\> is the physical path to the directory as it appears
to the filesystem. Usually the physical path is just the URL with the
DocumentRoot configuration variable prepended to it, in which case only
the URL is needed. However, if the URL is defined using an Alias
directive, then the path argument is mandatory.

The tmpimages option is mandatory.

The relative and absolute addressing rules described for "stylesheet"
apply here as well.

NOTE: The path argument is ignored if gbrowse is running under modperl,
because modperl allows the URL to be translated into a physical
directory programmatically.



### Plugin Options

Plugins are a way for third party developers to add functionality to
GBrowse without changing its core source code. Plugins are stored in the
GBrowse configuration directory under the `plugins` subdirectory. See
<a href="../Plugins" class="mw-redirect" title="Plugins">plugins</a>.



- **plugins**

This is a list of plugins that you want to be available from gbrowse. A
good standard list of plugins is:

       plugins = SequenceDumper FastaDumper RestrictionAnnotator

See the contents of `conf/plugins` and `contrib/plugins` for more
plugins that you can install.

- **quicklink plugins**

This is a list of plugins that you want to appear as links in the link
bar (which includes the \[Bookmark this\] and \[Link to Image\] links).
Selecting one of these links is equivalent to choosing the plugin from
the popup menu and pressing the "Go" button. The popup will continue to
appear in the popup menu.

- **plugin_path**

By default gbrowse searches for plugins in its standard location of
conf/plugins. You can store plugins in a non-standard location by
providing this option with a space-delimited list of additional
directories to search in.

### Track Sharing Options

Users can link to their own tracks or to tracks published by other
GBrowse or <a href="../DAS" class="mw-redirect" title="DAS">DAS</a>
servers. GBrowse can also integrate with [Galaxy](../Galaxy.1).

- **allow remote callbacks**

This option, if true, allows users to place callbacks ("sub ....") in
the configuration sections of uploaded files.The callbacks will be
executed in a Safe::World compartment, which forbids access to the file
system, dangerous operations such as "exec" and "eval", and access to
anything but the Bio::Graphics::SeqFeature and Bio::Graphics::Glyph
classes. The option also affects remote annotation tracks. For this
option to work, the Safe::World module must be installed from CPAN.

- **galaxy outgoing**

If you would like GBrowse to be able to send data to the
<a href="http://main.g2.bx.psu.edu/" class="external text"
rel="nofollow">Galaxy bioinformatics analysis tool</a>, then set this
option to the URL for the Galaxy server you would like to use. A good
default is:

      galaxy outgoing = http://main.g2.bx.psu.edu/tool_runner?tool_id=TOOL_ID


Without this option, GBrowse will be able to receive and process queries
from Galaxy servers, but will not be able to initiate a connection.
(Note, this option used to be named "galaxy", which still works for
backward compatibility). \[TOOL_ID\] will be provided by Galaxy
developers.

- **galaxy incoming**

Use this option to change the URL that Galaxy will use when it tries to
fetch GFF3-formatted data from GBrowse. The default is:

      http://yourhostname/cgi-bin/gbgff

However, the default will break if the Gbrowse web server is behind a
web proxy that uses a different hostname. In this case, you will need to
set the location of the gbgff script explicitly.

- **galaxy build name**

To be most effective, Galaxy needs to know the genome build name
corresponding to the annotations contained in the current database so
that it can integrate GBrowse-generated data with other data sets. Each
species has its own build name conventions, for example "hg18" for UCSC
build number 18. Set this to the build name of your choice. If not
present, the value default to the database name.

- **remote sources**

This option allows you to add remote annotation sources to the menu of
such sources at the bottom of the main window. The format is:

         remote sources = "Menu Label 1" http://url1.host.com/etc/etc
                          "Menu Label 2" http://url2.host.com/etc/etc

## The \[TRACK DEFAULTS\] section

The track defaults section specifies default values for each track. The
following common options are recognized:

                glyph
                height
                bgcolor
                fgcolor
                fontcolor
                font2color
                strand_arrow

These options control the default graphical settings for any annotation
types that are not explicitly specified. See the section below on
controlling the settings. Any of the options allowed in the \[track\]
sections described below are allowed here.

- **label density**

When there are too many annotations on the screen GBrowse automatically
disables the printing of identifying labels next to the feature. "label
density" controls where the cutoff occurs. The value in the example
files is 25, meaning that labels will be turned off when there are more
than 25 annotations of a particular type on display at once.

- **bump density**

When there are too many annotations on the screen GBrowse automatically
disables collision control. The "bump density" option controls where the
cutoff occurs. The value in the example files is 100, meaning that when
there more than 100 annotations of the same type on the display, the
browser will stop shifting them verticially to prevent them from
colliding, but will instead allow them to overlap.

- **link**

The link option creates a default rule for creating outgoing links from
the GBrowse display. When the user clicks on a feature of interest, he
will be taken to the corresponding URL.

The link option's value should be a URL containing one or more
variables. Variables begin with a dollar sign (\$), and are replaced at
run time with the information relating to the selected annotation.
Recognized variables include:

        $name        The feature's name (group name)
        $id          The feature's id (eg, PK from a database)
        $class       The feature's class (group class)
        $method      The feature's method
        $source      The feature's source
        $ref         The name of the sequence segment (chromosome, contig)
                        on which this feature is located
        $description The feature's description (notes)
        $start       The start position of this feature, relative to $ref
        $end         The end position of this feature, relative to $ref
        $segstart    The left end of $ref displayed in the detailed view
        $segend      The right end of $ref displayed in the detailed view

For example, the wormbase.conf file uses this link rule:

        link = http://www.wormbase.org/db/get?name=$name;class=$class

At run time, if the user clicks on an EST named yk1234.5, this will
generate the URL

        http://www.wormbase.org/db/get?name=yk1234.5;class=EST

It is possible to override the global link rule on a feature-by-feature
basis. See the next section for details on this. It is also possible to
declare a subroutine to compute the proper URL dynamically. See
[Computed Options](#Computed_Options) for details.

A special link type of AUTO will cause the feature to link to the
gbrowse_details script, which summarizes information about the feature.
The default is not to link at all.

- **link_target**

By default links will replace the contents of the current window. If you
wish, you can specify a new window to pop up when the user clicks on a
feature, or designate a named window or frame to receive the contents of
the link. To do this, add the "link_target" option to the \[TRACK
DEFAULTS\] section or to a track stanza. The format is this:

          link_target = _blank

The value uses the HTML targeting rules to name/create the window to
receive the value of the link. The first time the link is accessed, a
window with the specified name is created. The next time the user clicks
on a link with the same target, that window will receive the content of
the link if it is still present, or it will be created again if it has
been closed. A target named "\_blank" is special and will always create
a new window.

The "link_target" option can also be computed dynamically. See [Computed
Options](#Computed_Options) for details.

- **title**

The title option controls the "tooltips" text that pops up when the
mouse hovers over a glyph in certain browsers. The rules for generating
titles are the same as the "link" option discussed above.The "title"
option can also be computed dynamically. See for details.

Note HTML characters such as "\<", "\>" and "&" are not automatically
escaped from the title. This lets you do neat stuff, such as create
popup menus, but also means that you need to be careful. In particular,
you must not use the quote character (") in the title, but either use
the " entity, or the single quote ('). The function CGI::escapeHTML() is
available to properly escape HTML characters in dynamically-generated
titles.

The special value "AUTO" causes a default description to appear
describing the name, type and position of the feature. This is also
assumed if the title option is missing or blank.

See CONFIGURE BALLOON TOOLTIPS for the ability to created rich tooltips
including images and links.

- **landmark_padding = 1000**

The landmark_padding option will add the indicated number of base pairs
to the right and left of all landmarks that are searched for by name.

## Track Sections

Any other \[Section\] in the configuration file is treated as a
declaration of a track. The order of track sections will become the
default order of tracks on the display (the user can change this later).
Here is a typical track declaration from yeast.conf:

    [Genes]
    feature      = gene:sgd
    glyph        = generic
    bgcolor      = yellow
    forwardcolor = yellow
    reversecolor = turquoise
    strand_arrow = 1
    height       = 6
    description  = 1
    key          = Named gene

This track is named "Genes". You may use a short mnemonic if you prefer;
this will make the URL shorter when the user bookmarks a view he or she
likes. Track names can contain almost any character, including
whitespace, but cannot contain the "-" or "+" signs because these are
used to separate track names in the URL when bookmarking. \[My Genes\]
is OK, but \[My-Genes\] is not.

As in the general configuration section, the track declaration contains
multiple name=value option pairs.

Valid options are as follows:

feature

This relates the track to one or more feature types as they appear in
the database. Recall that each feature has a method and source. This is
represented in the form method:source. So, for example, a feature of
type "gene:sgd" has the method "gene" and the source "sgd". It is
possible to omit the source. A feature of type "gene" will include all
features whose methods are "gene", regardless of the source field. It is
not possible to omit the method. It is possible to have several feature
types displayed on a single track. Simply provide the feature option
with a space-delimited list of the features you want to include. For
example:

       feature = gene:sgd stRNA:sgd

This will include features of type "gene:sgd" and "stRNA:sgd" in the
same track and display them in a similar fashion.

It isn't possible to use wild-cards or pattern matching.

remote feature

This relates the track to a remote feature track somewhere on the
Internet. The value is a http: or ftp: URL, and may correspond to a
static file of features in GFF format, gbrowse upload format, a CGI
script, or a DAS source. When this option is active, the "feature"
option and most of the glyph control options described below are
ignored, but the "citation" and "key" options are honored. Example:

    remote feature = http://www.wormbase.org/cgi-bin/das/wormbase?type=mRNA

glyph

This controls the glyph (graphical icon) that is used to represent the
feature. The list of glyphs and glyph-specific options are listed in the
section GLYPHS AND GLYPH OPTIONS. The "generic" glyph is the default.

bgcolor

This controls the background color of the glyph. The format of colors is
explained in GLYPHS AND GLYPH OPTIONS.

fgcolor

This controls the foreground color (outline color) of the glyph. The
format of colors is explained in GLYPHS AND GLYPH OPTIONS.

fontcolor

This controls the color of the primary font of text drawn in the glyph.
This is the font used for the features labels drawn at the top of the
glyph.

font2color

This controls the color of the secondary font of text drawn in the
glyph. This is the font used for the longish feature descriptions drawn
at the bottom of the glyphs.

height

This option sets the height of the glyph. It is expressed in pixels.

strand_arrow

This is a true or false value, where true is 1 and false is 0. If this
option is set to true, then the glyph will indicate the strandedness of
the feature, usually by drawing an arrow of some sort. Some glyphs are
inherently stranded, or inherently non-stranded and simply ignore this
option.

label

This is a true or false value, where true is 1 and false is 0. If the
option is set to true, then the name of the feature (i.e. its group
name) is printed above the feature, space allowing.

description

This is a true or false value, where true is 1 and false is 0. If the
option is set to true, then the description of the feature (any Note
fields) is printed below the feature, space allowing.

key

This option controls the descriptive key that is drawn in the key area
at the bottom of the image. It also appears in the checkboxes that the
end user uses to switch tracks on and off. If not specified, it defaults
to the track name.

citation

If present, this option creates a human-readable descriptive paragraph
describing the feature and how it was derived. This is the text
information that is displayed when the user clicks on the track name in
the checkbox group. The value can either be a URL, in which case
clicking on the track name invokes the corresponding URL, or a text
paragraph, in which case clicking on the track name generates a page
containing the text description. Long paragraphs can be continued across
multiple lines, provided that continuation lines begin with whitespace.

visible (Version 1.71 and higher)

This controls the default visibility of the track, and may be one of
**show**, **hide** or **collapse**. If present, this option overrides
the visibility of tracks defined in the \[general\] section under
**default tracks**.

link, title, link_target

These options are identical to the similarly-named options in the
\[GENERAL\] section, but change the rules on a track-by-track basis.
They can be used to override the global rules. To force a track not to
contain any links, use a blank value.

box_subparts

If this option is greater than zero, then gbrowse will generate imagemap
rectangles for each of the subparts of a feature (e.g. the exons within
a transcript), allowing you to link each subpart separately. The numeric
value will control the number of levels of subfeatures that the boxes
will descend into. For example, if using the "gene" glyph, set
-box_subparts to 2 to create boxes for the whole gene (level 0), the
mRNAs (level 1) and the exons (level 2).

feature_low

If this option is present, GBrowse will use the list of feature types
listed here at resolution views. (This is one of the ways that semantic
zooming is implemented.) This allows you, for example, to switch off
detailed exon, UTR, promoters and other within-the-gene features, and
just show the start and stop of the transcription unit.

global feature

If this option is present and set to a true value (e.g. "1"), GBrowse
will automatically generate a pseudo-feature that starts at the
beginning of the currently displayed region and extends to the end. This
is often used in conjunction with the "translation" and "dna" glyphs in
order to display global characteristics of the sequence. If this option
is set, then you do not need to specify a "feature" option.

group_pattern

This option lets you connect related features by dotted lines based on a
pattern match in the features' names. A typical example is connecting
the 5' and 3' read pairs from ESTs or plasmids. See GROUPING FEATURES
for details.

group_on

For Bio::DB::SeqFeature::Store databases *only*, the group_on field
allows you to group features together by display_name, target or any
other method. This is mostly useful for XY-plot data, where you may want
to dynamically group related data points together so that they share the
same vertical scaling. Example:

           group_on = display_name

(this feature is under refinement and may change in the future)

restrict
This option allows you to restrict who is allowed to view the current
track by host name, IP address or username/password. See [Authentication
& Authorization](#Authentication_.26_Authorization) for details.

category

This option allows you to group tracks into different groups on the
GBrowse display in addition to the default group called 'General'. For
example, if you wanted several tracks to be in a separate group called
"Genes", you would add this to each of the track definitions:

     category = Genes

As of GBrowse version 1.7, it is possible to create subcategories using
this syntax:

     [label1]
     category = Genes:Coding
     ...

     [label2]
     category = Genes:Non-coding

This will create a section in the tracks panel called "Genes", which
will have two subsections called "Coding" and "Non-coding". The track
named "label1" will be placed in the first section, while the track
named "label2" will be placed in the second.

Subcategories can be nested arbitrarily.

If all tracks are categorized, then the "General" category will not be
displayed. If you have used a "category tables" option in the
\[GENERAL\] section of the configuration file, then the names of the
tracks labeled with this category will be placed into a table of the
appropriate dimensions. Tracks will be placed into the table in
column-major format: you should first list stanzas for all rows of
column 1, then all rows of column 2, etc.

See the <a href="http://cloud.gmod.org/gbrowse2/tutorial/tutorial.html"
class="external text" rel="nofollow">GBrowse2 Admin Tutorial</a> for
more details.

das category, das landmark, das flatten, das subparts, das superparts, das glyph, das type
All these options pertain to exporting the GBrowse database as a DAS
data source. Please see DAS_HOWTO for more information.

A large number of glyph-specific options are also recognized. These are
described in the next section.

## Glyphs and Glyph Options

See the separate article [GBrowse
Configuration/Glyphs](../GBrowse_Configuration/Glyphs)
for this important topic.

## Adding features to the overview

You can make any set of tracks appear in the overview by creating a
stanza with a title of the format \[\<label\>:overview\], where
\<label\> is any unique label of your choice. The format of the stanza
is identical to the others, but the indicated track will appear in the
overview rather than as an option in the detailed view. For example,
this stanza adds to the overview a set of features of method "gene",
source "framework":

    [framework:overview]
    feature       = gene:framework
    label         = 1
    glyph         = generic
    bgcolor       = lavender
    height        = 5
    key           = Mapped Genes

Similarly, you can make a track appear in the region panel by appending
":region" to its name:

    [genedensity:region]
    feature       = gene_density
    glyph         = xyplot
    graph_type    = boxes
    scale         = right
    bgcolor       = red
    fgcolor       = red
    height        = 20
    key           = SNP Density



## Semantic Zooming

Sometimes you will want to change the appearance of a track when the
user has zoomed out or zoomed in beyond a certain level. To indicate
this, create a set of "length qualified" stanzas of format
\[\<label\>:\<zoom level\>\], where all stanzas share the same
\<label\>, and \<zoom level\> indicates the minimum size of the region
that the stanza will apply to. For example:

     [gene]
     feature = transcript:curated
     glyph    = dna
     fgcolor  = blue
     key      = genes
     citation = example semantic zoom track

     [gene:500]
     feature = transcript:curated
     glyph   = transcript2

     [gene:100000]
     feature = transcript:curated
     glyph   = arrow

     [gene:500000]
     feature = transcript:curated
     glyph   = generic

This series of stanzas says to use the "transcript2" glyph when the
segment being displayed is 500 bp or longer, to use the "arrow" glyph
when the segment being displayed is 100,000 bp or longer, and the
"generic" glyph when the region being displayed is 500,000 bp or longer.
For all other segment lengths (1 to 499 bp), the ordinary \[gene\]
stanza will be consulted, and the "dna" glyph will be displayed. The
bare \[gene\] stanza is used to set all but the "feature" options for
the other stanzas. This means that the fgcolor, key and citation options
are shared amongst all the \[gene:XXXX\] stanzas, but the "feature"
option must be repeated.

You can override any options in the length qualified stanzas. For
example, if you want to change the color to red in when displaying genes
on segments between 500 and 99,999 bp, you can modify the \[gene:500\]
stanza as follows:

     [gene:500]
     feature = transcript:curated
     glyph   = transcript2
     fgcolor = red

It is also possible to display different features at different zoom
levels, although you should handle this potentially confusing feature
with care.

If you wish to turn off a track entirely, you can use the "hide" flag to
hide the track when the display exceeds a certain size:

     [6_frame_translation:50000]
     hide = 1



## Computed Options

Some options can be computed at run time by using Perl subroutines as
their values. These are known as "callbacks." Currently this works with
the values of the "link", "title", "link_target", "header" and "footer"
options, and any glyph-specific option that appears in a track section.

You need to know the Perl programming language to take advantage of
this. The general format of this type of option is:

     option name = sub {
                 some perl code;
                 some more perl code;
                 even more perl code;
                 }

The value must begin with the sequence "sub {" in order to be recognized
as a subroutine declaration. After this, you can have one or more lines
of Perl code followed by a closing brace. Continuation lines must begin
with whitespace.

When the browser first encounters an option like this one, it will
attempt to compile it into Perl runtime code. If successful, the
compiled code will be stored for later use and invoked whenever the
value of the option is needed. (Otherwise, an error message will appear
in your server error log).

For options of type "footer" and "header", the subroutine is passed no
arguments. It is expected to produce some HTML and return it as a string
value.

For glyph-specific features, such as "bgcolor" the subroutine will be
called at run time with five arguments consisting of the feature, the
name of the option, the current part number of the feature, the total
number of parts in this feature, and the glyph corresponding to the
feature. Usually you will just look at the first argument. The return
value is treated as the value of the corresponding option. For example,
this bgcolor subroutine will call the feature's primary_tag() method,
and return "blue" if it is an exon, "orange" otherwise:

     bgcolor = sub {
             my $feature = shift;
             return "blue" if $feature->primary_tag eq 'exon';
             return "orange";
             }

See the manual page for Bio::DB::GFF::Feature for information on how to
interrogate the feature object.

For special effects, such as coloring the first and last exons
differently, you may need access to all five arguments. Here is an
example that draws the first and last parts of a feature in blue and the
rest in red:

      sub {
            my($feature,$option_name,$part_no,$total_parts,$glyph) = @_;
            return 'blue' if $part_no == 0;                # zero-based indexing!
            return 'blue' if $part_no == $total_parts-1;   # zero-based indexing!
            return 'red';
            }

If you need access to information in the parent of the feature (e.g. in
a multipart feature), you can call the glyph's parent_feature() method:

     sub {
            my($feature,$option_name,$part_no,$total_parts,$glyph) = @_;
            my $parent = $glyph->parent_feature;
            return 'blue' if $parent->name =~ /Blue\d+/;
            return 'red';
            }

The parent_feature() method was added to Bioperl on 17 April 2008. If
you are using an earlier version, parent_feature() will not be
available.

See the Bio::Graphics::Panel manual page for more details.

Callbacks for the "link", "title", and "link_target" options have a
slightly different call signature. They receive three arguments
consisting of the feature, the Bio::Graphics::Panel object, and the
Bio::Graphics::Glyph object corresponding to the current track within
the panel:

     link = sub {
                my ($feature, $panel, $track) = @_;
                ... do something
                }

Ordinarily you will only need to use the feature object. The other
arguments are useful to look up panel-specific settings such as the
pixel width of the panel or the state of the "flip" setting:

     title = sub {
             my ($feature,$panel,$track) = @_;
             my $name = $feature->display_name;
             return $panel->flip ? "$name (flipped)" : $name;
          }

### Named Subroutine References

If you use a version of BioPerl after April 15, 2003, you can also use
references to named subroutines as option arguments. To use named
subroutines, add an init_code section to the \[GENERAL\] section of the
configuration file. init_code should contain nothing but subroutine
definitions and other initialization routines. For example:

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

Then simply refer to these subroutines using the \\name syntax:

       [EST_ALIGNMENTS]
       glyph = generic
       bgcolor = \&score_color
       height  = \&score_height

You can declare global variables in the init_code subroutine if you use
"no strict 'vars';" at the top of the section:

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

## Declaring New Aggregators

The Bio::DB::GFF data model recognizes a single-level of "grouping" of
features, but doesn't specify how to use the group information to
correctly assemble the various individual components into a biological
object. Aggregators are used to assemble this information. For example,
let's say that you decide that your preferred "transcript" data model
contains three subfeature types: a set of one or more features of method
"exon", a single feature of method "TSS", and a single feature of method
"polyA". Optionally, the data model could contain a single "main
subfeature" that runs the length of the entire transcript. We might give
this feature a method of "primary_transc" (for "primary transcript.")

In a GFF file, a three-exon transcript might be represented as follows:

    Chr1 confirmed primary_transc 100 500  .  +  .  Transcript "ABC.1"
    Chr1 confirmed TSS            100 100  .  +  .  Transcript "ABC.1"
    Chr1 confirmed exon           100 200  .  +  .  Transcript "ABC.1"
    Chr1 confirmed exon           250 300  .  +  .  Transcript "ABC.1"
    Chr1 confirmed exon           400 500  .  +  .  Transcript "ABC.1"
    Chr1 confirmed polyA          500 500  .  +  .  Transcript "ABC.1"

To aggregate this, you would like to create an aggregator named
"transcript", whose "main method" is "primary_transc", and whose "sub
methods" are "TSS," "exon," and "polyA."

The way to indicate this in the configuration file is to add a "complex
aggregator" to the list of aggregators:

     aggregators = transcript{TSS,exon,polyA/primary_transc}

The format of this value is
"aggregator_name{submethod1,submethod2,.../mainmethod}".

You can now use the name of the aggregator name as the argument of the
"feature" option in a track section:

     [Transcripts]
     feature      = transcript
     glyph        = segments
     bgcolor      = wheat
     fgcolor      = black
     height       = 10
     key          = Transcripts

If you do not have a main subfeature, leave off the "/mainmethod". For
example:

     aggregators = transcript{TSS,exon,polyA}

A few formatting notes. You are free to mix simple and complex
aggregators in the "aggregator" option. For example, you can activate
the standard "clone" and "alignment" aggregators as well as the new
transcript aggregator with a line like this one:

    aggregators = clone
                  transcript{TSS,exon,polyA/primary_transc}
                  alignment

If the complex aggregator contains whitespace or apostrophes, you must
surround it with double-quotes, like this:

      "transcript{TSS,5'UTR,3'UTR,exon,polyA/primary_transc}"

Be aware that some glyphs look for particular method names when
rendering aggregated features. For example, the standard "transcript"
glyph is closely tied to the "transcript" aggregator, and looks for
submethods named "intron", "exon" and "CDS", and a main method named
"transcript."

Here is the list of available predefined aggregators:

        alignment
        clone
        coding
        transcript
        none
        orf
        waba_alignment
        wormbase_gene

To view the documentation for any of these aggregators, run the command
"perldoc Bio::DB::GFF::Aggregator::aggregator_name", where
"aggregator_name" is the name of the aggregator.

## Grouping Features

gbrowse recognizes the concept of a "group" of related features that are
connected by dotted lines. The canonical example is a pair of ESTs that
are related by being from the two ends of the same cDNA clone. However
many feature databases, including the GFF database recommended for
gbrowse, do not allow for arbitrary hierarchical grouping. To work
around this, you may specify a feature name-based regular expression
that will be used to trigger grouping.

It works like this. Say you are working with EST feature pairs and they
follow the nomenclature 501283.5 and 501283.3, where the suffix is "5"
or "3" depending on whether the read was from the 5' or 3' ends of the
insert. To group these pairs by a dotted line, specify the
"group_pattern" option in the appropriate track section:

         group_pattern =  /\.[53]$/

At render time, gbrowse will strip off this pattern from the names of
all features in the EST track and group those that have a common base
name. Hence 501283.5 and 501283.3 will be grouped together by a dotted
line, because after the pattern is removed, they will share the same
common name "501283".

This works for all embedded pattern, provided that stripping out the
pattern results in related features sharing the same name. For example,
if the convention were "est.for.501283" and "est.rev.501283", then this
grouping pattern would have the desired effect:

         group_pattern = /\.(for|rev)\./

Don't forget to escape regular expression meta-characters and to
consider the various ways in which the regular expression might break.
It is entirely possible to create an invalid regular expression, in
which case gbrowse will crash until you comment out the offending
option.



## Controlling the gbrowse_details page

If a track definition's "link" option ([see
above](#The_.5BTRACK_DEFAULTS.5D_section)) is set to AUTO, the
gbrowse_details script will be invoked when the user clicks on a feature
contained within the track. This will generate a simple table of all
feature information available in the database. This includes the
user-defined tag/value attributes set in Column 9 of the GFF for that
feature.

You can control, to some extent, the formatting of the tag value table
by providing a configuration stanza with the following format:

     [feature_type:details]
     tag1 = formatting rule
     tag2 = formatting rule
     tag3 = formatting rule

"feature_type" is the type of the feature you wish to control. For
example, "gene:sgd" or simply "gene". "tag1", "tag2", etc. are the tags
that you wish to control the formatting of. The tags "Name," "Class",
"Type", "Source", "Position", and "Length" are valid for all features,
while "Target" and "Matches" are valid for all features that have a
target alignment. In addition, you can use the names of any attributes
that you have defined. Tags names are NOT case sensitive. You may also
specify a feature_type of "default" to control the formatting for all
features (more specific formatting rules will override less specific
ones).



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

For example, to link to a local cgi script from the following GFF line:

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



## Configuring Balloon Tooltips

See: [GBrowse
Configuration/Balloons](../GBrowse_Configuration/Balloons).

## Generating Static Images: PNGs, SVGs and PDFs

See: [GBrowse
Configuration/Images](../GBrowse_Configuration/Images).

# Generating Feature Frequency Histograms

See: [GBrowse Configuration/Feature frequency
histograms](../GBrowse_Configuration/Feature_frequency_histograms)

# Internationalization

See: [GBrowse
Configuration/I18n](../GBrowse_Configuration/I18n).

# Authentication & Authorization

See: [GBrowse
Configuration/Authentication](../GBrowse_Configuration/Authentication).

# Displaying Genetic & RH Maps

GBrowse can be tweaked to make it more suitable for displaying genetic
and radiation hybrid maps.

The main issue is that the Bio::DB::GFF database expects coordinates to
be positive integers, not fractions, but genetic and RH maps use
floating point numbers. Working around this is a bit of an ugly hack.
Before loading your data you must multiply all your coordinates by a
constant power of 10 in order to convert them into integers. For
example, if a genetic map uses Morgan units ranging from 0 to 1.80, you
would multiple by 100 to create a map in ranging from 0 to 180.

Create a GFF file containing the markers in modified coordinates and
load it as usual. Now you must tell GBrowse to reverse these changes.
Enter the following options into the \[GENERAL\] section of the
configuration file:

    units = M
    unit_divider = 100

These two options tell GBrowse to use "M" (Morgan) units, and to divide
all coordinates by 100. GBrowse will automatically display the scale
using the most appropriate units, so the displayed map will typically be
drawn using cM units.



# Changing the Location of the Configuration Files

If you wish to change the location of the gbrowse.conf configuration
file directory, you must manually edit the gbrowse CGI script. Open the
script in a text editor, and find this section:

    ###################################################################
    # Non-modperl users should change this variable if needed to point
    # to the directory in which the configuration files are stored.
    #
    use constant CONF_DIR => '/usr/local/apache/conf/gbrowse.conf';
    #
    ###################################################################

Change the definition of CONF_DIR to the desired location of the
configuration files.

An alternative, for users of mod_perl only, is to add the GBrowseConf
per-directory variable to the configuration for the directory in which
the gbrowse script lives. This variable overrides the CONF_DIR value.
For example:

    <Directory /usr/local/apache/cgi-perl>
      SetHandler      perl-script
      PerlHandler     Apache::Registry
      PerlSendHeader  On
      Options         +ExecCGI
      PerlSetVar      GBrowseConf /etc/gbrowse.conf
    </Directory>



# Using DAS (Distributed Annotation System) Databases

See: [GBrowse
Configuration/DAS](../GBrowse_Configuration/DAS).

# The Bio::MOBY Browse

See: [GBrowse
Configuration/BioMOBY](../GBrowse_Configuration/BioMOBY).

# Filtering Search Results

GBrowse provides a method to filter the contents of individual tracks
based on information that can be obtained from feature attributes. For
example, suppose you have performed a blast and added all hits as
similarity features on an entry. In gbrowse, all those features can get
a little crowdy. The administrator can decide to show only the top 5 of
the blast hits. This can easily be accomplished by adding the filter
option in the conf file. It might look like this:

     [BLAST]
     feature       = blast
     glyph         = segments
     filter = sub {
                    my $feat = shift;
                    (my $rank) = $feat->get_tag_values('rank'); # persistent Bio::SeqFeature::Generic features
                    #(my $rank) = $feat->attributes('rank'); # Bio::DB::GFF::Feature
                    $rank < 6;
                  }

Another useful example is to show features coming from a plain genbank
file. When loaded into BioSQL the source becomes
'EMBL/Genbank/SwissProt'. Using the Bio::DB::Das::BioSQL adaptor you
have to pass the source to the feature option. It can be rather
difficult to distinguish all the features when they all have the same
source string. This problem can be solved using the filter option. In
the following example the difference between the features is done based
on the primary_tag

     [REGION]
     feature      = EMBL/GenBank/SwissProt
     filter       = sub {
                     my $feat = shift;
                     $feat->primary_tag =~ /region/i;
                    }
     key          = RefSeq Protein Domains

     [SIGPEPTIDE]
     feature      = EMBL/GenBank/SwissProt
     filter       = sub {
                     my $feat = shift;
                     $feat->primary_tag =~ /sig_peptide/i;
                    }
     key          = RefSeq Signal Peptide



# Invoking GBrowse URLs

See: [GBrowse Configuration/URL
schema](../GBrowse_Configuration/URL_schema).

# Important Maintenance

GBrowse creates lots of cache files as it operates, and it does not
garbage collect them automatically. To keep the cache files under
control, you should run the following cron job at regular intervals:

            cd HTDOCS/gbrowse/tmp
            find . -type f -atime +20 -print -exec rm {} \;

Be sure to replace HTDOCS with the path to your web server HTML document
root directory, and make sure that the cron job runs under has the
proper permissions to delete the files in this directory.

# Further Information

For further information, bug reports, etc, please consult the [GMOD
Mailing Lists](../GMOD_Mailing_Lists). The main
mailing list for gbrowse support is
<a href="mailto:gmod-gbrowse@lists.sourceforge.net"
class="external free"
rel="nofollow">mailto:gmod-gbrowse@lists.sourceforge.net</a>. You can
also get help on the GMOD
<a href="http://en.wikipedia.org/wiki/Internet_Relay_Chat"
class="external text" rel="nofollow">IRC</a> channel on
<a href="http://freenode.net/" class="external text"
rel="nofollow">Freenode</a>:
<a href="/wiki/irc://irc.freenode.net/#gmod" class="external free"
rel="nofollow">irc://irc.freenode.net/#gmod</a>

Have fun!

<a href="mailto:lstein@cshl.edu" class="external text"
rel="nofollow">Lincoln Stein</a> & the GMOD development team.

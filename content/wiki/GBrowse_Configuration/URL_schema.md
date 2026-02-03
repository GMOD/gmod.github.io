---
title: "GBrowse Configuration/URL schema"
---
# GBrowse Configuration/URL schema

This article describes **the public CGI parameters recognized by
GBrowse**.

*For the main GBrowse configuration article, see:
<a href="../GBrowse_Configuration" class="mw-redirect"
title="GBrowse Configuration">GBrowse Configuration</a>.*

# Invoking GBrowse URLs

By setting the parameters in the URL, you can get gbrowse to do various
useful things:

**The source argument**

The last component of the GBrowse path is the symbolic name of the data
source. For example:

      http://www.your.site/cgi-bin/gbrowse/volvox
      http://www.your.site/cgi-bin/gbrowse/yeast
      http://www.your.site/cgi-bin/gbrowse/my_testing_database

These will correspond to config files named volvox.pm, yeast.pm and
my_testing_database.pm respectively. As noted earlier, you can place
numbers in front of the configuration file names in order to adjust the
order in which they appear in the data source menu.

*NOTE: For obscure reasons involving Internet Explorer compatibility,
GBrowse will add an extra slash to the end of the URL, resulting in URLs
that look like:*

     http://www.your.site/cgi-bin/gbrowse/yeast/?q=NAB2

Don't worry about this. The URL works the same with and without the
terminal slash.

**q**

The argument "q" will set the landmark or search string:

       http://www.your.site/cgi-bin/gbrowse/yeast?q=NAB2

This will have the same effect as typing "NAB2" into the GBrowse search
box. To go immediately to the multiple hits page (which shows hits on
several overview panels), use multiple q arguments:

      http://www.your.site/cgi-bin/gbrowse/yeast?q=NAB2;q=NPY1

Alternatively, you can use a single q parameter and separate each
landmark name with a dash:

      http://www.your.site/cgi-bin/gbrowse/yeast?q=NAB2-NPY1

The rules for specifying relative offsets and object classes are the
same as in the main search field:

      http://www.your.site/cgi-bin/gbrowse/yeast?q=Gene:NAB2:1..5000


**ref, start, stop, end**

Together the "ref," "start" and "stop" arguments specify the reference
sequence and the start and end coordinates of the region of interest.
The "q" argument, if present, overrides these settings. The "end"
argument is a synonym for "stop".

**label**

The tracks to display. This parameter must contain the track names (i.e.
the names in \[brackets\] in the config file) separated by "+" or "-"
characters. For example:

      http://www.your.site/cgi-bin/gbrowse/yeast?label=ORFs-tRNAs

To use the "+" character you may have to URL escape it:

      http://www.your.site/cgi-bin/gbrowse/yeast?label=ORFs%2BtRNAs

All tracks not explicitly given by the label parameter will be closed
(disabled).

**enable**

Tracks to enable. The tracks indicated by this parameter will be opened
in addition to any tracks that were previously opened by the user. The
format is the same as label:

      http://www.your.site/cgi-bin/gbrowse/yeast?enable=ORFs-tRNAs

**disable**

Tracks to close. The tracks indicated by this parameter will be
disabled. Tracks not mentioned by this parameter will keep their
previous state. The format is the same as label:

      http://www.your.site/cgi-bin/gbrowse/yeast?disable=ORFs-tRNAs

When modifying track state, the "label" parameter is processed first,
followed by the "enable" parameter and the "disable" parameter.

**flip**

Whether to flip the display. If set to a true value (flip=1), then the
coordinates will be reversed so that forward strand features become
reverse strand features. If set to a false value (flip=0) or absent,
then the forward strand is displayed as per usual.

**width**

Set the width of the overview, region and details images, in pixels.

**region_size**

Set the length of the region covered by the "region" panel, in base
pairs.

**h_feat**

The name of a feature to highlight in the format
"\<feature_name\>@\<color_name\>". Example:

         h_feat=SKT5@blue

You may omit "@color", in which case the highlight will default to
yellow. You can specify multiple h_feat arguments in order to highlight
several features with distinct colors. Passing an argument of
h_feature=\_clear\_ will clear all feature highlighting.

**h_region**

The name of a region to highlight in the format
"\<seq_id\>:start..end@color". Example:

         h_region=Chr3:200000..250000@wheat

You may omit "@color" in which case the highlight will default to
lightgrey. You can specify multiple h_region arguments in order to
highlight multiple sequence ranges with different colors. Passing an
argument of h_region=\_clear\_ will clear all region highlighting.

**ks**

The position of the key in the detail panel. Possible values are
"between," "beneath," "left" and "right".

**sk**

The sort order of track names in the "Tracks" panel. Values are "sorted"
(alphabetically sorted by name) and "unsorted" (sorted by the order of
tracks as defined in the config file).

**add**

Upload a feature and add it in its own track. The format is
"reference+type+name+start..end", where reference is the landmark for
the coordinates (e.g. a named gene or chromosome), type is the type of
the feature, name is the name of the feature, and start..end are the
start and end coordinates. For a feature that has multiple segments, you
may use multiple start..end ranges, separated by commas. Example:

     add=chr3+miRNA+mir144+2309229..2309300,2309501..2309589

Pass multiple "add" parameters to upload several features. "add" can be
abbreviated to "a" for terseness.

**style**

Specify the style for features uploaded using "add". It is a flattened
version of the style configuration sections described in this document.
Lines are separated by "+" symbols rather than newlines. The first word
in the argument is the feature type to configure, for example "miRNA."
Subsequent option=value pairs control the glyph and glyph options. For
example, if you have added a "miRNA" annotation, then you can tell the
renderer to use a red arrow for this glyph in this way:

      style=miRNA+glyph=arrow+fgcolor=red

"style" can be abbreviated to "s" for terseness.

**track_options**

If true, open up the track configuration page.

**help**

Open up the specified help page. Possible values are:

**general**

Open the general help page

**citations**

Open up the track description & citation page

**link_image**

Open the page that describes how to generate an embedded image of the
current view

**svg_image**

The page that describes how to generate SVGs

**id**

The id is a unique session ID that will store persistent configuration
information. You do not typically need to use the id parameter except in
the circumstance in which you wish to upload an annotation file
programmatically, in which case you should choose some large
hard-to-guess number.

**Upload, upload_annotations, id:**

These three arguments must be present in order to upload a file of
external annotations to the server. "Upload" must be a true value, and
"upload_annotations" will contain the content of the uploaded file. Note
that you must POST the data using MIME type "multipart/form-data". The
"id" argument is used to associated the upload with a session. Pick some
long, hard to guess number. This will be associated stably with the
uploaded file(s). To see the upload information, provide the same number
in the "id" argument every time you access gbrowse.

**eurl**

Specify the URL of a remote annotation source to load into the database.
You should also supply an "id" argument as well, as described earlier,
in order to be able to view the annotations.

**plugin, plugin_do**

These arguments run [plugins](../GBrowse_Plugins "GBrowse Plugins"). The
"plugin" argument gives the name of the plugin to activate. The name is
the last component of the plugin package name, e.g. FastaDumper. The
"plugin_do" argument selects what to do with the plugin. Possible values
are "Configure", "Find" and "Go". "Configure" launches the plugin's
configure page, "Go" runs dumper plugins' dump operation, and "Find"
activates finder plugins' find function. For find operations, you should
in most cases pass the find string in the "q" argument, but this depends
on the particular plugin. Each plugin may have its own set of URL
arguments. A plugin's arguments are preceded by the plugin's name. For
example, the FastaDumper plugin has a parameter named "format" which
controls the output format. So to invoke this plugin and make the output
plain text, one would provide the arguments:

    http://www.your.site/cgi-bin/gbrowse/yeast?q=NUT21;plugin=FastaDumper;
                plugin_do=Go;FastaDumper.format=text

Plugins tend not to be well documented, so you may have to read through
the source code to figure out their arguments.

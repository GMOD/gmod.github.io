<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">GBrowse Configuration/URL schema</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

This article describes **the public CGI parameters recognized by
GBrowse**.

*For the main GBrowse configuration article, see:
<a href="../GBrowse_Configuration" class="mw-redirect"
title="GBrowse Configuration">GBrowse Configuration</a>.*

# <span id="Invoking_GBrowse_URLs" class="mw-headline">Invoking GBrowse URLs</span>

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
programatically, in which case you should choose some large
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

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=GBrowse_Configuration/URL_schema&oldid=17915>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](../Special:Categories "Special:Categories"):

- [GBrowse](../Category:GBrowse "Category:GBrowse")
- [HOWTO](../Category:HOWTO "Category:HOWTO")
- [Configuration](../Category:Configuration "Category:Configuration")

</div>

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">



<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces

- <span id="ca-nstab-main"><a href="URL_schema" accesskey="c"
  title="View the content page [c]">Page</a></span>
- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:GBrowse_Configuration/URL_schema&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>

<div id="right-navigation">





</div>

<div id="p-search" role="search">

### Search

<div id="simpleSearch">

</div>

</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category:FAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category:HOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">

- <span id="t-whatlinkshere"><a href="../Special:WhatLinksHere/GBrowse_Configuration/URL_schema"
  accesskey="j" title="A list of all wiki pages that link here [j]">What
  links here</a></span>
- <span id="t-recentchangeslinked"><a
  href="../Special:RecentChangesLinked/GBrowse_Configuration/URL_schema"
  accesskey="k"
  title="Recent changes in pages linked from this page [k]">Related
  changes</a></span>
- <span id="t-specialpages"><a href="../Special:SpecialPages" accesskey="q"
  title="A list of all special pages [q]">Special pages</a></span>
- <span id="t-print"><a
  href="http://gmod.org/mediawiki/index.php?title=GBrowse_Configuration/URL_schema&amp;printable=yes"
  rel="alternate" accesskey="p"
  title="Printable version of this page [p]">Printable version</a></span>
- <span id="t-permalink">[Permanent
  link](http://gmod.org/mediawiki/index.php?title=GBrowse_Configuration/URL_schema&oldid=17915 "Permanent link to this revision of the page")</span>
- <span id="t-info">[Page
  information](http://gmod.org/mediawiki/index.php?title=GBrowse_Configuration/URL_schema&action=info)</span>
- <span id="t-smwbrowselink"><a href="../Special:Browse/GBrowse_Configuration-2FURL_schema"
  rel="smw-browse">Browse properties</a></span>
- <span id="t-pdf">[Print as
  PDF](http://gmod.org/mediawiki/index.php?title=Special:PdfPrint&page=GBrowse_Configuration/URL_schema)</span>

</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 15:45 on 6 June
  2011.</span>
- <span id="footer-info-viewcount">24,729 page views.</span>
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](../GMOD:About "GMOD:About")</span>

<!-- -->

- <span id="footer-copyrightico">[<img src="http://www.gnu.org/graphics/gfdl-logo-small.png" width="88"
  height="31" alt="a GNU Free Documentation License" />](http://www.gnu.org/licenses/fdl-1.3.html)</span>
- <span id="footer-poweredbyico">[<img
  src="../../mediawiki/skins/common/images/poweredby_mediawiki_88x31.png"
  width="88" height="31" alt="Powered by MediaWiki" />](http://www.mediawiki.org/)
  [<img
  src="../../mediawiki/extensions/SemanticMediaWiki/resources/images/smw_button.png"
  width="88" height="31" alt="Powered by Semantic MediaWiki" />](https://www.semantic-mediawiki.org/wiki/Semantic_MediaWiki)</span>

<div style="clear:both">

</div>

</div>

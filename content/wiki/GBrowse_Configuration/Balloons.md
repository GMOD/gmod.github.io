---
title: "GBrowse Configuration/Balloons"
---
# GBrowse Configuration/Balloons

This article describes **popup balloons** and how to configure them in
[GBrowse](../GBrowse.1 "GBrowse").

For the main GBrowse configuration article, see:

- <a href="../GBrowse_Configuration" class="mw-redirect"
  title="GBrowse Configuration">GBrowse Configuration</a> or
- [GBrowse 2.0 HOWTO](../GBrowse_2.0_HOWTO "GBrowse 2.0 HOWTO").

See also:

- <a href="../Popup_balloons" class="mw-redirect"
  title="Popup balloons">popup balloons</a>!
- [GBrowse Popup
  Balloons](../GBrowse_Popup_Balloons "GBrowse Popup Balloons")!!

See also:

- See the <a
  href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/htdocs/tutorial/tutorial.html#balloon#balloon"
  class="external text" rel="nofollow">Balloons section</a> of the <a
  href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/htdocs/tutorial/tutorial.html"
  class="external text" rel="nofollow">Administrators Tutorial</a>.



## Configuring Balloon Tooltips

GBrowse can display popup balloons when the user hovers over or clicks
on a feature. The balloons can display arbitrary HTML, either provided
in the config file, or fetched remotely via a URL. You can use this
feature to create multiple choice menus when the user clicks on the
feature, to pop up images on mouse hovers, or even to create little
embedded query forms. See
<a href="http://mckay.cshl.edu/balloons.html" class="external free"
rel="nofollow">http://mckay.cshl.edu/balloons.html</a> for examples.

In the config file for the database you wish to modify, set "balloon
tips" to a true value:

         [GENERAL]
         ...
         balloon tips = 1

Then add "balloon hover" and/or "balloon click" options to the track
stanzas that you wish to add buttons to. You can also place these
options in \[TRACK DEFAULTS\] to create a default balloon.

"balloon hover" specifies HTML or a URL that will be displayed when the
user hovers over a feature. "balloon click" specifies HTML or a URL that
will appear when the user clicks on a feature. The HTML can contain
images, formatted text, and even controls. Examples:

     balloon hover = <h2>Gene $name</h2>
     balloon click = <h2>Gene $name</h2>
                     <a href='http://www.google.com/search?q=$name'>Search Google</a><br>
                     <a href='http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=pubmed&term=$name'>Search NCBI</a><br>

Alternatively, you can populate the balloon using data from an HTML page
or dynamic CGI script running on the same server as GBrowse. This uses
AJAX; it can often speed up page loading by reducing the amount of text
that must be downloaded by the client. To dynamically load the balloon
contents from the server, use a balloon hover or balloon click option
like this:

     balloon click = /cgi-bin/get_gene_data?gene=$name

In this case, when the user clicks on the feature, it creates a balloon
whose content contains the HTML returned by the CGI script
"get_gene_data". GBrowse knows that this is a URL rather than the
contents of the balloon by looking for the leading slash. However, to
reduce ambiguity, we recommend that you prefix the URL with "url:" as
so:

     balloon click = url:/cgi-bin/get_gene_data?gene=$name

This also allows you to refer to relative URLs:

     balloon click = url:../../get_gene_data?gene=$name

It is also possible to fill the balloon with content from a remote
source. Simply specify a full URL beginning with "http:" "https:" or
"ftp:"

    balloon hover = http://www.wormbase.org/db/get?name=$name;class=gene

Note that the balloon library uses an internal \<iframe\> to populate
the balloon with the content of external URLs. This means that vertical
and horizontal scrollbars will appear if the content is too large to be
contained within the balloon. If the formatting does not look right, you
can design a custom balloon of the proper size as described in the next
section.

The usual option value substitution rules (\$name, \$start, etc) work
with balloons, as do callbacks. GBrowse will automatically escapes
single (') and double (") quotes in the values returned by the "balloon
hover" and "balloon click" options so that you don't have to worry about
them messing up the HTML.

You might also wish to specify "titles are balloons" in the \[GENERAL\]
section:

     [GENERAL]
     titles are balloons = 1

This will generate balloons on all mouse hover events, using the content
that would otherwise have been placed in the built-in browser tooltip.

There is a limited amount of balloon customization that you can perform
within the \[track\] section. If you wish the balloon to be sticky
(require the user to press the close button) even if it is a hover
balloon, then place this option in the \[track section\]:

     balloon sticky = 1

Setting "balloon sticky" to 0 will have the effect of making balloons
disappear as soon as the mouse leaves them, even if it was created by a
mouse click event.

If you are displaying content from a remote web or FTP server and you do
not like the height of the balloon, you can adjust the height with the
"balloon height" option:

     balloon height = 400

### Customizing Balloons

GBrowse supports multiple balloons with different shapes, sizes,
background images and timing properties. There is one built-in balloon,
named "balloon", which should meet most peoples' needs. However, you can
configure any number of custom balloons.

To declare two new balloons, create a "custom balloons" option in the
\[GENERAL\] section:

    custom balloons = [blue_balloon]
                      images   =  /gbrowse/images/blue_balloons
                      maxWidth = 300
                      shadow   = 0

                      [wide_balloon]
                      maxWidth = 800

This creates two new balloons. The first, named "blue_balloon" will look
for its images and icons at the local URL /gbrowse/images/blue_balloons.
It will have a maximum width of 300 pixels, and will cast no shadow. The
second, named "wide_balloon" takes all the defaults for the default
balloon, including the location of its images in the directory
/gbrowse/images/balloons, except that it has a maximum width of 800
pixels. The various balloon options are described well on the [Popup
Balloons](../Popup_Balloons "Popup Balloons") page.

To use the blue balloon rather than the standard one, format the
"balloon hover" and/or "balloon click" options like this:

     balloon click = [blue_balloon] /cgi-bin/get_gene_data?gene=$name

The \[blue_balloon\] keyword tells gbrowse to use the blue balloon for
clicks on these features. The standard balloon is called "balloon", and
so the following two options are equivalent:

     balloon click = /cgi-bin/get_gene_data?gene=$name
     balloon click = [balloon] /cgi-bin/get_gene_data?gene=$name

The images for custom balloons reside in the default location of
/gbrowse/images/balloons, unless indicated otherwise using the "images"
config option. To use custom balloon images, point "images" to a a
web-accessible directory in your document tree which contains the seven
PNG images described on the [Popup
Balloons](../Popup_Balloons "Popup Balloons") page. These images must be
named as follows:

     balloon.png     down_right.png  up_right.png
     balloon_ie.png  down_left.png   up_left.png
     close.png

Tips for creating these images can be found on [Popup
Balloons](../Popup_Balloons "Popup Balloons").



#### Delay time!

It looks like displayTime is the variable you're after, and you should
be able to set it from the GBrowse config and not muck around with js
files.

So simply adding the line displayTime = 10000 as a line in the config
should help!

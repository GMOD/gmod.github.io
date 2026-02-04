---
title: "GBrowse Configuration/Images"
---
# GBrowse Configuration/Images

This article describes **static images** and how to create them in
[GBrowse](../GBrowse.1).

For the main GBrowse configuration article, see:

- <a href="../GBrowse_Configuration" class="mw-redirect"
 title="GBrowse Configuration">GBrowse Configuration</a> or
- [GBrowse 2.0 HOWTO](../GBrowse_2.0_HOWTO).

## Generating Static Images: PNGs, SVGs and PDFs

GBrowse can create three types of static image suitable for
incorporation into posters, publications or other web pages:

- PNG -- a bitmapped format suitable for low-resolution graphics, such
 as web pages.
- SVG -- an editable vector-graphics format, suitable for posters,
 publications and other high-resolution applications.
- PDF -- the familiar document exchange format, suitable for posters,
 publications and other high-resolution applications.

All the work is handled by the *gbrowse_img* script and needs little
configuration. When the user selects a region and set of tracks to
browse, the "link to image" and "high-res image" links at the top of the
page will be automatically set to reproduce the user's view as closely
as possible. GBrowse_img customization options, including instructions
on how to embed an image in a web page so that the clickable imagemap
links are maintained, can be found
<a href="http://www.wormbase.org/db/seq/gbrowse_img"
class="external text" rel="nofollow">here</a>.

The PNG generation will work in the default installation. In order to
get SVG generation to work, you will need to install the perl SVG and
GD::SVG modules, available from
<a href="http://www.cpan.org" class="external text"

For PDF generation, you will need the perl GD and GD::SVG modules
installed, as well as a helper application called
<a href="http://www.inkscape.org/index.php" class="external text"

will convert SVG files into PDF. To install, download and install it
somewhere on the standard system path (e.g. /usr/bin). You will then
need to create two subdirectories in the web user's home directory in
order for inkscape to work properly. Assuming that the web user is
"www-data" run the following commands:

 sudo mkdir ~www-data/{.inkscape,.gnome2}
 sudo chown www-data ~www-data/{.inkscape,.gnome2}

This will create the two directories ".inkscape" and ".gnome2" in the
www-data user's home directory, and make them writable by the www-data
user.

Unfortunately, Inkscape will generate a one line warning into the server
error log every time it executes:

 (inkscape:28490): Gdk-CRITICAL **: gdk_display_list_devices: assertion `GDK_IS_DISPLAY (display)' failed

At the current time there is no known fix for this problem.

Note that Inkscape PDF generation should work properly on all platforms,
including Linux, Mac OSX and Windows. However, it has only been tested
on Linux platforms at the current time.

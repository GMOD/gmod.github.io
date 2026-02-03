---
title: "GBrowse Run Process"
---
# GBrowse Run Process


When GBrowse 2.0 is called (at { HTTP_HOST }/cgi-bin/gb2/gbrowse/{
DATABASE }/, where {HTTP_HOST} is the server on which GBrowse resides
and { DATABASE } is the name of the current genomic data set being
viewed) it runs the following process. It is described here for
developers to get used to the structure of the program.

The script that initiates the whole process is <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/Generic-Genome-Browser/trunk/cgi-bin/gbrowse?view=markup"
class="external text" rel="nofollow">/cgi-bin/gbrowse</a>. It calls
FastCGI, if applicable and sets the variables there. Then it calls the
following objects:

### Setting Globals

Then it initiates the **globals** object (containing the config details)
by calling Bio::Graphics::Browser2-\>open_globals(), which calls the
new() constructor.

### Render

Lastly, it creates a new rendering process with
Bio::Graphics::Browser2::Render::HTML-\>new(\$globals), and then run()s
it.


[Category](Special%253ACategories "Special%253ACategories"):

- [GBrowse
  Developer](Category%253AGBrowse_Developer "Category%253AGBrowse Developer")

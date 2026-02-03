---
title: "Community Annotation System"
---
# Community Annotation System

This is placeholder page for the community annotation system information
page. The live version of the CAS is running at
<a href="http://cas.gmod.org/" class="external free"
rel="nofollow">http://cas.gmod.org/</a>

You can download a copy of the currently running annotation server from
here: <a href="http://www.gmod.org/live_annotation_server.tar.bz2"
class="external free"
rel="nofollow">http://www.gmod.org/live_annotation_server.tar.bz2</a>
(it's big: 1.3GB). Be warned however that this virtual appliance is
still quite rough.

Items that are working:

- A recent (pre-1.69) instance of
  <a href="http://cas.gmod.org/cgi-bin/gbrowse/dicty"
  class="external text" rel="nofollow">GBrowse</a>, with popup balloons
  enabled, that provide:
  - A gene popup balloon that gives an 'Edit in the wiki' option
  - An overview selection balloon that gives an 'Edit in Apollo' option
- A CGI that takes a gene name and copies name, description and synonym
  data from Chado to the MediaWiki database and then redirects to the
  newly created page.
- A CGI that takes a chromosomal range and creates GAME-XML and jnlp
  files and a link to download and run Apollo WebStart.


Items that need to be addressed soon are:

- Make networking generic again (currently it is hard coded to run at
  CSHL). This should be pretty easy (writing a bash script similar to
  what Eric wrote for the original [Modware](/wiki/Modware) VM).
- Address the hard coding of stuff in the
  <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> -\>
  Mediawiki and Mediawiki -\> Chado scripts.
- ~~Hook up the cgi for generating GameXML from
  [GBrowse](/wiki/GBrowse.1) (so that the click to edit with
  [Apollo](/wiki/Apollo.1) will work).~~DONE!
- Documentation, Documentation, Documentation!

For more information or help, send email to the [GMOD Help
Desk](/wiki/GMOD_Help_Desk) at
<a href="mailto:help@gmod.org" class="external text"
rel="nofollow">help@gmod.org</a>.

---
title: "News/JBrowse 1.1 Released"
---
# News/JBrowse 1.1 Released

<a href="http://jbrowse.org/?p=56" rel="nofollow"
title="JBrowse 1.1 Released"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/25/JBrowse-announce-screenshot.png/200px-JBrowse-announce-screenshot.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/25/JBrowse-announce-screenshot.png/300px-JBrowse-announce-screenshot.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/25/JBrowse-announce-screenshot.png/400px-JBrowse-announce-screenshot.png 2x"
width="200" height="134" alt="JBrowse 1.1 Released" /></a>

<a href="http://jbrowse.org/?p=56" class="external text"

<a href="http://jbrowse.org/releases/jbrowse-1.1.zip"
class="external text" rel="nofollow">find the code here</a>.

What's new:

- **Scalability:** [JBrowse](../JBrowse.1) can now handle very
  large data tracks, including human EST/SNP tracks, or tracks of
  next-gen sequence reads. Large datasets are broken into smaller
  chunks, so there is no loading delay for big tracks.
- **Extensibility:** A Perl module (`ImageTrackRenderer.pm`) for
  creating user-drawn image tracks is now available, based on the CPAN
  <a href="http://search.cpan.org/perldoc?GD.pm" class="external text"
  rel="nofollow">GD.pm</a> module. An example program is provided,
  `draw-basepair-track.pl`, that uses this module to draw arcs over a
  sequence representing the base-pairing interactions of RNA secondary
  structure.
- **Bug fixes:** Numerous display glitches have been fixed, including
  issues with wide-screen monitors and long mostly-offscreen features.

Note: The [JSON](../Glossary#JSON) format used by 1.1 *is not
backward compatible with previous releases. If you are upgrading from an
older version of JBrowse, you will have to regenerate all the JSON files
on your server.*

See the <a href="http://jbrowse.org/?p=56" class="external text"

[Mitch Skinner](../User:MitchSkinner)

*Posted to the [GMOD News](../GMOD_News) on 2010/09/12*

- [News Items](../Category:News_Items)

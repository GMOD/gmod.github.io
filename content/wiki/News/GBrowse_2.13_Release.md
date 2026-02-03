---
title: "News/GBrowse 2.13 Release"
---
# News/GBrowse 2.13 Release

[<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/04/GBrowseLogo.png/200px-GBrowseLogo.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/04/GBrowseLogo.png/300px-GBrowseLogo.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/04/GBrowseLogo.png/400px-GBrowseLogo.png 2x"
width="200" height="47" alt="GBrowse 2.13 Released" />](../GBrowse.1)

[GBrowse](../GBrowse.1) version 2.13 has been released. 2.13
is a maintenance update to 2.12. GBrowse 2.13 and 2.12 include these
changes:

New features & enhancements

- The <a href="../DAS" class="mw-redirect" title="DAS">DAS</a> server
  and client are now functional. You will need
  <a href="http://search.cpan.org/perldoc?Bio::Das" class="external text"
  rel="nofollow">Bio::Das</a> version 1.17 and
  <a href="http://search.cpan.org/perldoc?Bio::Graphics"
  class="external text" rel="nofollow">Bio::Graphics</a> version 2.11
  for best results.
- The "import track" function now allows you to specify the URL of
  either a [BAM](../Glossary#BAM) or a BigWig file. The track
  will be displayed without physically copying the file onto the GBrowse
  server. You will need
  <a href="http://search.cpan.org/perldoc?Bio::DB::Sam"
  class="external text" rel="nofollow">Bio::DB::Sam</a> and
  <a href="http://search.cpan.org/perldoc?Bio::DB::BigWig"
  class="external text" rel="nofollow">Bio::DB::BigWig</a> for these
  features to work.
- Uploading a Wig file now generates a BigWig database for improved
  performance and scalability. This requires Bio::DB::BigWig to be
  installed.
- There is now a **Get chromosome sizes** entry in the File menu.
- Calling GBrowse with the CGI argument `action=scan` will generate a
  quick summary of track contents.
- Improved performance when working with truly huge (\>1000 track
  definition) configuration files.
- Fasta, [GFF3](../GFF3), [SAM](../Glossary#SAM) and
  wiggle dumps now include the genome build ID if that information is
  provided in the data source "metadata" configuration variable.

Bug fixes

- When [MySQL](../MySQL) is used as the back end for user
  uploads, it will no longer fail on long filenames.
- Fixed the "eurl" CGI parameter for importing data sets by their URLs.
- Fasta and GFF3 dumps are now working when invoked from the File menu.
- Fixed SAM file processing so as not to die when presented with a SAM
  @SQ header. This requires
  <a href="http://search.cpan.org/perldoc?Bio::DB::Sam"
  class="external text" rel="nofollow">Bio::DB::Sam</a> 1.20 to work
  properly.
- Fixed upload listing table so as not to duplicate track labels.
- Fixed track importation via the eurl parameter so that it works when
  the user's uploadid is empty (due to clearing cache of cookies).
- Fixed DAS server handling of the link option.

Please use the <a href="https://sourceforge.net/tracker/?group_id=27707"
class="external text" rel="nofollow">GMOD bug tracking system</a> to
report <a
href="https://sourceforge.net/tracker/?atid=391291&amp;group_id=27707&amp;func=browse"
class="external text" rel="nofollow">bugs</a> or <a
href="https://sourceforge.net/tracker/?atid=391294&amp;group_id=27707&amp;func=browse"
class="external text" rel="nofollow">feature requests</a>.

[Lincoln Stein](../User%253ALstein)



*Posted to the [GMOD News](../GMOD_News) on 2010/07/13*


- [News Items](../Category%253ANews_Items)

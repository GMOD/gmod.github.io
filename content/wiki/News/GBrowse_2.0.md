---
title: "News/GBrowse 2.0"
---
# News/GBrowse 2.0

[<img src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c2/GBrowse2Thumb.png" width="200"
height="135" alt="GBrowse" />](../GBrowse_2.0_HOWTO)

With thanks to the many people who have worked long and hard on this
project, as well as the people who found and reported bugs during the
prerelease stage, I am happy I announce that [GBrowse
2.00](../GBrowse_2.0_HOWTO) is now available for
downloading from
<a href="http://search.cpan.org/dist/GBrowse/" class="external text"

<a href="https://sourceforge.net/projects/gmod/files/"
class="external text" rel="nofollow">SourceForge</a>.

The following are highlights of the many new features that have been
added since the 1.70 release:

- A completely rewritten internal rearchitecture loads tracks
 asynchronously, providing a more responsive user experience.
- Different [database
 backends](../GBrowse_2.0_HOWTO#Database_Definitions)
 can be associated with each track, making backend management much
 simpler.
- A revamped user interface for a less cluttered and more functional
 end-user experience.
- A [UI theming system](../GBrowse_2.0_HOWTO#Themes)
 with three predefined themes, including a cool "transparent" theme.
- A custom [track upload and management
 system](../GBrowse_2.0_HOWTO#Configuring_the_Uploaded_Track_Database)
 gives users much greater control over custom tracks.
- An optional [admin
 interface](../GBrowse_2.0_HOWTO#The_Admin_Interface)
 allows an authorized user to upload and manage public tracks without
 editing config files.
- An optional [user registration and login
 system](../GBrowse_2.0_HOWTO#Configuring_the_User_Account_Database)
 allows users to register stable GBrowse accounts and to keep their
 settings and custom tracks when they move from one computer to
 another.
- Support for named subtracks (tracks within tracks) and filtering of
 those subtracks.
- Support for [next generation
 sequencing](../GBrowse_NGS_Tutorial) data.

There are also a number of features that *didn't* make it into the 2.00
release, most notably:

- The internal <a href="../DAS" class="mw-redirect" title="DAS">DAS</a>
 server does not work, although the DAS client (ability to import DAS
 tracks) does. This will be added in a 2.01 release.
- Internationalization has lagged way behind, and so most of the new
 features will be presented in English rather than in the user's
 preferred language (volunteers are needed to help with translations).

Please send help queries to the
<a href="https://lists.sourceforge.net/lists/listinfo/gmod-gbrowse"
class="external text" rel="nofollow">GBrowse mailing list</a>, and file
<a
href="https://sourceforge.net/tracker/?group_id=27707&amp;atid=391291"
class="external text" rel="nofollow">bug reports at SourceForge</a>.

On behalf of the GMOD team,

[Lincoln Stein](../User:Lstein)

*Posted to the [GMOD News](../GMOD_News) on 2010/01/28*

- [News Items](../Category:News_Items)

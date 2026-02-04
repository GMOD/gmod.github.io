---
title: "DBD::mysql on the Mac"
---
# DBD::mysql on the Mac

## Problems in the CPAN installer

This may have been fixed, but as of August 1, 2007: The CPAN installer
for DBD::mysql fails due to inability to find the proper locations for
various mysql configuration files. Some possible solutions are on <a
href="http://jayallen.org/journey/2006/04/dbd-mysql-build-problems-on-mac-book-pro"
class="external text" rel="nofollow">Jay Allen's blog</a>.

On a new Mac mini, getting this to work involved the manual rebuild
described in the post, and making a symlink to the config as described
in the comments.

- *Typically, installing DBD\* modules via the cpan shell is difficult,
 as tests will frequently require a connection to the database via a
 non-root account (that is, your real account that has permission to
 read, write and create databases). The stuff that Jay Allen mentioned
 about having to set lib and include directories should be handled
 properly by the* perl Makefile.PL *command, but apparently not in this
 case.* Scott 13:49, 6 August 2007 (EDT)

---
title: "News/GBrowse Version 2.40 Released"
---
# News/GBrowse Version 2.40 Released

GBrowse version 2.40 is now available for downloading from <a
href="http://sourceforge.net/projects/gmod/files/Generic%20Genome%20Browser/GBrowse-2.40/GBrowse-2.40.tar.gz/download"
class="external text" rel="nofollow">SourceForge</a> and CPAN.

Here is the recent changelog:

- Quash a few uninitialized variable warnings when bringing up track
  configuration dialog.
- Fix inability to toggle visibility & favorite status of plugin tracks
  from the track titlebar.
- Added caching of inverted configuration file data structure to speed
  up track rendering on really huge configuration files with many
  stanzas. Cache structure is stored in
  /tmp/bio_graphics_ff_cache\_\$UID
- Add ability to save and restore named snapshots of current state.
- Changed behavior of render slave to a prefork model. Activate by
  including PREFORK=5 (or other desired number of servers) in
  /etc/default/gbrowse-slave.
- Added support script for Amazon cloud image: gbrowse_attach_slaves.pl
  creates slave instances for AMI ami-c6ca31af.
- Change default tmpfile location to /var/tmp/gbrowse2 (was
  /tmp/gbrowse2).

The most significant change is actually the third from the top, which
improves speed dramatically when used with data sources that have lots
of complex track definitions.

[Lincoln Stein](../User%253ALstein "User%253ALstein")



*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2011/09/30*


- [News Items](../Category%253ANews_Items "Category%253ANews Items")

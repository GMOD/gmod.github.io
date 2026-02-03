---
title: "GBrowse karyotype"
---
# GBrowse karyotype

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/eb/Gbrowse_karyotype_labels.png" width="537"
height="200" alt="Gbrowse karyotype labels.png" />

<a href="http://mckay.cshl.edu/cgi-bin/gbrowse_karyotype"
class="external text" rel="nofollow">GBrowse Karyotype documentation and
demo installation</a>

## Note on installation

- GBrowse_karyotype is not part of the [GBrowse](/wiki/GBrowse.1)
  distribution
- It should be
  <a href="http://gmod.svn.sourceforge.net/viewvc/gmod/GBrowse_karyotype"
  class="external text" rel="nofollow">checked out from Subversion</a>,
  or downloaded from
  <a href="http://mckay.cshl.edu/downloads/GBrowse_karyotype.tar.gz"
  class="external text" rel="nofollow">here</a>.
- Install as you would GBrowse, **after** you have installed GBrowse
  1.69, or 1.68, or a
  <a href="/wiki/SVN" class="mw-redirect" title="SVN">SVN</a> checkout of the
  'stable' branch
    cd GBrowse_karyotype
    perl MakeFile.PL
    make install

## Cytoband Data

[Follow this
link](/wiki/GBrowse_karyotype_ideogram.pl) for
an example of a Perl script that will download and format cytband data
from EnsEMBL

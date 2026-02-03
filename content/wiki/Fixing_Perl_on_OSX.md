---
title: "Fixing Perl on OSX"
---
# Fixing Perl on OSX

One of the Security Updates to Mac OSX 10.5 caused problems for Perl.
See

- <a
  href="http://www.theregister.co.uk/2009/02/16/apple_update_perl_breakage/"
  class="external free"
  rel="nofollow">http://www.theregister.co.uk/2009/02/16/apple_update_perl_breakage/</a>
- <a href="http://www.macosxhints.com/article.php?story=20090219082024982"
  class="external free"
  rel="nofollow">http://www.macosxhints.com/article.php?story=20090219082024982</a>

What seems to have happened is that Apple replaced some Perl modules
with their older versions. These need to be reinstalled from source to
get cpan and other things to work. Which modules need to be replaced
seems to depend on what was updated on your system and when. Generally,
you can figure out which modules you need by examining the error
messages you get when installing. I had to manually reinstall IO,
Scalar-List-Utils, Compress-Raw-Zlib, and Compress-Zlib from the tar
distributions.

The general process is illustrated by how to reinstall IO

      mkdir -p /SourceCache
      cd /SourceCache
      curl -O http://cpan.mirror.solnet.ch/authors/id/G/GB/GBARR/IO-1.2301.tar.gz
      tar xzf IO-1.2301.tar.gz
      cd IO-1.2301
      perl Makefile.PL
      make
      make install

This was copied from an Apple discussion forum. There's nothing special
about using /SourceCache as the directory for the downloaded modules. I
did have some problems with cpan mirrors failing to download the needed
code modules via curl. In most cases you can get these via ftp.

See:

- <a href="http://www.cpan.org/SITES.html" class="external free"
  rel="nofollow">http://www.cpan.org/SITES.html</a>

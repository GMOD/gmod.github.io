---
title: "News/Chado 1.23 released"
---
# News/Chado 1.23 released

From [Scott Cain](../User%253AScott):

I've just released Chado 1.23. This is a bug fix release with no changes
to the schema from the 1.22 release. If you are upgrading from Chado 1.2
or later, installing this bug fix release is easy; type the following
commands:

      perl Makefile.PL
      make
      sudo make install

If you're installing from before Chado 1.2, you can add

      make update

which should update the schema (after backing up your database, of
course). See [Updating Chado](../Updating_Chado) for
more information. Chado 1.23 can be
<a href="https://sourceforge.net/projects/gmod/files/gmod/chado-1.23/"
class="external text" rel="nofollow">downloaded from SourceForge</a>.


Here are the changes from the last release:

- Added \$VERSION to Bio%253A%253AGMOD::DB::Config so that when installing
  Bio::DB::Das::Chado it would be happy.
- Changed all perl script \#! lines to use /usr/bin/env perl instead of
  the mishmash that was being used in various scripts.
- Fixed the GFF3 preprocessor so that if an insert into the sorting
  table fails, the script will die to avoid losing GFF lines in the
  resulting file.
- Modified Makefile.PL so that if using PREFIX it won't stomp on the
  GMOD_ROOT environment variable (that is, everything goes in PREFIX,
  except what goes in GMOD_ROOT).



*Posted to the [GMOD News](../GMOD_News) on 2012/12/13*

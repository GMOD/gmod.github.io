---
title: "Citrina"
---
# Citrina

> The item described in this page is not (or is no longer) supported by
> the GMOD project.
> This page is included only for reference purposes.

See [Status](#Status) below for more information.



  Status](#Status)
- [Description](#Description)
- [Requirements](#Requirements)
- [Documentation](#Documentation)
- [Downloads](#Downloads)
- [Mailing
  List](#Mailing_List)
- [Contact](#Contact)

## Status

This project is on hold indefinitely. Over the past couple of years I
had hoped to get back to Citrina. However, my other priorities, namely
family and work, have left little time for extracurricular coding. Until
I find time to revisit this project I suggest you try BioMaj
(<a href="http://biomaj.genouest.org/" class="external free"
rel="nofollow">http://biomaj.genouest.org/</a>). This is a fork of
Citrina 0.5.1 and it looks like they have done a nice job tweaking and
reinventing it based on the feature list.

Cheers,
Josh

## Description

Citrina (*sih-TREE-nuh*) is a database management tool that automates
the mirroring and processing of databases that are distributed via ftp
servers. It is built around the
<a href="http://en.wikipedia.org/wiki/Ant" class="extiw"
title="wp:Ant">Ant</a> java build tool making it very flexible and
portable. Citrina only provides the basic functionality for mirroring
but can easily be extended to do other tasks. For example, with Citrina
you could mirror the uniprot database to your local system, generate
fasta files, create the blast dbs, and run blast on a set of proteins
you are interested in. Or it can be used to transfer Chado SQL dumps
between organism sites and automatically populate the postgres database
via Ant's SQL tasks. Ant can also execute external scripts so Citrina
can take advantage of any existing processing tools that you have
already developed.



## Requirements

- Java 1.4.x (<a href="http://java.sun.com/j2se/" class="external free"
  rel="nofollow">http://java.sun.com/j2se/</a>)
- Ant 1.6.x (<a href="http://ant.apache.org" class="external text"
  rel="nofollow">http://ant.apache.org/</a>)
- Wget 1.6 or higher
  (<a href="http://www.gnu.org/software/wget/wget.html"
  class="external free"
  rel="nofollow">http://www.gnu.org/software/wget/wget.html</a>)
- GNU Tar 1.13 or higher
  (<a href="http://www.gnu.org/software/tar/tar.html" class="external free"
  rel="nofollow">http://www.gnu.org/software/tar/tar.html</a>)
- Gzip 1.3.3 or higher
  (<a href="http://www.gzip.org/" class="external free"
  rel="nofollow">http://www.gzip.org/</a>) or Bzip2 0.9.0 or higher
  (<a href="http://sources.redhat.com/bzip2/" class="external free"
  rel="nofollow">http://sources.redhat.com/bzip2/</a>)

Tar, Gzip, and Bzip2 are only needed if you need to extract files that
use those compression formats.

Citrina has only been tested on Redhat Linux 9, Solaris 2.8, and SuSe
9.1. Other Unix's including Mac OS X should also work but they have not
been tested. It will not run on Windows due to its unique use of
symbolic links.



## Documentation

<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3b/Citrina-userguide.pdf"
class="internal" title="Citrina-userguide.pdf">Citrina-userguide.pdf</a>



## Downloads

<a
href="http://prdownloads.sourceforge.net/gmod/citrina-0.5.1.tar.gz?download"
class="external text" rel="nofollow">citrina-0.5.1.tar.gz</a>

<a
href="http://prdownloads.sourceforge.net/gmod/citrina-0.5.1-src.tar.gz?download"
class="external text" rel="nofollow">citrina-0.5.1-src.tar.gz</a>



## Mailing List

<a
href="http://sourceforge.net/mailarchive/forum.php?forum=gmod-citrina"
class="external text" rel="nofollow">Citrina discussion list</a>



## Contact

[Josh Goodman](User%253AJogoodma "User%253AJogoodma") (jogoodma A\*T indiana
D\*O\*T edu )

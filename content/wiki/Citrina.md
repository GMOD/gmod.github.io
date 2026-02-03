---
title: "Citrina"
---




<span id="top"></span>




# <span dir="auto">Citrina</span>









> The item described in this page is not (or is no longer) supported by
> the GMOD project.  
> This page is included only for reference purposes.

See [Status](#Status) below for more information.

  


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Status</span>](#Status)
- [<span class="tocnumber">2</span>
  <span class="toctext">Description</span>](#Description)
- [<span class="tocnumber">3</span>
  <span class="toctext">Requirements</span>](#Requirements)
- [<span class="tocnumber">4</span>
  <span class="toctext">Documentation</span>](#Documentation)
- [<span class="tocnumber">5</span>
  <span class="toctext">Downloads</span>](#Downloads)
- [<span class="tocnumber">6</span> <span class="toctext">Mailing
  List</span>](#Mailing_List)
- [<span class="tocnumber">7</span>
  <span class="toctext">Contact</span>](#Contact)



## <span id="Status" class="mw-headline">Status</span>

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

## <span id="Description" class="mw-headline">Description</span>

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

  

## <span id="Requirements" class="mw-headline">Requirements</span>

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

  

## <span id="Documentation" class="mw-headline">Documentation</span>

<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3b/Citrina-userguide.pdf"
class="internal" title="Citrina-userguide.pdf">Citrina-userguide.pdf</a>

  

## <span id="Downloads" class="mw-headline">Downloads</span>

<a
href="http://prdownloads.sourceforge.net/gmod/citrina-0.5.1.tar.gz?download"
class="external text" rel="nofollow">citrina-0.5.1.tar.gz</a>

<a
href="http://prdownloads.sourceforge.net/gmod/citrina-0.5.1-src.tar.gz?download"
class="external text" rel="nofollow">citrina-0.5.1-src.tar.gz</a>

  

## <span id="Mailing_List" class="mw-headline">Mailing List</span>

<a
href="http://sourceforge.net/mailarchive/forum.php?forum=gmod-citrina"
class="external text" rel="nofollow">Citrina discussion list</a>

  

## <span id="Contact" class="mw-headline">Contact</span>

[Josh Goodman](User%253AJogoodma "User%253AJogoodma") (jogoodma A\*T indiana
D\*O\*T edu )




[Category](Special%253ACategories "Special%253ACategories"):

- [Unsupported](Category%253AUnsupported "Category%253AUnsupported")






## Navigation menu









### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>




### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Citrina" rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:19 on 11 September
  2009.</span>
<!-- - <span id="footer-info-viewcount">32,999 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





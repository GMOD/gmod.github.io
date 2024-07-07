



<span id="top"></span>




# <span dir="auto">Java Testing - by Jon Slenk</span>






Jump to: [navigation](#mw-navigation), [search](#p-search)


### <span id="Abstract" class="mw-headline">Abstract</span>

Good software cannot be written in the absence of testing. A range of
testing methods exists, each with specific reasons for use. In this
document we present arguments in favor of adopting ever more testing in
the software development and maintenance lifecycles, and resources which
may be utilized during such adoption.

Arguments in Favor of Testing There are many examples of computer system
failures, from simple every-day desktop application issues to more
physically dramatic failures \[2\]. Not all bugs cause the loss of
billions of dollars yet one must admit the significance of a bug can be
tremendous for the effected community; as bugs obstruct the goals of a
system they become increasingly serious. Testing is widely accepted as a
core tool used in the activity of finding bugs before they can do actual
damage. Thus testing can be used to find failures which, if left
undetected until later (let alone unresolved), would prevent the
achievement of critical goals.

In the case of the Generic Model Organism Database (GMOD) project, a
core goal is to produce reusable components which would allow a new
Model Organism Database (MOD) to be assembled by mixing components from
GMOD \[4\]. Clearly, to meet such goals the given components must be
free from defects which would prevent new developers from using them.
(There are, of course, <a
href="http://www.stickyminds.com/sitewide.asp?sid=1&amp;sqry=%2AZ%28SM%29%2AJ%28ARTCOL%29%2AR%28createdate%29%2AK%28articlesandpapers%29%2AF%28%7E%29%2AX%28sqeorig%29%2A&amp;sidx=8&amp;sopp=10&amp;ObjectId=9854&amp;Function=DETAILBROWSE&amp;ObjectType=ART"
class="external text" rel="nofollow">several other criteria</a> to be
applied when deciding if given software meets one's needs but those are
outside the scope of this document.) Thus, we examine specific subjects
and tools which may be used to achieve goals via testing.

### <span id="Targets_of_Testing_for_GMOD" class="mw-headline">Targets of Testing for GMOD</span>

A simple description of the two most important questions regarding GMOD
software is: "When will its development be completed?" and "Does it
work?" These two issues are greatly intertwined, and all of the tools
and techniques listed below may be employed in developing answers to
those questions.

**Documentation**: If a system is opaque to those adopting it, they will
face more roadblocks and will be more likely to abandon it. Thus,
creating, maintaining and generating documentation are important
activities in the software development process. Built into several tools
are tests of coverage to help ensure at least a minimal documentation
set. (Javadoc \[5\])

**Program execution - Logging, Debuggers**: When bugs do arise, one must
analyze the system to determine how the bug was triggered. Logging and
interactive debuggers give one information vital to the analysis. (JSwat
Log4J \[16\]).

**Program execution - Profiling**: Bugs may be of many classifications.
It may be the case that while a software system eventually gives correct
results, it does not do so in a manner that is acceptable to end users
i.e. it requires too many computing resources. Software profilers help
investigate system behaviour to determine what bottlenecks exist.
(Profiling \[15\])

**Program behaviour - Unit tests**: We must realize that software
undergoes constant change. Thus, tests which were previously run quickly
become invalidated. Additionally, software development is quite often a
result of teamwork and thus changes made by one person or group can
impact others. Having a framework for codifying and running tests easily
is therefore of great benefit because it can be used to vet changes
soon, reducing the window of opportunity for bugs to snowball into
larger issues. (JUnit TestNG \[8\])

**Program behaviour - Specifications**: From an external perspective, if
one can specify the goals of a system then one can automatically test to
see if those goals have been met. From an internal perspective,
specifications can be used to ensure that disparate software units can
successfully interact. (JML \[14\]).

**Program behaviour - Bug triggering**: Tools exist to assist humans by
automatically running through various testing methods in an attempt to
trigger bugs. (Java PathFinder PMD \[10\], FindBugs \[11\])

**Metrics - Code coverage**: Software generally allows for choices which
means that testing of one set of particular decisions might not have
exercised another. Coverage tools assist one in determining how much of
the system is actually being exercised. (Code coverage Clover \[13\]).

  
**References**

<a href="http://www.internetnews.com/ent-news/article.php/1450161"
class="external free"
rel="nofollow">http://www.internetnews.com/ent-news/article.php/1450161</a>

\[2\] <a href="http://www.esa.int/esaCP/Pr_33_1996_p_EN.html"
class="external free"
rel="nofollow">http://www.esa.int/esaCP/Pr_33_1996_p_EN.html</a>

<a href="http://en.wikipedia.org/wiki/Software_testing"
class="external free"
rel="nofollow">http://en.wikipedia.org/wiki/Software_testing</a>

\[4\] <a href="http://www.genome.org/cgi/content/full/12/10/1599"
class="external free"
rel="nofollow">http://www.genome.org/cgi/content/full/12/10/1599</a>

Resources Javadoc:
<a href="http://java.sun.com/j2se/javadoc" class="external free"
rel="nofollow">http://java.sun.com/j2se/javadoc</a> \[6\]

JSwat debugger:
<a href="http://www.bluemarsh.com/java/jswat" class="external free"
rel="nofollow">http://www.bluemarsh.com/java/jswat</a>

JUnit unit testing framework:
<a href="http://www.junit.org/index.htm" class="external free"
rel="nofollow">http://www.junit.org/index.htm</a> \[8\]

TestNG expanded unit testing framework:
<a href="http://www.beust.com/testng" class="external free"
rel="nofollow">http://www.beust.com/testng</a>

Java PathFinder:
<a href="http://javapathfinder.sourceforge.net" class="external free"
rel="nofollow">http://javapathfinder.sourceforge.net</a> \[10\]

PMD (Java 'lint'):
<a href="http://pmd.sourceforge.net" class="external free"
rel="nofollow">http://pmd.sourceforge.net</a>

FindBugs:
<a href="http://findbugs.sourceforge.net" class="external free"
rel="nofollow">http://findbugs.sourceforge.net</a> \[12\]

Code coverage:
<a href="http://java-source.net/open-source/code-coverage"
class="external free"
rel="nofollow">http://java-source.net/open-source/code-coverage</a>

Clover:
<a href="http://www.cenqua.com/clover/index.html" class="external free"
rel="nofollow">http://www.cenqua.com/clover/index.html</a> \[14\]

JML modeling:
<a href="http://www.cs.iastate.edu/%7Eleavens/JML" class="external free"
rel="nofollow">http://www.cs.iastate.edu/%7Eleavens/JML</a>
<a href="http://www.cs.iastate.edu/~leavens/JML" class="external free"
rel="nofollow">http://www.cs.iastate.edu/~leavens/JML</a>

Profiling: <a href="http://java-source.net/open-source/profilers"
class="external free"
rel="nofollow">http://java-source.net/open-source/profilers</a> \[16\]

Log4J:
<a href="http://logging.apache.org/log4j/docs" class="external free"
rel="nofollow">http://logging.apache.org/log4j/docs</a>

Extras Article regarding <a
href="http://www.stickyminds.com/sitewide.asp?sid=1&amp;sqry=%2AZ%28SM%29%2AJ%28ARTCOL%29%2AR%28createdate%29%2AK%28articlesandpapers%29%2AF%28%7E%29%2AX%28sqeorig%29%2A&amp;sidx=10&amp;sopp=10&amp;ObjectId=9860&amp;Function=DETAILBROWSE&amp;ObjectType=ART"
class="external text" rel="nofollow">code rot</a>




[Categories](Special%3ACategories "Special%3ACategories"):

- [GMOD Developers](Category%3AGMOD_Developers "Category%3AGMOD Developers")
- [Java](Category%3AJava "Category%3AJava")






## Navigation menu



### Namespaces


- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:Java_Testing_-_by_Jon_Slenk&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>


### 

### Variants[](#)








<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>


### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>




### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%3AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%3AHOWTO)</span>
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

- <span id="t-smwbrowselink"><a href="Special%3ABrowse/Java_Testing_-2D_by_Jon_Slenk"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:50 on 25 January
  2008.</span>
<!-- - <span id="footer-info-viewcount">15,632 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD%3AAbout "GMOD%3AAbout")</span>

<!-- -->





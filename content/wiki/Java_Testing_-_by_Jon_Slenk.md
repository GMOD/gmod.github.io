---
title: "Java Testing - by Jon Slenk"
---
# Java Testing - by Jon Slenk

### Abstract

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

### Targets of Testing for GMOD

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

\[2\] <a href="http://www.esa.int/esaCP/Pr_33_1996_p_EN.html"

<a href="http://en.wikipedia.org/wiki/Software_testing"

\[4\] <a href="http://www.genome.org/cgi/content/full/12/10/1599"

Resources Javadoc:
<a href="http://java.sun.com/j2se/javadoc" class="external free"

JSwat debugger:
<a href="http://www.bluemarsh.com/java/jswat" class="external free"

JUnit unit testing framework:
<a href="http://www.junit.org/index.htm" class="external free"

TestNG expanded unit testing framework:
<a href="http://www.beust.com/testng" class="external free"

Java PathFinder:
<a href="http://javapathfinder.sourceforge.net" class="external free"

PMD (Java 'lint'):
<a href="http://pmd.sourceforge.net" class="external free"

FindBugs:
<a href="http://findbugs.sourceforge.net" class="external free"

Code coverage:
<a href="http://java-source.net/open-source/code-coverage"

Clover:
<a href="http://www.cenqua.com/clover/index.html" class="external free"

JML modeling:
<a href="http://www.cs.iastate.edu/%7Eleavens/JML" class="external free"

<a href="http://www.cs.iastate.edu/~leavens/JML" class="external free"

Profiling: <a href="http://java-source.net/open-source/profilers"

Log4J:
<a href="http://logging.apache.org/log4j/docs" class="external free"

Extras Article regarding <a
href="http://www.stickyminds.com/sitewide.asp?sid=1&amp;sqry=%2AZ%28SM%29%2AJ%28ARTCOL%29%2AR%28createdate%29%2AK%28articlesandpapers%29%2AF%28%7E%29%2AX%28sqeorig%29%2A&amp;sidx=10&amp;sopp=10&amp;ObjectId=9860&amp;Function=DETAILBROWSE&amp;ObjectType=ART"
class="external text" rel="nofollow">code rot</a>

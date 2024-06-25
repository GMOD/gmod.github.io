<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">Computing Requirements</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

This page discusses high-level computing requirements and prerequisites
for implementing GMOD components at your organization. Requirements for
specific components can be found on [each component's
page](GMOD_Components "GMOD Components").

  

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span> <span class="toctext">GMOD Systems
  Administrator</span>](#GMOD_Systems_Administrator)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">Qualifications and
    Hiring</span>](#Qualifications_and_Hiring)
- [<span class="tocnumber">2</span> <span class="toctext">Hardware and
  Software</span>](#Hardware_and_Software)
  - [<span class="tocnumber">2.1</span>
    <span class="toctext">Hardware</span>](#Hardware)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Operating
    System</span>](#Operating_System)
    - [<span class="tocnumber">2.2.1</span> <span class="toctext">Unix,
      Linux, and Mac OS</span>](#Unix.2C_Linux.2C_and_Mac_OS)
    - [<span class="tocnumber">2.2.2</span>
      <span class="toctext">Windows</span>](#Windows)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Other
    Software</span>](#Other_Software)

</div>

## <span id="GMOD_Systems_Administrator" class="mw-headline">GMOD Systems Administrator</span>

The key to any successful computing infrastructure is a good systems
administrator. System administration is primarily concerned with setting
up systems and keeping them going; the job involves some programming,
but that is not its primary focus. The sysadmin is responsible for
setting up the computer systems, installing software, performing updates
and routine maintenance, and dealing with crises.

At larger organizations, such as university departments or companies,
there may be a department who take care of computer support who will
take care of installing software on public servers, setting up
databases, and so on; at minimum, they will be able to provide help and
advice with issues like network support, even if they leave the software
installation to you. It may not be necessary to have a full-time
sysadmin, but there should be someone on staff with time and expertise
to deal with any computer-related issues that may arise.

### <span id="Qualifications_and_Hiring" class="mw-headline">Qualifications and Hiring</span>

The following section lays down some of the important skills that a
systems administrator dealing with GMOD software would be expected to
have. In addition, we recommend having one of your computing support
staff interview your candidates. They are best suited to determine if a
candidate has the technical qualifications or not.

  
**Installing and Configuring Software**

Most GMOD software relies on well-established programming languages and
technologies such as [Perl](Category:Perl "Category:Perl"), CPAN,
[Java](Category:Java "Category:Java"),
[PostgreSQL](PostgreSQL "PostgreSQL"), [MySQL](MySQL "MySQL"), and
Apache. There are also a number of packages and systems that are
specific to bioinformatics, such as [BioPerl](BioPerl "BioPerl"), that
are required by several GMOD tools. Most operating systems have standard
ways of installing these packages; your sysadmin should be familiar with
how to install software and how to diagnose and fix a failed
installation.

  
**Backups**

The importance of backing up is too often a lesson that is learned after
a systems crash and massive data loss. Any good sysadmin--or even a
minimally competent one--will hold regular backups to be a fundamental
principle of life itself. Backups should be started very early, and
should be performed on a daily basis; they should also be regularly
checked to ensure that the system can be restored from the backups. The
belief in the importance of backups is more important than the technical
knowledge of how to do them, which can be learned.

Some painfully-learned advice: if you do not have a protocol to follow,
**document the steps involved in setting up software**, and **make a
backup when you have the system working**.

  
**Finding and Fixing Problems**

Computers are complex systems and diagnosing problems is part science
and part art. An ideal sysadmin will have experience with this. They may
not know the specifics of the technologies used by GMOD, but they will
have had enough experience to know, for example, that many technologies
support debuggers and logging, two things that are enormously helpful
when investigating problems.

  
**Communication**

Your sys admin needs good written and oral communication skills. They
will need to work with at least these communities:

- Biologists, inside and probably outside your organization
- Your organization's computing support staff
- GMOD community
- Their successor

Depending on the candidate's background (see
[Credentials](#Credentials)), communicating with biologists may prove
the most challenging for them. You want someone who is patient by
nature, and who won't treat biologists with contempt because they don't
know (or care) about the finer points of some technology. Ask a
candidate to explain a technical point to you and see how they respond.

The last community, "the successor," emphasizes that whoever you hire
may not have the job for the entire time your project exists. They
should be willing to document things that would be useful to whoever
follows them in the job. This includes things like where software and
data is on the file system, how backups are done, and what special
tweaks had to be done to get things to work.

A good candidate will believe in the value of documentation, and will
write *and* maintain it.

  
**Credentials and Professionalism**

Does a sysadmin need a degree in Computer Science? **No.**

Does a sysadmin need to at least be a Computer Science student? **No.**

What a candidate needs is some experience maintaining systems, an
ability to learn, and a professional attitude.

What does a *professional attitude* mean in this context?

- They should be willing to tell you when choices being made can
  compromise the project. For example:
  - Yes, we can do that, but it means our backups won't work for the
    next week. Or,
  - Yes, I can do that now, but it means I won't be able to document the
    installation I just did until next week and by then I may have
    forgotten a lot.
- They will tell you when things aren't going well, or when they have
  messed up.
- They treat everyone with respect, including people in your group, any
  users your project may have, your organization's sys admins, and the
  larger GMOD community.

  

## <span id="Hardware_and_Software" class="mw-headline">Hardware and Software</span>

### <span id="Hardware" class="mw-headline">Hardware</span>

This is somewhat dependent on the type of resource that you are setting
up, and who will be using it. Most mid- to high-end computers can be
used as a server; such a machine could easily be set up to run GBrowse
or JBrowse, a Chado database, a Galaxy server, and other web- or
intranet-based services for a small research group. If you are going to
be the only one using the tools, a laptop can easily be set up to run a
server that can run a genome browser or a database. If you are
anticipating large amounts of traffic, you will want to invest in
dedicated infrastructure such as rackmount servers and load balancing
software. In addition, there should be capacity for data and systems
backups on some medium.

Cloud computing resources are fast-emerging as a viable alternative to
in-house hardware. Whilst the software will still have to be installed
and set up, the computing resources (storage space, processing power,
input/output rates) can be adjusted as required, and much of the hassle
and worry of maintaining expensive computer hardware is eliminated.
<a href="http://wormbase.org" class="external text"
rel="nofollow">Wormbase</a> serve all their web resources from the
cloud, and [GMOD in the Cloud](Cloud.1 "Cloud") is a great way to get
started with GMOD software without the bother of installation.
Cost-wise, cloud computing compares very favourably to hosting your own
hardware, and in terms of flexibility, it cannot be beaten.

  

### <span id="Operating_System" class="mw-headline">Operating System</span>

[Operating system](Glossary#Operating_System "Glossary") (OS) choice is
the first decision you will make about your computing platform and it
impacts all subsequent decisions. The intention here is *not* to start a
debate on *what rules* or *what stinks*, but rather to advise you on the
choice of OS that will make your life easiest.

Note that the following discussion refers to the operating system used
on the machine serving the GMOD software; the operating system you use
on your personal computer is less important.

A discussion of the pros and cons of using different operating systems
in GMOD follows.

  

#### <span id="Unix.2C_Linux.2C_and_Mac_OS" class="mw-headline">Unix, Linux, and Mac OS</span>

The Unix operating system has been around since the 1970s. Linux is a
variant of Unix that has become very popular in the last decade. Mac OS
is a Unix variant with the MacOS GUI on top of it.

**Note:** People use the term *Unix* to mean slightly different things.
Sometimes they include Linux and/or MacOS and sometimes they don't. All
definitions of Unix include Unix variants that are not Linux or Mac OS.

**Linux**   
***Linux is the default operating system for GMOD and you are strongly
encouraged to use Linux for your GMOD implementation.***

Most tools are developed on and for Linux operating systems, and many
GMOD implementations use Linux as their operating system. If you need
help with something and you are running on Linux, then the majority of
the GMOD community can potentially help you with your problem. This is
much less true if you are running on a different operating system.

<!-- -->

Which Linux?   
The official
<a href="http://en.wikipedia.org/wiki/Linux_distribution" class="extiw"
title="wp:Linux distribution">Linux distributions</a> of GMOD are
<a href="http://www.centos.org" class="external text"
rel="nofollow">CentOS</a> and
<a href="http://ubuntu.com" class="external text"
rel="nofollow">Ubuntu</a>. CentOS is a Linux variant based on
<a href="http://www.redhat.com/rhel/server/" class="external text"
rel="nofollow">Red Hat Enterprise Server</a>. Ubuntu is based on
<a href="http://www.debian.org" class="external text"
rel="nofollow">Debian</a> branch of Linux. However, many other Linux
variants are compatible with GMOD.

If you don't already have Linux up and running then you are encouraged
to pick CentOS or Ubuntu, and if you are new to Linux, you will likely
find Ubuntu easier to use. If you already have another version of Linux
running and you don't want to switch then you can probably use that
distribution without problems.

<!-- -->

Mac OS   
<a href="http://www.apple.com/macosx/" class="external text"
rel="nofollow">Mac OS</a> from
<a href="http://www.apple.com" class="external text"
rel="nofollow">Apple</a> is also a Unix based operating system. Mac OS,
however, is not a Linux variant. Mac OS is built on the
<a href="http://www.freebsd.org" class="external text"
rel="nofollow">FreeBSD</a> version of Unix. Because of its different
roots, the difference between MacOS and a typical Linux distribution is
greater than the difference between any two Linux distributions. If you
run GMOD on Apples, you will need to do more work to set things up then
if you were running on Linux.

<!-- -->

Other Unix   
This category covers any non-Linux, non-Mac OS version of Unix. This
includes operating systems like Solaris, HP-UX, AIX, FreeBSD, and a
multitude of others as well. These systems are all Unix based but are
not Linux based. As such, implementing GMOD on these systems can be
done, but it will involve additional work, in the same way that MacOS
involves more work than Linux.

#### <span id="Windows" class="mw-headline">Windows</span>

While Mac OS and other Unix operating systems are fairly close to Linux,
<a href="http://microsoft.com" class="external text"
rel="nofollow">Microsoft Windows</a> is not. Windows is based on an
entirely different code base and set of principles than are Unix-based
systems, to avoid errors - optimize
<a href="http://www.top5optimizers.com/" class="external text"
rel="nofollow">windows XP</a>. There are users that run GMOD components
on Windows machines, but there are relatively few of them. Running GMOD
on Windows means significantly more work up front and greatly reduces
the part of the GMOD community that can help you if you encounter
problems.

### <span id="Other_Software" class="mw-headline">Other Software</span>

Different GMOD components require different software to support them.
Some require Perl or Java support, a database management system, a web
server (such as Apache), or any number of other things. See [each
component](GMOD_Components "GMOD Components") for their specific
software requirements.

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=Computing_Requirements&oldid=24830>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](Special:Categories "Special:Categories"):

- [Linux](Category:Linux "Category:Linux")
- [Mac OS X](Category:Mac_OS_X "Category:Mac OS X")
- [Windows](Category:Windows "Category:Windows")
- [Help](Category:Help "Category:Help")
- [Computing](Category:Computing "Category:Computing")

</div>

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">



<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces

- <span id="ca-nstab-main"><a href="Computing_Requirements" accesskey="c"
  title="View the content page [c]">Page</a></span>
- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:Computing_Requirements&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>

<div id="right-navigation">





</div>



</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>
- <span id="n-View-all-pages">[View all pages](Special:AllPages)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category:FAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category:HOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">


- <span id="t-smwbrowselink"><a href="Special:Browse/Computing_Requirements" rel="smw-browse">Browse
  properties</a></span>
- <span id="t-pdf">[Print as
  PDF](http://gmod.org/mediawiki/index.php?title=Special:PdfPrint&page=Computing_Requirements)</span>

</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 05:03 on 20 November
  2013.</span>
<!-- - <span id="footer-info-viewcount">111,606 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->

- <span id="footer-copyrightico">[<img src="http://www.gnu.org/graphics/gfdl-logo-small.png" width="88"
  height="31" alt="a GNU Free Documentation License" />](http://www.gnu.org/licenses/fdl-1.3.html)</span>


<div style="clear:both">

</div>

</div>

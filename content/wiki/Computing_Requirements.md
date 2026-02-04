---
title: "Computing Requirements"
---
# Computing Requirements

This page discusses high-level computing requirements and prerequisites
for implementing GMOD components at your organization. Requirements for
specific components can be found on [each component's
page](/wiki/GMOD_Components).

 Administrator</span>](#GMOD_Systems_Administrator)
 - [Qualifications and
 Hiring](#Qualifications_and_Hiring)
- [Hardware and
 Software](#Hardware_and_Software)
 - [Hardware](#Hardware)
 - [Operating
 System](#Operating_System)
 - [Unix,
 Linux, and Mac OS](#Unix.2C_Linux.2C_and_Mac_OS)
 - [Windows](#Windows)
 - [Other
 Software](#Other_Software)

## GMOD Systems Administrator

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

### Qualifications and Hiring

The following section lays down some of the important skills that a
systems administrator dealing with GMOD software would be expected to
have. In addition, we recommend having one of your computing support
staff interview your candidates. They are best suited to determine if a
candidate has the technical qualifications or not.

**Installing and Configuring Software**

Most GMOD software relies on well-established programming languages and
technologies such as , CPAN,
,
[PostgreSQL](/wiki/PostgreSQL), [MySQL](/wiki/MySQL), and
Apache. There are also a number of packages and systems that are
specific to bioinformatics, such as [BioPerl](/wiki/BioPerl), that
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

## Hardware and Software

### Hardware

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

cloud, and [GMOD in the Cloud](/wiki/Cloud) is a great way to get
started with GMOD software without the bother of installation.
Cost-wise, cloud computing compares very favourably to hosting your own
hardware, and in terms of flexibility, it cannot be beaten.

### Operating System

[Operating system](/wiki/Glossary#Operating_System) (OS) choice is
the first decision you will make about your computing platform and it
impacts all subsequent decisions. The intention here is *not* to start a
debate on *what rules* or *what stinks*, but rather to advise you on the
choice of OS that will make your life easiest.

Note that the following discussion refers to the operating system used
on the machine serving the GMOD software; the operating system you use
on your personal computer is less important.

A discussion of the pros and cons of using different operating systems
in GMOD follows.

#### Unix, Linux, and Mac OS

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
Which Linux?
The official
<a href="http://en.wikipedia.org/wiki/Linux_distribution" class="extiw"
title="wp:Linux distribution">Linux distributions</a> of GMOD are
<a href="http://www.centos.org" class="external text"

<a href="http://ubuntu.com" class="external text"

<a href="http://www.redhat.com/rhel/server/" class="external text"

<a href="http://www.debian.org" class="external text"

variants are compatible with GMOD.

If you don't already have Linux up and running then you are encouraged
to pick CentOS or Ubuntu, and if you are new to Linux, you will likely
find Ubuntu easier to use. If you already have another version of Linux
running and you don't want to switch then you can probably use that
distribution without problems.
Mac OS
<a href="http://www.apple.com/macosx/" class="external text"

<a href="http://www.apple.com" class="external text"

however, is not a Linux variant. Mac OS is built on the
<a href="http://www.freebsd.org" class="external text"

roots, the difference between MacOS and a typical Linux distribution is
greater than the difference between any two Linux distributions. If you
run GMOD on Apples, you will need to do more work to set things up then
if you were running on Linux.
Other Unix
This category covers any non-Linux, non-Mac OS version of Unix. This
includes operating systems like Solaris, HP-UX, AIX, FreeBSD, and a
multitude of others as well. These systems are all Unix based but are
not Linux based. As such, implementing GMOD on these systems can be
done, but it will involve additional work, in the same way that MacOS
involves more work than Linux.

#### Windows

While Mac OS and other Unix operating systems are fairly close to Linux,
<a href="http://microsoft.com" class="external text"

entirely different code base and set of principles than are Unix-based
systems, to avoid errors - optimize
<a href="http://www.top5optimizers.com/" class="external text"

on Windows machines, but there are relatively few of them. Running GMOD
on Windows means significantly more work up front and greatly reduces
the part of the GMOD community that can help you if you encounter
problems.

### Other Software

Different GMOD components require different software to support them.
Some require Perl or Java support, a database management system, a web
server (such as Apache), or any number of other things. See [each
component](/wiki/GMOD_Components) for their specific
software requirements.

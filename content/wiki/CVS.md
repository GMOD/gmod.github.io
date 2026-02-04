---
title: "Version Control System Access"
---
# Version Control System Access

(Redirected from
[CVS](/wiki/CVS)

*Subversion* (often abbreviated *SVN* is the *source code control*
system used by most of GMOD. Source code control systems, also known as
*revision control* or *version control* systems are used to record
changes to computer files. GMOD's main source code repository is at
<a href="http://gmod.svn.sourceforge.net/" class="external text"

This page explains how to both download and update the main GMOD
repository at SourceForge. For more on SVN itself see the
<a href="http://subversion.tigris.org/" class="external text"

<a href="http://svnbook.red-bean.com/" class="external text"

SVN is used by GMOD developers to update the components. SVN is also
used by some GMOD users, most of whom never modify any GMOD code. GMOD
users access SVN when they want to get component source code so they can
use the latest development version of that component, without having to
wait for the next official release. Please note, however, that
components pulled from SVN are **development** versions, and may not
always work as expected.

 Repositories</span>](#Browsing_SVN_Repositories)
- [SVN Read-only
 Access](#SVN_Read-only_Access)
- [SVN Developer
 Access](#SVN_Developer_Access)
- [Legacy CVS
 Read-only Access](#Legacy_CVS_Read-only_Access)

## Browsing SVN Repositories

GMOD SVN repositories can be browsed via web:
<a href="http://gmod.svn.sourceforge.net/gmod/" class="external free"

## SVN Read-only Access

The GMOD [SVN](/wiki/Glossary#SVN) repository can be checked out
through anonymous SVN with the following instruction set. The module you
wish to check out must be specified in place of **PROJECTNAME**.

 svn co https://gmod.svn.sourceforge.net/svnroot/gmod/PROJECTNAME/trunk

See <a href="http://gmod.svn.sourceforge.net/" class="external free"

projects in SVN repositories.

You can then get updates with the `svn update` command.

## SVN Developer Access

Developer access uses the same URLs as read-only access. When performing
write operations, you will simply be prompted for your SourceForge.net
username and password. To perform write operations, a GMOD project
administrator must have granted you write access to the repository.

## Legacy CVS Read-only Access

GMOD has migrated all projects from CVS to
<a href="http://subversion.tigris.org/" class="external text"

Subversion
Conversion](/wiki/CVS_to_Subversion_Conversion)
page.

The old GMOD [CVS](/wiki/Glossary#CVS) repositories can be checked
out through anonymous (pserver) CVS with the following instruction set.
The module you wish to check out must be specified as the *modulename*.
When prompted for a password for anonymous, simply press the Enter or
Return key.

 cvs -d:pserver:anonymous@gmod.cvs.sourceforge.net:/cvsroot/gmod login
 cvs -d:pserver:anonymous@gmod.cvs.sourceforge.net:/cvsroot/gmod co modulename

If you need to check out a particular revision/tag in the repository,
add *-r tag_name* to the command. For example, if you needed the
'stable' branch of the GBrowse repository, you would do this in your
checkout command:

 cvs -d:pserver:anonymous@gmod.cvs.sourceforge.net:/cvsroot/gmod co -r stable Generic-Genome-Browser

See <a href="http://gmod.cvs.sourceforge.net/" class="external free"

repositories.

You can then get updates with the `cvs update -d` command (the `-d`
command tells CVS to get any new directories that have been added to the
repository since the last update).

GMOD CVS repositories can also be browsed on the web:
<a href="http://gmod.cvs.sourceforge.net/gmod/" class="external free"

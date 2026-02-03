---
title: "GMODWeb"
---
# GMODWeb

> The item described in this page is not (or is no longer) supported by
> the GMOD project.
> This page is included only for reference purposes.

GMODWeb is a Web application that uses
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>, a flexible
and modular schema for representing biological data. GMODWeb is based on
[Turnkey](/wiki/Turnkey), a generic Web framework built on
<a href="http://apache.org" class="external text"
rel="nofollow">Apache</a>, mod_perl, and
<a href="http://sqlfairy.sourceforge.net/" class="external text"
rel="nofollow">SQLFairy</a>. GMODWeb takes a basic Turnkey site built
with the Chado schema and adds to the default templates to create a
custom look and feel for GMOD. This GMODWeb *skin* includes code to
display information using a variety of GMOD applications, including
[GBrowse](/wiki/GBrowse.1). New model organism databases can use the
GMODWeb skin as a starting point for creating a new organism website.
See <a
href="http://radius.genomics.ctrl.ucla.edu/turnkey/pmwiki.php?n=Main.NewMod"
class="external text" rel="nofollow">Making a New MOD</a> for more
information about his process.

## Turnkey

[Turnkey](/wiki/Turnkey) takes a relational schema of a given
database as input and transforms it into a fully-functional and
customizable website within minutes. This automated process frees
developers to work on the content of a website rather than the
underlying architectural details. For more detailed information see the
"About Turnkey" section of the
<a href="http://genome.ucla.edu/turnkey/" class="external text"
rel="nofollow">Turnkey home page</a>.


<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/1b/Turnkey.png" width="552" height="335"
alt="Turnkey.png" />



## Installation

For site administrators installing GMODWeb we recommend using the
<a href="http://biopackages.net" class="external free"
rel="nofollow">http://biopackages.net</a> RPM packages or
[CVS](/wiki/Glossary#CVS) repository located at
<a href="http://sourceforge.net/projects/turnkey" class="external free"
rel="nofollow">http://sourceforge.net/projects/turnkey</a>.

## Documentation

<a href="http://genomebiology.com/2008/9/6/R102" class="external text"
rel="nofollow">GMODWeb: a web framework for the generic model organism
database</a>,
by Brian D O'Connor, Allen Day, [Scott Cain](/wiki/User%253AScott),
Olivier Arnaiz, [Linda Sperling](/wiki/User%253ASperling) and
[Lincoln D Stein](/wiki/User%253ALstein), Genome Biology 2008,
9:R102. The publication describing GMODWeb

[GMODWeb and Package Management](https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a1/Jan2009GMODWebAndPackages.pdf)
presentation by Brian O'Connor at the [January 2009 GMOD
Meeting](/wiki/January_2009_GMOD_Meeting#GMODWeb_and_Package_Management).

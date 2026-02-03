---
title: "Modware"
---
# Modware

<a href="http://gmod-ware.sourceforge.net/" rel="nofollow"
title="Modware"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e3/ModwareLogo.png/300px-ModwareLogo.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e3/ModwareLogo.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e3/ModwareLogo.png 2x"
width="300" height="158" alt="Modware" /></a>

  Status](#Status)
- [Getting
  Started](#Getting_Started)
- [Feedback
  Wanted](#Feedback_Wanted)
- [Acknowledgments](#Acknowledgments)
- [Support](#Support)

<a href="http://gmod-ware.sourceforge.net/" class="external text"
rel="nofollow">Modware</a> is an object-oriented Perl API for
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>. It allows
object-oriented querying and loading of a
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> database and
returns data structures that a programmer can readily use without
knowing the details of how the object is stored in the relational
schema.

Many bioinformatics programmers are familiar with the
<a href="http://search.cpan.org/perldoc?Bio::SeqFeature"
class="external text" rel="nofollow">Bio::SeqFeature</a> object system
for representing biological features in BioPerl. Modware utilizes this
framework for easy programmatic access and manipulation of biological
features directly from Chado.

Please use our bug tracker on
<a href="http://sourceforge.net/tracker/?group_id=94245"
class="external text" rel="nofollow">SourceForge</a> to report bugs and
feature requests.

- For a wiki-ized version of a presentation done at the GMOD meeting in
  January 2007: [Modware
  Presentation](/wiki/Modware_Presentation)
- For a VERY quick tour of the kinds of things you can do with Modware,
  check out the
  <a href="http://gmod-ware.sourceforge.net/some_use_cases.html"
  class="external text" rel="nofollow">Examples Page</a>
- For detailed documentation on the API, check out the
  <a href="http://gmod-ware.sourceforge.net/doc/" class="external text"
  rel="nofollow">API docs</a>.
- To download Modware and [CVS](/wiki/Glossary#CVS) access, go to
  the <a href="http://sourceforge.net/projects/gmod-ware"
  class="external text" rel="nofollow">Project page</a>.
- For a general discussion of GMOD Middleware: [GMOD
  Middleware](/wiki/GMOD_Middleware)

## Status

Good news and update on the current status of Modware development.
Modware is getting back on track and is currently being actively
developed at <a href="http://dictybase.org" class="external text"
rel="nofollow">dictyBase</a> since last few months. It is being written
using
<a href="http://search.cpan.org/perldoc?Moose" class="external text"
rel="nofollow">Moose</a> and
<a href="http://search.cpan.org/perldoc?DBIx::Class"
class="external text" rel="nofollow">DBIx::Class</a> (more precisely
[Bio%253A%253AChado%253A%253ASchema](/wiki/Bio%253A%253AChado%253A%253ASchema) or BCS)
[ORM](/wiki/Glossary#ORM). This part of development is done in sync
with dictyBase's major data migration project which includes literature
and gene ontology annotations. So, the first release of this new version
is expected to deal with publication and ontology datasets in
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>. Handling of
feature module will be added after the first release gets settled down.
Like any other standard Perl module Modware's public release will be
available from CPAN and the bleeding edge can be grabbed from
<a href="http://github.com/cybersiddhu/Modware" class="external text"
rel="nofollow">github</a>.

Relevant documentations and guidelines will also be added to this wiki.
The first CPAN release is expected to be early next year.

*Siddhartha Basu, Modware developer,
[dictyBase](/wiki/Category%253ADictyBase), 2010/10/28*

## Getting Started

- Install [Chado](/wiki/Chado_-_Getting_Started)
- Install Modware, and there is an option to `make install_sample` that
  will install the Dictyostelium Genome
- Explore the API documentation and ask questions to
  <a href="mailto:gmod-ware-users@lists.sourceforge.net"
  class="external text"
  rel="nofollow">gmod-ware-users@lists.sourceforge.net</a>.



## Feedback Wanted

Recently, a VMware Virtual Machine was released to make download and
testing of a fully configured and installed version of Modware
available. Modware developers continue to add new features, including
representation of BLAST hits (currently on CVS HEAD).

One critical piece of the project that is missing is feedback from the
community. If you are interested in a Chado API, please download the
Modware Virtual Machine found on the
<a href="http://gmod-ware.sourceforge.net" class="external text"
rel="nofollow">Modware home page</a> and give it a try. Email all
feature requests, questions, and comments to
<a href="mailto:gmod-ware-users@sourceforge.net" class="external text"
rel="nofollow">gmod-ware-users@sourceforge.net</a>.



## Acknowledgments

This software was developed for dictyBase at the Center for Genetic
Medicine at Northwestern University, which is funded by NIH Grants
GM64426 and HG0022.



## Support

|
|----|----|----|----|
|  | Mailing List Link | Description | Archive(s) |
| **Modware** | <a href="https://lists.sourceforge.net/lists/listinfo/gmod-ware-users" |  |  |
class="external text" rel="nofollow">gmod-ware-users</a> | **Modware** support and developer mailing list. | <a href="http://gmod.827538.n3.nabble.com/Modware-f887754.html"
class="external text" rel="nofollow">Nabble</a> (2010/05+), <a
href="https://sourceforge.net/mailarchive/forum.php?forum_name=gmod-ware-users"
class="external text" rel="nofollow">Sourceforge</a> |

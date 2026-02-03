---
title: "GMOD Membership"
---
# GMOD Membership

This page describes how [users](#Users), [developers](#Developers), and
[software](#Software) become a part of GMOD.

  Users](#Users)
- [Developers](#Developers)
- [Software](#Software)
  - [Nomination](#Nomination)
  - [Evaluation](#Evaluation)
  - [Requirements](#Requirements)
  - [Non-GMOD
    Software](#Non-GMOD_Software)
  - [Versions](#Versions)

## Users

To become a GMOD *user*, just download, install, and start using one or
more [GMOD Components](GMOD_Components "GMOD Components"). That's it.
There is no mandatory registration process, and you don't have to meet
any set of requirements. *GMOD is open to everyone.*

You are *encouraged* to sign up to the (low-volume)
<a href="https://lists.sourceforge.net/lists/listinfo/gmod-announce"
class="external text" rel="nofollow">GMOD Announce mailing list</a>, and
to the [mailing list(s)](GMOD_Mailing_Lists "GMOD Mailing Lists") for
the components that you use. You can also subscribe to the [GMOD News
RSS feed](GMOD_News "GMOD News"). These will help keep you up to date on
both the project and the components you use.

## Developers

*Developers* are [users](#Users) who also contribute code back to the
project. In the early days of GMOD every user was also a developer. This
is no longer true, but every user can still become a developer.

There are several ways to become a developer:

- You can write fixes or additions to [GMOD
  Components](GMOD_Components "GMOD Components") that you already use,
  and then send the code (or a link to it) to the [mailing
  list(s)](GMOD_Mailing_Lists "GMOD Mailing Lists") for that component.
  If the update is widely useful, the lead developer(s) for the
  component will then fold it in to the component and your fix will be
  included in the next release.
- You can become a developer with
  *<a href="SVN" class="mw-redirect" title="SVN">commit privileges</a>*
  and directly submit your updates to the
  <a href="SVN" class="mw-redirect" title="SVN">source code repository</a>
  for that component. This is a good option if you contribute code
  frequently. To get commit privileges you need to ask one of the
  developers already working on the component.
- Finally, you can become a developer by contributing a new component to
  GMOD. See [Software](#Software) below for how to do that.

Developers are also encouraged to sign up for the
<a href="https://lists.sourceforge.net/lists/listinfo/gmod-devel"
class="external text" rel="nofollow">GMOD Developer mailing list</a>
(and maybe
<a href="https://lists.sourceforge.net/lists/listinfo/gmod-architecture"
class="external text" rel="nofollow">GMOD Architecture</a> as well).

## Software

New [software components](GMOD_Components "GMOD Components") become a
part of GMOD through a nomination and evaluation process.

### Nomination

Software can be nominated by its developers, by GMOD users, or by GMOD
staff. New components also arise from within the community.
[Bio%253A%253AChado%253A%253ASchema](Bio%253A%253AChado%253A%253ASchema "Bio%253A%253AChado%253A%253ASchema"),
[DIYA](DIYA "DIYA"), and [MAKER](MAKER.1 "MAKER") are all recent
examples of software becoming a part of GMOD.

Please contact the
<a href="mailto:help@gmod.org" class="external text" rel="nofollow">GMOD
Help Desk</a> if you would like to nominate a new component. You can
also nominate a component by posting to the [GMOD Mailing
Lists](GMOD_Mailing_Lists "GMOD Mailing Lists") that are most relevant
to the tool.

### Evaluation

Nominated software is first evaluated by GMOD staff (currently the [GMOD
Project Coordinator](User%253AScott "User%253AScott") and the [GMOD Help
Desk](GMOD_Help_Desk "GMOD Help Desk")) to see if it meets basic
[requirements](#Requirements) such as *open source licensing* and *GMOD
interoperability*. We'll also confirm a *good faith commitment of
support* on the part of the component's developers. GMOD community
members are then asked for feedback on the other requirements such as
*meeting a common need* and *useful over time*. Community members are
picked based on a known interest in the area the new tool addresses. If
appropriate, a whole [mailing
list](GMOD_Mailing_Lists "GMOD Mailing Lists") will be asked to evaluate
the software.

GMOD staff will then make a decision based on community input and
responses from the developers. The decision may be to include the
software, to not include the software, or to include the software after
additional development or documentation is done.

### Requirements

To become a part of the [GMOD suite](GMOD_Components "GMOD Components"),
software has to meet several requirements:

Meets a Common Need  
First, the program must meet a common need in biological research. A
tool that is only useful with organisms that are two-dimensional (think
butterfly wings), is probably not a good match for GMOD. Tools must be
useful across a wide range of biology, and meet a widespread need. Tools
that support <a href="Next_generation_sequencing" class="mw-redirect"
title="Next generation sequencing">next generation sequencing</a>, [gene
expression](Category%253AExpression "Category%253AExpression"),
[phenotypes](Category%253APhenotypes "Category%253APhenotypes"), or [comparative
genomics](Comparative_Genomics "Comparative Genomics") are good examples
of broadly applicable tools.
Useful Over Time  
GMOD Components should be applicable and useful for at least several
years. For example, GMOD tends to avoid *analysis* tools because this
area of bioinformatics is constantly changing. However, the need to
connect different analysis tools into reusable pipelines (see
<a href="Ergatis" class="mw-redirect" title="Ergatis">Ergatis</a> and
[Galaxy](Galaxy.1 "Galaxy") for examples), is a common and longstanding
need that will outlive any particular too.
Configurable and Extensible  
GMOD tools should be usable in a wide variety of situations. Different
user environments will require different configurations of the software.
GMOD components should make it easy for users to do this tailoring in
configuration files - they should generally not have to change the
source code itself to get what they want. Another (complementary) way to
achieve this is to have an extensible architecture where computer-savvy
users can write plugins/extensions for tasks such as input/output using
custom/local data sources and formats.
Open Source License for All Users  
New GMOD software must have an
<a href="http://www.opensource.org/licenses" class="external text"
rel="nofollow">Open Source Initiative (OSI) approved license</a>, and
that license must be free to all users. The GMOD project is committed to
<a href="http://www.opensource.org/docs/osd" class="external text"
rel="nofollow">open source principles</a>.
Interoperable With Other [GMOD Components](GMOD_Components "GMOD Components")  
New GMOD software must be interoperable with other [GMOD
Components](GMOD_Components "GMOD Components"). Usually this means that
the software can export and/or import [GFF](GFF "GFF"), or that it can
connect to <a href="Chado" class="mw-redirect" title="Chado">Chado</a>.
Commitment of Support  
The developers of the software must be willing to make a good faith
commitment to support the new component for at least 2 years after
joining GMOD. This commitment includes setting up email lists,
responding to user questions, writing and maintaining documentation, and
adding new features and bug fixes to the code.

The current developers should also be open to new developers from the
GMOD community contributing code and other support to the new component.
This *open development* model contributes to the long-term viability of
the open source model.

Users and Support Mailing List(s)  
Newly added software components must have user/support [mailing
list(s)](GMOD_Mailing_Lists "GMOD Mailing Lists") and those lists must
be publicly archived.
Public repository  
The software component, including code, documentation and other
supporting files need to be stored in a publicly accessible code
repository. This repository must also enable the addition of new
developers over the life of the project.

### Non-GMOD Software

Being officially part of GMOD has several advantages:

- It tells users that software meets the [requirements listed
  above](#Requirements).
- The software gets equal billing with other [GMOD
  Components](GMOD_Components "GMOD Components") on the GMOD web site.
- The software will be included in GMOD [Training and
  Outreach](Training_and_Outreach "Training and Outreach") activities,
  possibly including coverage at [GMOD
  Schools](GMOD_Schools "GMOD Schools").

However, a component does not need to be officially part of GMOD to have
a presence in GMOD. Any software that is useful to the GMOD community is
of interest. See [External](Category%253AExternal "Category%253AExternal") for a
list of such software that currently has a page on the GMOD web site.
GMOD is particularly interested in tools (such as
[Artemis](Artemis "Artemis")) that interoperate with GMOD components.
You don't even have to apply for GMOD membership to have an "external"
page.

### Versions

These [Software Membership Requirements](#Software) change over time.

| Version | Start | End | Comments |----|----|----|----| 2.0 | December 2010 | \- | Added publicly archived mailing list, and publicly accessible source code archive requirements. These revisions were [discussed at the September 2010 GMOD Meeting](September_2010_GMOD_Meeting#GMOD_Membership_Requirements "September 2010 GMOD Meeting"), and on the [GMOD Mailing Lists](GMOD_Mailing_Lists "GMOD Mailing Lists") in December 2010. The proposed changes were favorably received at the meeting and on the mailing lists. The Version 2.0 membership standard became official on 2010/12/21. | <a
href="http://gmod.org/w/index.php?title=GMOD_Membership&amp;oldid=15465"
class="external text" rel="nofollow">1.0</a> | February 2010 | December 2010 | Formalized the nomination process and the previously informal membership requirements. | Informal | Conception | February 2010 | The list of requirements evolved and grew over time, eventually resulting in Version 1. |

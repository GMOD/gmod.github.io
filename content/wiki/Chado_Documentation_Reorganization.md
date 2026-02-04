---
title: "Chado Documentation Reorganization"
---
# Chado Documentation Reorganization

We are going to reorganize the in this web site.
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> is the
database schema of GMOD and it has quite a bit of documentation in this
web site. However, the doc could be better organized and integrated.
This page summaries the documentation we have, and then proposes (and
solicits feedback on) a reorganization plan.

Once the work starts, this page will also describe how the work is
going.

 Exists</span>](#What_Exists)
- [Plan](#Plan)
 - [Feedback](#Feedback)
 - [Comments](#Comments)
- [Mechanics](#Mechanics)

## What Exists

This summarizes the major Chado related pages that existed when the
reorganization began in early April 2008. It is not an exhaustive list
of pages related to Chado. See the for that.

<table class="wikitable">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Page</th>
<th>Description</th>
<th>Comments</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><a href="/wiki/Chado_-_Getting_Started"
title="Chado - Getting Started">Chado - Getting Started</a></td>
<td>Sections:<br />
1 Documentation;<br />
2 Modules;<br />
3 Installation;<br />
4 Loading Data;<br />
5 Contacts;<br />
6 Pronunciation</td>
<td>Need to reconstruct it.</td>
</tr>
<tr class="even">
<td><a href="/wiki/Chado_Best_Practices" title="Chado Best Practices">Chado
Best Practices</a></td>
<td>Description of how various sequence features can be represented in
Chado. Has placeholders for genotypes, phenotypes and a few others.</td>
<td>This be a good starting point for a <em>how do you represent X in
Chado</em> page - a Chado Cookbook page.</td>
</tr>
<tr class="odd">
<td><a href="/wiki/Chado_Doc_Project" title="Chado Doc Project">Chado Doc
Project</a></td>
<td>Brian Osborne's
call-to-arms to write "material that is very practical and specific"
meaning "Best Practices" and "module pages". Brian broke Chado up into 8
workpackages and sent out a call for volunteers. 3 of the 8 packages
have been claimed.</td>
<td>I'll follow up on this once the first pass at the reorganization is
done.</td>
</tr>
<tr class="even">
<td><a href="/wiki/Chado_FAQ" title="Chado FAQ">Chado FAQ</a></td>
<td>Currently has 5 widely disparate questions.</td>
<td>Split questions into FAQs and Chado Cookbook. Cookbook cover "How do
you represent 'x' in Chado" questions, and FAQs handle everything
else.</td>
</tr>
<tr class="odd">
<td><a href="/wiki/Chado_Manual" title="Chado Manual">Chado Manual</a></td>
<td>A high level, architectural view of Chado. Has 5 sections:<br />
1) Intro (Modularity, Ontologies, Associated Software, Complexity and
Detail, Data Integration, Support),<br />
2) Modules,<br />
3) Naming Conventions<br />
4) Design Patterns,<br />
5) DBMS Functions.</td>
<td>Explains chado from a database practitioners point of view.</td>
</tr>
<tr class="even">
<td><a href="/wiki/Chado_New_Users" title="Chado New Users">Chado New
Users</a></td>
<td>This page, and its associated discussion page follow the learning
curve for new Chado users learning the system at CSHL.</td>
<td>A collection of user installation/experience logs would be darn
useful. Create a template for this that encourages users to list things
like versions used. This reduces the need to keep "Installing component
<em>X</em> on platform <em>Y</em>" pages up to date for every possible
combination. Just have a list of user log pages that detail <em>X</em>
and <em>Y</em>.</td>
</tr>
<tr class="odd">
<td><a href="/wiki/Introduction_to_Chado"
title="Introduction to Chado">Introduction to Chado</a></td>
<td>An explanation of the Sequence module.</td>
<td>Change the title. This is almost entirely about the Sequence module.
Chris Mungall also indicates that this page is no longer current.</td>
</tr>
<tr class="even">
<td><a href="/wiki/Sample_Chado_SQL" title="Sample Chado SQL">Sample Chado
SQL</a></td>
<td>Shows 8 or 9 queries.</td>
<td>All but one of the queries involves the feature table. Integrate the
SQL with the Chado Cookbook.</td>
</tr>
<tr class="odd">
<td><a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/59/A_Chado_Case_Study.pdf"
class="internal" title="A Chado Case Study.pdf">A Chado Case Study
(pdf)</a></td>
<td>The official publication about Chado. From ISMB/ECCB 2007.</td>
<td></td>
</tr>
<tr class="even">
<td><a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/1f/Chado-manual.pdf" class="internal"
title="Chado-manual.pdf">Chado Manual (PDF)</a></td>
<td>A PDF Chado manual.</td>
<td>The TOC is extensive, but many sections are empty. Much of this
information has already been transferred to wiki pages. Sections with
content:<br />
1) DBMS Functions (see <a href="/wiki/Chado_Manual" title="Chado Manual">Chado
Manual</a>),<br />
2) The General Module (see <a href="/wiki/Chado_Manual"
title="Chado Manual">Chado Manual</a>),<br />
3) The CV Module (see <a href="/wiki/Chado_CV_Module"
title="Chado CV Module">Chado CV Module</a>),<br />
4) The Sequence Module (see <a href="/wiki/Chado_Sequence_Module"
title="Chado Sequence Module">Chado Sequence Module</a>, <a href="/wiki/Chado_Best_Practices" title="Chado Best Practices">Chado Best
Practices</a>), and<br />
5) Chado Naming Conventions (see <a href="/wiki/Chado_Manual"
title="Chado Manual">Chado Manual</a>).<br />
Add pointers to the PDF page to the wiki pages that now cover the same
material.</td>
</tr>
<tr class="odd">
<td><a href="/wiki/Template:ChadoModules"
title="Template:ChadoModules">Template:ChadoModules</a></td>
<td>All the module documentation.</td>
<td>There is a page for each module, and each page contains a complete
physical description of each table and column. Many modules also have
some explanatory text, as do many tables and columns. Keep and expand
this.</td>
</tr>
<tr class="even">
<td><a href="/wiki/GMOD_Users" title="GMOD Users">GMOD Users</a></td>
<td>A list of GMOD users. Has a column for Chado users.</td>
<td>List users differently. Problem is maximizing usefulness without
maximizing redundancy. Want<br />
1) A list of users per component, including how they use it. For Chado
this would include OS, OS release, DBMS, DBMS release, and list of
modules in use.<br />
2) List of all GMOD users with pointers to what components they
use.<br />
The overall list is high level; the component lists are detailed.
Keeping them in synch, even though they are at different levels of
detail, is the hard part.</td>
</tr>
</tbody>
</table>

## Plan

A draft plan for how the documentation will be restructured.

- Chado
 - Page that shows basically this outline and has a getting started
 section or link
 - Getting Started
- Chado Architecture and Logical Design
 - [Chado Manual](/wiki/Chado_Manual) - Database-theory
 centric explanation.
 - Modules -
 [Template:ChadoModules](/wiki/Template:ChadoModules)
 and all accompanying pages.
- Chado Database Administration
 - DBMS and OS Choice
 - Installing Chado
 - Maintaining Chado
 - Include performance tips and discussion of backups.
 - See also User Experiences with DBMS/OS combinations.
 - Accessing, Importing and Exporting Data
 - Various APIs, middleware solutions
 - Pointers to Apollo, GBrowse, etc connector pages
- Using Chado
 - Chado Cookbook
 - Answers questions like "How do I do *X* in Chado". Pull a lot of
 these from E-mail list.
 - Fold SQL into this one. Expand it out to cover more than Sequence
 module.
 - Chado FAQ - Answers those recurring questions
 - Chado User Experiences
 - Who uses chado and how matrix.
 - High level user stories, such as
 [ParameciumDB](/wiki/ParameciumDB)
 - Low-level "installing/using Chado on *X* using DBMS *Y*"
 logs/stories.

This proposal will be refined as we get feedback and the effort
progresses.

### Feedback

You are encouraged to provide feedback on this effort by

- Typing your comments right here.
- Sending comments to the [GMOD Help
 Desk](/wiki/GMOD_Help_Desk) at
 <a href="mailto:help@gmod.org" class="external text"
 rel="nofollow">help@gmod.org</a>.
- Sending comments to the [GMOD-Schema mailing
 list](/wiki/GMOD_Mailing_Lists) at
 <a href="mailto:gmod-schema@lists.sourceforge.net" class="external text"
 rel="nofollow">gmod-schema@lists.sourceforge.net</a>. You must first
 <a href="https://lists.sourceforge.net/lists/listinfo/gmod-schema"
 class="external text" rel="nofollow">subscribe to the list</a> to post
 to it.

**Note:** Unless you request otherwise anything sent to the [GMOD Help
Desk](/wiki/GMOD_Help_Desk) or to the [GMOD-Schema mailing
list](/wiki/GMOD_Mailing_Lists) may be reproduced here.

#### Comments

Provide your feedback here!

## Mechanics

Each page that is being modified, created or deleted as part of this
effort will include the [ChadoDocReorg
template](/wiki/Template:ChadoDocReorg):

> **This page is being modified, created, or deleted as part of the
> **Chado Documentation Reorganization** effort.**
>
> This page may be unstable, or may be replaced with a redirect as a
> part of this effort. Once the **Chado Documentation Reorganization**
> is complete this page will become stable and this notice will be
> removed.
>
> If you have any questions, comments, or suggestions on this effort
> please see the
> [Feedback](/wiki/Chado_Documentation_Reorganization#Feedback)
> section of the **Chado Documentation Reorganization** page.

This will be placed at the top of the page.

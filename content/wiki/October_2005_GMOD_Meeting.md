---
title: "October 2005 GMOD Meeting"
---
# October 2005 GMOD Meeting

Generic Model Organism Database Construction Set

 7</span>](#Meeting_7)
- [Agenda](#Agenda)
 - [Friday,
 October 28, 2005 DIFFERENT ROOM: Plimpton Conference Room, Beckman
 Building,
 CSHL](#Friday.2C_October_28.2C_2005.0ADIFFERENT_ROOM:_Plimpton_Conference_Room.2C_Beckman_Building.2C_CSHL)
- [Meeting
 Report](#Meeting_Report)

## Meeting 7

Thursday, October 27, 2005 Gerry Conference Room, Marks Building, CSHL

## Agenda

9:10am

Introductions
Scott Cain, GMOD coordinator

9:30

GMOD/chado 0.003 and roadmap, including:

- improvements for next release
- standardizing chado use across orgs
- upgrade paths (script to modify data and schema?)
- other topics that should be discussed during this meeting

10:30

Break

10:45

Top ten things a MOD provides
more on the road map; how Chado, GBrowse, Turnkey and Apollo fit in and
where the holes are

12:00

Lunch

1:30

[architecture working
group](/wiki/Summary_of_Fall_2005_CHSL_Meeting):
Review and revisit what we have done

2:00

Testing Recommendations

2:45

Break

3:00

Java O/R recommendation

3:30

Discussion: other topics, either architecture or other software issues

##### Friday, October 28, 2005 DIFFERENT ROOM: Plimpton Conference Room, Beckman Building, CSHL

<table data-cellpadding="6" width="75%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top" width="15%">9:10</td>
<td width="85%">Common URLs and common gene page</td>
</tr>
<tr class="even">
<td data-valign="top" width="15%">10:30</td>
<td width="85%">Break</td>
</tr>
<tr class="odd">
<td data-valign="top" width="15%">12:00</td>
<td width="85%">Lunch</td>
</tr>
<tr class="even">
<td data-valign="top" width="15%">1:30</td>
<td width="85%">Revisiting the developer's guide; preparing a software
package for release</td>
</tr>
<tr class="odd">
<td data-valign="top" width="15%">2:00</td>
<td width="85%">Software demos, coffee<br />
</td>
</tr>
</tbody>
</table>

## Meeting Report

Meeting report for October, 2005 GMOD meeting. This is an outline by
Scott Cain.

Topics covered:

- Current state of gmod/chado release, movement towards 0.1 release
- Discussed 'MOD Top Ten list'
 - Mike Cherry proposed operating a MOD 'co-location' facility with all
 GMOD tools. The may be greatly facilitated by the software packaging
 work done by Allen Day and Brian O'Connor with
 <a href="http://biopackages.net" class="external text"
 rel="nofollow">biopackages.net</a>.
 - Some discussion of using a content management tool like
 <a href="http://drupal.org" class="external text"
 rel="nofollow">Drupal</a> to handle some of the page display tasks
 for a MOD and use [turnkey](/wiki/Turnkey) only as a tool to
 access and display
 <a href="/wiki/Chado" class="mw-redirect" title="Chado">chado</a> related
 data.
- Architecture
 - Testing recommendations
 - Volunteers to examine
 - How to get various chado instances to conform to a standard method
 of encoding data? Documentation: Joshua (TIGR) volunteered to
 document how TIGR is using chado to encode data and make it public
 as a first step in a collaborative effort among current users of
 chado (including TIGR,
 , and GMOD
 developers).
- [www.gmod.org](/wiki/Main_Page)
 - In the evening of the first day, Allen Day, Brian O'Connor and Scott
 Cain created a prototype website with the purpose of improving the
 function of the site. It is based on an open source content
 management software package that will facilitate collaborative
 documentation projects, such as the chado usage project discussed
 earlier that day.
- Common gene page. Since this group does not represent the target
 users, we did not feel that we would make much headway in establishing
 a standard. However, it was noted that the data collected by GO for
 several organisms contains much of the data that would be needed for a
 simple gene page. It was decided that Scott Cain would create a gene
 page using this data and present it at the biocurators meeting in
 December
- Software developer's guide and software release recommendations
- stuff to do
 - Scott: build sample gene page from GO gene data (or talk Chris into
 doing it) hopefully to present to biocurator list in December
 - Migrate website to facilitate documentation improvements
 - key to improving standards for chado usage
 - follow up on getting/comparing data dumps for different chado
 implementations
 - Talk to lincoln about identifying a journal for publication
- demos
 - <a href="/wiki/Ergatis" class="mw-redirect" title="Ergatis">TIGR pipeline
 tool</a>
 - Princeton/ web-based data curation
 tool (talks directly to chado)
 - [DAS2](/wiki/Distributed_Annotation_System)
 java tool for querying [chado microarray
 data](/wiki/Chado_Mage_Module)
 - community module for chado
 (<a href="http://xenbase.org" class="external text"
 rel="nofollow">XenBase</a>\])
 - PuMA, java tool for pubmed query building
 - [GBrowse for
 synteny](/wiki/SynView)
 - flybase gbrowse for synteny
 - flybase query builder

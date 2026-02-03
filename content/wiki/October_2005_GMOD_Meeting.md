---
title: "October 2005 GMOD Meeting"
---




<span id="top"></span>




# <span dir="auto">October 2005 GMOD Meeting</span>









Generic Model Organism Database Construction Set

  


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Meeting
  7</span>](#Meeting_7)
- [<span class="tocnumber">2</span>
  <span class="toctext">Agenda</span>](#Agenda)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Friday,
    October 28, 2005 DIFFERENT ROOM: Plimpton Conference Room, Beckman
    Building,
    CSHL</span>](#Friday.2C_October_28.2C_2005.0ADIFFERENT_ROOM:_Plimpton_Conference_Room.2C_Beckman_Building.2C_CSHL)
- [<span class="tocnumber">3</span> <span class="toctext">Meeting
  Report</span>](#Meeting_Report)



## <span id="Meeting_7" class="mw-headline">Meeting 7</span>

Thursday, October 27, 2005 Gerry Conference Room, Marks Building, CSHL

  

## <span id="Agenda" class="mw-headline">Agenda</span>

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
group](Summary_of_Fall_2005_CHSL_Meeting "Summary of Fall 2005 CHSL Meeting"):
Review and revisit what we have done

2:00

Testing Recommendations

2:45

Break

3:00

Java O/R recommendation

3:30

Discussion: other topics, either architecture or other software issues

##### <span id="Friday.2C_October_28.2C_2005.0ADIFFERENT_ROOM:_Plimpton_Conference_Room.2C_Beckman_Building.2C_CSHL" class="mw-headline">Friday, October 28, 2005 DIFFERENT ROOM: Plimpton Conference Room, Beckman Building, CSHL</span>

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

## <span id="Meeting_Report" class="mw-headline">Meeting Report</span>

Meeting report for October, 2005 GMOD meeting. This is an outline by
[Scott Cain](User%253AScott "User%253AScott").

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
    for a MOD and use [turnkey](Turnkey "Turnkey") only as a tool to
    access and display
    <a href="Chado" class="mw-redirect" title="Chado">chado</a> related
    data.
- Architecture
  - Testing recommendations
  - Volunteers to examine [Java ORMs Hibernate and
    iBatis](Category%253AMiddleware "Category%253AMiddleware")
  - How to get various chado instances to conform to a standard method
    of encoding data? Documentation: Joshua (TIGR) volunteered to
    document how TIGR is using chado to encode data and make it public
    as a first step in a collaborative effort among current users of
    chado (including TIGR,
    [FlyBase](Category%253AFlyBase "Category%253AFlyBase"), and GMOD
    developers).
- [www.gmod.org](Main_Page "Main Page")
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
  - <a href="Ergatis" class="mw-redirect" title="Ergatis">TIGR pipeline
    tool</a>
  - Princeton/[SGD](Category%253ASGD "Category%253ASGD") web-based data curation
    tool (talks directly to chado)
  - [DAS2](Distributed_Annotation_System "Distributed Annotation System")
    java tool for querying [chado microarray
    data](Chado_Mage_Module "Chado Mage Module")
  - community module for chado
    (<a href="http://xenbase.org" class="external text"
    rel="nofollow">XenBase</a>\])
  - PuMA, java tool for pubmed query building
  - [ApiDB](Category%253AApiDB "Category%253AApiDB") [GBrowse for
    synteny](SynView "SynView")
  - flybase gbrowse for synteny
  - flybase query builder





[Categories](Special%253ACategories "Special%253ACategories"):

- [DictyBase](Category%253ADictyBase "Category%253ADictyBase")
- [Meetings](Category%253AMeetings "Category%253AMeetings")





## Navigation menu









### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>




### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%253AHOWTO)</span>
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/October_2005_GMOD_Meeting"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:15 on 28 July
  2010.</span>
<!-- - <span id="footer-info-viewcount">28,309 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





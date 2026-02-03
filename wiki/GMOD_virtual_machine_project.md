



<span id="top"></span>




# <span dir="auto">GMOD virtual machine project</span>









> The item described in this page is not (or is no longer) supported by
> the GMOD project.  
> This page is included only for reference purposes.



The people who created and maintained these VMware images have moved on
to other things, and ***the VMware images described here are no longer
available.***

VMware images still exist in GMOD in several places. See:

- [VMware HOWTO](VMware_HOWTO "VMware HOWTO")
- [Tutorials](Category%253ATutorials "Category%253ATutorials")
- [Community Annotation
  System](Community_Annotation_System "Community Annotation System")



Initial versions of GMOD virtual machines have been uploaded/documented
at the
<a href="VMWare_HOWTO" class="mw-redirect" title="VMWare HOWTO">VMWare
HOWTO</a>. The [Community Annotation
System](Community_Annotation_System "Community Annotation System") is an
example GMOD virtual machine.

This page is for discussion on creating a GMOD virtual machine. The idea
was initiated by an email to the GMOD-devel, schema and gbrowse [mailing
lists](GMOD_Mailing_Lists "GMOD Mailing Lists"):

Hello,

Recently, the people in my lab have been experimenting a lot with VMware
for creating virtual machines. I am excited about the potential uses for
these virtual machines for several purposes, among them the ability to
create a consistent platform for teaching (like giving a classroom a
disk with the VMware player and a linux VM with
[GBrowse](GBrowse.1 "GBrowse") preinstalled to give a tutorial), and for
creating virtual machines that could be used as a 'test server' that
people interested in GMOD software could get and try out without having
to set up a server to do it. That is what this email is about.

My goal is two-fold: first I am looking for volunteers. If anybody would
like to under take the task of creating a virtual machine and populate
it with GMOD software and sample data, I would be thrilled to give
guidance and moral support.

Second, I want to get feedback on what should be installed. There is
both the question of sample data and software. Here are my thoughts so
far:

     Chado and related core components (version 0.5 when released)*
     XORT                              (0.5 when released)*
     GBrowse                           (1.68 when released)**
     Apollo                            (1.6.5)
     CMap                              (? Most recent?)
     Turnkey/gmod-web                  (? most recent?)
     BLAST graphic viewer              (? most recent?)

Also, there are some things 'on the bubble' that I haven't decided
whether they should be installed:

     Sybil
     Flash GViewer
     Textpresso
     BioMart
     DAS2 server

Any thoughts on these?

Thanks for your time, Scott

- Ian Holmes suggested their extensions to GBrowse
  ([AJAX](Category%253AAJAX "Category%253AAJAX") and wiki).
- Eric Just suggested [Modware](Modware "Modware").

## <span id="About_.27when_released.27" class="mw-headline">About 'when released'</span>

- Work is on going on Chado core components, notably getting a conversion
  from GFF3 to [chadoxml](Chado_XML "Chado XML") which will require
  changes to XORT.
- There have been a few fixes to the
  <a href="GBrowse_adaptors" class="mw-redirect"
  title="GBrowse adaptors">chado adaptor in GBrowse</a>, so it should
  get a new release soon

Also see [Community Annotation
System](Community_Annotation_System "Community Annotation System").




[Category](Special%253ACategories "Special%253ACategories"):

- [Unsupported](Category%253AUnsupported "Category%253AUnsupported")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GMOD_virtual_machine_project"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 17:21 on 24 September
  2009.</span>
<!-- - <span id="footer-info-viewcount">31,637 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





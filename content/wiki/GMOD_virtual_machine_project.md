---
title: "GMOD virtual machine project"
---
# GMOD virtual machine project

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

## About 'when released'

- Work is on going on Chado core components, notably getting a conversion
  from GFF3 to [chadoxml](Chado_XML "Chado XML") which will require
  changes to XORT.
- There have been a few fixes to the
  <a href="GBrowse_adaptors" class="mw-redirect"
  title="GBrowse adaptors">chado adaptor in GBrowse</a>, so it should
  get a new release soon

Also see [Community Annotation
System](Community_Annotation_System "Community Annotation System").

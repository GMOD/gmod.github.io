---
title: "GBrowse syn PAG 2009 Workshop"
---
# GBrowse syn PAG 2009 Workshop



<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/44/GBrowse_syn_logo.png/250px-GBrowse_syn_logo.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/44/GBrowse_syn_logo.png/375px-GBrowse_syn_logo.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/44/GBrowse_syn_logo.png/500px-GBrowse_syn_logo.png 2x"
width="250" height="80" alt="GBrowse syn" />

This [Comparative Genomics with GBrowse_syn: A hands on workshop for
visualizing your syntenic data with
GBrowse_syn](GBrowse_syn.1 "GBrowse syn") tutorial was presented by
[Sheldon McKay](User%253AMckays "User%253AMckays"), [Scott
Cain](User%253AScott "User%253AScott"), and [Dave
Clements](User%253AClements "User%253AClements") at the
<a href="http://www.intl-pag.org/" class="external text"
rel="nofollow">Plant and Animal Genome Conference</a>, January 2009. The
most recent GBrowse syn tutorial can be found at the
<a href="GBrowse_syn_Tutorial" class="mw-redirect"
title="GBrowse syn Tutorial">GBrowse syn Tutorial</a> page.


This page provides additional information about the
<a href="http://www.intl-pag.org/17/17-gbrowse2.html"
class="external text" rel="nofollow">GBrowse_syn workshop</a> at the
<a href="http://www.intl-pag.org/" class="external text"
rel="nofollow">Plant and Animal Genome XVII Conference</a> ([PAG
2009](PAG_2009 "PAG 2009")) held in San Diego on January 10-14, 2009.
This workshop was attended by almost 70 people.

  Overview](#Overview)
- [Workshop
  Instructors](#Workshop_Instructors)
- [Tutorial
  Level](#Tutorial_Level)
- [Syllabus](#Syllabus)
- [Laptops](#Laptops)
- [Prerequisite
  Software](#Prerequisite_Software)
  - [VMware](#VMware)
  - [System
    Image](#System_Image)
- [Datasets](#Datasets)
- [Other GMOD
  Presentations and
  Meetings](#Other_GMOD_Presentations_and_Meetings)

## Overview

[GBrowse_syn](GBrowse_syn.1 "GBrowse syn") is a tool for visualizing
<a href="Synteny" class="mw-redirect" title="Synteny">synteny</a> in up
5 different genomes. This will be a hands-on tutorial on how to install,
configure and use GBrowse_syn.

GBrowse_syn is a part of the GMOD Project and is included in the latest
release (1.69) of the popular [GBrowse](GBrowse.1 "GBrowse") genome
browser. (GBrowse is the topic of a [separate
workshop](GBrowse_PAG_2009_Workshop "GBrowse PAG 2009 Workshop") at [PAG
2009](PAG_2009 "PAG 2009").

## Workshop Instructors

- [Sheldon McKay](User%253AMckays "User%253AMckays"),
  <a href="http://www.iplantcollaborative.org/" class="external text"
  rel="nofollow">iPlant Collaborative</a> (and author of
  [GBrowse_syn](GBrowse_syn.1 "GBrowse syn")),
  <a href="http://www.cshl.edu/" class="external text" rel="nofollow">Cold
  Spring Harbor Laboratory</a>
- [Scott Cain](User%253AScott "User%253AScott"), GMOD Project Coordinator,
  <a href="http://www.oicr.on.ca/" class="external text"
  rel="nofollow">Ontario Institute for Cancer Research</a>
- [Dave Clements](User%253AClements "User%253AClements"),
  [GMOD_Help_Desk](GMOD_Help_Desk "GMOD Help Desk"),
  <a href="http://www.nescent.org" class="external text"
  rel="nofollow">NESCent</a>

## Tutorial Level

Beginner to Intermediate. Students should be comfortable performing
simple system Linux administration tasks like stopping and starting
services, and installing software. No prior knowledge of
[GBrowse](GBrowse.1 "GBrowse") or
[GBrowse_syn](GBrowse_syn.1 "GBrowse syn") is required.

The tutorial was aimed at computer-savvy biologists and computer
scientists working with syntenic data.

## Syllabus

The session included

- Architecture
- Installation
- Loading data
- Configuration

The course briefly touched on generating syntenic data, but it did not
go into detail on different analysis options.

## Laptops

Our intention was to have this be a hands-on tutorial running
GBrowse_syn under VMware. However, we chose instead to hand out copies
of the VMware image and encourage people to experiment with it after the
workshop.

## Prerequisite Software

### VMware

Which software to use to run [VMware](VMware_HOWTO "VMware HOWTO")
images depends on the operating system you will run the image under. (It
does not depend on the operating system inside the VMware image.)

VMware on Windows and Linux

<a href="http://www.microsoft.com/" rel="nofollow" title="Windoze"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a5/WindowsLogoSmall.jpg" width="49"
height="48" alt="Windoze" /></a>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b1/LinuxLogoSmall.jpg" width="45" height="50"
alt="Linux" />

A free VMware player is available for [Microsoft
Windows](Category%253AWindows "Category%253AWindows") and
[Linux](Category%253ALinux "Category%253ALinux") [operating
systems](Glossary#Operating_System "Glossary") from
<a href="http://vmware.com/products/player/" class="external text"
rel="nofollow">VMware</a>. You will need to register to download it.
There are multiple versions. Be sure to download a version that can run
on your laptop.



VMware on Mac OS X

<a href="http://www.apple.com/macosx/" rel="nofollow" title="Apple"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/82/AppleSmall.gif" width="48" height="48"
alt="Apple" /></a>

Participants can also bring *newer Macs with Intel processors*. The
Intel processor is a requirement for all the packages discussed below.
There is no free VMware player that runs *directly* under [Mac OS
X](Category%253AMac_OS_X "Category%253AMac OS X"). However, there are several
other options, **all of which require an Intel Mac**:



VMware Fusion

<a href="http://www.vmware.com/products/fusion/" rel="nofollow"
title="Fusion"><img src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/02/VMWareFusionsLogo.jpg"
width="48" height="48" alt="Fusion" /></a>

<a href="http://www.vmware.com/products/fusion/" class="external text"
rel="nofollow">VMware Fusion</a>
(<a href="http://www.vmware.com/a/buylink/10" class="external text"
rel="nofollow">$80/corporate</a>,
<a href="http://www.vmware.com/vmwarestore/academicstore.html"
class="external text" rel="nofollow">$40/Academic</a>) allows you to run
VMware images (as well as Windows and Linux) under Mac OS. **We
recommend this option for Mac users. There is a fully functional, 30 day
free trial version of VMware Fusion available for download.**



VirtualBox

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fa/VirtualBox-logo.png" width="48"
height="48" alt="VirtualBox" />

<a href="http://www.virtualbox.org/wiki/Downloads" class="external text"
rel="nofollow">VirtualBox</a> is free and open source, and runs on Intel
Macs (and Windows, Linux and Solaris too). It claims to be capable of
running VMware images, *but we have not tested this with our images.*

**Note:**. VMWare and Linux are used to standardize GBrowse_syn
installation and configuration for the workshop. They are not mandatory
for installation and use of GBrowse or GBrowse_syn.

*The DVD distributed at the workshop contained a
<a href="http://www.vmware.com" class="external text"
rel="nofollow">VMware</a> system image.*

### System Image

- The virtual disk image can be downloaded from
  <a href="ftp://ftp.wormbase.org/pub/gmod" class="external text"
  rel="nofollow">WormBase ftp</a>
- The disk image is approximately 1 gigabyte.

## Datasets

## Other GMOD Presentations and Meetings

GMOD had a [strong presence](PAG_2009 "PAG 2009") at PAG 2009, including
a [workshop on
GBrowse](GBrowse_PAG_2009_Workshop "GBrowse PAG 2009 Workshop") itself.
See the [list of GMOD related PAG 2009
presentations](PAG_2009 "PAG 2009") for more. The [January 2009 GMOD
Meeting](January_2009_GMOD_Meeting "January 2009 GMOD Meeting") was held
in San Diego, immediately after PAG 2009.

<span class="smwfactboxhead">Facts about
"<span class="swmfactboxheadbrowse"></span>"</span>

|----|----|
| [Has topic](Property%253AHas_topic "Property:Has topic") | [GBrowse syn](GBrowse_syn.1 "GBrowse syn") |

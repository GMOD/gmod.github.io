---
title: "Distributed Annotation System"
---
# Distributed Annotation System

(Redirected from
[DAS](/wiki/DAS)

<a href="http://www.biodas.org/" rel="nofollow"
title="Distributed Annotation System"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/32/Das_logo_64x64.jpg" width="64" height="64"
alt="Distributed Annotation System" /></a>

The Distributed Annotation System, or DAS, is a protocol for exchanging
and retrieving sequence annotations, possibly from multiple sources.
With DAS you don't have to store annotation data to use or display it.
You only have to know how to retrieve it from a DAS server.

See the <a href="http://www.biodas.org/" class="external text"
rel="nofollow">BioDas web site</a> for a full explanation of DAS



  DAS/2</span>](#DAS.2F1_and_DAS.2F2)
  - [Preserving
    DAS/1 Strengths in
    DAS/2](#Preserving_DAS.2F1_Strengths_in_DAS.2F2)
- [DAS in
  GMOD](#DAS_in_GMOD)
- [Presentations](#Presentations)

## DAS/1 and DAS/2

DAS/1 was the original release of DAS. It is widely used, and that use
revealed some weaknesses in the design. DAS/2 attempts to address these
weaknesses.

### Preserving DAS/1 Strengths in DAS/2

- Keep focus on location-based annotation of biological sequences.
- Protocol, not an implementation.
  - HTTP for transport,
  - URLs for queries
  - XML for responses
  - REST-like style.
- No Required central authority.
- Couple XML response to URL request formats.
- XML has been shortened, but big gain comes from client-server content
  format negotiation, including binary. Empty elements dropped.
- Uses HTTP caching in the client.
- [IGB](/wiki/IGB) - reference client for DAS2. Integrated Genome
  Browser



## DAS in GMOD

These components work with DAS servers:

- [GBrowse](/wiki/GBrowse.1) - See
  <a href="/wiki/GBrowse_adaptors" class="mw-redirect"
  title="GBrowse adaptors">GBrowse adaptors</a>

## Presentations

- [DAS
  Update](/wiki/August_2009_GMOD_Meeting#DAS_update),
  [August 2009 GMOD
  Meeting](/wiki/August_2009_GMOD_Meeting)
- [Distributed Annotation Systems/2
  (DAS/2)](/wiki/November_2007_GMOD_Meeting#Distributed_Annotation_System.2F2_.28DAS.2F2.29),
  [November 2007 GMOD
  Meeting](/wiki/November_2007_GMOD_Meeting)
- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/74/Das.ppt" class="internal"
  title="Das.ppt">DAS2</a>, [May 2005 GMOD
  Meeting](/wiki/May_2005_GMOD_Meeting)

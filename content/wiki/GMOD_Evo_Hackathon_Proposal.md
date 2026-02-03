---
title: "GMOD Evo Hackathon Proposal"
---
# GMOD Evo Hackathon Proposal

<table style="vertical-align: middle; border: 2px solid #A6A6BC"
data-cellpadding="10">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/a8/EvoHackathonLogo.png/200px-EvoHackathonLogo.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/a8/EvoHackathonLogo.png/300px-EvoHackathonLogo.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/a/a8/EvoHackathonLogo.png/400px-EvoHackathonLogo.png 2x"
width="200" height="200" alt="EvoHackathonLogo.png" />

</td>
<td><span style="font-size: 200%; line-height: 120%"><strong><a
href="GMOD_Evo_Hackathon" title="GMOD Evo Hackathon">Tools for
Evolutionary Biology Hackathon</a> Proposal</strong><br />
November 8-12, 2010<br />
<a href="http://nescent.org/" class="external text"
rel="nofollow">NESCent</a>, Durham, North Carolina, USA</span></td>
</tr>
</tbody>
</table>

  

This proposal was submitted to, and then approved and
[funded](GMOD_Evo_Hackathon#Sponsorship "GMOD Evo Hackathon") by
<a href="http://nescent.org" class="external text"
rel="nofollow">NESCent</a> in June 2010. **For up-to-date information on
the hackathon, see the [hackathon's home
page](GMOD_Evo_Hackathon "GMOD Evo Hackathon").**

The [GMOD Evo Hackathon](GMOD_Evo_Hackathon "GMOD Evo Hackathon") aims
to bring together key developers of GMOD components with developers from
the evolutionary biology community to fill critical gaps in GMOD for
evolutionary research.

  Synopsis](#Synopsis)
- [Background](#Background)
- [Specific
  objectives](#Specific_objectives)
  - [Viewing
    tools for comparative genomics
    data](#Viewing_tools_for_comparative_genomics_data)
  - [Visualization of phylogenetic data and
    trees](#Visualization_of_phylogenetic_data_and_trees)
  - [Population
    Diversity and Phenotype
    support](#Population_Diversity_and_Phenotype_support)
- [Logistics and
  Participation](#Logistics_and_Participation)
- [Organization
  and Agenda](#Organization_and_Agenda)

## Synopsis

We propose a hackathon to fill critical gaps in the capabilities of the
Generic Model Organism Database (GMOD) toolbox that currently limit its
utility for evolutionary research. Specifically, we aim to focus on
tools for 1) viewing comparative genomics data; 2) visualizing
phylogenomic data; and 3) supporting population diversity data and
phenotype annotation.

The event would be hosted at NESCent and bring together a group of about
20 software developers, end-user representatives, and documentation
experts who would otherwise not meet. The participants would include key
developers of GMOD components that currently lack features critical for
emerging evolutionary biology research, developers of informatics tools
in evolutionary research that lack GMOD integration, and
informatics-savvy biologists who can represent end-user requirements.

The event would hence provide a unique opportunity to infuse the
community of GMOD developers with a heightened awareness of unmet needs
in evolutionary biology that GMOD components have the potential to fill,
and for tool developers in evolutionary biology to better understand how
best to extend or integrate with already existing GMOD components.

## Background

The GMOD project is a confederation of intercompatible open-source
projects developing software tools for storing, managing, curating, and
publishing biological data. Although the GMOD project originated from
the goal of developing a generic tool set for common needs among model
organism databases, GMOD tools are meanwhile used by many large and
small, collaborative and single-investigator biological database
projects for the dissemination of experimental results and curated
knowledge.

GMOD's software tools provide a powerful and feature-rich basis for
working with biological, in particular genomic and other molecular data.
However, due to GMOD's historical emphasis on single-genome projects
many GMOD tools still lack features that are critical to effectively
support the comparative, phylogenetic, and natural diversity-oriented
questions frequently asked in evolutionary research.

Recent developments have given rise to a window of opportunity for
forging collaborations towards filling this gap. In particular, the cost
of collecting comparative molecular data on a large or even genomic
scale has recently dropped dramatically, primarily thanks to
next-generation high-throughput sequencing technologies. This has
enabled evolutionary researchers to bring genome-scale molecular data to
bear on key evolutionary questions. It has also allowed single
organism-focused molecular biology labs, who represent GMOD's
traditional user base, to broaden out to multi-organism comparative
approaches. Bringing these two communities with increasingly shared
interests and complementary scientific and technical expertise together
offers an opportunity to start filling GMOD's gaps in these areas while
building on its existing strengths. In addition, such direct interaction
will heighten future awareness of needs of evolutionary researchers
among GMOD developers who have so far mostly supported its traditional
user base, and can in the long term increase the ranks of GMOD
contributors from a field it was not originally designed to serve.

The hackathon meeting format is ideally suited to realize this
opportunity. Its strengths lie in facilitating face-to-face interaction
among people with complementary expertise, and collaborative work on
tangible products that can form the basis of continued partnerships long
beyond the end of the meeting. This meeting format, and the overall
goals of the event are closely aligned with NESCent's objectives in
promoting collaborative work, data sharing and interoperability.
NESCent's past experience in organizing successful hackathons, and its
position as a neutral intellectual hub within the evolutionary biology
make it an ideal location for holding the event.

## Specific objectives

Organizers have identified the following broad themes for focusing work
at the event. These are based on the organizers' experience,
interactions with others in the GMOD and evolution communities, and
insights gained by the recent
<a href="http://www.nescent.org/cal/calendar_detail.php?id=530"
class="external text" rel="nofollow"><em>Tools for Emerging Model
Systems</em> working group (EMS WG)</a> at NESCent.

Before and at the hackathon, the participants will refine and distill
these and other options into concrete implementation targets. The
participants will develop criteria for priotization, such as maturity of
a target for implementation, availability of test data, and potential
for completing or making significant progress towards the target during
the hackathon. Further ideas and discussion topics can be found on the
[Supplemental
Information](GMOD_Evo_Hackathon_Proposal_Supplemental_Information "GMOD Evo Hackathon Proposal Supplemental Information")
page.

### Viewing tools for comparative genomics data

[GBrowse_syn](GBrowse_syn.1 "GBrowse syn") is a popular GMOD component
for viewing comparative genomics data, particularly for viewing synteny
between genomes. It does not currently support the next-generation
sequencing (NGS) data increasingly available for comparative genomics
and emerging model systems. Support for NGS data was identified by the
EMS working group as a high priority.

In particular, GBrowse_syn lacks support for the
<a href="http://samtools.sourceforge.net/" class="external text"
rel="nofollow">Sequence Alignment Format (SAM)</a>, its mechanism of
storing genome comparisons does not scale beyond a few organisms, and
the means for tracking the necessary alignment metadata in Chado are
insufficient.

In addition to filling those gaps, GBrowse_syn would also particularly
stand to benefit from the event by gaining a more sustainable developer
base.

### Visualization of phylogenetic data and trees

The GMOD toolkit at present does not include web-based alignment
viewers, nor can the increasingly popular [JBrowse](JBrowse.1 "JBrowse")
genome browser (the designated successor of
[GBrowse](GBrowse.1 "GBrowse")) display multiple sequence alignments.
GMOD also lacks a phylogenetic tree widget.

Implementing these from scratch would be far beyond a suitable hackathon
target. However, <a href="http://solgenomics.net" class="external text"
rel="nofollow">SGN</a> has a relatively mature
<a href="http://solgenomics.net/tools/align_viewer/"
class="external text" rel="nofollow">web-based multiple alignment and
tree browser</a> that could be extracted from SGN's codebase and
transformed into a GMOD component, an add-on for JBrowse. Current
Java-based tree viewers (such as
<a href="http://www.phylosoft.org/atv/" class="external text"
rel="nofollow">Archaeopteryx</a> or
<a href="http://www.phylowidget.org" class="external text"
rel="nofollow">PhyloWidget</a>) could be used as the basis for a
JavaScript-based tree viewer (or an applet that can be controlled
through JavaScript) that integrates with JBrowse.

### Population Diversity and Phenotype support

GMOD's capabilities in managing phenotype and natural diversity data is
scattered across partially redundant and outdated modules, does not
support modern ontology-based entity-quality data, and lacks a
web-interface. The sophisticated phenotype annotation tools that do
exist cannot interface with Chado, GMOD's central relational data model.
Yet, phenotypic and genetic diversity data are central to many
evolutionary research questions.

A [Natural Diversity Module
initiative](Chado_Natural_Diversity_Module_Working_Group "Chado Natural Diversity Module Working Group")
to address at least the deficiencies within Chado has already formed
earlier this year. Several key developers (one of the original
developers of the module, and the developer of Phenex, a phenotype
curation tool) are already local to NESCent, and so the hackathon
provides a unique opportunity to review and refine the natural diversity
data model face-to-face, and to integrate it with an updated and
reconciled phenotype module. A recently reported prototype of a Chado
data adapter for Phenote, GMODs phenotype annotation tool, could be
generalized to become the data persistence interface for such data.

Aside from the data model deficiencies, the
<a href="http://aniseed-ibdm.univ-mrs.fr/" class="external text"
rel="nofollow">ANISEED</a> project has started efforts to generalize its
sophisticated atlas/image-based web interface for phenotype data, and to
make it operate on top of Chado. The hackathon could harness this
synergy to help this effort leap forward, which could ultimately provide
GMOD with the currently missing web-interface for such data.

## Logistics and Participation

The event will tentatively be held at NESCent in Durham, North Carolina,
from Nov 8-12, 2010.

Participation will be arranged by invitation and by self-nomination
followed by review. If you are interested in participating, please
contact one of the organizers. We expect to support about 20
participants, about half of whom will be invited and half will be
self-nominated attendees.

The objective for direct invitations is to ensure that critical
developers for each of the three themes are present. Self-nominations of
participants will be solicited through a variety of channels, including
GMOD mailing lists, the
<a href="http://www.gmod.org" class="external text" rel="nofollow">GMOD
web site</a>, and
<a href="http://life.biology.mcmaster.ca/~brian/evoldir.html"
class="external text" rel="nofollow">EvolDir</a>. In addition, the
organizers will announce Calls for Participation at conferences they
attend, such as
<a href="http://www.k-state.edu/agc/symp2010" class="external text"
rel="nofollow">Arthropod Genomics</a>,
<a href="http://www.evolutionsociety.org/SSE2010/" class="external text"
rel="nofollow">Evolution</a>,
<a href="http://ievobio.org/" class="external text"
rel="nofollow">iEvoBio</a>,
<a href="http://www.open-bio.org/wiki/BOSC_2010" class="external text"
rel="nofollow">BOSC</a>, and
<a href="http://www.iscb.org/ismb2010" class="external text"
rel="nofollow">ISMB</a>. Additional targets may be identified by
<a href="http://www.nescent.org/eog/AboutEOG.php" class="external text"
rel="nofollow">NESCent's Education and Outreach group</a>.

The organizing committee will select participants from the applicant
pool to create a group with balanced, complementary, and diverse sets of
expertise, background, and interests, using a number of criteria:

- Experience in bioinformatics programming in general and GMOD in
  particular;
- Experience with and understanding of evolutionary data types;
- Potential to uniquely benefit from the event;
- Complementarity of expertise and background;
- Achieving critical mass for each of the themes; and
- Availability during the event.

A hackathon is a working meeting and concentrates on writing code. All
code and documentation will be made available immediately and freely to
the community under an
<a href="http://www.opensource.org/licenses/alphabetical"
class="external text" rel="nofollow">OSI-approved</a> open source
license.

## Organization and Agenda

The following people comprise the organizing committee:

- [Nicole Washington](User%253ANLWashington "User%253ANLWashington"), Chair
  (Lawrence Berkeley National Laboratory;
  <a href="http://www.modencode.org" class="external text"
  rel="nofollow">modENCODE</a> and developer of
  [Phenote](Phenote "Phenote"))
- [Sheldon McKay](User%253AMckays "User%253AMckays") (University of Arizona;
  <a href="http://www.iplantcollaborative.org/" class="external text"
  rel="nofollow">The iPlant collaborative</a> and developer of
  [GBrowse_syn](GBrowse_syn.1 "GBrowse syn"))
- [Robert Buels](User%253ARobertBuels "User%253ARobertBuels") (Cornell
  University; <a href="http://solgenomics.net/" class="external text"
  rel="nofollow">Solanaceae Genomics Network (SGN)</a>)
- [Scott Cain](User%253AScott "User%253AScott") (Ontario Institute for Cancer
  Research; GMOD Program Coordinator)
- [Hilmar Lapp](User%253AHlapp "User%253AHlapp")
  (<a href="http://www.nescent.org" class="external text"
  rel="nofollow">NESCent</a>)
- [Dave Clements](User%253AClements "User%253AClements")
  (<a href="http://www.nescent.org" class="external text"
  rel="nofollow">NESCent</a>; [GMOD Help
  Desk](GMOD_Help_Desk "GMOD Help Desk"))

The actual agenda will be determined by the participants. At the event,
participants will split into subgroups. The composition and tasks of the
subgroups will be guided by the overall objectives, but will otherwise
emerge and be self-determined by the participants both prior to and at
the event.

After the hackathon organizers and GMOD staff will followup with
participants to help with seeing unfinished tasks through to completion,
similar as has been done in GMOD following the [GMOD
Meetings](Meetings "Meetings").

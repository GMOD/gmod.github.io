---
title: "NIH 2002 Workshop on Model Organism Databases"
---




<span id="top"></span>




# <span dir="auto">NIH 2002 Workshop on Model Organism Databases</span>









**<a href="http://www.genome.gov/10006356" class="external text"
rel="nofollow"><br />
NIH/NIAID/Wellcome Trust Workshop on Model Organism Databases, April
2002<br />
</a>**

The above report discusses and summarizes good practices for new and
existing model organism/genome databases.

**Report from the NIH/NIAID/Wellcome Trust Workshop on Model Organism
Databases**

National Human Genome Research Institute Bethesda, Md. April 29-30, 2002

  


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Participants</span>](#Participants)
- [<span class="tocnumber">2</span> <span class="toctext">Executive
  Summary</span>](#Executive_Summary)
- [<span class="tocnumber">3</span> <span class="toctext">Detailed
  Report</span>](#Detailed_Report)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Benefits
    of Reuse</span>](#Benefits_of_Reuse)
  - [<span class="tocnumber">3.2</span> <span class="toctext">Good
    Practices and Other Guidelines for New
    MODs</span>](#Good_Practices_and_Other_Guidelines_for_New_MODs)
    - [<span class="tocnumber">3.2.1</span> <span class="toctext">1.
      Rely on institution practices rather than
      people</span>](#1._Rely_on_institution_practices_rather_than_people)
    - [<span class="tocnumber">3.2.2</span> <span class="toctext">2.
      Reuse software, don't reinvent
      it</span>](#2._Reuse_software.2C_don.27t_reinvent_it)
    - [<span class="tocnumber">3.2.3</span> <span class="toctext">3.
      Seek "co-curation" opportunities whenever
      possible</span>](#3._Seek_.22co-curation.22_opportunities_whenever_possible)
    - [<span class="tocnumber">3.2.4</span> <span class="toctext">4.
      Design software with a view to
      interoperability</span>](#4._Design_software_with_a_view_to_interoperability)
    - [<span class="tocnumber">3.2.5</span> <span class="toctext">5.
      Perform a thorough needs analysis. Repeat
      regularly</span>](#5._Perform_a_thorough_needs_analysis._Repeat_regularly)
    - [<span class="tocnumber">3.2.6</span> <span class="toctext">6.
      Involve the research
      community</span>](#6._Involve_the_research_community)
    - [<span class="tocnumber">3.2.7</span> <span class="toctext">7.
      Interact with other MODs</span>](#7._Interact_with_other_MODs)
    - [<span class="tocnumber">3.2.8</span> <span class="toctext">8. Use
      shared resources such as compute grids when
      appropriate</span>](#8._Use_shared_resources_such_as_compute_grids_when_appropriate)
  - [<span class="tocnumber">3.3</span> <span class="toctext">A
    Framework for Assessing Computational
    Interoperability</span>](#A_Framework_for_Assessing_Computational_Interoperability)
    - [<span class="tocnumber">3.3.1</span> <span class="toctext">Level
      -1: Web linking, data dumps to FTP
      site</span>](#Level_-1:_Web_linking.2C_data_dumps_to_FTP_site)
    - [<span class="tocnumber">3.3.2</span> <span class="toctext">Level
      0: Published API</span>](#Level_0:_Published_API)
    - [<span class="tocnumber">3.3.3</span> <span class="toctext">Level
      1: Published API with a test
      suite</span>](#Level_1:_Published_API_with_a_test_suite)
    - [<span class="tocnumber">3.3.4</span> <span class="toctext">Level
      2: Published "effectively stable" API with a test
      suite</span>](#Level_2:_Published_.22effectively_stable.22_API_with_a_test_suite)
    - [<span class="tocnumber">3.3.5</span> <span class="toctext">Level
      3: Shared API</span>](#Level_3:_Shared_API)
    - [<span class="tocnumber">3.3.6</span> <span class="toctext">Level
      4: Shared API based on a standard API
      "flavor."</span>](#Level_4:_Shared_API_based_on_a_standard_API_.22flavor..22)
    - [<span class="tocnumber">3.3.7</span> <span class="toctext">Level
      5: Adopt an approved preexisting
      API</span>](#Level_5:_Adopt_an_approved_preexisting_API)
  - [<span class="tocnumber">3.4</span> <span class="toctext">Moving
    Towards Generic
    Components</span>](#Moving_Towards_Generic_Components)
  - [<span class="tocnumber">3.5</span> <span class="toctext">Need for
    Continued Funding</span>](#Need_for_Continued_Funding)
  - [<span class="tocnumber">3.6</span> <span class="toctext">High
    Priority Needs</span>](#High_Priority_Needs)
  - [<span class="tocnumber">3.7</span>
    <span class="toctext">Intellectual Property
    Issues</span>](#Intellectual_Property_Issues)
    - [<span class="tocnumber">3.7.1</span>
      <span class="toctext">Appendix A: Minority opinion on IP from Rolf
      Apweiler</span>](#Appendix_A:_Minority_opinion_on_IP_from_Rolf_Apweiler)
    - [<span class="tocnumber">3.7.2</span>
      <span class="toctext">Appendix B: Minority opinion on IP from
      Peter
      Karp</span>](#Appendix_B:_Minority_opinion_on_IP_from_Peter_Karp)



## <span id="Participants" class="mw-headline">Participants</span>

From April 29 through April 30, representatives of the major model
organism databases (MODs), funding agencies and other interested parties
met to discuss current and future needs for model organism databases
(See Participants). The workshop attendees were tasked to develop
strategies to increase the quality, and decrease the cost and startup
time, of new publicly funded MODs.

After an introductory session, attendees joined break out working
groups, and later reassembled in a general discussion group to present
the reports of working groups and to develop a consensus statement. This
document represents the consensus of the workshop.

## <span id="Executive_Summary" class="mw-headline">Executive Summary</span>

MODs are for more than model organisms. Although the term "Model
Organism Database" was originally coined to describe databases devoted
to any of the model organisms, the term has taken on broader meaning in
recent years, and now signifies any curated community database that is
dedicated to a single species or related clade of species.

The essential nature of MODs. Model organism databases provide many
essential services to the research community, including providing access
to genome-scale data sets, adding value to these data sets by manual and
automatic re-annotation, developing controlled vocabularies and
nomenclatures, and relating this information to the classical
hypothesis-driven research published in the literature. The need for MOD
services will only increase as biological research moves increasingly
toward high-throughput techniques.

The benefits of reuse. The cost, both in time and in funds, of
establishing a new MOD is non-trivial. A significant benefit can be
realized by reusing resources developed by existing MODs when
establishing new ones. These resources include management structures,
standard operating procedures, database models and software. Such reuse
of existing resources will result in higher quality overall, and will
also foster collaboration and data sharing among MODs.

Good practices for MODs. The workshop identified a number of "good
practices" for MODs that will ease the establishment of new projects and
encourage interoperability and cooperation between existing ones. These
good practices are enumerated in detail in the body of this report, but
the common thread is to make use of existing expertise, software and
protocols whenever possible.

High priority needs. The attendees developed a prioritized set of needs
for current and new MODs. Chief among these is the need for a repository
of well-documented data models.

Intellectual property issues. Workshop attendees agreed that it is
highly desirable for software developed for use by MODs be available
free to academics and available under terms that guarantee its
availability in perpetuity. However, this is a complex issue that is
discussed in more detail in the body of the report.

Moving towards generic components. The workshop attendees propose a set
of follow-on workshops directed towards establishing cohesion among, and
technical interoperability between, current and anticipated MODs. The
goal of these workshops would be to develop a common set of data format
standards, protocols, standard operating procedures and data models that
would form the basis of a set of generic components for MOD building.

The need for continued funding. Recognizing the essential nature of MODs
for the curation and distribution of genomic information, workshop
attendees were united in recommending that funding agencies bear in mind
the need to maintain existing MODs and to establish new MODs in order to
keep pace with the expansion of genomic research.

  

## <span id="Detailed_Report" class="mw-headline">Detailed Report</span>

Model organism system databases (MODs) are a vital tool for scientific
research. They share a common set of tasks: to collect and curate data
from the scientific literature such as mutations, alleles, genetic and
physical maps, and phenotypes; to integrate this information with the
results of large-scale experiments such as microarray studies, SNP
screens and protein-interaction studies; to provide reagent resources
such as stocks, genetic constructs and clones; and lastly to provide a
common nomenclature for gene symbols, anatomic terms and other elements
of the scientific vocabulary. By integrating, and in some cases
reanalyzing, these data, MODs are able to greatly enhance their value.
This information is made available to the research community via a Web
site that also serves as a nexus for discussions, announcements of
interest to the community and data submissions.

It is important to note that with respect to genomic data, the key role
of the model organism databases is to connect genomic features to the
experimental data from both high-throughput and classical biology
studies of the organism, a role that is distinct from that of automated
genome annotation projects. Also, MODs have an interpretative and
curatorial role that distinguishes them from GenBank and other strictly
archival databases.

Five well-established model organism databases are FlyBase,
SGD/MIPS/YPD, MGD, WormBase, and TAIR which are associated respectively
with D. melanogaster, S. cerevisiae, M. musculus, C. elegans and A.
thaliana. In recent years, EnsEMBL has become something of a MOD for
vertebrates, although currently its curatorial role is limited to
genomic annotation on human chromosomes 22 and 20.

As the cost of genome sequencing has come down, an increasing number
organisms are either now in the process of sequencing, such as Anopheles
gambia, Oryza sativa, Plasmodium falciparum, Rattus rattus, or are
likely to be sequenced in the near future, such as Dictyostelium
discoidium, Leishmania donovani, Zea maize, sea urchin, honeybee and
cow. There is a clear and present need for new MODs to manage these data
sets.

However, setting up a MOD from the ground up is expensive and
time-consuming, and the solutions arrived at are often strikingly
different from other MODs in terms of data models, user interfaces and
data exchange formats. As a result, the research community has to
struggle to adjust to new user interfaces, and the MODs themselves must
devote precious resources to exchanging and relating to each other's
information.

### <span id="Benefits_of_Reuse" class="mw-headline">Benefits of Reuse</span>

The best way to decrease the time and financial resources needed to
launch a new MOD is to reuse resources already invested in existing
MODs. The chief of these resources are management structures, standard
operating procedures, outreach and education strategies and other
nuggets of accumulated information learned the hard way during the
administration of the current set of MODs. Other valuable resources are
data models for representing biological information and their associated
database schemas, and software, including middleware systems, curators'
tools, data analysis pipelines and visualization software.

Reusing these resources will immediately ease the learning curve for new
MODs and help get new projects up and running faster. However, reuse is
also extremely beneficial for established MODs. Drawing from the same
pool of database schemas, middleware and software is the first step
towards making MODs interoperable. It gives established MODs the
flexibility to add new features without extensive development time, and
it makes it possible and convenient for MODs to interchange data. This
consideration will become increasingly important as comparative genomics
comes into ascendancy over the next few years.

In the best of worlds, setting up a new MOD would be a matter of picking
and choosing from among a construction set of generic components and
simply connecting them up. The components would include operational
modules, such as rules for extracting protein/protein interactions from
a published paper, database schemas, such as a schema for representing
QTL mapping results and software, such as a microarray hierarchical
clustering module.

The workshop attendees were careful to note that reuse may not lead
directly to reduced costs for the funding agencies. Rather, reuse will
increase the quality of the MODs to the research community without a
concomitant increase in the price tag.

### <span id="Good_Practices_and_Other_Guidelines_for_New_MODs" class="mw-headline">Good Practices and Other Guidelines for New MODs</span>

The workshop attendees identified a set of "good practices" for new and
existing MODs. We feel that following these practices will make it
easier to initiate, build and maintain MODs while increasing their
overall usefulness. Although the list is not intended to be normative,
we feel that it represents commonly accepted practices and will need to
be explicitly justified if departed from.

For all MODs:

#### <span id="1._Rely_on_institution_practices_rather_than_people" class="mw-headline">1. Rely on institution practices rather than people</span>

MODs should be designed to transcend the people who run them. This means
that the MOD should strive to create an institutional memory that is
stable against changes in personnel or administration. In practice, this
means creating written data release policies, written standard operating
procedures and written quality assurance procedures. The documentation
should be clear, detailed and up to date and treated with the same
respect as the biological data that is being curated.

For the software used and developed by the MOD, good software
engineering practices should be followed. At the minimum, this calls for
a source code control system, a suite of regression tests and regular
code review.

Naturally, all software, data and documentation produced by a MOD should
be archived at a secure offsite location in case of physical disaster.

#### <span id="2._Reuse_software.2C_don.27t_reinvent_it" class="mw-headline">2. Reuse software, don't reinvent it</span>

MODs should strive to reuse software whenever possible. Although it may
seem simpler to re-implement a piece of existing software that doesn't
quite fit rather than modifying it, in practice this leads to greater
costs down the road in the form of interoperability losses and a limited
pool of developers who understand the software.

#### <span id="3._Seek_.22co-curation.22_opportunities_whenever_possible" class="mw-headline">3. Seek "co-curation" opportunities whenever possible</span>

MODs should look for opportunities to establish co-curation
relationships with archival databases as well as those that perform a
specialist function such as genome annotation. During the meeting,
several MODs cited mutually beneficial arrangements with SwissProt, NCBI
and EnsEMBL to combine the curational strengths of the MOD with the
computational strengths of the specialist database.

#### <span id="4._Design_software_with_a_view_to_interoperability" class="mw-headline">4. Design software with a view to interoperability</span>

Software interoperability is good because it fosters reuse, increases
the pool of developers who are comfortable with the system and allows
robust modular designs. In general we see two types of interoperability.
Semantic interoperability is interoperability at the level of the data
model, and comprises shared ontologies and shared high level data
models. Compute interoperability allows software to communicate via
shared file formats, transport protocols and database schemas. Both
types of interoperability are needed to create truly generic software
components, but either in isolation is better than none.

To achieve semantic interoperability, we strongly recommend that MODs
make use of common biological ontologies such as those posted on the
Global Open Biological Ontologies ("gobo") site \[geneontology.org\]. If
an appropriate ontology is not already available, MODs are urged to form
consortia to develop the needed ontology following an open model similar
to that used by the Gene Ontology Consortium.

To achieve compute interoperability, we urge MODs to use standard file
and exchange formats for representing data sets, or to meet jointly to
design the necessary formats. It is also important for MODs to make an
explicit statement of the level of compute interoperability that they
are striving to achieve (see below).

#### <span id="5._Perform_a_thorough_needs_analysis._Repeat_regularly" class="mw-headline">5. Perform a thorough needs analysis. Repeat regularly</span>

Every MOD should perform a needs analysis early in its life cycle. This
may involve meeting with representatives of the research community,
circulating questionnaires, holding focus groups, and using other
techniques to gain an understanding of what the research community needs
from the MOD and what its priorities are. Since priorities change, this
needs analysis should be repeated at regular intervals.

#### <span id="6._Involve_the_research_community" class="mw-headline">6. Involve the research community</span>

MODs need to be integrated into their research community. Ways to
achieve this includes presentations at research meetings, sponsorship of
workshops, internship programs in which members of the research
community spend some time with the MOD and vice versa and collaborations
on particular research projects. Programs that involve members of the
research community in a curatorial role are strongly encouraged.

#### <span id="7._Interact_with_other_MODs" class="mw-headline">7. Interact with other MODs</span>

MODs share a common set of challenges and can benefit immensely from
exchanging viewpoints and lessons learned. The workshop strongly
endorsed activities that would build a sense of community among the MODs
themselves. More informally, the MODs should interact with each other on
a regular basis.

#### <span id="8._Use_shared_resources_such_as_compute_grids_when_appropriate" class="mw-headline">8. Use shared resources such as compute grids when appropriate</span>

By the same token that shared software strengthens MODs, sharing compute
resources will lighten the load on new and existing MODs. When
appropriate, MODs should seek opportunities to pool hardware resources
using grid technologies. These technologies may also permit the
different research communities to ask complex queries over the data
contained within a number of MODs.

  

### <span id="A_Framework_for_Assessing_Computational_Interoperability" class="mw-headline">A Framework for Assessing Computational Interoperability</span>

During its discussion of strategies for enhancing computational
interoperability among the MODs, workshop attendees developed a
conceptual framework in which to discuss computational interoperability
and the degree to which a MOD had succeeded in meeting its objectives of
providing this service. Under this framework, computational
interoperability is represented as seven levels of compliance.

  

#### <span id="Level_-1:_Web_linking.2C_data_dumps_to_FTP_site" class="mw-headline">Level -1: Web linking, data dumps to FTP site</span>

This level, which is given a negative number to indicate a minimum level
of interoperability, is the status quo. There is no true
interoperability among MODs; information is transferred by manual
conversion of ad hoc data files dumped to the MODs FTP site or by
"screen scraping" the MODs Web site. The structure of the Web pages or
the format of the FTP dumps can change without warning.

  

#### <span id="Level_0:_Published_API" class="mw-headline">Level 0: Published API</span>

Under level 0, the MOD has a published application programmer interface
that allows third parties to access the MODs' information. There is no
restriction as to what the API can be, but typically it is a software
package that allows third parties to connect to the MODs' database or
Web site and transfer information in a described format. The API may
change without warning, and there is no requirement that the same API
may be shared among more than one MOD.

  

#### <span id="Level_1:_Published_API_with_a_test_suite" class="mw-headline">Level 1: Published API with a test suite</span>

Level 1 is the same as level 0, with the added requirement that the MOD
publish a test suite to ensure that it is compliant with its own API.

  

#### <span id="Level_2:_Published_.22effectively_stable.22_API_with_a_test_suite" class="mw-headline">Level 2: Published "effectively stable" API with a test suite</span>

Level 2 adds the requirement that the API be stable. That is, new
features may be added to the API over time, but the changes will not
break backward compatibility with scripts written to run off earlier
versions of the API.

  

#### <span id="Level_3:_Shared_API" class="mw-headline">Level 3: Shared API</span>

At level 3, the API is based on a shared specification that is used by
more than one MOD. That is, programs written against the API will work
without changes across all MODs that have adapted that API. The API must
be effectively stable and have a test suite, as per earlier levels, but
there is no restriction on the type of API, data formats or transport
protocols.

  

#### <span id="Level_4:_Shared_API_based_on_a_standard_API_.22flavor..22" class="mw-headline">Level 4: Shared API based on a standard API "flavor."</span>

Level 4 restricts the API to one of a number of standard "flavors" that
have been approved by a MOD interoperability working group. A flavor
typically consists of a data format and transport protocol such as
SOAP/XML.

  

#### <span id="Level_5:_Adopt_an_approved_preexisting_API" class="mw-headline">Level 5: Adopt an approved preexisting API</span>

In level 5, the MOD adopts an API that has been approved for use by a
MOD interoperability working group.

The intent of this conceptual framework is to encourage MODs, when
drafting grant proposals and data release policies, to explicitly state
what level of interoperability they are striving to achieve, to justify
this choice and to be realistic when allocating resources to achieve the
chosen goal.

Levels 4 and 5 imply the formation of an expert working group that will
make recommendations as to acceptable shared APIs. The workshop series
proposed in the next section would provide a mechanism for bringing such
a group together.

  

### <span id="Moving_Towards_Generic_Components" class="mw-headline">Moving Towards Generic Components</span>

The workshop attendees enthusiastically endorsed the concept of generic
components for MODs. These components, which consist of a collection of
standard operating procedures, ontologies, database schemas and software
components, will make it easier to start new MODs and will improve the
quality, stability and future expansion of existing ones. As stated
earlier, generic components may not necessarily reduce MOD budgets, but
will significantly enhance efficiency.

The development of these components will require an unprecedented degree
of coordination and cooperation among the MODs. To achieve this, the
attendees propose that we establish an annual series of MOD-wide
meetings, to be attended by representatives of established and nascent
MODs. At these meetings, MODs will present their work, discuss
challenges and interchange ideas, all of which will help foster a sense
of community that is only recently appearing among the MODs. These main
meetings will include a set of workshops and satellites at which special
interest groups, such as MOD curators, can meet.

At more frequent intervals, we propose a series of small, directed
workshops to address the development of generic modules. The subject of
the first such workshop would be a top-level discussion to divide the
problem into a set of biological domains, such as phenotypes or
literature curation. The second and subsequent workshops would each
focus on one of these domains, for example literature curation.

The workshops would be attended by MOD programmers and curators, and
would deal with the following issues with respect to the focus domain:

- Current practices ("show and tell").
- Curation standards.
- Standard operating procedures.
- Computational interoperability with respect to:
- Data format standards.
- Transport standards.
- The task of each workshop would be to develop a plan for
  standardization of the focus domain, and a schedule for implementating
  the plan. Workshop attendees would meet again at subsequent
  domain-focused workshops in order to assess progress towards
  development of the components and to test their interoperability.

Between workshops, development work will be coordinated through the GMOD
Web site (www.gmod.org). This is a SourceForge-sponsored development
site that is already used by WormBase, FlyBase and TAIR to coordinate
common software development work. Because of the large amount of detail
work that is required to bring off this type of coordinated activity, we
propose that a full-time coordinator be hired or appointed specifically
for the purpose of managing communication between MOD development
efforts, testing interoperability among components, overseeing the GMOD
Web site, organizing the workshops, and supervising orderly releases of
components and their documentation.

Finally, the development work on generic components would be open to the
wider community - anyone would be free to join under the accepted
community practices of the open source model.

### <span id="Need_for_Continued_Funding" class="mw-headline">Need for Continued Funding</span>

Attendees felt that the role of the MODs in organizing genomic data,
adding value to it, and effecting community education and outreach, was
essential in order to fully realize society's investment in genome
research. Because of the length of time it takes to establish the human
infrastructure of an effective MOD and the fragility of this structure
should this infrastructure be disrupted by a temporary loss of funding,
attendees felt that it was essential that MODs have sources of stable,
long-term funding.

Although the goal of self-sufficiency is appealing, attendees felt that
it would be undesirable for MODs to charge access fees to community
researchers, and that even if such a path were instituted (as occurred
when SwissProt began licensing content to non-academic users), that it
was unrealistic to expect that such fees would enable MODs to become
self-sufficient. MODs will remain reliant on grant-based funding for
some time into the future.

Workshop attendees urge that governmental and charitable organizations
take into account the need to maintain existing MODs and to underwrite
the creation of new ones as they draft their strategic plans for future
genome research.

### <span id="High_Priority_Needs" class="mw-headline">High Priority Needs</span>

During the workshop, a breakout group was assigned the task of
prioritizing the current needs of existing and nascent MODs. The
following is the list of components identified by this group as urgently
needed. The list is prioritized from highest need to lowest:

- Documented data models
- Documented SOPs.
- Continuing ontology development.
- A documented model organism database schema.
- Viewers:
  - Annotated sequences
  - Comparative, functional and relational map viewers
  - Data capture & curation tools for:
  - Sequence annotation
  - Comparative sequence analysis
  - Literature tracking and management
  - Microarray data
  - Expression data
  - Molecular interactions
  - Functional annotation of proteins
  - Phenotype data
  - Image curation and searching
  - Ontology creation and maintenance aids
  - Data export tools
  - Network viewers and tools (regulatory, protein-protein interaction)

### <span id="Intellectual_Property_Issues" class="mw-headline">Intellectual Property Issues</span>

On the issue of MOD intellectual property issues, while there was broad
acceptance of the principle that scientific data should be freely
available, there was a difference of opinion on how the software
developed by MODs should be handled.

A number of attendees advocated the position that software developed by
MODs should be required to be made available under an Open Source
license using one of the licenses approved by the Open Source Initiative
\[opensource.org\]. The main rationale for this position was concern
that proprietary software could be commercialized in such a way as to
make it unavailable for use by MODs, as occurred recently in the case of
the Neomorphics Genome Software Development Kit, or might become
orphaned if the developer were to go out of business, as occurred in the
case of Doubletwist and the Agave genome data transfer format API. The
advocates of this position also argued that Open Source software lends
itself to community development and was more likely to be easily reused.

Other attendees expressed concern that strict Open Source licensing
would place harmful restraints on the ability of researchers to
commercialize their efforts or to establish public/private partnerships.
They also noted that commercialization can in fact be a method for
ensuring continued availability of software systems when government
funding is discontinued, as, for example, occurred with SwissProt and
GDB. They also argued that an insistence on Open Source licensing could
inhibit some private research foundations from participating in MOD
development.

Workshop attendees agreed on the following consensus position: that
software developed under MOD funding should be free to academics and
made available under licenses that would guarantee its availability in
perpetuity. They further agreed that the source code for this software
be available to academics, but not necessarily distributed under an Open
Source license.

The appendices to this report include brief minority opinions by Peter
Karp and Rolf Apweiler that express their positions with respect to
intellectual property issues.

#### <span id="Appendix_A:_Minority_opinion_on_IP_from_Rolf_Apweiler" class="mw-headline">Appendix A: Minority opinion on IP from Rolf Apweiler</span>

On the issue of MOD intellectual property issues, I advocate strongly
that both the scientific data and the software developed by MODs should
be freely available to all potential users. The MODs are financed by
tax-payer money. Not only academics, but also industry has contributed
to taxes. Thus, I see here no reason to treat commercial users
differently from academic users.

  

#### <span id="Appendix_B:_Minority_opinion_on_IP_from_Peter_Karp" class="mw-headline">Appendix B: Minority opinion on IP from Peter Karp</span>

Dr. Karp refers readers to the recent (21 May 2002) statement on
Bioinformatics software \[iscb.org\], published by the International
Society for Computational Biology (ISB). An excerpt of the statement,
published in full on the ISB Web site, is excerpted here:

1\. The term "open source" has taken on many different meanings. This
term creates confusion in discussions of software availability;
therefore the term should be carefully qualified to indicate which
variation of the open-source model is intended.

2\. Government agencies that fund bioinformatics research should NOT
REQUIRE that software produced with government research funds must be
distributed under open-source license (particularly given the ambiguity
in the meaning of that term). Because of the complexity inherent in
software, no single distribution model is appropriate for all research
projects. Government agencies should require clear statements of
software availability in grant proposals.

3\. As reviewers of bioinformatics grant applications, ISCB scientists
have noted that these applications often contain confusing or unclear
statements regarding the availability of software that will be developed
under government grant funds. This statement contains several
definitions of software availability that ISCB recommends for use in
bioinformatics grant applications. ISCB recommends one of those
definitions as a minimal requirement of software availability that
funding agencies should require.

  
*Last Reviewed: April 2006*




[Categories](Special%253ACategories "Special%253ACategories"):

- [GMOD Best
  Practices](Category%253AGMOD_Best_Practices "Category%253AGMOD Best Practices")
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/NIH_2002_Workshop_on_Model_Organism_Databases"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 05:03 on 28 January
  2008.</span>
<!-- - <span id="footer-info-viewcount">28,150 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





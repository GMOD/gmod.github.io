---
title: "GSOC Project Ideas 2018"
---
# GSOC Project Ideas 2018

There are plenty of challenging and interesting project ideas this year.
These projects include a broad set of skills, technologies, and domains,
such as GUIs, database integration and algorithms.

Students are also encouraged to propose their own ideas related to our
projects. If you have strong computer skills and have an interest in
biology or bioinformatics, you should definitely apply! Do not hesitate
to propose your own project idea: some of the best applications we see
are by students that go this route. As long as it is relevant to one of
our projects, we will give it serious consideration. Creativity and
self-motivation are great traits for open source programmers.

- **Project Idea Name (Project Name/Lab Name)**
  - *Brief explanation:* Brief description of the idea, including any
    relevant links, etc.
  - *Expected results:* describe the outcome of the project idea.
  - *Knowledge prerequisites:* programming language(s) to be used, plus
    any other particular computer science skills needed.i
  - *Skill level:* Basic, Medium or Advanced.
  - *Mentors:* name + contact details of the lead mentor, name + contact
    details of backup mentor.


Here is a list of the proposed project ideas for 2018:

- **Project Idea 1: Incorporating different database searching
  algorithms into SequenceServer (SequenceServer/Wurmlab)**
  - *Brief explanation:* It is now trivial to generate large amounts of
    DNA sequence data; the challenge lies in making sense of the data.
    In many cases, researchers can gain important insights by comparing
    newly obtained sequences to previously know sequences.
    SequenceServer
    (<a href="http://www.sequenceserver.com" class="external free"
    rel="nofollow">http://www.sequenceserver.com</a>) is an easy to
    setup and simple to use graphical interface for searching sequence
    databases and interpreting the results. Based on the type
    (nucleotide or amino acid) of the query sequences and sequences in
    the selected databases SequenceServer automatically selects one of
    the five basic BLAST
    (<a href="https://en.wikipedia.org/wiki/BLAST" class="external free"
    rel="nofollow">https://en.wikipedia.org/wiki/BLAST</a>) algorithms
    to use. However, depending on characteristics of query and database
    sequences (e.g., size, error profile, evolutionary distance) other
    algorithms, or a combination of different BLAST parameters (other
    than the defaults) can be more appropriate. This goal of this
    project is to identify the most common use cases and implement the
    functionality in SequenceServer.
  - *Expected results:* describe the outcome of the project idea.
  - *Knowledge prerequisites:* Working knowledge of Ruby and JavaScript
    (we use jQuery, React, and SystemJS); basic biology and informatics.
  - *Skill level:* Advanced
  - *Mentors:* Mentors: Anurag Priyam (anurag.priyam@qmul.ac.uk),
    Yannick Wurm (y.wurm@qmul.ac.uk)



- **Project Idea 2: Reactome Javascript Widget for Pathway Browser**
  - *Brief explanation:* Reactome
    (<a href="https://reactome.org" class="external free"
    rel="nofollow">https://reactome.org</a>) is a free, open-source,
    curated and peer-reviewed knowledge-base of biomolecular pathways
    aiming to provide intuitive bioinformatics tools for the
    visualization, interpretation and analysis of pathway knowledge. The
    Pathway Browser
    (<a href="https://reactome.org/PathwayBrowser" class="external free"
    rel="nofollow">https://reactome.org/PathwayBrowser</a>) is
    Reactome’s primary means of viewing and interacting with specific
    pathways. (a short introduction video
    <a href="https://youtu.be/-skixrvI4nU" class="external free"
    rel="nofollow">https://youtu.be/-skixrvI4nU</a>). One of the tabs in
    the details panel currently shows the participating molecules of the
    selected items in the PathwayBrowser in a tabular fashion. The
    proposed project is to redesign the way in which participating
    molecules are shown to improve users experience as well as
    integrating the interaction data currently fetch from IntAct
    (<a href="https://www.ebi.ac.uk/intact/" class="external free"
    rel="nofollow">https://www.ebi.ac.uk/intact/</a>).
  - *Expected results:* An improved javascript widget to be integrated
    in the Pathway browser to improve the participating molecules tab in
    the Reactome Pathway Browser.
  - *Knowledge prerequisites:* javascript and java as programming
    languages, data visualisation skills.
  - *Skill level:* Medium.
  - *Mentors:* Antonio Fabregat (fabregat@ebi.ac.uk), Konstantinos
    Sidiropoulos (ksidiro@ebi.ac.uk).



- **Project Idea 3: Use Galaxy to run Reactome analysis and processes on
  genomic data**
  - *Brief explanation:* Reactome is a free, open-source, curated and
    peer reviewed pathway database. Our goal is to provide intuitive
    bioinformatics tools for the visualization, interpretation and
    analysis of pathway knowledge to support basic research, genome
    analysis, modeling, systems biology and education. Galaxy is an
    open, web-based platform for data intensive biomedical research,
    which allows users to perform, reproduce, and share complete
    analyses.
  - *Expected results:* There are two potential sub-projects. 1) Adding
    Reactome as a data resource in Galaxy, to enable Galaxy users to use
    Reactome reaction and pathway annotation data, and 2) Performing
    identifier mapping and over-representation analysis workflows from
    Reactome in Galaxy. Reactome Github:
    <a href="https://github.com/reactome/" class="external free"
    rel="nofollow">https://github.com/reactome/</a>
  - *Knowledge prerequisites:* Galaxy, Java, web services
  - *Skill level:* Medium
  - *Mentor:* Robin Haw (robin.haw@oicr.on.ca) and Joel Weiser
    (joel.weiser@oicr.on.ca).



- **Project Idea 4: Participating Molecules Widget (Reactome)**
  - *Brief explanation:* Reactome
    (<a href="https://reactome.org" class="external free"
    rel="nofollow">https://reactome.org</a>) is a free, open-source,
    curated and peer-reviewed knowledge-base of biomolecular pathways
    aiming to provide intuitive bioinformatics tools for the
    visualization, interpretation and analysis of pathway knowledge. The
    Pathway Browser
    (<a href="https://reactome.org/PathwayBrowser" class="external free"
    rel="nofollow">https://reactome.org/PathwayBrowser</a>) is
    Reactome’s primary means of viewing and interacting with specific
    pathways. (a short introduction video
    <a href="https://youtu.be/-skixrvI4nU" class="external free"
    rel="nofollow">https://youtu.be/-skixrvI4nU</a>). One of the tabs in
    the details panel currently shows the participating molecules of the
    selected items in the PathwayBrowser in a tabular fashion. The
    proposed project is to redesign the way in which participating
    molecules are shown to improve users experience as well as
    integrating the interaction data currently fetch from IntAct
    (<a href="https://www.ebi.ac.uk/intact/" class="external free"
    rel="nofollow">https://www.ebi.ac.uk/intact/</a>).
  - *Expected results:* An improved javascript widget to be integrated
    in the Pathway browser to improve the participating molecules tab in
    the Reactome Pathway Browser.
  - *Knowledge prerequisites:* javascript and java as programming
    languages, data visualisation skills.
  - *Skill level:* Medium.
  - *Mentors:* Antonio Fabregat (fabregat@ebi.ac.uk), Konstantinos
    Sidiropoulos (ksidiro@ebi.ac.uk).



- **Project Idea 5: Community-driven curation (WormBase)**
  - *Brief explanation:* \[Risky/Exploratory\] - Scientific databases
    that curate the primary literature face an enormous challenge: the
    number of research papers continues to skyrocket, but the process of
    curation is slow, tedious, and resource-constrained. One solution is
    to engage the primary research community in curation of their own
    data, a strategy referred to as "community curation". At the same
    time, such strategies require careful and automated quality control
    to ensure the integrity of submissions and to prevent abuse of the
    system. We'd like to build a data submission and reviewing system
    that can be generalized to work on the diverse data types that we
    curate.
  - *Expected results:* A Datomic <a
    href="https://docs.datomic.com/on-prem/getting-started/brief-overview.html"
    class="external free"
    rel="nofollow">https://docs.datomic.com/on-prem/getting-started/brief-overview.html</a>
    database that models "under review" content as well as approved
    content. A REST API for reviewing and approving content, and
    accessing content that may or may not include those that are under
    review.
  - *Knowledge prerequisites:* Clojure, database
  - *Skill level:* Advanced
  - *Mentors:* Adam Wright, Sibyl Gao, Matt Russell



- **Project Idea 6: Revision tracking curation database and tools
  (WormBase)**
  - *Brief explanation:* \[Fun/Peripheral\] - Serving up-to-date content
    is critical for repositories like WormBase supporting basic
    scientific research. Our current workflow consists of periodic
    integration of multiple databases into a single production database
    every 2 months. While stable, this impedes real-time publication of
    new data. Having a live-curated database to power our website
    motivated our ongoing database migration to Datomic, a transactional
    database with change tracking and a queryable history. It will
    enable us to build a live-curated website with an emphasis on change
    tracking. In addition to having curated content immediately
    available to users, this website will provide information on what
    has changed recently along with metadata associated with these
    updates, such as citations and remarks. We'd like to start by making
    a prototype that works on the person/lineage data.
  - *Expected results:* A Datomic <a
    href="https://docs.datomic.com/on-prem/getting-started/brief-overview.html"
    class="external free"
    rel="nofollow">https://docs.datomic.com/on-prem/getting-started/brief-overview.html</a>
    database that models person/lineage data and a REST API for
    submitting and retrieving content, reviewing change history, and
    optionally a user interface
  - *Knowledge prerequisites:* Clojure, database
  - *Skill level:* Medium
  - *Mentors:* Adam Wright, Sibyl Gao, Matt Russell



- **Project Idea 7: Multi-container cloud deployment (WormBase)**
  - *Brief explanation:* \[Infrastructure/Automation\] - Continuously
    deploying code and data is a long term goal of WormBase. Over the
    past several years, we have been moving towards a Docker based
    approach, using AWS' ElasticBeanstalk to deploy individual
    containers. As we deploy more components of our microservice based
    architecture, there is an increasing need to coordinate the
    deployment of the individual services. This project focuses on the
    devops side of WormBase, creating a prototype of a provisioning
    system using modern cloud deployment technologies to streamline our
    workflow.
  - *Expected results:* A proof of concept, Docker based, system for
    deploying and maintaining our microservice architecture.
  - *Knowledge prerequisites:* Docker, DevOps, AWS, Kubernetes
  - *Skill level:* Medium
  - *Mentors:* Adam Wright



- **Project Idea 8: Improve search result relevance (WormBase)**
  - *Brief explanation:* \[Core development\] - An effective search is a
    critical tool for any large data repository. This project seeks to
    improve an ElasticSearch-backed service at WormBase with improved
    code for indexing and search queries. A related component of this
    project will use analytics to better understand user behavior and
    how it affects search results.
  - *Expected results:* Improve the relevance of search result by
    improving the code that indexes the content and/or queries the
    search index
  - *Knowledge prerequisites:* Elasticsearch
  - *Skill level:* Medium
  - *Mentors:* Sibyl Gao



- **Project Idea 9: Navigating search with facets (WormBase)**
  - *Brief explanation:* \[Core/UI development\] - Finding meaningful
    results in biological data is rarely as simple as conducting a
    single, basic search. Instead, users often need to step through
    results with filters to gain new insight into the data. This project
    aims to add facets, counts, and dynamic graphs to search results
    stored in our main ElasticSearch database.
  - *Expected results:* Improve search interface through the use of
    facets and relevant visualizations.
  - *Knowledge prerequisites:* Elasticsearch, JavaScript, d3.js
  - *Skill level:* Medium
  - *Mentors:* Sibyl Gao, Adam Wright



- **Project Idea 10: User interface re-design and implementation
  (WormBase)**
  - *Brief explanation:* \[Core development\] - As we have been actively
    converting the WormBase website from TemplateToolkit/JQuery to
    React, we have begun to consider new user interface approaches. For
    example, the current WormBase website is heavily geared towards
    per-page customization (see \[this
    page\](<a href="http://www.wormbase.org/species/c_elegans/gene/WBGene00006763"
    class="external free"
    rel="nofollow">http://www.wormbase.org/species/c_elegans/gene/WBGene00006763</a>,
    for example)). This project will review the current website, make
    suggestions, and create user interface implementations more
    intuitive.
  - *Expected results:* Design and implement user interface improvements
    to make it more intuitive to new users and easier to locate
    information.
  - *Knowledge prerequisites:* HTML, CSS, JavaScript
  - *Skill level:* Medium
  - *Mentors:* Sibyl Gao, Adam Wright



- **Project Idea 11: CRAM support for
  [JBrowse](/wiki/JBrowse.1)/[Apollo](/wiki/Apollo.1)**
  - *Brief explanation:* [JBrowse](/wiki/JBrowse.1) already offers
    support for several binary formats like BAM, BigWig and tabix
    formatted files like VCF. The
    <a href="http://www.sanger.ac.uk/science/tools/cram"
    class="external text" rel="nofollow">addition of CRAM</a> support
    would allow several groups with large datasets (like cancer
    research) to make use of JBrowse and Apollo. This project will
    likely require a combination of server and client side javascript.
  - *Expected results:* A client-server tool that parses CRAM files and
    presents the graphical results in a JBrowse canvas.
  - *Knowledge prerequisites:* JavaScript (DoJo, Node, React, Canvas)
  - *Skill level:* Advanced
  - *Mentors:* Eric Yao, Nathan Dunn, Rob Buels

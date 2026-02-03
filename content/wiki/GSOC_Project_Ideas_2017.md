---
title: "GSOC Project Ideas 2017"
---
# GSOC Project Ideas 2017


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
    any other particular computer science skills needed.
  - *Skill level:* Basic, Medium or Advanced.
  - *Mentors:* name + contact details of the lead mentor, name + contact
    details of backup mentor.

  
Here is a list of the proposed project ideas for 2017:

- **1. Project Publication Reference Tracking (Galaxy/Reactome)**
  - *Brief explanation:* Open source projects need ways to demonstrate
    relevance and viability to funders, users, and developers. One way
    to do that is to track publications that use and/or reference a
    project's products. This is typically done through setting up email
    alerts or RSS feeds from sources (Google Scholar, Web of Science,
    ScienceDirect, ...) This effort would create software that helps
    projects track publications that reference them.
  - *Expected results:* The software would integrate notifications from
    many sources into a coherent list of publications, report which ones
    are not yet known, and provide support for adding new ones to online
    reference managers such as CiteULike and Mendeley. The software
    would be extensible to make it easy to add support for new sources
    of publications and to support many online references managers. The
    software would be usable by any project to create and maintain
    publication lists.
  - *Knowledge prerequisites:* Python or Java experience is preferred,
    as those are the languages of choice of the two mentor projects.
  - *Skill level:* Basic
  - *Mentors:* Dave Clements, Galaxy Project, Johns Hopkins University,
    clements@galaxyproject.org, Robin Haw, Reactome, Ontario Institute
    for Cancer Research.

  

- **Project Idea 2: Reactome Diagrams WebGL (Reactome)**
  - *Brief explanation:* Implementing WebGL support in the renderer
    layer of Reactome's new DiagramViewer
    (<a href="https://github.com/reactome-pwp/diagram" class="external free"
    rel="nofollow">https://github.com/reactome-pwp/diagram</a>) using
    the Parallax project
    (<a href="http://parallax3d.org/" class="external free"
    rel="nofollow">http://parallax3d.org/</a>) or similar.
  - *Expected results:* Faster renderings, nicer and smoother
    transitions, overlay more data in any zoom level, use of textures to
    make pathway elements more realistic and ending up having a
    multi-platform WebGL support.
  - *Knowledge prerequisites:* Java, GWT, GIT, MAVEN, HTML5 Canvas,
    WebGL.
  - *Skill level:* Medium-Advanced.
  - *Mentor:* Antonio Fabregat (fabregat@ebi.ac.uk) (lead mentor),
    Kostas Sidiropoulos (ksidiro@ebi.ac.uk) (backup mentor)

  

- **Project Idea 3: iOS InterMine App (InterMine)**
  - *Brief explanation:* InterMine already has an Android application
    that allow users to search for genes across most of the 29 public
    InterMine instances, with a well documented API
    (<a href="http://iodocs.apps.intermine.org/" class="external free"
    rel="nofollow">http://iodocs.apps.intermine.org/</a>). We’d love to
    see this reflected in an iOS application, designed using HTML5 or
    native technologies. As a minimum we'd like to see the Android app
    features replicated whilst querying a single re-badgeable InterMine.
    A great stretch goal would be to query multiple mines
    simultaneously.
  - *Knowledge prerequisites:*
    - iOS app development, whether native or HTML5 based.
    - Understanding of working with REST APIs.
    - Biology knowledge an advantage, but not required.
    - Git or other version control
  - *Mentors:*
    - Yo yo@intermine.org
    - Josh josh@intermine.org
  - *Expected results:* an iOS application with functionality similar to
    <a
    href="https://play.google.com/store/apps/details?id=org.intermine.app"
    class="external free"
    rel="nofollow">https://play.google.com/store/apps/details?id=org.intermine.app</a>
    that is ready to be submitted to the Apple store.
  - *Skill level:* Medium.
  - Guidance for applying: <a
    href="https://intermineorg.wordpress.com/2017/02/28/google-summer-of-code-at-intermine/"
    class="external free"
    rel="nofollow">https://intermineorg.wordpress.com/2017/02/28/google-summer-of-code-at-intermine/</a>

  

- **Project Idea 4: Similarity project (InterMine)**
  - *Brief explanation:* InterMine is a large graph (matrix) of entities
    with relationships and this holds potentially valuable data. For
    instance, entities that share a large number of neighbours in a
    graph might be biologically similar. Entities in which many other
    entities pass through it might be biologically important.
    Precalculating this information and serving it via a web service
    would greatly enhance InterMine’s discovery potential.
  - *Knowledge prerequisites:*
    - Development experience; most languages ok
    - Math skills (matrix theory?)
    - Some database experience (ability to query using SQL)
    - Biology knowledge an advantage, but not required.
    - Git or other version control
  - *Expected results:* A script or program that build statistics about
    the relationships of objects in our database.
  - *Mentors:*
    - Josh josh@intermine.org
    - Yo yo@intermine.org
  - *Skill level:* Medium.
  - Guidance for applying: <a
    href="https://intermineorg.wordpress.com/2017/02/28/google-summer-of-code-at-intermine/"
    class="external free"
    rel="nofollow">https://intermineorg.wordpress.com/2017/02/28/google-summer-of-code-at-intermine/</a>

  

- **Project Idea 5: ElasticSearch and InterMine: (InterMine)**
  - *Brief explanation:* (Project no longer available).

  

- **Project Idea 6: Create a set of exciting bioinformatics R demos
  using the InterMineR package (InterMine)**
  - *Brief explanation:* Fan of R and biology? InterMine has recently
    created an R package
    (<a href="https://github.com/intermine/interminer" class="external free"
    rel="nofollow">https://github.com/intermine/interminer</a>) to take
    advantage of InterMine’s biological data warehouse web services, but
    we could use someone who is familiar with R and biology to create
    and document/blog some interesting code examples based on use cases
    we provide, with a focus on well-explained code and thorough
    documentation. A stretch goal would be to extend the core InterMineR
    package to provide additional services.
  - *Knowledge prerequisites:*
    - Knowledge of the R programming language
    - Proven writing / documentation or blogging skills
    - Understanding of biology / bioinformatics a significant advantage
  - *Expected results:* 3-10 help articles with well documented code
    samples demonstrating the use of the InterMineR R package.
  - *Mentors:*
    - Rachel rachel@intermine.org
    - Julie julie@intermine.org
  - *Skill level:* Easy
  - Guidance for applying: <a
    href="https://intermineorg.wordpress.com/2017/02/28/google-summer-of-code-at-intermine/"
    class="external free"
    rel="nofollow">https://intermineorg.wordpress.com/2017/02/28/google-summer-of-code-at-intermine/</a>

  

- **Project Idea 7: InterMine Registry (InterMine)**
  - *Brief explanation:* Currently there are 29 different instances of
    InterMine, a bioinformatics data warehouse, available on the web
    (see footer of <a href="http://intermine.org/" class="external free"
    rel="nofollow">http://intermine.org/</a>). We’d like to create a
    registry for all public instances - essentially an API that exposes
    the names, URLS, datatypes, and other useful information regarding
    an InterMine instance. This could be served from a manually curated
    list of InterMines, but a stretch goal might be to also include API
    methods to create and administer registry entries.
  - *Knowledge prerequisites:*
    - Good understanding of RESTful APIs, how they work, and how to
      implement one in a language of your choice.
    - No biology skills needed.
    - Git or other version control
  - *Expected results:* A read-only API that provides basic information
    about existing InterMine instances around the world.
  - *Mentors*
    - Daniela daniela@intermine.org
  - Guidance for applying: <a
    href="https://intermineorg.wordpress.com/2017/02/28/google-summer-of-code-at-intermine/"
    class="external free"
    rel="nofollow">https://intermineorg.wordpress.com/2017/02/28/google-summer-of-code-at-intermine/</a>

  

- **Project Idea 8: Query Visualiser: (InterMine)**
  - *Brief explanation:* InterMine’s biological data warehouse has an
    extensible XML data model designed to be heavily queryable. Similar
    to SQL, most queries have a combination of views and constraints.
    This can probably be visualised as an interactive network graph and
    should offer some good opportunities for creative data
    visualisation, and would complement InterMine’s existing Query
    Builder (user documentation for the query builder is here: <a
    href="http://flymine.readthedocs.io/en/latest/query-builder/Documentationquerybuilder.html"
    class="external free"
    rel="nofollow">http://flymine.readthedocs.io/en/latest/query-builder/Documentationquerybuilder.html</a>)
  - *Knowledge prerequisites:*
    - Good understanding of RESTful APIs
    - Client-side dev skills (JS or a language which compiles to JS).
    - No biology skills needed, but advantageous.
    - Git or other version control
  - *Expected results:* An interactive web-based data visualisation tool
    to visualise simple InterMine queries.
  - *Mentors*
    - Yo yo@intermine.org
    - Josh josh@intermine.org
  - Guidance for applying: <a
    href="https://intermineorg.wordpress.com/2017/02/28/google-summer-of-code-at-intermine/"
    class="external free"
    rel="nofollow">https://intermineorg.wordpress.com/2017/02/28/google-summer-of-code-at-intermine/</a>

  

- **Project Idea 9: Prototype a new RESTFull API querying Neo4j database
  (InterMine)**
  - *Brief explanation:* InterMine is a biological data warehouse,
    currently running with a PostgreSQL database. We'd like to prototype
    InterMine with Neo4j replacing PostgreSQL. The task: given an
    instance of Neo4j loaded with testmodel data, implement a new
    RESTful API which receives in input a query in Path-Query XML format
    and returns the result using Neo4j Java API or the traversal
    framework
  - *Knowledge prerequisites:*
    - Good understanding of Java
    - Good understanding of RESTful API
    - Basic understanding of graph databases
    - Git or other version control
    - No biology skills needed
  - *Expected results:*
    - Verify and eventually adapt the xml model to represent the
      relationships and their properties in Neo4j
    - Prototype a parser which reads from a simple data source and
      uploads Neo4j
    - Prototype a new RESTful API which returns a query result using
      Neo4j Java API or the traversal framework
  - *Mentors*
    - Daniela daniela@intermine.org
  - Guidance for applying: <a
    href="https://intermineorg.wordpress.com/2017/02/28/google-summer-of-code-at-intermine/"
    class="external free"
    rel="nofollow">https://intermineorg.wordpress.com/2017/02/28/google-summer-of-code-at-intermine/</a>

  

- **Project Idea 10: Use Galaxy to run Reactome analysis and processes
  on genomic data (Reactome)**
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
  - *Mentor:* Joel Weiser (joel.weiser@oicr.on.ca)

  

- **Project Idea 11: Stand-alone Reactome server in a Docker image
  (Reactome)**
  - *Brief explanation:* Reactome is a free, open-source, curated and
    peer reviewed pathway database. The goal of this project is to
    produce a Docker image that contains everything that is needed for a
    user to run Reactome on their own workstation. This includes the web
    applications, databases, scripts, and other supporting
    infrastructure components that make up Reactome.
  - *Expected results:* A Docker image that can be pulled from an image
    repository such as dockerhub or quay.io which contains the latest
    Reactome data and software, and can be run on any Docker-capable
    workstation. A process by which such docker images could be
    automatically built as a part of the Reactome data-release cycle
    would also be a goal.
  - *Knowledge prerequisites:* linux, Docker, Apache web servers,
    Tomcat, bash
  - *Skill level:* Medium
  - *Mentor:* Solomon Shorser (solomon.shorser@oicr.on.ca)

  

- **Project Idea 12: Pan-Genome Module for the Genome Context Viewer
  (GMOD)**
  - *Brief explanation:* With the number of sequenced and annotated
    genomes continuously increasing, there is a need for new algorithms
    and tools for comparative analyses both at the nucleotide and genic
    levels. The Genome Context Viewer (GCV,
    <a href="https://goo.gl/trvfg1" class="external free"
    rel="nofollow">https://goo.gl/trvfg1</a>) is an OSS tool that
    enables comparative genomics by using gene families as a unit of
    search and comparison. It currently uses Chado as a reference
    implementation for its data services and can be integrated with
    other GMOD components via a service layer/API. This work will create
    an extension module that will integrate new and existing
    pan-genomics algorithms into GCV while leveraging the existing UI
    for visualization purposes. This will help to serve communities
    facing the challenges of having multiple reference genomes within a
    single species, as well as improving GCV’s utility for
    clade-oriented resources.
  - *Expected results:* The module would implement the Approximate
    Frequent Subpaths algorithm (Cleary, et al, 2017) for finding
    candidate GCV search queries and generating context-sensitive
    chromosome-scale synteny blocks, that is, synteny blocks derived
    from a chromosome’s gene family content and the GCV search
    parameters. It would also implement the Frequented Regions algorithm
    (Cleary, et al, in review) for identifying syntenic regions in
    pan-genome gene family graphs. As with current GCV algorithms, these
    implementations would be capable of aggregating data from multiple
    sources, enabling analyses of data distributed across multiple
    data-stores. The results of these algorithms would be displayed in
    the GCV UI, where users can interactively explore the results,
    perform new searches, and interlink to other relevant tools.
  - *Knowledge prerequisites:* Python (Django and Spark) and JavaScript
    (Angular 2 and D3) experience is preferred, as those are the
    languages used to implement GCV.
  - *Skill level:* Advanced
  - *Mentors:* Andrew Farmer, Legume Information System, National Center
    for Genome Resources, adf@ncgr.org; Steven Cannon, Legume
    Information System, US Department of Agriculture Agricultural
    Research Service.

  

- **Project Idea 13: Performance and user-centric improvements to Afra's
  annotation editor**
  - *Brief explanation*: Gene prediction software often make mistakes
    (e.g., merging adjacent genes, or splitting a long gene into two).
    Predicted gene models are thus visually inspected and manually
    corrected before using them in an analysis, which in turn take a lot
    of time. Inspired by the success of GalxyZoo and Foldit, we created
    <a href="https://github.com/wurmlab/afra" class="external text"
    rel="nofollow">Afra</a> to crowdsoucrce manual curation of predicted
    gene models. In short, Afra redundantly collects corrections for a
    given gene model from different user and calls a winner. Conflicts
    are resolved manually by a senior curator. Broadly, Afra has two
    modules: an annotation editor (to visualise and correct predicted
    gene models), and a task processor (to dole out curation tasks and
    collect submissions from user). Our annotation editor, built using
    JBrowse and WebApollo, is completely browser based. The goal of this
    GSoC project is to a) migrate to latest JBrowse for improved
    performance (and latest features), b) further optimise the
    annotation editor to be more performant and implement features that
    will make annotation editing more accessible to non-experts. Afra is
    one of a kind project and performance and making annotation editing
    accessible to less experienced users (e.g., undergraduate students,
    school teachers) are the major hurdles in our way of a bigger
    rollout, which will contribute immensely to the biocuration
    community.
  - *Expected results:* The student will a) migrate annotation editing
    code and related changes to JBrowse to JBrowse 1.12, including
    making use of new JBrowse features that will improve performance
    (test suite should be used for migration), b) propose and implement
    already proposed features (Github), that will make annotation editor
    faster and ease the learning curve of manual curation. The work
    should be done in form of small pull-requests, that will be merged
    and deployed throughout the course of GSoC.
  - *Knowledge prerequisites:* JavaScript. JBrowse is written using
    dojo - should be possible to pick up the basics while drafting the
    proposal and along the way. Editing aspects make use of jquery-ui -
    prior knowledge here would be great, because some aspects can be
    tricky. Basic genomics (gene transcription, splicing, alternative
    splicing, translation) - very very important, can be picked up while
    drafting proposal (see corresponding Wikipedia pages). We use Ruby
    on the server side and Angular in the browser but you probably won't
    have to work on those parts of the codebase - a basic knowledge
    there would make it easier to handle the overall codebase.
  - *Skill level:* Intermediate-Advanced
  - *Mentors:* Anurag Priyam (firstname.lastname at qmul.ac.uk), Yannick
    Wurm (<a href="https://wurmlab.github.io" class="external text"
    rel="nofollow">Wurmlab</a>, Queen Mary University of London)

  

- **Project Idea 14: activedriverdb.org (Reimand Lab)**
  - *Brief explanation:*activedriverdb.org is a newly developed
    interactive database to understand the intricate connections of
    human disease, genetics and cellular interaction networks. It
    provides a resource and visualisation platform of hundreds of
    thousands of known disease and cancer mutations in human genes that
    affect small protein sites involved in network interactions. The
    GSoC project is based on an earlier GSoC project and involves
    development of further functionality of the database.
  - *Expected results:* A data upload module that allows users to
    securely upload and store large sets of mutations from their
    experiments for full-scale analysis and visualisation within the
    platform.
  - *Knowledge prerequisites:* relational databases and SQL, programming
    language such as Python, RESTful web services, understanding of
    genetics and/or biology is a plus.
  - *Skill level:* Medium
  - *Mentors:* Jüri Reimand (Juri.Reimand@oicr.on.ca)

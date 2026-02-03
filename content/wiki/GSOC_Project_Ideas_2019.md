---
title: "GSOC Project Ideas 2019"
---
# GSOC Project Ideas 2019

**Got an idea for [GSOC 2019](GSoC "GSoC")?**

Then please post it. You can either

1.  Add it here, by directly editing this page. Just copy, paste and
    update the [template](#Template) below. This requires that you have
    or create a GMOD.org login.
2.  Describe it in the
    **<a href="http://bit.ly/gsoc-2019-ogi-propose" class="external text"
    rel="nofollow">online form</a>** and *we'll* post it here.

  
Projects can use a broad set of skills, technologies, and domains, such
as GUIs, database integration and algorithms.

Students are also encouraged to propose their own ideas related to our
projects. If you have strong computer skills and have an interest in
biology or bioinformatics, you should definitely apply! Do not hesitate
to propose your own project idea: some of the best applications we see
are by students that go this route. As long as it is relevant to one of
our projects, we will give it serious consideration. Creativity and
self-motivation are great traits for open source programmers.

  

  project ideas for 2019</span>](#Proposed_project_ideas_for_2019)
  - [Template](#Template)
  - [Automated
    Bioinformatics Help in
    Galaxy](#Automated_Bioinformatics_Help_in_Galaxy)
  - [Use Galaxy
    to run Reactome analysis and processes on genomic data
    (Reactome)](#Use_Galaxy_to_run_Reactome_analysis_and_processes_on_genomic_data_.28Reactome.29)
  - [Create a
    software package for use in R to query Reactome’s Graph Database in
    Neo4J](#Create_a_software_package_for_use_in_R_to_query_Reactome.E2.80.99s_Graph_Database_in_Neo4J)
  - [Revision
    tracking curation and tools usage
    (Reactome)](#Revision_tracking_curation_and_tools_usage_.28Reactome.29)

# Proposed project ideas for 2019

*Be the first to add a project idea.*

## Template

- **Project Idea Name (Project Name/Lab Name)**
  - *Brief explanation:* Brief description of the idea, including any
    relevant links, etc.
  - *Expected results:* describe the outcome of the project idea.
  - *Project Home Page URL:* if there is one.
  - *Project paper reference and URL:* Is there a paper about the
    project this effort will be a part of?
  - *Knowledge prerequisites:* programming language(s) to be used, plus
    any other particular computer science skills needed.
  - *Skill level:* Basic, Medium or Advanced.
  - *Mentors:* name + contact details of the lead mentor, name + contact
    details of 1 or 2 backup mentors.

  

## Automated Bioinformatics Help in Galaxy

- *Brief explanation:*
  - <a href="https://galaxyproject.org/" class="external text"
    rel="nofollow">Galaxy</a> users often encounter errors when trying
    to run a bioinformatics analysis. These errors may be user or data
    errors (e.g. misformatted dataset) or errors due to underlying
    computing hardware (e.g. disk is full). Helping users and Galaxy
    support staff determine the kind of error they encountered would be
    useful because a user can likely address the first type of error,
    while the second type requires expert invention.
  - This project will improve Galaxy’s error system by using heuristics
    or machine learning to identify common types of user/data errors and
    make suggestions on likely causes of the error and how they might be
    fixed. This will benefit Galaxy users with clear and actionable
    error messages and support staff by reducing the amount of reported,
    non-system errors.
- *Expected results:*
  - Create a tool for analyzing, identifying, and classifying common
    error messages from the extensive history of error messages from the
    main public Galaxy server
    (<a href="https://usegalaxy.org" class="external free"
    rel="nofollow">https://usegalaxy.org</a>).
    - The diversity and size of this data suggests a machine learning
      approach, but the specific approach taken would be decided by the
      student and mentor.
  - Extend Galaxy’s tool definition syntax to support defining common
    error classes and suggested resolutions.
  - Update Galaxy’s user interface to display potential resolutions and
    suggested actions based on the types of errors found in an analysis.
- *Project Home Page URL:*
  <a href="https://galaxyproject.org/" class="external text"
  rel="nofollow">galaxyproject.org</a>
- *Project paper reference and URL:*
  <a href="https://doi.org/10.1093/nar/gky379" class="external text"
  rel="nofollow">The Galaxy platform for accessible, reproducible and
  collaborative biomedical analyses: 2018 update</a>, Enis Afgan et al.,
  *Nucleic Acids Research*, Volume 46, Issue W1, 2 July 2018, Pages
  W537–W544,
  <a href="https://doi.org/10.1093/nar/gky379" class="external free"
  rel="nofollow">https://doi.org/10.1093/nar/gky379</a>
- *Knowledge prerequisites:* programming language(s) to be used, plus
  any other particular computer science skills needed.
- *Skill level:* Medium.
- *Mentors:*

## Use Galaxy to run Reactome analysis and processes on genomic data (Reactome)

- - *Brief explanation:* Reactome is a free, open-source, curated and
    peer-reviewed pathway database. Our goal is to provide intuitive
    bioinformatics tools for the visualization, interpretation and
    analysis of pathway knowledge to support basic research, genome
    analysis, modelling, systems biology and education. Galaxy is an
    open, web-based platform for data intensive biomedical research,
    which allows users to perform, reproduce, and share complete
    analyses.
  - *Expected results:* There are two potential sub-projects. 1) Adding
    Reactome as a data resource in Galaxy, to enable Galaxy users to use
    Reactome reaction and pathway annotation data, and 2) Performing
    identifier mapping and over-representation analysis workflows from
    Reactome in Galaxy. Reactome
    <a href="https://github.com/reactome/" class="external text"
    rel="nofollow">Github</a>.
  - *Project Home Page URL:* if there is one.
  - *Project paper reference and URL:*
    <a href="https://reactome.org/" class="external text"
    rel="nofollow">reactome.org</a>,
    <a href="https://galaxyproject.org/" class="external text"
    rel="nofollow">galaxyproject.org</a>
  - *Knowledge prerequisites:* Galaxy, Java, web services.
  - *Skill level:* Medium.
  - *Mentors:* Robin Haw (robin.haw\[AT\]oicr.on.ca) and Joel Weiser
    (joel.weiser\[AT\]oicr.on.ca).

## Create a software package for use in R to query Reactome’s Graph Database in Neo4J

- **Project Idea Name (Project Name/Lab Name)**
  - *Brief explanation:* The R programming language has an
    <a href="https://neo4j.com/developer/r/" class="external text"
    rel="nofollow">existing package</a> for connection to Neo4J
    databases. This project’s purpose would be to use this package as a
    base to create a connection for querying Reactome’s Neo4J
    <a href="https://www.reactome.org/dev/graph-database"
    class="external text" rel="nofollow">graph database</a> and return
    data structures for manipulating Reactome pathway and reaction
    data..
  - *Expected results:*Allow R end-users to be able to retrieve Reactome
    pathway and reaction data for analysis by both pre-written functions
    and custom queries. Examples of categories for such functions may
    include pathways and reactions which contain certain genes,
    proteins, Gene Ontology terms or cross-references to other external
    databases as well as other useful queries for Reactome end-users.
  - *Project Home Page URL:*
    <a href="https://reactome.org/" class="external text"
    rel="nofollow">reactome.org</a>.
  - *Knowledge prerequisites:* R Programming Language, Neo4J.
  - *Skill level:* Medium.
  - *Mentors:* Joel Weiser (joel.weiser\[AT\]oicr.on.ca) and Antonio
    Fabregat (fabregat\[AT\]ebi.ac.uk).

## Revision tracking curation and tools usage (Reactome)

- - *Brief explanation:* Reactome is a free, open-source, curated and
    peer-reviewed pathway database. Our goal is to provide intuitive
    bioinformatics tools for the visualization, interpretation and
    analysis of pathway knowledge to support basic research, genome
    analysis, modelling, systems biology and education. Our current
    curation and tool access statistics are static and generated on an
    ad-hoc basis.
  - *Expected results:* Developing scripts to process data and a web
    interface to support interactive curation and tool access statistics
    (maps, tables, charts, graphs).
  - *Project Home Page URL:*
    <a href="https://reactome.org/" class="external text"
    rel="nofollow">reactome.org</a>.
  - *Knowledge prerequisites:* Java, Neo4J, Java, web services.
  - *Skill level:* Easy.
  - *Mentors:* Robin Haw (robin.haw\[AT\]oicr.on.ca).

---
title: "GSOC Project Ideas 2022"
---
# GSOC Project Ideas 2022

**Got an idea for [GSOC 2022](GSoC "GSoC")?**

Then please post it. You can either

1.  Add it here, by directly editing this page. Just copy, paste and
    update the [template](#Template) below. This requires that you have
    or create a GMOD.org login.

Projects can use a broad set of skills, technologies, and domains, such
as GUIs, database integration and algorithms.

Students are also encouraged to propose their own ideas related to our
projects. If you have strong computer skills and have an interest in
biology or bioinformatics, you should definitely apply! Do not hesitate
to propose your own project idea: some of the best applications we see
are by students that go this route. As long as it is relevant to one of
our projects, we will give it serious consideration. Creativity and
self-motivation are great traits for open-source programmers.



  project ideas for 2022</span>](#Proposed_project_ideas_for_2022)
  - [JBrowse 2
    Plugins for Additional Synteny
    Formats](#JBrowse_2_Plugins_for_Additional_Synteny_Formats)
  - [JBrowse 2
    Multi-way synteny
    visualization](#JBrowse_2_Multi-way_synteny_visualization)
  - [Use Galaxy
    to run Reactome analysis and processes on proteomics data
    (Reactome)](#Use_Galaxy_to_run_Reactome_analysis_and_processes_on_proteomics_data_.28Reactome.29)
  - [Centralized dashboard or metrics system
    (Reactome)](#Centralized_dashboard_or_metrics_system_.28Reactome.29)
  - [Community
    access portal to Reactome Archive
    (Reactome)](#Community_access_portal_to_Reactome_Archive_.28Reactome.29)
  - [Datatypes
    Help in Galaxy
    (Galaxy)](#Datatypes_Help_in_Galaxy_.28Galaxy.29)
  - [Provide
    users with better quota information
    (Galaxy)](#Provide_users_with_better_quota_information_.28Galaxy.29)
  - [Creating
    learning paths within the Galaxy Training
    Network](#Creating_learning_paths_within_the_Galaxy_Training_Network)
  - [Integrate
    MP-BioPath into Reactome FI-Viz Cytoscape
    plugin](#Integrate_MP-BioPath_into_Reactome_FI-Viz_Cytoscape_plugin)
  - [Converting Release Jenkins Pipeline to
    incorporate Continuous Integration / Continuous Deployment (CI/CD)
    principles and AWS services where
    useful](#Converting_Release_Jenkins_Pipeline_to_incorporate_Continuous_Integration_.2F_Continuous_Deployment_.28CI.2FCD.29_principles_and_AWS_services_where_useful)
  - [Template:
    Project Idea Name (Project Name/Lab
    Name)](#Template:_Project_Idea_Name_.28Project_Name.2FLab_Name.29)

# Proposed project ideas for 2022

## JBrowse 2 Plugins for Additional Synteny Formats

- *Brief explanation:* Write a new JBrowse 2 plugin to support <a
  href="https://sanger-pathogens.github.io/Artemis/ACT/act-manual.html#_Toc532220687#_Toc532220687"
  class="external text" rel="nofollow">MSPCrunch</a> data input, BLAST
  results, and .coord files from MUMmer
- *Expected results:* a new JBrowse 2 plugin that adds support for one
  or more of the data formats listed above
- *Project Home Page URL:*
  <a href="https://jbrowse.org" class="external text"
  rel="nofollow">JBrowse.org</a>
- *Project chat:*
  <a href="https://gitter.im/GMOD/jbrowse2" class="external autonumber"
  rel="nofollow">[1]</a>
- *Knowledge prerequisites:* JavaScript
- *Skill level:* Medium
- *Project Time:* 175 hours
- *Mentors:* JBrowse development team

## JBrowse 2 Multi-way synteny visualization

- *Brief explanation:* JBrowse 2 can currently compare two genomes at a
  time, but comparing more than two genomes is common! Write new JBrowse
  2 features to support this functionality using data from PAF files or
  other synteny pipelines.
- *Expected results:* a new method to compare more than two genomes at a
  time
- *Project Home Page URL:*
  <a href="https://jbrowse.org" class="external text"
  rel="nofollow">JBrowse.org</a>
- *Project chat:*
  <a href="https://gitter.im/GMOD/jbrowse2" class="external autonumber"
  rel="nofollow">[2]</a>
- *Knowledge prerequisites:* JavaScript, Typescript, React
- *Skill level:* Difficult
- *Project Time:* 350 hours
- *Mentors:* JBrowse development team

## Use Galaxy to run Reactome analysis and processes on proteomics data (Reactome)

- *Brief explanation:* Reactome is a free, open-source, curated and
  peer-reviewed pathway database. Our goal is to provide intuitive
  bioinformatics tools for the visualization, interpretation and
  analysis of pathway knowledge to support basic research, genome
  analysis, modelling, systems biology and education. Galaxy is an open,
  web-based platform for data-intensive biomedical research, which
  allows users to perform, reproduce, and share complete analyses.
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
  rel="nofollow">galaxyproject.org</a>,
  <a href="http://www.proteore.org/" class="external text"
  rel="nofollow">ProteoRE (Proteomics Research Environment)</a>
- *Knowledge prerequisites:* Galaxy, Java, web services.
- *Skill level:* Medium.
- *Project Time:* 350 hours
- *Mentors:* Robin Haw (robin.haw\[AT\]oicr.on.ca)

## Centralized dashboard or metrics system (Reactome)

- *Brief explanation:* Reactome has both manual and automated
  statistical tracking of its quarterly release data. This project would
  seek to fully automate and consolidate the quantification of release
  data measurement for metrics such as the number of pathways,
  reactions, distinct proteins (with and without UniProt isoforms),
  complexes, small molecules, drugs/therapeutics, literature references,
  etc. for human (curated) and non-human (electronically inferred)
  species and stratified for normal and disease biology. a centralized
  dashboard would be useful by the team for discussing metrics
  externally and community outreach.
- *Expected results:* A program which will produce a standardized report
  of statistics for a Reactome release database with aesthetic visuals
- *Project Home Page URL:*
  <a href="https://reactome.org." class="external text"
  rel="nofollow">reactome.org</a>.
- *Knowledge prerequisites:* Java, MySQL and/or Neo4j, creating visuals
  for statistical data (preferred but not required)
- *Skill level:* Medium.
- *Project Time:* 175 hours
- *Mentors:* Robin Haw (robin.haw\[AT\]oicr.on.ca)

## Community access portal to Reactome Archive (Reactome)

- *Brief explanation:* Reactome generates new pathway and other
  annotation data on a quarterly basis. With each new release, the
  preceding data set is archived to an AWS S3 bucket. As part of our
  data sharing policy, we would like to develop web interface to allow
  users to request specific versions of archived data and to make it
  available to download.
- *Expected results:* Web interface for users to request data and
  download via a shareable link that either expires within a certain
  timeframe or after data is downloaded.
- *Project Home Page URL:*
  <a href="https://reactome.org." class="external text"
  rel="nofollow">reactome.org</a>.
- *Knowledge prerequisites:* Java, AWS, Joomla, Cloudfront
- *Skill level:* Medium.
- *Project Time:* 175 hours
- *Mentors:* Robin Haw (robin.haw\[AT\]oicr.on.ca)

## Datatypes Help in Galaxy (Galaxy)

- *Brief explanation:* Create infrastructure for providing datatype help
  in Galaxy. Includes expanding datatype definitions and updating Galaxy
  user interface to take advantage of it.
- *Expected results:* Datatype format and semantics help would be widely
  available when using Galaxy, including in tools that consume and
  produce particular datatypes, as well as server-wide help describing
  supported datatypes.
- *Project Home Page URL:*
  <a href="https://galaxyproject.org/" class="external free"
  rel="nofollow">https://galaxyproject.org/</a>
- *Project paper reference and URL:* Jalili, V., Afgan, E., Gu, Q.,
  Clements, D., Blankenberg, D., Goecks, J., Taylor, J., &
  Nekrutenko, A. (2020). The Galaxy platform for accessible,
  reproducible and collaborative biomedical analyses: 2020 update.
  *Nucleic Acids Research*, 48(W1), W395–W402.
  <a href="https://doi.org/10.1093/nar/gkaa434" class="external free"
  rel="nofollow">https://doi.org/10.1093/nar/gkaa434</a>
- *Knowledge prerequisites:* Python and JavaScript. Will use Vue.js
  components in front end.
- *Skill level:* Basic
- *Project Time:* 175 hours
- *Mentors:* Björn Grüning, University of Freiburg
  (bjoern.gruening\[at\]gmail.com); Galaxy Support Working Group,
  global.

## Provide users with better quota information (Galaxy)

- *Brief explanation:* Publish each server's quotas in a standard way;
  provide users with more information about what analyses and datasets
  are consuming their quota allocation.
- *Expected results:* Users will know immediately what a server's quotas
  are, and what items are contributing most to consuming their quota.
  Users will have a clear idea of what they can expect, and what they
  can do to increase their available resources.
- *Project Home Page URL:*
  <a href="https://galaxyproject.org/" class="external free"
  rel="nofollow">https://galaxyproject.org/</a>
- *Project paper reference and URL:* Jalili, V., Afgan, E., Gu, Q.,
  Clements, D., Blankenberg, D., Goecks, J., Taylor, J., &
  Nekrutenko, A. (2020). The Galaxy platform for accessible,
  reproducible and collaborative biomedical analyses: 2020 update.
  *Nucleic Acids Research*, 48(W1), W395–W402.
  <a href="https://doi.org/10.1093/nar/gkaa434" class="external free"
  rel="nofollow">https://doi.org/10.1093/nar/gkaa434</a>
- *Knowledge prerequisites:* Python and JavaScript. Will use Vue.js
  components in front end.
- *Skill level:* Medium
- *Project Time:* 175 hours
- *Mentors:* Björn Grüning, University of Freiburg
  (bjoern.gruening\[at\]gmail.com); Galaxy Support Working Group,
  global.

## Creating learning paths within the Galaxy Training Network

- *Brief explanation:* Implement and display learning paths in the
  Galaxy Training Material infrastructure to show learners, especially
  newcomers, which tutorial they should take first or which sequence of
  tutorials to follow to become knowledgeable about a particular topic.
- *Expected results:* An easy way to configure and update learning
  paths. Easy to understand and navigate learning paths for web site
  users.
- *Project Home Page URL:*
  <a href="https://training.galaxyproject.org/" class="external free"
  rel="nofollow">https://training.galaxyproject.org/</a>
- *Project paper reference and URL:* Batut, B., Hiltemann, S.,
  Bagnacani, A., Baker, D., Bhardwaj, V., Blank, C., Bretaudeau, A.,
  Brillet-Guéguen, L., Čech, M., Chilton, J., Clements, D.,
  Doppelt-Azeroual, O., Erxleben, A., Freeberg, M. A., Gladman, S.,
  Hoogstrate, Y., Hotz, H.-R., Houwaart, T., Jagtap, P., … Grüning, B.
  (2018). Community-Driven Data Analysis Training for Biology. *Cell
  Systems*, 6(6), 752-758.e1.
  <a href="https://doi.org/10.1016/j.cels.2018.05.012"
  class="external free"
  rel="nofollow">https://doi.org/10.1016/j.cels.2018.05.012</a>
- *Knowledge prerequisites:* Ruby, JavaScript (some Python).
- *Skill level:* Medium
- *Project Time:* 175 hours
- *Mentors:* Bérénice Batut, University of Freiburg (berenice DOT
  batut\[at\] gmail.com). Galaxy Outreach & Training Working Group,
  global.

## Integrate MP-BioPath into Reactome FI-Viz Cytoscape plugin

- *Brief explanation:* MP-BioPath is a similar algorithm to the options
  available within the Reactome FI Viz Cytoscape plugin
  (<a href="https://reactome.org/tools/reactome-fiviz"
  class="external free"
  rel="nofollow">https://reactome.org/tools/reactome-fiviz</a>). We are
  interested in incorporating our latest algorithm MP-BioPath
  (<a href="https://github.com/OICR/mp-biopath" class="external free"
  rel="nofollow">https://github.com/OICR/mp-biopath</a>) into the
- *Expected results:* A new version of the FI-Viz plugin that
  incorporates MP-BioPath with customized visualizations for MP-BioPaths
  pathways and results
- *Project Home Page URL:*
  <a href="https://reactome.org/tools/reactome-fiviz"
  class="external free"
  rel="nofollow">https://reactome.org/tools/reactome-fiviz</a>
- *Project paper reference and URL:*
- *Knowledge prerequisites:* JAVA programming language
- *Skill level:* Medium
- *Project Time:* 175 hours
- *Mentors:* Adam Wright (adam.wright@oicr.on.ca)

## Converting Release Jenkins Pipeline to incorporate Continuous Integration / Continuous Deployment (CI/CD) principles and AWS services where useful

- *Brief explanation:* In order to display the rich displays within the
  Reactome portal an Extract Transform Load (ETL) - mainly Java -
  Jenkins pipeline(s) is currently being run. This process could be,
  made more robust and facilitate rapid development cycles through
  incorporating CI/CD principles into our existing pipelines.
- *Expected results: Have Jenkins CI/CD pipelines pulling the latest
  changes from GitHub automatically, compiling the Java code,
  dockerizing each component and deploying the code after all relevant
  test*

s have passed.

- *Project Home Page URL:*
  <a href="https://github.com/Reactome/" class="external free"
  rel="nofollow">https://github.com/Reactome/</a>
- *Project paper reference and URL:*
- *Knowledge prerequisites:* Groovy (pipeline code), Bash
- *Skill level:* Basic
- *Project Time:* 175 hours
- *Mentors:* Adam Wright (adam.wright@oicr.on.ca), Joel Weiser
  (joel.weiser@oicr.on.ca)

## Template: Project Idea Name (Project Name/Lab Name)

- *Brief explanation:* Brief description of the idea, including any
  relevant links, etc.
- *Expected results:* describe the outcome of the project idea.
- *Project Home Page URL:* if there is one.
- *Project paper reference and URL:* Is there a paper about the project
  this effort will be a part of?
- *Knowledge prerequisites:* programming language(s) to be used, plus
  any other particular computer science skills needed.
- *Skill level:* Basic, Medium or Advanced.
- *Project Time:* 175 hours or 350 hours
- *Mentors:* name + contact details of the lead mentor, name + contact
  details of 1 or 2 backup mentors.

---
title: "GSOC Project Ideas 2015"
---
# GSOC Project Ideas 2015


There are plenty of challenging and interesting project ideas this year.
These projects include a broad set of skills, technologies and domains,
such as GUIs, database integration and algorithms.

Students are also encouraged to propose their own ideas related to our
projects. If you have strong computer skills and have an interest in
biology or bioinformatics, you should definitely apply! Do not hesitate
to propose your own project idea: some of the best applications we see
are by students that go this route. As long as it is relevant to one of
our projects, we will give it serious consideration. Creativity and
self-motivation are great traits for open source programmers.

- **Project Idea Name**
  - *Brief explanation:* Brief description of the idea, including any
    relevant links, etc.
  - *Expected results:* describe the outcome of the project idea.
  - *Knowledge prerequisites:* programming language(s) to be used, plus
    any other particular computer science skills needed.
  - *Skill level:* Basic, Medium or Advanced.
  - *Mentors:* name + contact details of the lead mentor, name + contact
    details of backup mentor.

  
Here is a list of the proposed project ideas for 2015:

- **Project Idea 1: Using an interpreted language to develop
  bioinformatics workflows**
  - *Brief explanation:* SeqWare is a bioinformatics workflow engine
    that can be used to chain together the analysis of big data in
    genomics and bioinformatics. The current workflow language is Java,
    which is rather verbose.
  - *Expected results:* Use Groovy to hide the current rather verbose
    Java workflow language. Using an interpreted language also enables
    for rapid prototyping of workflows. The goal of this is to make
    scripting SeqWare feel more like shell scripting. This is a similar
    effort to the GATK team’s Queue, but this would leverage SeqWare.
    Prototype:
    <a href="https://github.com/larsgt/stimpy" class="external free"
    rel="nofollow">https://github.com/larsgt/stimpy</a>
  - *Knowledge prerequisites:* Java, Groovy, git
  - *Skill level:* Medium
  - *Mentors:* Lars Jorgensen, Morgan Taschuk, Pipeline team

  

- **Project Idea 2: Write a Foreign Data Wrapper for Postgres and
  BAM/VCF**
  - *Brief explanation:* SQL is a powerful language that makes querying
    structured data very straightforward, and genomics produces several
    types of structured data. Big data from genomics usually comes in
    two parts: the results, stored in files, and the metadata that
    describe the results, usually stored in databases. For example, VCF
    files describe a variant in particular cancer-causing gene, and the
    metadata will describe what the sample was, where it came from, how
    it was processed, etc. We would like to use SQL to query both
    results and metadata together.
  - Expected results: Develop a Foreign Data Wrapper for BAM and VCF in
    order to query alignment and variant information. There is an
    existing Foreign Data Wrapper for TSV files. This should make VCF
    and SAM fairly straight forward. Accessing BAM files would be
    slightly more involved. This could provide a good example of making
    queries against BAM data. Info:
    <a href="http://www.postgresql.org/docs/9.1/static/fdwhandler.html"
    class="external free"
    rel="nofollow">http://www.postgresql.org/docs/9.1/static/fdwhandler.html</a>
    and <a
    href="http://www.depesz.com/2011/03/14/waiting-for-9-1-foreign-data-wrapper/"
    class="external free"
    rel="nofollow">http://www.depesz.com/2011/03/14/waiting-for-9-1-foreign-data-wrapper/</a>.
  - *Knowledge prerequisites:* PostgreSQL
  - *Skill level:* Advanced
  - *Mentors:* Lars Jorgensen

  

- **Project Idea 3: Implement a FUSE interface to BAM/CRAM**
  - *Brief explanation:* Storage of big data is an ongoing problem that
    will only get worse. As data moves through a processing pipeline in
    genomics, the output data is often a lossless conversion of data
    integrating different information (e.g. FASTQ is a listing of all
    reads; BAM is an alignment of those reads to a reference but still
    contains all of the reads from the FASTQ). However, data from
    earlier in the pipeline is often kept so that the analysis can be
    repeated with different tools. This results in a duplication of data
    on the order of gigabytes to terabytes.
  - *Expected results:* Enable a tool to see the same BAM file as either
    two FASTQs, interleaved FASTQ or whatever format it needs (with the
    same information). This should be easy to prototype using Python as
    fuse-python and pysam exists.
  - *Knowledge prerequisites:* C and/or Python, POSIX APIs
  - *Skill level:* Advanced
  - *Mentor:* Lars Jorgensen

  

- **Project Idea 4: Use Galaxy to run SeqWare workflows and process on
  data**
  - *Brief explanation:* SeqWare is a bioinformatics workflow engine
    that can be used to chain together the analysis of big data in
    genomics and bioinformatics. SeqWare is currently driven on the
    command line by skilled users. However, it would be incredibly
    useful to leverage SeqWare’s robustness and stability for individual
    non-expert users. Galaxy is a user-friendly mechanism for analysing
    data that can be used for this task.
  - *Expected results:* There are two potential sub-projects. 1) Adding
    SeqWare metadata and files as a data source in Galaxy, to enable
    Galaxy users to use SeqWare data, and 2) Launching and monitoring
    SeqWare workflows with Galaxy.
  - *Knowledge prerequisites:* Galaxy, Java, web services, PostgreSQL
  - *Skill level:* Medium
  - *Mentor:* Morgan Taschuk

  

- **Project Idea 5: Barcode scanner using phone or tablet to drive
  LIMS**
  - *Brief explanation:* In a typical genomics lab, the Laboratory
    Information Management System (LIMS) is required to keep track of
    lot of people, equipment and samples as they interact. A typical
    LIMS requires a desktop computer and a lot of drop down menus in
    order to fulfill this task, which takes the technician away from the
    bench and introduces the potential for error. Large sequencing labs
    use barcodes instead. Barcode readers are prohibitively expensive
    for smaller labs. Cameras on phones are getting quite good, so it
    should be fairly easy to drive the barcode reading from a mobile
    device. This would be a low cost way for smaller labs to use
    barcoding in the lab workflows. Barcode reading library:
    <a href="https://github.com/zxing/zxing" class="external free"
    rel="nofollow">https://github.com/zxing/zxing</a>.
  - *Expected results:* A mobile LIMS application that stores a
    particular lab workflow and prompts the user to scan barcodes when
    they reach a particular step in the workflow. It would also be able
    to send information back to the central LIMS servers.
  - *Knowledge prerequisites:* iOS or Android development, web services,
    interface design
  - *Mentor:* Lars Jorgensen, Timothy Beck and Tony DeBat

  

- **Project Idea 6: iPython notebook on top of our infrastructure**
  - *Brief explanation:* iPython notebook is a powerful tool. It enables
    reproducible science as people can share their work. It would be
    interesting to see how iPython notebook and SeqWare could interact.
    It would also be useful for OICR’s users if they could query our and
    other metadata using Python or R.
  - *Expected result:* A python library that can be used to query
    SeqWare’s metadata through their RESTful web service.
  - *Knowledge prerequisites:* Python, web services
  - *Skill level:* Basic
  - *Mentor:* Timothy Beck, Lawrence Heisler, Yogi Sundaravadanam

  

- **Project Idea 7: Use Galaxy to run Reactome analysis and processes on
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
  - *Mentor:* Joel Weiser

  

- **Project Idea 8: Biological Graph Visualization**
  - *Brief explanation:* Tripal
    (<a href="http://tripal.info" class="external free"
    rel="nofollow">http://tripal.info</a>) is an open-source suite of
    Drupal modules that allows a scientific research community to more
    easily setup and manage a data repository for genomic, genetic and
    related biological data. It provides data pages, data mining tools
    and visualizations. Tripal is used or in development by 25 different
    genome database websites, and is developed by an international
    group. A Tripal module currently exists for importing, searching and
    visualizing graph data that models the "network" of interactions of
    various components of a biological system. However, the module is
    not complete and requires improvements to the visualizations. The
    goal of this project would be to complete the remaining work for
    this module such that it can be shared with others.
  - *Expected results:* Once completed, a Drupal module will freely
    available for Tripal-based sites to use on their own sites. Thus
    providing graph visualizations for complex biological systems.
  - *Knowledge prerequisites:* PHP, Drupal, JavaScript, SQL.
  - *Skill level:* Medium
  - *Mentors:* Stephen Ficklin

  

- **Project Idea 9: BioModels AnalysisTools**
  - *Brief explanation:* Following the Reactome
    (<a href="http://www.reactome.org" class="external free"
    rel="nofollow">http://www.reactome.org</a>) recently launch
    "Analysis Service"
    (<a href="http://www.reactome.org/AnalysisService/" class="external free"
    rel="nofollow">http://www.reactome.org/AnalysisService/</a>) , the
    idea is to implement an analysis tool for BioModels
    (<a href="http://www.ebi.ac.uk/biomodels-main/" class="external free"
    rel="nofollow">http://www.ebi.ac.uk/biomodels-main/</a>) following a
    similar approach. The tool has two differentiated parts: (1) data
    filtering and intermediate data structure creation, (2) high
    performance analysis tool with a RESTFull Service API to allow
    programmatic access.
  - *Expected results:* A java core package plus a Spring MVC RESTFull
    service to be installed in BioModels live site.
  - *Knowledge prerequisites:* Java, SQL, XML, web services, Git.
  - *Skill level:* Medium/Advanced.
  - *Mentors:* Antonio Fabregat, Camille Laibe, Henning Hermjakob

  

- **Project Idea 10: Reactome for Illumina Basespace**
  - *Brief explanation:* Reactome
    (<a href="http://www.reactome.org" class="external free"
    rel="nofollow">http://www.reactome.org</a>) is a free, open-source,
    curated and peer reviewed pathway database. One of its goals is to
    provide intuitive bioinformatics tools for the visualization,
    interpretation and analysis of pathway knowledge to support basic
    research, genome analysis, modeling, systems biology and education.
    Illumina Basespace
    (<a href="http://basespace.illumina.com" class="external free"
    rel="nofollow">http://basespace.illumina.com</a>) is a genomics
    analysis platform that is directly integrated into the NextSeq,
    MiSeq, and HiSeq sequencing platforms.
  - *Expected results:* A fully working Illumina Basespace "App"
    connected to the Reactome Pathway Analysis Service
    (<a href="http://www.reactome.org/AnalysisService/" class="external free"
    rel="nofollow">http://www.reactome.org/AnalysisService/</a>) in
    order allow Basespace user to perform pathway enrichment and
    expression analysis agains Reactome Pathways.
  - *Knowledge prerequisites:* JavaScript, json, web services.
  - *Skill level:* Medium.
  - *Mentors:* Antonio Fabregat, Henning Hemjakob.

  

- **Project Idea 11: WebApollo Variant annotation**
  - *Background:* WebApollo
    (<a href="http://genomearchitect.org" class="external free"
    rel="nofollow">http://genomearchitect.org</a>) is an open-source
    genome browser plugin for conducting manual annotations for genomes
    inside JBrowse.
  - *Brief description:* This project would add the ability to annotate
    variants from VCF, multi-sample VCF and GVF files in WebApollo. This
    would involve creating a better visualization of multi-sample VCF
    files and creating a server side API for representing these
    annotations.
  - *Tools:* intermediate javascript, some server side java
  - *Skill level:* Medium
  - *Mentor:* Nathan Dunn, Colin Diesh

  

- **Project Idea 12: WebApollo Multi-scaffold visualization**
  - *Background:* WebApollo
    (<a href="http://genomearchitect.org" class="external free"
    rel="nofollow">http://genomearchitect.org</a>) is an open-source
    genome browser plugin for conducting manual annotations for genomes
    inside JBrowse.
  - *Brief description:* Normally genome browsers are capable of
    displaying one scaffold or sequence at a time, this project would
    involve displaying (and editing) genes split across multiple contigs
    at once.
  - *Tools:* advanced javascript, some server side java
  - *Skill level:* Advanced
  - *Mentor:* Nathan Dunn, Colin Diesh

  

- **Project Idea 13: Afra Flexible realtime Export**
  - *Background:* Afra
    (<a href="http://afra.sbcs.qmul.ac.uk" class="external free"
    rel="nofollow">http://afra.sbcs.qmul.ac.uk</a>) is an open-source
    genome browser plugin for conducting manual annotations for genomes
    inside JBrowse. For each gene prediction, curations are collected
    from several users and automatically compared: if all users propose
    the same changes to a gene model, these changes are considered to be
    correct. If gene models proposed by different curators disagree, the
    different gene predictions are shown to several more experience
    curators who submit their curation in turn. If gene models proposed
    by the more experienced curators disagree, all predictions are shown
    to an even more senior curator who makes a final verdict.
  - *Brief description:* Normally gene curation is a finite phase of a
    genome project. But with Afra
    (<a href="http://afra.sbcs.qmul.ac.uk" class="external free"
    rel="nofollow">http://afra.sbcs.qmul.ac.uk</a>) we are creating a
    community of constantly creating curations. We thus need an approach
    do share the “most up-to-date” version of curations at any point in
    time. The student should add DAS (distributed Annotation Server)
    export and appropriate GFF/GTF export functionality that is
    constantly up-to date - reflecting the latest community
    contributions.
  - *Tools:* ruby, javascript
  - *Skill level:* Advanced
  - *Mentor:* Anurag Priyam, Yannick Wurm

  

- **Project Idea 14: Implementing filters and filter visualizations for
  the MGI mouse genome browser using jbrowse**
  - *Brief explanation:* Mouse Genome Informatics (MGI,
    <a href="http://www.informatics.jax.org" class="external free"
    rel="nofollow">http://www.informatics.jax.org</a>) is the
    authoritative international bioinformatics database on the
    laboratory mouse, annotating data and building tools that allow
    researchers to access comprehensive, integrated information on mouse
    genes, alleles, phenotypes, disease models, and gene expression in
    order to facilitate the study of human health and disease. Data
    within MGI is curated from the primary research literature, or
    loaded from large-scale projects or other research resources. These
    data are organized using structured vocabularies (gene function,
    mutant phenotype descriptions, anatomy) and unique identifiers
    making all information accessible to computational as well as
    traditional approaches. At MGI, we use JBrowse as our main sequence
    and feature browser and are interested in adding to its
    functionality. We propose adding significant filtering capabilities
    to JBrowse that are configurable with a visual interface to access
    these parameters. It would be useful for navigating through dense,
    complex data such as variants, expression, and transcript features.
    It will also leverage JBrowse’s ability to download data by allowing
    users to quickly access downloads with just the transcripts/features
    they are interested in. This addition would help not only our
    instance of JBrowse but the JBrowse community.
  - *Expected results:* increased functionality of the browser allowing
    users to apply customizable filters, view and download filtered
    results
  - *Knowledge prerequisites:* Javascript, Dojo, Git, some perl, and a
    basic familiarity with biological data.
  - *Skill level:* Medium
  - *Mentors:* Paul Hale (primary), Joanne Berghout

  

- **Project Idea 15: Intermine for Reactome: a data mining resource for
  metabolic pathways**
  - *Brief explanation:* Biological sciences have entered the the big
    data era. Tools and techniques are emerging to enable the extraction
    of patterns and meaning from the growing accumulation of biological
    data. Data warehousing of biological databases is an integrative
    approach to making complex information from a variety of sources
    more easily accessible for data mining and analysis. Reactome is a
    free, open-source, curated and peer reviewed database of metabolic
    pathways and their components. Our goal is to provide intuitive
    bioinformatics tools for the visualization, interpretation and
    analysis of pathway knowledge to support basic research, genome
    analysis, modeling, systems biology and education. InterMine is an
    open source data warehouse built specifically for the integration
    and analysis of complex biological data. The idea here is to create
    a new resource that exposes the Reactome Knowledgebase to the
    well-developed data warehousing tools and interfaces provided by
    Intermine.
  - *Expected results: An Intermine implementation for Reactome,
    including new web interfaces and web services APIs*
  - *Knowledge prerequisites:* Java or Perl, XML, relational databases
    (mySQL, PosgGreSQL)
  - *Skill level:* Medium
  - *Mentor:* Sheldon McKay

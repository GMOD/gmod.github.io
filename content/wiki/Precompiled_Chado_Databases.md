---
title: "Precompiled Chado Databases"
---
# Precompiled Chado Databases


<a href="https://cpt.tamu.edu/chado-prebuilt-schema/"
class="external text" rel="nofollow">Chado database dumps of precompiled
ontologies are publicly available</a> to save Chado users the time and
hassle of downloading and compiling the ontologies themselves.

Go to the <a href="https://cpt.tamu.edu/chado-prebuilt-schema/"
class="external text" rel="nofollow">download site</a>.

The ontologies currently available are:

- Chado Feature Properties
- Gene Ontology
- Plant Ontology
- Relationship Ontology
- Sequence Ontology

These are updated weekly; the workflow is as follows:

- clone Chado from SVN
- build
- load ontologies
- dump database as SQL
- upload to a publicly accessible webserver

Note that none of the Chado-related scripts are installed, and the GMOD
conf files are not created in GMOD_ROOT. For remote access (e.g., via
Artemis), and tools that do not make use of GMOD_ROOT locally, this is
not a problem.

These database dumps are provided by Eric Rasche and the
<a href="https://cpt.tamu.edu/" class="external text"
rel="nofollow">Center for Phage Technology at Texas A&amp;M
University</a>. Please
<a href="https://github.com/erasche/chado-schema-builder/issues/new"
class="external text" rel="nofollow">open an issue</a> if you are
interested in having:

- other ontologies added to the dumps
- other builds with different (sub)sets of ontologies

All of these features can be added on request.


[Category](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")

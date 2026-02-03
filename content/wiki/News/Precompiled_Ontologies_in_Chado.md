---
title: "News/Precompiled Ontologies in Chado"
---
# News/Precompiled Ontologies in Chado

Eric Rasche and the
<a href="https://cpt.tamu.edu/" class="external text"
rel="nofollow">Center for Phage Technology at Texas A&amp;M
University</a> are making
<a href="https://cpt.tamu.edu/~docs/chado/" class="external text"
rel="nofollow">Chado database dumps of precompiled ontologies publicly
available</a> to save other Chado users the time and hassle of
downloading and compiling the ontologies themselves.

Go to the
<a href="https://cpt.tamu.edu/~docs/chado/" class="external text"
rel="nofollow">download site</a>.

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

Please <a href="mailto:rasche.eric@yandex.ru" class="external text"
rel="nofollow">contact Eric</a> if you are interested in having other
ontologies added to the dumps, other builds with different (sub)sets of
ontologies, or archived copies of schemas over time.

Note that none of the Chado-related scripts are installed, and the GMOD
conf files are not created in GMOD_ROOT. For remote access (e.g., via
Artemis), and tools that do not make use of GMOD_ROOT locally, this is
not a problem.



*Posted to the [GMOD News](../GMOD_News) on 2014/02/20*

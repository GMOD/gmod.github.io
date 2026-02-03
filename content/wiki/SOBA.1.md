---
title: "SOBA"
---
# SOBA

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/b6/SOBA_Header.jpg/400px-SOBA_Header.jpg"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/b6/SOBA_Header.jpg/600px-SOBA_Header.jpg 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/b6/SOBA_Header.jpg/800px-SOBA_Header.jpg 2x"
width="400" height="81" alt="SOBA logo" />

Status

- Mature release
- Development: maintenance
- Support: active

Resources

- <a
  href="http://www.sequenceontology.org/wiki/index.php/SOBA_-_Sequence_Ontology_Bioinformatics_Analysis"
  class="external text" rel="nofollow">Home page</a>

  Ontology Bioinformatics Analysis
  (SOBA)</span>](#About_Sequence_Ontology_Bioinformatics_Analysis_.28SOBA.29)
- [Downloads](#Downloads)
- [Using
  SOBA](#Using_SOBA)
  - [System
    Requirements](#System_Requirements)
    - [SOBA
      web](#SOBA_web)
    - [SOBAcl](#SOBAcl)
  - [Installation](#Installation)
  - [Documentation](#Documentation)
- [Publications,
  Tutorials, and
  Presentations](#Publications.2C_Tutorials.2C_and_Presentations)
  - [Tutorials](#Tutorials)
- [Contacts and
  Mailing Lists](#Contacts_and_Mailing_Lists)
- [More on
  SOBA](#More_on_SOBA)

## About Sequence Ontology Bioinformatics Analysis (SOBA)

SOBA, Sequence Ontology Bioinformatics Analysis, is a command line tool
and web application for analyzing [GFF3](/wiki/GFF3) annotations.
[GFF3](/wiki/GFF3) is a standard file format for genomic annotation
data. SOBA gathers statistics from GFF3 files and renders them as tables
and graphs.

The web version of SOBA will produce the following:

- Summary statistics of feature types and attributes used
- Histograms of feature lengths
- Graphs of
  <a href="http://www.sequenceontology.org" class="external text"
  rel="nofollow">Sequence Ontology</a> terms used
- Histograms of intron density
- Suggestions to improve SO compliance for invalid terms

In addition, the command line tool (SOBAcl) flexibly produces a much
wider variety of tables, figures and graphs based on the data in a
[GFF3](/wiki/GFF3) file as well as the ability to produce complex and
extensible custom reports via a robust template system.

SOBA is intended as a tool for those dealing with genomic sequence
annotation who want to view genome wide summaries of their annotation
files. For example: SOBA would be a useful tool at an annotation
jamboree for a newly sequenced organism and when preparing the resulting
genome paper; SOBA would help those developing annotation tools to
quickly evaluate updates to their tool; SOBA assists comparative
genomics analyses by providing a high-level overview of the genome of
multiple organisms. SOBA complements genome browsers by providing a
summary of all the features annotated in the genome.

Visit the <a
href="http://www.sequenceontology.org/wiki/index.php/SOBA_-_Sequence_Ontology_Bioinformatics_Analysis"
class="external text" rel="nofollow">SOBA website</a>.

## Downloads

- SOBAcl is available (via
  <a href="http://subversion.apache.org/" class="external text"
  rel="nofollow">Subversion</a>) from:
     svn co svn://topaz.genetics.utah.edu/SOBA/trunk SOBA

## Using SOBA

### System Requirements

SOBA is built with Perl and uses
<a href="http://template-toolkit.org/" class="external text"

reports, GraphViz for ontology graphs, and GD for charts. SOBAweb uses
<a href="http://search.cpan.org/perldoc?CGI::Application"
class="external text" rel="nofollow">CGI::Application</a> as a Perl
webapp framework and the JQuery JavaScript library for Web 2.0 effects
and [AJAX](/wiki/Glossary#AJAX).

#### SOBA web

The web interface to SOBA should work on any modern browser that has
Javascript enabled.

#### SOBAcl

SOBAcl requires a number of Perl libraries, as well as the Graphviz and
libgd graphics library:

- <a href="http://www.graphviz.org/" class="external text"
  rel="nofollow">The Graphviz library</a>
- <a href="http://www.libgd.org/Main_Page" class="external text"
  rel="nofollow">The libgd graphics library</a>
- <a href="http://www.perl.org/" class="external text"
  rel="nofollow">Perl</a>
- <a href="http://search.cpan.org/dist/GraphViz/" class="external text"
  rel="nofollow">GraphViz</a>
- <a href="http://search.cpan.org/dist/Template-Toolkit/"
  class="external text" rel="nofollow">Template Toolkit</a>
- <a href="http://search.cpan.org/dist/DBI/" class="external text"
  rel="nofollow">DBI</a>
- <a href="http://search.cpan.org/dist/Statistics-Descriptive/"
  class="external text" rel="nofollow">Statistics::Descriptive</a>
- <a href="http://search.cpan.org/dist/Set-IntSpan-Fast-XS/"
  class="external text" rel="nofollow">Set::IntSpan::Fast</a>
- <a href="http://search.cpan.org/dist/Text-Table/" class="external text"
  rel="nofollow">Text::Table</a>
- <a href="http://search.cpan.org/dist/Number-Format/"
  class="external text" rel="nofollow">Number::Format</a>
- <a href="http://search.cpan.org/dist/SQL-Abstract/"
  class="external text" rel="nofollow">SQL::Abstract</a>
- <a href="http://search.cpan.org/dist/go-perl/" class="external text"
  rel="nofollow">GO::Parser from go-perl</a>
- <a href="http://search.cpan.org/dist/GDGraph/" class="external text"
  rel="nofollow">GD::Graph</a>

### Installation

Install documentation is included in the SOBAcl download.

### Documentation

Documentation for the web interface to SOBA is available on the <a
href="http://www.sequenceontology.org/wiki/index.php/SOBA_-_Sequence_Ontology_Bioinformatics_Analysis"
class="external text" rel="nofollow">Sequence Ontology Wiki</a> as well
as via tool-tips on the site itself.

Documentation for the command line version - SOBAcl - is available as a
usage statement with the script itself:

    SOBAcl --help

A README and INSTALL document are also included with SOBAcl.

## Publications, Tutorials, and Presentations

### Tutorials

<a href="/wiki/SOBA_Tutorial" class="mw-redirect" title="SOBA Tutorial">SOBA
Tutorial</a>
taught as part of the [2013 GMOD Summer
School](/wiki/2013_GMOD_Summer_School)

## Contacts and Mailing Lists

SOBA is supported by the
<a href="https://lists.sourceforge.net/lists/listinfo/song-devel"
class="external text" rel="nofollow">Sequence Ontology Developers
Mailing list</a>.

## More on SOBA

See

Raw tool data at [SOBA/tool data](/wiki/SOBA/tool_data)

href="http://www.sequenceontology.org/wiki/index.php/SOBA_-_Sequence_Ontology_Bioinformatics_Analysis"

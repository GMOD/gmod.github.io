---
title: "News/Apollo 1.7.0 Released"
---
# News/Apollo 1.7.0 Released


Version 1.7.0 of [Apollo](../Apollo.1 "Apollo") has just been released.
You can access the updated Apollo page at
<a href="http://www.fruitfly.org/annot/apollo" class="external free"
rel="nofollow">http://www.fruitfly.org/annot/apollo</a>

Changes in this version include

- Added [GFF3](../Glossary#GFF "Glossary") support
- Added program source filtering for reading off
  <a href="../Chado" class="mw-redirect" title="Chado">Chado</a>
  databases
- Lots of work on the ensj adapter to allow it to work better with
  recent ensembl schemas, handle ditags, give finer control of gene
  loading, increase speed of gene loading, bug fixes to history, cigar
  parsing in ensj layer, loading of contig features
- Allow layout of display to be saved to / loaded from a file. Most
  useful for synteny where initial display set up can take time. The
  saved layout also includes the current base position and zoom factor,
  and on loading you can choose to use those.
- Ability to edit settings for a type (new popup menu item in feature
  popup). The settings which can be edited are the glyph used for
  drawing the feature and the columns in the table displayed in the
  evidence panel.
- New drawing glyph which shades exons darker or lighter depending on
  their phase (DrawablePhaseHighlightGeneFeatureSet). Also a version of
  that which uses straight lines to join exons rather than 'hats'
  (DrawablePhaseHighlightNoHatGeneFeatureSet)
- Work on ensembl synteny adapter so it works with latest ensembl
  compara db schema, and basic support for allowing different alignment
  sets to be selected.
- PureJDBCTransactionWriter added. This entailed some changes to other
  classes, but in almost every case the changes are 1. reverse
  compatible and 2. invisible to the end user.
- Uses of Log4J for generating log files.

Plus many other changes. See the <a
href="http://gmod.cvs.sourceforge.net/gmod/apollo/doc/release-notes/release-1.7.0-notes?view=markup"
class="external text" rel="nofollow">release notes</a> for more.

We are hoping to cut releases on a more regular basis (after the year
and a half long hiatus). So please [let us
know](../Apollo.1#Contact "Apollo") if you find any bugs and they will
be addressed and put into a new release as soon as possible.

  


*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2008/01/11*


[Category](../Special%253ACategories "Special%253ACategories"):

- [News Items](../Category%253ANews_Items "Category%253ANews Items")

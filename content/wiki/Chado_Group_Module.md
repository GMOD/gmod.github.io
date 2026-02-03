---
title: "Chado Group Module"
---
# Chado Group Module

This module will facilitate comparative methods and analyses in Chado.
It mainly consists of the *grp* (group) table and supporting tables.

  Discussion](#Discussion)
  - [Use
    cases](#Use_cases)
  - [Potential
    issues](#Potential_issues)
- [Integration
  with Chado](#Integration_with_Chado)
- [SQL
  Implementation](#SQL_Implementation)
- [Resources](#Resources)

## Discussion

### Use cases

- Protein families
- Candidate genes (QTL)
- Coexpression analysis
- Ortholog groups
- Organisms used in a study
- Stocks used in a study
- Metabolic pathways
- Functional sets
- Gene sets (a la
  <a href="http://www.broadinstitute.org/gsea/msigdb/index.jsp"
  class="external text" rel="nofollow">MSigDB</a>)
- Collections of genes/organisms (a la Entrez)

### Potential issues

You could potentially link an organism and a feature (and anything else
with a grpmember linker table) to the same grpmember_id.

Current schema is incompatible with chado-xml.

Should grpmember have a type_id column?

## Integration with Chado

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/c9/ChadoComparativeModule.png/1200px-ChadoComparativeModule.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c9/ChadoComparativeModule.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c9/ChadoComparativeModule.png 2x"
width="1200" height="670" alt="ChadoComparativeModule.png" />

Tables in blue would be part of the Comparative module proper, while
tables in red would be part of submodules.

Not shown: grp_cvterm, analysisgrpmember

## SQL Implementation

<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/48/ChadoGroupModule.sql" class="internal"
title="ChadoGroupModule.sql">Source Code</a>

<a href="https://github.com/autochthe/Chado-group-module.git"
class="external text" rel="nofollow">GitHub</a>

## Resources

Mailing list <a
href="http://generic-model-organism-system-database.450254.n5.nabble.com/Chado-Group-Module-td5712158.html"
class="external text" rel="nofollow">discussion</a>

Original <a
href="http://generic-model-organism-system-database.450254.n5.nabble.com/Chado-Comparative-Module-tp5712078.html"
class="external text" rel="nofollow">discussion</a>

<a href="http://youtu.be/Soam8O3g1jg" class="external text"
rel="nofollow">Video</a> of original talk

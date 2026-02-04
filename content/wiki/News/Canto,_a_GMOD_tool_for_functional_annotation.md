---
title: "News/Canto, a GMOD tool for functional annotation"
---
# News/Canto, a GMOD tool for functional annotation

[<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7e/CantoTextLogo.png/300px-CantoTextLogo.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7e/CantoTextLogo.png/450px-CantoTextLogo.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/7e/CantoTextLogo.png/600px-CantoTextLogo.png 2x"
width="300" height="74" alt="CantoTextLogo.png" />](../Canto)

We are pleased to announce that [Canto](../Canto), the
<a href="http://pombase.org" class="external text"

component.

Canto is an online tool that supports functional gene annotation by
community researchers as well as by professional curators. It provides a
simple interface to gather genetic and molecular data from publications
for inclusion in public biological databases.

Curation in Canto uses OBO ontologies, and the specific set of
ontologies is configurable upon setup. The PomBase Canto instance
currently uses GO, PSI-MOD and FYPO.

Genetic and physical interaction annotation is also supported. Canto
captures all necessary information about each interaction for submission
to BioGRID.

Canto currently supports annotation export in JSON format, either by
individual paper or in bulk (see some <a
href="https://github.com/pombase/pombase-chado/blob/master/data/canto_dump.json"
class="external text" rel="nofollow">example data</a> from PomBase Chado
loading tests).

The JSON data from Canto can be loaded into a relational database using
the Chado schema (as at PomBase) or alternative schemas.

Basic gene association file (GAF) export is also supported for GO
annotations.

More information about Canto:

- [GMOD wiki page on Canto](../Canto) -- includes downloads and
 mailing list

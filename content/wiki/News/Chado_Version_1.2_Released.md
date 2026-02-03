---
title: "News/Chado Version 1.2 Released"
---
# News/Chado Version 1.2 Released

I am pleased to announce the release of Chado version 1.2. It is
available at:

    http://sourceforge.net/projects/gmod/files/gmod/chado-1.2/

and the change log is listed below. There are two items of special
interest in this release:

1.  The [natural diversity
    module](../Chado_Natural_Diversity_Module.1)
    is included in this release. It is intended for capturing a variety
    of experimental data related to diversity, including phenotype and
    genotype assays, and collections like crosses and field collection.
2.  It now ships with a tool to aid in updating the schema from previous
    versions of Chado (from version 1.0 or better). See
    [Updating_Chado](../Updating_Chado) for more
    information on this tool.

Please follow up with comments or problems with this release to the
schema mailing list.

Thanks, [Scott](../User:Scott)

Changes in Chado 1.2:

- Added some error checking to gmod_fasta2gff3.pl (Rob)
- Updated Bio::Chado::Builder to detect recent versions of go-perl. They
  no longer have .pl at the end of the go2fmt script name (Rob)
- The GFF3 bulk loader will now ignore \##sequence-region directives;
  previously, their presence caused the loader to fail (Scott)
- added a check for the nodes file downloaded from NCBI. There have been
  cases of missing nodes/parents. Code dies if parent is missing. User
  must check the nodes file. This needs further investigation with NCBI
  taxonomy. (Naama)
- Fix the code in the gff-bridge in the sequence module so that GFF
  dumping from GBrowse will work correctly (Scott)
- Added a cvprop table to capture things like obo file version from a
  loaded cv. (Scott)
- Removed the "DB:" prefix from all of the names of databases that go
  into the db table. (Scott)
- Removed the dependency on Log::Log4perl (it was overkill for what it
  was being used for) (Scott)
- Bumped the version to 1.2 because of the new schema module. (Scott)
- Added gmod_chado_properties.pl to examine the chadoprop table and
  return values on the command line (like the schema version) (Scott)
- Added gmod_update_chado.pl to update the schema automatically, and
  added a make target (make update) to make updating easier. (Scott)
- Removed cell_type ontology from 'make ontologies' list as it wasn't
  loading via stag_storenode.pl at release time (Scott)

*Posted to the [GMOD News](../GMOD_News) on 2011/09/22*

- [News Items](../Category:News_Items)

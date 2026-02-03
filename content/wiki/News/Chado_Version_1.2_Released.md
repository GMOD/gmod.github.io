---
title: "News/Chado Version 1.2 Released"
---




<span id="top"></span>




# <span dir="auto">News/Chado Version 1.2 Released</span>









I am pleased to announce the release of Chado version 1.2. It is
available at:

    http://sourceforge.net/projects/gmod/files/gmod/chado-1.2/

and the change log is listed below. There are two items of special
interest in this release:

1.  The [natural diversity
    module](../Chado_Natural_Diversity_Module.1 "Chado Natural Diversity Module")
    is included in this release. It is intended for capturing a variety
    of experimental data related to diversity, including phenotype and
    genotype assays, and collections like crosses and field collection.
2.  It now ships with a tool to aid in updating the schema from previous
    versions of Chado (from version 1.0 or better). See
    [Updating_Chado](../Updating_Chado "Updating Chado") for more
    information on this tool.

Please follow up with comments or problems with this release to the
schema mailing list.

Thanks, [Scott](../User%253AScott "User%253AScott")

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

  



*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2011/09/22*






[Category](../Special%253ACategories "Special%253ACategories"):

- [News Items](../Category%253ANews_Items "Category%253ANews Items")






## Navigation menu







<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>


### Navigation



- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>




### Documentation



- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/News-2FChado_Version_1.2_Released"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 15:08 on 22 September
  2011.</span>
<!-- - <span id="footer-info-viewcount">6,914 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





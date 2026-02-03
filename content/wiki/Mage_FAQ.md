---
title: "Mage FAQ"
---




<span id="top"></span>




# <span dir="auto">Mage FAQ</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">About this
  FAQ</span>](#About_this_FAQ)
  - [<span class="tocnumber">1.1</span> <span class="toctext">What is
    this FAQ?</span>](#What_is_this_FAQ.3F)
  - [<span class="tocnumber">1.2</span> <span class="toctext">How is it
    maintained?</span>](#How_is_it_maintained.3F)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Is there
    other documentation?</span>](#Is_there_other_documentation.3F)
- [<span class="tocnumber">2</span> <span class="toctext">Using
  Mage</span>](#Using_Mage)
  - [<span class="tocnumber">2.1</span> <span class="toctext">What
    happened to the Rad
    module?</span>](#What_happened_to_the_Rad_module.3F)
  - [<span class="tocnumber">2.2</span> <span class="toctext">What
    should be done with experiments with multiple arrays per
    sample?</span>](#What_should_be_done_with_experiments_with_multiple_arrays_per_sample.3F)
  - [<span class="tocnumber">2.3</span> <span class="toctext">How do you
    store files containing raw
    data?</span>](#How_do_you_store_files_containing_raw_data.3F)
  - [<span class="tocnumber">2.4</span> <span class="toctext">How can
    one trace the biomaterials back to get a sense of the level of
    technical and/or biological
    replication?</span>](#How_can_one_trace_the_biomaterials_back_to_get_a_sense_of_the_level_of_technical_and.2For_biological_replication.3F)
  - [<span class="tocnumber">2.5</span> <span class="toctext">How do you
    create a reference from the results of a microarray experiment to
    the source of the data stored in the pub
    table?</span>](#How_do_you_create_a_reference_from_the_results_of_a_microarray_experiment_to_the_source_of_the_data_stored_in_the_pub_table.3F)



  

## <span id="About_this_FAQ" class="mw-headline">About this FAQ</span>

### <span id="What_is_this_FAQ.3F" class="mw-headline">What is this FAQ?</span>

It is the list of Frequently Asked Questions about [the Chado Mage
module](Chado_Mage_Module "Chado Mage Module").

### <span id="How_is_it_maintained.3F" class="mw-headline">How is it maintained?</span>

It is now maintained as a
<a href="http://en.wikipedia.org/wiki/Wiki" class="extiw"
title="wp:Wiki">Wiki</a> on this site. You can help maintain it by
adding questions and answers.

### <span id="Is_there_other_documentation.3F" class="mw-headline">Is there other documentation?</span>

See [the Mage module
documentation](Chado_Mage_Module "Chado Mage Module").

## <span id="Using_Mage" class="mw-headline">Using Mage</span>

### <span id="What_happened_to_the_Rad_module.3F" class="mw-headline">What happened to the Rad module?</span>

It has been renamed Mage, this module.

### <span id="What_should_be_done_with_experiments_with_multiple_arrays_per_sample.3F" class="mw-headline">What should be done with experiments with multiple arrays per sample?</span>

Examples: genome tiling experiments, or multiple samples per array
(Agilent and Illumina arrays).

There is a many-to-many between samples and hybridizations using the
[assay_biomaterial
table](Chado_Tables#Table:_assay_biomaterial "Chado Tables"). You assign
your sample channel using the
[assay_biomaterial.channel](Chado_Tables#Table:_assay_biomaterial "Chado Tables")
attribute for a multi-channel array. Each tiling array hybridization in
a tiling set would be considered a separate assay, and each would have a
different
[assay.arraydesign_id](Chado_Tables#Table:_assay "Chado Tables").

### <span id="How_do_you_store_files_containing_raw_data.3F" class="mw-headline">How do you store files containing raw data?</span>

Use [acquisition.uri](Chado_Tables#Table:_acquisition "Chado Tables") to
point to the file outside the database, in the file system.

### <span id="How_can_one_trace_the_biomaterials_back_to_get_a_sense_of_the_level_of_technical_and.2For_biological_replication.3F" class="mw-headline">How can one trace the biomaterials back to get a sense of the level of technical and/or biological replication?</span>

Use the experiment, factor, and treatment tables.

### <span id="How_do_you_create_a_reference_from_the_results_of_a_microarray_experiment_to_the_source_of_the_data_stored_in_the_pub_table.3F" class="mw-headline">How do you create a reference from the results of a microarray experiment to the source of the data stored in the pub table?</span>




[Categories](Special%253ACategories "Special%253ACategories"):

- [FAQ](Category%253AFAQ "Category%253AFAQ")
- [Chado Modules](Category%253AChado_Modules "Category%253AChado Modules")
- [Microarrays](Category%253AMicroarrays "Category%253AMicroarrays")






## Navigation menu









### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>




### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Mage_FAQ" rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:54 on 7 January
  2009.</span>
<!-- - <span id="footer-info-viewcount">45,195 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





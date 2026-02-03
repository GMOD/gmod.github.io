---
title: "Mage FAQ"
---
# Mage FAQ

  FAQ</span>](#About_this_FAQ)
  - [What is
    this FAQ?](#What_is_this_FAQ.3F)
  - [How is it
    maintained?](#How_is_it_maintained.3F)
  - [Is there
    other documentation?](#Is_there_other_documentation.3F)
- [Using
  Mage](#Using_Mage)
  - [What
    happened to the Rad
    module?](#What_happened_to_the_Rad_module.3F)
  - [What
    should be done with experiments with multiple arrays per
    sample?](#What_should_be_done_with_experiments_with_multiple_arrays_per_sample.3F)
  - [How do you
    store files containing raw
    data?](#How_do_you_store_files_containing_raw_data.3F)
  - [How can
    one trace the biomaterials back to get a sense of the level of
    technical and/or biological
    replication?](#How_can_one_trace_the_biomaterials_back_to_get_a_sense_of_the_level_of_technical_and.2For_biological_replication.3F)
  - [How do you
    create a reference from the results of a microarray experiment to
    the source of the data stored in the pub
    table?](#How_do_you_create_a_reference_from_the_results_of_a_microarray_experiment_to_the_source_of_the_data_stored_in_the_pub_table.3F)

  

## About this FAQ

### What is this FAQ?

It is the list of Frequently Asked Questions about [the Chado Mage
module](Chado_Mage_Module "Chado Mage Module").

### How is it maintained?

It is now maintained as a
<a href="http://en.wikipedia.org/wiki/Wiki" class="extiw"
title="wp:Wiki">Wiki</a> on this site. You can help maintain it by
adding questions and answers.

### Is there other documentation?

See [the Mage module
documentation](Chado_Mage_Module "Chado Mage Module").

## Using Mage

### What happened to the Rad module?

It has been renamed Mage, this module.

### What should be done with experiments with multiple arrays per sample?

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

### How do you store files containing raw data?

Use [acquisition.uri](Chado_Tables#Table:_acquisition "Chado Tables") to
point to the file outside the database, in the file system.

### How can one trace the biomaterials back to get a sense of the level of technical and/or biological replication?

Use the experiment, factor, and treatment tables.

### How do you create a reference from the results of a microarray experiment to the source of the data stored in the pub table?

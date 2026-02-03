---
title: "Migrating from GBrowse to JBrowse"
---




<span id="top"></span>




# <span dir="auto">Migrating from GBrowse to JBrowse</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Things to
  consider</span>](#Things_to_consider)
  - [<span class="tocnumber">1.1</span> <span class="toctext">New or
    Existing Server</span>](#New_or_Existing_Server)
  - [<span class="tocnumber">1.2</span> <span class="toctext">disk space
    requirements</span>](#disk_space_requirements)
  - [<span class="tocnumber">1.3</span> <span class="toctext">computing
    requirements</span>](#computing_requirements)
  - [<span class="tocnumber">1.4</span> <span class="toctext">do you
    have the original GFF?</span>](#do_you_have_the_original_GFF.3F)
  - [<span class="tocnumber">1.5</span> <span class="toctext">dealing
    with multiple species/data
    sources</span>](#dealing_with_multiple_species.2Fdata_sources)
- [<span class="tocnumber">2</span>
  <span class="toctext">prepare-refseqs.pl</span>](#prepare-refseqs.pl)
- [<span class="tocnumber">3</span>
  <span class="toctext">\*-to-json.pl</span>](#.2A-to-json.pl)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Mapping
    out GBrowse to JBrowse
    configuration</span>](#Mapping_out_GBrowse_to_JBrowse_configuration)
    - [<span class="tocnumber">3.1.1</span>
      <span class="toctext">Special note about
      callbacks</span>](#Special_note_about_callbacks)
- [<span class="tocnumber">4</span> <span class="toctext">Dealing with
  binary data</span>](#Dealing_with_binary_data)
- [<span class="tocnumber">5</span> <span class="toctext">Where to get
  help</span>](#Where_to_get_help)



## <span id="Things_to_consider" class="mw-headline">Things to consider</span>

### <span id="New_or_Existing_Server" class="mw-headline">New or Existing Server</span>

### <span id="disk_space_requirements" class="mw-headline">disk space requirements</span>

### <span id="computing_requirements" class="mw-headline">computing requirements</span>

The computing requirements for a JBrowse server are generally much less
than a GBrowse server, since the JBrowse server will only be serving up
small bits of text as json and javascript files, as opposed to creating
images on the fly for GBrowse servers. On the other hand, processing the
data to create the JBrowse server is generally more intensive (or at a
minimum, as much as) that what is needed for a GBrowse instance. It is
not unreasonable therefore to have a server with a fair amount of
resources for doing the data processing and then using a "smaller"
server for serving the data. In fact, it is possible to put all of the
data in an AWS S3 store and not have a server at all once the data
processing is done. See
[Using_AWS_S3_For_JBrowse](Using_AWS_S3_For_JBrowse "Using AWS S3 For JBrowse").

### <span id="do_you_have_the_original_GFF.3F" class="mw-headline">do you have the original GFF?</span>

Generally, it Is easier to create a JBrowse instance from the original
GFF that from a GBrowse database like Bio::DB::GFF or
Bio::DB::SeqFeature::Store.

### <span id="dealing_with_multiple_species.2Fdata_sources" class="mw-headline">dealing with multiple species/data sources</span>

JBrowse can easily support having multiple species or data sources, like
you would see in a drop down menu in GBrowse. See [this
FAQ](JBrowse_FAQ#How_do_I_set_up_multiple_genomes_in_a_single_jbrowse_instance.3F "JBrowse FAQ")
and the one below it, and the section in the [JBrowse Configuration
Guide](JBrowse_Configuration_Guide "JBrowse Configuration Guide") that
they point to.

## <span id="prepare-refseqs.pl" class="mw-headline">prepare-refseqs.pl</span>

Example command lines for GFF, FASTA and BioDB

## <span id=".2A-to-json.pl" class="mw-headline">\*-to-json.pl</span>

### <span id="Mapping_out_GBrowse_to_JBrowse_configuration" class="mw-headline">Mapping out GBrowse to JBrowse configuration</span>

A table would be good

#### <span id="Special_note_about_callbacks" class="mw-headline">Special note about callbacks</span>

## <span id="Dealing_with_binary_data" class="mw-headline">Dealing with binary data</span>

## <span id="Where_to_get_help" class="mw-headline">Where to get help</span>




[Categories](Special%253ACategories "Special%253ACategories"):

- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")
- [JBrowse](Category%253AJBrowse "Category%253AJBrowse")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Migrating_from_GBrowse_to_JBrowse"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:24 on 9 July
  2018.</span>
<!-- - <span id="footer-info-viewcount">9,142 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





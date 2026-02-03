---
title: "Chado Update via GFF"
---




<span id="top"></span>




# <span dir="auto">Chado Update via GFF</span>









There has frequently been interest in updating a
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> database
using a [GFF](GFF "GFF") file, and I've finally gotten around to trying
to implement it. My initial efforts were centered around converting GFF
to [Chado XML](Chado_XML "Chado XML") using
<a href="http://bioperl.org/wiki/Module:Bio::SeqIO::chadoxml"
class="external text" rel="nofollow">Bio::SeqIO::chadoxml</a>, but I was
never completely satisfied with the result, and I was unable to load it
with [XORT](XORT.1 "XORT") or
<a href="http://search.cpan.org/perldoc?DBIx::DBStag"
class="external text" rel="nofollow">DBIx::DBStag</a>. So, I've decided
to work on the [GFF3](GFF3 "GFF3") bulk loader `gmod_bulk_load_gff3.pl`
to have it do updates and deletes as well. Accordingly, I've identified
these cases that should be addressed:


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Updating
  properties</span>](#Updating_properties)
- [<span class="tocnumber">2</span> <span class="toctext">Updating
  feature locations</span>](#Updating_feature_locations)
- [<span class="tocnumber">3</span> <span class="toctext">Updating
  complete gene models</span>](#Updating_complete_gene_models)
- [<span class="tocnumber">4</span> <span class="toctext">Deleting
  features</span>](#Deleting_features)
- [<span class="tocnumber">5</span>
  <span class="toctext">Comments</span>](#Comments)



# <span id="Updating_properties" class="mw-headline">Updating properties</span>

Perhaps the simplest case is when updating feature properties (for
purposes of this discussion, 'feature properties' encompasses items in
the
[featureprop](Chado_Sequence_Module#Table:_featureprop "Chado Sequence Module"),
[feature_cvterm](Chado_Sequence_Module#Table:_feature_cvterm "Chado Sequence Module")
and
[feature_dbxref](Chado_Sequence_Module#Table:_feature_dbxref "Chado Sequence Module")
tables) is desired, nevertheless, it poses some possible hang ups. For
instance:

- What should happen to the properties already there? Would they be
  uniformly deleted (bad), marked 'not current' (only partially
  possible) or just left there? Currently, the feature_dbxref table has
  an is_current column, but featureprop and feature_cvterm do not.
- This is true of all updates and deletes: how to decide that the
  feature is the same? Is the Name enough? What about Name and type?
  Name, type and srcfeature/seq_id?

# <span id="Updating_feature_locations" class="mw-headline">Updating feature locations</span>

If name, type and srcfeature are the same, allow
[featureloc](Chado_Sequence_Module#Table:_featureloc "Chado Sequence Module")
updates?

# <span id="Updating_complete_gene_models" class="mw-headline">Updating complete gene models</span>

If updating child features, what happens to the old features? Remove
their
[featureloc](Chado_Sequence_Module#Table:_featureloc "Chado Sequence Module")
entries and create completely new children? Only allow this for features
of type 'gene'?

# <span id="Deleting_features" class="mw-headline">Deleting features</span>

Again, if name, type and srcfeature are the same, allow the delete?

# <span id="Comments" class="mw-headline">Comments</span>

- I'd say the most useful cases for many folks would be (a) add
  annotations/properties to main gene features, and (b) delete then
  reload existing gene features (with new primary data: locations,
  sequence, etc). These two abilities would handle many uses for
  annotating new genomes: adding more dbxrefs, properties, etc. to
  existing gene features, and ability to update selected features by
  drop/replace. For the second case, if one can **Delete** via a
  [GFF](GFF "GFF") entry, it should be easy to also **Update** the
  complete gene model.
- For GFF input to handle these, I'd say lines like this should be able
  to trigger updates to an existing feature, where CRUDop is your
  database Create/Replace/Update/Drop operation.

<!-- -->

     RefChr  Source  Type  (st) (en) (sc) (st) (ph)   Attributes
     ChrX    MyDB    gene    .    .   .    .    .      ID=MyGene1;CRUDop=DROP
     ChrX    MyDB    gene    .    .   .    .    .      ID=MyGene2;CRUDop=UPDATE;Dbxref=SW:U1234
     ChrX    MyDB    gene    1    2   9    -    .      ID=MyGene3;CRUDop=REPLACE;Dbxref=SW:U1234;..more..

[Dongilbert](User%253ADongilbert "User%253ADongilbert") 16:48, 30 March 2007
(EDT)




[Category](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Update_via_GFF" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 19:23 on 30 December
  2008.</span>
<!-- - <span id="footer-info-viewcount">22,192 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





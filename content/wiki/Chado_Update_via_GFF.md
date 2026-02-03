---
title: "Chado Update via GFF"
---
# Chado Update via GFF

There has frequently been interest in updating a
<a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> database
using a [GFF](/wiki/GFF) file, and I've finally gotten around to trying
to implement it. My initial efforts were centered around converting GFF
to [Chado XML](/wiki/Chado_XML) using
<a href="http://bioperl.org/wiki/Module:Bio::SeqIO::chadoxml"
class="external text" rel="nofollow">Bio::SeqIO::chadoxml</a>, but I was
never completely satisfied with the result, and I was unable to load it
with [XORT](/wiki/XORT.1) or
<a href="http://search.cpan.org/perldoc?DBIx::DBStag"
class="external text" rel="nofollow">DBIx::DBStag</a>. So, I've decided
to work on the [GFF3](/wiki/GFF3) bulk loader `gmod_bulk_load_gff3.pl`
to have it do updates and deletes as well. Accordingly, I've identified
these cases that should be addressed:

  properties</span>](#Updating_properties)
- [Updating
  feature locations](#Updating_feature_locations)
- [Updating
  complete gene models](#Updating_complete_gene_models)
- [Deleting
  features](#Deleting_features)
- [Comments](#Comments)

# Updating properties

Perhaps the simplest case is when updating feature properties (for
purposes of this discussion, 'feature properties' encompasses items in
the
[featureprop](/wiki/Chado_Sequence_Module#Table:_featureprop),
[feature_cvterm](/wiki/Chado_Sequence_Module#Table:_feature_cvterm)
and
[feature_dbxref](/wiki/Chado_Sequence_Module#Table:_feature_dbxref)
tables) is desired, nevertheless, it poses some possible hang ups. For
instance:

- What should happen to the properties already there? Would they be
  uniformly deleted (bad), marked 'not current' (only partially
  possible) or just left there? Currently, the feature_dbxref table has
  an is_current column, but featureprop and feature_cvterm do not.
- This is true of all updates and deletes: how to decide that the
  feature is the same? Is the Name enough? What about Name and type?
  Name, type and srcfeature/seq_id?

# Updating feature locations

If name, type and srcfeature are the same, allow
[featureloc](/wiki/Chado_Sequence_Module#Table:_featureloc)
updates?

# Updating complete gene models

If updating child features, what happens to the old features? Remove
their
[featureloc](/wiki/Chado_Sequence_Module#Table:_featureloc)
entries and create completely new children? Only allow this for features
of type 'gene'?

# Deleting features

Again, if name, type and srcfeature are the same, allow the delete?

# Comments

- I'd say the most useful cases for many folks would be (a) add
  annotations/properties to main gene features, and (b) delete then
  reload existing gene features (with new primary data: locations,
  sequence, etc). These two abilities would handle many uses for
  annotating new genomes: adding more dbxrefs, properties, etc. to
  existing gene features, and ability to update selected features by
  drop/replace. For the second case, if one can **Delete** via a
  [GFF](/wiki/GFF) entry, it should be easy to also **Update** the
  complete gene model.
- For GFF input to handle these, I'd say lines like this should be able
  to trigger updates to an existing feature, where CRUDop is your
  database Create/Replace/Update/Drop operation.
     RefChr  Source  Type  (st) (en) (sc) (st) (ph)   Attributes
     ChrX    MyDB    gene    .    .   .    .    .      ID=MyGene1;CRUDop=DROP
     ChrX    MyDB    gene    .    .   .    .    .      ID=MyGene2;CRUDop=UPDATE;Dbxref=SW:U1234
     ChrX    MyDB    gene    1    2   9    -    .      ID=MyGene3;CRUDop=REPLACE;Dbxref=SW:U1234;..more..

[Dongilbert](/wiki/User%253ADongilbert) 16:48, 30 March 2007
(EDT)

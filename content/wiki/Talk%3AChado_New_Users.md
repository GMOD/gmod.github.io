---
title: "Talk:Chado New Users"
---
# Talk:Chado New Users

  Notes</span>](#Meeting_Notes)
  - [20070405](#20070405)
  - [20070329](#20070329)
  - [20070322](#20070322)

## Meeting Notes

### 20070405

- Tried to work through some of the Central Dogma stuff in Chado Best
  Practices. Zheng ran the sample query, which hung his laptop.
- Jim created the Problems template
  [Template:Problems](Template:Problems "Template:Problems") for adding
  notes to documentation pages in the wiki.

### 20070329

Jim was out of town and everyone else attended the Systems Biology
meeting

### 20070322

Lincoln was able to attend today. We looked at Chado tables using a
combination of phpPgAdmin and command line. To do direct SQL queries in
phpPgAdmin, click at the schema level.

Example query:

    select f.name, d.*, fd.* from dbxref as  d, feature_dbxref as fd, feature as f where d.dbxref_id = fd.dbxref_id and f.feature_id = fd.feature_id and accession !='SGD'

Gives:

    name  | dbxref_id | db_id | accession | version | description | feature_dbxref_id | feature_id | dbxref_id | is_current 
    -------+-----------+-------+-----------+---------+-------------+-------------------+------------+-----------+------------
    COX2  |     42435 |     2 | landmark  | 1       |             16241 |      16241 |     42435 | t
    COB   |     42435 |     2 | landmark  | 1       |             16176 |      16176 |     42435 | t
    COX1  |     42435 |     2 | landmark  | 1       |             16129 |      16129 |     42435 | t
    RPC40 |     42435 |     2 | landmark  | 1       |             15800 |      15800 |     42435 | t
    HTS1  |     42435 |     2 | landmark  | 1       |             15623 |      15623 |     42435 | t
    ERG10 |     42435 |     2 | landmark  | 1       |             15474 |      15474 |     42435 | t
    PEP4  |     42435 |     2 | landmark  | 1       |             15173 |      15173 |     42435 | t
    TPK2  |     42435 |     2 | landmark  | 1       |             15058 |      15058 |     42435 | t
    GAL4  |     42435 |     2 | landmark  | 1       |             14960 |      14960 |     42435 | t
    RAD17 |     42435 |     2 | landmark  | 1       |             14775 |      14775 |     42435 | t

Note that all have the same dbxref_id.

  
Conclusions

- bulk loaded sample yeast gff3 may not create canonical chado data.
  - features all have dbxref = NULL
    - *feature.dbxref_id is nullable; the original design was to have
      the dbxref_id that appears in the feature table to be the
      'primary' dbxref_id. A fairly recent addition was to add a command
      line flag to the bulk loader to allow the user to specify what (if
      anything) should be used as feature.dbxref_id. All others go in
      feature_dbxref.*
  - feature_dbxref acts strange (see example above)
    - *Not strange at all :-) In typical installations, db_id=2 is the
      GFF_source that comes from the GFF3 file. If you take a look at
      the GFF3 that SGD produces, most have a source of 'SGD', but a few
      have a source of 'landmark', which is used by SGD to put a few
      gene features in the overview in a GBrowse display.*
      - OK, it was a little strange--the GFF bulk loader (and the
        underlying bioperl module, Bio::FeatureIO::gff) didn't recognize
        attribute tags of 'dbxref' as dbxref tags (the standard is to
        use 'Dbxref'. I've modified bioperl and the bulk loader to allow
        the lowercase, non-standard dbxref now.
  - other?
- should get XML from a known Chado db and import via XORT or other.
  - talk to Pei Li and Eric Just

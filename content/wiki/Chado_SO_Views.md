---
title: "Chado SO Views"
---
# Chado SO Views

Starting with the GMOD 1.1 release, Chado has a set of views to make
querying the feature table for specific SO types (eg, gene, transcript,
region) easier. These views are a schema called "so"; as a result, to
using them in a query, you generally need to identify the schema in the
query.

# How the views are defined

For each cvterm in the Sequence Ontology, a view is created with that
terms name (except when the length of the name would exceed the length
of allowable relation names in PostgreSQL). The views form a join
between the cvterm table and the feature table such that if a feature is
identified as having a feature.type_id of the name of the view, or a
type_id that IS_A type child of the name of the view, it is found.

For example, the following view is for all exons in the feature table:

``` de1
CREATE VIEW exon AS
  SELECT
    feature_id AS exon_id,
    feature.*
  FROM
    feature INNER JOIN cvterm ON (feature.type_id = cvterm.cvterm_id)
  WHERE cvterm.name = 'coding_exon' OR
        cvterm.name = 'noncoding_exon' OR
        cvterm.name = 'interior_exon' OR
        cvterm.name = 'exon_of_single_exon_gene' OR
        cvterm.name = 'interior_coding_exon' OR
        cvterm.name = 'five_prime_coding_exon' OR
        cvterm.name = 'three_prime_coding_exon' OR
        cvterm.name = 'three_prime_noncoding_exon' OR
        cvterm.name = 'five_prime_noncoding_exon' OR
        cvterm.name = 'exon';
```

Essentially, it is a way of taking advantage of the structure of the
ontology without calculating the
[closure](/wiki/Chado_CV_Module#Transitive_Closure). Of
course, a downside of this approach is that it is hard coded for a
particular version of the Sequence Ontology, and if it changes, the
views will need to be updated as well.

# Some example queries

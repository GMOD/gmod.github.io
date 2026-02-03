---
title: "Chado Tables"
---
# Chado Tables

**Chado Schema Version 1.11**

  db</span>](#Table:_db)
- [Table:
  dbxref](#Table:_dbxref)
- [Table:
  project](#Table:_project)
- [Table:
  tableinfo](#Table:_tableinfo)
- [Table:
  cv](#Table:_cv)
- [Table:
  cvterm](#Table:_cvterm)
- [Table:
  cvterm_dbxref](#Table:_cvterm_dbxref)
- [Table:
  cvterm_relationship](#Table:_cvterm_relationship)
- [Table:
  cvtermpath](#Table:_cvtermpath)
- [Table:
  cvtermprop](#Table:_cvtermprop)
- [Table:
  cvtermsynonym](#Table:_cvtermsynonym)
- [Table:
  dbxrefprop](#Table:_dbxrefprop)
- [Table:
  wwwuser](#Table:_wwwuser)
- [Table:
  wwwuser_cvterm](#Table:_wwwuser_cvterm)
- [Table:
  wwwuser_expression](#Table:_wwwuser_expression)
- [Table:
  wwwuser_feature](#Table:_wwwuser_feature)
- [Table:
  wwwuser_genotype](#Table:_wwwuser_genotype)
- [Table:
  wwwuser_organism](#Table:_wwwuser_organism)
- [Table:
  wwwuser_phenotype](#Table:_wwwuser_phenotype)
- [Table:
  wwwuser_project](#Table:_wwwuser_project)
- [Table:
  wwwuser_pub](#Table:_wwwuser_pub)
- [Table:
  wwwuserrelationship](#Table:_wwwuserrelationship)
- [Table:
  feature](#Table:_feature)
- [Table:
  feature_cvterm](#Table:_feature_cvterm)
- [Table:
  feature_cvterm_dbxref](#Table:_feature_cvterm_dbxref)
- [Table:
  feature_cvterm_pub](#Table:_feature_cvterm_pub)
- [Table:
  feature_cvtermprop](#Table:_feature_cvtermprop)
- [Table:
  feature_dbxref](#Table:_feature_dbxref)
- [Table:
  feature_pub](#Table:_feature_pub)
- [Table:
  feature_pubprop](#Table:_feature_pubprop)
- [Table:
  feature_relationship](#Table:_feature_relationship)
- [Table:
  feature_relationship_pub](#Table:_feature_relationship_pub)
- [Table:
  feature_relationshipprop](#Table:_feature_relationshipprop)
- [Table:
  feature_relationshipprop_pub](#Table:_feature_relationshipprop_pub)
- [Table:
  feature_synonym](#Table:_feature_synonym)
- [Table:
  featureloc](#Table:_featureloc)
- [Table:
  featureloc_pub](#Table:_featureloc_pub)
- [Table:
  featureprop](#Table:_featureprop)
- [Table:
  featureprop_pub](#Table:_featureprop_pub)
- [Table:
  synonym](#Table:_synonym)
- [Table:
  phylonode](#Table:_phylonode)
- [Table:
  phylonode_dbxref](#Table:_phylonode_dbxref)
- [Table:
  phylonode_organism](#Table:_phylonode_organism)
- [Table:
  phylonode_pub](#Table:_phylonode_pub)
- [Table:
  phylonode_relationship](#Table:_phylonode_relationship)
- [Table:
  phylonodeprop](#Table:_phylonodeprop)
- [Table:
  phylotree](#Table:_phylotree)
- [Table:
  phylotree_pub](#Table:_phylotree_pub)
- [Table:
  library](#Table:_library)
- [Table:
  library_cvterm](#Table:_library_cvterm)
- [Table:
  library_feature](#Table:_library_feature)
- [Table:
  library_pub](#Table:_library_pub)
- [Table:
  library_synonym](#Table:_library_synonym)
- [Table:
  libraryprop](#Table:_libraryprop)
- [Table:
  contact](#Table:_contact)
- [Table:
  contact_relationship](#Table:_contact_relationship)
- [Table:
  stock](#Table:_stock)
- [Table:
  stock_cvterm](#Table:_stock_cvterm)
- [Table:
  stock_dbxref](#Table:_stock_dbxref)
- [Table:
  stock_genotype](#Table:_stock_genotype)
- [Table:
  stock_pub](#Table:_stock_pub)
- [Table:
  stock_relationship](#Table:_stock_relationship)
- [Table:
  stock_relationship_pub](#Table:_stock_relationship_pub)
- [Table:
  stockcollection](#Table:_stockcollection)
- [Table:
  stockcollection_stock](#Table:_stockcollection_stock)
- [Table:
  stockcollectionprop](#Table:_stockcollectionprop)
- [Table:
  stockprop](#Table:_stockprop)
- [Table:
  stockprop_pub](#Table:_stockprop_pub)
- [Table:
  environment](#Table:_environment)
- [Table:
  environment_cvterm](#Table:_environment_cvterm)
- [Table:
  feature_genotype](#Table:_feature_genotype)
- [Table:
  genotype](#Table:_genotype)
- [Table:
  phendesc](#Table:_phendesc)
- [Table:
  phenotype_comparison](#Table:_phenotype_comparison)
- [Table:
  phenstatement](#Table:_phenstatement)
- [Table:
  acquisition](#Table:_acquisition)
- [Table:
  acquisition_relationship](#Table:_acquisition_relationship)
- [Table:
  acquisitionprop](#Table:_acquisitionprop)
- [Table:
  arraydesign](#Table:_arraydesign)
- [Table:
  arraydesignprop](#Table:_arraydesignprop)
- [Table:
  assay](#Table:_assay)
- [Table:
  assay_biomaterial](#Table:_assay_biomaterial)
- [Table:
  assay_project](#Table:_assay_project)
- [Table:
  assayprop](#Table:_assayprop)
- [Table:
  biomaterial](#Table:_biomaterial)
- [Table:
  biomaterial_dbxref](#Table:_biomaterial_dbxref)
- [Table:
  biomaterial_relationship](#Table:_biomaterial_relationship)
- [Table:
  biomaterial_treatment](#Table:_biomaterial_treatment)
- [Table:
  biomaterialprop](#Table:_biomaterialprop)
- [Table:
  channel](#Table:_channel)
- [Table:
  control](#Table:_control)
- [Table:
  element](#Table:_element)
- [Table:
  element_relationship](#Table:_element_relationship)
- [Table:
  elementresult](#Table:_elementresult)
- [Table:
  elementresult_relationship](#Table:_elementresult_relationship)
- [Table:
  magedocumentation](#Table:_magedocumentation)
- [Table:
  mageml](#Table:_mageml)
- [Table:
  protocol](#Table:_protocol)
- [Table:
  protocolparam](#Table:_protocolparam)
- [Table:
  quantification](#Table:_quantification)
- [Table:
  quantification_relationship](#Table:_quantification_relationship)
- [Table:
  quantificationprop](#Table:_quantificationprop)
- [Table:
  study](#Table:_study)
- [Table:
  study_assay](#Table:_study_assay)
- [Table:
  studydesign](#Table:_studydesign)
- [Table:
  studydesignprop](#Table:_studydesignprop)
- [Table:
  studyfactor](#Table:_studyfactor)
- [Table:
  studyfactorvalue](#Table:_studyfactorvalue)
- [Table:
  treatment](#Table:_treatment)
- [Table:
  featuremap](#Table:_featuremap)
- [Table:
  featuremap_pub](#Table:_featuremap_pub)
- [Table:
  featurepos](#Table:_featurepos)
- [Table:
  featurerange](#Table:_featurerange)
- [Table:
  analysis](#Table:_analysis)
- [Table:
  analysisfeature](#Table:_analysisfeature)
- [Table:
  analysisprop](#Table:_analysisprop)
- [Table:
  eimage](#Table:_eimage)
- [Table:
  expression](#Table:_expression)
- [Table:
  expression_cvterm](#Table:_expression_cvterm)
- [Table:
  expression_image](#Table:_expression_image)
- [Table:
  expression_pub](#Table:_expression_pub)
- [Table:
  feature_expression](#Table:_feature_expression)
- [Table:
  feature_phenotype](#Table:_feature_phenotype)
- [Table:
  phenotype](#Table:_phenotype)
- [Table:
  phenotype_cvterm](#Table:_phenotype_cvterm)
- [Table:
  pub](#Table:_pub)
- [Table:
  pub_dbxref](#Table:_pub_dbxref)
- [Table:
  pub_relationship](#Table:_pub_relationship)
- [Table:
  pubauthor](#Table:_pubauthor)
- [Table:
  pubprop](#Table:_pubprop)
- [Table:
  organism](#Table:_organism)
- [Table:
  organism_dbxref](#Table:_organism_dbxref)
- [Table:
  organismprop](#Table:_organismprop)

## Table: db

A database authority. Typical databases in bioinformatics are FlyBase,
GO, UniProt, NCBI, MGI, etc. The authority is generally known by this
shortened form, which is unique within the bioinformatics and biomedical
realm. To Do - add support for URIs, URNs (e.g. LSIDs). We can do this
by treating the URL as a URI - however, some applications may expect
this to be resolvable - to be decided.

| FK  | Name        | Type                   | Description |
|-----|-------------|------------------------|-------------------|
|  | db_id | serial | *PRIMARY KEY* |
|  | name | character varying(255) | *UNIQUE NOT NULL* |
|  | description | character varying(255) | urlprefix |
| character varying(255) | url | character varying(255) db Structure |  |

Tables referencing this one via Foreign Key Constraints:

- [dbxref](#Table:_dbxref)

------------------------------------------------------------------------

## Table: dbxref

A unique, global, public, stable identifier. Not necessarily an external
reference - can reference data items inside the particular chado
instance being used. Typically a row in a table can be uniquely
identified with a primary identifier (called dbxref_id); a table may
also have secondary identifiers (in a linking table \<T\>\_dbxref). A
dbxref is generally written as \<DB\>:\<ACCESSION\> or as
\<DB\>:\<ACCESSION\>:\<VERSION\>.

<table data-border="1" data-cellpadding="3">
<caption>dbxref Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>dbxref_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_db">db</a></p></td>
<td>db_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>accession</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The local part of the identifier. Guaranteed by the db authority to be
unique for that db.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>version</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1 NOT NULL DEFAULT ''::character varying</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>description</td>
<td>text</td>
<td><em></em></td>
</tr>
</tbody>
</table>

dbxref Structure

Tables referencing this one via Foreign Key Constraints:

- [arraydesign](#Table:_arraydesign)
- [assay](#Table:_assay)
- [biomaterial](#Table:_biomaterial)
- [biomaterial_dbxref](#Table:_biomaterial_dbxref)
- [cvterm](#Table:_cvterm)
- [cvterm_dbxref](#Table:_cvterm_dbxref)
- [dbxrefprop](#Table:_dbxrefprop)
- [element](#Table:_element)
- [feature](#Table:_feature)
- [feature_cvterm_dbxref](#Table:_feature_cvterm_dbxref)
- [feature_dbxref](#Table:_feature_dbxref)
- [organism_dbxref](#Table:_organism_dbxref)
- [phylonode_dbxref](#Table:_phylonode_dbxref)
- [phylotree](#Table:_phylotree)
- [protocol](#Table:_protocol)
- [pub_dbxref](#Table:_pub_dbxref)
- [stock](#Table:_stock)
- [stock_dbxref](#Table:_stock_dbxref)
- [study](#Table:_study)

------------------------------------------------------------------------

## Table: project

| FK  | Name        | Type                   | Description |
|-----|-------------|------------------------|-------------------|
|  | project_id | serial | *PRIMARY KEY* |
|  | name | character varying(255) | *UNIQUE NOT NULL* |
|  | description | character varying(255) | *NOT NULL* |

project Structure

Tables referencing this one via Foreign Key Constraints:

- [assay_project](#Table:_assay_project)
- [wwwuser_project](#Table:_wwwuser_project)

------------------------------------------------------------------------

## Table: tableinfo

| FK  | Name                | Type                  | Description |
|-----|---------------------|-----------------------|--------------------------|
|  | tableinfo_id | serial | *PRIMARY KEY* |
|  | name | character varying(30) | *UNIQUE NOT NULL* |
|  | primary_key_column | character varying(30) | is_view |
| integer | *NOT NULL* |  | view_on_table_id |
| integer | superclass_table_id | integer | is_updateable |
| integer | *NOT NULL DEFAULT 1* |  | modification_date |
| date | *NOT NULL DEFAULT now()* |  |  |

tableinfo Structure

Tables referencing this one via Foreign Key Constraints:

- [control](#Table:_control)
- [magedocumentation](#Table:_magedocumentation)

------------------------------------------------------------------------

## Table: cv

A controlled vocabulary or ontology. A cv is composed of cvterms (AKA
terms, classes, types, universals - relations and properties are also
stored in cvterm) and the relationships between them.

<table data-border="1" data-cellpadding="3">
<caption>cv Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cv_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em>UNIQUE NOT NULL</em><br />
<br />
The name of the ontology. This corresponds to the obo-format
-namespace-. cv names uniquely identify the cv. In OBO file format, the
cv.name is known as the namespace.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>definition</td>
<td>text</td>
<td><em></em><br />
<br />
A text description of the criteria for membership of this ontology.</td>
</tr>
</tbody>
</table>

cv Structure

Tables referencing this one via Foreign Key Constraints:

- [cvterm](#Table:_cvterm)
- [cvtermpath](#Table:_cvtermpath)

------------------------------------------------------------------------

## Table: cvterm

A term, class, universal or type within an ontology or controlled
vocabulary. This table is also used for relations and properties.
cvterms constitute nodes in the graph defined by the collection of
cvterms and cvterm_relationships.

<table data-border="1" data-cellpadding="3">
<caption>cvterm Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cvterm_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cv">cv</a></p></td>
<td>cv_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The cv or ontology or namespace to which this cvterm belongs.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>name</td>
<td>character varying(1024)</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
A concise human-readable name or label for the cvterm. Uniquely
identifies a cvterm within a cv.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>definition</td>
<td>text</td>
<td><em></em><br />
<br />
A human-readable text definition.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_dbxref">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em>UNIQUE NOT NULL</em><br />
<br />
Primary identifier dbxref - The unique global OBO identifier for this
cvterm. Note that a cvterm may have multiple secondary dbxrefs - see
also table: cvterm_dbxref.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_obsolete</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Boolean 0=false,1=true; see GO documentation for details of obsoletion.
Note that two terms with different primary dbxrefs may exist if one is
obsolete. Duplicate names when obsoletes are included: Note that
is_obsolete is an integer and can be incremented to fake
uniqueness.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>is_relationshiptype</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
Boolean 0=false,1=true relations or relationship types (also known as
Typedefs in OBO format, or as properties or slots) form a cv/ontology in
themselves. We use this flag to indicate whether this cvterm is an
actual term/class/universal or a relation. Relations may be drawn from
the OBO Relations ontology, but are not exclusively drawn from
there.</td>
</tr>
</tbody>
</table>

cvterm Structure

Tables referencing this one via Foreign Key Constraints:

- [acquisition_relationship](#Table:_acquisition_relationship)
- [acquisitionprop](#Table:_acquisitionprop)
- [analysisprop](#Table:_analysisprop)
- [arraydesign](#Table:_arraydesign)
- [arraydesignprop](#Table:_arraydesignprop)
- [assayprop](#Table:_assayprop)
- [biomaterial_relationship](#Table:_biomaterial_relationship)
- [biomaterial_treatment](#Table:_biomaterial_treatment)
- [biomaterialprop](#Table:_biomaterialprop)
- [contact](#Table:_contact)
- [contact_relationship](#Table:_contact_relationship)
- [control](#Table:_control)
- [cvterm_dbxref](#Table:_cvterm_dbxref)
- [cvterm_relationship](#Table:_cvterm_relationship)
- [cvtermpath](#Table:_cvtermpath)
- [cvtermprop](#Table:_cvtermprop)
- [cvtermsynonym](#Table:_cvtermsynonym)
- [dbxrefprop](#Table:_dbxrefprop)
- [element](#Table:_element)
- [element_relationship](#Table:_element_relationship)
- [elementresult_relationship](#Table:_elementresult_relationship)
- [environment_cvterm](#Table:_environment_cvterm)
- [expression_cvterm](#Table:_expression_cvterm)
- [expression_cvtermprop](#Table:_expression_cvtermprop)
- [expressionprop](#Table:_expressionprop)
- [feature](#Table:_feature)
- [feature_cvterm](#Table:_feature_cvterm)
- [feature_cvtermprop](#Table:_feature_cvtermprop)
- [feature_expressionprop](#Table:_feature_expressionprop)
- [feature_genotype](#Table:_feature_genotype)
- [feature_pubprop](#Table:_feature_pubprop)
- [feature_relationship](#Table:_feature_relationship)
- [feature_relationshipprop](#Table:_feature_relationshipprop)
- [featuremap](#Table:_featuremap)
- [featureprop](#Table:_featureprop)
- [library](#Table:_library)
- [library_cvterm](#Table:_library_cvterm)
- [libraryprop](#Table:_libraryprop)
- [organismprop](#Table:_organismprop)
- [phendesc](#Table:_phendesc)
- [phenotype](#Table:_phenotype)
- [phenotype_comparison](#Table:_phenotype_comparison)
- [phenotype_cvterm](#Table:_phenotype_cvterm)
- [phenstatement](#Table:_phenstatement)
- [phylonode](#Table:_phylonode)
- [phylonode_relationship](#Table:_phylonode_relationship)
- [phylonodeprop](#Table:_phylonodeprop)
- [phylotree](#Table:_phylotree)
- [protocol](#Table:_protocol)
- [protocolparam](#Table:_protocolparam)
- [pub](#Table:_pub)
- [pub_relationship](#Table:_pub_relationship)
- [pubprop](#Table:_pubprop)
- [quantification_relationship](#Table:_quantification_relationship)
- [quantificationprop](#Table:_quantificationprop)
- [stock](#Table:_stock)
- [stock_cvterm](#Table:_stock_cvterm)
- [stock_relationship](#Table:_stock_relationship)
- [stockcollection](#Table:_stockcollection)
- [stockcollectionprop](#Table:_stockcollectionprop)
- [stockprop](#Table:_stockprop)
- [studydesignprop](#Table:_studydesignprop)
- [studyfactor](#Table:_studyfactor)
- [synonym](#Table:_synonym)
- [treatment](#Table:_treatment)
- [wwwuser_cvterm](#Table:_wwwuser_cvterm)

------------------------------------------------------------------------

## Table: cvterm_dbxref

In addition to the primary identifier (cvterm.dbxref_id) a cvterm can
have zero or more secondary identifiers/dbxrefs, which may refer to
records in external databases. The exact semantics of cvterm_dbxref are
not fixed. For example: the dbxref could be a pubmed ID that is
pertinent to the cvterm, or it could be an equivalent or similar term in
another ontology. For example, GO cvterms are typically linked to
InterPro IDs, even though the nature of the relationship between them is
largely one of statistical association. The dbxref may be have data
records attached in the same database instance, or it could be a
"hanging" dbxref pointing to some external database. NOTE: If the
desired objective is to link two cvterms together, and the nature of the
relation is known and holds for all instances of the subject cvterm then
consider instead using cvterm_relationship together with a well-defined
relation.

<table data-border="1" data-cellpadding="3">
<caption>cvterm_dbxref Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cvterm_dbxref_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>cvterm_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_dbxref">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_for_definition</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
A cvterm.definition should be supported by one or more references. If
this column is true, the dbxref is not for a term in an external
database - it is a dbxref for provenance information for the
definition.</td>
</tr>
</tbody>
</table>

cvterm_dbxref Structure

------------------------------------------------------------------------

## Table: cvterm_relationship

A relationship linking two cvterms. Each cvterm_relationship constitutes
an edge in the graph defined by the collection of cvterms and
cvterm_relationships. The meaning of the cvterm_relationship depends on
the definition of the cvterm R referred to by type_id. However, in
general the definitions are such that the statement "all SUBJs REL some
OBJ" is true. The cvterm_relationship statement is about the subject,
not the object. For example "insect wing part_of thorax".

<table data-border="1" data-cellpadding="3">
<caption>cvterm_relationship Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cvterm_relationship_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The nature of the relationship between subject and object. Note that
relations are also housed in the cvterm table, typically from the OBO
relationship ontology, although other relationship types are
allowed.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>subject_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The subject of the subj-predicate-obj sentence. The cvterm_relationship
is about the subject. In a graph, this typically corresponds to the
child node.</td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>object_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The object of the subj-predicate-obj sentence. The cvterm_relationship
refers to the object. In a graph, this typically corresponds to the
parent node.</td>
</tr>
</tbody>
</table>

cvterm_relationship Structure

------------------------------------------------------------------------

## Table: cvtermpath

The reflexive transitive closure of the cvterm_relationship relation.

<table data-border="1" data-cellpadding="3">
<caption>cvtermpath Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cvtermpath_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
<br />
The relationship type that this is a closure over. If null, then this is
a closure over ALL relationship types. If non-null, then this references
a relationship cvterm - note that the closure will apply to both this
relationship AND the OBO_REL:is_a (subclass) relationship.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>subject_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>object_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cv">cv</a></p></td>
<td>cv_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
Closures will mostly be within one cv. If the closure of a relationship
traverses a cv, then this refers to the cv of the object_id cvterm.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>pathdistance</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
<br />
The number of steps required to get from the subject cvterm to the
object cvterm, counting from zero (reflexive relationship).</td>
</tr>
</tbody>
</table>

cvtermpath Structure

------------------------------------------------------------------------

## Table: cvtermprop

Additional extensible properties can be attached to a cvterm using this
table. Corresponds to -AnnotationProperty- in W3C OWL format.

<table data-border="1" data-cellpadding="3">
<caption>cvtermprop Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cvtermprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>cvterm_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The name of the property or slot is a cvterm. The meaning of the
property is defined in that cvterm.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>text</td>
<td><em>UNIQUE#1 NOT NULL DEFAULT ''::text</em><br />
<br />
The value of the property, represented as text. Numeric values are
converted to their text representation.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Property-Value ordering. Any cvterm can have multiple values for any
particular property type - these are ordered in a list using rank,
counting from zero. For properties that are single-valued rather than
multi-valued, the default 0 value should be used.</td>
</tr>
</tbody>
</table>

cvtermprop Structure

------------------------------------------------------------------------

## Table: cvtermsynonym

A cvterm actually represents a distinct class or concept. A concept can
be referred to by different phrases or names. In addition to the primary
name (cvterm.name) there can be a number of alternative aliases or
synonyms. For example, "T cell" as a synonym for "T lymphocyte".

<table data-border="1" data-cellpadding="3">
<caption>cvtermsynonym Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cvtermsynonym_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>cvterm_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>synonym</td>
<td>character varying(1024)</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em></em><br />
<br />
A synonym can be exact, narrower, or broader than.</td>
</tr>
</tbody>
</table>

cvtermsynonym Structure

------------------------------------------------------------------------

## Table: dbxrefprop

Metadata about a dbxref. Note that this is not defined in the dbxref
module, as it depends on the cvterm table. This table has a structure
analogous to cvtermprop.

| FK                       | Name          | Type    | Description |
|--------------------------|---------------|---------|-----------------------------|
|  | dbxrefprop_id | serial | *PRIMARY KEY* |
| [dbxref](#Table:_dbxref) | dbxref_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | *NOT NULL DEFAULT ''::text* |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

dbxrefprop Structure

------------------------------------------------------------------------

## Table: wwwuser

Keep track of WWW users. This may also be useful in an audit module at
some point.

| FK  | Name       | Type                   | Description |
|-----|------------|------------------------|-------------------|
|  | wwwuser_id | serial | *PRIMARY KEY* |
|  | username | character varying(32) | *UNIQUE NOT NULL* |
|  | password | character varying(32) | *NOT NULL* |
|  | email | character varying(128) | *NOT NULL* |
|  | profile | text                   wwwuser Structure |  |

Tables referencing this one via Foreign Key Constraints:

- [wwwuser_cvterm](#Table:_wwwuser_cvterm)
- [wwwuser_expression](#Table:_wwwuser_expression)
- [wwwuser_feature](#Table:_wwwuser_feature)
- [wwwuser_genotype](#Table:_wwwuser_genotype)
- [wwwuser_organism](#Table:_wwwuser_organism)
- [wwwuser_phenotype](#Table:_wwwuser_phenotype)
- [wwwuser_project](#Table:_wwwuser_project)
- [wwwuser_pub](#Table:_wwwuser_pub)
- [wwwuserrelationship](#Table:_wwwuserrelationship)

------------------------------------------------------------------------

## Table: wwwuser_cvterm

Track wwwuser interest in cvterms.

| FK                         | Name              | Type     | Description |
|----------------------------|-------------------|----------|----------------------|
|  | wwwuser_cvterm_id | serial | *PRIMARY KEY* |
| [wwwuser](#Table:_wwwuser) | wwwuser_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | cvterm_id | integer | *UNIQUE#1 NOT NULL* |
|  | world_read | smallint | *NOT NULL DEFAULT 1* |

wwwuser_cvterm Structure

------------------------------------------------------------------------

## Table: wwwuser_expression

Track wwwuser interest in expressions.

| FK | Name | Type | Description |
|----|----|----|----|
|  | wwwuser_expression_id | serial | *PRIMARY KEY* |
| [wwwuser](#Table:_wwwuser) | wwwuser_id | integer | *UNIQUE#1 NOT NULL* |
| [expression](#Table:_expression) | expression_id | integer | *UNIQUE#1 NOT NULL* |
|  | world_read | smallint | *NOT NULL DEFAULT 1* |

wwwuser_expression Structure

------------------------------------------------------------------------

## Table: wwwuser_feature

Track wwwuser interest in features.

| FK                         | Name               | Type     | Description |
|----------------------------|--------------------|----------|----------------------|
|  | wwwuser_feature_id | serial | *PRIMARY KEY* |
| [wwwuser](#Table:_wwwuser) | wwwuser_id | integer | *UNIQUE#1 NOT NULL* |
| [feature](#Table:_feature) | feature_id | integer | *UNIQUE#1 NOT NULL* |
|  | world_read | smallint | *NOT NULL DEFAULT 1* |

wwwuser_feature Structure

------------------------------------------------------------------------

## Table: wwwuser_genotype

Track wwwuser interest in genotypes.

| FK | Name | Type | Description |
|----|----|----|----|
|  | wwwuser_genotype_id | serial | *PRIMARY KEY* |
| [wwwuser](#Table:_wwwuser) | wwwuser_id | integer | *UNIQUE#1 NOT NULL* |
| [genotype](#Table:_genotype) | genotype_id | integer | *UNIQUE#1 NOT NULL* |
|  | world_read | smallint | *NOT NULL DEFAULT 1* |

wwwuser_genotype Structure

------------------------------------------------------------------------

## Table: wwwuser_organism

Track wwwuser interest in organisms.

| FK | Name | Type | Description |
|----|----|----|----|
|  | wwwuser_organism_id | serial | *PRIMARY KEY* |
| [wwwuser](#Table:_wwwuser) | wwwuser_id | integer | *UNIQUE#1 NOT NULL* |
| [organism](#Table:_organism) | organism_id | integer | *UNIQUE#1 NOT NULL* |
|  | world_read | smallint | *NOT NULL DEFAULT 1* |

wwwuser_organism Structure

------------------------------------------------------------------------

## Table: wwwuser_phenotype

Track wwwuser interest in phenotypes.

| FK | Name | Type | Description |
|----|----|----|----|
|  | wwwuser_phenotype_id | serial | *PRIMARY KEY* |
| [wwwuser](#Table:_wwwuser) | wwwuser_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](#Table:_phenotype) | phenotype_id | integer | *UNIQUE#1 NOT NULL* |
|  | world_read | smallint | *NOT NULL DEFAULT 1* |

wwwuser_phenotype Structure

------------------------------------------------------------------------

## Table: wwwuser_project

Link wwwuser accounts to projects

| FK                         | Name               | Type     | Description |
|----------------------------|--------------------|----------|----------------------|
|  | wwwuser_project_id | serial | *PRIMARY KEY* |
| [wwwuser](#Table:_wwwuser) | wwwuser_id | integer | *UNIQUE#1 NOT NULL* |
| [project](#Table:_project) | project_id | integer | *UNIQUE#1 NOT NULL* |
|  | world_read | smallint | *NOT NULL DEFAULT 1* |

wwwuser_project Structure

------------------------------------------------------------------------

## Table: wwwuser_pub

Track wwwuser interest in publications.

| FK                         | Name           | Type     | Description |
|----------------------------|----------------|----------|----------------------|
|  | wwwuser_pub_id | serial | *PRIMARY KEY* |
| [wwwuser](#Table:_wwwuser) | wwwuser_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |
|  | world_read | smallint | *NOT NULL DEFAULT 1* |

wwwuser_pub Structure

------------------------------------------------------------------------

## Table: wwwuserrelationship

Track wwwuser interest in other wwwusers.

| FK | Name | Type | Description |
|----|----|----|----|
|  | wwwuserrelationship_id | serial | *PRIMARY KEY* |
| [wwwuser](#Table:_wwwuser) | objwwwuser_id | integer | *UNIQUE#1 NOT NULL* |
| [wwwuser](#Table:_wwwuser) | subjwwwuser_id | integer | *UNIQUE#1 NOT NULL* |
|  | world_read | smallint | *NOT NULL DEFAULT 1* |

wwwuserrelationship Structure

Generated by <a href="http://www.rbt.ca/autodoc/" class="external text"

<a href="http://validator.w3.org/check/referer" class="external text"

## Table: feature

A feature is a biological sequence or a section of a biological
sequence, or a collection of such sections. Examples include genes,
exons, transcripts, regulatory regions, polypeptides, protein domains,
chromosome sequences, sequence variations, cross-genome match regions
such as hits and HSPs and so on; see the Sequence Ontology for more.

<table data-border="1" data-cellpadding="3">
<caption>feature Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>feature_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_dbxref">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em></em><br />
<br />
An optional primary public stable identifier for this feature. Secondary
identifiers and external dbxrefs go in the table feature_dbxref.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_organism">organism</a></p></td>
<td>organism_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The organism to which this feature belongs. This column is
mandatory.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
The optional human-readable common name for a feature, for display
purposes.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The unique name for a feature; may not be necessarily be particularly
human-readable, although this is preferred. This name must be unique for
this type of feature within this organism.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>residues</td>
<td>text</td>
<td><em></em><br />
<br />
A sequence of alphabetic characters representing biological residues
(nucleic acids, amino acids). This column does not need to be manifested
for all features; it is optional for features such as exons where the
residues can be derived from the featureloc. It is recommended that the
value for this column be manifested for features which may may
non-contiguous sublocations (e.g. transcripts), since derivation at
query time is non-trivial. For expressed sequence, the DNA sequence
should be used rather than the RNA sequence.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>seqlen</td>
<td>integer</td>
<td><em></em><br />
<br />
The length of the residue feature. See column:residues. This column is
partially redundant with the residues column, and also with featureloc.
This column is required because the location may be unknown and the
residue sequence may not be manifested, yet it may be desirable to store
and query the length of the feature. The seqlen should always be
manifested where the length of the sequence is known.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>md5checksum</td>
<td>character(32)</td>
<td><em></em><br />
<br />
The 32-character checksum of the sequence, calculated using the MD5
algorithm. This is practically guaranteed to be unique for any feature.
This column thus acts as a unique identifier on the mathematical
sequence.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
A required reference to a table:cvterm giving the feature type. This
will typically be a Sequence Ontology identifier. This column is thus
used to subclass the feature table.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_analysis</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT false</em><br />
<br />
Boolean indicating whether this feature is annotated or the result of an
automated analysis. Analysis results also use the companalysis module.
Note that the dividing line between analysis and annotation may be
fuzzy, this should be determined on a per-project basis in a consistent
manner. One requirement is that there should only be one non-analysis
version of each wild-type gene feature in a genome, whereas the same
gene feature can be predicted multiple times in different analyses.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>is_obsolete</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT false</em><br />
<br />
Boolean indicating whether this feature has been obsoleted. Some chado
instances may choose to simply remove the feature altogether, others may
choose to keep an obsolete row in the table.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>timeaccessioned</td>
<td>timestamp without time zone</td>
<td><em>NOT NULL DEFAULT ('now'::text)::timestamp(6) with time
zone</em><br />
<br />
For handling object accession or modification timestamps (as opposed to
database auditing data, handled elsewhere). The expectation is that
these fields would be available to software interacting with chado.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>timelastmodified</td>
<td>timestamp without time zone</td>
<td><em>NOT NULL DEFAULT ('now'::text)::timestamp(6) with time
zone</em><br />
<br />
For handling object accession or modification timestamps (as opposed to
database auditing data, handled elsewhere). The expectation is that
these fields would be available to software interacting with chado.</td>
</tr>
</tbody>
</table>

feature Structure

Tables referencing this one via Foreign Key Constraints:

- [analysisfeature](#Table:_analysisfeature)
- [element](#Table:_element)
- [feature_cvterm](#Table:_feature_cvterm)
- [feature_dbxref](#Table:_feature_dbxref)
- [feature_expression](#Table:_feature_expression)
- [feature_genotype](#Table:_feature_genotype)
- [feature_phenotype](#Table:_feature_phenotype)
- [feature_pub](#Table:_feature_pub)
- [feature_relationship](#Table:_feature_relationship)
- [feature_synonym](#Table:_feature_synonym)
- [featureloc](#Table:_featureloc)
- [featurepos](#Table:_featurepos)
- [featureprop](#Table:_featureprop)
- [featurerange](#Table:_featurerange)
- [library_feature](#Table:_library_feature)
- [phylonode](#Table:_phylonode)
- [wwwuser_feature](#Table:_wwwuser_feature)

------------------------------------------------------------------------

## Table: feature_cvterm

Associate a term from a cv with a feature, for example, GO annotation.

<table data-border="1" data-cellpadding="3">
<caption>feature_cvterm Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>feature_cvterm_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>cvterm_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_pub">pub</a></p></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Provenance for the annotation. Each annotation should have a single
primary publication (which may be of the appropriate type for
computational analyses) where more details can be found. Additional
provenance dbxrefs can be attached using feature_cvterm_dbxref.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>is_not</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT false</em><br />
<br />
If this is set to true, then this annotation is interpreted as a
NEGATIVE annotation - i.e. the feature does NOT have the specified
function, process, component, part, etc. See GO docs for more
details.</td>
</tr>
</tbody>
</table>

feature_cvterm Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_cvterm_dbxref](#Table:_feature_cvterm_dbxref)
- [feature_cvterm_pub](#Table:_feature_cvterm_pub)
- [feature_cvtermprop](#Table:_feature_cvtermprop)

------------------------------------------------------------------------

## Table: feature_cvterm_dbxref

Additional dbxrefs for an association. Rows in the feature_cvterm table
may be backed up by dbxrefs. For example, a feature_cvterm association
that was inferred via a protein-protein interaction may be backed by by
referring to the dbxref for the alternate protein. Corresponds to the
WITH column in a GO gene association file (but can also be used for
other analogous associations). See
<a href="http://www.geneontology.org/doc/GO.annotation.shtml#file#file"

for more details.

| FK | Name | Type | Description |
|----|----|----|----|
|  | feature_cvterm_dbxref_id | serial | *PRIMARY KEY* |
| [feature_cvterm](#Table:_feature_cvterm) | feature_cvterm_id | integer | *UNIQUE#1 NOT NULL* |
| [dbxref](#Table:_dbxref) | dbxref_id | integer | *UNIQUE#1 NOT NULL* |

feature_cvterm_dbxref Structure

------------------------------------------------------------------------

## Table: feature_cvterm_pub

Secondary pubs for an association. Each feature_cvterm association is
supported by a single primary publication. Additional secondary pubs can
be added using this linking table (in a GO gene association file, these
corresponding to any IDs after the pipe symbol in the publications
column.

| FK | Name | Type | Description |
|----|----|----|----|
|  | feature_cvterm_pub_id | serial | *PRIMARY KEY* |
| [feature_cvterm](#Table:_feature_cvterm) | feature_cvterm_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

feature_cvterm_pub Structure

------------------------------------------------------------------------

## Table: feature_cvtermprop

Extensible properties for feature to cvterm associations. Examples: GO
evidence codes; qualifiers; metadata such as the date on which the entry
was curated and the source of the association. See the featureprop table
for meanings of type_id, value and rank.

<table data-border="1" data-cellpadding="3">
<caption>feature_cvtermprop Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>feature_cvtermprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_feature_cvterm">feature_cvterm</a></p></td>
<td>feature_cvterm_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The name of the property/slot is a cvterm. The meaning of the property
is defined in that cvterm. cvterms may come from the OBO evidence code
cv.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>text</td>
<td><em></em><br />
<br />
The value of the property, represented as text. Numeric values are
converted to their text representation. This is less efficient than
using native database types, but is easier to query.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Property-Value ordering. Any feature_cvterm can have multiple values for
any particular property type - these are ordered in a list using rank,
counting from zero. For properties that are single-valued rather than
multi-valued, the default 0 value should be used.</td>
</tr>
</tbody>
</table>

feature_cvtermprop Structure

------------------------------------------------------------------------

## Table: feature_dbxref

Links a feature to dbxrefs. This is for secondary identifiers; primary
identifiers should use feature.dbxref_id.

<table data-border="1" data-cellpadding="3">
<caption>feature_dbxref Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>feature_dbxref_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_dbxref">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_current</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT true</em><br />
<br />
The is_current boolean indicates whether the linked dbxref is the
current -official- dbxref for the linked feature.</td>
</tr>
</tbody>
</table>

feature_dbxref Structure

------------------------------------------------------------------------

## Table: feature_pub

Provenance. Linking table between features and publications that mention
them.

| FK                         | Name           | Type    | Description |
|----------------------------|----------------|---------|---------------------|
|  | feature_pub_id | serial | *PRIMARY KEY* |
| [feature](#Table:_feature) | feature_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

feature_pub Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_pubprop](#Table:_feature_pubprop)

------------------------------------------------------------------------

## Table: feature_pubprop

Property or attribute of a feature_pub link.

| FK | Name | Type | Description |
|----|----|----|----|
|  | feature_pubprop_id | serial | *PRIMARY KEY* |
| [feature_pub](#Table:_feature_pub) | feature_pub_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

feature_pubprop Structure

------------------------------------------------------------------------

## Table: feature_relationship

Features can be arranged in graphs, e.g. "exon part_of transcript
part_of gene"; If type is thought of as a verb, the each arc or edge
makes a statement \[Subject Verb Object\]. The object can also be
thought of as parent (containing feature), and subject as child
(contained feature or subfeature). We include the relationship
rank/order, because even though most of the time we can order things
implicitly by sequence coordinates, we can not always do this - e.g.
transpliced genes. It is also useful for quickly getting implicit
introns.

<table data-border="1" data-cellpadding="3">
<caption>feature_relationship Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>feature_relationship_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>subject_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The subject of the subj-predicate-obj sentence. This is typically the
subfeature.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>object_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The object of the subj-predicate-obj sentence. This is typically the
container feature.</td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Relationship type between subject and object. This is a cvterm,
typically from the OBO relationship ontology, although other
relationship types are allowed. The most common relationship type is
OBO_REL:part_of. Valid relationship types are constrained by the
Sequence Ontology.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>value</td>
<td>text</td>
<td><em></em><br />
<br />
Additional notes or comments.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The ordering of subject features with respect to the object feature may
be important (for example, exon ordering on a transcript - not always
derivable if you take trans spliced genes into consideration). Rank is
used to order these; starts from zero.</td>
</tr>
</tbody>
</table>

feature_relationship Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_relationship_pub](#Table:_feature_relationship_pub)
- [feature_relationshipprop](#Table:_feature_relationshipprop)

------------------------------------------------------------------------

## Table: feature_relationship_pub

Provenance. Attach optional evidence to a feature_relationship in the
form of a publication.

| FK | Name | Type | Description |
|----|----|----|----|
|  | feature_relationship_pub_id | serial | *PRIMARY KEY* |
| [feature_relationship](#Table:_feature_relationship) | feature_relationship_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

feature_relationship_pub Structure

------------------------------------------------------------------------

## Table: feature_relationshipprop

Extensible properties for feature_relationships. Analogous structure to
featureprop. This table is largely optional and not used with a high
frequency. Typical scenarios may be if one wishes to attach additional
data to a feature_relationship - for example to say that the
feature_relationship is only true in certain contexts.

<table data-border="1" data-cellpadding="3">
<caption>feature_relationshipprop Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>feature_relationshipprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a
href="#Table:_feature_relationship">feature_relationship</a></p></td>
<td>feature_relationship_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The name of the property/slot is a cvterm. The meaning of the property
is defined in that cvterm. Currently there is no standard ontology for
feature_relationship property types.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>text</td>
<td><em></em><br />
<br />
The value of the property, represented as text. Numeric values are
converted to their text representation. This is less efficient than
using native database types, but is easier to query.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Property-Value ordering. Any feature_relationship can have multiple
values for any particular property type - these are ordered in a list
using rank, counting from zero. For properties that are single-valued
rather than multi-valued, the default 0 value should be used.</td>
</tr>
</tbody>
</table>

feature_relationshipprop Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_relationshipprop_pub](#Table:_feature_relationshipprop_pub)

------------------------------------------------------------------------

## Table: feature_relationshipprop_pub

Provenance for feature_relationshipprop.

| FK | Name | Type | Description |
|----|----|----|----|
|  | feature_relationshipprop_pub_id | serial | *PRIMARY KEY* |
| [feature_relationshipprop](#Table:_feature_relationshipprop) | feature_relationshipprop_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

feature_relationshipprop_pub Structure

------------------------------------------------------------------------

## Table: feature_synonym

Linking table between feature and synonym.

<table data-border="1" data-cellpadding="3">
<caption>feature_synonym Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>feature_synonym_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_synonym">synonym</a></p></td>
<td>synonym_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_pub">pub</a></p></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The pub_id link is for relating the usage of a given synonym to the
publication in which it was used.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>is_current</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT true</em><br />
<br />
The is_current boolean indicates whether the linked synonym is the
current -official- symbol for the linked feature.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_internal</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT false</em><br />
<br />
Typically a synonym exists so that somebody querying the db with an
obsolete name can find the object they're looking for (under its current
name. If the synonym has been used publicly and deliberately (e.g. in a
paper), it may also be listed in reports as a synonym. If the synonym
was not used deliberately (e.g. there was a typo which went public),
then the is_internal boolean may be set to -true- so that it is known
that the synonym is -internal- and should be queryable but should not be
listed in reports as a valid synonym.</td>
</tr>
</tbody>
</table>

feature_synonym Structure

------------------------------------------------------------------------

## Table: featureloc

The location of a feature relative to another feature. Important:
interbase coordinates are used. This is vital as it allows us to
represent zero-length features e.g. splice sites, insertion points
without an awkward fuzzy system. Features typically have exactly ONE
location, but this need not be the case. Some features may not be
localized (e.g. a gene that has been characterized genetically but no
sequence or molecular information is available). Note on multiple
locations: Each feature can have 0 or more locations. Multiple locations
do NOT indicate non-contiguous locations (if a feature such as a
transcript has a non-contiguous location, then the subfeatures such as
exons should always be manifested). Instead, multiple featurelocs for a
feature designate alternate locations or grouped locations; for
instance, a feature designating a blast hit or hsp will have two
locations, one on the query feature, one on the subject feature.
Features representing sequence variation could have alternate locations
instantiated on a feature on the mutant strain. The column:rank is used
to differentiate these different locations. Reflexive locations should
never be stored - this is for -proper- (i.e. non-self) locations only;
nothing should be located relative to itself.

<table data-border="1" data-cellpadding="3">
<caption>featureloc Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>featureloc_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The feature that is being located. Any feature can have zero or more
featurelocs.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>srcfeature_id</td>
<td>integer</td>
<td><em></em><br />
<br />
The source feature which this location is relative to. Every location is
relative to another feature (however, this column is nullable, because
the srcfeature may not be known). All locations are -proper- that is,
nothing should be located relative to itself. No cycles are allowed in
the featureloc graph.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>fmin</td>
<td>integer</td>
<td><em></em><br />
<br />
The leftmost/minimal boundary in the linear range represented by the
featureloc. Sometimes (e.g. in Bioperl) this is called -start- although
this is confusing because it does not necessarily represent the 5-prime
coordinate. Important: This is space-based (interbase) coordinates,
counting from zero. To convert this to the leftmost position in a
base-oriented system (eg GFF, Bioperl), add 1 to fmin.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>is_fmin_partial</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT false</em><br />
<br />
This is typically false, but may be true if the value for column:fmin is
inaccurate or the leftmost part of the range is unknown/unbounded.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>fmax</td>
<td>integer</td>
<td><em></em><br />
<br />
The rightmost/maximal boundary in the linear range represented by the
featureloc. Sometimes (e.g. in bioperl) this is called -end- although
this is confusing because it does not necessarily represent the 3-prime
coordinate. Important: This is space-based (interbase) coordinates,
counting from zero. No conversion is required to go from fmax to the
rightmost coordinate in a base-oriented system that counts from 1 (e.g.
GFF, Bioperl).</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>is_fmax_partial</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT false</em><br />
<br />
This is typically false, but may be true if the value for column:fmax is
inaccurate or the rightmost part of the range is unknown/unbounded.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>strand</td>
<td>smallint</td>
<td><em></em><br />
<br />
The orientation/directionality of the location. Should be 0, -1 or
+1.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>phase</td>
<td>integer</td>
<td><em></em><br />
<br />
Phase of translation with respect to srcfeature_id. Values are 0, 1, 2.
It may not be possible to manifest this column for some features such as
exons, because the phase is dependant on the spliceform (the same exon
can appear in multiple spliceforms). This column is mostly useful for
predicted exons and CDSs.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>residue_info</td>
<td>text</td>
<td><em></em><br />
<br />
Alternative residues, when these differ from feature.residues. For
instance, a SNP feature located on a wild and mutant protein would have
different alternative residues. for alignment/similarity features, the
alternative residues is used to represent the alignment string (CIGAR
format). Note on variation features; even if we do not want to
instantiate a mutant chromosome/contig feature, we can still represent a
SNP etc with 2 locations, one (rank 0) on the genome, the other (rank 1)
would have most fields null, except for alternative residues.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>locgroup</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
This is used to manifest redundant, derivable extra locations for a
feature. The default locgroup=0 is used for the DIRECT location of a
feature. Important: most Chado users may never use featurelocs WITH
logroup &gt; 0. Transitively derived locations are indicated with
locgroup &gt; 0. For example, the position of an exon on a BAC and in
global chromosome coordinates. This column is used to differentiate
these groupings of locations. The default locgroup 0 is used for the
main or primary location, from which the others can be derived via
coordinate transformations. Another example of redundant locations is
storing ORF coordinates relative to both transcript and genome.
Redundant locations open the possibility of the database getting into
inconsistent states; this schema gives us the flexibility of both
warehouse instantiations with redundant locations (easier for querying)
and management instantiations with no redundant locations. An example of
using both locgroup and rank: imagine a feature indicating a conserved
region between the chromosomes of two different species. We may want to
keep redundant locations on both contigs and chromosomes. We would thus
have 4 locations for the single conserved region feature - two distinct
locgroups (contig level and chromosome level) and two distinct ranks
(for the two species).</td>
</tr>
<tr class="even tr1">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Used when a feature has &gt;1 location, otherwise the default rank 0 is
used. Some features (e.g. blast hits and HSPs) have two locations - one
on the query and one on the subject. Rank is used to differentiate
these. Rank=0 is always used for the query, Rank=1 for the subject. For
multiple alignments, assignment of rank is arbitrary. Rank is also used
for sequence_variant features, such as SNPs. Rank=0 indicates the
wildtype (or baseline) feature, Rank=1 indicates the mutant (or
compared) feature.</td>
</tr>
</tbody>
</table>

featureloc Structure

| Name          | Constraint |
|---------------|-------------------------|
| featureloc_c2 | CHECK ((fmin \<= fmax)) |

featureloc Constraints

Tables referencing this one via Foreign Key Constraints:

- [featureloc_pub](#Table:_featureloc_pub)

------------------------------------------------------------------------

## Table: featureloc_pub

Provenance of featureloc. Linking table between featurelocs and
publications that mention them.

| FK | Name | Type | Description |
|----|----|----|----|
|  | featureloc_pub_id | serial | *PRIMARY KEY* |
| [featureloc](#Table:_featureloc) | featureloc_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

featureloc_pub Structure

------------------------------------------------------------------------

## Table: featureprop

A feature can have any number of slot-value property tags attached to
it. This is an alternative to hardcoding a list of columns in the
relational schema, and is completely extensible.

<table data-border="1" data-cellpadding="3">
<caption>featureprop Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>featureprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The name of the property/slot is a cvterm. The meaning of the property
is defined in that cvterm. Certain property types will only apply to
certain feature types (e.g. the anticodon property will only apply to
tRNA features) ; the types here come from the sequence feature property
ontology.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>text</td>
<td><em></em><br />
<br />
The value of the property, represented as text. Numeric values are
converted to their text representation. This is less efficient than
using native database types, but is easier to query.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Property-Value ordering. Any feature can have multiple values for any
particular property type - these are ordered in a list using rank,
counting from zero. For properties that are single-valued rather than
multi-valued, the default 0 value should be used</td>
</tr>
</tbody>
</table>

featureprop Structure

Tables referencing this one via Foreign Key Constraints:

- [featureprop_pub](#Table:_featureprop_pub)

------------------------------------------------------------------------

## Table: featureprop_pub

Provenance. Any featureprop assignment can optionally be supported by a
publication.

| FK | Name | Type | Description |
|----|----|----|----|
|  | featureprop_pub_id | serial | *PRIMARY KEY* |
| [featureprop](#Table:_featureprop) | featureprop_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

featureprop_pub Structure

------------------------------------------------------------------------

## Table: synonym

A synonym for a feature. One feature can have multiple synonyms, and the
same synonym can apply to multiple features.

<table data-border="1" data-cellpadding="3">
<caption>synonym Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>synonym_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The synonym itself. Should be human-readable machine-searchable ascii
text.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Types would be symbol and fullname for now.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>synonym_sgml</td>
<td>character varying(255)</td>
<td><em>NOT NULL</em><br />
<br />
The fully specified synonym, with any non-ascii characters encoded in
SGML.</td>
</tr>
</tbody>
</table>

synonym Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_synonym](#Table:_feature_synonym)
- [library_synonym](#Table:_library_synonym)

------------------------------------------------------------------------

## Table: phylonode

This is the most pervasive element in the phylogeny module, cataloging
the "phylonodes" of tree graphs. Edges are implied by the
parent_phylonode_id reflexive closure. For all nodes in a nested set
implementation the left and right index will be \*between\* the parents
left and right indexes.

<table data-border="1" data-cellpadding="3">
<caption>phylonode Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phylonode_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_phylotree">phylotree</a></p></td>
<td>phylotree_id</td>
<td>integer</td>
<td><em>UNIQUE#1 UNIQUE#2 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_phylonode">phylonode</a></p></td>
<td>parent_phylonode_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Root phylonode can have null parent_phylonode_id value.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>left_idx</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>right_idx</td>
<td>integer</td>
<td><em>UNIQUE#2 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Type: e.g. root, interior, leaf.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Phylonodes can have optional features attached to them e.g. a protein or
nucleotide sequence usually attached to a leaf of the phylotree for
non-leaf nodes, the feature may be a feature that is an instance of
SO:match; this feature is the alignment of all leaf features beneath
it.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>label</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>distance</td>
<td>double precision</td>
<td><em></em></td>
</tr>
</tbody>
</table>

phylonode Structure

Tables referencing this one via Foreign Key Constraints:

- [phylonode](#Table:_phylonode)
- [phylonode_dbxref](#Table:_phylonode_dbxref)
- [phylonode_organism](#Table:_phylonode_organism)
- [phylonode_pub](#Table:_phylonode_pub)
- [phylonode_relationship](#Table:_phylonode_relationship)
- [phylonodeprop](#Table:_phylonodeprop)

------------------------------------------------------------------------

## Table: phylonode_dbxref

For example, for orthology, paralogy group identifiers; could also be
used for NCBI taxonomy; for sequences, refer to phylonode_feature,
feature associated dbxrefs.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phylonode_dbxref_id | serial | *PRIMARY KEY* |
| [phylonode](#Table:_phylonode) | phylonode_id | integer | *UNIQUE#1 NOT NULL* |
| [dbxref](#Table:_dbxref) | dbxref_id | integer | *UNIQUE#1 NOT NULL* |

phylonode_dbxref Structure

------------------------------------------------------------------------

## Table: phylonode_organism

This linking table should only be used for nodes in taxonomy trees; it
provides a mapping between the node and an organism. One node can have
zero or one organisms, one organism can have zero or more nodes
(although typically it should only have one in the standard NCBI
taxonomy tree).

<table data-border="1" data-cellpadding="3">
<caption>phylonode_organism Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phylonode_organism_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_phylonode">phylonode</a></p></td>
<td>phylonode_id</td>
<td>integer</td>
<td><em>UNIQUE NOT NULL</em><br />
<br />
One phylonode cannot refer to &gt;1 organism.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_organism">organism</a></p></td>
<td>organism_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
</tbody>
</table>

phylonode_organism Structure

------------------------------------------------------------------------

## Table: phylonode_pub

| FK                             | Name             | Type    | Description |
|--------------------------------|------------------|---------|---------------------|
|  | phylonode_pub_id | serial | *PRIMARY KEY* |
| [phylonode](#Table:_phylonode) | phylonode_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

phylonode_pub Structure

------------------------------------------------------------------------

## Table: phylonode_relationship

This is for relationships that are not strictly hierarchical; for
example, horizontal gene transfer. Most phylogenetic trees are strictly
hierarchical, nevertheless it is here for completeness.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phylonode_relationship_id | serial | *PRIMARY KEY* |
| [phylonode](#Table:_phylonode) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [phylonode](#Table:_phylonode) | object_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | rank | integer | [phylotree](#Table:_phylotree) |
| phylotree_id | integer | *NOT NULL* |  |

phylonode_relationship Structure

------------------------------------------------------------------------

## Table: phylonodeprop

<table data-border="1" data-cellpadding="3">
<caption>phylonodeprop Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phylonodeprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_phylonode">phylonode</a></p></td>
<td>phylonode_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
type_id could designate phylonode hierarchy relationships, for example:
species taxonomy (kingdom, order, family, genus, species),
"ortholog/paralog", "fold/superfold", etc.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>text</td>
<td><em>UNIQUE#1 NOT NULL DEFAULT ''::text</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
</tbody>
</table>

phylonodeprop Structure

------------------------------------------------------------------------

## Table: phylotree

Global anchor for phylogenetic tree.

<table data-border="1" data-cellpadding="3">
<caption>phylotree Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phylotree_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_dbxref">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Type: protein, nucleotide, taxonomy, for example. The type should be any
SO type, or "taxonomy".</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_analysis">analysis</a></p></td>
<td>analysis_id</td>
<td>integer</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>comment</td>
<td>text</td>
<td><em></em></td>
</tr>
</tbody>
</table>

phylotree Structure

Tables referencing this one via Foreign Key Constraints:

- [phylonode](#Table:_phylonode)
- [phylonode_relationship](#Table:_phylonode_relationship)
- [phylotree_pub](#Table:_phylotree_pub)

------------------------------------------------------------------------

## Table: phylotree_pub

Tracks citations global to the tree e.g. multiple sequence alignment
supporting tree construction.

| FK                             | Name             | Type    | Description |
|--------------------------------|------------------|---------|---------------------|
|  | phylotree_pub_id | serial | *PRIMARY KEY* |
| [phylotree](#Table:_phylotree) | phylotree_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

phylotree_pub Structure

------------------------------------------------------------------------

## Table: library

<table data-border="1" data-cellpadding="3">
<caption>library Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>library_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_organism">organism</a></p></td>
<td>organism_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The type_id foreign key links to a controlled vocabulary of library
types. Examples of this would be: "cDNA_library" or
"genomic_library"</td>
</tr>
</tbody>
</table>

library Structure

Tables referencing this one via Foreign Key Constraints:

- [library_cvterm](#Table:_library_cvterm)
- [library_feature](#Table:_library_feature)
- [library_pub](#Table:_library_pub)
- [library_synonym](#Table:_library_synonym)
- [libraryprop](#Table:_libraryprop)

------------------------------------------------------------------------

## Table: library_cvterm

The table library_cvterm links a library to controlled vocabularies
which describe the library. For instance, there might be a link to the
anatomy cv for "head" or "testes" for a head or testes library.

| FK                         | Name              | Type    | Description |
|----------------------------|-------------------|---------|---------------------|
|  | library_cvterm_id | serial | *PRIMARY KEY* |
| [library](#Table:_library) | library_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | cvterm_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

library_cvterm Structure

------------------------------------------------------------------------

## Table: library_feature

library_feature links a library to the clones which are contained in the
library. Examples of such linked features might be "cDNA_clone" or
"genomic_clone".

| FK                         | Name               | Type    | Description |
|----------------------------|--------------------|---------|---------------------|
|  | library_feature_id | serial | *PRIMARY KEY* |
| [library](#Table:_library) | library_id | integer | *UNIQUE#1 NOT NULL* |
| [feature](#Table:_feature) | feature_id | integer | *UNIQUE#1 NOT NULL* |

library_feature Structure

------------------------------------------------------------------------

## Table: library_pub

| FK                         | Name           | Type    | Description |
|----------------------------|----------------|---------|---------------------|
|  | library_pub_id | serial | *PRIMARY KEY* |
| [library](#Table:_library) | library_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

library_pub Structure

------------------------------------------------------------------------

## Table: library_synonym

<table data-border="1" data-cellpadding="3">
<caption>library_synonym Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>library_synonym_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_synonym">synonym</a></p></td>
<td>synonym_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_library">library</a></p></td>
<td>library_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_pub">pub</a></p></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The pub_id link is for relating the usage of a given synonym to the
publication in which it was used.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>is_current</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT true</em><br />
<br />
The is_current bit indicates whether the linked synonym is the current
-official- symbol for the linked library.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_internal</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT false</em><br />
<br />
Typically a synonym exists so that somebody querying the database with
an obsolete name can find the object they are looking for under its
current name. If the synonym has been used publicly and deliberately
(e.g. in a paper), it my also be listed in reports as a synonym. If the
synonym was not used deliberately (e.g., there was a typo which went
public), then the is_internal bit may be set to "true" so that it is
known that the synonym is "internal" and should be queryable but should
not be listed in reports as a valid synonym.</td>
</tr>
</tbody>
</table>

library_synonym Structure

------------------------------------------------------------------------

## Table: libraryprop

| FK                         | Name           | Type    | Description |
|----------------------------|----------------|---------|---------------------|
|  | libraryprop_id | serial | *PRIMARY KEY* |
| [library](#Table:_library) | library_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

libraryprop Structure

------------------------------------------------------------------------

## Table: contact

Model persons, institutes, groups, organizations, etc.

<table data-border="1" data-cellpadding="3">
<caption>contact Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>contact_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em></em><br />
<br />
What type of contact is this? E.g. "person", "lab".</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em>UNIQUE NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>description</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
</tbody>
</table>

contact Structure

Tables referencing this one via Foreign Key Constraints:

- [arraydesign](#Table:_arraydesign)
- [assay](#Table:_assay)
- [biomaterial](#Table:_biomaterial)
- [contact_relationship](#Table:_contact_relationship)
- [quantification](#Table:_quantification)
- [stockcollection](#Table:_stockcollection)
- [study](#Table:_study)

------------------------------------------------------------------------

## Table: contact_relationship

Model relationships between contacts

<table data-border="1" data-cellpadding="3">
<caption>contact_relationship Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>contact_relationship_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Relationship type between subject and object. This is a cvterm,
typically from the OBO relationship ontology, although other
relationship types are allowed.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_contact">contact</a></p></td>
<td>subject_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The subject of the subj-predicate-obj sentence. In a DAG, this
corresponds to the child node.</td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_contact">contact</a></p></td>
<td>object_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The object of the subj-predicate-obj sentence. In a DAG, this
corresponds to the parent node.</td>
</tr>
</tbody>
</table>

contact_relationship Structure

------------------------------------------------------------------------

## Table: stock

Any stock can be globally identified by the combination of organism,
uniquename and stock type. A stock is the physical entities, either
living or preserved, held by collections. Stocks belong to a collection;
they have IDs, type, organism, description and may have a genotype.

<table data-border="1" data-cellpadding="3">
<caption>stock Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>stock_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_dbxref">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em></em><br />
<br />
The dbxref_id is an optional primary stable identifier for this stock.
Secondary identifiers and external dbxrefs go in table:
stock_dbxref.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_organism">organism</a></p></td>
<td>organism_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The organism_id is the organism to which the stock belongs. This column
is mandatory.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
The name is a human-readable local name for a stock.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>description</td>
<td>text</td>
<td><em></em><br />
<br />
The description is the genetic description provided in the stock
list.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The type_id foreign key links to a controlled vocabulary of stock types.
The would include living stock, genomic DNA, preserved specimen.
Secondary cvterms for stocks would go in stock_cvterm.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_obsolete</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT false</em></td>
</tr>
</tbody>
</table>

stock Structure

Tables referencing this one via Foreign Key Constraints:

- [stock_cvterm](#Table:_stock_cvterm)
- [stock_dbxref](#Table:_stock_dbxref)
- [stock_genotype](#Table:_stock_genotype)
- [stock_pub](#Table:_stock_pub)
- [stock_relationship](#Table:_stock_relationship)
- [stockcollection_stock](#Table:_stockcollection_stock)
- [stockprop](#Table:_stockprop)

------------------------------------------------------------------------

## Table: stock_cvterm

stock_cvterm links a stock to cvterms. This is for secondary cvterms;
primary cvterms should use stock.type_id.

| FK                       | Name            | Type    | Description |
|--------------------------|-----------------|---------|---------------------|
|  | stock_cvterm_id | serial | *PRIMARY KEY* |
| [stock](#Table:_stock) | stock_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | cvterm_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

stock_cvterm Structure

------------------------------------------------------------------------

## Table: stock_dbxref

stock_dbxref links a stock to dbxrefs. This is for secondary
identifiers; primary identifiers should use stock.dbxref_id.

<table data-border="1" data-cellpadding="3">
<caption>stock_dbxref Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>stock_dbxref_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_stock">stock</a></p></td>
<td>stock_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_dbxref">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_current</td>
<td>boolean</td>
<td><em>NOT NULL DEFAULT true</em><br />
<br />
The is_current boolean indicates whether the linked dbxref is the
current -official- dbxref for the linked stock.</td>
</tr>
</tbody>
</table>

stock_dbxref Structure

------------------------------------------------------------------------

## Table: stock_genotype

Simple table linking a stock to a genotype. Features with genotypes can
be linked to stocks thru feature_genotype -\> genotype -\>
stock_genotype -\> stock.

| FK                           | Name              | Type    | Description |
|------------------------------|-------------------|---------|---------------------|
|  | stock_genotype_id | serial | *PRIMARY KEY* |
| [stock](#Table:_stock) | stock_id | integer | *UNIQUE#1 NOT NULL* |
| [genotype](#Table:_genotype) | genotype_id | integer | *UNIQUE#1 NOT NULL* |

stock_genotype Structure

------------------------------------------------------------------------

## Table: stock_pub

Provenance. Linking table between stocks and, for example, a stocklist
computer file.

| FK                     | Name         | Type    | Description |
|------------------------|--------------|---------|---------------------|
|  | stock_pub_id | serial | *PRIMARY KEY* |
| [stock](#Table:_stock) | stock_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

stock_pub Structure

------------------------------------------------------------------------

## Table: stock_relationship

<table data-border="1" data-cellpadding="3">
<caption>stock_relationship Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>stock_relationship_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_stock">stock</a></p></td>
<td>subject_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
stock_relationship.subject_id is the subject of the subj-predicate-obj
sentence. This is typically the substock.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_stock">stock</a></p></td>
<td>object_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
stock_relationship.object_id is the object of the subj-predicate-obj
sentence. This is typically the container stock.</td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
stock_relationship.type_id is relationship type between subject and
object. This is a cvterm, typically from the OBO relationship ontology,
although other relationship types are allowed.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>value</td>
<td>text</td>
<td><em></em><br />
<br />
stock_relationship.value is for additional notes or comments.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
stock_relationship.rank is the ordering of subject stocks with respect
to the object stock may be important where rank is used to order these;
starts from zero.</td>
</tr>
</tbody>
</table>

stock_relationship Structure

Tables referencing this one via Foreign Key Constraints:

- [stock_relationship_pub](#Table:_stock_relationship_pub)

------------------------------------------------------------------------

## Table: stock_relationship_pub

Provenance. Attach optional evidence to a stock_relationship in the form
of a publication.

| FK | Name | Type | Description |
|----|----|----|----|
|  | stock_relationship_pub_id | serial | *PRIMARY KEY* |
| [stock_relationship](#Table:_stock_relationship) | stock_relationship_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

stock_relationship_pub Structure

------------------------------------------------------------------------

## Table: stockcollection

The lab or stock center distributing the stocks in their collection.

<table data-border="1" data-cellpadding="3">
<caption>stockcollection Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>stockcollection_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
type_id is the collection type cv.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_contact">contact</a></p></td>
<td>contact_id</td>
<td>integer</td>
<td><em></em><br />
<br />
contact_id links to the contact information for the collection.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
name is the collection.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
uniqename is the value of the collection cv.</td>
</tr>
</tbody>
</table>

stockcollection Structure

Tables referencing this one via Foreign Key Constraints:

- [stockcollection_stock](#Table:_stockcollection_stock)
- [stockcollectionprop](#Table:_stockcollectionprop)

------------------------------------------------------------------------

## Table: stockcollection_stock

stockcollection_stock links a stock collection to the stocks which are
contained in the collection.

| FK | Name | Type | Description |
|----|----|----|----|
|  | stockcollection_stock_id | serial | *PRIMARY KEY* |
| [stockcollection](#Table:_stockcollection) | stockcollection_id | integer | *UNIQUE#1 NOT NULL* |
| [stock](#Table:_stock) | stock_id | integer | *UNIQUE#1 NOT NULL* |

stockcollection_stock Structure

------------------------------------------------------------------------

## Table: stockcollectionprop

The table stockcollectionprop contains the value of the stock collection
such as website/email URLs; the value of the stock collection order
URLs.

<table data-border="1" data-cellpadding="3">
<caption>stockcollectionprop Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>stockcollectionprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_stockcollection">stockcollection</a></p></td>
<td>stockcollection_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The cv for the type_id is "stockcollection property type".</td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>text</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
</tbody>
</table>

stockcollectionprop Structure

------------------------------------------------------------------------

## Table: stockprop

A stock can have any number of slot-value property tags attached to it.
This is an alternative to hardcoding a list of columns in the relational
schema, and is completely extensible. There is a unique constraint,
stockprop_c1, for the combination of stock_id, rank, and type_id.
Multivalued property-value pairs must be differentiated by rank.

| FK                       | Name         | Type    | Description |
|--------------------------|--------------|---------|---------------------|
|  | stockprop_id | serial | *PRIMARY KEY* |
| [stock](#Table:_stock) | stock_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

stockprop Structure

Tables referencing this one via Foreign Key Constraints:

- [stockprop_pub](#Table:_stockprop_pub)

------------------------------------------------------------------------

## Table: stockprop_pub

Provenance. Any stockprop assignment can optionally be supported by a
publication.

| FK                             | Name             | Type    | Description |
|--------------------------------|------------------|---------|---------------------|
|  | stockprop_pub_id | serial | *PRIMARY KEY* |
| [stockprop](#Table:_stockprop) | stockprop_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

stockprop_pub Structure

------------------------------------------------------------------------

## Table: environment

The environmental component of a phenotype description.

| FK  | Name           | Type   | Description |
|-----|----------------|--------|-------------------|
|  | environment_id | serial | *PRIMARY KEY* |
|  | uniquename | text | *UNIQUE NOT NULL* |
|  | description | text   environment Structure |  |

Tables referencing this one via Foreign Key Constraints:

- [environment_cvterm](#Table:_environment_cvterm)
- [phendesc](#Table:_phendesc)
- [phenotype_comparison](#Table:_phenotype_comparison)
- [phenstatement](#Table:_phenstatement)

------------------------------------------------------------------------

## Table: environment_cvterm

| FK | Name | Type | Description |
|----|----|----|----|
|  | environment_cvterm_id | serial | *PRIMARY KEY* |
| [environment](#Table:_environment) | environment_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | cvterm_id | integer | *UNIQUE#1 NOT NULL* |

environment_cvterm Structure

------------------------------------------------------------------------

## Table: feature_genotype

<table data-border="1" data-cellpadding="3">
<caption>feature_genotype Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>feature_genotype_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_genotype">genotype</a></p></td>
<td>genotype_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>chromosome_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
<br />
A feature of SO type "chromosome".</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
rank can be used for n-ploid organisms or to preserve order.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>cgroup</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Spatially distinguishable group. group can be used for distinguishing
the chromosomal groups, for example (RNAi products and so on can be
treated as different groups, as they do not fall on a particular
chromosome).</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>cvterm_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
</tbody>
</table>

feature_genotype Structure

------------------------------------------------------------------------

## Table: genotype

Genetic context. A genotype is defined by a collection of features,
mutations, balancers, deficiencies, haplotype blocks, or engineered
constructs.

<table data-border="1" data-cellpadding="3">
<caption>genotype Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>genotype_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>text</td>
<td><em></em><br />
<br />
Optional alternative name for a genotype, for display purposes.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE NOT NULL</em><br />
<br />
The unique name for a genotype; typically derived from the features
making up the genotype.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>description</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
</tbody>
</table>

genotype Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_genotype](#Table:_feature_genotype)
- [phendesc](#Table:_phendesc)
- [phenotype_comparison](#Table:_phenotype_comparison)
- [phenstatement](#Table:_phenstatement)
- [stock_genotype](#Table:_stock_genotype)
- [wwwuser_genotype](#Table:_wwwuser_genotype)

------------------------------------------------------------------------

## Table: phendesc

A summary of a \_set\_ of phenotypic statements for any one gcontext
made in any one publication.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phendesc_id | serial | *PRIMARY KEY* |
| [genotype](#Table:_genotype) | genotype_id | integer | *UNIQUE#1 NOT NULL* |
| [environment](#Table:_environment) | environment_id | integer | *UNIQUE#1 NOT NULL* |
|  | description | text | *NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

phendesc Structure

------------------------------------------------------------------------

## Table: phenotype_comparison

Comparison of phenotypes e.g., genotype1/environment1/phenotype1
"non-suppressible" with respect to genotype2/environment2/phenotype2.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phenotype_comparison_id | serial | *PRIMARY KEY* |
| [genotype](#Table:_genotype) | genotype1_id | integer | *UNIQUE#1 NOT NULL* |
| [environment](#Table:_environment) | environment1_id | integer | *UNIQUE#1 NOT NULL* |
| [genotype](#Table:_genotype) | genotype2_id | integer | *UNIQUE#1 NOT NULL* |
| [environment](#Table:_environment) | environment2_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](#Table:_phenotype) | phenotype1_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](#Table:_phenotype) | phenotype2_id | integer | [cvterm](#Table:_cvterm) |
| type_id | integer | *UNIQUE#1 NOT NULL* | [pub](#Table:_pub) |
| pub_id | integer | *UNIQUE#1 NOT NULL* |  |

phenotype_comparison Structure

------------------------------------------------------------------------

## Table: phenstatement

Phenotypes are things like "larval lethal". Phenstatements are things
like "dpp-1 is recessive larval lethal". So essentially phenstatement is
a linking table expressing the relationship between genotype,
environment, and phenotype.

| FK | Name | Type | Description |
|----|----|----|----|
|  | phenstatement_id | serial | *PRIMARY KEY* |
| [genotype](#Table:_genotype) | genotype_id | integer | *UNIQUE#1 NOT NULL* |
| [environment](#Table:_environment) | environment_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](#Table:_phenotype) | phenotype_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

phenstatement Structure

------------------------------------------------------------------------

## Table: acquisition

This represents the scanning of hybridized material. The output of this
process is typically a digital image of an array.

| FK | Name | Type | Description |
|----|----|----|----|
|  | acquisition_id | serial | *PRIMARY KEY* |
| [assay](#Table:_assay) | assay_id | integer | *NOT NULL* |
| [protocol](#Table:_protocol) | protocol_id | integer | [channel](#Table:_channel) |
| channel_id | integer | acquisitiondate | timestamp without time zone |
| *DEFAULT ('now'::text)::timestamp(6) with time zone* |  | name | text |
| *UNIQUE* |  | uri | text acquisition Structure |

Tables referencing this one via Foreign Key Constraints:

- [acquisition_relationship](#Table:_acquisition_relationship)
- [acquisitionprop](#Table:_acquisitionprop)
- [quantification](#Table:_quantification)

------------------------------------------------------------------------

## Table: acquisition_relationship

Multiple monochrome images may be merged to form a multi-color image.
Red-green images of 2-channel hybridizations are an example of this.

| FK | Name | Type | Description |
|----|----|----|----|
|  | acquisition_relationship_id | serial | *PRIMARY KEY* |
| [acquisition](#Table:_acquisition) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [acquisition](#Table:_acquisition) | object_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

acquisition_relationship Structure

------------------------------------------------------------------------

## Table: acquisitionprop

Parameters associated with image acquisition.

| FK | Name | Type | Description |
|----|----|----|----|
|  | acquisitionprop_id | serial | *PRIMARY KEY* |
| [acquisition](#Table:_acquisition) | acquisition_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

acquisitionprop Structure

------------------------------------------------------------------------

## Table: arraydesign

General properties about an array. An array is a template used to
generate physical slides, etc. It contains layout information, as well
as global array properties, such as material (glass, nylon) and spot
dimensions (in rows/columns).

| FK                           | Name               | Type    | Description |
|------------------------------|--------------------|---------|-------------------|
|  | arraydesign_id | serial | *PRIMARY KEY* |
| [contact](#Table:_contact) | manufacturer_id | integer | *NOT NULL* |
| [cvterm](#Table:_cvterm) | platformtype_id | integer | *NOT NULL* |
| [cvterm](#Table:_cvterm) | substratetype_id | integer | [protocol](#Table:_protocol) |
| protocol_id | integer | [dbxref](#Table:_dbxref) | dbxref_id |
| integer | name | text | *UNIQUE NOT NULL* |
|  | version | text | description |
| text | array_dimensions | text | element_dimensions |
| text | num_of_elements | integer | num_array_columns |
| integer | num_array_rows | integer | num_grid_columns |
| integer | num_grid_rows | integer | num_sub_columns |
| integer | num_sub_rows | integer arraydesign Structure |  |

Tables referencing this one via Foreign Key Constraints:

- [arraydesignprop](#Table:_arraydesignprop)
- [assay](#Table:_assay)
- [element](#Table:_element)

------------------------------------------------------------------------

## Table: arraydesignprop

Extra array design properties that are not accounted for in arraydesign.

| FK | Name | Type | Description |
|----|----|----|----|
|  | arraydesignprop_id | serial | *PRIMARY KEY* |
| [arraydesign](#Table:_arraydesign) | arraydesign_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

arraydesignprop Structure

------------------------------------------------------------------------

## Table: assay

An assay consists of a physical instance of an array, combined with the
conditions used to create the array (protocols, technician information).
The assay can be thought of as a hybridization.

| FK | Name | Type | Description |
|----|----|----|----|
|  | assay_id | serial | *PRIMARY KEY* |
| [arraydesign](#Table:_arraydesign) | arraydesign_id | integer | *NOT NULL* |
| [protocol](#Table:_protocol) | protocol_id | integer | assaydate |
| timestamp without time zone | *DEFAULT ('now'::text)::timestamp(6) with time zone* |  | arrayidentifier |
| text | arraybatchidentifier | text | [contact](#Table:_contact) |
| operator_id | integer | *NOT NULL* | [dbxref](#Table:_dbxref) |
| dbxref_id | integer | name | text |
| *UNIQUE* |  | description | text assay Structure |

Tables referencing this one via Foreign Key Constraints:

- [acquisition](#Table:_acquisition)
- [assay_biomaterial](#Table:_assay_biomaterial)
- [assay_project](#Table:_assay_project)
- [assayprop](#Table:_assayprop)
- [control](#Table:_control)
- [study_assay](#Table:_study_assay)
- [studyfactorvalue](#Table:_studyfactorvalue)

------------------------------------------------------------------------

## Table: assay_biomaterial

A biomaterial can be hybridized many times (technical replicates), or
combined with other biomaterials in a single hybridization (for
two-channel arrays).

| FK | Name | Type | Description |
|----|----|----|----|
|  | assay_biomaterial_id | serial | *PRIMARY KEY* |
| [assay](#Table:_assay) | assay_id | integer | *UNIQUE#1 NOT NULL* |
| [biomaterial](#Table:_biomaterial) | biomaterial_id | integer | *UNIQUE#1 NOT NULL* |
| [channel](#Table:_channel) | channel_id | integer | *UNIQUE#1* |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

assay_biomaterial Structure

------------------------------------------------------------------------

## Table: assay_project

Link assays to projects.

| FK                         | Name             | Type    | Description |
|----------------------------|------------------|---------|---------------------|
|  | assay_project_id | serial | *PRIMARY KEY* |
| [assay](#Table:_assay) | assay_id | integer | *UNIQUE#1 NOT NULL* |
| [project](#Table:_project) | project_id | integer | *UNIQUE#1 NOT NULL* |

assay_project Structure

------------------------------------------------------------------------

## Table: assayprop

Extra assay properties that are not accounted for in assay.

| FK                       | Name         | Type    | Description |
|--------------------------|--------------|---------|---------------------|
|  | assayprop_id | serial | *PRIMARY KEY* |
| [assay](#Table:_assay) | assay_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

assayprop Structure

------------------------------------------------------------------------

## Table: biomaterial

A biomaterial represents the MAGE concept of BioSource, BioSample, and
LabeledExtract. It is essentially some biological material (tissue,
cells, serum) that may have been processed. Processed biomaterials
should be traceable back to raw biomaterials via the
biomaterialrelationship table.

| FK                           | Name                 | Type    | Description |
|------------------------------|----------------------|---------|---------------|
|  | biomaterial_id | serial | *PRIMARY KEY* |
| [organism](#Table:_organism) | taxon_id | integer | [contact](#Table:_contact) |
| biosourceprovider_id | integer | [dbxref](#Table:_dbxref) | dbxref_id |
| integer | name | text | *UNIQUE* |
|  | description | text    biomaterial Structure |  |

Tables referencing this one via Foreign Key Constraints:

- [assay_biomaterial](#Table:_assay_biomaterial)
- [biomaterial_dbxref](#Table:_biomaterial_dbxref)
- [biomaterial_relationship](#Table:_biomaterial_relationship)
- [biomaterial_treatment](#Table:_biomaterial_treatment)
- [biomaterialprop](#Table:_biomaterialprop)
- [treatment](#Table:_treatment)

------------------------------------------------------------------------

## Table: biomaterial_dbxref

| FK | Name | Type | Description |
|----|----|----|----|
|  | biomaterial_dbxref_id | serial | *PRIMARY KEY* |
| [biomaterial](#Table:_biomaterial) | biomaterial_id | integer | *UNIQUE#1 NOT NULL* |
| [dbxref](#Table:_dbxref) | dbxref_id | integer | *UNIQUE#1 NOT NULL* |

biomaterial_dbxref Structure

------------------------------------------------------------------------

## Table: biomaterial_relationship

Relate biomaterials to one another. This is a way to track a series of
treatments or material splits/merges, for instance.

| FK | Name | Type | Description |
|----|----|----|----|
|  | biomaterial_relationship_id | serial | *PRIMARY KEY* |
| [biomaterial](#Table:_biomaterial) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [biomaterial](#Table:_biomaterial) | object_id | integer | *UNIQUE#1 NOT NULL* |

biomaterial_relationship Structure

------------------------------------------------------------------------

## Table: biomaterial_treatment

Link biomaterials to treatments. Treatments have an order of operations
(rank), and associated measurements (unittype_id, value).

| FK | Name | Type | Description |
|----|----|----|----|
|  | biomaterial_treatment_id | serial | *PRIMARY KEY* |
| [biomaterial](#Table:_biomaterial) | biomaterial_id | integer | *UNIQUE#1 NOT NULL* |
| [treatment](#Table:_treatment) | treatment_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | unittype_id | integer | value |
| real | rank | integer | *NOT NULL* |

biomaterial_treatment Structure

------------------------------------------------------------------------

## Table: biomaterialprop

Extra biomaterial properties that are not accounted for in biomaterial.

| FK | Name | Type | Description |
|----|----|----|----|
|  | biomaterialprop_id | serial | *PRIMARY KEY* |
| [biomaterial](#Table:_biomaterial) | biomaterial_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

biomaterialprop Structure

------------------------------------------------------------------------

## Table: channel

Different array platforms can record signals from one or more channels
(cDNA arrays typically use two CCD, but Affymetrix uses only one).

| FK  | Name       | Type   | Description |
|-----|------------|--------|-------------------|
|  | channel_id | serial | *PRIMARY KEY* |
|  | name | text | *UNIQUE NOT NULL* |
|  | definition | text | *NOT NULL* |

channel Structure

Tables referencing this one via Foreign Key Constraints:

- [acquisition](#Table:_acquisition)
- [assay_biomaterial](#Table:_assay_biomaterial)

------------------------------------------------------------------------

## Table: control

| FK                             | Name         | Type    | Description |
|--------------------------------|--------------|---------|---------------|
|  | control_id | serial | *PRIMARY KEY* |
| [cvterm](#Table:_cvterm) | type_id | integer | *NOT NULL* |
| [assay](#Table:_assay) | assay_id | integer | *NOT NULL* |
| [tableinfo](#Table:_tableinfo) | tableinfo_id | integer | *NOT NULL* |
|  | row_id | integer | *NOT NULL* |
|  | name | text | value |
| text | rank | integer | *NOT NULL* |

control Structure

------------------------------------------------------------------------

## Table: element

Represents a feature of the array. This is typically a region of the
array coated or bound to DNA.

| FK | Name | Type | Description |
|----|----|----|----|
|  | element_id | serial | *PRIMARY KEY* |
| [feature](#Table:_feature) | feature_id | integer | *UNIQUE#1* |
| [arraydesign](#Table:_arraydesign) | arraydesign_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | [dbxref](#Table:_dbxref) |
| dbxref_id | integer element Structure |  |  |

Tables referencing this one via Foreign Key Constraints:

- [element_relationship](#Table:_element_relationship)
- [elementresult](#Table:_elementresult)

------------------------------------------------------------------------

## Table: element_relationship

Sometimes we want to combine measurements from multiple elements to get
a composite value. Affymetrix combines many probes to form a probeset
measurement, for instance.

| FK | Name | Type | Description |
|----|----|----|----|
|  | element_relationship_id | serial | *PRIMARY KEY* |
| [element](#Table:_element) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [element](#Table:_element) | object_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

element_relationship Structure

------------------------------------------------------------------------

## Table: elementresult

An element on an array produces a measurement when hybridized to a
biomaterial (traceable through quantification_id). This is the base data
from which tables that actually contain data inherit.

| FK | Name | Type | Description |
|----|----|----|----|
|  | elementresult_id | serial | *PRIMARY KEY* |
| [element](#Table:_element) | element_id | integer | *UNIQUE#1 NOT NULL* |
| [quantification](#Table:_quantification) | quantification_id | integer | *UNIQUE#1 NOT NULL* |
|  | signal | double precision | *NOT NULL* |

elementresult Structure

Tables referencing this one via Foreign Key Constraints:

- [elementresult_relationship](#Table:_elementresult_relationship)

------------------------------------------------------------------------

## Table: elementresult_relationship

Sometimes we want to combine measurements from multiple elements to get
a composite value. Affymetrix combines many probes to form a probeset
measurement, for instance.

| FK | Name | Type | Description |
|----|----|----|----|
|  | elementresult_relationship_id | serial | *PRIMARY KEY* |
| [elementresult](#Table:_elementresult) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [elementresult](#Table:_elementresult) | object_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

elementresult_relationship Structure

------------------------------------------------------------------------

## Table: magedocumentation

| FK                             | Name                 | Type    | Description |
|--------------------------------|----------------------|---------|---------------|
|  | magedocumentation_id | serial | *PRIMARY KEY* |
| [mageml](#Table:_mageml) | mageml_id | integer | *NOT NULL* |
| [tableinfo](#Table:_tableinfo) | tableinfo_id | integer | *NOT NULL* |
|  | row_id | integer | *NOT NULL* |
|  | mageidentifier | text | *NOT NULL* |

magedocumentation Structure

------------------------------------------------------------------------

## Table: mageml

This table is for storing extra bits of MAGEml in a denormalized form.
More normalization would require many more tables.

| FK  | Name         | Type   | Description |
|-----|--------------|--------|---------------|
|  | mageml_id | serial | *PRIMARY KEY* |
|  | mage_package | text | *NOT NULL* |
|  | mage_ml | text | *NOT NULL* |

mageml Structure

Tables referencing this one via Foreign Key Constraints:

- [magedocumentation](#Table:_magedocumentation)

------------------------------------------------------------------------

## Table: protocol

Procedural notes on how data was prepared and processed.

| FK                       | Name                | Type    | Description |
|--------------------------|---------------------|---------|-------------------|
|  | protocol_id | serial | *PRIMARY KEY* |
| [cvterm](#Table:_cvterm) | type_id | integer | *NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | [dbxref](#Table:_dbxref) |
| dbxref_id | integer | name | text |
| *UNIQUE NOT NULL* |  | uri | text |
| protocoldescription | text | hardwaredescription | text |
| softwaredescription | text    protocol Structure |  |  |

Tables referencing this one via Foreign Key Constraints:

- [acquisition](#Table:_acquisition)
- [arraydesign](#Table:_arraydesign)
- [assay](#Table:_assay)
- [protocolparam](#Table:_protocolparam)
- [quantification](#Table:_quantification)
- [treatment](#Table:_treatment)

------------------------------------------------------------------------

## Table: protocolparam

Parameters related to a protocol. For example, if the protocol is a
soak, this might include attributes of bath temperature and duration.

| FK                           | Name             | Type    | Description |
|------------------------------|------------------|---------|---------------|
|  | protocolparam_id | serial | *PRIMARY KEY* |
| [protocol](#Table:_protocol) | protocol_id | integer | *NOT NULL* |
|  | name | text | *NOT NULL* |
| [cvterm](#Table:_cvterm) | datatype_id | integer | [cvterm](#Table:_cvterm) |
| unittype_id | integer | value | text |
| rank | integer | *NOT NULL* |  |

protocolparam Structure

------------------------------------------------------------------------

## Table: quantification

Quantification is the transformation of an image acquisition to numeric
data. This typically involves statistical procedures.

| FK | Name | Type | Description |
|----|----|----|----|
|  | quantification_id | serial | *PRIMARY KEY* |
| [acquisition](#Table:_acquisition) | acquisition_id | integer | *NOT NULL* |
| [contact](#Table:_contact) | operator_id | integer | [protocol](#Table:_protocol) |
| protocol_id | integer | [analysis](#Table:_analysis) | analysis_id |
| integer | *UNIQUE#1 NOT NULL* |  | quantificationdate |
| timestamp without time zone | *DEFAULT ('now'::text)::timestamp(6) with time zone* |  | name |
| text | *UNIQUE#1* |  | uri |
| text quantification Structure |  |  |  |

Tables referencing this one via Foreign Key Constraints:

- [elementresult](#Table:_elementresult)
- [quantification_relationship](#Table:_quantification_relationship)
- [quantificationprop](#Table:_quantificationprop)

------------------------------------------------------------------------

## Table: quantification_relationship

There may be multiple rounds of quantification, this allows us to keep
an audit trail of what values went where.

| FK | Name | Type | Description |
|----|----|----|----|
|  | quantification_relationship_id | serial | *PRIMARY KEY* |
| [quantification](#Table:_quantification) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
| [quantification](#Table:_quantification) | object_id | integer | *UNIQUE#1 NOT NULL* |

quantification_relationship Structure

------------------------------------------------------------------------

## Table: quantificationprop

Extra quantification properties that are not accounted for in
quantification.

| FK | Name | Type | Description |
|----|----|----|----|
|  | quantificationprop_id | serial | *PRIMARY KEY* |
| [quantification](#Table:_quantification) | quantification_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

quantificationprop Structure

------------------------------------------------------------------------

## Table: study

Study represents an experiment, published or otherwise, that produced
microarray data

| FK                         | Name        | Type    | Description |
|----------------------------|-------------|---------|-------------------|
|  | study_id | serial | *PRIMARY KEY* |
| [contact](#Table:_contact) | contact_id | integer | *NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | [dbxref](#Table:_dbxref) |
| dbxref_id | integer | name | text |
| *UNIQUE NOT NULL* |  | description | text    study Structure |

Tables referencing this one via Foreign Key Constraints:

- [study_assay](#Table:_study_assay)
- [studydesign](#Table:_studydesign)

------------------------------------------------------------------------

## Table: study_assay

| FK                     | Name           | Type    | Description |
|------------------------|----------------|---------|---------------------|
|  | study_assay_id | serial | *PRIMARY KEY* |
| [study](#Table:_study) | study_id | integer | *UNIQUE#1 NOT NULL* |
| [assay](#Table:_assay) | assay_id | integer | *UNIQUE#1 NOT NULL* |

study_assay Structure

------------------------------------------------------------------------

## Table: studydesign

| FK                     | Name           | Type    | Description |
|------------------------|----------------|---------|---------------|
|  | studydesign_id | serial | *PRIMARY KEY* |
| [study](#Table:_study) | study_id | integer | *NOT NULL* |
|  | description | text    studydesign Structure |  |

Tables referencing this one via Foreign Key Constraints:

- [studydesignprop](#Table:_studydesignprop)
- [studyfactor](#Table:_studyfactor)

------------------------------------------------------------------------

## Table: studydesignprop

| FK | Name | Type | Description |
|----|----|----|----|
|  | studydesignprop_id | serial | *PRIMARY KEY* |
| [studydesign](#Table:_studydesign) | studydesign_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

studydesignprop Structure

------------------------------------------------------------------------

## Table: studyfactor

| FK                                 | Name           | Type    | Description |
|------------------------------------|----------------|---------|---------------|
|  | studyfactor_id | serial | *PRIMARY KEY* |
| [studydesign](#Table:_studydesign) | studydesign_id | integer | *NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | name |
| text | *NOT NULL* |  | description |
| text    studyfactor Structure |  |  |  |

Tables referencing this one via Foreign Key Constraints:

- [studyfactorvalue](#Table:_studyfactorvalue)

------------------------------------------------------------------------

## Table: studyfactorvalue

| FK | Name | Type | Description |
|----|----|----|----|
|  | studyfactorvalue_id | serial | *PRIMARY KEY* |
| [studyfactor](#Table:_studyfactor) | studyfactor_id | integer | *NOT NULL* |
| [assay](#Table:_assay) | assay_id | integer | *NOT NULL* |
|  | factorvalue | text | name |
| text | rank | integer | *NOT NULL* |

studyfactorvalue Structure

------------------------------------------------------------------------

## Table: treatment

A biomaterial may undergo multiple treatments. Examples of treatments:
apoxia, fluorophore and biotin labeling.

| FK                                 | Name           | Type    | Description |
|------------------------------------|----------------|---------|---------------|
|  | treatment_id | serial | *PRIMARY KEY* |
|  | rank | integer | *NOT NULL* |
| [biomaterial](#Table:_biomaterial) | biomaterial_id | integer | *NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *NOT NULL* |
| [protocol](#Table:_protocol) | protocol_id | integer | name |
| text    treatment Structure |  |  |  |

Tables referencing this one via Foreign Key Constraints:

- [biomaterial_treatment](#Table:_biomaterial_treatment)

------------------------------------------------------------------------

## Table: featuremap

| FK                       | Name          | Type                   | Description |
|--------------------------|---------------|------------------------|---------------|
|  | featuremap_id | serial | *PRIMARY KEY* |
|  | name | character varying(255) | *UNIQUE* |
|  | description | text | [cvterm](#Table:_cvterm) |
| unittype_id | integer                featuremap Structure |  |  |

Tables referencing this one via Foreign Key Constraints:

- [featuremap_pub](#Table:_featuremap_pub)
- [featurepos](#Table:_featurepos)
- [featurerange](#Table:_featurerange)

------------------------------------------------------------------------

## Table: featuremap_pub

| FK                               | Name              | Type    | Description |
|----------------------------------|-------------------|---------|---------------|
|  | featuremap_pub_id | serial | *PRIMARY KEY* |
| [featuremap](#Table:_featuremap) | featuremap_id | integer | *NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *NOT NULL* |

featuremap_pub Structure

------------------------------------------------------------------------

## Table: featurepos

<table data-border="1" data-cellpadding="3">
<caption>featurepos Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>featurepos_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_featuremap">featuremap</a></p></td>
<td>featuremap_id</td>
<td>serial</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>map_feature_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
map_feature_id links to the feature (map) upon which the feature is
being localized.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>mappos</td>
<td>double precision</td>
<td><em>NOT NULL</em></td>
</tr>
</tbody>
</table>

featurepos Structure

------------------------------------------------------------------------

## Table: featurerange

In cases where the start and end of a mapped feature is a range,
leftendf and rightstartf are populated. leftstartf_id, leftendf_id,
rightstartf_id, rightendf_id are the ids of features with respect to
which the feature is being mapped. These may be cytological bands.

<table data-border="1" data-cellpadding="3">
<caption>featurerange Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>featurerange_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_featuremap">featuremap</a></p></td>
<td>featuremap_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
featuremap_id is the id of the feature being mapped.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>leftstartf_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>leftendf_id</td>
<td>integer</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>rightstartf_id</td>
<td>integer</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>rightendf_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>rangestr</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
</tbody>
</table>

featurerange Structure

------------------------------------------------------------------------

## Table: analysis

An analysis is a particular type of a computational analysis; it may be
a blast of one sequence against another, or an all by all blast, or a
different kind of analysis altogether. It is a single unit of
computation.

<table data-border="1" data-cellpadding="3">
<caption>analysis Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>analysis_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
A way of grouping analyses. This should be a handy short identifier that
can help people find an analysis they want. For instance "tRNAscan",
"cDNA", "FlyPep", "SwissProt", and it should not be assumed to be
unique. For instance, there may be lots of separate analyses done
against a cDNA database.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>description</td>
<td>text</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>program</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Program name, e.g. blastx, blastp, sim4, genscan.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>programversion</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Version description, e.g. TBLASTX 2.0MP-WashU [09-Nov-2000].</td>
</tr>
<tr class="even tr1">
<td></td>
<td>algorithm</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
Algorithm name, e.g. blast.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>sourcename</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1</em><br />
<br />
Source name, e.g. cDNA, SwissProt.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>sourceversion</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>sourceuri</td>
<td>text</td>
<td><em></em><br />
<br />
This is an optional, permanent URL or URI for the source of the
analysis. The idea is that someone could recreate the analysis directly
by going to this URI and fetching the source data (e.g. the blast
database, or the training model).</td>
</tr>
<tr class="even tr1">
<td></td>
<td>timeexecuted</td>
<td>timestamp without time zone</td>
<td><em>NOT NULL DEFAULT ('now'::text)::timestamp(6) with time
zone</em></td>
</tr>
</tbody>
</table>

analysis Structure

Tables referencing this one via Foreign Key Constraints:

- [analysisfeature](#Table:_analysisfeature)
- [analysisprop](#Table:_analysisprop)
- [phylotree](#Table:_phylotree)
- [quantification](#Table:_quantification)

------------------------------------------------------------------------

## Table: analysisfeature

Computational analyses generate features (e.g. Genscan generates
transcripts and exons; sim4 alignments generate similarity/match
features). analysisfeatures are stored using the feature table from the
sequence module. The analysisfeature table is used to decorate these
features, with analysis specific attributes. A feature is an
analysisfeature if and only if there is a corresponding entry in the
analysisfeature table. analysisfeatures will have two or more featureloc
entries, with rank indicating query/subject

<table data-border="1" data-cellpadding="3">
<caption>analysisfeature Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>analysisfeature_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_feature">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_analysis">analysis</a></p></td>
<td>analysis_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>rawscore</td>
<td>double precision</td>
<td><em></em><br />
<br />
This is the native score generated by the program; for example, the
bitscore generated by blast, sim4 or genscan scores. One should not
assume that high is necessarily better than low.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>normscore</td>
<td>double precision</td>
<td><em></em><br />
<br />
This is the rawscore but semi-normalized. Complete normalization to
allow comparison of features generated by different programs would be
nice but too difficult. Instead the normalization should strive to
enforce the following semantics: * normscores are floating point numbers
&gt;= 0, * high normscores are better than low one. For most programs,
it would be sufficient to make the normscore the same as this rawscore,
providing these semantics are satisfied.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>significance</td>
<td>double precision</td>
<td><em></em><br />
<br />
This is some kind of expectation or probability metric, representing the
probability that the analysis would appear randomly given the model. As
such, any program or person querying this table can assume the following
semantics: * 0 &lt;= significance &lt;= n, where n is a positive number,
theoretically unbounded but unlikely to be more than 10 * low numbers
are better than high numbers.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>identity</td>
<td>double precision</td>
<td><em></em><br />
<br />
Percent identity between the locations compared. Note that these 4
metrics do not cover the full range of scores possible; it would be
undesirable to list every score possible, as this should be kept
extensible. instead, for non-standard scores, use the analysisprop
table.</td>
</tr>
</tbody>
</table>

analysisfeature Structure

------------------------------------------------------------------------

## Table: analysisprop

| FK                           | Name            | Type    | Description |
|------------------------------|-----------------|---------|---------------------|
|  | analysisprop_id | serial | *PRIMARY KEY* |
| [analysis](#Table:_analysis) | analysis_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | *UNIQUE#1* |

analysisprop Structure

------------------------------------------------------------------------

## Table: eimage

<table data-border="1" data-cellpadding="3">
<caption>eimage Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>eimage_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>eimage_data</td>
<td>text</td>
<td><em></em><br />
<br />
We expect images in eimage_data (e.g. JPEGs) to be uuencoded.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>eimage_type</td>
<td>character varying(255)</td>
<td><em>NOT NULL</em><br />
<br />
Describes the type of data in eimage_data.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>image_uri</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
</tbody>
</table>

eimage Structure

Tables referencing this one via Foreign Key Constraints:

- [expression_image](#Table:_expression_image)

------------------------------------------------------------------------

## Table: expression

The expression table is essentially a bridge table.

| FK  | Name          | Type          | Description |
|-----|---------------|---------------|-------------------|
|  | expression_id | serial | *PRIMARY KEY* |
|  | uniquename | text | *UNIQUE NOT NULL* |
|  | md5checksum | character(32) | description |
| text          expression Structure |  |  |  |

Tables referencing this one via Foreign Key Constraints:

- [expression_cvterm](#Table:_expression_cvterm)
- [expression_image](#Table:_expression_image)
- [expression_pub](#Table:_expression_pub)
- [expressionprop](#Table:_expressionprop)
- [feature_expression](#Table:_feature_expression)
- [wwwuser_expression](#Table:_wwwuser_expression)

------------------------------------------------------------------------

## Table: expression_cvterm

| FK | Name | Type | Description |
|----|----|----|----|
|  | expression_cvterm_id | serial | *PRIMARY KEY* |
| [expression](#Table:_expression) | expression_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | cvterm_id | integer | *UNIQUE#1 NOT NULL* |
|  | rank | integer | *NOT NULL* |
| [cvterm](#Table:_cvterm) | cvterm_type_id | integer | *UNIQUE#1 NOT NULL* |

expression_cvterm Structure

Tables referencing this one via Foreign Key Constraints:

- [expression_cvtermprop](#Table:_expression_cvtermprop)

------------------------------------------------------------------------

## Table: expression_image

| FK | Name | Type | Description |
|----|----|----|----|
|  | expression_image_id | serial | *PRIMARY KEY* |
| [expression](#Table:_expression) | expression_id | integer | *UNIQUE#1 NOT NULL* |
| [eimage](#Table:_eimage) | eimage_id | integer | *UNIQUE#1 NOT NULL* |

expression_image Structure

------------------------------------------------------------------------

## Table: expression_pub

| FK | Name | Type | Description |
|----|----|----|----|
|  | expression_pub_id | serial | *PRIMARY KEY* |
| [expression](#Table:_expression) | expression_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

expression_pub Structure

------------------------------------------------------------------------

## Table: feature_expression

| FK | Name | Type | Description |
|----|----|----|----|
|  | feature_expression_id | serial | *PRIMARY KEY* |
| [expression](#Table:_expression) | expression_id | integer | *UNIQUE#1 NOT NULL* |
| [feature](#Table:_feature) | feature_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |

feature_expression Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_expressionprop](#Table:_feature_expressionprop)

------------------------------------------------------------------------

## Table: feature_phenotype

| FK | Name | Type | Description |
|----|----|----|----|
|  | feature_phenotype_id | serial | *PRIMARY KEY* |
| [feature](#Table:_feature) | feature_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](#Table:_phenotype) | phenotype_id | integer | *UNIQUE#1 NOT NULL* |

feature_phenotype Structure

------------------------------------------------------------------------

## Table: phenotype

A phenotypic statement, or a single atomic phenotypic observation, is a
controlled sentence describing observable effects of non-wild type
function. E.g. Obs=eye, attribute=color, cvalue=red.

<table data-border="1" data-cellpadding="3">
<caption>phenotype Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>phenotype_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>observable_id</td>
<td>integer</td>
<td><em></em><br />
<br />
The entity: e.g. anatomy_part, biological_process.</td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>attr_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Phenotypic attribute (quality, property, attribute, character) - drawn
from PATO.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>value</td>
<td>text</td>
<td><em></em><br />
<br />
Value of attribute - unconstrained free text. Used only if cvalue_id is
not appropriate.</td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>cvalue_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Phenotype attribute value (state).</td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>assay_id</td>
<td>integer</td>
<td><em></em><br />
<br />
Evidence type.</td>
</tr>
</tbody>
</table>

phenotype Structure

Tables referencing this one via Foreign Key Constraints:

- [feature_phenotype](#Table:_feature_phenotype)
- [phenotype_comparison](#Table:_phenotype_comparison)
- [phenotype_cvterm](#Table:_phenotype_cvterm)
- [phenstatement](#Table:_phenstatement)
- [wwwuser_phenotype](#Table:_wwwuser_phenotype)

------------------------------------------------------------------------

## Table: phenotype_cvterm

| FK | Name | Type | Description |
|----|----|----|----|
|  | phenotype_cvterm_id | serial | *PRIMARY KEY* |
| [phenotype](#Table:_phenotype) | phenotype_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | cvterm_id | integer | *UNIQUE#1 NOT NULL* |

phenotype_cvterm Structure

------------------------------------------------------------------------

## Table: pub

A documented provenance artefact - publications, documents, personal
communication.

<table data-border="1" data-cellpadding="3">
<caption>pub Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>pub_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>title</td>
<td>text</td>
<td><em></em><br />
<br />
Descriptive general heading.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>volumetitle</td>
<td>text</td>
<td><em></em><br />
<br />
Title of part if one of a series.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>volume</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>series_name</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
Full name of (journal) series.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>issue</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>pyear</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>pages</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
Page number range[s], e.g. 457--459, viii + 664pp, lv--lvii.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>miniref</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>uniquename</td>
<td>text</td>
<td><em>UNIQUE NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="#Table:_cvterm">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
The type of the publication (book, journal, poem, graffiti, etc). Uses
pub cv.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_obsolete</td>
<td>boolean</td>
<td><em>DEFAULT false</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>publisher</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>pubplace</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
</tbody>
</table>

pub Structure

Tables referencing this one via Foreign Key Constraints:

- [expression_pub](#Table:_expression_pub)
- [feature_cvterm](#Table:_feature_cvterm)
- [feature_cvterm_pub](#Table:_feature_cvterm_pub)
- [feature_expression](#Table:_feature_expression)
- [feature_pub](#Table:_feature_pub)
- [feature_relationship_pub](#Table:_feature_relationship_pub)
- [feature_relationshipprop_pub](#Table:_feature_relationshipprop_pub)
- [feature_synonym](#Table:_feature_synonym)
- [featureloc_pub](#Table:_featureloc_pub)
- [featuremap_pub](#Table:_featuremap_pub)
- [featureprop_pub](#Table:_featureprop_pub)
- [library_cvterm](#Table:_library_cvterm)
- [library_pub](#Table:_library_pub)
- [library_synonym](#Table:_library_synonym)
- [phendesc](#Table:_phendesc)
- [phenotype_comparison](#Table:_phenotype_comparison)
- [phenstatement](#Table:_phenstatement)
- [phylonode_pub](#Table:_phylonode_pub)
- [phylotree_pub](#Table:_phylotree_pub)
- [protocol](#Table:_protocol)
- [pub_dbxref](#Table:_pub_dbxref)
- [pub_relationship](#Table:_pub_relationship)
- [pubauthor](#Table:_pubauthor)
- [pubprop](#Table:_pubprop)
- [stock_cvterm](#Table:_stock_cvterm)
- [stock_pub](#Table:_stock_pub)
- [stock_relationship_pub](#Table:_stock_relationship_pub)
- [stockprop_pub](#Table:_stockprop_pub)
- [study](#Table:_study)
- [wwwuser_pub](#Table:_wwwuser_pub)

------------------------------------------------------------------------

## Table: pub_dbxref

Handle links to repositories, e.g. Pubmed, Biosis, zoorec, OCLC,
Medline, ISSN, coden...

| FK                       | Name          | Type    | Description |
|--------------------------|---------------|---------|-------------------------|
|  | pub_dbxref_id | serial | *PRIMARY KEY* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |
| [dbxref](#Table:_dbxref) | dbxref_id | integer | *UNIQUE#1 NOT NULL* |
|  | is_current | boolean | *NOT NULL DEFAULT true* |

pub_dbxref Structure

------------------------------------------------------------------------

## Table: pub_relationship

Handle relationships between publications, e.g. when one publication
makes others obsolete, when one publication contains errata with respect
to other publication(s), or when one publication also appears in another
pub.

| FK                       | Name                | Type    | Description |
|--------------------------|---------------------|---------|---------------------|
|  | pub_relationship_id | serial | *PRIMARY KEY* |
| [pub](#Table:_pub) | subject_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](#Table:_pub) | object_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |

pub_relationship Structure

------------------------------------------------------------------------

## Table: pubauthor

An author for a publication. Note the denormalisation (hence lack of \_
in table name) - this is deliberate as it is in general too hard to
assign IDs to authors.

<table data-border="1" data-cellpadding="3">
<caption>pubauthor Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>pubauthor_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="#Table:_pub">pub</a></p></td>
<td>pub_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Order of author in author list for this pub - order is important.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>editor</td>
<td>boolean</td>
<td><em>DEFAULT false</em><br />
<br />
Indicates whether the author is an editor for linked publication. Note:
this is a boolean field but does not follow the normal chado convention
for naming booleans.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>surname</td>
<td>character varying(100)</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>givennames</td>
<td>character varying(100)</td>
<td><em></em><br />
<br />
First name, initials</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>suffix</td>
<td>character varying(100)</td>
<td><em></em><br />
<br />
Jr., Sr., etc</td>
</tr>
</tbody>
</table>

pubauthor Structure

------------------------------------------------------------------------

## Table: pubprop

Property-value pairs for a pub. Follows standard chado pattern.

| FK                       | Name       | Type    | Description |
|--------------------------|------------|---------|---------------------|
|  | pubprop_id | serial | *PRIMARY KEY* |
| [pub](#Table:_pub) | pub_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | *NOT NULL* |
|  | rank | integer | *UNIQUE#1* |

pubprop Structure

------------------------------------------------------------------------

## Table: organism

The organismal taxonomic classification. Note that phylogenies are
represented using the phylogeny module, and taxonomies can be
represented using the cvterm module or the phylogeny module.

<table data-border="1" data-cellpadding="3">
<caption>organism Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>organism_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>abbreviation</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>genus</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>species</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
A type of organism is always uniquely identified by genus and species.
When mapping from the NCBI taxonomy names.dmp file, this column must be
used where it is present, as the common_name column is not always unique
(e.g. environmental samples). If a particular strain or subspecies is to
be represented, this is appended onto the species name. Follows standard
NCBI taxonomy pattern.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>common_name</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>comment</td>
<td>text</td>
<td><em></em></td>
</tr>
</tbody>
</table>

organism Structure

Tables referencing this one via Foreign Key Constraints:

- [biomaterial](#Table:_biomaterial)
- [feature](#Table:_feature)
- [library](#Table:_library)
- [organism_dbxref](#Table:_organism_dbxref)
- [organismprop](#Table:_organismprop)
- [phylonode_organism](#Table:_phylonode_organism)
- [stock](#Table:_stock)
- [wwwuser_organism](#Table:_wwwuser_organism)

------------------------------------------------------------------------

## Table: organism_dbxref

| FK                           | Name               | Type    | Description |
|------------------------------|--------------------|---------|---------------------|
|  | organism_dbxref_id | serial | *PRIMARY KEY* |
| [organism](#Table:_organism) | organism_id | integer | *UNIQUE#1 NOT NULL* |
| [dbxref](#Table:_dbxref) | dbxref_id | integer | *UNIQUE#1 NOT NULL* |

organism_dbxref Structure

------------------------------------------------------------------------

## Table: organismprop

Tag-value properties - follows standard chado model.

| FK                           | Name            | Type    | Description |
|------------------------------|-----------------|---------|---------------------|
|  | organismprop_id | serial | *PRIMARY KEY* |
| [organism](#Table:_organism) | organism_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](#Table:_cvterm) | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | rank |
| integer | *UNIQUE#1 NOT NULL* |  |  |

organismprop Structure

------------------------------------------------------------------------

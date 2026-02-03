---
title: "Chado General Module"
---
# Chado General Module

  Introduction](#Introduction)
- [Design
  patterns](#Design_patterns)
- [About the
  Tables](#About_the_Tables)
  - [URLs and
    URIs](#URLs_and_URIs)
    - [About
      URL](#About_URL)
    - [About
      URI](#About_URI)
    - [To
      Do](#To_Do)
  - [Identiﬁers
    and Interoperability between Chado
    Instances](#Identi.EF.AC.81ers_and_Interoperability_between_Chado_Instances)
- [Tables](#Tables)
  - [Table:
    db](#Table:_db)
  - [Table:
    dbxref](#Table:_dbxref)
  - [Table:
    project](#Table:_project)
  - [Table:
    tableinfo](#Table:_tableinfo)

# Introduction

General purpose tables are housed in the module general. The primary
purpose of this module is to provide a means of providing data entities
with stable, unique identiﬁers. In Chado, all identiﬁable data entities
have bipartite identiﬁers, consisting of a dbname plus an accession,
together with an optional version suffix.

By convention, these are normally presented using a ’:’ separator. An
example of an identiﬁer in this notation would be GO:0008045 or
FlyBase:FBgn00000001. In the Chado schema the atomic units are the
dbname and the accession, the separator is introduced only in the
presentation layer. Each dbname uniquely identiﬁes the authority
responsible for a particular ID-space (so there cannot be two GO in any
single Chado instance). The accession must be unique within the
ID-space. Thus there can be two accessions 0008045, but there can only
be one data artefact identiﬁed as GO:0008045.

These uniqueness constraints are encoded in the schema, so it is
impossible for any Chado relational database instance to violate them.

Each identiﬁer is stored as a row in the [dbxref table](#Table:_dbxref),
with the dbname stored in the [db table](#Table:_db). Keeping the dbname
in a separate db table ensures that the Chado schema retains its
commitment to normalization. Entries in other tables can refer to
entries in the [dbxref table](#Table:_dbxref) by means of foreign keys.

Note that all stable identiﬁers are stored in the dbxref table, whether
or not they refer to ’external’ data entities. Chado does not have an
explicit notion of a data entity being external. Some dbxrefs have
further information fully ﬂeshed out in other tables in the database,
and others are ’dangling’ dbxrefs.

# Design patterns

- Primary identiﬁers: ENTITY.dbxref id REFERENCES dbxref(dbxref id)
- Secondary identiﬁers: ENTITY DBXREF.dbxref id

# About the Tables

The two main tables are [dbxref](#Table:_dbxref) (for the identiﬁer
itself) and [db](#Table:_db) (for the name of the DB or ID- granting
authority). Giving the database authority its own table, rather than
repeatedly duplicating the name in the dbxref table, retains data
normalization.

A dbxref identiﬁer has two key parts: a db id column that refers to an
entry in the db table, and an accession column, that must be a locally
unique identiﬁer within the db referred to by the db id column. An
optional third column is the version column. Taken together, these 3
columns constitute a unique key.

The db is a database authority. Typical dbs in bioinformatics are
FlyBase, GO, UniProt, NCBI, MGI, etc. The authority is generally known
by this sortened form (the db.name, which is unique within the
bioinformatics and biomedical realm. See below for more on uniqueness.
This name is typically in short mnemonic (but human-friendly) form, and
uniquely identiﬁes the DB/authority (enforced by uniqueness constraint).
Short human-friendly names are encouraged, although longer names (such
as full LSID preﬁxes) may also be used. The name should be a valid XML
NMTOKEN (see XML speciﬁcation for details) - for example, it should not
start with a number. This constraint is to help syntactic
interoperability with other identiﬁer schemes. To ensure
interoperability with other Chado databases, the same db.names should be
used (e.g. _FlyBase_ should be used consistently instead of _FB_). This
will prevent duplicate dbxref rows being created if and when databases
are merged. At the same time, uniqueness must be preserved: there must
not be two GOs.

## URLs and URIs

See the following for background:

- <a href="http://en.wikipedia.org/wiki/Uniform_Resource_Identifier"
  class="external free"
  rel="nofollow">http://en.wikipedia.org/wiki/Uniform_Resource_Identifier</a>
- <a href="http://en.wikipedia.org/wiki/URL" class="external free"
  rel="nofollow">http://en.wikipedia.org/wiki/URL</a>

Basically, a URI is an addressing scheme. The form of URI most people
are familiar with are URLs; but not all URIs are URLs. Another URI
addressing scheme is the URN; for example, LSIDs use URNs.

People often expect URLs to be resolvable using standard technology
(e.g. a web browser) to a resource intended for humans, but this isn’t
always the case. URNs may require other software to resolve them; e.g.
an LSID resolver.

This column is nullable, so it is possible to defer decision on what the
unique URI for a particular authority is if this information is not
known up-front. See below for mechanisms for assigning URIs to DBs and
ensuring uniqueness.

Note that it is perfectly acceptable for the db.name column to be the
same as the url column (provided it is a valid URI). However, it is
encouraged that a short form is used as the db.name.

### About URL

A W3C compliant URL with the address of a website containing information
about the DB or authority. For example,
<a href="http://www.ﬂybase.org" class="external free"

<a href="http://www.geneontology.org" class="external free"

humans rather than software agents.

### About URI

A W3C compliant URI that contains a unique namespace for the
DB/authority. Some ID schemes (e.g. LSID) require this. The URI is
intended for software agents rather than humans. It does not need to be
a resolvable URL. However, certain DBs may prefer the URI to be a
resolvable URL that has human-readable information on the other end.
Other DBs may provide URNs (e.g. LSID URNs) that require software agents
to be resolved.

### To Do

**The [db table](#Table:_db) probably should have columns for both URL
and URI.** The former is intended just to go to a website like the
FlyBase or GO home page. The latter is intended as a globally unique
addressing scheme that should be interoperable with other schemes. For
example GO may be a unique identiﬁer for the Gene Ontology ID space by
ﬁat within the bioinformatics community, but not outside. Although Chado
only cares about the former, it may have to interoperate with schemes
that care about truly global uniqueness, hence URIs.

## Identiﬁers and Interoperability between Chado Instances

# Tables

## Table: db

The db table contains one row per database authority, that is, one row
per curator/creator of bioinformatic data collections. Typical databases
in bioinformatics are FlyBase, GO, UniProt, NCBI, MGI, etc. The
authority is generally known by this shortened form, which is unique
within the bioinformatics and biomedical realm. To Do - add support for
URIs, URNs (e.g. LSIDs). We can do this by treating the URL as a URI -
however, some applications may expect this to be resolvable - to be
decided.

| F-Key | Name        | Type                   | Description       | ----- | ----------- | ---------------------- | ----------------- |       | db_id       | serial                 | _PRIMARY KEY_     |       | name        | character varying(255) | _UNIQUE NOT NULL_ |       | description | character varying(255) | urlprefix   | character varying(255) | url         | character varying(255) db Structure

Tables referencing this one via Foreign Key Constraints:

- [dbxref](/wiki/Chado_Tables#Table:_dbxref)

---

## Table: dbxref

The dbxref table contains one row per version per collection of
bioinformatic data, one row per Chado "database". The table provides a
unique, global, public, stable identifier that can be used to reference
a database version. Not necessarily an external reference - can
reference data items inside the particular chado instance being used.
Typically a row in a table can be uniquely identified with a primary
identifier (called dbxref_id); a table may also have secondary
identifiers (in a linking table \<T\>\_dbxref). A dbxref is generally
written as \<DB\>:\<ACCESSION\> or as \<DB\>:\<ACCESSION\>:\<VERSION\>.

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
<th>F-Key</th>
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
<td><p><a href="/wiki/Chado_Tables#Table:_db"
title="Chado Tables">db</a></p></td>
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

- [arraydesign](/wiki/Chado_Tables#Table:_arraydesign)
- [assay](/wiki/Chado_Tables#Table:_assay)
- [biomaterial](/wiki/Chado_Tables#Table:_biomaterial)
- [biomaterial_dbxref](/wiki/Chado_Tables#Table:_biomaterial_dbxref)
- [cvterm](/wiki/Chado_Tables#Table:_cvterm)
- [cvterm_dbxref](/wiki/Chado_Tables#Table:_cvterm_dbxref)
- [dbxrefprop](/wiki/Chado_Tables#Table:_dbxrefprop)
- [element](/wiki/Chado_Tables#Table:_element)
- [feature](/wiki/Chado_Tables#Table:_feature)
- [feature_cvterm_dbxref](/wiki/Chado_Tables#Table:_feature_cvterm_dbxref)
- [feature_dbxref](/wiki/Chado_Tables#Table:_feature_dbxref)
- [organism_dbxref](/wiki/Chado_Tables#Table:_organism_dbxref)
- [phylonode_dbxref](/wiki/Chado_Tables#Table:_phylonode_dbxref)
- [phylotree](/wiki/Chado_Tables#Table:_phylotree)
- [protocol](/wiki/Chado_Tables#Table:_protocol)
- [pub_dbxref](/wiki/Chado_Tables#Table:_pub_dbxref)
- [stock](/wiki/Chado_Tables#Table:_stock)
- [stock_dbxref](/wiki/Chado_Tables#Table:_stock_dbxref)
- [study](/wiki/Chado_Tables#Table:_study)

---

## Table: project

| F-Key | Name        | Type                   | Description       | ----- | ----------- | ---------------------- | ----------------- |       | project_id  | serial                 | _PRIMARY KEY_     |       | name        | character varying(255) | _UNIQUE NOT NULL_ |       | description | character varying(255) | _NOT NULL_        |

project Structure

Tables referencing this one via Foreign Key Constraints:

- [assay_project](/wiki/Chado_Tables#Table:_assay_project)
- [wwwuser_project](/wiki/Chado_Tables#Table:_wwwuser_project)

---

## Table: tableinfo

| F-Key | Name                | Type                  | Description              | ----- | ------------------- | --------------------- | ------------------------ |       | tableinfo_id        | serial                | _PRIMARY KEY_            |       | name                | character varying(30) | _UNIQUE NOT NULL_        |       | primary_key_column  | character varying(30) | is_view             | integer               | _NOT NULL_               |       | view_on_table_id    | integer               | superclass_table_id | integer               | is_updateable       | integer               | _NOT NULL DEFAULT 1_     |       | modification_date   | date                  | _NOT NULL DEFAULT now()_ |

tableinfo Structure

Tables referencing this one via Foreign Key Constraints:

- [control](/wiki/Chado_Tables#Table:_control)
- [magedocumentation](/wiki/Chado_Tables#Table:_magedocumentation)

---

---
title: "Chado WWW Module"
---
# Chado WWW Module

  Introduction](#Introduction)
- [Tables](#Tables)
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

# Introduction

# Tables

## Table: wwwuser

Keep track of WWW users. This may also be useful in an audit module at
some point.

| F-Key | Name       | Type                   | Description       | ----- | ---------- | ---------------------- | ----------------- |       | wwwuser_id | serial                 | _PRIMARY KEY_     |       | username   | character varying(32)  | _UNIQUE NOT NULL_ |       | password   | character varying(32)  | _NOT NULL_        |       | email      | character varying(128) | _NOT NULL_        |       | profile    | text                   wwwuser Structure

Tables referencing this one via Foreign Key Constraints:

- [wwwuser_cvterm](Chado_Tables#Table:_wwwuser_cvterm "Chado Tables")
- [wwwuser_expression](Chado_Tables#Table:_wwwuser_expression "Chado Tables")
- [wwwuser_feature](Chado_Tables#Table:_wwwuser_feature "Chado Tables")
- [wwwuser_genotype](Chado_Tables#Table:_wwwuser_genotype "Chado Tables")
- [wwwuser_organism](Chado_Tables#Table:_wwwuser_organism "Chado Tables")
- [wwwuser_phenotype](Chado_Tables#Table:_wwwuser_phenotype "Chado Tables")
- [wwwuser_project](Chado_Tables#Table:_wwwuser_project "Chado Tables")
- [wwwuser_pub](Chado_Tables#Table:_wwwuser_pub "Chado Tables")
- [wwwuserrelationship](Chado_Tables#Table:_wwwuserrelationship "Chado Tables")

---

## Table: wwwuser_cvterm

Track wwwuser interest in cvterms.

| F-Key                                                 | Name              | Type     | Description          | ----------------------------------------------------- | ----------------- | -------- | -------------------- |                                                       | wwwuser_cvterm_id | serial   | _PRIMARY KEY_        | [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables") | wwwuser_id        | integer  | _UNIQUE#1 NOT NULL_  | [cvterm](Chado_Tables#Table:_cvterm "Chado Tables")   | cvterm_id         | integer  | _UNIQUE#1 NOT NULL_  |                                                       | world_read        | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_cvterm Structure

---

## Table: wwwuser_expression

Track wwwuser interest in expressions.

| F-Key                                                       | Name                  | Type     | Description          | ----------------------------------------------------------- | --------------------- | -------- | -------------------- |                                                             | wwwuser_expression_id | serial   | _PRIMARY KEY_        | [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables")       | wwwuser_id            | integer  | _UNIQUE#1 NOT NULL_  | [expression](Chado_Tables#Table:_expression "Chado Tables") | expression_id         | integer  | _UNIQUE#1 NOT NULL_  |                                                             | world_read            | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_expression Structure

---

## Table: wwwuser_feature

Track wwwuser interest in features.

| F-Key                                                 | Name               | Type     | Description          | ----------------------------------------------------- | ------------------ | -------- | -------------------- |                                                       | wwwuser_feature_id | serial   | _PRIMARY KEY_        | [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables") | wwwuser_id         | integer  | _UNIQUE#1 NOT NULL_  | [feature](Chado_Tables#Table:_feature "Chado Tables") | feature_id         | integer  | _UNIQUE#1 NOT NULL_  |                                                       | world_read         | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_feature Structure

---

## Table: wwwuser_genotype

Track wwwuser interest in genotypes.

| F-Key                                                   | Name                | Type     | Description          | ------------------------------------------------------- | ------------------- | -------- | -------------------- |                                                         | wwwuser_genotype_id | serial   | _PRIMARY KEY_        | [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables")   | wwwuser_id          | integer  | _UNIQUE#1 NOT NULL_  | [genotype](Chado_Tables#Table:_genotype "Chado Tables") | genotype_id         | integer  | _UNIQUE#1 NOT NULL_  |                                                         | world_read          | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_genotype Structure

---

## Table: wwwuser_organism

Track wwwuser interest in organisms.

| F-Key                                                   | Name                | Type     | Description          | ------------------------------------------------------- | ------------------- | -------- | -------------------- |                                                         | wwwuser_organism_id | serial   | _PRIMARY KEY_        | [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables")   | wwwuser_id          | integer  | _UNIQUE#1 NOT NULL_  | [organism](Chado_Tables#Table:_organism "Chado Tables") | organism_id         | integer  | _UNIQUE#1 NOT NULL_  |                                                         | world_read          | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_organism Structure

---

## Table: wwwuser_phenotype

Track wwwuser interest in phenotypes.

| F-Key                                                     | Name                 | Type     | Description          | --------------------------------------------------------- | -------------------- | -------- | -------------------- |                                                           | wwwuser_phenotype_id | serial   | _PRIMARY KEY_        | [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables")     | wwwuser_id           | integer  | _UNIQUE#1 NOT NULL_  | [phenotype](Chado_Tables#Table:_phenotype "Chado Tables") | phenotype_id         | integer  | _UNIQUE#1 NOT NULL_  |                                                           | world_read           | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_phenotype Structure

---

## Table: wwwuser_project

Link wwwuser accounts to projects

| F-Key                                                 | Name               | Type     | Description          | ----------------------------------------------------- | ------------------ | -------- | -------------------- |                                                       | wwwuser_project_id | serial   | _PRIMARY KEY_        | [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables") | wwwuser_id         | integer  | _UNIQUE#1 NOT NULL_  | [project](Chado_Tables#Table:_project "Chado Tables") | project_id         | integer  | _UNIQUE#1 NOT NULL_  |                                                       | world_read         | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_project Structure

---

## Table: wwwuser_pub

Track wwwuser interest in publications.

| F-Key                                                 | Name           | Type     | Description          | ----------------------------------------------------- | -------------- | -------- | -------------------- |                                                       | wwwuser_pub_id | serial   | _PRIMARY KEY_        | [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables") | wwwuser_id     | integer  | _UNIQUE#1 NOT NULL_  | [pub](Chado_Tables#Table:_pub "Chado Tables")         | pub_id         | integer  | _UNIQUE#1 NOT NULL_  |                                                       | world_read     | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_pub Structure

---

## Table: wwwuserrelationship

Track wwwuser interest in other wwwusers.

| F-Key                                                 | Name                   | Type     | Description          | ----------------------------------------------------- | ---------------------- | -------- | -------------------- |                                                       | wwwuserrelationship_id | serial   | _PRIMARY KEY_        | [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables") | objwwwuser_id          | integer  | _UNIQUE#1 NOT NULL_  | [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables") | subjwwwuser_id         | integer  | _UNIQUE#1 NOT NULL_  |                                                       | world_read             | smallint | _NOT NULL DEFAULT 1_ |

wwwuserrelationship Structure

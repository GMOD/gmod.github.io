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

| F-Key | Name | Type | Description | ----- | ---------- | ---------------------- | ----------------- | | wwwuser_id | serial | _PRIMARY KEY_ | | username | character varying(32) | _UNIQUE NOT NULL_ | | password | character varying(32) | _NOT NULL_ | | email | character varying(128) | _NOT NULL_ | | profile | text wwwuser Structure

Tables referencing this one via Foreign Key Constraints:

- [wwwuser_cvterm](/wiki/Chado_Tables#Table:_wwwuser_cvterm)
- [wwwuser_expression](/wiki/Chado_Tables#Table:_wwwuser_expression)
- [wwwuser_feature](/wiki/Chado_Tables#Table:_wwwuser_feature)
- [wwwuser_genotype](/wiki/Chado_Tables#Table:_wwwuser_genotype)
- [wwwuser_organism](/wiki/Chado_Tables#Table:_wwwuser_organism)
- [wwwuser_phenotype](/wiki/Chado_Tables#Table:_wwwuser_phenotype)
- [wwwuser_project](/wiki/Chado_Tables#Table:_wwwuser_project)
- [wwwuser_pub](/wiki/Chado_Tables#Table:_wwwuser_pub)
- [wwwuserrelationship](/wiki/Chado_Tables#Table:_wwwuserrelationship)

---

## Table: wwwuser_cvterm

Track wwwuser interest in cvterms.

| F-Key | Name | Type | Description | ----------------------------------------------------- | ----------------- | -------- | -------------------- | | wwwuser_cvterm_id | serial | _PRIMARY KEY_ | [wwwuser](/wiki/Chado_Tables#Table:_wwwuser) | wwwuser_id | integer | _UNIQUE#1 NOT NULL_ | [cvterm](/wiki/Chado_Tables#Table:_cvterm) | cvterm_id | integer | _UNIQUE#1 NOT NULL_ | | world_read | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_cvterm Structure

---

## Table: wwwuser_expression

Track wwwuser interest in expressions.

| F-Key | Name | Type | Description | ----------------------------------------------------------- | --------------------- | -------- | -------------------- | | wwwuser_expression_id | serial | _PRIMARY KEY_ | [wwwuser](/wiki/Chado_Tables#Table:_wwwuser) | wwwuser_id | integer | _UNIQUE#1 NOT NULL_ | [expression](/wiki/Chado_Tables#Table:_expression) | expression_id | integer | _UNIQUE#1 NOT NULL_ | | world_read | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_expression Structure

---

## Table: wwwuser_feature

Track wwwuser interest in features.

| F-Key | Name | Type | Description | ----------------------------------------------------- | ------------------ | -------- | -------------------- | | wwwuser_feature_id | serial | _PRIMARY KEY_ | [wwwuser](/wiki/Chado_Tables#Table:_wwwuser) | wwwuser_id | integer | _UNIQUE#1 NOT NULL_ | [feature](/wiki/Chado_Tables#Table:_feature) | feature_id | integer | _UNIQUE#1 NOT NULL_ | | world_read | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_feature Structure

---

## Table: wwwuser_genotype

Track wwwuser interest in genotypes.

| F-Key | Name | Type | Description | ------------------------------------------------------- | ------------------- | -------- | -------------------- | | wwwuser_genotype_id | serial | _PRIMARY KEY_ | [wwwuser](/wiki/Chado_Tables#Table:_wwwuser) | wwwuser_id | integer | _UNIQUE#1 NOT NULL_ | [genotype](/wiki/Chado_Tables#Table:_genotype) | genotype_id | integer | _UNIQUE#1 NOT NULL_ | | world_read | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_genotype Structure

---

## Table: wwwuser_organism

Track wwwuser interest in organisms.

| F-Key | Name | Type | Description | ------------------------------------------------------- | ------------------- | -------- | -------------------- | | wwwuser_organism_id | serial | _PRIMARY KEY_ | [wwwuser](/wiki/Chado_Tables#Table:_wwwuser) | wwwuser_id | integer | _UNIQUE#1 NOT NULL_ | [organism](/wiki/Chado_Tables#Table:_organism) | organism_id | integer | _UNIQUE#1 NOT NULL_ | | world_read | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_organism Structure

---

## Table: wwwuser_phenotype

Track wwwuser interest in phenotypes.

| F-Key | Name | Type | Description | --------------------------------------------------------- | -------------------- | -------- | -------------------- | | wwwuser_phenotype_id | serial | _PRIMARY KEY_ | [wwwuser](/wiki/Chado_Tables#Table:_wwwuser) | wwwuser_id | integer | _UNIQUE#1 NOT NULL_ | [phenotype](/wiki/Chado_Tables#Table:_phenotype) | phenotype_id | integer | _UNIQUE#1 NOT NULL_ | | world_read | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_phenotype Structure

---

## Table: wwwuser_project

Link wwwuser accounts to projects

| F-Key | Name | Type | Description | ----------------------------------------------------- | ------------------ | -------- | -------------------- | | wwwuser_project_id | serial | _PRIMARY KEY_ | [wwwuser](/wiki/Chado_Tables#Table:_wwwuser) | wwwuser_id | integer | _UNIQUE#1 NOT NULL_ | [project](/wiki/Chado_Tables#Table:_project) | project_id | integer | _UNIQUE#1 NOT NULL_ | | world_read | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_project Structure

---

## Table: wwwuser_pub

Track wwwuser interest in publications.

| F-Key | Name | Type | Description | ----------------------------------------------------- | -------------- | -------- | -------------------- | | wwwuser_pub_id | serial | _PRIMARY KEY_ | [wwwuser](/wiki/Chado_Tables#Table:_wwwuser) | wwwuser_id | integer | _UNIQUE#1 NOT NULL_ | [pub](/wiki/Chado_Tables#Table:_pub) | pub_id | integer | _UNIQUE#1 NOT NULL_ | | world_read | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_pub Structure

---

## Table: wwwuserrelationship

Track wwwuser interest in other wwwusers.

| F-Key | Name | Type | Description | ----------------------------------------------------- | ---------------------- | -------- | -------------------- | | wwwuserrelationship_id | serial | _PRIMARY KEY_ | [wwwuser](/wiki/Chado_Tables#Table:_wwwuser) | objwwwuser_id | integer | _UNIQUE#1 NOT NULL_ | [wwwuser](/wiki/Chado_Tables#Table:_wwwuser) | subjwwwuser_id | integer | _UNIQUE#1 NOT NULL_ | | world_read | smallint | _NOT NULL DEFAULT 1_ |

wwwuserrelationship Structure

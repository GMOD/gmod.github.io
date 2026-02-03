---
title: "Chado Tutorial 2012"
---
# Chado Tutorial 2012

This <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a>
tutorial was presented by [Scott Cain](/wiki/User:Scott) as part
of the [2012 GMOD Summer
School](/wiki/2012_GMOD_Summer_School).

To follow along with the tutorial, you will need to use **AMI ID:
ami-ad2f98c4, name: GMOD 2012 final day**, available in the US East (N.
Virginia) region. See the [GMOD Cloud
Tutorial](/wiki/GMOD_Cloud_Tutorial) for information on
how to get this AMI.

Chado is the database schema of the GMOD project. This session
introduces database concepts, and then provides an overview of Chado's
design and architecture, and then goes into detail about how to use a
Chado database.

  Theory](#Theory)
  - [Introduction](#Introduction)
    - [Database
      Terminology](#Database_Terminology)
      - [What's a
        database?](#What.27s_a_database.3F)
      - [SQL](#SQL)
  - [Why
    Chado?](#Why_Chado.3F)
  - [Chado
    Architecture: Modules](#Chado_Architecture:_Modules)
    - [Extensible](#Extensible)
    - [Plus](#Plus)
    - [Module
      Caveats](#Module_Caveats)
  - [Exploring
    the schema](#Exploring_the_schema)
    - [Sequence Module](#Sequence_Module)
      - [Features](#Features)
    - [CV
      (Controlled Vocabularies)
      Module](#CV_.28Controlled_Vocabularies.29_Module)
      - [Controlled
        Vocabularies](#Controlled_Vocabularies)
      - [Ontologies](#Ontologies)
      - [CVs and Ontologies in
        Chado](#CVs_and_Ontologies_in_Chado)
        - [Data Integrity](#Data_Integrity)
        - [Data Portability and
          Standardization](#Data_Portability_and_Standardization)
        - [Complexity](#Complexity)
    - [Opening our sample
      database](#Opening_our_sample_database)
    - [Our
      first example query](#Our_first_example_query)
    - [General Module](#General_Module)
      - [IDs](#IDs)
        - [Public IDs](#Public_IDs)
        - [Private IDs](#Private_IDs)
      - [IDs in Chado](#IDs_in_Chado)
    - [Properties](#Properties)
      - [Relationships](#Relationships)
      - [Locations](#Locations)
        - [Interbase
          Coordinates](#Interbase_Coordinates)
        - [Location
          Chains](#Location_Chains)
        - [featureloc
          Table](#featureloc_Table)
      - [Example: Gene](#Example:_Gene)
      - [Example: Computational
        Analysis](#Example:_Computational_Analysis)
      - [Other Feature
        Annotations](#Other_Feature_Annotations)
      - [Extending Chado: Properties tables and new
        modules](#Extending_Chado:_Properties_tables_and_new_modules)
- [Practice](#Practice)
  - [Prerequisites](#Prerequisites)
    - [PostgreSQL](#PostgreSQL)
      - [Edit config
        files](#Edit_config_files)
      - [Create a gmod
        user](#Create_a_gmod_user)
      - [Installing DBIx::DBStag by
        hand](#Installing_DBIx::DBStag_by_hand)
    - [BioPerl](#BioPerl)
    - [Let's
      Go!](#Let.27s_Go.21)
    - [Environment
      Variables](#Environment_Variables)
  - [Installing
    GMOD](#Installing_GMOD)
    - [Saving
      your progress to this
      point](#Saving_your_progress_to_this_point)
    - [A Note
      about Redos](#A_Note_about_Redos)
  - [Preparing
    GFF data for loading](#Preparing_GFF_data_for_loading)
    - [Working with Large GFF
      files](#Working_with_Large_GFF_files)
    - [Loading GFF3](#Loading_GFF3)
    - [Capturing the output to check for
      problems](#Capturing_the_output_to_check_for_problems)
    - [Really
      loading data](#Really_loading_data)
      - [Adding our
        organism](#Adding_our_organism)
      - [Try again](#Try_again)
  - [Loading
    other data](#Loading_other_data)
- [Chado for
  Expression, Genotype, Phenotype, and Natural
  Diversity](#Chado_for_Expression.2C_Genotype.2C_Phenotype.2C_and_Natural_Diversity)
  - [Expression](#Expression)
    - [What
      defines an expression
      pattern?](#What_defines_an_expression_pattern.3F)
    - [How
      does Chado deal with this
      variety?](#How_does_Chado_deal_with_this_variety.3F)
    - [FlyBase Example](#FlyBase_Example)
    - [Chado
      Allows](#Chado_Allows)
    - [Table:
      expression](#Table:_expression)
    - [Table:
      expression_cvterm](#Table:_expression_cvterm)
  - [Genotype](#Genotype)
    - [Table:
      genotype](#Table:_genotype)
    - [Table:
      feature_genotype](#Table:_feature_genotype)
  - [Environment](#Environment)
    - [Table:
      environment](#Table:_environment)
    - [Table:
      environment_cvterm](#Table:_environment_cvterm)
  - [Phenotype,
    Natural Diversity and Atlas
    Support](#Phenotype.2C_Natural_Diversity_and_Atlas_Support)

## Theory

### Introduction

#### Database Terminology

Or six years of school in 15 minutes or less.

- [A Brief Guide to
  Databases](/wiki/A_Brief_Guide_to_Databases)
- [Chado Tables](/wiki/Chado_Tables)

##### What's a [database](/wiki/Databases_and_GMOD)?

- Chado is a [schema](/wiki/Glossary#Schema), a database design - a
  blueprint for a database containing genomic data
- Distinct from
  - [Database Management System
    (DBMS)](/wiki/Glossary#Database_Management_System)
    - Software system for storing databases
    - *e.g.,* Oracle, [PostgreSQL](/wiki/PostgreSQL),
      [MySQL](/wiki/MySQL)
  - Database, a very loose term
    - Any set of organized data that is readable by a computer
    - A web site with database driven content, e.g., FlyBase
    - Schema + DBMS + Data

##### SQL

SQL is a standardized query language for defining and manipulating
databases. Chado uses it. SQL is supported by all major DBMSs.

[FlyBase Field Mapping
Tables](/wiki/FlyBase_Field_Mapping_Tables)
shows some example SQL that queries the FlyBase Chado database. (Caveat:
FlyBase sometimes uses Chado in ways that no other organizations do.)

**Will SQL be on the test?**

No, we aren't going to teach in-depth SQL in this course but we will use
it in examples and show how to write queries in Chado.

You *can* do basics with Chado without knowing SQL. Many common tasks
already have scripts written for them. However, as you get more into
using Chado, you will find that a working knowledge of SQL is necessary.

### Why Chado?

- **Integration**
  - Supports many types of data, integrates with many tools
- **Modular**
  - Use only what you need, ignore the rest
- **Extensible**
  - Write your own modules and properties
- **Widely used**
  -  - Chado started here,
    large diverse dataset and organization

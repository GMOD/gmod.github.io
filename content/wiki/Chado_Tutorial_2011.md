---
title: "Chado Tutorial 2011"
---




<span id="top"></span>




# <span dir="auto">Chado Tutorial 2011</span>









This <a href="Chado" class="mw-redirect" title="Chado">Chado</a>
tutorial was presented by [Scott Cain](User%253AScott "User%253AScott") as part
of the [2011 GMOD Spring
Training](2011_GMOD_Spring_Training "2011 GMOD Spring Training").

Chado is the database schema of the GMOD project. This session
introduces database concepts, and then provides an overview of Chado's
design and architecture, and then goes into detail about how to use a
Chado database.


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Theory</span>](#Theory)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">Introduction</span>](#Introduction)
    - [<span class="tocnumber">1.1.1</span>
      <span class="toctext">Database
      Terminology</span>](#Database_Terminology)
      - [<span class="tocnumber">1.1.1.1</span>
        <span class="toctext">What's a
        database?</span>](#What.27s_a_database.3F)
      - [<span class="tocnumber">1.1.1.2</span>
        <span class="toctext">SQL</span>](#SQL)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Why
    Chado?</span>](#Why_Chado.3F)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Chado
    Architecture: Modules</span>](#Chado_Architecture:_Modules)
    - [<span class="tocnumber">1.3.1</span>
      <span class="toctext">Extensible</span>](#Extensible)
    - [<span class="tocnumber">1.3.2</span>
      <span class="toctext">Plus</span>](#Plus)
    - [<span class="tocnumber">1.3.3</span> <span class="toctext">Module
      Caveats</span>](#Module_Caveats)
  - [<span class="tocnumber">1.4</span> <span class="toctext">Exploring
    the schema</span>](#Exploring_the_schema)
    - [<span class="tocnumber">1.4.1</span>
      <span class="toctext">Sequence Module</span>](#Sequence_Module)
      - [<span class="tocnumber">1.4.1.1</span>
        <span class="toctext">Features</span>](#Features)
    - [<span class="tocnumber">1.4.2</span> <span class="toctext">CV
      (Controlled Vocabularies)
      Module</span>](#CV_.28Controlled_Vocabularies.29_Module)
      - [<span class="tocnumber">1.4.2.1</span>
        <span class="toctext">Controlled
        Vocabularies</span>](#Controlled_Vocabularies)
      - [<span class="tocnumber">1.4.2.2</span>
        <span class="toctext">Ontologies</span>](#Ontologies)
      - [<span class="tocnumber">1.4.2.3</span>
        <span class="toctext">CVs and Ontologies in
        Chado</span>](#CVs_and_Ontologies_in_Chado)
        - [<span class="tocnumber">1.4.2.3.1</span>
          <span class="toctext">Data Integrity</span>](#Data_Integrity)
        - [<span class="tocnumber">1.4.2.3.2</span>
          <span class="toctext">Data Portability and
          Standardization</span>](#Data_Portability_and_Standardization)
        - [<span class="tocnumber">1.4.2.3.3</span>
          <span class="toctext">Complexity</span>](#Complexity)
    - [<span class="tocnumber">1.4.3</span>
      <span class="toctext">Opening our sample
      database</span>](#Opening_our_sample_database)
    - [<span class="tocnumber">1.4.4</span> <span class="toctext">Our
      first example query</span>](#Our_first_example_query)
    - [<span class="tocnumber">1.4.5</span>
      <span class="toctext">General Module</span>](#General_Module)
      - [<span class="tocnumber">1.4.5.1</span>
        <span class="toctext">IDs</span>](#IDs)
        - [<span class="tocnumber">1.4.5.1.1</span>
          <span class="toctext">Public IDs</span>](#Public_IDs)
        - [<span class="tocnumber">1.4.5.1.2</span>
          <span class="toctext">Private IDs</span>](#Private_IDs)
      - [<span class="tocnumber">1.4.5.2</span>
        <span class="toctext">IDs in Chado</span>](#IDs_in_Chado)
    - [<span class="tocnumber">1.4.6</span>
      <span class="toctext">Properties</span>](#Properties)
      - [<span class="tocnumber">1.4.6.1</span>
        <span class="toctext">Relationships</span>](#Relationships)
      - [<span class="tocnumber">1.4.6.2</span>
        <span class="toctext">Locations</span>](#Locations)
        - [<span class="tocnumber">1.4.6.2.1</span>
          <span class="toctext">Interbase
          Coordinates</span>](#Interbase_Coordinates)
        - [<span class="tocnumber">1.4.6.2.2</span>
          <span class="toctext">Location
          Chains</span>](#Location_Chains)
        - [<span class="tocnumber">1.4.6.2.3</span>
          <span class="toctext">featureloc
          Table</span>](#featureloc_Table)
      - [<span class="tocnumber">1.4.6.3</span>
        <span class="toctext">Example: Gene</span>](#Example:_Gene)
      - [<span class="tocnumber">1.4.6.4</span>
        <span class="toctext">Example: Computational
        Analysis</span>](#Example:_Computational_Analysis)
      - [<span class="tocnumber">1.4.6.5</span>
        <span class="toctext">Other Feature
        Annotations</span>](#Other_Feature_Annotations)
      - [<span class="tocnumber">1.4.6.6</span>
        <span class="toctext">Extending Chado: Properties tables and new
        modules</span>](#Extending_Chado:_Properties_tables_and_new_modules)
- [<span class="tocnumber">2</span>
  <span class="toctext">Practice</span>](#Practice)
  - [<span class="tocnumber">2.1</span>
    <span class="toctext">Prerequisites</span>](#Prerequisites)
    - [<span class="tocnumber">2.1.1</span>
      <span class="toctext">PostgreSQL</span>](#PostgreSQL)
      - [<span class="tocnumber">2.1.1.1</span>
        <span class="toctext">Edit config
        files</span>](#Edit_config_files)
      - [<span class="tocnumber">2.1.1.2</span>
        <span class="toctext">Create a gmod
        user</span>](#Create_a_gmod_user)
      - [<span class="tocnumber">2.1.1.3</span>
        <span class="toctext">Installing DBIx::DBStag by
        hand</span>](#Installing_DBIx::DBStag_by_hand)
    - [<span class="tocnumber">2.1.2</span>
      <span class="toctext">BioPerl</span>](#BioPerl)
    - [<span class="tocnumber">2.1.3</span>
      <span class="toctext">Apache</span>](#Apache)
    - [<span class="tocnumber">2.1.4</span> <span class="toctext">Let's
      Go!</span>](#Let.27s_Go.21)
    - [<span class="tocnumber">2.1.5</span>
      <span class="toctext">Environment
      Variables</span>](#Environment_Variables)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Installing
    GMOD</span>](#Installing_GMOD)
    - [<span class="tocnumber">2.2.1</span> <span class="toctext">Saving
      your progress to this
      point</span>](#Saving_your_progress_to_this_point)
    - [<span class="tocnumber">2.2.2</span> <span class="toctext">A Note
      about installing GO</span>](#A_Note_about_installing_GO)
    - [<span class="tocnumber">2.2.3</span> <span class="toctext">A Note
      about Redos</span>](#A_Note_about_Redos)
    - [<span class="tocnumber">2.2.4</span> <span class="toctext">Reload
      a new copy of the DB with ontologies in
      it</span>](#Reload_a_new_copy_of_the_DB_with_ontologies_in_it)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Preparing
    GFF data for loading</span>](#Preparing_GFF_data_for_loading)
    - [<span class="tocnumber">2.3.1</span>
      <span class="toctext">Working with Large GFF
      files</span>](#Working_with_Large_GFF_files)
    - [<span class="tocnumber">2.3.2</span> <span class="toctext">Minor
      Edit</span>](#Minor_Edit)
    - [<span class="tocnumber">2.3.3</span>
      <span class="toctext">Loading GFF3</span>](#Loading_GFF3)
    - [<span class="tocnumber">2.3.4</span>
      <span class="toctext">Capturing the output to check for
      problems</span>](#Capturing_the_output_to_check_for_problems)
    - [<span class="tocnumber">2.3.5</span> <span class="toctext">Really
      loading data</span>](#Really_loading_data)
      - [<span class="tocnumber">2.3.5.1</span>
        <span class="toctext">Adding our
        organism</span>](#Adding_our_organism)
      - [<span class="tocnumber">2.3.5.2</span>
        <span class="toctext">Try again</span>](#Try_again)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Loading
    other data</span>](#Loading_other_data)
- [<span class="tocnumber">3</span> <span class="toctext">Chado for
  Expression, Genotype, Phenotype, and Natural
  Diversity</span>](#Chado_for_Expression.2C_Genotype.2C_Phenotype.2C_and_Natural_Diversity)
  - [<span class="tocnumber">3.1</span>
    <span class="toctext">Expression</span>](#Expression)
    - [<span class="tocnumber">3.1.1</span> <span class="toctext">What
      defines an expression
      pattern?</span>](#What_defines_an_expression_pattern.3F)
    - [<span class="tocnumber">3.1.2</span> <span class="toctext">How
      does Chado deal with this
      variety?</span>](#How_does_Chado_deal_with_this_variety.3F)
    - [<span class="tocnumber">3.1.3</span>
      <span class="toctext">FlyBase Example</span>](#FlyBase_Example)
    - [<span class="tocnumber">3.1.4</span> <span class="toctext">Chado
      Allows</span>](#Chado_Allows)
    - [<span class="tocnumber">3.1.5</span> <span class="toctext">Table:
      expression</span>](#Table:_expression)
    - [<span class="tocnumber">3.1.6</span> <span class="toctext">Table:
      expression_cvterm</span>](#Table:_expression_cvterm)
  - [<span class="tocnumber">3.2</span>
    <span class="toctext">Genotype</span>](#Genotype)
    - [<span class="tocnumber">3.2.1</span> <span class="toctext">Table:
      genotype</span>](#Table:_genotype)
    - [<span class="tocnumber">3.2.2</span> <span class="toctext">Table:
      feature_genotype</span>](#Table:_feature_genotype)
  - [<span class="tocnumber">3.3</span>
    <span class="toctext">Environment</span>](#Environment)
    - [<span class="tocnumber">3.3.1</span> <span class="toctext">Table:
      environment</span>](#Table:_environment)
    - [<span class="tocnumber">3.3.2</span> <span class="toctext">Table:
      environment_cvterm</span>](#Table:_environment_cvterm)
  - [<span class="tocnumber">3.4</span> <span class="toctext">Phenotype,
    Natural Diversity and Atlas
    Support</span>](#Phenotype.2C_Natural_Diversity_and_Atlas_Support)
- [<span class="tocnumber">4</span>
  <span class="toctext">Resources</span>](#Resources)



# <span id="Theory" class="mw-headline">Theory</span>

## <span id="Introduction" class="mw-headline">Introduction</span>

### <span id="Database_Terminology" class="mw-headline">Database Terminology</span>

Or, *Six years of school in 15 minutes or less.*

- [A Brief Guide to
  Databases](A_Brief_Guide_to_Databases "A Brief Guide to Databases")
- [Chado Tables](Chado_Tables "Chado Tables")

#### <span id="What.27s_a_database.3F" class="mw-headline">What's a [database](Databases_and_GMOD "Databases and GMOD")?</span>

- Chado is a [schema](Glossary#Schema "Glossary"), a database design - a
  blueprint for a database containing genomic data
- Distinct from
  - [Database Management System
    (DBMS)](Glossary#Database_Management_System "Glossary")
    - Software system for storing databases
    - *e.g.,* Oracle, [PostgreSQL](PostgreSQL "PostgreSQL"),
      [MySQL](MySQL "MySQL")
  - Database, a very loose term
    - Any set of organized data that is readable by a computer
    - A web site with database driven content, e.g., FlyBase
    - Schema + DBMS + Data

#### <span id="SQL" class="mw-headline">SQL</span>

SQL is a standardized query language for defining and manipulating
databases. Chado uses it. SQL is supported by all major DBMSs.

[FlyBase Field Mapping
Tables](FlyBase_Field_Mapping_Tables "FlyBase Field Mapping Tables")
shows some example SQL that queries the FlyBase Chado database. (Caveat:
FlyBase sometimes uses Chado in ways that no other organizations do.)

  
**Will SQL be on the test?**

No, we aren't going to teach in-depth SQL in this course but we will use
it in examples and show how to write queries in Chado.

You *can* do basics with Chado without knowing SQL. Many common tasks
already have scripts written for them. However, as you get more into
using Chado, you will find that a working knowledge of SQL is necessary.

## <span id="Why_Chado.3F" class="mw-headline">Why Chado?</span>

- **Integration**
  - Supports many types of data, integrates with many tools
- **Modular**
  - Use only what you need, ignore the rest
- **Extensible**
  - Write your own modules and properties
- **Widely used**
  - \- Chado started here, large diverse dataset and organization
  
- [Chado](Category%253AChado "Category%253AChado")
- [2011 Spring
  Training](Category%253A2011_Spring_Training "Category%253A2011 Spring Training")



<span class="smwfactboxhead">Facts about
"<span class="swmfactboxheadbrowse">[Chado Tutorial
2011](Special%253ABrowse/Chado-20Tutorial-202011 "Special%253ABrowse/Chado-20Tutorial-202011")</span>"</span>

|  |  |
|----|----|
| [Has topic](Property%253AHas_topic "Property:Has topic") | <a href="Chado" class="mw-redirect" title="Chado">Chado</a> <span class="smwsearch">[+](Special%253ASearchByProperty/Has-20topic/Chado "Special%253ASearchByProperty/Has-20topic/Chado")</span> |






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Tutorial_2011" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:52 on 27 August
  2013.</span>
<!-- - <span id="footer-info-viewcount">12,069 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





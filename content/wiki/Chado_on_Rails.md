---
title: "Chado on Rails"
---
# Chado on Rails

  Intro](#Intro)
- [Download](#Download)
- [Features](#Features)
- [Installation](#Installation)
  - [For the
    impatient](#For_the_impatient)
  - [Step 1 -
    Install Ruby on Rails (and ruby, and rubygems if
    necessary)](#Step_1_-_Install_Ruby_on_Rails_.28and_ruby.2C_and_rubygems_if_necessary.29)
  - [Step 2 -
    Install Chado on Rails](#Step_2_-_Install_Chado_on_Rails)
  - [Step 3 -
    Edit
    config/database.yml](#Step_3_-_Edit_config.2Fdatabase.yml)
  - [Step 4a -
    Create a new Chado
    database](#Step_4a_-_Create_a_new_Chado_database)
  - [Step 4b -
    Connect to an existing standard Chado
    database](#Step_4b_-_Connect_to_an_existing_standard_Chado_database)
  - [Step 4c -
    Create custom CoR for your non-standard Chado database
    (experimental)](#Step_4c_-_Create_custom_CoR_for_your_non-standard_Chado_database_.28experimental.29)
- [Cookbook](#Cookbook)
  - [creating
    new databases](#creating_new_databases)
  - [creating a
    web application for an existing Chado
    database](#creating_a_web_application_for_an_existing_Chado_database)
  - [creating a
    web application for a custom Chado
    database](#creating_a_web_application_for_a_custom_Chado_database)
  - [making
    gene pages for a Chado
    database](#making_gene_pages_for_a_Chado_database)
  - [using the
    command line](#using_the_command_line)
- [Notes from the
  GMOD evo hackathon
  2010](#Notes_from_the_GMOD_evo_hackathon_2010)

## Intro

Chado on Rails is a way to easily create bioinformatics applications
that use the Chado database schema. Chado on Rails is under active
development, and is used in the Bovine Genome Database, BeeBase and
NasoniaBase. Chado on Rails is free as in beer/speech.

## Download

The latest stable release can be downloaded here:

     svn checkout http://chadoonrails.rubyforge.org/svn/tags/release0.1

The development trunk can be downloaded here:

     svn checkout http://chadoonrails.rubyforge.org/svn/trunk

## Features

easy MVC development for bioinformatics web applications
sophisticated caching for improved performance of applications that use
Chado db
out of the box support for standard Chado and Flybase
got a non-standard Chado schema? CoR can \[automatically create Rails
objects and unit tests for your schema using magic chado, a component of
CoR\].
thousands of free Ruby and RoR gems
great support from Ruby and RoR community

## Installation

#### For the impatient

    gem install rails # if you get an error, go to the following page and install rails and rubygems http://wiki.rubyonrails.org/getting-started/installation
    svn checkout http://chadoonrails.rubyforge.org/svn/tags/release0.1 cor
    cd cor # edit config/database.yml if necessary

    # if you are hooking CoR up to an existing, standard Chado db your installation is now done.

    # to create new Chado db
    cp db/schema_chado_1.133.rb db/schema.rb
    rake db:create RAILS_ENV=development

    # to create new Flybase Chado db
    cp db/schema_flybase2010.rb db/schema.rb
    rake db:create RAILS_ENV=development

    # to create custom Rails models and association for your non-standard Chado db
    cd cor # or where ever CoR lives
    ./script/generate magic_chado
    [lots of chatter]
    overwrite app/models/analysisfeature.rb? (enter "h" for help) [Ynaqdh] a # <--- ANSWER 'A'
    [lots of chatter]

#### Step 1 - Install Ruby on Rails (and ruby, and rubygems if necessary)

To install Rails, follow the instructions for your operating system
\[here
<a href="http://wiki.rubyonrails.org/getting-started/installation"

Rails 2.3 is recommended. CoR is currently being developed using Ruby
1.8.7, Rubygems 1.3.7 and Rails 2.3.10, but differences in minor version
should not matter.

#### Step 2 - Install Chado on Rails

    svn checkout http://chadoonrails.rubyforge.org/svn/tags/release0.1 cor

#### Step 3 - Edit config/database.yml

Specify which database Chado on Rails should use in config/database.yml.
By default CoR will use the development environment, which means it will
connect to a postgreSQL database named cor_development using the root
user with no password. The database.yml file should look something like
this:

    development:
       adapter: postgresql
       database: cor_development  # <- might need to change this
       template: template0
       encoding: utf8
       host: localhost
       username: root # <- might need to change this
       password: # <- might need change this
    # Warning: The database defined as "test" will be erased and
    # re-generated from your development database when you run "rake".
    # Do not set this db to the same as development or production.
    # test:
    test: &TEST
      adapter: postgresql
      template: template0
      encoding: utf8
      database: cor_test
      host: localhost
      username: root
      password:
    production:
      adapter: postgresql
      database: cor_production
      host: localhost
      username: root
      password:
    cucumber:
      <<: *TEST

Edit the database, host, username, password items in the development
stanza so that CoR can connect to the database you'd like to use. Change
the adapter to mysql or some other database adapter if necessary - this
has not been tested well, but should work.

#### Step 4a - Create a new Chado database

To create a standard Chado 1.13 database

    cd cor # or where ever CoR lives
    cp db/schema_chado_1.133.rb db/schema.rb
    rake db:create RAILS_ENV=development

To create a 2010 Flybase Chado database

    cd cor # or where ever CoR lives
    cp db/schema_flybase2010.rb db/schema.rb
    rake db:create RAILS_ENV=development

If you get database permission errors, check that the host, username and
password in config/database.yml are actually the ones you'd like to use.

#### Step 4b - Connect to an existing standard Chado database

You don't need to do anything special in this case. CoR will talk to
your standard Chado database without any more effort on your part.

#### Step 4c - Create custom CoR for your non-standard Chado database (experimental)

CoR can generate a custom set of Rails models for your non-standard
Chado database.

    cd cor # or where ever CoR lives
    ./script/generate magic_chado
    [lots of chatter]
    overwrite app/models/analysisfeature.rb? (enter "h" for help) [Ynaqdh] a # <--- ANSWER 'A'
    [lots of chatter]

Some (gory) details: CoR generates a custom ORM for your non-standard
Chado database using the magic chado gem, which was inspired by and
borrows much from the magic model gem by Dr. Nic and ships as part of
CoR. Basically the magic chado algorithm works like this:

1\) Create models: magic chado creates a Rails model for each table it
finds. For example, if it finds a table called **feature** it will
create a model named **Feature**.

2\) Create associations: magic chado then creates associations between
tables by:

a\) looking for foreign key constraints that associate two tables in the
database, if your database supports this and actually has foreign key
constraints. For example, if it finds a foreign key constraint in table
**feature** associating column **type_id** with the table **cvterm**, it
will make a **feature** -\> **cvterm** association. Specifically, it
will make a **feature** -belongs_to-\> **cvterm** association and a
**cvterm** -has_many-\>**features** association.

b\) looking for associations "symbolically". For example, if it finds a
**cv_id** column in the table **cvterm**, it will make a **cv** -\>
**cvterm** association. Specifically, it will make a **cvterm**
-belongs_to-\> **cv** association, and a **cv** -has_many-\> **cvterms**
association.

## Cookbook

#### creating new databases

\- creating a new instance of a standard Chado

lorem ipsum - creating a new instance of Flybase Chado schema

lorem ipsum

#### creating a web application for an existing Chado database

lorem ipsum

#### creating a web application for a custom Chado database

lorem ipsum

#### making gene pages for a Chado database

lorem ipsum

#### using the command line

\- adding a new feature lorem ipsum

\- getting all the genes for a given cvterm lorem ipsum

\- getting all the child features for a feature which are related by a
given cvterm lorem ipsum

## Notes from the GMOD evo hackathon 2010

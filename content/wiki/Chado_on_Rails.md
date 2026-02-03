---
title: "Chado on Rails"
---




<span id="top"></span>




# <span dir="auto">Chado on Rails</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Intro</span>](#Intro)
- [<span class="tocnumber">2</span>
  <span class="toctext">Download</span>](#Download)
- [<span class="tocnumber">3</span>
  <span class="toctext">Features</span>](#Features)
- [<span class="tocnumber">4</span>
  <span class="toctext">Installation</span>](#Installation)
  - [<span class="tocnumber">4.1</span> <span class="toctext">For the
    impatient</span>](#For_the_impatient)
  - [<span class="tocnumber">4.2</span> <span class="toctext">Step 1 -
    Install Ruby on Rails (and ruby, and rubygems if
    necessary)</span>](#Step_1_-_Install_Ruby_on_Rails_.28and_ruby.2C_and_rubygems_if_necessary.29)
  - [<span class="tocnumber">4.3</span> <span class="toctext">Step 2 -
    Install Chado on Rails</span>](#Step_2_-_Install_Chado_on_Rails)
  - [<span class="tocnumber">4.4</span> <span class="toctext">Step 3 -
    Edit
    config/database.yml</span>](#Step_3_-_Edit_config.2Fdatabase.yml)
  - [<span class="tocnumber">4.5</span> <span class="toctext">Step 4a -
    Create a new Chado
    database</span>](#Step_4a_-_Create_a_new_Chado_database)
  - [<span class="tocnumber">4.6</span> <span class="toctext">Step 4b -
    Connect to an existing standard Chado
    database</span>](#Step_4b_-_Connect_to_an_existing_standard_Chado_database)
  - [<span class="tocnumber">4.7</span> <span class="toctext">Step 4c -
    Create custom CoR for your non-standard Chado database
    (experimental)</span>](#Step_4c_-_Create_custom_CoR_for_your_non-standard_Chado_database_.28experimental.29)
- [<span class="tocnumber">5</span>
  <span class="toctext">Cookbook</span>](#Cookbook)
  - [<span class="tocnumber">5.1</span> <span class="toctext">creating
    new databases</span>](#creating_new_databases)
  - [<span class="tocnumber">5.2</span> <span class="toctext">creating a
    web application for an existing Chado
    database</span>](#creating_a_web_application_for_an_existing_Chado_database)
  - [<span class="tocnumber">5.3</span> <span class="toctext">creating a
    web application for a custom Chado
    database</span>](#creating_a_web_application_for_a_custom_Chado_database)
  - [<span class="tocnumber">5.4</span> <span class="toctext">making
    gene pages for a Chado
    database</span>](#making_gene_pages_for_a_Chado_database)
  - [<span class="tocnumber">5.5</span> <span class="toctext">using the
    command line</span>](#using_the_command_line)
- [<span class="tocnumber">6</span> <span class="toctext">Notes from the
  GMOD evo hackathon
  2010</span>](#Notes_from_the_GMOD_evo_hackathon_2010)



## <span id="Intro" class="mw-headline">Intro</span>

Chado on Rails is a way to easily create bioinformatics applications
that use the Chado database schema. Chado on Rails is under active
development, and is used in the Bovine Genome Database, BeeBase and
NasoniaBase. Chado on Rails is free as in beer/speech.

## <span id="Download" class="mw-headline">Download</span>

The latest stable release can be downloaded here:

     svn checkout http://chadoonrails.rubyforge.org/svn/tags/release0.1

The development trunk can be downloaded here:

     svn checkout http://chadoonrails.rubyforge.org/svn/trunk

## <span id="Features" class="mw-headline">Features</span>

easy MVC development for bioinformatics web applications  
sophisticated caching for improved performance of applications that use
Chado db  
out of the box support for standard Chado and Flybase  
got a non-standard Chado schema? CoR can \[automatically create Rails
objects and unit tests for your schema using magic chado, a component of
CoR\].  
thousands of free Ruby and RoR gems  
great support from Ruby and RoR community  

## <span id="Installation" class="mw-headline">Installation</span>

#### <span id="For_the_impatient" class="mw-headline">For the impatient</span>

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

#### <span id="Step_1_-_Install_Ruby_on_Rails_.28and_ruby.2C_and_rubygems_if_necessary.29" class="mw-headline">Step 1 - Install Ruby on Rails (and ruby, and rubygems if necessary)</span>

To install Rails, follow the instructions for your operating system
\[here
<a href="http://wiki.rubyonrails.org/getting-started/installation"
class="external free"
rel="nofollow">http://wiki.rubyonrails.org/getting-started/installation</a>\].
Rails 2.3 is recommended. CoR is currently being developed using Ruby
1.8.7, Rubygems 1.3.7 and Rails 2.3.10, but differences in minor version
should not matter.

#### <span id="Step_2_-_Install_Chado_on_Rails" class="mw-headline">Step 2 - Install Chado on Rails</span>

    svn checkout http://chadoonrails.rubyforge.org/svn/tags/release0.1 cor

#### <span id="Step_3_-_Edit_config.2Fdatabase.yml" class="mw-headline">Step 3 - Edit config/database.yml</span>

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

#### <span id="Step_4a_-_Create_a_new_Chado_database" class="mw-headline">Step 4a - Create a new Chado database</span>

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

#### <span id="Step_4b_-_Connect_to_an_existing_standard_Chado_database" class="mw-headline">Step 4b - Connect to an existing standard Chado database</span>

You don't need to do anything special in this case. CoR will talk to
your standard Chado database without any more effort on your part.

#### <span id="Step_4c_-_Create_custom_CoR_for_your_non-standard_Chado_database_.28experimental.29" class="mw-headline">Step 4c - Create custom CoR for your non-standard Chado database (experimental)</span>

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

## <span id="Cookbook" class="mw-headline">Cookbook</span>

#### <span id="creating_new_databases" class="mw-headline">creating new databases</span>

\- creating a new instance of a standard Chado

lorem ipsum - creating a new instance of Flybase Chado schema

lorem ipsum

#### <span id="creating_a_web_application_for_an_existing_Chado_database" class="mw-headline">creating a web application for an existing Chado database</span>

lorem ipsum

#### <span id="creating_a_web_application_for_a_custom_Chado_database" class="mw-headline">creating a web application for a custom Chado database</span>

lorem ipsum

#### <span id="making_gene_pages_for_a_Chado_database" class="mw-headline">making gene pages for a Chado database</span>

lorem ipsum

#### <span id="using_the_command_line" class="mw-headline">using the command line</span>

\- adding a new feature lorem ipsum

\- getting all the genes for a given cvterm lorem ipsum

\- getting all the child features for a feature which are related by a
given cvterm lorem ipsum

## <span id="Notes_from_the_GMOD_evo_hackathon_2010" class="mw-headline">Notes from the GMOD evo hackathon 2010</span>




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [Database Tools](Category%253ADatabase_Tools "Category%253ADatabase Tools")







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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_on_Rails" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:20 on 28 March
  2014.</span>
<!-- - <span id="footer-info-viewcount">62,915 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





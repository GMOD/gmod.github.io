---
title: "Chado Django HOWTO"
---
# Chado Django HOWTO

--Vdejager
11:07, 1 September 2008 (UTC)

  with Django HOWTO</span>](#Chado_access_with_Django_HOWTO)
  - [Abstract](#Abstract)
  - [Introduction](#Introduction)
  - [Why
    Django?](#Why_Django.3F)
    - [High
      Performance](#High_Performance)
    - [Structure](#Structure)
    - [Our
      Goal](#Our_Goal)
  - [Prerequisites](#Prerequisites)
    - [Important Django
      Urls](#Important_Django_Urls)
  - [Preparations](#Preparations)
    - [Create
      a Django project](#Create_a_Django_project)
  - [The Django
    Model Philosophy](#The_Django_Model_Philosophy)
    - [Creating a Django
      App](#Creating_a_Django_App)
    - [Creating the
      Models](#Creating_the_Models)
    - [Creating Model Specific
      Functions](#Creating_Model_Specific_Functions)
    - [Attaching the Model Method Definitions to
      Specific
      Models](#Attaching_the_Model_Method_Definitions_to_Specific_Models)
    - [Link
      Everything Together](#Link_Everything_Together)
    - [Finalizing](#Finalizing)
  - [Using
    Django From the Command
    Line](#Using_Django_From_the_Command_Line)
    - [Starting an Interactive Python
      Shell](#Starting_an_Interactive_Python_Shell)
    - [Querying the
      Database](#Querying_the_Database)
    - [Stacking Queries](#Stacking_Queries)
    - [Show
      Me the Generated SQL](#Show_Me_the_Generated_SQL)
  - [Running
    commandline python scripts using Django for database
    interaction](#Running_commandline_python_scripts_using_Django_for_database_interaction)
  - [Tips and
    tricks](#Tips_and_tricks)
  - [BioPython
    interaction](#BioPython_interaction)
  - [Example
    website](#Example_website)

# Chado access with Django HOWTO

## Abstract

This [HOWTO](Category%253AHOWTO "Category%253AHOWTO") describes how to use the
<a href="http://www.djangoproject.com/" class="external text"
rel="nofollow">Django</a> (Python based) framework for accessing a
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> database.
The Django framework can be used to create web interfaces and command
line tools using the Python language.

## Introduction

During the [first GMOD Summer
school](2008_GMOD_Summer_School "2008 GMOD Summer School") and [July
2008 GMOD Meeting](July_2008_GMOD_Meeting "July 2008 GMOD Meeting") a
great deal was learned about
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> and the
surrounding [GMOD tools](GMOD_Components "GMOD Components").
Specifically that one should try not to change the Chado schema
(although some do with very good reasons) and secondly not to change
code of third party tools, Perl modules etc in order to make them work
with Chado. (Or at least if they are bug fixes, give them back to the
community). This will break upgradability and platform independence of
those tools.

## Why Django?

Some reasons why to use
<a href="http://www.djangoproject.com/" class="external text"
rel="nofollow">Django</a> as web framework

### High Performance

Django is a high-level
<a href="http://www.python.org/" class="external text"
rel="nofollow">Python</a> web framework that encourages rapid
development and clean, pragmatic design and adheres the <a
href="http://docs.djangoproject.com/en/dev/misc/design-philosophies/#dry#dry"
class="external text" rel="nofollow">DRY (Don't Repeat Yourself)</a>
principle. Developed and used over two years by a fast-moving
online-news operation, Django was designed to handle two challenges: the
intensive deadlines of a newsroom and the stringent requirements of the
experienced Web developers who wrote it. Although most genome annotation
databases probably won't have to endure a million hits per hour they
will be able to benefit from a lot of optimization strategies applied to
high traffic sites like query caching and lazy querying methods.

### Structure

Django lets you structure the design of a site to a high degree without
giving up any flexibility or portability. Django certainly does not give
you an out of the box website, but gives you a flexible and highly
documented framework that is well maintained by a large community.

This makes Django a nice choice for data disclosure projects like a
website on top of a Chado database. There are other such frameworks like
<a href="http://turbogears.org/" class="external text"
rel="nofollow">Turbogears</a> (Python),
<a href="http://www.hibernate.org/" class="external text"
rel="nofollow">Hibernate</a> (Java),
<a href="http://www.rubyonrails.org/" class="external text"
rel="nofollow">Ruby on Rails</a> and
<a href="http://www.catalystframework.org/" class="external text"
rel="nofollow">Catalyst</a> (Perl). Choose what you like and write a
HOWTO as well. Python is the most used language in
<a href="http://www2.cmbi.ru.nl/groups/bacterial-genomics/research/"
class="external text" rel="nofollow">our lab</a> and thus an obvious
first choice. (and the inventor is Dutch,
<a href="http://www.python.org/~guido/" class="external text"
rel="nofollow">Guido van Rossum</a>, employed by Google.)

In an ideal world one would be able to upgrade the Django framework code
without breaking anything (a practice I have been doing for almost a
year with some other sites under development, only the last major
changes to Django broke a site (but how and why to fix those is well
described in the Django documentation)

Also, since the Chado schema is bigger than most schemas, the models
will be generated or regenerated automatically. Any model specific
functionality is attached to the model classes in such a way that the
models can be upgraded independently without breaking the website code.



### Our Goal

We will use the Django framework as showcase for annotating and
disclosing our microbial genome database.

## Prerequisites

- If you are not familiar with Django, start reading the tutorial at
  <a href="http://docs.djangoproject.com" class="external free"
  rel="nofollow">http://docs.djangoproject.com</a> (stable) or
  <a href="http://www.djangoproject.com/documentation/"
  class="external free"
  rel="nofollow">http://www.djangoproject.com/documentation/</a>
  (development)
- A working Chado database. It should work with most recent versions.
  This howto was created using version 1.01 of the schema.
- Python, at least 2.4, but preferably version 2.5, this is probably
  already installed during your Linux setup.
- Apache 2 with mod_python installed. alternatively you may setup a
  mod_wsgi server as described in <a
  href="http://ericholscher.com/blog/2008/jul/8/setting-django-and-mod_wsgi/"
  class="external text" rel="nofollow">Django and mod-wsgi</a>
- psycopg2, the python postgres interface, which should be found in your
  Linux distribution or can be snatched from
  <a href="http://www.initd.org/" class="external free"
  rel="nofollow">http://www.initd.org/</a>
- Django of course. This howto is written with the Django version 1.0
  beta 2, actually revision 8791 from the Django SVN repository which
  should be virtually identical to version 1.0.
- Please make sure mod_python works as described in
  <a href="http://www.djangoproject.com/documentation/modpython/"
  class="external free"
  rel="nofollow">http://www.djangoproject.com/documentation/modpython/</a>
- Try to get the Django welcome screen before continuing the project
  creation step.

### Important Django Urls

- <a href="http://www.djangoproject.com/" class="external free"
  rel="nofollow">http://www.djangoproject.com/</a> (the projects home)
- <a href="http://docs.djangoproject.com/en/dev/contents/"
  class="external free"
  rel="nofollow">http://docs.djangoproject.com/en/dev/contents/</a> (a
  MUST READ if you are not familiar with the Django framework, try the
  tutorial)
- <a
  href="http://code.djangoproject.com/wiki/BackwardsIncompatibleChanges"
  class="external free"
  rel="nofollow">http://code.djangoproject.com/wiki/BackwardsIncompatibleChanges</a>
  (have this at hand when you are following the SVN developer version of
  Django trunk)
- <a href="http://www.djangoproject.com/community/" class="external free"
  rel="nofollow">http://www.djangoproject.com/community/</a> (a lot of
  talk, tips and code links)
- <a href="http://www.djangosnippets.org/" class="external free"
  rel="nofollow">http://www.djangosnippets.org/</a> (all kinds of handy
  code snippets)
- <a href="http://www.python.org" class="external free"
  rel="nofollow">http://www.python.org</a> (python documentation)

## Preparations

From this point on it is assumed you have read the
<a href="http://www.djangoproject.com/documentation/"
class="external text" rel="nofollow">Django introduction and
tutorial</a> on the Django project website.

### Create a Django project

A Django project consists of a tree of files under a certain directory.
This directory may be inside a user's home dir or inside a specific
location where all Django projects are stored. When a Django website is
created following the guidelines in the official documentation it should
be a minimal task to change locations or even servers making deployment
a breeze.

Inside your home directory create a Django project with the following
command:

       django-admin.py startproject <your project name>
       example /home/gmod/projects/django-admin startproject microgear

This will create a directory that contains several files:

       __init__.py
       manage.py
       settings.py
       urls.py

We start by changing the `settings.py` file and filling in some options:

       DATABASE_ENGINE = 'postgresql_psycopg2'            # 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
       DATABASE_NAME = 'dev_chado_03'                      # Or path to database file if using sqlite3.
       DATABASE_USER = 'chado'                            # Not used with sqlite3.
       DATABASE_PASSWORD = '<no i'm not giving you mine>' # Not used with sqlite3.
       DATABASE_HOST =                                  # Set to empty string for localhost (uses sockets)
                                                          # Set to machine IP to force tcp connection. Not used with sqlite3.
       DATABASE_PORT =                                  # Set to empty string for default. Not used with sqlite3.

- Make sure you set `MEDIA_ROOT`, `MEDIA_URL` and `ADMIN_MEDIA_PREFIX`
  as described in the Django manual.
- Make `site_media/` a symlink in your project dir pointing to a
  directory on your web server's document root. This is where all your
  static files go (pdf's, jpgs,pngs etc)

Save the file and we are ready for the model generation part.

## The Django Model Philosophy

A model is the single, definitive source of data about your data. It
contains the essential fields and behaviors of the data you’re storing.
Django follows the DRY Principle. The goal is to define your data model
in one place and automatically derive things from it.

This is not going to work for a Chado database since the schema is
predefined and works a little bit different than how Django normally
would create it. Django also does not know how to create views and such
although it can perfectly use them as we will notice later.

### Creating a Django App

First create a Django application inside you project directory. Switch
to your project directory and create an application framework with the
command:

      ./manage.py startapp <your application name>

      example /home/gmod/projects/microgear/manage.py startapp gmod


This will create a directory inside your project directory named `gmod`
and contains all file scaffolds we will need later.

### Creating the Models

Now we switch back to our project directory and enter the following
command.

      ./manage.py inspectdb > unsortedmodels.py

This will create a raw `models.py` with a model for each table and view
in the specified [Postgres](Category%253APostgreSQL "Category%253APostgreSQL")
database. We will need to edit this file a bit with a Perl script.

Each foreign key relation should have a unique name in Django to support
<a
href="http://www.djangoproject.com/documentation/db-api/#backward#backward"
class="external text" rel="nofollow">reverse relationships</a>. The
following Perl code will create these unique names. The code rewrites
the models in such a way that these reverse relations are supported
using a model method with the following name:

      model.relatedmodelname_field_set.(queryfilters)



      example: Feature.featureset_feature.filter(srcfeature_exact='NC_004567')

The table
[featureloc](Chado_Sequence_Module#Table:_featureloc "Chado Sequence Module")
has two foreign keys to the table
[feature](Chado_Sequence_Module#Table:_feature "Chado Sequence Module"),
one through the field 'feature' and the other through the field
'srcfeature'. The above Django queryset will return all features that
are referenced by featureloc records that have 'NC_004567' as source
feature value.


The code will also create an `admin.py` file for linking the models to
the admin site (handy for smaller size tables like the
[organism](Chado_Organism_Module#Table:_organism "Chado Organism Module"),
[db](Chado_General_Module#Table:_db "Chado General Module") or
[cv](Chado_CV_Module#Table:_cv "Chado CV Module") tables).

Perl code is available at
<a href="http://www.cmbi.ru.nl/~vdejager/gmod/sortmodel.pl.gz"
class="external free"
rel="nofollow">http://www.cmbi.ru.nl/~vdejager/gmod/sortmodel.pl.gz</a>
Feel free to change and republish since my Perl is a bit rusty.

Usage:

    perl sortmodels.pl unsortedmodels.py models.py <project> <app>

The resulting files, `models.py` and `admin.py` should be copied to the
\<app\> directory. Have a look at these files. A model in Django
representing a database table looks like this:

``` de1
    class Feature(models.Model):
        feature_id = models.IntegerField(primary_key=True)
        dbxref = models.ForeignKey('Dbxref', related_name="feature_dbxref_set")
        organism = models.ForeignKey('Organism', related_name="feature_organism_set")
        name = models.CharField(max_length=255)
        uniquename = models.TextField()
        residues = models.TextField()
        seqlen = models.IntegerField()
        md5checksum = models.TextField() # This field type is a guess.
        type = models.ForeignKey('Cvterm', related_name="feature_type_set")
        is_analysis = models.BooleanField()
        is_obsolete = models.BooleanField()
        timeaccessioned = models.DateTimeField()
        timelastmodified = models.DateTimeField()
```

### Creating Model Specific Functions

In Django it is possible to specify so called *model methods*. These
model methods describe the way a model behaves and can add certain
functionality to a model. A special model method called `__unicode__`
describes how to display the standard name of a model instance
(representing a record in the database). We use these methods to get
something readable while playing with the command line further in this
tutorial.

We could create this model definition by editing the classes in
`model.py`, but instead we will use a common Python pattern.

We create a new file called `modeldefs.py`. Inside this file we will
create all our model methods and link them together inside the special
`__init__.py` file that is used to initialize the
<a href="http://docs.python.org/tut/node8.html#packages#packages"
class="external text" rel="nofollow">package</a> in Python

`modeldefs.py`:

``` de1
    #this file contains all the model methods we will attach to the specific models in the __init__.py file
    # one method may be attached to different model adhering to the DRY principle
    #
    #The line below imports all the Chado models
    from <project>.<app>.models import *

    #this is a generic method definition for model, returning the value of the field called 'name'
    def unicode_name(self):
        return self.name


    # this is a method definition for the 'Organism' model, returning the value of the field called
    # 'common_name'
    def unicode_common_name(self):
        return self.common_name
```

### Attaching the Model Method Definitions to Specific Models

`__init__.py`:

``` de1
    # this file attaches defined methods to specific models
    #
    # import the model method definitions
    from <project>.<app>.modeldefs import *

    setattr(Organism, '__unicode__', unicode_common_name)

    setattr(Cv, '__unicode__', unicode_name)
    setattr(Db, '__unicode__', unicode_name)
    setattr(Cvterm, '__unicode__', unicode_name)
    setattr(Feature, '__unicode__', unicode_name)

    setattr(Featureloc, '__unicode__', location)
```

### Link Everything Together

Go to your project directory to change the files below:

**In `settings.py`:**

The `INSTALLED_APPS` section should contain besides the standard
settings.

``` de1
    'django.contrib.admin',
    '<project>.<app>.',
```

*Note the comma at the last item. This is a Python requisite.*

**In `urls.py`:**

Uncomment all line described as necessary for the automatic admin site.

### Finalizing

Once this has been inserted we need to run one other command. From the
command line inside your \<project\> run

       ./manage syncdb

This will install all the tables necessary for the Django Admin
application. You are now ready to continue building a website or run
scripts using the Django framework against a Chado database.
Alternatively, you should be able to go to your website url admin page
and see the models described in the `@adminmodels` array in the
`sortmodels.pl` script

*example:
<a href="http://localhost/microgear/admin/" class="external free"
rel="nofollow">http://localhost/microgear/admin/</a>* (although this url
depends on *how* you install your Django sites.

## Using Django From the Command Line

(You may want to install <a
href="http://code.google.com/p/django-command-extensions/wiki/InstallationInstructions"
class="external text" rel="nofollow">Django commandline extensions</a>.)

### Starting an Interactive Python Shell

Inside your project dir

       ./manage shell
       >>>from <project>.<app>.models import *

### Querying the Database

See the <a href="http://www.djangoproject.com/documentation/db-api/"
class="external text" rel="nofollow">Django database API
documentation</a> for an explanation of all database api methods.

Show all Organisms in the database:

       >>>Organism.objects.all()

All Features from a specific organism:

       >>>Feature.objects.filter(Organism__common_name__iexact='Lactobacillus_plantarum')

All Features from a specific source feature between a start and stop
location:

       >>>Feature.featureloc_feature_set.filter(strand__exact=1).filter(fmin__gte=10000).filter(fmax__lte=20000)

### Stacking Queries

Using Q objects

### Show Me the Generated SQL

It is possible to see the [SQL](Glossary#SQL "Glossary") Django
generates using the following commands

Make sure your Django `DEBUG` setting is set to `True`. Then, just do
this:

       >>> from django.db import connection
       >>> connection.queries

`connection.queries` is only available if `DEBUG` is `True`. It’s a list
of dictionaries in order of query execution. Each dictionary has the
following:

- `sql` -- The raw SQL statement
- `time` -- How long the statement took to execute, in seconds.

`connection.queries` includes all SQL statements — INSERTs, UPDATES,
SELECTs, etc. Each time your app hits the database, the query will be
recorded.

## Running commandline python scripts using Django for database interaction

## Tips and tricks

## BioPython interaction

## Example website

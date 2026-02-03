---
title: "Chado Django HOWTO"
---




<span id="top"></span>




# <span dir="auto">Chado Django HOWTO</span>









--Vdejager
11:07, 1 September 2008 (UTC)


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Chado access
  with Django HOWTO</span>](#Chado_access_with_Django_HOWTO)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">Abstract</span>](#Abstract)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">Introduction</span>](#Introduction)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Why
    Django?</span>](#Why_Django.3F)
    - [<span class="tocnumber">1.3.1</span> <span class="toctext">High
      Performance</span>](#High_Performance)
    - [<span class="tocnumber">1.3.2</span>
      <span class="toctext">Structure</span>](#Structure)
    - [<span class="tocnumber">1.3.3</span> <span class="toctext">Our
      Goal</span>](#Our_Goal)
  - [<span class="tocnumber">1.4</span>
    <span class="toctext">Prerequisites</span>](#Prerequisites)
    - [<span class="tocnumber">1.4.1</span>
      <span class="toctext">Important Django
      Urls</span>](#Important_Django_Urls)
  - [<span class="tocnumber">1.5</span>
    <span class="toctext">Preparations</span>](#Preparations)
    - [<span class="tocnumber">1.5.1</span> <span class="toctext">Create
      a Django project</span>](#Create_a_Django_project)
  - [<span class="tocnumber">1.6</span> <span class="toctext">The Django
    Model Philosophy</span>](#The_Django_Model_Philosophy)
    - [<span class="tocnumber">1.6.1</span>
      <span class="toctext">Creating a Django
      App</span>](#Creating_a_Django_App)
    - [<span class="tocnumber">1.6.2</span>
      <span class="toctext">Creating the
      Models</span>](#Creating_the_Models)
    - [<span class="tocnumber">1.6.3</span>
      <span class="toctext">Creating Model Specific
      Functions</span>](#Creating_Model_Specific_Functions)
    - [<span class="tocnumber">1.6.4</span>
      <span class="toctext">Attaching the Model Method Definitions to
      Specific
      Models</span>](#Attaching_the_Model_Method_Definitions_to_Specific_Models)
    - [<span class="tocnumber">1.6.5</span> <span class="toctext">Link
      Everything Together</span>](#Link_Everything_Together)
    - [<span class="tocnumber">1.6.6</span>
      <span class="toctext">Finalizing</span>](#Finalizing)
  - [<span class="tocnumber">1.7</span> <span class="toctext">Using
    Django From the Command
    Line</span>](#Using_Django_From_the_Command_Line)
    - [<span class="tocnumber">1.7.1</span>
      <span class="toctext">Starting an Interactive Python
      Shell</span>](#Starting_an_Interactive_Python_Shell)
    - [<span class="tocnumber">1.7.2</span>
      <span class="toctext">Querying the
      Database</span>](#Querying_the_Database)
    - [<span class="tocnumber">1.7.3</span>
      <span class="toctext">Stacking Queries</span>](#Stacking_Queries)
    - [<span class="tocnumber">1.7.4</span> <span class="toctext">Show
      Me the Generated SQL</span>](#Show_Me_the_Generated_SQL)
  - [<span class="tocnumber">1.8</span> <span class="toctext">Running
    commandline python scripts using Django for database
    interaction</span>](#Running_commandline_python_scripts_using_Django_for_database_interaction)
  - [<span class="tocnumber">1.9</span> <span class="toctext">Tips and
    tricks</span>](#Tips_and_tricks)
  - [<span class="tocnumber">1.10</span> <span class="toctext">BioPython
    interaction</span>](#BioPython_interaction)
  - [<span class="tocnumber">1.11</span> <span class="toctext">Example
    website</span>](#Example_website)



# <span id="Chado_access_with_Django_HOWTO" class="mw-headline">Chado access with Django HOWTO</span>

## <span id="Abstract" class="mw-headline">Abstract</span>

This [HOWTO](Category%253AHOWTO "Category%253AHOWTO") describes how to use the
<a href="http://www.djangoproject.com/" class="external text"
rel="nofollow">Django</a> (Python based) framework for accessing a
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> database.
The Django framework can be used to create web interfaces and command
line tools using the Python language.

## <span id="Introduction" class="mw-headline">Introduction</span>

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

## <span id="Why_Django.3F" class="mw-headline">Why Django?</span>

Some reasons why to use
<a href="http://www.djangoproject.com/" class="external text"
rel="nofollow">Django</a> as web framework

### <span id="High_Performance" class="mw-headline">High Performance</span>

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

### <span id="Structure" class="mw-headline">Structure</span>

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

  

### <span id="Our_Goal" class="mw-headline">Our Goal</span>

We will use the Django framework as showcase for annotating and
disclosing our microbial genome database.

## <span id="Prerequisites" class="mw-headline">Prerequisites</span>

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

### <span id="Important_Django_Urls" class="mw-headline">Important Django Urls</span>

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

## <span id="Preparations" class="mw-headline">Preparations</span>

From this point on it is assumed you have read the
<a href="http://www.djangoproject.com/documentation/"
class="external text" rel="nofollow">Django introduction and
tutorial</a> on the Django project website.

### <span id="Create_a_Django_project" class="mw-headline">Create a Django project</span>

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

## <span id="The_Django_Model_Philosophy" class="mw-headline">The Django Model Philosophy</span>

A model is the single, definitive source of data about your data. It
contains the essential fields and behaviors of the data you’re storing.
Django follows the DRY Principle. The goal is to define your data model
in one place and automatically derive things from it.

This is not going to work for a Chado database since the schema is
predefined and works a little bit different than how Django normally
would create it. Django also does not know how to create views and such
although it can perfectly use them as we will notice later.

### <span id="Creating_a_Django_App" class="mw-headline">Creating a Django App</span>

First create a Django application inside you project directory. Switch
to your project directory and create an application framework with the
command:

      ./manage.py startapp <your application name>

      example /home/gmod/projects/microgear/manage.py startapp gmod

  
This will create a directory inside your project directory named `gmod`
and contains all file scaffolds we will need later.

### <span id="Creating_the_Models" class="mw-headline">Creating the Models</span>

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


### <span id="Creating_Model_Specific_Functions" class="mw-headline">Creating Model Specific Functions</span>

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


### <span id="Attaching_the_Model_Method_Definitions_to_Specific_Models" class="mw-headline">Attaching the Model Method Definitions to Specific Models</span>

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


### <span id="Link_Everything_Together" class="mw-headline">Link Everything Together</span>

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

### <span id="Finalizing" class="mw-headline">Finalizing</span>

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

## <span id="Using_Django_From_the_Command_Line" class="mw-headline">Using Django From the Command Line</span>

(You may want to install <a
href="http://code.google.com/p/django-command-extensions/wiki/InstallationInstructions"
class="external text" rel="nofollow">Django commandline extensions</a>.)

### <span id="Starting_an_Interactive_Python_Shell" class="mw-headline">Starting an Interactive Python Shell</span>

Inside your project dir

       ./manage shell
       >>>from <project>.<app>.models import *

### <span id="Querying_the_Database" class="mw-headline">Querying the Database</span>

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

### <span id="Stacking_Queries" class="mw-headline">Stacking Queries</span>

Using Q objects

### <span id="Show_Me_the_Generated_SQL" class="mw-headline">Show Me the Generated SQL</span>

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

## <span id="Running_commandline_python_scripts_using_Django_for_database_interaction" class="mw-headline">Running commandline python scripts using Django for database interaction</span>

## <span id="Tips_and_tricks" class="mw-headline">Tips and tricks</span>

## <span id="BioPython_interaction" class="mw-headline">BioPython interaction</span>

## <span id="Example_website" class="mw-headline">Example website</span>




[Categories](Special%253ACategories "Special%253ACategories"):

- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")
- [Pages with problems or
  questions](Category%253APages_with_problems_or_questions "Category%253APages with problems or questions")
- [Needs Testing](Category%253ANeeds_Testing "Category%253ANeeds Testing")
- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
- [MOD User
  Interfaces](Category%253AMOD_User_Interfaces "Category%253AMOD User Interfaces")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Django_HOWTO" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:11 on 9 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">98,669 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





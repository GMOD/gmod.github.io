---
title: "PostgreSQL"
---
# PostgreSQL

(Redirected from
[Postgres](/wiki/Postgres)

PostgreSQL, more commonly known as Postgres, is an open source
relational database management system (RDBMS or DBMS) that is the
default DBMS for the Chado database schema. See [Databases and
GMOD](Databases_and_GMOD "Databases and GMOD") for other choices, and
for an introduction to database terms. This page is in an introduction
to Postgres for GMOD users.

  GMOD</span>](#Postgres_in_GMOD)
- [What Do I Need
  to Know About
  Postgres?](#What_Do_I_Need_to_Know_About_Postgres.3F)
- [Postgres
  Documentation](#Postgres_Documentation)
- [Postgres
  Versions](#Postgres_Versions)
- [What About
  MySQL?](#What_About_MySQL.3F)

## Postgres in GMOD

Several GMOD components can use [database management
systems](Glossary#Database_Management_System "Glossary"). Postgres's
primary role in GMOD is to be the DBMS for the
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> database
schema. Chado was developed with Postgres as its target DBMS and Chado
off the shelf will work best with Postgres.

Postgres can also be used to back [Galaxy](Galaxy.1 "Galaxy").

## What Do I Need to Know About Postgres?

How much do you need to know about Postgres to use Chado? You need to
know:

- How to get and install Postgres
- How to administer Postgres databases

## Postgres Documentation

A wealth of information on Postgres is available at the
<a href="http://www.postgresql.org/" class="external text"
rel="nofollow">Postgres web site</a>. These pages are particularly
helpful:

- <a href="http://www.postgresql.org/docs/manuals/" class="external text"
  rel="nofollow">Postgres Manuals page</a> - Includes online and
  printable versions.
- <a href="http://www.postgresql.org/docs/current/interactive/index.html"
  class="external text" rel="nofollow">Online manual for latest version of
  Postgres</a>
- <a href="http://www.postgresql.org/docs/current/interactive/admin.html"
  class="external text" rel="nofollow">Server Administration section</a>
  of online manual including directions on installation and
  configuration.

## Postgres Versions

Postgres changes with every new release and some of those changes are
required for certain GMOD components to work, and some interfere with
the workings of other GMOD components.

**Add list or matrix of known requirements/interactions.**

## What About MySQL?

[MySQL](MySQL "MySQL") is more popular than Postgres. Why would you ever
want to pick Postgres instead of MySQL?

The trade-off between MySQL and Postgres is, allowing some
oversimplification, simplicity on one hand versus more features on the
other hand. With either platform you will get good performance,
excellent documentation, and well-supported software. Postgres was
picked for <a href="Chado" class="mw-redirect" title="Chado">Chado</a>
because of its rich feature set.

Postgres will be a bit harder for the novice but it is only required if
you want to install Chado.

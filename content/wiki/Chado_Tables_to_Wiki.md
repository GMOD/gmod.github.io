---
title: "Chado Tables to Wiki"
---
# Chado Tables to Wiki


The process described on this page is obsolete. The process described on
[Chado Schema Documentation
HOWTO](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
is the the current one. This page should be deleted once the new process
has been fully adopted.


## Description

This page shows you how to create the Chado table documentation seen on
pages like [Chado Tables](Chado_Tables "Chado Tables") and [Chado
Organism Module](Chado_Organism_Module "Chado Organism Module").

## Instructions

The postgresql_autodoc script uses template files to create HTML
documentation of Postgres schemas. To create table documentation for
this Wiki you will use one template file to create the documentation for
the entire Chado schema (as in this [Chado Tables
page](Chado_Tables "Chado Tables"), where all links are internal to the
page) and another template to create table documentation for a module
(e.g. [Chado Organism
Module](Chado_Organism_Module "Chado Organism Module"), where all links
go to the [Chado Tables page](Chado_Tables "Chado Tables")). A simple
Perl script converts the HTML to Wiki text.

First, the Chado tables or schema that you want to document has to be
installed in Postgres. Then:

- Install postgresql_autodoc
  (<a href="http://www.rbt.ca/autodoc/" class="external free"
  rel="nofollow">http://www.rbt.ca/autodoc/</a>)
- Save [this text](Html.tmpl.main "Html.tmpl.main") as *html.tmpl* if
  you want to create table documentation for the entire schema
- Save [this text](Html.tmpl.module "Html.tmpl.module") as *html.tmpl*
  if you want to create table documentation for a single module
- Run the postgresql_autodoc script in the same directory as the
  *html.tmpl* file. The command will be something like this (substitute
  your own user name, password, and database name):
      >postgresql_autodoc -f chado -u user -d chado --password=passwd -l .

- This should create an HTML file called *chado.html*
- Run [this Perl script](Print-wiki-tables "Print-wiki-tables") to
  convert the HTML to Wiki text (this script will work with the Chado v.
  1.6 schema)
- If you're creating table documentation for the entire schema the
  command will look something like this:
      >print-wiki-tables.pl -all > allmodules.wiki

- If you're creating table documentation for a module the command will
  look something like this:
     >print-wiki-tables.pl -m cv > cv.wiki

Then copy and paste.

## Notes

If you have added new tables then you will need to modify the
`print-wiki-tables.pl` script. Notice that there's a hash in that script
that uses *module name* as key and *table names* as values. The reason
that this is necessary is that Postgres has no internal definition of a
related subset of tables like Chado modules.


[Category](Special%253ACategories "Special%253ACategories"):

- [Wiki Tools](Category%253AWiki_Tools "Category%253AWiki Tools")

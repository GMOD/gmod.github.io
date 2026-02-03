---
title: "Public Chado Databases"
---
# Public Chado Databases

  Genome Database
  Releases</span>](#Public_Chado_Genome_Database_Releases)
  - [Chado
    PostgreSQL Dumps](#Chado_PostgreSQL_Dumps)
  - [Direct
    Chado Access](#Direct_Chado_Access)
    - [FlyBase](#FlyBase)
    - [GeneDB](#GeneDB)

# Public <a href="Chado" class="mw-redirect" title="Chado">Chado</a> <a href="Genome" class="mw-redirect" title="Genome">Genome</a> Database Releases

## Chado [PostgreSQL](PostgreSQL "PostgreSQL") Dumps

These projects provide
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> database
dumps that you can copy and learn from.

- [FlyBase](Category%253AFlyBase "Category%253AFlyBase"):
  <a href="ftp://ftp.flybase.org/releases/current/psql/"
  class="external free"
  rel="nofollow">ftp://ftp.flybase.org/releases/current/psql/</a> -
  Contains 12 Drosophila genomes.
- [ParameciumDB](ParameciumDB "ParameciumDB"):
  <a href="http://paramecium.cgm.cnrs-gif.fr/download/sql/"
  class="external free"
  rel="nofollow">http://paramecium.cgm.cnrs-gif.fr/download/sql/</a>
- [Yeast](Category%253ASGD "Category%253ASGD"):
  <a href="http://sgdlite.princeton.edu/download/sgdlite/"
  class="external free"
  rel="nofollow">http://sgdlite.princeton.edu/download/sgdlite/</a>
:
  <a href="ftp://ftp.vectorbase.org/public_data/databases/chado/"
  class="external free"
  rel="nofollow">ftp://ftp.vectorbase.org/public_data/databases/chado/</a>

Please add to this list, if you have a Chado database to share, or know
of someone who does. If you have a public Chado database, please
consider adding an export dump file.

     pg_dump -f mychado.dump mychado

## Direct <a href="Chado" class="mw-redirect" title="Chado">Chado</a> Access

### <a href="http://flybase.org" class="external text"
rel="nofollow">FlyBase</a>

- <a
  href="https://flybase.github.io/docs/chado/index#public-database#public-database"
  class="external text" rel="nofollow">FlyBase public chado database</a>

### <a href="http://www.genedb.org" class="external text"
rel="nofollow">GeneDB</a>

The following connection information is for the preliminary GeneDB Chado
database. This database currently contains Plasmodium genomes; more
organisms will be added during 2008. This is currently a pre-release
database, which may change or disappear without warning.

**hostname:** db.genedb.org  
**port:** 5432  
**username:** genedb_ro  
**password:** no password  
**database name:** snapshot  

e.g.

    psql -h db.genedb.org -U genedb_ro snapshot

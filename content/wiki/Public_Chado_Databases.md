---
title: "Public Chado Databases"
---




<span id="top"></span>




# <span dir="auto">Public Chado Databases</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Public Chado
  Genome Database
  Releases</span>](#Public_Chado_Genome_Database_Releases)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Chado
    PostgreSQL Dumps</span>](#Chado_PostgreSQL_Dumps)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Direct
    Chado Access</span>](#Direct_Chado_Access)
    - [<span class="tocnumber">1.2.1</span>
      <span class="toctext">FlyBase</span>](#FlyBase)
    - [<span class="tocnumber">1.2.2</span>
      <span class="toctext">GeneDB</span>](#GeneDB)



# <span id="Public_Chado_Genome_Database_Releases" class="mw-headline">Public <a href="Chado" class="mw-redirect" title="Chado">Chado</a> <a href="Genome" class="mw-redirect" title="Genome">Genome</a> Database Releases</span>

## <span id="Chado_PostgreSQL_Dumps" class="mw-headline">Chado [PostgreSQL](PostgreSQL "PostgreSQL") Dumps</span>

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

## <span id="Direct_Chado_Access" class="mw-headline">Direct <a href="Chado" class="mw-redirect" title="Chado">Chado</a> Access</span>

### <span id="FlyBase" class="mw-headline"><a href="http://flybase.org" class="external text"
rel="nofollow">FlyBase</a></span>

- <a
  href="https://flybase.github.io/docs/chado/index#public-database#public-database"
  class="external text" rel="nofollow">FlyBase public chado database</a>

### <span id="GeneDB" class="mw-headline"><a href="http://www.genedb.org" class="external text"
rel="nofollow">GeneDB</a></span>

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




[Categories](Special%253ACategories "Special%253ACategories"):

- [ParameciumDB](Category%253AParameciumDB "Category%253AParameciumDB")
- [FlyBase](Category%253AFlyBase "Category%253AFlyBase")
- [SGD](Category%253ASGD "Category%253ASGD")
- [Chado](Category%253AChado "Category%253AChado")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Public_Chado_Databases" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 14:56 on 25 June
  2019.</span>
<!-- - <span id="footer-info-viewcount">32,469 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





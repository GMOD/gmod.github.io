---
title: "Talk:Chado New Users"
---




<span id="top"></span>




# <span dir="auto">Talk:Chado New Users</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Meeting
  Notes</span>](#Meeting_Notes)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">20070405</span>](#20070405)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">20070329</span>](#20070329)
  - [<span class="tocnumber">1.3</span>
    <span class="toctext">20070322</span>](#20070322)



## <span id="Meeting_Notes" class="mw-headline">Meeting Notes</span>

### <span id="20070405" class="mw-headline">20070405</span>

- Tried to work through some of the Central Dogma stuff in Chado Best
  Practices. Zheng ran the sample query, which hung his laptop.
- Jim created the Problems template
  [Template:Problems](Template:Problems "Template:Problems") for adding
  notes to documentation pages in the wiki.

### <span id="20070329" class="mw-headline">20070329</span>

Jim was out of town and everyone else attended the Systems Biology
meeting

### <span id="20070322" class="mw-headline">20070322</span>

Lincoln was able to attend today. We looked at Chado tables using a
combination of phpPgAdmin and command line. To do direct SQL queries in
phpPgAdmin, click at the schema level.

Example query:

    select f.name, d.*, fd.* from dbxref as  d, feature_dbxref as fd, feature as f where d.dbxref_id = fd.dbxref_id and f.feature_id = fd.feature_id and accession !='SGD'

Gives:

    name  | dbxref_id | db_id | accession | version | description | feature_dbxref_id | feature_id | dbxref_id | is_current 
    -------+-----------+-------+-----------+---------+-------------+-------------------+------------+-----------+------------
    COX2  |     42435 |     2 | landmark  | 1       |             |             16241 |      16241 |     42435 | t
    COB   |     42435 |     2 | landmark  | 1       |             |             16176 |      16176 |     42435 | t
    COX1  |     42435 |     2 | landmark  | 1       |             |             16129 |      16129 |     42435 | t
    RPC40 |     42435 |     2 | landmark  | 1       |             |             15800 |      15800 |     42435 | t
    HTS1  |     42435 |     2 | landmark  | 1       |             |             15623 |      15623 |     42435 | t
    ERG10 |     42435 |     2 | landmark  | 1       |             |             15474 |      15474 |     42435 | t
    PEP4  |     42435 |     2 | landmark  | 1       |             |             15173 |      15173 |     42435 | t
    TPK2  |     42435 |     2 | landmark  | 1       |             |             15058 |      15058 |     42435 | t
    GAL4  |     42435 |     2 | landmark  | 1       |             |             14960 |      14960 |     42435 | t
    RAD17 |     42435 |     2 | landmark  | 1       |             |             14775 |      14775 |     42435 | t

Note that all have the same dbxref_id.

  
Conclusions

- bulk loaded sample yeast gff3 may not create canonical chado data.
  - features all have dbxref = NULL
    - *feature.dbxref_id is nullable; the original design was to have
      the dbxref_id that appears in the feature table to be the
      'primary' dbxref_id. A fairly recent addition was to add a command
      line flag to the bulk loader to allow the user to specify what (if
      anything) should be used as feature.dbxref_id. All others go in
      feature_dbxref.*
  - feature_dbxref acts strange (see example above)
    - *Not strange at all :-) In typical installations, db_id=2 is the
      GFF_source that comes from the GFF3 file. If you take a look at
      the GFF3 that SGD produces, most have a source of 'SGD', but a few
      have a source of 'landmark', which is used by SGD to put a few
      gene features in the overview in a GBrowse display.*
      - OK, it was a little strange--the GFF bulk loader (and the
        underlying bioperl module, Bio::FeatureIO::gff) didn't recognize
        attribute tags of 'dbxref' as dbxref tags (the standard is to
        use 'Dbxref'. I've modified bioperl and the bulk loader to allow
        the lowercase, non-standard dbxref now.
  - other?
- should get XML from a known Chado db and import via XORT or other.
  - talk to Pei Li and Eric Just








## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AChado_New_Users" accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>





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




- <span id="footer-info-lastmod">Last updated at 16:16 on 12 April
  2007.</span>
<!-- - <span id="footer-info-viewcount">8,833 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





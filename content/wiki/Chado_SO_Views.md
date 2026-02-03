---
title: "Chado SO Views"
---




<span id="top"></span>




# <span dir="auto">Chado SO Views</span>









Starting with the GMOD 1.1 release, Chado has a set of views to make
querying the feature table for specific SO types (eg, gene, transcript,
region) easier. These views are a schema called "so"; as a result, to
using them in a query, you generally need to identify the schema in the
query.

# <span id="How_the_views_are_defined" class="mw-headline">How the views are defined</span>

For each cvterm in the Sequence Ontology, a view is created with that
terms name (except when the length of the name would exceed the length
of allowable relation names in PostgreSQL). The views form a join
between the cvterm table and the feature table such that if a feature is
identified as having a feature.type_id of the name of the view, or a
type_id that IS_A type child of the name of the view, it is found.

For example, the following view is for all exons in the feature table:


``` de1
CREATE VIEW exon AS
  SELECT
    feature_id AS exon_id,
    feature.*
  FROM
    feature INNER JOIN cvterm ON (feature.type_id = cvterm.cvterm_id)
  WHERE cvterm.name = 'coding_exon' OR 
        cvterm.name = 'noncoding_exon' OR 
        cvterm.name = 'interior_exon' OR
        cvterm.name = 'exon_of_single_exon_gene' OR
        cvterm.name = 'interior_coding_exon' OR
        cvterm.name = 'five_prime_coding_exon' OR
        cvterm.name = 'three_prime_coding_exon' OR
        cvterm.name = 'three_prime_noncoding_exon' OR
        cvterm.name = 'five_prime_noncoding_exon' OR
        cvterm.name = 'exon';
```


Essentially, it is a way of taking advantage of the structure of the
ontology without calculating the
[closure](Chado_CV_Module#Transitive_Closure "Chado CV Module"). Of
course, a downside of this approach is that it is hard coded for a
particular version of the Sequence Ontology, and if it changes, the
views will need to be updated as well.

# <span id="Some_example_queries" class="mw-headline">Some example queries</span>




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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_SO_Views" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:34 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">16,151 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





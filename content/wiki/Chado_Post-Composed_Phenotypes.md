---
title: "Chado Post-Composed Phenotypes"
---




<span id="top"></span>




# <span dir="auto">Chado Post-Composed Phenotypes</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Overview</span>](#Overview)
- [<span class="tocnumber">2</span>
  <span class="toctext">Proposal</span>](#Proposal)
- [<span class="tocnumber">3</span> <span class="toctext">New and
  Modified Tables in Phenotype
  Module</span>](#New_and_Modified_Tables_in_Phenotype_Module)
- [<span class="tocnumber">4</span> <span class="toctext">Recommended
  Deprecated Fields</span>](#Recommended_Deprecated_Fields)
- [<span class="tocnumber">5</span> <span class="toctext">Controlled
  Vocabularies</span>](#Controlled_Vocabularies)
- [<span class="tocnumber">6</span> <span class="toctext">Older
  proposals</span>](#Older_proposals)



## <span id="Overview" class="mw-headline">Overview</span>

Increasingly phenotypes are rarely indicated with single, pre-composed
term. A particular phenotype (or phene) can be described with an EAV
statement (entity-attribute-value), or perhaps with more complex EQ
statements (Entity-Quality statements in which the Entity and Quality
parts themselves may contain several terms), and one expects even more
complex statements in the future. In addition to containing multiple
terms, these statements have a specific syntax that is critical to the
meaning of the statement.

Our goal was to make minimal changes to Chado, and some of those are in
the form of recommending deprecating some exiting table fields.

**Update, August 2015** The schema changes bellow offer the least
changes and will cover storing EAV and EQ statements, post and
pre-composed cvterms. These changes require only adding a new table,
phenotype_clause, and a number of new rows in phenotype_cvterm. We will
attempt to introduce these changes in Chado v1.3

  
**Update, Mar 2015:** After running a trial on option 2 below, we found
that the group table greatly increased the complexity of loading and
querying the data, so we decided that rather than permitting an
arbitrary level of statement structure hierarchy to force a maximum of 1
level of term grouping. This is expected to be sufficient for most if
not all statement structures currently in use.

## <span id="Proposal" class="mw-headline">Proposal</span>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d1/Chado_phenotype_proposal.clause.jpg"
width="1101" height="806"
alt="Chado phenotype proposal.clause.jpg" />

  

## <span id="New_and_Modified_Tables_in_Phenotype_Module" class="mw-headline">New and Modified Tables in Phenotype Module</span>

     - Add phenotypeprop table.
     - Add phenotype_clause table, used for grouping phenotype_cvterm records into clauses within a statement.
     - Add type_id field to phenotype_cvterm to indicate role of term in a phenotype statement.
     - Add optional phenotype_clause_id field to phenotype_cvterm to permit grouping phenotype_cvterm records into clauses within a statement.

     CREATE TABLE phenotypeprop (
        phenotypeprop_id SERIAL PRIMARY KEY,
        phenotype_id INT NOT NULL,
           FOREIGN KEY (phenotype_id) REFERENCES phenotype (phenotype_id) ON DELETE CASCADE INITIALLY DEFERRED,
        type_id INT NOT NULL,
           FOREIGN KEY (type_id) REFERENCES cvterm (cvterm_id) ON DELETE CASCADE INITIALLY DEFERRED,
        value TEXT NULL,
        rank INT NOT NULL DEFAULT 0,

        CONSTRAINT phenotypeprop_c1 UNIQUE (phenotypeprop_id,type_id,rank)
     );
     COMMENT ON TABLE phenotypeprop IS "This table can be used to attach additional information to a phenotype or trait that is not part of the term or post-composed term. For example, heritability of a trait, dominant/recessive, et cetera.";

     CREATE TABLE phenotype_clause (
        phenotype_clause_id SERIAL PRIMARY KEY,
        uniquename TEXT NOT NULL,
        type_id INT NOT NULL,
           FOREIGN KEY (type_id) REFERENCES cvterm (cvterm_id) ON DELETE CASCADE INITIALLY DEFERRED,
        rank INT NOT NULL DEFAULT 0,
      );
     COMMENT ON TABLE phenotype_clause IS "Used to group phenotype_cvterm records into clauses, as are used in EQ statements where, for example, the primary entity may be a clause constructed with up to 3 terms";

     ALTER TABLE phenotype_cvterm 
       ADD COLUMN type_id INT NOT NULL,
          FOREIGN KEY type_id 
            REFERENCES cvterm (cvterm_id) ON DELETE CASCADE INITIALLY DEFERRED,
       ADD COLUMN phenotypeclause_id INT,
          FOREIGN KEY (grp_id) REFERENCES grp (grp_id) ON DELETE CASCADE INITIALLY DEFERRED,
     ;
     COMMENT ON COLUMN type_id IS "Name of this cvterm's role in a post-composed term";
     COMMENT ON COLUMN phenotypeclause_id IS "If this term is part of a clause within a statement, this field identifies the clause.";

  

## <span id="Recommended_Deprecated_Fields" class="mw-headline">Recommended Deprecated Fields</span>

     COMMENT ON TABLE phenotype IS 'Columns observable_id, assay_id 
     are deprecated to break the connection between the phenotype value and the
     trait. The phenotype table should be used to store precomposed terms and the 
     phenotype value. Use tables phenotype_cvterm to store the trait(s) associated 
     with the phenotype.';

## <span id="Controlled_Vocabularies" class="mw-headline">Controlled Vocabularies</span>

The parts of a post-composed statement will need to be described in a
cv. This could go into a new cv for each type of statement, or go into a
general, post-composed_term cv.

**For EQ statements:**  
Primary Entity  
Primary Entity 1  
Primary Entity 1 Relationship  
Primary Entity 2  
Quality  
Qualifier  
Secondary Entity  
Secondary Entity 1  
Secondary Entity 1 Relationship  
Secondary Entity 2  
...  

  

## <span id="Older_proposals" class="mw-headline">Older proposals</span>

See
[Talk%253AChado_Post-Composed_Phenotypes](Talk%253AChado_Post-Composed_Phenotypes "Talk:Chado Post-Composed Phenotypes")
for the older versions of this schema proposal








## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AChado_Post-Composed_Phenotypes" accesskey="t"
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Post-2DComposed_Phenotypes"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:12 on 19 August
  2015.</span>
<!-- - <span id="footer-info-viewcount">28,975 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->









<span id="top"></span>




# <span dir="auto">Chado Natural Diversity Module/natdiv call notes</span>









## <span id="Notes_from_the_Chado_Natural_Diversity_Module.2Fnatdiv_schema_changes_call_.28May_26th_2011.29" class="mw-headline">Notes from the [Chado_Natural_Diversity_Module/natdiv_schema_changes_call](natdiv_schema_changes_call "Chado Natural Diversity Module/natdiv schema changes call") (May 26th 2011)</span>

**ND paper** Sook and Naama will send a note when the working draft is
ready for review. All the authors can view the google doc. Let Naama
know if you'd like to make changes now.

**Genotype module**

- add type_id to genotype (can be null)
- add genotypeprop

  
**Phenotype module**

- phenotype table
- drop the Unique constraint from phenotype.unique? - problem with
  calling a column 'uniquename' but have it non-unique

also tables should have natural key that is not the PK

--Hilmar: phenotypes and their measurements are forced into 1-1
relationship because they are stored in the same table

--Seth: storing a different table for storing the phenotype value would
cause more problems (was discussed at the Hackathon - adding a phenotype
observation table)

--Lacey: allow to replicate the same phenotype experiment multiple
times. Need a phenotype relationship table to show replication of the
same experiment. We can add a name column to phenotype, this would solve
the uniquename problem and will be backward compatible.

--Lukas: post-composing terms should be made possible . Need an
additional linking table for post-composed terms, because these are not
props of the phenotype

--Yuri: using phenotypeprop for postcomposed terms was decided at the
Hackathon, and it works for us, but I can see how other approaches may
be better

--Lukas: terms like 'leaf size in an adult plat' - supporting
post-composed terms in a normalized database is important

in normalized database design we realize we have a many-many
relationship, adding a linking table would allow specifying as many
terms as needed for defining the term.

--Sook: value should stay in the phenotype table

--Seth: post-composition is a topic for another discussion because it
raises many new issues. Some were discussed at the Hackaton.

--Naama: all this does not affect the ND paper, because the phenotype
module is beyond its scope

**decisions**

- leaving uniquename as is. Those of us who are using it non-uniquely
  would have to concatenate something to this field
- Add name column to the phenotype table

--Bob: Flybase does not store quantitative terms, and they don't use
PATO terms. They also use either observable_id or attr_id (see more here
<a href="../Chado_Phenotype_Module_at_FlyBase" class="external free"
rel="nofollow">http://gmod.org/wiki/Chado_Phenotype_Module_at_FlyBase</a>)

--Naama: adding the name column could be the first step in deprecating
some of the columns in the phenotype table, if we go ahead and separate
the actual phenotype (EQ model, or anything else) from the measurement
(the value that would remain in the phenotype table)

  

------------------------------------------------------------------------

**phenotypeprop** some are using this table for post-composing terms,
which requires adding a cvalue_id , and also raises the question if this
is a good place for it.

  
**Suggestion**

- add a type_id to phenotype_cvterm (solve the post-composed terms
  issue). Need this to specify the relationship between the phenotype
  and the cvterm.
- think over adding phenotypeprop, but as a standard prop table (without
  cvalue_id)

**Decision**

- do not change the schema, and test the above suggestion.
- Yuri will add use case to the wiki, and possibly others. This is
  important for the next phase of the phenotype module.

The suggested changes seem small, but they will change completely the
way we store phenotype, measurements, re-use phenotypes, etc.

--Scott: I want to have a new release of Chado more or less together
with the submission of the paper. Need to do this soon.

--Lacey: -Add a note to the ND paper about the future changes to the
phenotype module that would allow efficiently post-composition of terms
This is important because whoever uses ND would want to know how to use
the phenotype moule (Naama will add this to the paper)

------------------------------------------------------------------------

**Agreed**

- fill the Doodle for a meeting next week, because we need to talk about
  Yuri's proposed changes first. This is important for the Chado release
  and the ND paper.
- Commit the schema changes to the genotype and phenotype modules
- Work on the wiki with the proposal for using phenotype_cvterm for
  post-composed cvterms (with type_id column). If this does not work,
  need to consider another linking table specific for phenotypes.

------------------------------------------------------------------------








## Navigation menu







<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>


### Navigation



- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>




### Documentation



- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a
  href="../Special%253ABrowse/Chado_Natural_Diversity_Module-2Fnatdiv_call_notes"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 01:02 on 1 June
  2011.</span>
<!-- - <span id="footer-info-viewcount">5,218 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





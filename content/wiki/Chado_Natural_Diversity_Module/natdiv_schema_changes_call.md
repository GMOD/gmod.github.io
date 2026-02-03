---
title: "Chado Natural Diversity Module/natdiv schema changes call"
---




<span id="top"></span>




# <span dir="auto">Chado Natural Diversity Module/natdiv schema changes call</span>









Conference call to resolve the latest proposed changes to [natdiv
module](../Chado_Natural_Diversity_Module.1 "Chado Natural Diversity Module").

  


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Meeting
  notes</span>](#Meeting_notes)
- [<span class="tocnumber">2</span>
  <span class="toctext">Participants</span>](#Participants)
- [<span class="tocnumber">3</span>
  <span class="toctext">Agenda</span>](#Agenda)
- [<span class="tocnumber">4</span> <span class="toctext">Proposed
  changes</span>](#Proposed_changes)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Prop table
    in genotype module</span>](#Prop_table_in_genotype_module)
  - [<span class="tocnumber">4.2</span> <span class="toctext">Hackathon
    changes</span>](#Hackathon_changes)
  - [<span class="tocnumber">4.3</span> <span class="toctext">Yuri's
    proposals</span>](#Yuri.27s_proposals)
  - [<span class="tocnumber">4.4</span> <span class="toctext">Bob's
    proposals</span>](#Bob.27s_proposals)



## <span id="Meeting_notes" class="mw-headline">Meeting notes</span>

- Thursday, May 26, 6pm BST / 1pm EST / 10am PST
  [Chado_Natural_Diversity_Module/natdiv_call_notes](natdiv_call_notes "Chado Natural Diversity Module/natdiv call notes")

<!-- -->

- Wednesday, June 1, 5pm BST / 12pm EST / 9am PST
  [Chado_Naural_Diversity_Module/natdiv_props_call_notes](../Chado_Naural_Diversity_Module/natdiv_props_call_notes "Chado Naural Diversity Module/natdiv props call notes")

## <span id="Participants" class="mw-headline">Participants</span>

- Seth
- Bob [Made some notes here](../User_talk%253AMaccallr "User talk:Maccallr")
- Scott
- Rob
- Naama
- Lukas
- Sook
- Yuri
- Maren
- Lacey
- Hilmar

## <span id="Agenda" class="mw-headline">Agenda</span>

1.  Triage proposed changes into the following categories:
    - implement before paper publishing
    - implement after paper publishing
    - do not implement
2.  Bio%253A%253AChado%253A%253ASchema update
    - can someone do one after the changes have been made? Maccallr
      14:37, 26 May 2011 (UTC)

## <span id="Proposed_changes" class="mw-headline">Proposed changes</span>

### <span id="Prop_table_in_genotype_module" class="mw-headline">Prop table in genotype module</span>

- change: addition of (vanilla) prop table to genotype module
  \[cvterm_id, value, rank\]
  - proposer: Seth Redmond / Vectorbase
  - reason: enables us to store ontology terms for current genotypes,
    e.g. presence/absence of specific inversions - impossible under
    current schema
  - Did I understand correctly that for a genotypeprop table that
    cvterm_id would allow NULL? [Scott](../User%253AScott "User%253AScott")
    17:17, 26 May 2011 (UTC)

### <span id="Hackathon_changes" class="mw-headline">Hackathon changes</span>

- phenotype
- phenotypeprop (Can somebody add the reason for adding this table?)
- SVN: gmodnatdiv branch:
  - GMOD Evo Hackathon changes to phenotype module 1) Removed UNIQUE and
    NOT NULL constraints on phenotype.uniquename. 2) Added
    phenotype.units_id. 3) Added phenotypeprop table. 4) Deprecated
    phenotype_cvterm table.
  - Diff: <a
    href="http://gmod.svn.sourceforge.net/viewvc/gmod/schema/branches/gmodnatdiv/modules/phenotype/phenotype.sql?r1=24150&amp;r2=24140&amp;pathrev=24150"
    class="external free"
    rel="nofollow">http://gmod.svn.sourceforge.net/viewvc/gmod/schema/branches/gmodnatdiv/modules/phenotype/phenotype.sql?r1=24150&amp;r2=24140&amp;pathrev=24150</a>

### <span id="Yuri.27s_proposals" class="mw-headline">Yuri's proposals</span>

- Wouldn't it be preferable to give at least workable solutions to the
  two significant flaws of the phenotype module before publishing the
  paper? From the last call, these are:
  - Phenotype description and value are 1:1 and in the same table.
    Solution: Use nd_experiment_phenotypeprop to store values.
    - It is not necessarily 1:1. Phenotype description is stored in
      cvterm table. The phenotype table stores the value (value or
      cvalue_id) and has foreign keys (observable_id, attr_id). We could
      choose to use either one foreign key to connect to one phenotype
      descriptor or use both. So current schema can store 1 to M,
      phenotype descriptor to value. (Sook)
      - I think the phenotype table should store the description. Eg,
        phenotype.observable_id='stem diameter'. --
        [Yuri](../User%253AYbendana "User%253AYbendana")
  - No (straightforward) way available to do post-composition of
    phenotype descriptions. Solution: Use phenotypeprop with cvalue_id
    - I think post composition can be done in cvterm_relationship table.
      All of those terms 'stem diameter at harvest in mm',
      'Stem_diameter', 'at harvest', and 'mm' can be stored in cvterm
      table. The cvterm_relationship table then can store the
      relationships between 'stem diameter at harvest' and 'stem
      diameter' with the term 'part of ' 'belongs to' 'unit' or whatever
      relationship term appropriate.(Sook)
      - You would need a way to link from the phenotype table to the
        cvterm_relationship table. In your example, 'stem diameter'
        would be stored in phenotype table. The modifier 'at harvest'
        can be stored in phenotypeprop: type_id='at',
        cvalue_id='harvest'. phenotypeprop also gives the flexibility to
        store literal values, such as type_id='at', value='6/1/2009'. I
        think the unit should be stored near where the value is stored,
        in this case nd_experiment_phenotypeprop (see below).
        --[Yuri](../User%253AYbendana "User%253AYbendana")
  - These solutions are easy to implement and can always be refined at
    some later date.
- Add environmentprop. This is useful when creating phenstatements.
  - Example phenstatement: “The mean of the phenotype root length in
    genotype TN7.4 given an environment of NaCl treatment of 100
    millimolar is 10.5 mm”
  - environment: uniquename='100 NaCl'
  - environmentprop: type_id='NaCl treatment', value=100, cvalue_id='mM'
    - How about '100 mM NaCl' as environment.uniquename? It can be
      linked to cvterm via environment_cvterm table.'100 mM NaCl', 'NaCl
      treatment' and 'mM' can all be separately stored in cvterm table
      and associated via cvterm_relationship table (see above). I think
      cvalue_id is to store qualitative values that can be stored in
      cvterm table, not for the units(Sook).
      - A unit can be a cvterm. I'm using the units in the Unit
        Ontology. --[Yuri](../User%253AYbendana "User%253AYbendana")
    - or just store '100 mM' in the value field. Or the cvterm should
      have the unit as part of its definition 'NaCl in mM'
      --[NaamaMenda](../User%253ANaamaMenda "User%253ANaamaMenda") 13:58, 1 June
      2011 (UTC)
      - I prefer to separate the term, value and unit. Especially if the
        term and unit are already in cvterm. You are suggesting I should
        precompose all my terms and I don't think this is necessary (or
        realistic) for units. --[Yuri](../User%253AYbendana "User%253AYbendana")
- Add phenstatementprop. This is useful when creating phenstatements.
  - phenstatement: type_id = 'summary statistic', phenotype_id='flower
    number', genotype_id='TN7.4', pub_id='experimental result'
  - phenstatementprop: type_id='mean', value = 10.5, cvalue_id='mm'
    - this is the actual phenotype value, and should be in the phenotype
      table , or whatever other table we choose for values or
      post-composed terms.
      - This is **not** a phenotype value. This is a summary statistic
        across experiments. --[Yuri](../User%253AYbendana "User%253AYbendana")
- Add nd_experiment_protocolprop. I use this to store protocol values
  specific to an nd_experiment.
  - Eg: nd_protocol.type_id='NaCl treatment',
    nd_experiment_protocolprop:{type_id='treatment amount', value=100,
    cvalue_id='mM'}
  - +1, could definitely use this for same reasons (e,g, same
    insecticide resistance assay protocol, but with different
    insecticides, exposure times, and/or concentrations; currently using
    nd_experimentprop) Maccallr
    13:24, 30 May 2011 (UTC)
    - Can we make multiple protocols, such as NaCl 100mM, NaCl 10mM,
      etc, (or insecticide resistance assay 1, 2, etc) and link to
      nd_experiment table? If we want to group similar protocols, we
      could use protocolprop (type_id = protocol_type, value =
      insecticide resistance assay protocol). The details can be stored
      in protocolprop (type_id=exposure time, value=1 hr:
      type_id=concentration, value= 10 mM), etc). The insecticide can
      also be stored in reagent table(Sook).
    - Aren't these different protocols if you are using different
      amounts? I don't think the amounts are properties of the protocol.
      --[NaamaMenda](../User%253ANaamaMenda "User%253ANaamaMenda") 13:58, 1 June
      2011 (UTC)
      - I guess you could say the value is a property of both the
        protocol and the experiment.
        --[Yuri](../User%253AYbendana "User%253AYbendana")
    - I also think prop tables for linking tables are not consistent
      with the rest of chado tables and make chado schema too
      complicated (Sook).
      - I originally got this idea from nd_experiment_stockprop, so
        there's definitely precedent for this.
        --[Yuri](../User%253AYbendana "User%253AYbendana")

<!-- -->

- Add nd_experiment_phenotypeprop. I use this to store phenotype
  observations specific to an nd_experiment.
  - Eg: phenotype.observable_id='root length',
    nd_experiment_phenotypeprop:{type_id='observation', value=10.5,
    cvalue_id='mm'}
    - 10.5 can be stored in phenotype.value and the unit can be
      associated with the cvterm itself in the cvterm table (Sook).
- Add cvalue_id to NatDiv property tables and related property tables
  like projectprop. This allows for postcomposition of cvterms like
  units to the property type_id.
  - Eg: type_id='my experimental bucket color', cvalue_id='purple'
    - phenotype_cvterm with a type_id column should do. Should we add
      this to the sql file in a new svn branch ?
      --[NaamaMenda](../User%253ANaamaMenda "User%253ANaamaMenda") 13:58, 1 June
      2011 (UTC)
      - This proposal was about more than just phenotypes. In several
        property tables I'm storing values that have units. Using a
        cvalue_id would also cut down on the amount of literal strings
        I'm storing in value fields. --
        [Yuri](../User%253AYbendana "User%253AYbendana")
  - Clarification: I didn't propose this originally but Naama brought up
    the concern that the property tables weren't consistent if some have
    cvalue_id and others don't.
    - The issue here is whether the prop tables are the right place for
      this. I think we can add non-uniform columns to prop tables,
      assuming it is necessary, and Chado has no better way to answer. I
      think broad usage of prop tables should be limited. Look at props
      as a place to add some unstructured metadata (dates, names of
      places, nicknames, maybe synonyms, or anything else you do not
      wish to structure as a cvterm). If the data does need structure,
      it is better to store it in a designated well defined table. This
      is also better for querying the database. With cvalue_id you need
      to ask does my prop has a cvalue? what is the meaning of my
      cvalue? etc. --[NaamaMenda](../User%253ANaamaMenda "User%253ANaamaMenda")
      13:58, 1 June 2011 (UTC)
      - So, it sounds like what you are saying is that either data must
        be precomposed in an ontology or it should be a literal value.
        And what I'm saying is why not give the flexibility to
        post-compose cvterms? I think it's clear in the example I gave
        the meaning of 'purple' when the property is 'bucket color'. --
        [Yuri](../User%253AYbendana "User%253AYbendana")
  - Chado has some way to
    <a href="../Chado_CV_Module#Post-coordinating_Terms"
    class="external text" rel="nofollow">post-compose cvterms</a> which
    Maccallr
    11:56, 17 May 2011 (UTC) doesn't understand.
    - It looks rather complex.
      --[Yuri](../User%253AYbendana "User%253AYbendana")

(Sook) I think that the solution is to store the phenotypic value in the
phenotype table and store the cvterm_id of the post-composed phenotypic
descriptor in the phenotype table. The further-up cvterms can be
associated via cvterm_relationship table. We only use 'attr_id' to store
the final post-composed phenotypic descriptor. It might be better to
have descriptor_id in the phenotype table so that users who use both
'attr_id' and 'observable_id' can keep their practice.

- It was decided in the meeting to discuss these major changes to the
  phenotype module in another discussion topic. It was also proposed to
  see if phenotype_cvterm with a type_id field would be adequate. It is
  clear the phenotype table does not address well post-composing terms,
  yet we'd like to avoid making the same mistake again of adding
  multiple columns, which renders the schema not normalized. Also prop
  tables are not an ideal place for phenotype values (see more in the
  [Chado_Natural_Diversity_Module/natdiv_call_notes](natdiv_call_notes "Chado Natural Diversity Module/natdiv call notes")
  ). We should keep this discussion related directly to the ND schema,
  and hammer out the phenotype module as a second stage.
  --[NaamaMenda](../User%253ANaamaMenda "User%253ANaamaMenda") 01:14, 1 June
  2011 (UTC)
  - I started a discussion for this page to address the phenotype module
    proposed changes. (click on the 'discussion' tab at the top of the
    page) --[NaamaMenda](../User%253ANaamaMenda "User%253ANaamaMenda") 14:08, 1
    June 2011 (UTC)

### <span id="Bob.27s_proposals" class="mw-headline">Bob's proposals</span>

Just looking at the NatDiv prop tables, saw some inconsistencies:

- nd_geolocationprop.value is varchar(250) while others in NatDiv
  are 255. Rest of chado is type 'text'. Propose change to text.

this means we need to change the value type in all nd prop tables to
text (Naama)

- nd_experimentprop.value is NOT NULL while all others (in NatDiv) allow
  NULL (rest of chado is mixed). Propose all allow NULL.

This was already fixed. I committed the SQL a couple of weeks ago
(Naama)

- - I just haven't rolled it into the default_schema.sql yet
    [Scott](../User%253AScott "User%253AScott") 17:10, 26 May 2011 (UTC)




[Categories](../Special%253ACategories "Special%253ACategories"):

- [Natural
  Diversity](../Category%253ANatural_Diversity "Category%253ANatural Diversity")
- [Chado Modules](../Category%253AChado_Modules "Category%253AChado Modules")






## Navigation menu



### Namespaces


- <span id="ca-talk"><a
  href="../Talk%253AChado_Natural_Diversity_Module/natdiv_schema_changes_call"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>



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
  href="../Special%253ABrowse/Chado_Natural_Diversity_Module-2Fnatdiv_schema_changes_call"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 15:05 on 4 February
  2012.</span>
<!-- - <span id="footer-info-viewcount">110,897 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





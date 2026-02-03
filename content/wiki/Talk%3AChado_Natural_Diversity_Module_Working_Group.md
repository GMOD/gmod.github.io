---
title: "Talk:Chado Natural Diversity Module Working Group"
---




<span id="top"></span>




# <span dir="auto">Talk:Chado Natural Diversity Module Working Group</span>












## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Responsibilities</span>](#Responsibilities)
- [<span class="tocnumber">2</span> <span class="toctext">January
  2010</span>](#January_2010)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Schema
    Change Logistics</span>](#Schema_Change_Logistics)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Schema
    Design Tools /
    Visualization</span>](#Schema_Design_Tools_.2F_Visualization)
  - [<span class="tocnumber">2.3</span>
    <span class="toctext">Observational
    Taxonomy</span>](#Observational_Taxonomy)
    - [<span class="tocnumber">2.3.1</span>
      <span class="toctext">Stock</span>](#Stock)
    - [<span class="tocnumber">2.3.2</span>
      <span class="toctext">Observational Taxonomy
      Proposal</span>](#Observational_Taxonomy_Proposal)
      - [<span class="tocnumber">2.3.2.1</span>
        <span class="toctext">Observational
        Unit</span>](#Observational_Unit)
    - [<span class="tocnumber">2.3.3</span>
      <span class="toctext">Observational Unit
      Relationships</span>](#Observational_Unit_Relationships)
    - [<span class="tocnumber">2.3.4</span>
      <span class="toctext">Current Status</span>](#Current_Status)
  - [<span class="tocnumber">2.4</span>
    <span class="toctext">Project/Experiment/Study
    Hierarchy</span>](#Project.2FExperiment.2FStudy_Hierarchy)
  - [<span class="tocnumber">2.5</span> <span class="toctext">Phenotypes
    and Genotypes</span>](#Phenotypes_and_Genotypes)
    - [<span class="tocnumber">2.5.1</span>
      <span class="toctext">Phenotypes</span>](#Phenotypes)
      - [<span class="tocnumber">2.5.1.1</span>
        <span class="toctext">HDB Design</span>](#HDB_Design)
    - [<span class="tocnumber">2.5.2</span>
      <span class="toctext">Genotypes</span>](#Genotypes)
    - [<span class="tocnumber">2.5.3</span>
      <span class="toctext">Functional and Sequence
      Alleles</span>](#Functional_and_Sequence_Alleles)
  - [<span class="tocnumber">2.6</span> <span class="toctext">Assays,
    Images</span>](#Assays.2C_Images)
  - [<span class="tocnumber">2.7</span> <span class="toctext">Action
    Items</span>](#Action_Items)
- [<span class="tocnumber">3</span> <span class="toctext">February
  2010</span>](#February_2010)
  - [<span class="tocnumber">3.1</span> <span class="toctext">8 Feb 2010
    Teleconference</span>](#8_Feb_2010_Teleconference)
- [<span class="tocnumber">4</span> <span class="toctext">March
  2010</span>](#March_2010)
- [<span class="tocnumber">5</span> <span class="toctext">April
  2010</span>](#April_2010)
- [<span class="tocnumber">6</span> <span class="toctext">simplified
  schema (ND tables
  only)</span>](#simplified_schema_.28ND_tables_only.29)


This is the *discussion* page for the [Chado Natural Diversity Module
Working
Group](Chado_Natural_Diversity_Module_Working_Group "Chado Natural Diversity Module Working Group").
Notes on what we talk about and what decisions are made will be posted
here. Eventually, as we settle on specific outcomes, those outcomes will
be posted to the main page, and eventually reflected in the Chado
schema.

  
At this time (January 2010), most of this discussion is about making
changes relative to the version that was created in 2007 with
*Heliconius* in mind. This is referred to below as ***HDB***.

We will also use what came up at the PAG meeting as starting point for
the discussion. This will change over time, as things settle down.

# <span id="Responsibilities" class="mw-headline">Responsibilities</span>

***Note:** These responsibilities are flexible. They are just what we
decided at the PAG meetings. They are wide open to discussion (or just
add your name below.*

**Sook Jung** will take the lead on schema changes/development. Sook is
interested and is motivated to produce a working schema as soon as
possible.

**Dave Clements** will lead documentation efforts. Dave will produce
wiki documentation for the new tables. I hope to also create schema
diagrams (probably using Power Architect). Dave is also keenly
interested in how [phenotypes](#Phenotypes) are represented both in this
module, and in the rest of the Chado.

**Add your name here** ...

# <span id="January_2010" class="mw-headline">January 2010</span>

## <span id="Schema_Change_Logistics" class="mw-headline">Schema Change Logistics</span>

We have conflicting goals here:

1.  Some people need this module yesterday.
2.  Some people want this module to strike the *perfect* balance between
    usability and flexibility.

Neither group is opposed to the other group's goal *per se* - they just
happened to be incompatible goals.

To address both these needs, [Rob
Buells](User%253ARobertBuels "User%253ARobertBuels") proposed

- multiple incremental releases,
- with perhaps some backwards incompatibility,
- but always with a plan and code support for migrating from one release
  to the next.

Rob points out that this might also be a good test case for establishing
a formal process making backwards-incompatible updates to production
Chado.

  

## <span id="Schema_Design_Tools_.2F_Visualization" class="mw-headline">Schema Design Tools / Visualization</span>

Sook, who is leading this particular effort, has access to Quest Toad
for doing database design. She will likely send out proposals and
revisions at Toad diagrams.

Dave, whose (who's?) job is to document all this, can't afford Toad. He
will likely use Power\*Architect to generate final as well as some
intermediate documentation. Power\*Architect is free, which is within my
budget. (This also makes it possible for anyone else to update the doc
in the long term.)

## <span id="Observational_Taxonomy" class="mw-headline">Observational Taxonomy</span>

HDB has several different levels of biological unit, all represented
with a different set of tables

- Organism - This already exists and comes from the [Chado Organism
  Module](Chado_Organism_Module "Chado Organism Module"). It defines a
  species.
- <a
  href="http://heliconiusdb.svn.sourceforge.net/viewvc/heliconiusdb/trunk/schema/doc/diversity.html#biotype#biotype"
  class="external text" rel="nofollow">Biotype</a>
- <a
  href="http://heliconiusdb.svn.sourceforge.net/viewvc/heliconiusdb/trunk/schema/doc/diversity.html#stock#stock"
  class="external text" rel="nofollow">Stock</a> (which is different
  from the stock table already in Chado)
- <a
  href="http://heliconiusdb.svn.sourceforge.net/viewvc/heliconiusdb/trunk/schema/doc/diversity.html#individual#individual"
  class="external text" rel="nofollow">Individual</a>
- <a
  href="http://heliconiusdb.svn.sourceforge.net/viewvc/heliconiusdb/trunk/schema/doc/diversity.html#crossexperiment#crossexperiment"
  class="external text" rel="nofollow">Crossexperiment</a>
- <a
  href="http://heliconiusdb.svn.sourceforge.net/viewvc/heliconiusdb/trunk/schema/doc/diversity.html#specimen#specimen"
  class="external text" rel="nofollow">Specimen</a>

And there are a bevy of relationships between these tables.

|                 |     |                 |                                |
|-----------------|-----|-----------------|--------------------------------|
| Organism        | M:M | Biotype         |                                |
| Biotype         | 1:M | Stock           | there are 3 different 1:M rels |
| Stock           | 1:M | Individual      |                                |
| Crossexperiment | 1:M | Individual      |                                |
| Individual      | 1:M | Crossexperiemnt |                                |
| Individual      | 1:M | Specimen        |                                |
| Biotype         | M:M | Individual      |                                |

All of this tables describe some unit/group of biology/life, ranging
from species (organism) down to tissue in hand (specimen). The HDB
design has several *structurally identical* tables in HDB for the
various levels for different types of data (phenotype, images, ...).
This particular hierarchy is also particular to butterflies.

### <span id="Stock" class="mw-headline">Stock</span>

Both the HDB version and the production Chado have a stock table. The
[Chado Stock Module](Chado_Stock_Module "Chado Stock Module") was added
to production Chado while or after the HDB version was being developed.

The Chado Stock module is about keeping track of lines in your
lab/community. Someone needs to take a look at it and determine how the
natural diversity module should interact with it.

  

### <span id="Observational_Taxonomy_Proposal" class="mw-headline">Observational Taxonomy Proposal</span>

When Sook Jung mapped the HDB version to plant biology a number of
issues came up:

- HDB associates genotypes with specimen_id, but in many cases genotypes
  are recorded at the level of individual trees, not part of the trees.
- The hierarchy of Biotype/Stock/Individual/Specimen requires storing of
  the same data multiple times (eg. all the organism entries need to be
  stored in biotype table since stock table has only stock.biotype_id).
- Multiple crosses can be done in one project (F1, BC1, and BC2 etc) and
  the individual cross experiment need to be linked to the larger
  project.

1.  'crossexperiment' table may need to be linked to the project table
    by a linker table called 'crossexperiment_project', or
2.  We can have 'project_relationship' and 'projectprop' tables instead
    of 'crossexperiment' table to store data of various hierarchical
    projects (breeding experiments with multiple crosses and sub-trials,
    QTL projects with multiple crosses, etc).

This highlights that HDB is not a very Chadoesque design. We need to
genericize the design to support arbitrary hierarchies, lineages, and
mating types. This will support many more users and allow them to store
images, phenotypes, genotypes, properties, etc. for whatever level of
the hierarchy they have data for.

We can't touch Organism, as it's a key table in every Chado instance out
there. However, everything else is open to change.

#### <span id="Observational_Unit" class="mw-headline">Observational Unit</span>



The GDPDM has *observational units,* which represents whatever level of
sample you have data for. I find that name descriptive, but awkward.
Unfortunately, I can't think of a better name. Suggestions are welcome.



Specifics:

1.  Try to combine biotype, stock, individual, and crossexperiemt into a
    single table, tentatively called obs_unit (with a nod to GDPDM).
2.  Investigate also folding specimen into obs_unit.
3.  An observational unit's place in the observational taxonomy will be
    indicated by a new column in obs_unit that points to the CV table.
    For butterflies, the possible values might be "species", "biotype",
    "stock", "individual", and possibly "specimen"

### <span id="Observational_Unit_Relationships" class="mw-headline">Observational Unit Relationships</span>

We need to support arbitrary M:M relationships between different levels
of the observational taxonomy, and within the same level as well. For
example, we may want a complete chain from species to individual (or
plot or brood or ...), and that individual may have resulted from
crossing 2 other individuals (or from cloning one, or ...).

The common solution is to create a bridge/mapping/intersection table to
implement M:M relationships between obs_unit and itself. This table
would define the standard "subject relationship object" triple where the
subject and object are obs_unit's and the relationship is a CV term.

This also deals with complications in lineage and mating types. You can
represent *T. Thermophila* which has 7 mating types (any 2 will do), *C.
elegans* which has hermaphrodites and outcrossing, *E. coli* which is
asexual, ...

It was pointed out that this table may contain *cycles*. In some
experiments an individual will be crossed with it's descendents.
Therefore software that walks these relationships will need to detect
cycles.

### <span id="Current_Status" class="mw-headline">Current Status</span>

We're planning on moving ahead with merging the existing tables into a
single table. And, no we can't yet agree on that table name.

## <span id="Project.2FExperiment.2FStudy_Hierarchy" class="mw-headline">Project/Experiment/Study Hierarchy</span>

The current [Project
table](Chado_General_Module#Table:_project "Chado General Module") is
defined in the [General
Module](Chado_General_Module "Chado General Module"). The HDB design
links to it extensively. However, other modules hardly use it at all.

  
The GDR group needs to the ability to more robustly define
projects/studies, and to introduce substudies/project hierarchy, as
well.

## <span id="Phenotypes_and_Genotypes" class="mw-headline">Phenotypes and Genotypes</span>

### <span id="Phenotypes" class="mw-headline">Phenotypes</span>

Phenotypes are not particularly well defined in Chado.
[Scott](User%253AScott "User%253AScott") says that there are two sets of
phenotype tables in Chado. One is a first rough draft that snuck in (and
is used by some), and the other is a more robust set, which is used by
others (including FlyBase). Too make things worse, which tables are in
which set is not presently clearly defined.

Dave C. will do some research into

1.  What is currently going on in Chado?
    - Which tables are in the old and new implementations?
    - How are those tables currently used, and by whom?
2.  What are best practices for representing phenotypes in a generic
    database like Chado?

If items \#2 and \#1 don't line up, and there are not a lot of current
users, then I would like to look into

1.  reimplementing phenotypes in Chado, and
2.  providing migration paths for what users we do have.

  

#### <span id="HDB_Design" class="mw-headline">HDB Design</span>

The HDB version of the module ties into the preexisting [phenotype
table](Chado_Phenotype_Module#Table:_phenotype "Chado Phenotype Module").
The phenotype table has 4 foreign keys pointing to the [cvterm
table](Chado_CV_Module#Table:_cvterm "Chado CV Module"):

|  |  |
|----|----|
| observable_id | The entity: e.g. anatomy_part, biological_process. |
| attr_id | Phenotypic attribute (quality, property, attribute, character) - drawn from PATO. |
| cvalue_id | Phenotype attribute value (state). *There is also a* value *text column which can hold unconstrained text. In any given record, exactly one of cvalue and value should have a non-null value.* |
| assay_id | Evidence type |

Any of these 4 columns can be null.

  
There is also a [phenotype_cvterm
table](Chado_Phenotype_Module#Table:_phenotype_cvterm "Chado Phenotype Module")
to hold CV terms that don't fit cleanly into the 4 CV term columns in
phenotype.

It is not obvious to us (who aren't that familiar with PATO), why the
observable_id and attr_id columns are special enough to get their own
permanent columns in the phenotype table. Shouldn't they be thrown in
phenotype_cvterm as well?

The current setup would work for:

Rohan-beard nerve cells show elevated response.

But would it work for

Rohan-beard nerve cells in the top of the dorsal fin show a faster and
stronger response <span style="font-size: 80%"> (Yes, I know this
example may not make biological sense.)</span>

Is this annotation fundamentally about Rohan-beard cells, the dorsal
fin, the top of the dorsal fin, or all them put together? With the
current design one of them has to come first.

As mentioned above, this area needs more research, or maybe just more
documentation.

### <span id="Genotypes" class="mw-headline">Genotypes</span>

Genotypes appear to be more clearly defined in the production Chado
schema: A genotype is a collection of features.

We discussed a particular use case: How would you store the results of
an SSR assay? For example, in some individuals a given SSR is *n* bases
long, while in another it is *m* bases long.

This would go in the genotype and feature tables. However, we may not be
clear yet on where the length would go.

### <span id="Functional_and_Sequence_Alleles" class="mw-headline">Functional and Sequence Alleles</span>

Sook pointed out the need to represent both *functional* and *sequence*
alleles. She explained: An apple geneticist who is working on a locus
called F-M locus found three functional alleles and 12 sequence alleles.

- **Functional:** morphologically defined alleles (F, f and f1)
- **Sequence:** four SSR variants for F, six SSR variants for f, and two
  for f1 alleles.

We worked this out as functional alleles are stored in the phenotype
tables, and sequence alleles in the feature and genotype tables.

## <span id="Assays.2C_Images" class="mw-headline">Assays, Images</span>

HDB includes support for images and assays. We should probably have a
general purpose solution that is usable for all images and assays, not
just those in the natural diversity module.

  

## <span id="Action_Items" class="mw-headline">Action Items</span>

Sook will

- write up some use cases
- generate a revised schema (perhaps just a draft), including a diagram

Dave will

- create a Doodle poll to determine the best time to meet.
  <a href="http://www.doodle.com/f2gd36wu5s4krfrt" class="external text"
  rel="nofollow">Poll is here</a>.
- announce this group, this page, our next meeting, and the doodle poll
  to the GMOD Schema list.

Anything else?

# <span id="February_2010" class="mw-headline">February 2010</span>

The first meeting in February will be held Monday February 8, at 11am
Eastern US. Contact [Dave C](User%253AClements "User%253AClements") if you are
interested in participating in this meeting.

Meetings after that will be scheduled at a regular time according to
when people are usually available. Please fill out this
<a href="http://www.doodle.com/f2gd36wu5s4krfrt" class="external text"
rel="nofollow">Doodle poll</a> to let us know when you can make it.

Scheduling this will be tough as we have key interested parties in
Europe and across the contiguous US.

## <span id="8_Feb_2010_Teleconference" class="mw-headline">8 Feb 2010 Teleconference</span>

- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/0c/NaturalDiversityChado20100208.pdf"
  class="internal" title="NaturalDiversityChado20100208.pdf">Proposal from
  Sook (PDF)</a>
  (<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/95/NaturalDiversityChado20100208.pptx"
  class="internal" title="NaturalDiversityChado20100208.pptx">PPT</a>)

# <span id="March_2010" class="mw-headline">March 2010</span>

- <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/88/ChadoDiversityMar032010.pdf"
  class="internal" title="ChadoDiversityMar032010.pdf">New Proposal from
  Sook (PDF)</a>: Contains Use Cases and new/deleted/modified tables
  from HDB
- <a
  href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3b/Natural_diversity_module_Mar03_2010.txt"
  class="internal" title="Natural diversity module Mar03 2010.txt">SQL</a>

# <span id="April_2010" class="mw-headline">April 2010</span>

Topic for Apr Teleconference Meeting

- The structure of diversityexperiment table and four different
  sub-tables

<!-- -->

- Renaming tables
  - ptexperiment/gtexperiment to ptassay/gtassay?
  - ptassay/gtassay to ptprotocol/gtprotocol or ptassaytype/gtassaytype
    or ptmethod/gtmethod?
  - diversityexperiment?

<!-- -->

- Do we need crossexperiment table linked to stocksample table via
  diversityexperiment?

We (GDR) definitely need some sort of crossexperiment table linked to
stock instead of stocksample

- - crossexperiment (crossexperiment_id, name, expdate, experimenter_id,
    geolocation_id, type_id)
  - crossexperiment_stock (crossexperiment_stock_id, crossexperiment_id,
    stock_id, type_id)
  - crossexperimentprop (crossexperimentprop_id, crossexperiment_id,
    cvterm_id, value, rank)
  - crossexperiment_project

If we need current crossexperiment table, we could name this new set of
tables using cross- instead of crossexperiment-

  

- Adding diversityexperiment.collection_date

  

# <span id="simplified_schema_.28ND_tables_only.29" class="mw-headline">simplified schema (ND tables only)</span>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fa/Natdiv_simplified_SGN.png" width="1600"
height="943" alt="Natdiv simplified SGN.png" />

[Notes on simplified nd schema and Use
Cases](Notes_on_simplified_nd_schema_and_Use_Cases "Notes on simplified nd schema and Use Cases")








## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AChado_Natural_Diversity_Module_Working_Group"
  accesskey="t"
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




- <span id="footer-info-lastmod">Last updated at 17:18 on 27 August
  2010.</span>
<!-- - <span id="footer-info-viewcount">49,809 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->









<span id="top"></span>




# <span dir="auto">Notes on simplified nd schema and Use Cases</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">SQL</span>](#SQL)
- [<span class="tocnumber">2</span> <span class="toctext">Schema
  Drawing</span>](#Schema_Drawing)
- [<span class="tocnumber">3</span> <span class="toctext">Notes on the
  tables</span>](#Notes_on_the_tables)
- [<span class="tocnumber">4</span> <span class="toctext">Use
  Cases</span>](#Use_Cases)
  - [<span class="tocnumber">4.1</span> <span class="toctext">tree fruit
    breeding data (tfGDR)</span>](#tree_fruit_breeding_data_.28tfGDR.29)
    - [<span class="tocnumber">4.1.1</span> <span class="toctext">Cross
      Experiment</span>](#Cross_Experiment)
    - [<span class="tocnumber">4.1.2</span>
      <span class="toctext">Phenotype Assay</span>](#Phenotype_Assay)
  - [<span class="tocnumber">4.2</span> <span class="toctext">mosquito
    field collections</span>](#mosquito_field_collections)
    - [<span class="tocnumber">4.2.1</span> <span class="toctext">Field
      Collections +
      karyotyping</span>](#Field_Collections_.2B_karyotyping)
      - [<span class="tocnumber">4.2.1.1</span>
        <span class="toctext">Collection</span>](#Collection)
      - [<span class="tocnumber">4.2.1.2</span>
        <span class="toctext">Karyotyping</span>](#Karyotyping)
    - [<span class="tocnumber">4.2.2</span>
      <span class="toctext">Questions:</span>](#Questions:)
  - [<span class="tocnumber">4.3</span> <span class="toctext">mosquito
    phenotype data</span>](#mosquito_phenotype_data)
    - [<span class="tocnumber">4.3.1</span> <span class="toctext">RNAi
      knockdown experiments</span>](#RNAi_knockdown_experiments)
    - [<span class="tocnumber">4.3.2</span> <span class="toctext">stocks
      selected for phenotype</span>](#stocks_selected_for_phenotype)
      - [<span class="tocnumber">4.3.2.1</span>
        <span class="toctext">stock selection</span>](#stock_selection)
      - [<span class="tocnumber">4.3.2.2</span>
        <span class="toctext">genotyping
        performed</span>](#genotyping_performed)
    - [<span class="tocnumber">4.3.3</span>
      <span class="toctext">Insecticide Resistance
      Assay</span>](#Insecticide_Resistance_Assay)



## <span id="SQL" class="mw-headline">SQL</span>

<a
href="https://gmod.svn.sourceforge.net/svnroot/gmod/schema/branches/integrate_natdiv/chado/modules/natural_diversity/natural_diversity.sql"
class="external free"
rel="nofollow">https://gmod.svn.sourceforge.net/svnroot/gmod/schema/branches/integrate_natdiv/chado/modules/natural_diversity/natural_diversity.sql</a>

  

## <span id="Schema_Drawing" class="mw-headline">Schema Drawing</span>

<a
href="http://gmod.org/w/index.php?title=Talk%253AChado_Natural_Diversity_Module_Working_Group#April_2010#April_2010"
class="external free"
rel="nofollow">http://gmod.org/w/index.php?title=Talk%253AChado_Natural_Diversity_Module_Working_Group#April_2010</a>

## <span id="Notes_on_the_tables" class="mw-headline">Notes on the tables</span>

stock

- Stores all types (groups or individuals) of germplasm, and their
  relationship is defined through stock_relationship table
- Stock Relationship Ontology under development in the page below

<a href="Stock_Relationship_Ontology" class="external free"
rel="nofollow">http://gmod.org/wiki/Stock_Relationship_Ontology</a>

  

nd_assay

- The type_id would store whether the assay is phenotype assay, genotype
  assay, crossexperiment, field collection study. or any other potential
  assays.
- In case of phenotype/genotype assay, the assay_id is unique per
  specific sample of a stock (part or clone of a stock under specific
  treatment), per collection date (eg. postharvest phenotype assay), per
  assay date, per type of protocol (eg. a specific molecular marker in
  case of genotype assay)

  
nd_assay_phenotype

- linking table between nd_assay and phenotype
- **Question:** The SQL document says that there is one to one
  relationship between assay_id and phenotype_id but multiple samples
  can have the same phenotypic value so it would be many to one
  relationship. For example, the phenotypic value of firmness (eg.
  apple) varies from 1 to 5 (1 being very soft and 5 being very firm).
  Multiple assay_ids, therefore, can be linked to phenotype_id with the
  attr_id 'firmness' and value 1.

\- \[Naama\] From my understanding every time you measure a phenotype
you store it it the phenotype table with the relevant attributes. I
don't think you are supposed to 'reuse' these records, even if you get a
similar measurement.  
- \[Sook\] Perhaps chado users could choose either way? If we check 1000
flies and 500 of them had white eyes and the rest of them had red eyes,
we can only have two rows in phenotype table - red or white. Otherwise
we'll have 1000 rows each connected with individual assay.. I think
ParameciumDB store distinct phenotypes and link to multiple stocks.
<a href="http://paramecium.cgm.cnrs-gif.fr/db/Phenotype/5"
class="external free"
rel="nofollow">http://paramecium.cgm.cnrs-gif.fr/db/Phenotype/5</a>

  
nd_assay_genotype

- linking table between nd_assay and genotype
- **Question:** For heterozygotes, do we store the genotype of an
  individual or an allele? In another word, when SSR results in 200 in
  one allele 230 in another for a locus of an individual, do we store
  200/230 in genotype table or 200 and 230 separately? If we store the
  genotype of an allele in the genotype table, one nd_assay_id should be
  able to linked to multiple genotype_id. So nd_assay to genotype will
  be many to many in that case.

-\[Naama\] I would say for individuals you store the heterozygous
genotype (200/230) and for an allele entry you store the actual allele
genotype. If your individual is in the stock table, I guess you could
link it to the allele and retrieve the genotype from there.

nd_assayprop

- Stores all the assay related data using cvterm_id and value
- The sample_id (or clone_id, tree_id, etc) of a stock, when part of a
  stock was used as a sample or a stock was propagated to produce
  multiple clones.
- Any treatment or environmental condition applied to the sample
  (fertilizer, salt conc, temp, etc), which are not part of a specific
  phenotyping/genotyping protocol
- Any property of a sample (eg. number of fruits picked per sample,
  fresh vs. stored, etc)
- Dates (collection date/assay date for phenoytping assay, assay date
  for genotyping assay, cross date for cross experiment and collection
  start/end date for field collection experiment)
- cross name/ID and cross type (F1, F2, etc) for cross experiment
- Notes and comments for a specific assay
- **Question:** Experimenter_id could be stored in cvterm_id and value
  and link to contact table OR do we better have nd_assay_contact table?

-\[Naama\] experimenter_id should be in a contact table (contact_id) .  
-\[Sook\] Then can we add assay_contact table?

  
nd_assay_project

- Links individual assays/crosses to a bigger project
- Related tables: projectprop and project_relationship

  
nd_assay_stock

- Linking table between nd_assay and stock
- New stocks can be generated by nd_assay in case of field collection or
  cross experiment (progeny)
- Or stock can be used for nd_assay in case of phenotype assay, genotype
  assay, and cross experiment (parent)
- The type_id can record whether the stock is a female parent, male
  parent, parent for mutation, or progeny in case of cross experiment
- The rootstocks that are used in planting fruit trees can be recorded
  in nd_assay_stock and the type_id could represent 'root stock'.

  
nd_assay_stockprop

- Since nd_assay_stock is only a linking table now, not a table to store
  a specific sample of a stock, the IDs and the treatments done to the
  sample of a stock can be stored in nd_assayprop
- What could be stored here?

  
nd_protocol

- stores phenotyping/genotyping protocols
- For genotyping assays, the protocol would be equivalent to molcular
  markers

  
nd_protocolprop

- Any property of a protocol

  
nd_assay_protocol

- linking table between nd_assay and nd_protocol
- Many to one relationship between assay_id and protocol_id

  
nd_reagent

- A reagent such as a primer, an enzyme, an adapter oligo, a linker
  oligo used in genotyping protocol or any other protocol
- feature_id links reagent with DNA sequences (eg. primer) to an entry
  in feature table

  
nd_reagentprop

- Any property of reagents

  
nd_reagent_relationship

- relationship between reagents

  
nd_protocol_reagent

- linking table between nd_protocol and nd_reagent

  
nd_geolocation

  

nd_geolocationprop

## <span id="Use_Cases" class="mw-headline">Use Cases</span>

### <span id="tree_fruit_breeding_data_.28tfGDR.29" class="mw-headline">tree fruit breeding data (tfGDR)</span>

#### <span id="Cross_Experiment" class="mw-headline">Cross Experiment</span>

Data:

- Cross name/ID, location, female and male parent, progeny, project
  name, metadata such as how many seeds were produced, date of the
  cross, etc.
- Accession_ID, Aliases, cultivar name, pedigree, description

Chado:

- Accession_ID is stored in 'stock' table and the associated data such
  as cultivar name, pedigree, and description are stored in 'stockprop'
  table.
- nd_experiment.type_id is the cvterm_id for 'cross_experiment'.
- Cross location is stored in 'nd_experiment' table (nd_geolocation_id).
- Cross name/ID and the all the metadata that are associated with the
  cross experiments are stored in 'nd_experimentprop' table (cvterm_id
  and value).
- Parent and progeny are stored in 'stock' table and they are linked to
  'nd_experiment' via 'nd_experiment_stock' using type_id such as 'is a
  female parent', 'is a progeny', etc.
- The whole progeny is stored as a population in stock table and the
  individual line is linked to the population entry via
  'stock_relationship' table.
- Individual crosses is linked to a larger project via
  nd_experiment_project.

#### <span id="Phenotype_Assay" class="mw-headline">Phenotype Assay</span>

- Multiple clones of the same fruit tree accessions are planted in
  various lots of various orchards.
- The fruits are harvested from the tree in multiple times, freshly
  evaluated or stored in different conditions then evaluated for
  multiple phenotypes.
- The fruits of the multiple clonal trees in the same lot are combined
  for phenotype assays and are given the same clone_ID (?!!)
- Individual trees have a distinct repetition number (per individual
  tree) in addition to the clone_ID and the phenotypes of individual
  trees are evaluated multiple times.

Data:

- Sample_ID (given by tfGDR), Clone_ID (eg. wsu001_1, gala_1),
  Accession_ID (eg. wsu001, gala, etc), pick date, assay date, storage
  time, storage condition, evaluators, plant date, repetition number.
- rootstock_ID, site (orchard), sub_location (plot, row and position)
- Name, definition and scale of phenotype descriptor and phenotypic
  value
- An example of phenotype is 'fruit size' and their value can be 1
  through 5 (1=very small; 2=small; 3=medium; 4=large; 5= very large)

Chado:

- Sample_ID is given by tfGDR for each sample to which a distinct set of
  phenotype assays were performed.
- Accession_ID, Clone_ID and Sample_ID are stored in 'stock' table and
  their relationship are stored in 'stock_relationship' table.
- A unique nd_experiment_id with type 'phenotype_assay' is created for a
  unique combination of a sample and its phenotype.
- pick date, assay date, storage time, storage condition, rootstock and
  any other sample properties are stored in stockprop table using cvterm
  and value.
- If more complicated treatments are performed on the sample (eg.
  fertilizers), nd_experiment of type 'sample_treatment' will be
  created.
- Evaluators of each phenotype experiment are stored in 'contact' table,
  and linked to 'nd_experiment' via 'nd_experiment_contact'.
- Project information is stored in project, linked to nd_experiment via
  nd_experiment_project.
- Relationship between subprojects and larger projects are stored in
  project_relationship.
- Each breeder can have different definitions for similar phenotype
  descriptors, phenotype descriptors from each breeder are stored
  separately in 'cvterm' table (eg.fruit_size from a breeder called KE
  is stored as KE_fruit_size in cvterm table).
- The names and definitions of phenotype descriptors are stored in
  cvterm table and their scale is stored in 'cvtermprop' table using
  value and scale fields. For example, 'KE_fruit_size' has a scale of 1
  to 5 with 1(tiny), 2(small), 3(medium), 4(large), and 5(very large),
  the numeric values are stored in cvtermprop.rank and the descriptions
  are stored in cvtermprop.value.
- Phenotype and the value , such as KE_fruit_size (attr_id) and 1
  (value), are stored in phenotype table

Comments:

### <span id="mosquito_field_collections" class="mw-headline">mosquito field collections</span>

#### <span id="Field_Collections_.2B_karyotyping" class="mw-headline">Field Collections + karyotyping</span>

##### <span id="Collection" class="mw-headline">Collection</span>

- Data:
  - Collection site, catch method, time, project
- ND Module
  - Collection Site -\> nd_geolocation (lat/long/geodetic datum recorded
    directly in table. Any or all of GAZeteer IDs, postcodes, etc
    recorded as nd_geolocationprop CVterm IDs)
  - Catch Method -\> nd_protocol / nd_protocolprop (catch method
    recorded in IDOMAL (or other ontology) and placed in
    nd_protocolprop)
  - Time -\> nd_assay (recorded in nd_assayprop, format depending on
    whether a date/time range or cv term)
  - Project -\> Project

##### <span id="Karyotyping" class="mw-headline">Karyotyping</span>

- Data:
  - Karyotyping method, karyotype, project
- ND Module
  - Karyotyping method -\> nd_protocol (which CV to record in? or just
    record as freetext under protocolprop?)
  - Karyotype -\> genotype/feature (relies on karyotypes being clearly
    defined in feature module)

#### <span id="Questions:" class="mw-headline">Questions:</span>

No obvious way to link a project to either a contact (i.e. experimenter)
or a publication. project_pub / project_contact experiments needed?

### <span id="mosquito_phenotype_data" class="mw-headline">mosquito phenotype data</span>

#### <span id="RNAi_knockdown_experiments" class="mw-headline">RNAi knockdown experiments</span>

- Data:
  - original lab strain, experimental and control dsRNA reagents,
    observed phenotype

<!-- -->

- ND Module **Approach 1** (graph version: <a
  href="http://wiki.vectorbase.org/index.php/Popgen_development/Use_case_diagrams#Approach_1#Approach_1"
  class="external autonumber" rel="nofollow">[1]</a>)
  - the lab strain is represented by the 'stock' table
  - the knockdown is represented by 'nd_assay' (type = "RNAi knockdown
    phenotype assay"), linked through 'nd_assay_stock' (type = "stock
    sample"?)
  - the knockdown is described by one entry in the 'nd_protocol' table
  - rearing and injection conditions are described in 'nd_protocolprop'
    (referring to 'nd_protocol')
  - experimental dsRNA reagent(s) is(are) represented as a 'nd_reagent'
    (via nd_protocol_reagent) and are linked to a 'feature' (gene or
    location of primers?)
  - 'nd_reagentprop' cvterm describes the reagent as 'experimental RNAi
    reagent'.
  - control dsRNA reagents are also attached to the protocol via
    'nd_protocol_reagent' but are described in nd_reagentprop as
    'control RNAi reagent'
  - the phenotype is attached to the 'nd_assay' via 'nd_assay_phenotype'

Is a problem with this approach that the phenotype looks like it is
attached to the lab strain? It also convolves the two operations
(knockdown and phenotype assay) into one 'nd_assay', although they could
be described by two separate 'nd_protocol's. An alternative approach is
to create a new stock entity to represent the (temporarily) genetically
altered organisms.

Sethnr 11:37,
27 May 2010 (UTC) *even if described by two protocols we would then have
to distinguish which genotype/phenotype/assay_prop values arose from
which protocol. Simple in this case, but perhaps not in others. I
suspect adding the second assay will be less of a headache*

- ND Module **Approach 2** (graph version: <a
  href="http://wiki.vectorbase.org/index.php/Popgen_development/Use_case_diagrams#Approach_2#Approach_2"
  class="external autonumber" rel="nofollow">[2]</a>)
  - lab strain → stock
  - the knockdown is represented by 'nd_assay' (type = "RNAi knockdown")
    the lab strain is linked through 'nd_assay_stock' (type = "stock
    sample"?) as above, **but separately for each dsRNA treatment**
    (experimental and control)
  - the knockdown treated mosquitoes are represented by another entry in
    'stock', linked from 'nd_assay' (above) via 'nd_assay_stock' (type =
    "transient genetic modification"?)
  - the experimental knockdown stock has a 'nd_assay' (type = 'phenotype
    assay') associated via 'nd_assay_stock' (type = "experimental stock
    sample")
  - the control knockdown stock has a 'nd_assay' (type = 'phenotype
    assay') associated via 'nd_assay_stock' (type = "control stock
    sample")
  - the phenotype is attached to the 'nd_assay' via 'nd_assay_phenotype'
    as in approach 1

Sethnr 11:37,
27 May 2010 (UTC) *it is arguable we could get away without a separate
control stock. Whilst the knockdown is genotypically (-ish) different
than the G3 line, and as such needs a separate entry in the stock table,
the GFP knockdown is bred to be a direct representation of the G3 line.
As long as it's use as a control is clearly marked (e.g.
stock_assay.type = "control" + stock_assayprop = "dsGFP knockdown") I
don't see a problem with linking the g3 stock directly to the control
assay.*

#### <span id="stocks_selected_for_phenotype" class="mw-headline">stocks selected for phenotype</span>

##### <span id="stock_selection" class="mw-headline">stock selection</span>

- data
  - G3 mosquitos grown, midguts dissected and mosquitos split into 3
    groups by count of melanized oocysts
- ND Module
  - G3 stock links to 3 assays
    - assays link to a single protocol describing whole selection
      process, but...
    - each assay has a different assay prop describing which category
      the mosquitos were put in to.
  - 3 assays each linked to a NEW stock
    - via assay_stock table, type = "mosquito midgut"

##### <span id="genotyping_performed" class="mw-headline">genotyping performed</span>

- data
  - DNA extracted from bodies of above and used in genotyping assays
- ND Module
  - 3 new stocks linked to new assays (type = "genotyping")
    - via assay_stock table, type = "mosquito body"
  - 3 genotyping assays link to 3 separate genotypes

see diagram on <a
href="http://wiki.vectorbase.org/index.php/GMOD_Natural_Diversity_Use_Cases#stocks_selected_for_phenotype#stocks_selected_for_phenotype"
class="external text" rel="nofollow">VB wiki</a>

#### <span id="Insecticide_Resistance_Assay" class="mw-headline">Insecticide Resistance Assay</span>

- Insecticide Resistance assay
- Sample developmental stage -\> ontology ID in nd_assay_stockprop
- Sample age -\> ontology term in nd_assay_stockprop
- Sample size -\> CV term-value pair stored in in nd_assay_stock
- Assay type -\> ontology/cv term in nd_assay
- Assay method -\> ontology term in nd_protocolprop
- Insecticide (& synergist ) -\> nd_protocol_reagent, nd_reagentprop
- Insecticide (& synergist ) concentration -\> nd_protocol_reagent,
  nd_reagentprop
- Results -\> nd_assayprop
- Observed phenotype -\> nd_assay_phenotype, phenotype module
- Genotype -\> nd_assay_genotype, genotype module




[Category](Special%253ACategories "Special%253ACategories"):

- [Natural
  Diversity](Category%253ANatural_Diversity "Category%253ANatural Diversity")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Notes_on_simplified_nd_schema_and_Use_Cases"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 00:18 on 5 January
  2011.</span>
<!-- - <span id="footer-info-viewcount">68,334 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->









<span id="top"></span>




# <span dir="auto">Chado Natural Diversity Module</span>









The <a href="Chado" class="mw-redirect" title="Chado">Chado</a> Natural
Diversity Module is an extension to the Chado
[schema](Glossary#Schema "Glossary") to better support natural diversity
data.

Eventually this page will resemble the [other Chado Module
pages](Chado_Modules "Chado Modules"), with an overview followed by a
detailed explanation of the tables, columns, and relationships in the
module. However, while the module is [under
development](Chado_Natural_Diversity_Module_Working_Group "Chado Natural Diversity Module Working Group"),
this page will have an alternative structure.

Recently, a lot of work was done on the ND module at the [GMOD Tools for
Evolutionary Biology
hackathon](GMOD_Evo_Hackathon "GMOD Evo Hackathon"), see <a
href="https://www.nescent.org/wg_gmodevohackathon/Natural_Diversity_and_Phenotypes_Subgroup"
class="external free"
rel="nofollow">https://www.nescent.org/wg_gmodevohackathon/Natural_Diversity_and_Phenotypes_Subgroup</a>.


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">Interactions with Other Chado
    Modules</span>](#Interactions_with_Other_Chado_Modules)
    - [<span class="tocnumber">1.1.1</span> <span class="toctext">Stock
      Module</span>](#Stock_Module)
  - [<span class="tocnumber">1.2</span> <span class="toctext">General
    Description of Natural Diversity
    Module</span>](#General_Description_of_Natural_Diversity_Module)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Key
    Ontologies</span>](#Key_Ontologies)
    - [<span class="tocnumber">1.3.1</span> <span class="toctext">Stock
      Relationship Ontology</span>](#Stock_Relationship_Ontology)
  - [<span class="tocnumber">1.4</span> <span class="toctext">Loading
    Data</span>](#Loading_Data)
  - [<span class="tocnumber">1.5</span> <span class="toctext">Web Front
    Ends</span>](#Web_Front_Ends)
  - [<span class="tocnumber">1.6</span> <span class="toctext">See
    Also</span>](#See_Also)
    - [<span class="tocnumber">1.6.1</span> <span class="toctext">Email
      Threads</span>](#Email_Threads)
- [<span class="tocnumber">2</span> <span class="toctext">Use
  Cases</span>](#Use_Cases)
  - [<span class="tocnumber">2.1</span> <span class="toctext">tree fruit
    breeding data (tfGDR)</span>](#tree_fruit_breeding_data_.28tfGDR.29)
    - [<span class="tocnumber">2.1.1</span> <span class="toctext">Cross
      Experiment</span>](#Cross_Experiment)
    - [<span class="tocnumber">2.1.2</span>
      <span class="toctext">Phenotype Assay</span>](#Phenotype_Assay)
  - [<span class="tocnumber">2.2</span>
    <span class="toctext">Tomato/potato breeder lines and cultivars (Sol
    genomics
    network)</span>](#Tomato.2Fpotato_breeder_lines_and_cultivars_.28Sol_genomics_network.29)
    - [<span class="tocnumber">2.2.1</span>
      <span class="toctext">Phenotyping
      experiment</span>](#Phenotyping_experiment)
    - [<span class="tocnumber">2.2.2</span>
      <span class="toctext">Genotyping
      experiment</span>](#Genotyping_experiment)
- [<span class="tocnumber">3</span> <span class="toctext">ER
  Diagram</span>](#ER_Diagram)
- [<span class="tocnumber">4</span>
  <span class="toctext">Tables</span>](#Tables)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Table:
    nd_experiment</span>](#Table:_nd_experiment)
  - [<span class="tocnumber">4.2</span> <span class="toctext">Table:
    nd_experiment_contact</span>](#Table:_nd_experiment_contact)
  - [<span class="tocnumber">4.3</span> <span class="toctext">Table:
    nd_experiment_dbxref</span>](#Table:_nd_experiment_dbxref)
  - [<span class="tocnumber">4.4</span> <span class="toctext">Table:
    nd_experiment_genotype</span>](#Table:_nd_experiment_genotype)
  - [<span class="tocnumber">4.5</span> <span class="toctext">Table:
    nd_experiment_phenotype</span>](#Table:_nd_experiment_phenotype)
  - [<span class="tocnumber">4.6</span> <span class="toctext">Table:
    nd_experiment_project</span>](#Table:_nd_experiment_project)
  - [<span class="tocnumber">4.7</span> <span class="toctext">Table:
    nd_experiment_protocol</span>](#Table:_nd_experiment_protocol)
  - [<span class="tocnumber">4.8</span> <span class="toctext">Table:
    nd_experiment_pub</span>](#Table:_nd_experiment_pub)
  - [<span class="tocnumber">4.9</span> <span class="toctext">Table:
    nd_experiment_stock</span>](#Table:_nd_experiment_stock)
  - [<span class="tocnumber">4.10</span> <span class="toctext">Table:
    nd_experiment_stock_dbxref</span>](#Table:_nd_experiment_stock_dbxref)
  - [<span class="tocnumber">4.11</span> <span class="toctext">Table:
    nd_experiment_stockprop</span>](#Table:_nd_experiment_stockprop)
  - [<span class="tocnumber">4.12</span> <span class="toctext">Table:
    nd_experimentprop</span>](#Table:_nd_experimentprop)
  - [<span class="tocnumber">4.13</span> <span class="toctext">Table:
    nd_geolocation</span>](#Table:_nd_geolocation)
  - [<span class="tocnumber">4.14</span> <span class="toctext">Table:
    nd_geolocationprop</span>](#Table:_nd_geolocationprop)
  - [<span class="tocnumber">4.15</span> <span class="toctext">Table:
    nd_protocol</span>](#Table:_nd_protocol)
  - [<span class="tocnumber">4.16</span> <span class="toctext">Table:
    nd_protocol_reagent</span>](#Table:_nd_protocol_reagent)
  - [<span class="tocnumber">4.17</span> <span class="toctext">Table:
    nd_protocolprop</span>](#Table:_nd_protocolprop)
  - [<span class="tocnumber">4.18</span> <span class="toctext">Table:
    nd_reagent</span>](#Table:_nd_reagent)
  - [<span class="tocnumber">4.19</span> <span class="toctext">Table:
    nd_reagent_relationship</span>](#Table:_nd_reagent_relationship)
  - [<span class="tocnumber">4.20</span> <span class="toctext">Table:
    nd_reagentprop</span>](#Table:_nd_reagentprop)



# <span id="Introduction" class="mw-headline">Introduction</span>

The Natural Diversity module allows storing data from multiple
experiments of the same accessions/lines/strains, collected, treated and
evaluated in various locations, environments, and times. Each
accessions/lines/strains can be scored for a large number of phenotypic
traits, and genotyped with an array of genetic markers. In addition to
storing data from experiments performed on existing
accessions/lines/strains, the tables in this module and other
interacting modules allow storing data from experiments that generate
new accessions/lines/strains and experimental samples, such as field
collection, cross, and treatments.

## <span id="Interactions_with_Other_Chado_Modules" class="mw-headline">Interactions with Other [Chado Modules](Chado_Modules "Chado Modules")</span>

### <span id="Stock_Module" class="mw-headline">Stock Module</span>

The original stock module was designed to store information about stock
collections in a laboratory. This original concept of ‘stock’ table has
been expanded to accommodate entities that a ‘stock’ belongs to or
entities that derived from a ‘stock’. Hence ‘stock’ table can store
hierarchical entity of population, strain/line/accession, individual,
clone, and sample, with relationships between ‘stocks’ defined in the
'stock_relationship' table. For example, a plant accession can belong to
a population (eg. progeny of a particular cross), and have multiple
‘children’ when used as parent in a cross. A plant accession can also
have a ‘clone’ when it is clonally propagated. The 'stock' table also
stores ‘samples’ or 'observational units' of individual experiments. For
example, when a plant was treated with different amounts of chemicals
before various phenotyping experiments were performed, each sample
treated with specific amounts of chemicals is stored in a distinct row
of 'stock' table. Since population can be defined as a group of any
entities, a population entity can be composed of multiple species (eg. a
group of insects collected in a field). To accommodate this change, the
‘NOT NULL’ constraint for organism_id has been dropped.

## <span id="General_Description_of_Natural_Diversity_Module" class="mw-headline">General Description of Natural Diversity Module</span>

- This section can be removed later on from this wiki page since most of
  the content exists in the table descriptions below. But it is included
  here as a summary to help us write the Use Cases.

Nd_experiment is the core table for the natural diversity module,
representing each individual assay that is undertaken (nb this is
usually \*not\* an entire experiment). Experiment.type is a cvterm that
will define which records are expected for other tables. The types of
experiments that are done on or gave rise to 'stocks' include, but are
not restricted to, cross, field collection, sample treatment,
phenotyping and genotyping experiments. Any cvterm may be used but it
was designed with terms such as: \[phenotype_assay, genotype_assay,
field_collection, cross_experiment, sample_treatment\] in mind.  
  

For experiments of type 'phenotype_assay' or 'genotype_assay', each
nd_experiment generally give rise to a single genotype or phenotype.
Though there is no longer a one-to-one restriction, it is expected that
phenotypes and genotypes will be the result of a single assay. An
exception to one-to-one relationship would include the genotype of
heterozygotes where the genotype of each allele is stored in a distinct
row of genotype table. One record of phenotype and genotype can be
linked to multiple experiments since multiple stock entries can produce
same phenotype and/or genotype.  
  

Each nd_experiment of type 'phenotype_assay' or 'genotype_assay' should
be linked to a single stock entry via nd_experiment_stock table. So when
multiple samples from the same line/accession/strain have been used for
multiple phenotype assays, a unique nd_experiment_id should be created
for a unique combination of a sample and a phenotype assay. The sample
treatment that are performed to generate a sample from a
line/accession/strain can be stored in a separate row of nd_experiment
of type 'sample_treatment'. Collections of assays that relate to each
other can be linked via the same record in the 'project' table and/or
same record in 'stock' table.  
  

  
For experiments of type 'field_collection' and 'cross_experiment', the
appropriate stock entries that are used or generated from the experiment
can be linked by nd_experiment_stock table. In cross experiment, the
parental stocks and the progeny are stored in 'stock' table and their
roles in cross can be recorded using an appropriate cvterm for
nd_experiment_stock.type_id. The progeny of a cross and the stocks
collected from a field collection can be stored in 'stock' table as a
population or as an individual line/accession/strain/sample and then be
linked to nd_experiment appropriately.  
  

The detailed protocols of experiments can be described via one or more
protocols. Reagents used in protocol can be stored in nd_reagent table.
The same protocol and reagent can be linked to multiple experiments and
protocols, respectively. Metadata of experiments, such as date and
experimenters, can be stored as properties (nd_experimentprop).

## <span id="Key_Ontologies" class="mw-headline">Key Ontologies</span>

### <span id="Stock_Relationship_Ontology" class="mw-headline">[Stock Relationship Ontology](Stock_Relationship_Ontology "Stock Relationship Ontology")</span>

## <span id="Loading_Data" class="mw-headline">Loading Data</span>

There are, as yet, no standard flat file formats or loading scripts to
load data into this module. Custom scripts will need to be written to
insert your data in the database.

## <span id="Web_Front_Ends" class="mw-headline">Web Front Ends</span>

## <span id="See_Also" class="mw-headline">See Also</span>

- [Chado Natural Diversity Module Working
  Group](Chado_Natural_Diversity_Module_Working_Group "Chado Natural Diversity Module Working Group")
  page, and the [group's discussion
  page](Talk%253AChado_Natural_Diversity_Module_Working_Group "Talk:Chado Natural Diversity Module Working Group")
  for background on how this module was created.

### <span id="Email_Threads" class="mw-headline">Email Threads</span>

- <a
  href="http://gmod.827538.n3.nabble.com/Natural-diversity-module-and-phenotype-cvterm-values-td829757.html#a829757#a829757"
  class="external text" rel="nofollow">Natural diversity module and
  phenotype cvterm values</a>
- <a
  href="http://gmod.827538.n3.nabble.com/Re-Gmod-schema-Use-Cases-on-the-simplified-natural-diversity-module-td815602.html#a840919#a840919"
  class="external text" rel="nofollow">Use Cases on the simplified natural
  diversity module</a>
- <a
  href="http://gmod.827538.n3.nabble.com/Re-nd-naming-td937709.html#a937709#a937709"
  class="external text" rel="nofollow">nd naming</a>

# <span id="Use_Cases" class="mw-headline">Use Cases</span>

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

------------------------------------------------------------------------

### <span id="Tomato.2Fpotato_breeder_lines_and_cultivars_.28Sol_genomics_network.29" class="mw-headline">Tomato/potato breeder lines and cultivars (<a href="http://solgenomics.net" class="external text"
rel="nofollow">Sol genomics network</a>)</span>

#### <span id="Phenotyping_experiment" class="mw-headline">Phenotyping experiment</span>

A collection of 479 tomato accessions were used in several locations and
years for assaying traits of breeding significance. The collection is an
unstructured population of tomato varieties.

**[Chado Stock Module](Chado_Stock_Module "Chado Stock Module")** The
stock table is used for storing any plant accession, collection,
germplasm, or plants in a field plot. We use the
<a href="Chado_Stock_Module#Table:_stock_relationship"
class="external text" rel="nofollow">stock_relationship</a> table for
defining those relationships. Each plant accession, and its derived
germplasm, is stored in the stock table , with relationships between
accessions defined in the stock_relationship table. For example, a plant
accession can belong to a ‘parent’ population, and has multiple
‘children’, such as individual plants in a field plot.

In this data-set, we have in the stock table a
<a href="http://solgenomics.net/stock/view/id/646" class="external text"
rel="nofollow">Tomato cultivars</a> population, and all the related
accessions. The relationship between the accession stocks and the
population stock is defined in stock_relationship (the population is the
object in stock_relationship, and all accessions are subjects). Similar
relationship is defined between each accession and the plants in the
experiment's field plots. For example accession
<a href="http://solgenomics.net/stock/view/id/676" class="external text"
rel="nofollow">Heinz 1706</a> belongs to the
<a href="http://solgenomics.net/stock/view/id/646" class="external text"
rel="nofollow">cultivars</a> population, and has several
<a href="http://solgenomics.net/stock/view/id/1517"
class="external text" rel="nofollow">field plots</a>.

****Chado Natural Diversity Module**** Each phenotyping event is stored
in the nd_experiment table. An experiment, in the Natural Diversity
module, is usually defined as a single genotyping event, or a
phenotyping event performed on one or more plants, at the same time and
location, for one or multiple traits. Then the experiment is linked with
each participating stock (nd_experiment_stock table). In this example,
the phenotyping was performed on plants in field plots, thus
nd_experiment_stock links the experiment_id with the stock_id of the
field plot. This allows storing multiple experiments of the same
accessions, evaluated in different locations, environments, and years.
Each plant can be scored for a large number of phenotypic traits, and
genotyped with an array of genetic markers (see 'SGN Genotyping
experiment bellow).

  
Each phenotyping and genotyping experiment is also tied to a geolocation
(nd_geolocation table). Metadata of experiments, such as date,
environmental conditions, and person recording the data, are stored as
properties (nd_experimentprop).

All the scored phenotype values and attributes are stored in the
<a href="Chado_Phenotype_Module" class="external text"
rel="nofollow">phenotype table</a>, and genotypes in the
<a href="http://gmod.org/wiki/Chado_Genotype_Module"
class="external text" rel="nofollow">genotype table</a>. The 2 linking
tables, nd_experiment_phenotype and nd_experiment_genotype, provide a
1-1 or 1-many relationship between phenotype/genotype and experiments.

#### <span id="Genotyping_experiment" class="mw-headline">Genotyping experiment</span>

Each genotyping experiment (in this use case SNP and SSR markers were
assayed, yielding a genotype of a SNP of number of repeats) has a unique
nd_experiment_id, and is linked to the stock using nd_experiment_stock,
and to the genotype using nd_experiment_genotype table.

# <span id="ER_Diagram" class="mw-headline">ER Diagram</span>

A simplified schema diagram by N. Menda and R. Buels
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/fa/Natdiv_simplified_SGN.png" width="1600"
height="943" alt="Natdiv simplified SGN.png" />

# <span id="Tables" class="mw-headline">Tables</span>

This will be populated using the process outlined in [Chado Tables to
Wiki](Chado_Tables_to_Wiki "Chado Tables to Wiki").

## <span id="Table:_nd_experiment" class="mw-headline">Table: nd_experiment</span>

This is the core table for the natural diversity module, representing
each individual assay that is undertaken (nb this is usually \*not\* an
entire experiment). Each nd_experiment should give rise to a single
genotype or phenotype and be described via 1 (or more) protocols.
Collections of assays that relate to each other should be linked to the
same record in the *project* table.  
Experiment.type is a cvterm that will define which records are expected
for other tables. Any CV may be used but it was designed with terms such
as: \[phenotype_assay, genotype_assay, field_collection,
cross_experiment\] in mind.

| FK | Name | Type | Description |
|----|----|----|----|
|  | nd_experiment_id | serial | *PRIMARY KEY* |
| [nd_geolocation](Chado_Tables#Table:_nd_geolocation "Chado Tables") | nd_geolocation_id | integer | *NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *NOT NULL* |

public.nd_experiment Structure

Tables referencing this one via Foreign Key Constraints:

- [nd_experiment_contact](Chado_Tables#Table:_nd_experiment_contact "Chado Tables")

<!-- -->

- [nd_experiment_dbxref](Chado_Tables#Table:_nd_experiment_dbxref "Chado Tables")

<!-- -->

- [nd_experiment_genotype](Chado_Tables#Table:_nd_experiment_genotype "Chado Tables")

<!-- -->

- [nd_experiment_phenotype](Chado_Tables#Table:_nd_experiment_phenotype "Chado Tables")

<!-- -->

- [nd_experiment_project](Chado_Tables#Table:_nd_experiment_project "Chado Tables")

<!-- -->

- [nd_experiment_protocol](Chado_Tables#Table:_nd_experiment_protocol "Chado Tables")

<!-- -->

- [nd_experiment_pub](Chado_Tables#Table:_nd_experiment_pub "Chado Tables")

<!-- -->

- [nd_experiment_stock](Chado_Tables#Table:_nd_experiment_stock "Chado Tables")

<!-- -->

- [nd_experimentprop](Chado_Tables#Table:_nd_experimentprop "Chado Tables")

------------------------------------------------------------------------

## <span id="Table:_nd_experiment_contact" class="mw-headline">Table: nd_experiment_contact</span>

primary contact / submitter of these nd_experiments (nd, where assays
are not submitted separately this may be better stored in
project_contact).

| FK | Name | Type | Description |
|----|----|----|----|
|  | nd_experiment_contact_id | serial | *PRIMARY KEY* |
| [nd_experiment](Chado_Tables#Table:_nd_experiment "Chado Tables") | nd_experiment_id | integer | *NOT NULL* |
| [contact](Chado_Tables#Table:_contact "Chado Tables") | contact_id | integer | *NOT NULL* |

public.nd_experiment_contact Structure

------------------------------------------------------------------------

## <span id="Table:_nd_experiment_dbxref" class="mw-headline">Table: nd_experiment_dbxref</span>

Cross-reference experiment to accessions, images, etc

| FK | Name | Type | Description |
|----|----|----|----|
|  | nd_experiment_dbxref_id | serial | *PRIMARY KEY* |
| [nd_experiment](Chado_Tables#Table:_nd_experiment "Chado Tables") | nd_experiment_id | integer | *NOT NULL* |
| [dbxref](Chado_Tables#Table:_dbxref "Chado Tables") | dbxref_id | integer | *NOT NULL* |

public.nd_experiment_dbxref Structure

------------------------------------------------------------------------

  

## <span id="Table:_nd_experiment_genotype" class="mw-headline">Table: nd_experiment_genotype</span>

Linking table: experiments to the genotypes they produce. Though there
is no longer a one-to-one restriction, it is expected that genotypes
will be the result of a single assay. The restriction was lifted to
allow items such as: a single chromosome staining giving values for
inversions: 2La/+, 2Rbc - (whilst these are technically a single
genotype users may wish to store these separately such that all 2La/+
individuals can be easily ascertained).

| FK | Name | Type | Description |
|----|----|----|----|
|  | nd_experiment_genotype_id | serial | *PRIMARY KEY* |
| [nd_experiment](Chado_Tables#Table:_nd_experiment "Chado Tables") | nd_experiment_id | integer | *UNIQUE#1 NOT NULL* |
| [genotype](Chado_Tables#Table:_genotype "Chado Tables") | genotype_id | integer | *UNIQUE#1 NOT NULL* |

public.nd_experiment_genotype Structure

------------------------------------------------------------------------

## <span id="Table:_nd_experiment_phenotype" class="mw-headline">Table: nd_experiment_phenotype</span>

Linking table: experiments to the phenotypes they produce. in most cases
this will either be a single record, or an alternative (quantitative /
qualitative?) description of the same phenotype (e.g. 1: "wing length:
12mm" / "wing length: increased"). In rare cases it may suit the user to
link a single qualitative phenotype to multiple experiments

| FK | Name | Type | Description |
|----|----|----|----|
|  | nd_experiment_phenotype_id | serial | *PRIMARY KEY* |
| [nd_experiment](Chado_Tables#Table:_nd_experiment "Chado Tables") | nd_experiment_id | integer | *UNIQUE#1 NOT NULL* |
| [phenotype](Chado_Tables#Table:_phenotype "Chado Tables") | phenotype_id | integer | *UNIQUE#1 NOT NULL* |

public.nd_experiment_phenotype Structure

------------------------------------------------------------------------

## <span id="Table:_nd_experiment_project" class="mw-headline">Table: nd_experiment_project</span>

Used to group together related nd_experiment records. All nd_experiments
should be linked to at least one project.

| FK | Name | Type | Description |
|----|----|----|----|
|  | nd_experiment_project_id | serial | *PRIMARY KEY* |
| [project](Chado_Tables#Table:_project "Chado Tables") | project_id | integer | *NOT NULL* |
| [nd_experiment](Chado_Tables#Table:_nd_experiment "Chado Tables") | nd_experiment_id | integer | *NOT NULL* |

public.nd_experiment_project Structure

------------------------------------------------------------------------

## <span id="Table:_nd_experiment_protocol" class="mw-headline">Table: nd_experiment_protocol</span>

Linking table: experiments to the protocols they involve.

| FK | Name | Type | Description |
|----|----|----|----|
|  | nd_experiment_protocol_id | serial | *PRIMARY KEY* |
| [nd_experiment](Chado_Tables#Table:_nd_experiment "Chado Tables") | nd_experiment_id | integer | *NOT NULL* |
| [nd_protocol](Chado_Tables#Table:_nd_protocol "Chado Tables") | nd_protocol_id | integer | *NOT NULL* |

public.nd_experiment_protocol Structure

------------------------------------------------------------------------

  

## <span id="Table:_nd_experiment_pub" class="mw-headline">Table: nd_experiment_pub</span>

Linking nd_experiment(s) to publication(s)

| FK | Name | Type | Description |
|----|----|----|----|
|  | nd_experiment_pub_id | serial | *PRIMARY KEY* |
| [nd_experiment](Chado_Tables#Table:_nd_experiment "Chado Tables") | nd_experiment_id | integer | *UNIQUE#1 NOT NULL* |
| [pub](Chado_Tables#Table:_pub "Chado Tables") | pub_id | integer | *UNIQUE#1 NOT NULL* |

public.nd_experiment_pub Structure

------------------------------------------------------------------------

  

## <span id="Table:_nd_experiment_stock" class="mw-headline">Table: nd_experiment_stock</span>

Part of a stock or a clone of a stock that is used in an experiment

<table data-border="1" data-cellpadding="3">
<caption>public.nd_experiment_stock Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>nd_experiment_stock_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_nd_experiment"
title="Chado Tables">nd_experiment</a></p></td>
<td>nd_experiment_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_stock"
title="Chado Tables">stock</a></p></td>
<td>stock_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
stock used in the extraction or the corresponding stock for the
clone</td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>NOT NULL</em></td>
</tr>
</tbody>
</table>

public.nd_experiment_stock Structure

Tables referencing this one via Foreign Key Constraints:

- [nd_experiment_stock_dbxref](Chado_Tables#Table:_nd_experiment_stock_dbxref "Chado Tables")

<!-- -->

- [nd_experiment_stockprop](Chado_Tables#Table:_nd_experiment_stockprop "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_nd_experiment_stock_dbxref" class="mw-headline">Table: nd_experiment_stock_dbxref</span>

Cross-reference experiment_stock to accessions, images, etc

| FK | Name | Type | Description |
|----|----|----|----|
|  | nd_experiment_stock_dbxref_id | serial | *PRIMARY KEY* |
| [nd_experiment_stock](Chado_Tables#Table:_nd_experiment_stock "Chado Tables") | nd_experiment_stock_id | integer | *NOT NULL* |
| [dbxref](Chado_Tables#Table:_dbxref "Chado Tables") | dbxref_id | integer | *NOT NULL* |

public.nd_experiment_stock_dbxref Structure

------------------------------------------------------------------------

  

## <span id="Table:_nd_experiment_stockprop" class="mw-headline">Table: nd_experiment_stockprop</span>

Property/value associations for experiment_stocks. This table can store
the properties such as treatment

<table data-border="1" data-cellpadding="3">
<caption>public.nd_experiment_stockprop Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>nd_experiment_stockprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_nd_experiment_stock"
title="Chado Tables">nd_experiment_stock</a></p></td>
<td>nd_experiment_stock_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The experiment_stock to which the property applies.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The name of the property as a reference to a controlled vocabulary
term.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
The value of the property.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The rank of the property value, if the property has an array of
values.</td>
</tr>
</tbody>
</table>

public.nd_experiment_stockprop Structure

------------------------------------------------------------------------

  

## <span id="Table:_nd_experimentprop" class="mw-headline">Table: nd_experimentprop</span>

Tag-value properties - follows standard chado model.

| FK | Name | Type | Description |
|----|----|----|----|
|  | nd_experimentprop_id | serial | *PRIMARY KEY* |
| [nd_experiment](Chado_Tables#Table:_nd_experiment "Chado Tables") | nd_experiment_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | character varying(255) | *NOT NULL* |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

public.nd_experimentprop Structure

------------------------------------------------------------------------

## <span id="Table:_nd_geolocation" class="mw-headline">Table: nd_geolocation</span>

The geo-referenceable location of the stock. NOTE: This entity is subject
to change as a more general and possibly more OpenGIS-compliant
geolocation module may be introduced into Chado.

<table data-border="1" data-cellpadding="3">
<caption>public.nd_geolocation Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>nd_geolocation_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>description</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
A textual representation of the location, if this is the original
georeference. Optional if the original georeference is available in
lat/long coordinates.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>latitude</td>
<td>real</td>
<td><em></em><br />
<br />
The decimal latitude coordinate of the georeference, using positive and
negative sign to indicate N and S, respectively.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>longitude</td>
<td>real</td>
<td><em></em><br />
<br />
The decimal longitude coordinate of the georeference, using positive and
negative sign to indicate E and W, respectively.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>geodetic_datum</td>
<td>character varying(32)</td>
<td><em></em><br />
<br />
The geodetic system on which the geo-reference coordinates are based.
For geo-references measured between 1984 and 2010, this will typically
be WGS84.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>altitude</td>
<td>real</td>
<td><em></em><br />
<br />
The altitude (elevation) of the location in meters. If the altitude is
only known as a range, this is the average, and altitude_dev will hold
half of the width of the range.</td>
</tr>
</tbody>
</table>

public.nd_geolocation Structure

Tables referencing this one via Foreign Key Constraints:

- [nd_experiment](Chado_Tables#Table:_nd_experiment "Chado Tables")

<!-- -->

- [nd_geolocationprop](Chado_Tables#Table:_nd_geolocationprop "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_nd_geolocationprop" class="mw-headline">Table: nd_geolocationprop</span>

Property/value associations for geolocations. This table can store the
properties such as location and environment

<table data-border="1" data-cellpadding="3">
<caption>public.nd_geolocationprop Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>nd_geolocationprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_nd_geolocation"
title="Chado Tables">nd_geolocation</a></p></td>
<td>nd_geolocation_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The name of the property as a reference to a controlled vocabulary
term.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>character varying(250)</td>
<td><em></em><br />
<br />
The value of the property.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The rank of the property value, if the property has an array of
values.</td>
</tr>
</tbody>
</table>

public.nd_geolocationprop Structure

------------------------------------------------------------------------

  

## <span id="Table:_nd_protocol" class="mw-headline">Table: nd_protocol</span>

A protocol can be anything that is done as part of the experiment.

<table data-border="1" data-cellpadding="3">
<caption>public.nd_protocol Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>nd_protocol_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em>UNIQUE NOT NULL</em><br />
<br />
The protocol name.</td>
</tr>
</tbody>
</table>

public.nd_protocol Structure

Tables referencing this one via Foreign Key Constraints:

- [nd_experiment_protocol](Chado_Tables#Table:_nd_experiment_protocol "Chado Tables")

<!-- -->

- [nd_protocol_reagent](Chado_Tables#Table:_nd_protocol_reagent "Chado Tables")

<!-- -->

- [nd_protocolprop](Chado_Tables#Table:_nd_protocolprop "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_nd_protocol_reagent" class="mw-headline">Table: nd_protocol_reagent</span>

| FK | Name | Type | Description |
|----|----|----|----|
|  | nd_protocol_reagent_id | serial | *PRIMARY KEY* |
| [nd_protocol](Chado_Tables#Table:_nd_protocol "Chado Tables") | nd_protocol_id | integer | *NOT NULL* |
| [nd_reagent](Chado_Tables#Table:_nd_reagent "Chado Tables") | reagent_id | integer | *NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *NOT NULL* |

public.nd_protocol_reagent Structure

------------------------------------------------------------------------

  

## <span id="Table:_nd_protocolprop" class="mw-headline">Table: nd_protocolprop</span>

Property/value associations for protocol.

<table data-border="1" data-cellpadding="3">
<caption>public.nd_protocolprop Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>nd_protocolprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_nd_protocol"
title="Chado Tables">nd_protocol</a></p></td>
<td>nd_protocol_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The protocol to which the property applies.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The name of the property as a reference to a controlled vocabulary
term.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
The value of the property.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The rank of the property value, if the property has an array of
values.</td>
</tr>
</tbody>
</table>

public.nd_protocolprop Structure

------------------------------------------------------------------------

  

## <span id="Table:_nd_reagent" class="mw-headline">Table: nd_reagent</span>

A reagent such as a primer, an enzyme, an adapter oligo, a linker oligo.
Reagents are used in genotyping experiments, or in any other kind of
experiment.

<table data-border="1" data-cellpadding="3">
<caption>public.nd_reagent Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>nd_reagent_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>character varying(80)</td>
<td><em>NOT NULL</em><br />
<br />
The name of the reagent. The name should be unique for a given
type.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
The type of the reagent, for example linker oligomer, or forward
primer.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>feature_id</td>
<td>integer</td>
<td><em></em><br />
<br />
If the reagent is a primer, the feature that it corresponds to. More
generally, the corresponding feature for any reagent that has a sequence
that maps to another sequence.</td>
</tr>
</tbody>
</table>

public.nd_reagent Structure

Tables referencing this one via Foreign Key Constraints:

- [nd_protocol_reagent](Chado_Tables#Table:_nd_protocol_reagent "Chado Tables")

<!-- -->

- [nd_reagent_relationship](Chado_Tables#Table:_nd_reagent_relationship "Chado Tables")

<!-- -->

- [nd_reagentprop](Chado_Tables#Table:_nd_reagentprop "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_nd_reagent_relationship" class="mw-headline">Table: nd_reagent_relationship</span>

Relationships between reagents. Some reagents form a group. i.e., they
are used all together or not at all. Examples are adapter/linker/enzyme
experiment reagents.

<table data-border="1" data-cellpadding="3">
<caption>public.nd_reagent_relationship Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>FK</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>nd_reagent_relationship_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_nd_reagent"
title="Chado Tables">nd_reagent</a></p></td>
<td>subject_reagent_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
The subject reagent in the relationship. In parent/child terminology,
the subject is the child. For example, in "linkerA
3prime-overhang-linker enzymeA" linkerA is the subject,
3prime-overhand-linker is the type, and enzymeA is the object.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_nd_reagent"
title="Chado Tables">nd_reagent</a></p></td>
<td>object_reagent_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
The object reagent in the relationship. In parent/child terminology, the
object is the parent. For example, in "linkerA 3prime-overhang-linker
enzymeA" linkerA is the subject, 3prime-overhand-linker is the type, and
enzymeA is the object.</td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
The type (or predicate) of the relationship. For example, in "linkerA
3prime-overhang-linker enzymeA" linkerA is the subject,
3prime-overhand-linker is the type, and enzymeA is the object.</td>
</tr>
</tbody>
</table>

public.nd_reagent_relationship Structure

------------------------------------------------------------------------

  

## <span id="Table:_nd_reagentprop" class="mw-headline">Table: nd_reagentprop</span>

| FK | Name | Type | Description |
|----|----|----|----|
|  | nd_reagentprop_id | serial | *PRIMARY KEY* |
| [nd_reagent](Chado_Tables#Table:_nd_reagent "Chado Tables") | nd_reagent_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | character varying(255) |  |
|  | rank | integer | *UNIQUE#1 NOT NULL* |

public.nd_reagentprop Structure

------------------------------------------------------------------------




[Categories](Special%253ACategories "Special%253ACategories"):

- [Natural
  Diversity](Category%253ANatural_Diversity "Category%253ANatural Diversity")
- [Chado Modules](Category%253AChado_Modules "Category%253AChado Modules")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Natural_Diversity_Module"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 16:35 on 30 January
  2013.</span>
<!-- - <span id="footer-info-viewcount">163,936 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





---
title: "Talk:Chado Post-Composed Phenotypes"
---
# Talk:Chado Post-Composed Phenotypes

  proposals</span>](#Older_proposals)
  - [Option 1:
    Group Module is an intrinsic part of the phenotype_cvterm
    table](#Option_1:_Group_Module_is_an_intrinsic_part_of_the_phenotype_cvterm_table)
  - [Option 2:
    Group Module is decoupled from the phenotype_cvterm
    table](#Option_2:_Group_Module_is_decoupled_from_the_phenotype_cvterm_table)
  - [Alternative: Represented directly in Group
    Module](#Alternative:_Represented_directly_in_Group_Module)

## Older proposals

An example of an EQ statement and two options for how it could be stored
in the proposed revised Phenotype Module are shown below. Both examples
used the proposed [Group
Module](Chado_Group_Module "Chado Group Module"). New and modified
tables relative to Chado version 1.23 are indicated in green.

### Option 1: [Group Module](Chado_Group_Module "Chado Group Module") is an intrinsic part of the phenotype_cvterm table

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/53/SampleEQstatementInChado.png" width="1109"
height="1199" alt="SampleEQstatementInChado.png" />

### Option 2: [Group Module](Chado_Group_Module "Chado Group Module") is decoupled from the phenotype_cvterm table

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/dc/Chado_phenotype_proposal.op2.png"
width="1454" height="1382" alt="Chado phenotype proposal.op2.png" />
Sample SQL for loading and querying this structure is
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/13/EQstatements.sql" class="internal"
title="EQstatements.sql">here</a>.

### Alternative: Represented directly in Group Module

This option separates the post-composed term completely from the
phenotype table, permitting a particular statement to be re-used and to
be attached to different types of data objects.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/38/Chado_phenotype_proposal.v4.png"
width="1500" height="1367" alt="Chado phenotype proposal.v4.png" />

---
title: "Stock Relationship Ontology"
---
# Stock Relationship Ontology

This page serves as an initial draft of the nascent Stock Relationship
Ontology.

  page</span>](#Talk_page)
- [stock
  types](#stock_types)
- [Proposed
  relations (by Pantelis Topalis 28 May
  2010)](#Proposed_relations_.28by_Pantelis_Topalis_28_May_2010.29)
- [stock_relationship
  types](#stock_relationship_types)
  - [individual
    -\> individual](#individual_-.3E_individual)
  - [individual
    -\> group](#individual_-.3E_group)
  - [group -\>
    individual](#group_-.3E_individual)
  - [group -\>
    group](#group_-.3E_group)
- [nd_assay_stock
  types](#nd_assay_stock_types)
- [nd_assay
  types](#nd_assay_types)

## Talk page

If you are too shy to edit this page, then please add your suggested
terms or comments on the [talk
page](/wiki/Talk%253AStock_Relationship_Ontology).



## stock types

- term
  - is_a subterm

## Proposed relations (by Pantelis
Topalis 28 May 2010)

Based on what it is written in this page, we can use the following
relations (please comment / add / modify as required).

- is_a (OBO_REL:is_a)
- part_of (OBO_REL:part_of)
- derives_from (OBO_REL:derives_from)
- is_parent_of
- is_offspring_of
- is_member_of

## stock_relationship types

(the following is largely taken from a prior VB
<a href="http://wiki.vectorbase.org/index.php/Samples_and_relationships"
class="external text" rel="nofollow">wiki</a> dealing with the same
issue. I've put them here as a conversation starter only - feel free to
delete / alter / extend as required) Sethnr 13:12,
11 May 2010 (UTC)

### individual -\> individual

- parent -\> offspring
- individual -\> RNAi treated individual

### individual -\> group

- parents -\> offspring
- parent -\> offspring (i.e. isofem)
- pool of individuals

### group -\> individual

- individual from pool (e.g. single sequenced individual from field
  collection)
- individual under gen. modification (e.g. RNAi?)

### group -\> group

- sub-population from larger population
- group-\>group RNAi (and other experimental manipulations)
- bred lines from lab stocks

## nd_assay_stock types

Here is one distinction we may all need to make: assays that **use**
stocks and assays that **generate** stocks. I suggest the following but
it is a bit computer-sciency! Maccallr
10:25, 1 June 2010 (UTC)

- assay_input_stock
- assay_output_stock

Should the amount of stock used/generated be recorded in
nd_assay_stockprop? Or should we have nd_assay_stock.types like 'stock
sample', 'entire stock'? Maccallr
10:25, 1 June 2010 (UTC)

## nd_assay types

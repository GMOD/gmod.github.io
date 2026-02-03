---
title: "Chado Naural Diversity Module/natdiv props call notes"
---
# Chado Naural Diversity Module/natdiv props call notes


## Date

June 1st 2011, 12PM EST

  

## participants

- Maren
- Seth
- Scott
- Yuri
- Rob
- Naama
- Sook (first 30 min)
- Lukas (first 30 min)

  

## Notes

--Seth :

leave the phenotype module for later

--Yuri:

2 new prop tables ( in the genotype module) environmentprop
phenstatementprop

- wants to add cvalue_id to these prop tables for post-composing terms
  (type_id=NaCl treatment, value=100 cvalue_id = mM )

--Naama:

the question is how do we use the property tables. What should go in
there, and do we want to structure the values by attaching cvterm FKs to
it.

--Sook:

terms can be post-composed using cvterm_relationship

--Lukas:

postcomposing terms does not include description of the experiment

--Seth:

there is no justification for adding cvalue_id if there is another way
in Chado to post-compose terms. the values in these 2 prop tables could
be stored elsewhere in the ND schema (these are props of the
experiment). Since nobody in this group, besides Yuri and Maren is using
environmentprop and phenstatementprop, this is not the right group for
deciding whether we add these or not.

**Decision**

- there's a majority against adding cvalue_id , no strong objection to
  add the 2 prop table.

Need to send an email to gmod-schema regarding adding the 2 vanilla prop
tables (Yuri will do this).

--Yuri:

nobody has replied to the previous email about these 2 tables

--Scott:

people don't use/ask for these 2 prop tables because they don't need it,
or they are not aware this is an option. I'm inclined to do nothing for
now, but Yuri should send the email because there are now more Chado
users.

  

------------------------------------------------------------------------

--Yuri:

nd_experiment_protocolprop Add nd_experiment_phenotypeprop

- I want to split the value from the description of the phenotype

property of the linking table - applies both to experiment and the
protocol. same for the phenotype .

--Seth:

nd_experiment_protocol :

- Does anyone else uses multiple protocols for a single experiment? No.
- is that any of the use cases in the paper? No

--Yuri:

this allows flexibility in the schema

--Seth:

Can these be 1 protocol with 2 different experimentprops? if you are
testing the reaction of your plant to a substance, this is part of the
nd_experiment (2 separate props within nd_experiment) and the protocol
remains the same.

The only place with a prop table for a linking table is
nd_experiment_stockprop - it was important to provide information on
that relationship - how the link between the stock and the experiment
was made. This is not the case with experiment and protocol. The
stock-experiment value cannot be put anywhere else, because the stock
links to multiple experiments and an experiment can have multiple
stocks.

--Yuri:

I can see somebody wanting to be able to provide the context for these 2
objects but currently nobody does that. I don't have a problem with
adding prop tables because I don't think it clutters the schema (while
Naama and Sook think it does)

--Seth:

adding prop tables to linking tables changes the schema by saying we can
add context to the relationship

--Yuri:

there's also the question of consistency of the prop tables in the ND
module. If we want that, I'm fine with adding cvalue_id to all the prop
tables in ND, or at least to the ones I find useful. It's an optional
field. I find it very useful.

--Naama:

we have here 2 fundamental issues: 1. how do we break the
value-phenotype connection in the phenotype module 2. how do we use the
prop tables? (and cvalue_id, is this needed?)

  
--Yuri:

looked at postcomposition in the phenotype_cvterm table - we need the
value field for some of the data. e.g. we have the date sometimes as
part of the description. 'Stem diameter at ' + a certain date.

--Naama:

Do we change the schema because of the data or do we change the data so
it would fit into the schema?

--Seth:

it's a valid argument. We've run into this last week talking about
postcomposing terms.

Need to solve first the problem with post-composing terms . Solve the
cases when you cannot pre-compose. This is a general problem , and
should be looked into in the cvterm module (cvterm_relationship or
somewhere else) because this is not a specific problem in the phenotype
or the ND module.

--Yuri:

If we use cvterm_relationship we'll need a way to link my object to a
cvterm_relationship table . sometimes I just want to add a unit , and
this seems like making things more complex.

--Seth:

you can just link to the unanimous term. This is the same as adding a
new cvterm and linking to it.

--Naama:

would be good to email the gmod-schema list and see if anyone is using
cvterm_relationship for post composition.

--Scott:

I can imagine this as a Tripal module that can help others.

--Seth:

thinks Phenote allows post-composition of terms (need to check with
ZFin)

--Scott:

Zfin does not use Chado, but they do use the cvterm module. Maybe Nicole
Washington knows, if she still works on Phenote. I'll email her and find
out.

--Naama:

thinks next step should be going back to the gmod-schema list asking
about post-composition of terms

--Seth:

and CC Zfin Flybase helpdesks - most obvious people who might be
post-composing terms. Will send the email.

------------------------------------------------------------------------

**Decisions:**

- Go back to the schema list with the post-composition of terms in a
  generic way (Seth)
- Not adding the suggested prop tables, because there is no agreement,
  and we need to solve first the following major issues:
    1. decision on post-composing terms . How?
    2. revisit the phenotype module for breaking the value-phenotype ties
    3. better definition of how we use the prop tables

- Need to change the value fields in the ND module to 'text' (Naama will
  do this)
  - Paper is good to go
  - Chado release is good to go.

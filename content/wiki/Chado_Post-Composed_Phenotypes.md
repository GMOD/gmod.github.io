---
title: "Chado Post-Composed Phenotypes"
---
# Chado Post-Composed Phenotypes

  Overview](#Overview)
- [Proposal](#Proposal)
- [New and
  Modified Tables in Phenotype
  Module](#New_and_Modified_Tables_in_Phenotype_Module)
- [Recommended
  Deprecated Fields](#Recommended_Deprecated_Fields)
- [Controlled
  Vocabularies](#Controlled_Vocabularies)
- [Older
  proposals](#Older_proposals)

## Overview

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

## Proposal

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/d1/Chado_phenotype_proposal.clause.jpg"
width="1101" height="806"
alt="Chado phenotype proposal.clause.jpg" />



## New and Modified Tables in Phenotype Module

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



## Recommended Deprecated Fields

     COMMENT ON TABLE phenotype IS 'Columns observable_id, assay_id
     are deprecated to break the connection between the phenotype value and the
     trait. The phenotype table should be used to store precomposed terms and the
     phenotype value. Use tables phenotype_cvterm to store the trait(s) associated
     with the phenotype.';

## Controlled Vocabularies

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



## Older proposals

See
[Talk:Chado_Post-Composed_Phenotypes](/wiki/Talk%3AChado_Post-Composed_Phenotypes)
for the older versions of this schema proposal

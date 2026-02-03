---
title: "Talk:Chado Natural Diversity Module/natdiv schema changes call"
---
# Talk:Chado Natural Diversity Module/natdiv schema changes call

This is the place to discuss the issues we have with the phenotype
module. We would like to revise it since currently the phenotype table
does not address well post-composing terms.

**Assumptions**

    1. The phenotype table is the place for storing the actual value

    2. The phenotype (the descriptor) is the cvterm

    3. Post composing cvterms can be done now in the phenotype table (using observable_id and attr_id), but we cannot reuse it 
    since it is tied with a specific value.

- To break this postcomposed phenotype - value connection can we use
  phenotype_cvterm?
  - e.g. phenotype_cvterm.cvterm_id ='mM' type_id ='unit' , cvterm_id =
    'length' , phenotype.value = 12 , observable_id = 'cotyledon'

---
title: "Proposed schema extensions related to Sybil/IGS needs"
---
# Proposed schema extensions related to Sybil/IGS needs


## Representation of feature graphs

The feature_relationship table allows us to store feature graphs. In
this model, feature records are nodes and feature_relationship records
are edges. For example, consider gene annotations, such as a polypeptide
feature, and a computational pipeline that generates a graph of related
polypeptides. In this case, we seek to model the graph output of this
pipeline in feature_relationship records.

We propose adding a feature_relationship_analysis table to associate the
feature_relationship records with the analysis that generated them.

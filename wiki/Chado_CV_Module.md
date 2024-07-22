<span id="top"></span>

# <span dir="auto">Chado CV Module</span>

## Contents

- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">Similarities to the GO Database
    schema</span>](#Similarities_to_the_GO_Database_schema)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">Overview</span>](#Overview)
  - [<span class="tocnumber">1.3</span>
    <span class="toctext">Associating features to
    cvterms</span>](#Associating_features_to_cvterms)
  - [<span class="tocnumber">1.4</span> <span class="toctext">Complex
    annotations</span>](#Complex_annotations)
  - [<span class="tocnumber">1.5</span> <span class="toctext">Transitive
    Closure</span>](#Transitive_Closure)
    - [<span class="tocnumber">1.5.1</span>
      <span class="toctext">Transitivity of other
      Relations</span>](#Transitivity_of_other_Relations)
    - [<span class="tocnumber">1.5.2</span>
      <span class="toctext">Transitivity over
      _is_a_</span>](#Transitivity_over_is_a)
    - [<span class="tocnumber">1.5.3</span>
      <span class="toctext">Difference between Deductive Closure and
      Transitive
      Closure</span>](#Difference_between_Deductive_Closure_and_Transitive_Closure)
    - [<span class="tocnumber">1.5.4</span>
      <span class="toctext">Rules</span>](#Rules)
    - [<span class="tocnumber">1.5.5</span>
      <span class="toctext">Populating
      cvtermpath</span>](#Populating_cvtermpath)
  - [<span class="tocnumber">1.6</span> <span class="toctext">Advanced
    Usage</span>](#Advanced_Usage)
    - [<span class="tocnumber">1.6.1</span>
      <span class="toctext">Background</span>](#Background)
    - [<span class="tocnumber">1.6.2</span>
      <span class="toctext">Logical
      definitions</span>](#Logical_definitions)
    - [<span class="tocnumber">1.6.3</span> <span class="toctext">How
      Logical Definitions are Stored in
      Chado</span>](#How_Logical_Definitions_are_Stored_in_Chado)
    - [<span class="tocnumber">1.6.4</span>
      <span class="toctext">Logical Definition
      Views</span>](#Logical_Definition_Views)
    - [<span class="tocnumber">1.6.5</span>
      <span class="toctext">Example Use Case:
      Phenotypes</span>](#Example_Use_Case:_Phenotypes)
    - [<span class="tocnumber">1.6.6</span>
      <span class="toctext">Example Use Case: Feature
      Types</span>](#Example_Use_Case:_Feature_Types)
      - [<span class="tocnumber">1.6.6.1</span>
        <span class="toctext">Example use case:
        GO</span>](#Example_use_case:_GO)
      - [<span class="tocnumber">1.6.6.2</span>
        <span class="toctext">Example use case: Drawing
        DAGs</span>](#Example_use_case:_Drawing_DAGs)
      - [<span class="tocnumber">1.6.6.3</span>
        <span class="toctext">Loading OWL into
        Chado</span>](#Loading_OWL_into_Chado)
      - [<span class="tocnumber">1.6.6.4</span>
        <span class="toctext">Post-coordinating
        Terms</span>](#Post-coordinating_Terms)
- [<span class="tocnumber">2</span>
  <span class="toctext">Tables</span>](#Tables)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Table:
    cv</span>](#Table:_cv)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Table:
    cvterm</span>](#Table:_cvterm)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Table:
    cvterm_dbxref</span>](#Table:_cvterm_dbxref)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Table:
    cvterm_relationship</span>](#Table:_cvterm_relationship)
  - [<span class="tocnumber">2.5</span> <span class="toctext">Table:
    cvtermpath</span>](#Table:_cvtermpath)
  - [<span class="tocnumber">2.6</span> <span class="toctext">Table:
    cvtermprop</span>](#Table:_cvtermprop)
  - [<span class="tocnumber">2.7</span> <span class="toctext">Table:
    cvtermsynonym</span>](#Table:_cvtermsynonym)
  - [<span class="tocnumber">2.8</span> <span class="toctext">Table:
    dbxrefprop</span>](#Table:_dbxrefprop)

# <span id="Introduction" class="mw-headline">Introduction</span>

This module is for controlled vocabularies (CVs), semantic networks and
ontologies, depending on which terminology you prefer.

It is intended to be rich enough to encapsulate anything in the Gene
Ontology (GO) or OBO family of ontologies (see the
<a href="http://www.geneontology.org" class="external text"
rel="nofollow">GO website</a> and the
<a href="http://obo.sourceforge.net" class="external text"
rel="nofollow">OBO project</a>). The schema reflects the data model of
OBO and of the
<a href="http://oboedit.org/" class="external text" rel="nofollow">OBO
Edit</a> tool currently used by these projects.

This module is also intended to be extensible to richer formalisms such
as <a href="http://en.wikipedia.org/wiki/Web_Ontology_Language"
class="external text" rel="nofollow">OWL (Ontology Web Language)</a>,
but this is outside the current requirements.

## <span id="Similarities_to_the_GO_Database_schema" class="mw-headline">Similarities to the GO Database schema</span>

The schema is similar to the
<a href="http://geneontology.org/GO.database.shtml"
class="external text" rel="nofollow">GO database schema</a>, which was
also developed by one of the Chado designers.

There is a _bridge_ layer in the directory `modules/cv/bridges/`, which
can make the Chado cv module look like the GO DB, and vice versa.

## <span id="Overview" class="mw-headline">Overview</span>

An ontology, or controlled vocabulary (cv) is a collection of classes
(or concepts or terms, depending on your terminology) with definitions
and relationships to other classes. Each class--a word or phrase--can
only appear once in a controlled vocabulary and has a defined meaning
within that vocabulary. The controlled vocabularies are chosen so that
the contents do not overlap; if the same text string is used to describe
two different concepts in two different cvs, these are distinct classes.
These terms are housed in the [cvterm](#Table:_cvterm) table in the
Chado schema.

cvterms are related to one another via
[cvterm_relationship](#Table:_cvterm_relationship). This can be thought
of as a graph, or semantic network. The relationship types (the labels
on the arcs of the graph) are also stored in the
[cvterm](#Table:_cvterm) table. The relationship types are extensible,
but the type _is a_ (subtyping relationship) is assumed to be present;
many OBO ontologies use the _part of_ relationship, and GO also uses the
_regulates_ relation. Relationship types also come from a controlled
vocabulary, the
<a href="http://obofoundry.org/ro/" class="external text"
rel="nofollow">OBO Relation Ontology</a>.

The [cvterm_relationship](#Table:_cvterm_relationship) can be thought of
as specifying sentences about the cvterms. These sentences have 3
parts - a subject term, an object term, and a verb or type. For example
in the phrase "an exon is part of a transcript" the subject of the
sentence is "exon" and the object is "transcript". If you prefer to
think of it as a
<a href="http://en.wikipedia.org/wiki/Directed_graph" class="extiw"
title="wp:Directed graph">directed graph)</a>, then you can think of the
subject as the child node, and the object as the parent node.

## <span id="Associating_features_to_cvterms" class="mw-headline">Associating features to cvterms</span>

This module is used by most of the Chado modules. But it is useful to
describe here how this module would be used in the context of the
[sequence module](Chado_Sequence_Module "Chado Sequence Module").

Often we want to attach cvterms to features. One example is typing
features with SO - this is central to the [sequence
module](Chado_Sequence_Module "Chado Sequence Module"). Each feature has
one primary type, stored in
[feature.type_id](Chado_Tables#Table:_feature "Chado Tables").

We can also attach an arbitrary number of non-primary cvterms to a
feature.

For example, we may want to attach GO annotations to gene or protein
features. We may also want to attach phenotypic terms to gene features
(although the preferred way to do this is _via_ a genotype using the
[genetics module](Chado_Genetic_Module "Chado Genetic Module")).

## <span id="Complex_annotations" class="mw-headline">Complex annotations</span>

Note that this is something that is not handled by the current GO DB,
but it is something we may want to allow for in future.

Currently in GO, all annotations are disjunctive; for example, if we
have

    gene | GO ID
    -----+------
    foo  | GO:001
    foo  | GO:002
    foo  | GO:003

**The text above was taken from <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/schema/trunk/chado/modules/cv/"
class="external text"
rel="nofollow"><code>modules/cv/cv-intro.txt</code></a> , which was
incomplete** (and no longer exists).

The [sequence module](Chado_Sequence_Module "Chado Sequence Module")
makes extensive use of terms taken from various ontologies such as
<a href="http://song.sourceforge.net/" class="external text"
rel="nofollow">SO</a> and the
<a href="http://obofoundry.org" class="external text"
rel="nofollow">OBO</a> Relations Ontology, using the _type_id_ foreign
key column. In addition, features can be annotated using ontologies such
as GO using the
[feature_cvterm](Chado_Tables#Table:_feature_cvterm "Chado Tables")
linking table. These terms are modelled using the cv module, the core of
which is the [cvterm](#Table:_cvterm) table.

An ontology, terminology or cv (controlled vocabulary) is a collection
of terms (here equivalent to what are more typically called classes,
types, categories or kinds in the ontology literature in a particular
domain of interest. Examples include "gene" (from SO), "transcription
factor activity" (from GO molecular function) and "lymphocyte" (from
OBO-Cell). The chado cv module is based on the
<a href="http://www.godatabase.org/dev/sql/doc/godb-sql-doc.html"
class="external text" rel="nofollow">GO Database schema</a>. Terms are
stored in the [cvterm](#Table:_cvterm) table, and relationships between
terms are stored in the
[cvterm_relationship](#Table:_cvterm_relationship) table. This table
follows an analogous structure to the
[feature_relationship](Chado_Tables#Table:_feature_relationship "Chado Tables")
table, in that it has columns _subject_id_, _object_id_ and _type_id_.
Here, all three of these foreign keys refer to rows in the
[cvterm](#Table:_cvterm) table.

A brief treatment of relationship types in biological ontologies can be
<a href="http://www.geneontology.org/GO.ontology.relations.shtml"
class="external text" rel="nofollow">found here</a>. Of particular
interest to Chado is the _is_a_ relation, which specifies a sub-typing
relationship between two terms or classes. Recall that tables in the
sequence module frequently (such as the [feature
table](Chado_Tables#Table:_feature "Chado Tables")) defined a _type_id_
foreign key column to indicate the specific type or class of entity for
each row in that table. The combination of the _type_id_ column and the
_is_a_ relationship gives Chado a data sub-classing system, beyond what
is possible with traditional SQL database semantics.

This is discussed further below. The collection of cvterms and
cvterm_relationships can be considered to constitute vertices and edges
in a graph. This graph is typically acyclic (a
[DAG](Glossary#DAG "Glossary")), though it is not guaranteed to be as
certain relationship types are allowed to form cycles.

| SO Term | SO id |
| ------- | ----- |
| exon    | <a    |

href="http://www.sequenceontology.org/miso/current_release/term/SO:0000147"
class="external text" rel="nofollow">SO:0000147</a> |
| intron | <a
href="http://www.sequenceontology.org/miso/current_release/term/SO:0000188"
class="external text" rel="nofollow">SO:0000188</a> |
| mRNA | ... |
| miRNA | ... |
| regulatory_element | ... |
| transcription_factor_binding_site | ... |

Sequence Ontology Examples

## <span id="Transitive_Closure" class="mw-headline">Transitive Closure</span>

This section concerns relations between ontology terms and how defined
terms and relations can be used to reason, either by humans or
computers. A specialized ontology concerning these relations has been
developed, the <a href="http://obofoundry.org/ro/" class="external text"
rel="nofollow">OBO Relation Ontology</a>.

Often it is useful to know the
<a href="http://en.wikipedia.org/wiki/Transitive_closure" class="extiw"
title="wp:Transitive closure">transitive closure</a> over a relationship
type, or a collection of relationship types. The closure is the result
of recursively applying the relationship. For example, if A _is_a_ B, _B
is_a C_, then the closure of _is_a_ includes A _is_a_ C.

In particular, we want the reflexive transitive closure. A term is
always related to itself in a reflexive closure. Meaning:

    X is_a X

This may seem odd, but it comes in useful both for doing queries and for
deriving future rules. This makes it easier to ask "find me all genes of
class X", and to get back genes attached to X and subtypes of X.

The closure goes in the [cvtermpath](#Table:_cvtermpath) table - the
closure can also be thought of as a path through the graph or semantic
network.

### <span id="Transitivity_of_other_Relations" class="mw-headline">Transitivity of other Relations</span>

Many other relations, such as _part_of_ are also transitive.

If R is a transitive relation, then we can say

    X R Z <= X R Y, Y R Z

For example, assume we have the following 3 _develops_from_ links, and
_develops_from_ is a transitive relation:

     neurectodermal cell develops_from glioblast
     glioblast develops_from glial cell

Then it follows that glial cells develop from neurectodermal cells

### <span id="Transitivity_over_is_a" class="mw-headline">Transitivity over _is_a_</span>

It can be proved from the definition of _is_a_ (proof not shown here)
that:

     X R Z <= X is_a Y, Y R Z

and

     X R Z <= X R Y, Y is_a Z

This can be thought of as "inheritance".

For example, if an astrocyte _is_a_ glial cell and a glial cell
_develops_from_ a glioblast, then it follows that an astrocyte
_develop_from_ a glioblast.

### <span id="Difference_between_Deductive_Closure_and_Transitive_Closure" class="mw-headline">Difference between Deductive Closure and Transitive Closure</span>

With a transitive closure we simply follow all links in the
[DAG](Glossary#DAG "Glossary"), ignoring the relationship type. This
works fine for ontologies such as GO that have only _is_a_ and
_part_of_, but is not ideal for other ontologies such as anatomical
ontologies.

First of all, it may be possible for the closure to grow in size
explosively.

Second of all, a closure that ignores the relations may be
scientifically meaningless. It is also less useful for queries. For
example, we may want to query for genes expressed in the larva or part
of the larva, but not genes expressed in anatomical entities that
develop from the larva.

### <span id="Rules" class="mw-headline">Rules</span>

The [cvtermpath](#Table:_cvtermpath) table is for calculating the
reflexive transitive closure of a relationship, and any derived
relationships.

Normal (direct) relationships are stored in the
[cvterm_relationship](#Table:_cvterm_relationship) table. A entry in
this table represents a _cvterm_relationship_ S over some relation R.

    S = Subj R Obj

For example:

    S = "cardioblast" develops_from "mesodermal cell"

In addition to these _asserted_ links, we want to be able to _deduce_
links between terms.

If X _is_a_ Y, then it follows that all of Y's
[cvterm_relationship](#Table:_cvterm_relationship) statements are
inherited by X.

**Rule 1**

    If X is_a Y
    and  Y R Z
    then X R(inh) Z

For example:

     "cilium axoneme"  is_a "axoneme"
     "axoneme"part_of "cell projection"

Therefore:

     "cilium axoneme"  part_of(inh) "cell projection"

Here we use _T(inh)_ to represent an inherited relationship.

### <span id="Populating_cvtermpath" class="mw-headline">Populating cvtermpath</span>

The [cvtermpath](#Table:_cvtermpath) table stores the reflexive
transitive closure of a relationship, taking into account subsumption or
inheritance. The number of intermediate relationships is represented in
the _distance_ column of the table.

Here we use _T(path)_ to represent the "path" or closure of a
relationship. Every _T(path)_ is stored in
[cvtermpath](#Table:_cvtermpath) . We use the same _cvterm_ for T, the
fact that it is a path is implicit.

We use these rules:

Reflexive relationships:

    for all relations T,
      X T(path) X

In this case the distance = 0.

Direct relationships:

These are also included in the [cvtermpath](#Table:_cvtermpath) table,
distance = 1.

    IfX T Y
    Then X T(path) Y

Transitive relationships:

These have distance \> 1; these also make use of inheritance rule,
**Rule 1**, which gives us _T(inh)_.

    If X T(inh)  Y
    and  Y T(path) Z
    Then X T(path) Z

Note that this rule is recursive.

These rules should be used for populating
[cvtermpath](#Table:_cvtermpath). Attempting to calculate a more general
closure where all relations are treated equally or ignored will produce
combinatorial explosions over certain ontologies (e.g.
<a href="http://www.geneontology.org/gobo/anatomy.ontology/anatomy.fb"
class="external text" rel="nofollow">Flybase anatomy ontology</a>). What
does this mean in practice?

For a typical database, which may only have relations _isa_, _part_of_
and _develops_from_, we will end up with 3 sets of paths.

The _isa_ closure, _isa (path)_ will include paths over
cvterm_relationships that look like this:

    a is_a b is_a c is_a d is_a e

The _part_of_ closure, _part_of(path)_ will include paths over
cvterm_relationships that look like this:

    a is_a b part_of c part_of d is_a e part_of f

The _develops_from_ closure, _develops_from(path)_ will include paths
over cvterm_relationships that look like this:

    a develops_from b develops_from c is_a d is_a e develops_from f

It may be tempting to mix different non-_isa_ relationships in the same
path, but this should **never** be done - there will be an unacceptable
combinatorial explosion in many cases. Besides, there is no use for such
a cvtermpath; it is meaningless.

Note that for
<a href="http://amigo.geneontology.org/" class="external text"
rel="nofollow">Amigo</a>-like query behaviour, it is necessary only to
query [cvtermpath](#Table:_cvtermpath), ignoring cvtermpath.type_id
(these are obtained by querying
[cvterm_relationship](#Table:_cvterm_relationship)).

## <span id="Advanced_Usage" class="mw-headline">Advanced Usage</span>

This section describes advanced usage of the cv module for use with
OWL-DL advanced Obo format 1.2 \[REF\] features or elements from other
ontology formalisms.

If you aren't sure what this means, you probably don't need to read this
section yet.

Note that this section is liable to change; in particular the scheme
below may be replaced with a simpler one. For details of the simpler
scheme, along the lines of the transform used in the GO Database. See:

- <a
  href="http://geneontology.cvs.sourceforge.net/geneontology/go-dev/xml/xsl/oboxml_to_godb_prestore.xsl?view=markup"
  class="external free"
  rel="nofollow">http://geneontology.cvs.sourceforge.net/geneontology/go-dev/xml/xsl/oboxml_to_godb_prestore.xsl?view=markup</a>

(search for intersection_of)

### <span id="Background" class="mw-headline">Background</span>

See the document on
<a href="http://www.fruitfly.org/~cjm/obol/doc/mapping-obo-to-owl.html"
class="external text" rel="nofollow">Converting OBO to OWL</a>.

### <span id="Logical_definitions" class="mw-headline">Logical definitions</span>

In a normal ontology [DAG](Glossary#DAG "Glossary") representation in
<a href="Chado" class="mw-redirect" title="Chado">Chado</a>, the
[cvterm_relationship](#Table:_cvterm_relationship) rows represent
relationships between terms, or more formally, **necessary conditions**.
A logical definition must have both **necessary and sufficient
conditions**. A logical definition often consists of a **generic term**
(also known as "genus") and one or more **discriminating
characteristics** (also known as "differentiae"). The discriminating
characteristics are typically relationships.

For example, the logical definition of "larval locomotory behaviour"
would be a "locomotory behaviour" (genus) which "during" "tt larval
stage" (where "during" could be drawn from an ontology of relations, and
larval stage may come from an insect developmental stage ontology).
These constitute both necessary and sufficient conditions: the
conditions are necessary in that all instances of larval locomotory
behavior are necessarily locomotory behaviors and are necessarily
manifested at the larval stage. We could represent this using a normal
DAG. However, because this is a definition it also constitutes
sufficient conditions, in that any instance of locomotory behavior which
manifests at the larval stage is by definition a larval locomotory
behavior.

In an ontology formalism like OWL-DL or OBO-1.2, genus-differentiae are
represented using set-intersections.

Here is the OBO 1.2 representation:

    [Term]
    id: GO:0008345
    name: larval locomotory behavior
    namespace: biological_process
    is_a: GO:0007626 ! locomotory behavior
    is_a: GO:0030537 ! larval behavior
    intersection_of: GO:0007626  ! GENUS: locomotory behavior
    intersection_of: during FBdv:00005336 ! DIFFERENTIUM: during larval stage

Here is the equivalent in OWL (note: RDF-XML syntax is very verbose!):

```de1
  <owl:Class rdf:ID="GO_0008345">
    <rdfs:label xml:lang="en">larval locomotory behavior</rdfs:label>
    <rdfs:subClassOf rdf:resource="#GO_0007626"/>
    <rdfs:subClassOf rdf:resource="#GO_0030537"/>
    <owl:equivalentClass>
      <owl:Class>
        <owl:intersectionOf rdf:parseType="Collection">
          <owl:Class rdf:about="#GO_0007626"/>
          <owl:Restriction>
            <owl:onProperty>
              <owl:ObjectProperty rdf:about="#during"/>
            </owl:onProperty>
            <owl:someValuesFrom rdf:resource="#FBdv_00005336"/>
          </owl:Restriction>
        </owl:intersectionOf>
      </owl:Class>
    </owl:equivalentClass>
  </owl:Class>
```

When converting to Chado we employ a more economical representation, in
terms of the number of triples we use:

```de1
  <!-- normal DAG relationships (necessary conditions) -->
  <cvterm_relationship>
    <type_id>is_a</type_id>
    <subject_id>GO:0008345</subject_id>
    <object_id>GO:0007626</object_id>
  </cvterm_relationship>
  <cvterm_relationship>
    <type_id>is_a</type_id>
    <subject_id>GO:0008345</subject_id>
    <object_id>GO:0030537</object_id>
  </cvterm_relationship>
 
  <!-- Genus/generic term -->
  <cvterm_relationship>
    <type_id>intersection_of</type_id>
    <subject_id>GO:0008345</subject_id>
    <object_id>GO:0007626</object_id> <!-- locomotory behavior -->
  </cvterm_relationship>
 
  <!-- Discriminating characteristics -->
  <cvterm_relationship>
    <type_id>intersection_of</type_id>
    <subject_id>GO:0008345</subject_id>
    <object_id>
 
      <!-- anonymous term representing  during(larval stage) -->
      <cvterm>
        <dbxref_id>
          <dbxref>
            <db_id>internal</db_id>
            <accession>restriction--OBOL:during--GO:0008345</accession>
          </dbxref>
        </dbxref_id>
 
        <!-- note: as this is an anon term, the name will never
             be shown to a user -->
        <name>restriction--OBOL:during--GO:0008345</name>
        <cv_id>anonymous_cv</cv_id>
        <cvtermprop>
          <type_id>is_anonymous</type_id>
          <value>1</value>
          <rank>0</rank>
        </cvtermprop>
        <cvterm_relationship>
          <type_id>OBOL:during</type_id>
          <object_id>FBdv:00005336</object_id>
        </cvterm_relationship>
      </cvterm>
 
    </object_id>
  </cvterm_relationship>
```

Note that in the above, we are creating **anonymous** terms. We give
them fake names and fake dbxrefs. In the <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/schema/branches/bbop-experimental/"
class="external text" rel="nofollow">bbop-experimental SVN branch</a> of
chado, names and dbxrefs are nullable, so these can be omitted. With the
current schema, you must provide fake dbxrefs and names that are unique,
such as the above (if you are not familiar with how [Chado
XML](Chado_XML "Chado XML") maps to the Chado schema, see the
explanation below).

If you wish to convert OBO-specified logical definitions to [Chado
XML](Chado_XML "Chado XML") you will need
<a href="http://www.godatabase.org/dev/pod/go-perl.html"
class="external text" rel="nofollow">go-perl</a>, v0.05 or higher (if
you have a lower version, the _intersection_of_ tags will simply be
ignored).

    go2chadoxml ont.obo > ont.chado

### <span id="How_Logical_Definitions_are_Stored_in_Chado" class="mw-headline">How Logical Definitions are Stored in Chado</span>

This involves no schema changes to the cv module. Each _intersection_of_
goes in as a [DAG](Glossary#DAG "Glossary") arc of type
_internal:intersection_of_. The _object_id_ in the arc is either a term
(for the genus) or an anonymous term representing a restriction (the
differentium). The restriction has a relationship of some type to
another term.

For example, for "larval locomotory behavior" we would normally just
have:

    LLB is_a LocomotoryBehavior
    LLB is_a LarvalBehavior

If we load a logical definition for this term (see /t/data/llm/obo in
the <a href="http://www.godatabase.org/dev/pod/go-perl.html"
class="external text" rel="nofollow">go-perl</a> package), like this:

    [Term]
    id: GO:0008345
    name: larval locomotory behavior
    namespace: biological_process
    is_a: GO:0007626 ! locomotory behavior
    is_a: GO:0030537 ! larval behavior
    intersection_of: GO:0007626  ! locomotory behavior
    intersection_of: during FBdv:00005336 ! larval stage

Then the *intersection_of*s get stored using the basic DAG tables as:

| Subject  | Relation          | Object               |
| -------- | ----------------- | -------------------- |
| LLB      | _intersection_of_ | Locomotory Behaviour |
| LLB      | _intersection_of_ | anon:xxx             |
| anon:xxx | during            | FBv:00005336         |

Definition stored in [cvterm_relationship](#Table:_cvterm_relationship)
table

This uses 4 cvterm_relationships and the creation of a new **anonymous**
term that is never shown directly to the user. The anonymous term
represents the class of things that happen during the larval stage.

### <span id="Logical_Definition_Views" class="mw-headline">Logical Definition Views</span>

Two views: _cvterm_genus_ and _cvterm_differentium_ views are in
chado/modules/cv/views.

### <span id="Example_Use_Case:_Phenotypes" class="mw-headline">Example Use Case: [Phenotypes](Category%253APhenotypes "Category%253APhenotypes")</span>

The idea here is that queries for composed term "syndactyly" should
automatically return the same results as a boolean query for "fusion" +
_inheres_in_ = "finger" regardless of whether the annotation is to the
composed term or is a composed annotation (provided we put the logical
definition of syndactyly in the database).

### <span id="Example_Use_Case:_Feature_Types" class="mw-headline">Example Use Case: Feature Types</span>

The Sequence Ontology has some logical definitions - you will need to
load the file <a
href="http://song.cvs.sourceforge.net/song/ontology/so-xp.obo?view=log"
class="external text" rel="nofollow">so-xp.obo</a>.

#### <span id="Example_use_case:_GO" class="mw-headline">Example use case: GO</span>

See <a href="http://wiki.geneontology.org/index.php/Obol"
class="external text" rel="nofollow">Obol</a>.

#### <span id="Example_use_case:_Drawing_DAGs" class="mw-headline">Example use case: Drawing DAGs</span>

Currently the DAGs of many OBO ontologies are highly tangled; see
<a href="http://www.fruitfly.org/~cjm/obol/doc/go-complexity.html"
class="external free"
rel="nofollow">http://www.fruitfly.org/~cjm/obol/doc/go-complexity.html</a>

If all terms have logical definitions, then there is only one **true**
(genus) or _isa_ parent. This enables us to disentangle the DAGs and
draw distinct hierarchies. For example, the GO term **cysteine
biosynthesis** could be drawn as two distinct hierarchies - one process
and one chemical.

#### <span id="Loading_OWL_into_Chado" class="mw-headline">Loading OWL into Chado</span>

Not all OWL-DL features are supported. Only *intersection_of*s
corresponding to genus-differentiae are loaded.

First you must convert OWL into OBO 1.2 format. There will soon be a way
to do this in <a href="http://www.oboedit.org/" class="external text"
rel="nofollow">OboEdit</a>. For now you can use
<a href="http://www.blipkit.org" class="external text"
rel="nofollow">blipkit</a>.

    blip io-convert my.owl -to obo -o my.obo

Once you have an OBO file you can run <a
href="http://search.cpan.org/src/CMUNGALL/go-perl-0.06/scripts/go2chadoxml"
class="external text" rel="nofollow">go2chadoxml</a>, as above.

#### <span id="Post-coordinating_Terms" class="mw-headline">Post-coordinating Terms</span>

Sometimes we want to be able to refer to a term such as "plasma membrane
of spermatocyte", but no such term exists in the ontology. Introducing
these as **pre-coordinated** cross-product terms would make the ontology
unwieldy due the large number of possible combinations.

Chado allows the **post-coordination** or **post-composition** of terms
using the same formalism as described above. Briefly: we would create an
**anonymous** term. This anonymous term would be defined using the terms
"plasma membrane" and "spermatocyte", using a genus-differentia
definition as above.

```de1
  <!-- Genus/generic term -->
  <cvterm_relationship>
    <type_id>intersection_of</type_id>
    <subject_id>anon_1</subject_id>
    <object_id>GO__plasma_membrane</object_id>
  </cvterm_relationship>
 
  <!-- Discriminating characteristics -->
  <cvterm_relationship>
    <type_id>intersection_of</type_id>
    <subject_id>anon_1</subject_id>
    <object_id>
 
      <!-- anonymous term representing  part_of(spermatocyte) -->
      <cvterm>
        <dbxref_id>
          <dbxref>
            <db_id>internal</db_id>
            <accession>restriction--part_of--spermatocyte</accession>
          </dbxref>
        </dbxref_id>
 
        <!-- note: as this is an anon term, the name will never
             be shown to a user -->
        <name>restriction--part_of--spermatocyte</name>
        <cv_id>anonymous_cv</cv_id>
        <cvtermprop>
          <type_id>is_anonymous</type_id>
          <value>1</value>
          <rank>0</rank>
        </cvtermprop>
        <cvterm_relationship>
          <type_id>OBO_REL:part_of</type_id>
          <object_id>CL__spermatocyte</object_id>
        </cvterm_relationship>
      </cvterm>
 
    </object_id>
  </cvterm_relationship>
```

The above assumes [XORT](XORT.1 "XORT") macro IDs defined for
_GO\_\_plasma_membrane_ and _CL\_\_spermatocyte_.

Allow post-coordinated terms places a greater burden on applications
that use the cv module. More documentation will be provided here on
this.

# <span id="Tables" class="mw-headline">Tables</span>

## <span id="Table:_cv" class="mw-headline">Table: cv</span>

A controlled vocabulary or ontology. A cv is composed of cvterms (AKA
terms, classes, types, universals - relations and properties are also
stored in cvterm) and the relationships between them.

<table data-border="1" data-cellpadding="3">
<caption>cv Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>F-Key</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cv_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em>UNIQUE NOT NULL</em><br />
<br />
The name of the ontology. This corresponds to the obo-format
-namespace-. cv names uniquely identify the cv. In OBO file format, the
cv.name is known as the namespace.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>definition</td>
<td>text</td>
<td><em></em><br />
<br />
A text description of the criteria for membership of this ontology.</td>
</tr>
</tbody>
</table>

cv Structure

Tables referencing this one via Foreign Key Constraints:

- [cvterm](Chado_Tables#Table:_cvterm "Chado Tables")

<!-- -->

- [cvtermpath](Chado_Tables#Table:_cvtermpath "Chado Tables")

---

## <span id="Table:_cvterm" class="mw-headline">Table: cvterm</span>

A term, class, universal or type within an ontology or controlled
vocabulary. This table is also used for relations and properties.
cvterms constitute nodes in the graph defined by the collection of
cvterms and cvterm_relationships.

<table data-border="1" data-cellpadding="3">
<caption>cvterm Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>F-Key</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cvterm_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cv"
title="Chado Tables">cv</a></p></td>
<td>cv_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The cv or ontology or namespace to which this cvterm belongs.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>name</td>
<td>character varying(1024)</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
A concise human-readable name or label for the cvterm. Uniquely
identifies a cvterm within a cv.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>definition</td>
<td>text</td>
<td><em></em><br />
<br />
A human-readable text definition.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_dbxref"
title="Chado Tables">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em>UNIQUE NOT NULL</em><br />
<br />
Primary identifier dbxref - The unique global OBO identifier for this
cvterm. Note that a cvterm may have multiple secondary dbxrefs - see
also table: cvterm_dbxref.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_obsolete</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Boolean 0=false,1=true; see GO documentation for details of obsoletion.
Note that two terms with different primary dbxrefs may exist if one is
obsolete.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>is_relationshiptype</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
Boolean 0=false,1=true relations or relationship types (also known as
Typedefs in OBO format, or as properties or slots) form a cv/ontology in
themselves. We use this flag to indicate whether this cvterm is an
actual term/class/universal or a relation. Relations may be drawn from
the OBO Relations ontology, but are not exclusively drawn from
there.</td>
</tr>
</tbody>
</table>

cvterm Structure

Tables referencing this one via Foreign Key Constraints:

- [acquisition_relationship](Chado_Tables#Table:_acquisition_relationship "Chado Tables")

<!-- -->

- [acquisitionprop](Chado_Tables#Table:_acquisitionprop "Chado Tables")

<!-- -->

- [analysisprop](Chado_Tables#Table:_analysisprop "Chado Tables")

<!-- -->

- [arraydesign](Chado_Tables#Table:_arraydesign "Chado Tables")

<!-- -->

- [arraydesignprop](Chado_Tables#Table:_arraydesignprop "Chado Tables")

<!-- -->

- [assayprop](Chado_Tables#Table:_assayprop "Chado Tables")

<!-- -->

- [biomaterial_relationship](Chado_Tables#Table:_biomaterial_relationship "Chado Tables")

<!-- -->

- [biomaterial_treatment](Chado_Tables#Table:_biomaterial_treatment "Chado Tables")

<!-- -->

- [biomaterialprop](Chado_Tables#Table:_biomaterialprop "Chado Tables")

<!-- -->

- [contact](Chado_Tables#Table:_contact "Chado Tables")

<!-- -->

- [contact_relationship](Chado_Tables#Table:_contact_relationship "Chado Tables")

<!-- -->

- [control](Chado_Tables#Table:_control "Chado Tables")

<!-- -->

- [cvterm_dbxref](Chado_Tables#Table:_cvterm_dbxref "Chado Tables")

<!-- -->

- [cvterm_relationship](Chado_Tables#Table:_cvterm_relationship "Chado Tables")

<!-- -->

- [cvtermpath](Chado_Tables#Table:_cvtermpath "Chado Tables")

<!-- -->

- [cvtermprop](Chado_Tables#Table:_cvtermprop "Chado Tables")

<!-- -->

- [cvtermsynonym](Chado_Tables#Table:_cvtermsynonym "Chado Tables")

<!-- -->

- [dbxrefprop](Chado_Tables#Table:_dbxrefprop "Chado Tables")

<!-- -->

- [element](Chado_Tables#Table:_element "Chado Tables")

<!-- -->

- [element_relationship](Chado_Tables#Table:_element_relationship "Chado Tables")

<!-- -->

- [elementresult_relationship](Chado_Tables#Table:_elementresult_relationship "Chado Tables")

<!-- -->

- [environment_cvterm](Chado_Tables#Table:_environment_cvterm "Chado Tables")

<!-- -->

- [feature](Chado_Tables#Table:_feature "Chado Tables")

<!-- -->

- [feature_cvterm](Chado_Tables#Table:_feature_cvterm "Chado Tables")

<!-- -->

- [feature_cvtermprop](Chado_Tables#Table:_feature_cvtermprop "Chado Tables")

<!-- -->

- [feature_genotype](Chado_Tables#Table:_feature_genotype "Chado Tables")

<!-- -->

- [feature_pubprop](Chado_Tables#Table:_feature_pubprop "Chado Tables")

<!-- -->

- [feature_relationship](Chado_Tables#Table:_feature_relationship "Chado Tables")

<!-- -->

- [feature_relationshipprop](Chado_Tables#Table:_feature_relationshipprop "Chado Tables")

<!-- -->

- [featuremap](Chado_Tables#Table:_featuremap "Chado Tables")

<!-- -->

- [featureprop](Chado_Tables#Table:_featureprop "Chado Tables")

<!-- -->

- [library](Chado_Tables#Table:_library "Chado Tables")

<!-- -->

- [library_cvterm](Chado_Tables#Table:_library_cvterm "Chado Tables")

<!-- -->

- [libraryprop](Chado_Tables#Table:_libraryprop "Chado Tables")

<!-- -->

- [organism_relationship](Chado_Tables#Table:_organism_relationship "Chado Tables")

<!-- -->

- [organismpath](Chado_Tables#Table:_organismpath "Chado Tables")

<!-- -->

- [organismprop](Chado_Tables#Table:_organismprop "Chado Tables")

<!-- -->

- [phendesc](Chado_Tables#Table:_phendesc "Chado Tables")

<!-- -->

- [phenotype](Chado_Tables#Table:_phenotype "Chado Tables")

<!-- -->

- [phenotype_comparison](Chado_Tables#Table:_phenotype_comparison "Chado Tables")

<!-- -->

- [phenotype_cvterm](Chado_Tables#Table:_phenotype_cvterm "Chado Tables")

<!-- -->

- [phenstatement](Chado_Tables#Table:_phenstatement "Chado Tables")

<!-- -->

- [phylonode](Chado_Tables#Table:_phylonode "Chado Tables")

<!-- -->

- [phylonode_relationship](Chado_Tables#Table:_phylonode_relationship "Chado Tables")

<!-- -->

- [phylonodeprop](Chado_Tables#Table:_phylonodeprop "Chado Tables")

<!-- -->

- [phylotree](Chado_Tables#Table:_phylotree "Chado Tables")

<!-- -->

- [protocol](Chado_Tables#Table:_protocol "Chado Tables")

<!-- -->

- [protocolparam](Chado_Tables#Table:_protocolparam "Chado Tables")

<!-- -->

- [pub](Chado_Tables#Table:_pub "Chado Tables")

<!-- -->

- [pub_relationship](Chado_Tables#Table:_pub_relationship "Chado Tables")

<!-- -->

- [pubprop](Chado_Tables#Table:_pubprop "Chado Tables")

<!-- -->

- [quantification_relationship](Chado_Tables#Table:_quantification_relationship "Chado Tables")

<!-- -->

- [quantificationprop](Chado_Tables#Table:_quantificationprop "Chado Tables")

<!-- -->

- [stock](Chado_Tables#Table:_stock "Chado Tables")

<!-- -->

- [stock_cvterm](Chado_Tables#Table:_stock_cvterm "Chado Tables")

<!-- -->

- [stock_relationship](Chado_Tables#Table:_stock_relationship "Chado Tables")

<!-- -->

- [stockcollection](Chado_Tables#Table:_stockcollection "Chado Tables")

<!-- -->

- [stockcollectionprop](Chado_Tables#Table:_stockcollectionprop "Chado Tables")

<!-- -->

- [stockprop](Chado_Tables#Table:_stockprop "Chado Tables")

<!-- -->

- [studydesignprop](Chado_Tables#Table:_studydesignprop "Chado Tables")

<!-- -->

- [studyfactor](Chado_Tables#Table:_studyfactor "Chado Tables")

<!-- -->

- [synonym](Chado_Tables#Table:_synonym "Chado Tables")

<!-- -->

- [treatment](Chado_Tables#Table:_treatment "Chado Tables")

<!-- -->

- [wwwuser_cvterm](Chado_Tables#Table:_wwwuser_cvterm "Chado Tables")

---

## <span id="Table:_cvterm_dbxref" class="mw-headline">Table: cvterm_dbxref</span>

In addition to the primary identifier (cvterm.dbxref_id) a cvterm can
have zero or more secondary identifiers/dbxrefs, which may refer to
records in external databases. The exact semantics of cvterm_dbxref are
not fixed. For example: the dbxref could be a pubmed ID that is
pertinent to the cvterm, or it could be an equivalent or similar term in
another ontology. For example, GO cvterms are typically linked to
InterPro IDs, even though the nature of the relationship between them is
largely one of statistical association. The dbxref may be have data
records attached in the same database instance, or it could be a
"hanging" dbxref pointing to some external database. NOTE: If the
desired objective is to link two cvterms together, and the nature of the
relation is known and holds for all instances of the subject cvterm then
consider instead using cvterm_relationship together with a well-defined
relation.

<table data-border="1" data-cellpadding="3">
<caption>cvterm_dbxref Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>F-Key</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cvterm_dbxref_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>cvterm_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_dbxref"
title="Chado Tables">dbxref</a></p></td>
<td>dbxref_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>is_for_definition</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
A cvterm.definition should be supported by one or more references. If
this column is true, the dbxref is not for a term in an external
database - it is a dbxref for provenance information for the
definition.</td>
</tr>
</tbody>
</table>

cvterm_dbxref Structure

---

## <span id="Table:_cvterm_relationship" class="mw-headline">Table: cvterm_relationship</span>

A relationship linking two cvterms. Each cvterm_relationship constitutes
an edge in the graph defined by the collection of cvterms and
cvterm_relationships. The meaning of the cvterm_relationship depends on
the definition of the cvterm R refered to by type_id. However, in
general the definitions are such that the statement "all SUBJs REL some
OBJ" is true. The cvterm_relationship statement is about the subject,
not the object. For example "insect wing part_of thorax".

<table data-border="1" data-cellpadding="3">
<caption>cvterm_relationship Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>F-Key</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cvterm_relationship_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The nature of the relationship between subject and object. Note that
relations are also housed in the cvterm table, typically from the OBO
relationship ontology, although other relationship types are
allowed.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>subject_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The subject of the subj-predicate-obj sentence. The cvterm_relationship
is about the subject. In a graph, this typically corresponds to the
child node.</td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>object_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
The object of the subj-predicate-obj sentence. The cvterm_relationship
refers to the object. In a graph, this typically corresponds to the
parent node.</td>
</tr>
</tbody>
</table>

cvterm_relationship Structure

---

## <span id="Table:_cvtermpath" class="mw-headline">Table: cvtermpath</span>

The reflexive transitive closure of the cvterm_relationship relation.

<table data-border="1" data-cellpadding="3">
<caption>cvtermpath Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>F-Key</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cvtermpath_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
<br />
The relationship type that this is a closure over. If null, then this is
a closure over ALL relationship types. If non-null, then this references
a relationship cvterm - note that the closure will apply to both this
relationship AND the OBO_REL:is_a (subclass) relationship.</td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>subject_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>object_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_cv"
title="Chado Tables">cv</a></p></td>
<td>cv_id</td>
<td>integer</td>
<td><em>NOT NULL</em><br />
<br />
Closures will mostly be within one cv. If the closure of a relationship
traverses a cv, then this refers to the cv of the object_id cvterm.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>pathdistance</td>
<td>integer</td>
<td><em>UNIQUE#1</em><br />
<br />
The number of steps required to get from the subject cvterm to the
object cvterm, counting from zero (reflexive relationship).</td>
</tr>
</tbody>
</table>

cvtermpath Structure

---

## <span id="Table:_cvtermprop" class="mw-headline">Table: cvtermprop</span>

Additional extensible properties can be attached to a cvterm using this
table. Corresponds to -AnnotationProperty- in W3C OWL format.

<table data-border="1" data-cellpadding="3">
<caption>cvtermprop Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>F-Key</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cvtermprop_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>cvterm_id</td>
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
The name of the property or slot is a cvterm. The meaning of the
property is defined in that cvterm.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>value</td>
<td>text</td>
<td><em>UNIQUE#1 NOT NULL DEFAULT ''::text</em><br />
<br />
The value of the property, represented as text. Numeric values are
converted to their text representation.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>rank</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Property-Value ordering. Any cvterm can have multiple values for any
particular property type - these are ordered in a list using rank,
counting from zero. For properties that are single-valued rather than
multi-valued, the default 0 value should be used.</td>
</tr>
</tbody>
</table>

cvtermprop Structure

---

## <span id="Table:_cvtermsynonym" class="mw-headline">Table: cvtermsynonym</span>

A cvterm actually represents a distinct class or concept. A concept can
be refered to by different phrases or names. In addition to the primary
name (cvterm.name) there can be a number of alternative aliases or
synonyms. For example, "T cell" as a synonym for "T lymphocyte".

<table data-border="1" data-cellpadding="3">
<caption>cvtermsynonym Structure</caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th>F-Key</th>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd tr0">
<td></td>
<td>cvtermsynonym_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>cvterm_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>synonym</td>
<td>character varying(1024)</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_cvterm"
title="Chado Tables">cvterm</a></p></td>
<td>type_id</td>
<td>integer</td>
<td><em></em><br />
<br />
A synonym can be exact, narrower, or broader than.</td>
</tr>
</tbody>
</table>

cvtermsynonym Structure

---

## <span id="Table:_dbxrefprop" class="mw-headline">Table: dbxrefprop</span>

Metadata about a dbxref. Note that this is not defined in the dbxref
module, as it depends on the cvterm table. This table has a structure
analagous to cvtermprop.

| F-Key                                               | Name          | Type    | Description                 |
| --------------------------------------------------- | ------------- | ------- | --------------------------- |
|                                                     | dbxrefprop_id | serial  | _PRIMARY KEY_               |
| [dbxref](Chado_Tables#Table:_dbxref "Chado Tables") | dbxref_id     | integer | _UNIQUE#1 NOT NULL_         |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id       | integer | _UNIQUE#1 NOT NULL_         |
|                                                     | value         | text    | _NOT NULL DEFAULT ''::text_ |
|                                                     | rank          | integer | _UNIQUE#1 NOT NULL_         |

dbxrefprop Structure

---

[Categories](Special%253ACategories "Special%253ACategories"):

- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
- [Chado Modules](Category%253AChado_Modules "Category%253AChado Modules")
- [Ontologies](Category%253AOntologies "Category%253AOntologies")
- [!Lacking ERD](Category%253A!Lacking_ERD "Category%253A!Lacking ERD")

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_CV_Module" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 04:35 on 18 February 2015.</span>
<!-- - <span id="footer-info-viewcount">510,098 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

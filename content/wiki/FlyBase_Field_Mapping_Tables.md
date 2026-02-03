---
title: "FlyBase Field Mapping Tables"
---
# FlyBase Field Mapping Tables

  Introduction](#Introduction)
- [FlyBase Gene
  Report](#FlyBase_Gene_Report)
- [FlyBase Allele
  Report](#FlyBase_Allele_Report)
- [FlyBase Gene
  Expression Report](#FlyBase_Gene_Expression_Report)
- [FlyBase
  Transcript Report](#FlyBase_Transcript_Report)
- [FlyBase
  Polypeptide Report](#FlyBase_Polypeptide_Report)
- [FlyBase
  Insertion Report](#FlyBase_Insertion_Report)
- [FlyBase Clone
  Report](#FlyBase_Clone_Report)
- [FlyBase Stock
  Report](#FlyBase_Stock_Report)
- [FlyBase
  Aberration Report](#FlyBase_Aberration_Report)
- [FlyBase
  Balancer Report](#FlyBase_Balancer_Report)
- [FlyBase
  Reference Report](#FlyBase_Reference_Report)
- [FlyBase
  Transgenic Construct
  Report](#FlyBase_Transgenic_Construct_Report)
- [FlyBase
  Natural Transposon Report](#FlyBase_Natural_Transposon_Report)

## Introduction

The FlyBase field mapping tables map fields in the FlyBase data class
reports (genes, alleles, insertions, etc...) to locations in Chado. They
contain simple tables with the first column containing the field name
and the second column containing the SQL required to find data for that
field.

## FlyBase Gene Report

**Example report:**
<a href="http://flybase.org/reports/FBgn0259750.html"

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">General information</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Symbol</td>
<td>

<pre class="de1"><code>SELECT DISTINCT(s.name)
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt, cvterm cvt2
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;gene&#39; AND
    f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt2.cvterm_id AND cvt2.name = &#39;symbol&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Species</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, o.genus, o.species
  FROM feature f, cvterm cvt, organism o
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;gene&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename LIKE &#39;FBgn%&#39; AND
    f.organism_id = o.organism_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT DISTINCT(s.name)
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt, cvterm cvt2
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;gene&#39; AND
    f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt2.cvterm_id AND cvt2.name = &#39;fullname&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Annotation symbol</td>
<td>

<pre class="de1"><code>SELECT accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;FlyBase Annotation IDs&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Feature type</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;promoted_gene_type&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT f.uniquename
  FROM feature f, cvterm cvt
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;gene&#39; AND
    f.name = &#39;ab&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Created/Updated</td>
<td>

<pre class="de1"><code>SELECT timeaccessioned, timelastmodified
  FROM feature f
  WHERE uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Gene Model Status</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_gene_model_status&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Genetic Status</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_genetic_status&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">GENOMIC LOCATION</td>
</tr>
<tr class="odd">
<td>Chromosome arm</td>
<td>

<pre class="de1"><code>SELECT a.uniquename
  FROM feature f, featureloc fl, feature a
  WHERE f.feature_id = fl.feature_id AND fl.srcfeature_id = a.feature_id AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Recombination map</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;promoted_genetic_location&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Cytogenetic map</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_computed_cyto&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Sequence location</td>
<td>

<pre class="de1"><code>SELECT s.uniquename, fmin, fmax, strand
  FROM feature f, featureloc fl, feature s
  WHERE f.feature_id = fl.feature_id AND fl.srcfeature_id = s.feature_id AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">DETAILED MAPPING DATA</td>
</tr>
<tr class="even">
<td colspan="2">FlyBase computed cytological location</td>
</tr>
<tr class="odd">
<td>Cytogenetic map</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_computed_cyto&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Evidence for location</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_computed_cyto&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Experimentally determined cytological location</td>
</tr>
<tr class="even">
<td>Cytogenetic map</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_experimental_cyto&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Notes</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;cyto_loc_comment&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Reference</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;cyto_loc_comment&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND f.uniquename = &#39;FBgn0000060&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Experimentally determined recombination data</td>
</tr>
<tr class="even">
<td>Location</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;genetic_location&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Left of (cM)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, o.uniquename, o.name, p.uniquename
  FROM feature f, feature_relationship fr, cvterm cvt, feature o, feature_relationship_pub frp,
     pub p
  WHERE f.feature_id = subject_id AND object_id = o.feature_id AND
    fr.feature_relationship_id = frp.feature_relationship_id AND frp.pub_id = p.pub_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;recom_right_end&#39; AND
    f.uniquename = &#39;FBgn0000051&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Right of (cM)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, o.uniquename, o.name, p.uniquename
  FROM feature f, feature_relationship fr, cvterm cvt, feature o, feature_relationship_pub frp,
     pub p
  WHERE f.feature_id = subject_id AND object_id = o.feature_id AND
    fr.feature_relationship_id = frp.feature_relationship_id AND frp.pub_id = p.pub_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;recom_left_end&#39; AND
    f.uniquename = &#39;FBgn0000051&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Notes</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;cyto_loc_comment&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND f.uniquename = &#39;FBgn0000060&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Reference</td>
<td>See above</td>
</tr>
<tr class="odd">
<td colspan="2">Molecular map data</td>
</tr>
<tr class="even">
<td>Gene Order<br />
(in direction of increasing cytology)</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    fp.featureprop_id = fpp.featureprop_id AND fpp.pub_id = p.pub_id AND
    cvt.name = &#39;gene_order&#39; AND fp.VALUE LIKE &#39;Gene order: In direction%&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Reference</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Gene Order<br />
(overall orientation not stated)</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    fp.featureprop_id = fpp.featureprop_id AND fpp.pub_id = p.pub_id AND
    cvt.name = &#39;gene_order&#39; AND fp.VALUE LIKE &#39;Gene order: In direction%&#39; AND
    f.uniquename = &#39;FBgn0000053&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Reference</td>
<td>See above</td>
</tr>
<tr class="even">
<td colspan="2">SYNONYMS AND SECONDARY IDs</td>
</tr>
<tr class="odd">
<td colspan="2">REPORTED AS</td>
</tr>
<tr class="even">
<td>Symbol Synonym</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, s.name AS synonym, synonym_sgml, cvt.name, p.uniquename
  FROM cvterm cvt, feature f, feature_synonym fs, synonym s, pub p
  WHERE f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.pub_id = p.pub_id AND s.type_id = cvt.cvterm_id AND
    cvt.name = &#39;symbol&#39; AND fs.is_current = &#39;f&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Name Synonym</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, s.name AS synonym, synonym_sgml, cvt.name, p.uniquename
  FROM cvterm cvt, feature f, feature_synonym fs, synonym s, pub p
  WHERE f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.pub_id = p.pub_id AND s.type_id = cvt.cvterm_id AND
    cvt.name = &#39;fullname&#39; AND fs.is_current = &#39;f&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>SECONDARY FLYBASE IDs</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, accession, db.name
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;f&#39; AND d.db_id = db.db_id AND
    db.name = &#39;FlyBase&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">GENE PRODUCTS &amp; EXPRESSION</td>
</tr>
<tr class="even">
<td colspan="2">GENE MODEL &amp; FEATURES</td>
</tr>
<tr class="odd">
<td>COMMENTS ON GENE MODEL</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p,
     cv
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    fp.featureprop_id = fpp.featureprop_id AND fpp.pub_id = p.pub_id AND
    cvt.cv_id = cv.cv_id AND cv.name = &#39;annotation property type&#39; AND
    cvt.name = &#39;comment&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">SEQUENCES SUPPORTING THE GENE MODEL</td>
</tr>
<tr class="odd">
<td>DNA sequence</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_supporting_accessions&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Protein sequence</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Name</td>
<td></td>
</tr>
<tr class="even">
<td>UniProtKB/Swiss-Prot</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, fd.is_current, db.name, dbx.accession
  FROM feature g, feature_dbxref fd, dbxref dbx, db, cvterm gt
  WHERE g.type_id = gt.cvterm_id AND gt.name = &#39;gene&#39; AND
    g.uniquename LIKE &#39;FBgn%&#39; AND g.is_obsolete = &#39;f&#39; AND
    g.feature_id = fd.feature_id AND fd.dbxref_id = dbx.dbxref_id AND
    dbx.db_id = db.db_id AND db.name = &#39;UniProt/Swiss-Prot&#39; AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>UniProtKB/TrEMBL</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, fd.is_current, db.name, dbx.accession
  FROM feature g, feature_dbxref fd, dbxref dbx, db, cvterm gt
  WHERE g.type_id = gt.cvterm_id AND gt.name = &#39;gene&#39; AND
    g.uniquename LIKE &#39;FBgn%&#39; AND g.is_obsolete = &#39;f&#39; AND
    g.feature_id = fd.feature_id AND fd.dbxref_id = dbx.dbxref_id AND
    dbx.db_id = db.db_id AND db.name = &#39;UniProt/TrEMBL&#39; AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Maps to</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, c.uniquename, c.name
  FROM feature f, feature_relationship fr, cvterm cvt, feature c
  WHERE f.feature_id = subject_id AND object_id = c.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;maps_to_clone&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Does NOT map to</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, c.uniquename, c.name
  FROM feature f, feature_relationship fr, cvterm cvt, feature c
  WHERE f.feature_id = subject_id AND object_id = c.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;nomaps_to_clone&#39; AND
    f.uniquename = &#39;FBgn0003308&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Identified with</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, c.uniquename, c.name
  FROM feature f, feature_relationship fr, cvterm cvt, feature c
  WHERE f.feature_id = subject_id AND object_id = c.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;identified_with&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">MAPPED FEATURES AND MUTATIONS</td>
</tr>
<tr class="even">
<td>Type</td>
<td>

<pre class="de1"><code>SELECT cvt.name
  FROM feature f, feature_relationship fr, feature m, cvterm cvt
  WHERE f.uniquename LIKE &#39;FBgn%&#39; AND f.feature_id = object_id AND
    subject_id = m.feature_id AND m.type_id = cvt.cvterm_id AND
    cvt.name IN (&#39;aberration_junction&#39;,&#39;complex_substitution&#39;,
      &#39;deletion&#39;,&#39;enhancer&#39;,
      &#39;insertion_site&#39;,&#39;point_mutation&#39;,
       &#39;protein_binding_site&#39;,&#39;regulatory_region&#39;,
      &#39;rescue_fragment&#39;,&#39;sequence_variant&#39;,
      &#39;transposable_element_target_site_duplication&#39;,&#39;uncharacterized_change_in_nucleotide_sequence&#39;) AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Symbol &amp; Location</td>
<td>

<pre class="de1"><code>SELECT m.uniquename AS mutation, s.uniquename AS arm, strand, fmin, fmax
  FROM featureloc fl, feature f, feature_relationship fr, feature m, cvterm cvt,
     feature s
  WHERE f.uniquename LIKE &#39;FBgn%&#39; AND f.feature_id = object_id AND
    subject_id = m.feature_id AND m.type_id = cvt.cvterm_id AND
    cvt.name IN (&#39;aberration_junction&#39;,&#39;complex_substitution&#39;,
      &#39;deletion&#39;,&#39;enhancer&#39;,
      &#39;insertion_site&#39;,&#39;point_mutation&#39;,
       &#39;protein_binding_site&#39;,&#39;regulatory_region&#39;,
      &#39;rescue_fragment&#39;,&#39;sequence_variant&#39;,
      &#39;transposable_element_target_site_duplication&#39;,&#39;uncharacterized_change_in_nucleotide_sequence&#39;) AND m.feature_id = fl.feature_id AND
    fl.srcfeature_id = s.feature_id AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Additional Notes</td>
<td>

<pre class="de1"><code>SELECT m.uniquename, p.uniquename, cvt2.name, fp.VALUE
  FROM feature f, feature_relationship fr, feature m, feature_pub mp, pub p,
     cvterm cvt, cvterm cvt2, featureprop fp
  WHERE f.uniquename LIKE &#39;FBgn%&#39; AND f.feature_id = object_id AND
    su\ object_id = m.feature_id AND m.type_id = cvt.cvterm_id AND
    cvt.name IN (&#39;aberration_junction&#39;,&#39;complex_substitution&#39;,
      &#39;deletion&#39;,&#39;enhancer&#39;,
      &#39;insertion_site&#39;,&#39;point_mutation&#39;,
       &#39;protein_binding_site&#39;,&#39;regulatory_region&#39;,
      &#39;rescue_fragment&#39;,&#39;sequence_variant&#39;,
      &#39;transposable_element_target_site_duplication&#39;,&#39;uncharacterized_change_in_nucleotide_sequence&#39;) AND m.feature_id = mp.feature_id AND
    mp.pub_id = p.pub_id AND m.feature_id = fp.feature_id AND
    fp.type_id = cvt2.cvterm_id AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>References</td>
<td>See above</td>
</tr>
<tr class="even">
<td colspan="2">EXTERNAL DATA</td>
</tr>
<tr class="odd">
<td>DEDB (LinkOut)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;dedb&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>EPD</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;EPD&#39; AND f.uniquename = &#39;FBgn0000042&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">TRANSCRIPT DATA</td>
</tr>
<tr class="even">
<td colspan="2">ANNOTATED TRANSCRIPTS</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT p.uniquename, p.name, p.seqlen, fmin, fmax, strand, a.uniquename AS arm
  FROM feature f, feature p, feature_relationship fr, cvterm cvt, featureloc fl,
     feature a, cvterm cvt2
  WHERE f.feature_id = object_id AND subject_id = p.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;partof&#39; AND
    p.type_id = cvt2.cvterm_id AND cvt2.name IN (&#39;mRNA&#39;, &#39;snoRNA&#39;,
       &#39;ncRNA&#39;, &#39;snRNA&#39;,
      &#39;tRNA&#39;,&#39;rRNA&#39;,
      &#39;miRNA&#39;, &#39;pseudogene&#39;) AND
    p.feature_id = fl.feature_id AND fl.srcfeature_id = a.feature_id AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Length (nt)</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Associated CDS (aa)</td>
<td>

<pre class="de1"><code>SELECT t.uniquename, t.name, p.uniquename, p.name, p.seqlen
  FROM feature g, feature_relationship fr, cvterm cvt, feature t, cvterm cvt2,
     feature p, feature_relationship fr2, cvterm cvt3, cvterm cvt4
  WHERE g.feature_id = fr.object_id AND fr.subject_id = t.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;partof&#39; AND
    t.type_id = cvt2.cvterm_id AND cvt2.name IN (&#39;mRNA&#39;, &#39;snoRNA&#39;,
       &#39;ncRNA&#39;, &#39;snRNA&#39;,
      &#39;tRNA&#39;,&#39;rRNA&#39;,
      &#39;miRNA&#39;, &#39;pseudogene&#39;) AND
    t.feature_id = fr2.object_id AND fr2.subject_id = p.feature_id AND
    fr2.type_id = cvt3.cvterm_id AND cvt3.name = &#39;producedby&#39; AND
    p.type_id = cvt4.cvterm_id AND cvt4.name = &#39;protein&#39; AND
    p.seqlen IS NOT NULL AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">ADDITIONAL TRANSCRIPT DATA AND COMMENTS</td>
</tr>
<tr class="even">
<td>Reported<br />
transcript sizes</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_transcript_reported_sizes&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Comments</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_transcript_comment&#39; AND f.uniquename = &#39;FBgn0000038&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">EXTERNAL DATA</td>
</tr>
<tr class="odd">
<td>MIR</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;MIR&#39; AND f.uniquename = &#39;FBgn0064191&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Rfam</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;Rfam&#39; AND f.uniquename = &#39;FBgn0000810&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">POLYPEPTIDE DATA</td>
</tr>
<tr class="even">
<td colspan="2">ANNOTATED POLYPEPTIDES</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, t.uniquename, t.name, p.uniquename, p.name, p.seqlen, fmin, fmax, strand, a.uniquename, cvt5.name, fp.VALUE
  FROM feature g, feature_relationship fr, cvterm cvt, feature t, cvterm cvt2,
     feature p, feature_relationship fr2, cvterm cvt3, cvterm cvt4, featureloc fl,
     feature a, featureprop fp, cvterm cvt5
  WHERE g.feature_id = fr.object_id AND fr.subject_id = t.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;partof&#39; AND
    t.type_id = cvt2.cvterm_id AND cvt2.name IN (&#39;mRNA&#39;, &#39;snoRNA&#39;,
       &#39;ncRNA&#39;, &#39;snRNA&#39;,
       &#39;tRNA&#39;, &#39;rRNA&#39;,
       &#39;miRNA&#39;, &#39;pseudogene&#39;) AND
    t.feature_id = fr2.object_id AND fr2.subject_id = p.feature_id AND
    fr2.type_id = cvt3.cvterm_id AND cvt3.name = &#39;producedby&#39; AND
    p.type_id = cvt4.cvterm_id AND cvt4.name = &#39;protein&#39; AND
    p.seqlen IS NOT NULL AND
    p.feature_id = fl.feature_id AND fl.srcfeature_id = a.feature_id AND
    p.feature_id = fp.feature_id AND fp.type_id = cvt5.cvterm_id AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Predicted MW (kD)</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Length (aa)</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Theoretical pI</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Genbank protein</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, t.uniquename, t.name, p.uniquename, p.name, p.seqlen, fmin, fmax, strand, a.uniquename, d.accession
  FROM feature g, feature_relationship fr, cvterm cvt, feature t, cvterm cvt2,
     feature p, feature_relationship fr2, cvterm cvt3, cvterm cvt4, featureloc fl,
     feature a, feature_dbxref fd, dbxref d, db
  WHERE g.feature_id = fr.object_id AND fr.subject_id = t.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;partof&#39; AND
    t.type_id = cvt2.cvterm_id AND cvt2.name IN (&#39;mRNA&#39;, &#39;snoRNA&#39;,
       &#39;ncRNA&#39;, &#39;snRNA&#39;,
       &#39;tRNA&#39;, &#39;rRNA&#39;,
       &#39;miRNA&#39;, &#39;pseudogene&#39;) AND
    t.feature_id = fr2.object_id AND fr2.subject_id = p.feature_id AND
    fr2.type_id = cvt3.cvterm_id AND cvt3.name = &#39;producedby&#39; AND
    p.type_id = cvt4.cvterm_id AND cvt4.name = &#39;protein&#39; AND
    p.seqlen IS NOT NULL AND
    p.feature_id = fl.feature_id AND fl.srcfeature_id = a.feature_id AND
    p.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    d.db_id = db.db_id AND db.name = &#39;GB_protein&#39; AND
    g.uniquename = &#39;FBgn0051371&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">ADDITIONAL POLYPEPTIDE DATA AND COMMENTS</td>
</tr>
<tr class="even">
<td>Reported<br />
protein sizes</td>
<td>See first polypeptide query above</td>
</tr>
<tr class="odd">
<td>Comments</td>
<td>See first polypeptide query above</td>
</tr>
<tr class="even">
<td colspan="2">EXTERNAL DATA</td>
</tr>
<tr class="odd">
<td>GCR</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;GCR&#39; AND f.uniquename = &#39;FBgn0004168&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>InterPro domains</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;INTERPRO&#39; AND f.uniquename = &#39;FBgn0015570&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>MEROPS</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;MEROPS&#39; AND f.uniquename = &#39;FBgn0004648&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>MITODROME</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;MITODROME&#39; AND f.uniquename = &#39;FBgn0027085&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>NRL_3D</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;NRL_3D&#39; AND f.uniquename = &#39;FBgn0003470&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>PANTHER (LinkOut)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;panther&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>PDB</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;PDB&#39; AND f.uniquename = &#39;FBgn0003659&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>TransFac</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;TF&#39; AND f.uniquename = &#39;FBgn0000014&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">EXPRESSION DATA</td>
</tr>
<tr class="even">
<td>BDGP in situ (LinkOut)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;bdgpinsituexpr&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Yale Dev. Expression (LinkOut)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;kwexpression&#39; AND f.uniquename = &#39;FBgn0000014&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">RELATED COMMENTS</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;molecular_info&#39; AND f.uniquename = &#39;FBgn0000014&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">ALLELES</td>
</tr>
<tr class="odd">
<td colspan="2">CLASSICAL ALLELES</td>
</tr>
<tr class="even">
<td>Allele of (gene name)</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name
  FROM feature g, feature_relationship fr, feature a, cvterm cvt
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    NOT EXISTS (SELECT *
  FROM feature_relationship fr2, feature t, cvterm cvt2, cvterm cvt3
  WHERE fr2.subject_id = a.feature_id AND fr2.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;associated_with&#39; AND fr2.object_id = t.feature_id AND
    t.type_id = cvt3.cvterm_id AND cvt3.name = &#39;transgenic_transposon&#39;) AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Class</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, featureprop fp,
     cvterm cvt3
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    NOT EXISTS (SELECT *
  FROM feature_relationship fr2, feature t, cvterm cvt2, cvterm cvt3
  WHERE fr2.subject_id = a.feature_id AND fr2.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;associated_with&#39; AND fr2.object_id = t.feature_id AND
    t.type_id = cvt3.cvterm_id AND cvt3.name = &#39;transgenic_transposon&#39;) AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt3.cvterm_id AND
    cvt3.name = &#39;promoted_allele_class&#39; AND g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Mutagen</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name, cvt4.name
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, cvterm cvt4,
     cvtermprop cvtp, feature_cvterm fcv
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    NOT EXISTS (SELECT *
  FROM feature_relationship fr2, feature t, cvterm cvt2, cvterm cvt3
  WHERE fr2.subject_id = a.feature_id AND fr2.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;associated_with&#39; AND fr2.object_id = t.feature_id AND
    t.type_id = cvt3.cvterm_id AND cvt3.name = &#39;transgenic_transposon&#39;) AND
    a.feature_id = fcv.feature_id AND fcv.cvterm_id = cvt4.cvterm_id AND
    cvt4.cvterm_id = cvtp.cvterm_id AND cvtp.VALUE = &#39;origin_of_mutation&#39; AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Stocks</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name, cvt3.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, featureprop fp,
     cvterm cvt3
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    NOT EXISTS (SELECT *
  FROM feature_relationship fr2, feature t, cvterm cvt2, cvterm cvt3
  WHERE fr2.subject_id = a.feature_id AND fr2.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;associated_with&#39; AND fr2.object_id = t.feature_id AND
    t.type_id = cvt3.cvterm_id AND cvt3.name = &#39;transgenic_transposon&#39;) AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt3.cvterm_id AND
    cvt3.name LIKE &#39;derived_stock_%&#39; AND g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Known lesion</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name, cvt3.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, featureprop fp,
     cvterm cvt3
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    NOT EXISTS (SELECT *
  FROM feature_relationship fr2, feature t, cvterm cvt2, cvterm cvt3
  WHERE fr2.subject_id = a.feature_id AND fr2.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;associated_with&#39; AND fr2.object_id = t.feature_id AND
    t.type_id = cvt3.cvterm_id AND cvt3.name = &#39;transgenic_transposon&#39;) AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt3.cvterm_id AND
    cvt3.name IN (&#39;molecular_info&#39;,&#39;aminoacid_rep&#39;,
      &#39;nucleotide_rep&#39;) AND g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">ALLELES CARRIED ON TRANSGENIC CONSTRUCTS</td>
</tr>
<tr class="even">
<td>Allele of (gene name)</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name
  FROM feature g, feature_relationship fr, feature a, cvterm cvt
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    EXISTS (SELECT *
  FROM feature_relationship fr2, feature t, cvterm cvt2, cvterm cvt3
  WHERE fr2.subject_id = a.feature_id AND fr2.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;associated_with&#39; AND fr2.object_id = t.feature_id AND
    t.type_id = cvt3.cvterm_id AND cvt3.name = &#39;transgenic_transposon&#39;) AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Class</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, featureprop fp,
     cvterm cvt3
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    EXISTS (SELECT *
  FROM feature_relationship fr2, feature t, cvterm cvt2, cvterm cvt3
  WHERE fr2.subject_id = a.feature_id AND fr2.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;associated_with&#39; AND fr2.object_id = t.feature_id AND
    t.type_id = cvt3.cvterm_id AND cvt3.name = &#39;transgenic_transposon&#39;) AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt3.cvterm_id AND
    cvt3.name = &#39;promoted_allele_class&#39; AND g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Mutagen</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name, cvt4.name
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, cvterm cvt4,
     cvtermprop cvtp, feature_cvterm fcv
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    EXISTS (SELECT *
  FROM feature_relationship fr2, feature t, cvterm cvt2, cvterm cvt3
  WHERE fr2.subject_id = a.feature_id AND fr2.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;associated_with&#39; AND fr2.object_id = t.feature_id AND
    t.type_id = cvt3.cvterm_id AND cvt3.name = &#39;transgenic_transposon&#39;) AND
    a.feature_id = fcv.feature_id AND fcv.cvterm_id = cvt4.cvterm_id AND
    cvt4.cvterm_id = cvtp.cvterm_id AND cvtp.VALUE = &#39;origin_of_mutation&#39; AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Stocks</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name, cvt3.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, featureprop fp,
     cvterm cvt3
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    EXISTS (SELECT *
  FROM feature_relationship fr2, feature t, cvterm cvt2, cvterm cvt3
  WHERE fr2.subject_id = a.feature_id AND fr2.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;associated_with&#39; AND fr2.object_id = t.feature_id AND
    t.type_id = cvt3.cvterm_id AND cvt3.name = &#39;transgenic_transposon&#39;) AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt3.cvterm_id AND
    cvt3.name LIKE &#39;derived_stock_%&#39; AND g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Known lesion</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name, cvt3.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, featureprop fp,
     cvterm cvt3
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    EXISTS (SELECT *
  FROM feature_relationship fr2, feature t, cvterm cvt2, cvterm cvt3
  WHERE fr2.subject_id = a.feature_id AND fr2.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;associated_with&#39; AND fr2.object_id = t.feature_id AND
    t.type_id = cvt3.cvterm_id AND cvt3.name = &#39;transgenic_transposon&#39;) AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt3.cvterm_id AND
    cvt3.name IN (&#39;molecular_info&#39;,&#39;aminoacid_rep&#39;,
      &#39;nucleotide_rep&#39;) AND g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">SUMMARY OF ALLELE PHENOTYPES</td>
</tr>
<tr class="even">
<td>Lethality</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name, cvt4.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, cvterm cvt4,
     featureprop fp
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt4.cvterm_id AND
    cvt4.name = &#39;derived_pheno_class&#39;AND fp.VALUE LIKE &#39;%lethal%&#39; AND g.uniquename = &#39;FBgn0000011&#39; UNION
SELECT g.uniquename, g.name, a.uniquename, a.name, cvt4.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, cvterm cvt4,
     featureprop fp
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt4.cvterm_id AND
    cvt4.name = &#39;derived_pheno_class&#39; AND fp.VALUE LIKE &#39;%viable%&#39; AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Allele</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Sterility</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name, cvt4.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, cvterm cvt4,
     featureprop fp
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt4.cvterm_id AND
    cvt4.name = &#39;derived_pheno_class&#39;AND fp.VALUE LIKE &#39;%fertile%&#39; AND g.uniquename = &#39;FBgn0000011&#39; UNION
SELECT g.uniquename, g.name, a.uniquename, a.name, cvt4.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, cvterm cvt4,
     featureprop fp
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt4.cvterm_id AND
    cvt4.name = &#39;derived_pheno_class&#39; AND fp.VALUE LIKE &#39;%sterile%&#39; AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Allele</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Other Phenotypes</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name, cvt4.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, cvterm cvt4,
     featureprop fp
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt4.cvterm_id AND
    cvt4.name = &#39;derived_pheno_class&#39;AND fp.VALUE NOT LIKE &#39;%lethal%&#39; AND
    g.uniquename = &#39;FBgn0000011&#39; INTERSECT
SELECT g.uniquename, g.name, a.uniquename, a.name, cvt4.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, cvterm cvt4,
     featureprop fp
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt4.cvterm_id AND
    cvt4.name = &#39;derived_pheno_class&#39; AND fp.VALUE NOT
    LIKE &#39;%viable%&#39; AND g.uniquename = &#39;FBgn0000011&#39; INTERSECT
SELECT g.uniquename, g.name, a.uniquename, a.name, cvt4.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, cvterm cvt4,
     featureprop fp
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt4.cvterm_id AND
    cvt4.name = &#39;derived_pheno_class&#39;AND fp.VALUE NOT LIKE &#39;%fertile%&#39; AND
    g.uniquename = &#39;FBgn0000011&#39; INTERSECT
SELECT g.uniquename, g.name, a.uniquename, a.name, cvt4.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, cvterm cvt4,
     featureprop fp
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt4.cvterm_id AND
    cvt4.name = &#39;derived_pheno_class&#39; AND fp.VALUE NOT
    LIKE &#39;%sterile%&#39; AND g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Allele</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Phenotype manifest in</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, a.uniquename, a.name, cvt4.name, fp.VALUE
  FROM feature g, feature_relationship fr, feature a, cvterm cvt, cvterm cvt4,
     featureprop fp
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    a.feature_id = fp.feature_id AND fp.type_id = cvt4.cvterm_id AND
    cvt4.name = &#39;derived_pheno_manifest&#39; AND g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Allele</td>
<td>See above</td>
</tr>
<tr class="even">
<td colspan="2">ANEUPLOID ABERRATIONS</td>
</tr>
<tr class="odd">
<td>(Useful Duplication)</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, cvt.name, a.uniquename, a.name
  FROM feature g, feature_relationship fr, cvterm cvt, feature a
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name IN (&#39;useful_Dp_direct&#39;, &#39;useful_Dp_from_cyto&#39;) AND
    g.uniquename = &#39;FBgn0000022&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>(Useful Deficiency)</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>(Disrupted in)</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, cvt.name, a.uniquename, a.name
  FROM feature g, feature_relationship fr, cvterm cvt, feature a
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name IN (&#39;deletes&#39;, &#39;molec_deletes&#39;) AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>(Partially disrupted in)</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, cvt.name, a.uniquename, a.name
  FROM feature g, feature_relationship fr, cvterm cvt, feature a
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name IN (&#39;part_deletes&#39;, &#39;molec_partdeletes&#39;) AND
    g.uniquename = &#39;FBgn0000014&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>(Not Disrupted in)</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, cvt.name, a.uniquename, a.name
  FROM feature g, feature_relationship fr, cvterm cvt, feature a
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name IN (&#39;nondeletes&#39;, &#39;molec_nondeletes&#39;) AND
    g.uniquename = &#39;FBgn0000014&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>(Duplicated in)</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, cvt.name, a.uniquename, a.name
  FROM feature g, feature_relationship fr, cvterm cvt, feature a
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name IN (&#39;duplicates&#39;, &#39;molec_dups&#39;) AND
    g.uniquename = &#39;FBgn0000014&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>(Partially duplicated in)</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, cvt.name, a.uniquename, a.name
  FROM feature g, feature_relationship fr, cvterm cvt, feature a
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name IN (&#39;part_duplicates&#39;, &#39;molec_partdups&#39;) AND
    g.uniquename = &#39;FBgn0000014&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>(Not duplicated in)</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, cvt.name, a.uniquename, a.name
  FROM feature g, feature_relationship fr, cvterm cvt, feature a
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name IN (&#39;nonduplicates&#39;, &#39;molec_nondups&#39;) AND
    g.uniquename = &#39;FBgn0000022&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">TRANSGENIC CONSTRUCTS AND INSERTIONS</td>
</tr>
<tr class="even">
<td colspan="2">Transgenic constructs</td>
</tr>
<tr class="odd">
<td>Type of construct</td>
<td></td>
</tr>
<tr class="even">
<td>heat-shock construct</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, t.uniquename, t.name, frtp.name, frp.VALUE
  FROM feature g, feature t, cvterm frtp, cvterm gtp, cvterm ttp,
     cvterm frpt, feature_relationship fr LEFT OUTER JOIN feature_relationshipprop frp ON (fr.feature_relationship_id = frp.feature_relationship_id)
  WHERE subject_id = g.feature_id AND g.type_id = gtp.cvterm_id AND
    gtp.name = &#39;gene&#39; AND g.is_analysis = &#39;f&#39; AND
    g.is_obsolete = &#39;f&#39; AND fr.type_id = frtp.cvterm_id AND
    frtp.name = &#39;derived_assoc_heat_shock_construct&#39; AND object_id = t.feature_id AND
    t.type_id = ttp.cvterm_id AND ttp.name = &#39;transgenic_transposon&#39; AND
    t.is_analysis = &#39;f&#39; AND t.is_obsolete = &#39;f&#39; AND
    frp.type_id = frpt.cvterm_id AND frpt.name = &#39;has_expression_data&#39; AND
    g.uniquename = &#39;FBgn0000015&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>UAS construct</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, t.uniquename, t.name, frtp.name, frp.VALUE
  FROM feature g, feature t, cvterm frtp, cvterm gtp, cvterm ttp,
     cvterm frpt, feature_relationship fr LEFT OUTER JOIN feature_relationshipprop frp ON (fr.feature_relationship_id = frp.feature_relationship_id)
  WHERE subject_id = g.feature_id AND g.type_id = gtp.cvterm_id AND
    gtp.name = &#39;gene&#39; AND g.is_analysis = &#39;f&#39; AND
    g.is_obsolete = &#39;f&#39; AND fr.type_id = frtp.cvterm_id AND
    frtp.name = &#39;derived_assoc_UAS_construct&#39; AND object_id = t.feature_id AND
    t.type_id = ttp.cvterm_id AND ttp.name = &#39;transgenic_transposon&#39; AND
    t.is_analysis = &#39;f&#39; AND t.is_obsolete = &#39;f&#39; AND
    frp.type_id = frpt.cvterm_id AND frpt.name = &#39;has_expression_data&#39; AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>characterization construct</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, t.uniquename, t.name, frtp.name, frp.VALUE
  FROM feature g, feature t, cvterm frtp, cvterm gtp, cvterm ttp,
     cvterm frpt, feature_relationship fr LEFT OUTER JOIN feature_relationshipprop frp ON (fr.feature_relationship_id = frp.feature_relationship_id)
  WHERE subject_id = g.feature_id AND g.type_id = gtp.cvterm_id AND
    gtp.name = &#39;gene&#39; AND g.is_analysis = &#39;f&#39; AND
    g.is_obsolete = &#39;f&#39; AND fr.type_id = frtp.cvterm_id AND
    frtp.name = &#39;derived_assoc_characterization_construct&#39; AND object_id = t.feature_id AND
    t.type_id = ttp.cvterm_id AND ttp.name = &#39;transgenic_transposon&#39; AND
    t.is_analysis = &#39;f&#39; AND t.is_obsolete = &#39;f&#39; AND
    frp.type_id = frpt.cvterm_id AND frpt.name = &#39;has_expression_data&#39; AND
    g.uniquename = &#39;FBgn0000009&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>vital-reporter construct</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, t.uniquename, t.name, frtp.name, frp.VALUE
  FROM feature g, feature t, cvterm frtp, cvterm gtp, cvterm ttp,
     cvterm frpt, feature_relationship fr LEFT OUTER JOIN feature_relationshipprop frp ON (fr.feature_relationship_id = frp.feature_relationship_id)
  WHERE subject_id = g.feature_id AND g.type_id = gtp.cvterm_id AND
    gtp.name = &#39;gene&#39; AND g.is_analysis = &#39;f&#39; AND
    g.is_obsolete = &#39;f&#39; AND fr.type_id = frtp.cvterm_id AND
    frtp.name = &#39;derived_assoc_vital_reporter_construct&#39; AND object_id = t.feature_id AND
    t.type_id = ttp.cvterm_id AND ttp.name = &#39;transgenic_transposon&#39; AND
    t.is_analysis = &#39;f&#39; AND t.is_obsolete = &#39;f&#39; AND
    frp.type_id = frpt.cvterm_id AND frpt.name = &#39;has_expression_data&#39; AND
    g.uniquename = &#39;FBgn0000042&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>reporter construct</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, t.uniquename, t.name, frtp.name, frp.VALUE
  FROM feature g, feature t, cvterm frtp, cvterm gtp, cvterm ttp,
     cvterm frpt, feature_relationship fr LEFT OUTER JOIN feature_relationshipprop frp ON (fr.feature_relationship_id = frp.feature_relationship_id)
  WHERE subject_id = g.feature_id AND g.type_id = gtp.cvterm_id AND
    gtp.name = &#39;gene&#39; AND g.is_analysis = &#39;f&#39; AND
    g.is_obsolete = &#39;f&#39; AND fr.type_id = frtp.cvterm_id AND
    frtp.name = &#39;derived_assoc_reporter_construct&#39; AND object_id = t.feature_id AND
    t.type_id = ttp.cvterm_id AND ttp.name = &#39;transgenic_transposon&#39; AND
    t.is_analysis = &#39;f&#39; AND t.is_obsolete = &#39;f&#39; AND
    frp.type_id = frpt.cvterm_id AND frpt.name = &#39;has_expression_data&#39; AND
    g.uniquename = &#39;FBgn0000014&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Insertions</td>
</tr>
<tr class="even">
<td>insertion of mobile activating element</td>
<td>

<pre class="de1"><code>SELECT stp.name, s.uniquename, s.name, frtp.name, otp.name, o.uniquename, o.name, frcvt.name, frp.VALUE
  FROM feature s, feature o, cvterm frtp, cvterm otp, cvterm stp,
     cvterm frcvt, feature_relationship fr LEFT OUTER JOIN feature_relationshipprop frp ON (fr.feature_relationship_id = frp.feature_relationship_id)
  WHERE s.feature_id = subject_id AND object_id = o.feature_id AND
    fr.type_id = frtp.cvterm_id AND frtp.name = &#39;derived_assoc_insertion_of_mobile_activating_element&#39; AND
    o.type_id = otp.cvterm_id AND stp.name = &#39;gene&#39; AND
    s.type_id = stp.cvterm_id AND otp.name = &#39;transposable_element_insertion_site&#39; AND
    s.is_obsolete = &#39;f&#39; AND s.is_analysis = &#39;f&#39; AND
    o.is_obsolete = &#39;f&#39; AND o.is_analysis = &#39;f&#39; AND
    frp.type_id = frcvt.cvterm_id AND frcvt.name = &#39;has_expression_data&#39; AND
    s.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>insertion_of_enhancer_trap</td>
<td>

<pre class="de1"><code>SELECT stp.name, s.uniquename, s.name, frtp.name, otp.name, o.uniquename, o.name, frcvt.name, frp.VALUE
  FROM feature s, feature o, cvterm frtp, cvterm otp, cvterm stp,
     cvterm frcvt, feature_relationship fr LEFT OUTER JOIN feature_relationshipprop frp ON (fr.feature_relationship_id = frp.feature_relationship_id)
  WHERE s.feature_id = subject_id AND object_id = o.feature_id AND
    fr.type_id = frtp.cvterm_id AND frtp.name = &#39;derived_assoc_insertion_of_enhancer_trap&#39; AND
    o.type_id = otp.cvterm_id AND stp.name = &#39;gene&#39; AND
    s.type_id = stp.cvterm_id AND otp.name = &#39;transposable_element_insertion_site&#39; AND
    s.is_obsolete = &#39;f&#39; AND s.is_analysis = &#39;f&#39; AND
    o.is_obsolete = &#39;f&#39; AND o.is_analysis = &#39;f&#39; AND
    frp.type_id = frcvt.cvterm_id AND frcvt.name = &#39;has_expression_data&#39; AND
    s.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>insertion_of_enhancer_trap_binary_system</td>
<td>

<pre class="de1"><code>SELECT stp.name, s.uniquename, s.name, frtp.name, otp.name, o.uniquename, o.name, frcvt.name, frp.VALUE
  FROM feature s, feature o, cvterm frtp, cvterm otp, cvterm stp,
     cvterm frcvt, feature_relationship fr LEFT OUTER JOIN feature_relationshipprop frp ON (fr.feature_relationship_id = frp.feature_relationship_id)
  WHERE s.feature_id = subject_id AND object_id = o.feature_id AND
    fr.type_id = frtp.cvterm_id AND frtp.name = &#39;derived_assoc_insertion_of_enhancer_trap_binary_system&#39; AND
    o.type_id = otp.cvterm_id AND stp.name = &#39;gene&#39; AND
    s.type_id = stp.cvterm_id AND otp.name = &#39;transposable_element_insertion_site&#39; AND
    s.is_obsolete = &#39;f&#39; AND s.is_analysis = &#39;f&#39; AND
    o.is_obsolete = &#39;f&#39; AND o.is_analysis = &#39;f&#39; AND
    frp.type_id = frcvt.cvterm_id AND frcvt.name = &#39;has_expression_data&#39; AND
    s.uniquename = &#39;FBgn0000157&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>miscellaneous insertions</td>
<td>

<pre class="de1"><code>SELECT stp.name, s.uniquename, s.name, frtp.name, otp.name, o.uniquename, o.name, frcvt.name, frp.VALUE
  FROM feature s, feature o, cvterm frtp, cvterm otp, cvterm stp,
     cvterm frcvt, feature_relationship fr LEFT OUTER JOIN feature_relationshipprop frp ON (fr.feature_relationship_id = frp.feature_relationship_id)
  WHERE s.feature_id = subject_id AND object_id = o.feature_id AND
    fr.type_id = frtp.cvterm_id AND frtp.name = &#39;derived_assoc_misc_insertion&#39; AND
    o.type_id = otp.cvterm_id AND stp.name = &#39;gene&#39; AND
    s.type_id = stp.cvterm_id AND otp.name = &#39;transposable_element_insertion_site&#39; AND
    s.is_obsolete = &#39;f&#39; AND s.is_analysis = &#39;f&#39; AND
    o.is_obsolete = &#39;f&#39; AND o.is_analysis = &#39;f&#39; AND
    frp.type_id = frcvt.cvterm_id AND frcvt.name = &#39;has_expression_data&#39; AND
    s.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">RELATED COMMENTS</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;gene_phenotypes&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">SEQUENCE ONTOLOGY: Class of gene</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cv.name | accession AS SO_accession, cvt.name, p.uniquename
  FROM feature f, feature_cvterm fc, cvterm cvt, cv, dbxref d,
     db, pub p, cvterm gft
  WHERE f.feature_id = fc.feature_id AND fc.cvterm_id = cvt.cvterm_id AND
    cvt.cv_id = cv.cv_id AND cv.name = &#39;SO&#39; AND
    cvt.dbxref_id = d.dbxref_id AND d.db_id = db.db_id AND
    fc.pub_id = p.pub_id AND f.type_id = gft.cvterm_id AND
    gft.name = &#39;gene&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">GENE ONTOLOGY: Function, Process, and Cellular
Component</td>
</tr>
<tr class="odd">
<td colspan="2">MOLECULAR FUNCTION</td>
</tr>
<tr class="even">
<td colspan="2">Terms based on experimental evidence</td>
</tr>
<tr class="odd">
<td>CV term<br />
(Includes qualifier)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, fcpt.name, fcp.VALUE, p.uniquename
  FROM feature f, feature_cvterm fc, cvterm cvt, cv, cvterm fcpt,
     pub p, feature_cvtermprop fcp
  WHERE f.feature_id = fc.feature_id AND fc.cvterm_id = cvt.cvterm_id AND
    fc.pub_id = p.pub_id AND fc.feature_cvterm_id = fcp.feature_cvterm_id AND
    cvt.cv_id = cv.cv_id AND fcp.type_id = fcpt.cvterm_id AND
    cv.name = &#39;molecular_function&#39; AND fcpt.name = &#39;evidence_code&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Evidence code<br />
(Includes identifier)</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Reference</td>
<td>See above</td>
</tr>
<tr class="even">
<td colspan="2">Terms based on predictions</td>
</tr>
<tr class="odd">
<td>CV term<br />
(Includes qualifier)</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Evidence code<br />
(Includes identifier)</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Reference</td>
<td>See above</td>
</tr>
<tr class="even">
<td colspan="2">BIOLOGICAL PROCESS</td>
</tr>
<tr class="odd">
<td colspan="2">Terms based on experimental evidence</td>
</tr>
<tr class="even">
<td>CV term<br />
(Includes qualifier)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, cvt2.name, fcp.VALUE, p.uniquename
  FROM feature f, feature_cvterm fc, cvterm cvt, cv, pub p,
     feature_cvtermprop fcp, cvterm cvt2
  WHERE f.feature_id = fc.feature_id AND fc.cvterm_id = cvt.cvterm_id AND
    fc.pub_id = p.pub_id AND fc.feature_cvterm_id = fcp.feature_cvterm_id AND
    fcp.type_id = cvt2.cvterm_id AND cvt2.name = &#39;evidence_code&#39; AND
    cvt.cv_id = cv.cv_id AND cv.name = &#39;biological_process&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Evidence code<br />
(Includes identifier)</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Reference</td>
<td>See above</td>
</tr>
<tr class="odd">
<td colspan="2">Terms based on predictions</td>
</tr>
<tr class="even">
<td>CV term<br />
(Includes qualifier)</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Evidence code<br />
(Includes identifier)</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Reference</td>
<td>See above</td>
</tr>
<tr class="odd">
<td colspan="2">CELLULAR COMPONENT</td>
</tr>
<tr class="even">
<td colspan="2">Terms based on experimental evidence</td>
</tr>
<tr class="odd">
<td>CV term<br />
(Includes qualifier)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, cvt2.name, fcp.VALUE, p.uniquename
  FROM feature f, feature_cvterm fc, cvterm cvt, cv, pub p,
     feature_cvtermprop fcp, cvterm cvt2
  WHERE f.feature_id = fc.feature_id AND fc.cvterm_id = cvt.cvterm_id AND
    fc.pub_id = p.pub_id AND fc.feature_cvterm_id = fcp.feature_cvterm_id AND
    fcp.type_id = cvt2.cvterm_id AND cvt2.name = &#39;evidence_code&#39; AND
    cvt.cv_id = cv.cv_id AND cv.name = &#39;cellular_component&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Evidence code<br />
(Includes identifier)</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Reference</td>
<td>See above</td>
</tr>
<tr class="even">
<td colspan="2">Terms based on predictions</td>
</tr>
<tr class="odd">
<td>CV term<br />
(Includes qualifier)</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Evidence code<br />
(Includes identifier)</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Reference</td>
<td>See above</td>
</tr>
<tr class="even">
<td colspan="2">RELATED COMMENTS</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;wild_type_role&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">INTERACTIONS AND PATHWAYS</td>
</tr>
<tr class="odd">
<td colspan="2">SUMMARY OF GENETIC INTERACTIONS</td>
</tr>
<tr class="even">
<td>Interacting Gene</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, cvt.name, a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature g, cvterm cvt, feature a, feature_relationship_pub frpb, pub p,
     feature_relationship fr LEFT OUTER JOIN feature_relationshipprop frp ON (fr.feature_relationship_id = frp.feature_relationship_id)
  WHERE g.feature_id = subject_id AND object_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;interacts_genetically&#39; AND
    fr.feature_relationship_id = frpb.feature_relationship_id AND frpb.pub_id = p.pub_id AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Allele of this gene</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Reference</td>
<td>See above</td>
</tr>
<tr class="odd">
<td colspan="2">EXTERNAL DATA</td>
</tr>
<tr class="even">
<td>BioGRID (LinkOut)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;flygrid&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Dros. PIMRider (LinkOut)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;hybrigenics&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">ORTHOLOGS</td>
</tr>
<tr class="odd">
<td>Genome-wide drosophilid orthologs</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, o.uniquename, o.name
  FROM feature f, feature_relationship fr, cvterm cvt, feature o
  WHERE f.feature_id = object_id AND subject_id = o.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;putative_ortholog_of&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Curated drosophilid orthologs</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, o.uniquename, o.name, p.uniquename
  FROM feature f, feature_relationship fr, cvterm cvt, feature o, feature_relationship_pub frp,
     pub p
  WHERE f.feature_id = object_id AND subject_id = o.feature_id AND
    fr.feature_relationship_id = frp.feature_relationship_id AND frp.pub_id = p.pub_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;homologue&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>InParanoid orthologs (LinkOut)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;orthologs&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">FUNCTIONAL COMPLEMENTATION BETWEEN SPECIES</td>
</tr>
<tr class="odd">
<td>Functionally complements</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, o.uniquename, o.name, p.uniquename
  FROM feature f, feature_relationship fr, cvterm cvt, feature o, feature_relationship_pub frp,
     pub p
  WHERE f.feature_id = subject_id AND object_id = o.feature_id AND
    fr.feature_relationship_id = frp.feature_relationship_id AND frp.pub_id = p.pub_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name IN (&#39;fnally_comps&#39;, &#39;fnaly_noncomps&#39;,
       &#39;fnally_partcomps&#39;) AND
    f.uniquename = &#39;FBgn0010602&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Partially functionally complements</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Does NOT functionally complement</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Functionally complemented by</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, o.uniquename, o.name, p.uniquename
  FROM feature f, feature_relationship fr, cvterm cvt, feature o, feature_relationship_pub frp,
     pub p
  WHERE f.feature_id = object_id AND subject_id = o.feature_id AND
    fr.feature_relationship_id = frp.feature_relationship_id AND frp.pub_id = p.pub_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name IN (&#39;fnally_comps&#39;, &#39;fnaly_noncomps&#39;,
       &#39;fnally_partcomps&#39;) AND
    f.uniquename = &#39;FBgn0000099&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Partially functionally complemented by</td>
<td>See above</td>
</tr>
<tr class="even">
<td>NOT functionally complemented by</td>
<td>See above</td>
</tr>
<tr class="odd">
<td colspan="2">INTER-SPECIES MISEXPRESSION DATA</td>
</tr>
<tr class="even">
<td>Produces phenotype in</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;gain_of_fn_species&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND fp.VALUE LIKE &#39;Gain of function effect%&#39; AND
    f.uniquename = &#39;FBgn0000490&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Produces NO phenotype in</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;gain_of_fn_species&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND fp.VALUE LIKE &#39;No gain of function effect%&#39; AND
    f.uniquename = &#39;FBgn0013263&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">STOCKS AND REAGENTS</td>
</tr>
<tr class="odd">
<td colspan="2">STOCKS LISTED IN FLYBASE</td>
</tr>
<tr class="even">
<td>Bloomington</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name LIKE &#39;derived_stock_%&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Kyoto</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Szeged</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Tucson</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Carpenter</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Garcia-Bellido</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Harvard</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Nusslein-Volhard</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Saxton</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Notes on availability</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;availability&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND f.uniquename = &#39;FBgn0003200&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">GENOMIC CLONES</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, o.uniquename, o.name
  FROM feature f, feature_relationship fr, cvterm cvt, feature o
  WHERE f.feature_id = object_id AND subject_id = o.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;derived_assoc_BAC&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">cDNA CLONES</td>
</tr>
<tr class="odd">
<td colspan="2">cDNA clones, fully sequenced</td>
</tr>
<tr class="even">
<td>BDGP DGC clones</td>
<td></td>
</tr>
<tr class="odd">
<td>Other clones</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">cDNA clones, end sequenced (ESTs)</td>
</tr>
<tr class="odd">
<td>BDGP DGC clones</td>
<td></td>
</tr>
<tr class="even">
<td>Other clones</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">RNAi &amp; ARRAY INFORMATION</td>
</tr>
<tr class="even">
<td>Affy Oligo</td>
<td></td>
</tr>
<tr class="odd">
<td>NCBI GEO (LinkOut)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;geo&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Heidelberg RNAi (LinkOut)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;hdri&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>DRSC (LinkOut)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;drsc&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">ANTIBODY INFORMATION</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;reported_antibod_gen&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">OTHER INFORMATION</td>
</tr>
<tr class="odd">
<td colspan="2">DISCOVERER</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;discoverer&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">ETYMOLOGY</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;etymology&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND f.uniquename = &#39;FBgn0000953&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">IDENTIFICATION</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;identified_by&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND f.uniquename = &#39;FBgn0011737&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">POSITION EFFECT VARIEGATION DATA</td>
</tr>
<tr class="even">
<td>No PEV in</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, o.uniquename, o.name, p.uniquename
  FROM feature f, feature_relationship fr, cvterm cvt, feature o, feature_relationship_pub frp,
     pub p
  WHERE f.feature_id = subject_id AND object_id = o.feature_id AND
    fr.feature_relationship_id = frp.feature_relationship_id AND frp.pub_id = p.pub_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name IN (&#39;dom_position_effect&#39;, &#39;no_position_effect&#39;,
      &#39;rec_position_effect&#39;) AND
    f.uniquename = &#39;FBgn0000012&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Dominant PEV in</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Recessive PEV in</td>
<td>See above</td>
</tr>
<tr class="odd">
<td colspan="2">RELATIONSHIP TO OTHER GENES</td>
</tr>
<tr class="even">
<td>Source for database identity of</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;identity_source&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Source for database merge of</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;merge_source&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND f.uniquename = &#39;FBgn0000008&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>(Member gene of)</td>
<td>

<pre class="de1"><code>SELECT o.uniquename, o.name, cvt.name, f.uniquename, f.name, p.uniquename
  FROM feature f, feature_relationship fr, cvterm cvt, feature o, feature_relationship_pub frp,
     pub p
  WHERE f.feature_id = object_id AND subject_id = o.feature_id AND
    fr.feature_relationship_id = frp.feature_relationship_id AND frp.pub_id = p.pub_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;member_gene_of&#39; AND
    o.uniquename = &#39;FBgn0053354&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>(Component gene(s))</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, o.uniquename, o.name, p.uniquename
  FROM feature f, feature_relationship fr, cvterm cvt, feature o, feature_relationship_pub frp,
     pub p
  WHERE f.feature_id = object_id AND subject_id = o.feature_id AND
    fr.feature_relationship_id = frp.feature_relationship_id AND frp.pub_id = p.pub_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;member_gene_of&#39; AND
    f.uniquename = &#39;FBgn0000002&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>(Encoded by)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, o.uniquename, o.name
  FROM feature f, feature_relationship fr, cvterm cvt, feature o
  WHERE f.feature_id = subject_id AND object_id = o.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name IN (&#39;encoded_by&#39;,&#39;has_component_gene&#39;) AND
    f.uniquename = &#39;FBgn0061475&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>(Tags)</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name, o.uniquename, o.name
  FROM feature f, feature_relationship fr, cvterm cvt, feature o
  WHERE f.feature_id = subject_id AND object_id = o.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;included_in&#39; AND
    f.uniquename = &#39;FBgn0015015&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Additional Comments</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;gene_relationships&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND f.uniquename = &#39;FBgn0000042&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">OTHER COMMENTS</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE, p.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub p
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;misc&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">(FOREIGN GENE DATA)</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;foreign_seq_data&#39; AND f.uniquename = &#39;FBgn0014442&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">EXTERNAL CROSSREFERENCES &amp; LINKOUTS</td>
</tr>
<tr class="even">
<td colspan="2">Sequence Crossreferences</td>
</tr>
<tr class="odd">
<td>DNA sequence</td>
<td>

<pre class="de1"><code>SELECT p.uniquename, p.name, p.seqlen, db.name, dx.accession
  FROM feature f, feature p, feature_relationship fr, cvterm cvt, cvterm cvt2,
     feature_dbxref fd, dbxref dx, db
  WHERE f.feature_id = object_id AND subject_id = p.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;partof&#39; AND
    p.type_id = cvt2.cvterm_id AND cvt2.name IN (&#39;mRNA&#39;, &#39;snoRNA&#39;,
       &#39;ncRNA&#39;, &#39;snRNA&#39;,
      &#39;tRNA&#39;,&#39;rRNA&#39;,
      &#39;miRNA&#39;, &#39;pseudogene&#39;) AND
    p.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND db.name = &#39;REFSEQ&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Protein sequence</td>
<td>

<pre class="de1"><code>SELECT p.uniquename, p.name, p.seqlen, db.name, dx.accession
  FROM feature g, feature_relationship fr, cvterm cvt, feature t, cvterm cvt2,
     feature p, feature_relationship fr2, cvterm cvt3, cvterm cvt4, fea\ ture_dbxref fd,
     dbxref dx, db
  WHERE g.feature_id = fr.object_id AND fr.subject_id = t.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;partof&#39; AND
    t.type_id = cvt2.cvterm_id AND cvt2.name IN (&#39;mRNA&#39;, &#39;snoRNA&#39;,
       &#39;ncRNA&#39;, &#39;snRNA&#39;,
      &#39;tRNA&#39;,&#39;rRNA&#39;,
      &#39;miRNA&#39;, &#39;pseudogene&#39;) AND
    t.feature_id = fr2.object_id AND fr2.subject_id = p.feature_id AND
    fr2.type_id = cvt3.cvterm_id AND cvt3.name = &#39;producedby&#39; AND
    p.type_id = cvt4.cvterm_id AND cvt4.name = &#39;protein&#39; AND
    p.seqlen IS NOT NULL AND
    p.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND db.name = &#39;REFSEQ&#39; AND
    g.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>UniProt/Swiss-Prot</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND db.name = &#39;UniProt/Swiss-Prot&#39; AND
    f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>UniProt/TrEMBL</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND db.name = &#39;UniProt/TrEMBL&#39; AND
    f.uniquename = &#39;FBgn0000015&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Other Crossreferences</td>
</tr>
<tr class="even">
<td>EPD</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>GCR</td>
<td>See above</td>
</tr>
<tr class="even">
<td>InterPro domains</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>MEROPS</td>
<td>See above</td>
</tr>
<tr class="even">
<td>MIR</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>MITODROME</td>
<td>See above</td>
</tr>
<tr class="even">
<td>NRL_3D</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>PDB</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Rfam</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>TransFac</td>
<td>See above</td>
</tr>
<tr class="even">
<td colspan="2">LinkOuts</td>
</tr>
<tr class="odd">
<td>BioGRID</td>
<td>See above</td>
</tr>
<tr class="even">
<td>BDGP in situ</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>DEDB Exons</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Dros. PIMRider</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>DRSC</td>
<td>See above</td>
</tr>
<tr class="even">
<td>FLIGHT</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;flight&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>FlyMine</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;flight&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Heidelberg RNAi</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>InParanoid</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Interactive Fly</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, db, dbxref dx, dbxrefprop dxp,
     cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.db_id = db.db_id AND dx.dbxref_id = dxp.dbxref_id AND
    dxp.type_id = cvt.cvterm_id AND cvt.name = &#39;linkout&#39; AND
    db.name = &#39;if&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>NCBI GEO</td>
<td>See above</td>
</tr>
<tr class="even">
<td>PANTHER</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Yale Dev. Expression</td>
<td>See above</td>
</tr>
<tr class="even">
<td colspan="2">REFERENCES</td>
</tr>
<tr class="odd">
<td>Research paper</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name AS pub_type, p.uniquename AS FBrf_id, miniref AS citation
  FROM feature f, feature_pub fp, pub p, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.pub_id = p.pub_id AND
    p.type_id = cvt.cvterm_id AND f.uniquename = &#39;FBgn0000011&#39; ORDER BY cvt.name;</code></pre>

</td>
</tr>
<tr class="even">
<td> ;Supplementary material</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Review</td>
<td>See above</td>
</tr>
<tr class="even">
<td>Abstract</td>
<td>See above</td>
</tr>
<tr class="odd">
<td>Other</td>
<td>See above</td>
</tr>
</tbody>
</table>

## FlyBase Allele Report

**Example report:**
<a href="http://flybase.org/reports/FBal0000067.html"

<table class="wikitable">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">GENERAL INFORMATION</th>
<th></th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Symbol</td>
<td>

<pre class="de1"><code>SELECT DISTINCT(s.name)
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt, cvterm cvt2,
     feature_relationship fr, cvterm cvt3
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;gene&#39; AND
    f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt2.cvterm_id AND cvt2.name = &#39;symbol&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.feature_id = subject_id AND
    fr.type_id = cvt3.cvterm_id AND cvt3.name = &#39;alleleof&#39; AND
    f.uniquename = &#39;FBal0000067&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Species</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, o.genus, o.species
  FROM feature f, cvterm cvt, organism o
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;gene&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBal0000067&#39; AND
    f.organism_id = o.organism_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT DISTINCT(s.name)
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt, cvterm cvt2
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;gene&#39; AND
    f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt2.cvterm_id AND cvt2.name = &#39;fullname&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBal0000046&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT f.uniquename
  FROM feature f, cvterm cvt
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;gene&#39; AND
    f.name = &#39;ab[1];</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Feature type</td>
<td>N/A</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Created/ Updated</td>
<td>

<pre class="de1"><code>SELECT timeaccessioned, timelastmodified
  FROM feature f
  WHERE uniquename = &#39;FBal0000046&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Associated gene (<a
href="http://flybase.org/forums/viewtopic.php?f=14&amp;t=161#p292#p292"
class="external text" rel="nofollow">reported to Flybase</a> as
potentially erroneous)</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name
  FROM feature a, feature g, feature_relationship fr, cvterm cvt
  WHERE g.feature_id = object_id AND subject_id = a.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;alleleof&#39; AND
    a.uniquename = &#39;FBal0000046&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Allele class</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE
  FROM feature a, featureprop frp, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;promoted_allele_class&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Mutagen</td>
<td>

<pre class="de1"><code>SELECT f.feature_id, f.uniquename, f.name, cvt.cvterm_id, cvt.name, cvtp.type_id, cvtp.VALUE, p.uniquename
  FROM cvterm cvt, cvtermprop cvtp, feature f, feature_cvterm fcv, pub p
  WHERE f.feature_id = cv.feature_id AND fcv.cvterm_id = cvt.cvterm_id AND
    cvt.cvterm_id = cvtp.cvterm_id AND fcv.pub_id = p.pub_id AND
    cvtp.VALUE = &#39;origin_of_mutation&#39; AND f.uniquename = &#39;FBal0000049&#39; AND
    p.uniquename = &#39;unattributed&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">NATURE OF THE ALLELE</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Allele class</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_allele_class&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Mutagen</td>
<td>

<pre class="de1"><code>SELECT f.feature_id, f.uniquename, f.name, cvt.cvterm_id, cvt.name, cvtp.type_id, cvtp.VALUE, p.uniquename
  FROM cvterm cvt, cvtermprop cvtp, feature f, feature_cvterm fcv, pub p
  WHERE f.feature_id = cv.feature_id AND fcv.cvterm_id = cvt.cvterm_id AND
    cvt.cvterm_id = cvtp.cvterm_id AND fcv.pub_id = p.pub_id AND
    cvtp.VALUE = &#39;origin_of_mutation&#39; AND f.uniquename = &#39;FBal0000049&#39; AND
    p.uniquename != &#39;unattributed&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Mapped features and mutations</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Type</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Symbol &amp; Location</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Additional Notes</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>References</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Associated sequence data</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>DNA sequence</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE
  FROM feature a, featureprop frp, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_supporting_accessions&#39; AND a.uniquename LIKE &#39;FBal%&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Protein sequence</td>
<td>See above</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Name</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>UniProt/Swiss-Prot</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, fd.is_current, db.name, dbx.accession
  FROM feature g, feature_dbxref fd, dbxref dbx, db, cvterm gt
  WHERE g.type_id = gt.cvterm_id AND gt.name = &#39;gene&#39; AND
    g.uniquename LIKE &#39;FBal%&#39; AND g.is_obsolete = &#39;f&#39; AND
    g.feature_id = fd.feature_id AND fd.dbxref_id = dbx.dbxref_id AND
    dbx.db_id = db.db_id AND db.name = &#39;UniProt/Swiss-Prot&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>UniProt/TrEMBL</td>
<td>

<pre class="de1"><code>SELECT g.uniquename, g.name, fd.is_current, db.name, dbx.accession
  FROM feature g, feature_dbxref fd, dbxref dbx, db, cvterm gt
  WHERE g.type_id = gt.cvterm_id AND gt.name = &#39;gene&#39; AND
    g.uniquename LIKE &#39;FBal%&#39; AND g.is_obsolete = &#39;f&#39; AND
    g.feature_id = fd.feature_id AND fd.dbxref_id = dbx.dbxref_id AND
    dbx.db_id = db.db_id AND db.name = &#39;UniProt/TrEMBL&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Progenitor genotype</td>
<td>

<pre class="de1"><code>SELECT pr.uniquename, pr.name p.uniquename
  FROM feature f, feature_relationship fr, feature pr, cvterm cvt, feature_relationship_pub frp,
     pub p
  WHERE f.feature_id = fr.object_id AND fr.subject_id = pr.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;progenitor&#39; AND
    fr.feature_relationship_id = frp.feature_relationship_id AND frp.pub_id = p.pub_id AND
    f.uniquename = &#39;FBal0000080&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Nature of the lesion</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, cvt.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name IN (&#39;molecular_info&#39;,&#39;aminoacid_rep&#39;,
      &#39;nucleotide_sub&#39;) AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Mode of assay</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvtp.VALUE, cvt.name, p.uniquename
  FROM feature f, feature_genotype fg, phendesc ph, environment e, environment_cvterm ec,
     cvterm cvt, cvtermprop cvtp, pub p, cvterm gtp
  WHERE f.feature_id = fg.feature_id AND fg.genotype_id = ph.genotype_id AND
    ph.environment_id = e.environment_id AND ph.pub_id = p.pub_id AND
    e.environment_id = ec.environment_id AND ec.cvterm_id = cvt.cvterm_id AND
    cvt.cvterm_id = cvtp.cvterm_id AND cvtp.VALUE = &#39;mode_of_assay&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.is_analysis = &#39;f&#39; AND
    f.type_id = gtp.cvterm_id AND gtp.name = &#39;gene&#39; AND
    f.uniquename LIKE &#39;FBal%&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>(Caused by insertion)</td>
<td>

<pre class="de1"><code>SELECT i.uniquename, i.name, p.uniquename
  FROM feature a, feature_relationship fr, feature i, cvterm cvt, cvterm cvt2,
     feature_relationship_pub frp, pub p
  WHERE a.feature_id = subject_id AND object_id = i.feature_id AND
    fr.feature_relationship_id = frp.feature_relationship_id AND frp.pub_id = p.pub_id AND
    i.type_id = cvt.cvterm_id AND fr.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;associated_with&#39; AND cvt.name = &#39;transposable_element_insertion_site&#39; AND
    a.uniquename LIKE &#39;FBal%&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>(Carried in construct)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, i.uniquename, i.name, p.uniquename
  FROM feature a, feature_relationship fr, feature i, cvterm itp, cvterm frtp,
     feature_relationship_pub frp, pub p
  WHERE a.feature_id = subject_id AND object_id = i.feature_id AND
    fr.type_id = frtp.cvterm_id AND frtp.name = &#39;associated_with&#39; AND
    fr.feature_relationship_id = frp.feature_relationship_id AND frp.pub_id = p.pub_id AND
    i.type_id = itp.cvterm_id AND itp.name = &#39;transgenic_transposon&#39; AND
    a.uniquename LIKE &#39;FBal%&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>(Tags)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, t.uniquename, t.name
  FROM feature a, feature_relationship fr, feature t, cvterm cvt
  WHERE a.feature_id = fr.subject_id AND fr.object_id = t.feature_id AND
    fr.type_id = cvt.cvterm_id AND cvt.name = &#39;included_in&#39; AND
    a.uniquename LIKE &#39;FBal%&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>(Tagged with)</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>(Caused by aberration)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, i.uniquename, i.name, p.uniquename
  FROM feature a, feature_relationship fr, feature i, cvterm cvt, feature_relationship_pub frp,
     pub p, cvterm cvt2
  WHERE a.feature_id = object_id AND subject_id = i.feature_id AND
    fr.feature_relationship_id = frp.feature_relationship_id AND fr.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;associated_with&#39; AND frp.pub_id = p.pub_id AND
    i.type_id = cvt.cvterm_id AND cvt.name = &#39;chromosome_structure_variation&#39; AND
    a.uniquename LIKE &#39;FBal%&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>(Carried on aberration)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, i.uniquename, i.name, p.uniquename
  FROM feature a, feature_relationship fr, feature i, cvterm cvt, feature_relationship_pub frp,
     pub p, cvterm cvt2
  WHERE a.feature_id = subject_id AND object_id = i.feature_id AND
    fr.feature_relationship_id = frp.feature_relationship_id AND fr.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;carried_on&#39; AND frp.pub_id = p.pub_id AND
    i.type_id = cvt.cvterm_id AND cvt.name = &#39;chromosome_structure_variation&#39; AND
    a.uniquename LIKE &#39;FBal%&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Cytology</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;cyto_change_comment&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">PHENOTYPIC DATA</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Phenotypic class</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_pheno_class&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Phenotype manifest in</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_pheno_manifest&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Detailed description</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_allele_pheno_description&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">GENETIC INTERACTIONS</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Phenotypic class</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Enhanced by</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_enhanceable_class&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">NOT Enhanced by</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_non-enhanceable_class&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Suppressed by</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_suppressible_class&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">NOT Suppressed by</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_non-suppressible_class&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Enhancer of</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_enhancer_class&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">NOT Enhancer of</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_non-enhancer_class&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Suppressor of</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_suppressor_class&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">NOT Suppressor of</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_non-suppressor_class&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Other</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_other_class&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Phenotype manifest in</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Enhanced by</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_enhanceable_manifest&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">NOT Enhanced by</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_non-enhanceable_manifest&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Suppressed by</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_suppressible_manifest&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">NOT Suppressed by</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_non-suppressible_manifest&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Enhancer of</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_enhancer_manifest&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">NOT Enhancer of</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_non-enhancer_manifest&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Suppressor of</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_suppressor_manifest&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">NOT Suppressor of</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_non-suppressor_manifest&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Other</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_other_manifest&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Additional comments (Genetic interactions)</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_allele_interaction_comment&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Additional comments (Xenogenetic interactions)
<p><br />
</p></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_allele_xeno_interaction_comment&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">COMPLEMENTATION &amp; RESCUE DATA</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>(Complements)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_complements&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>(Partially complements)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_part_complements&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>(Fails to complement)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_non_complements&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>(Rescued by)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_rescued_by&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>(Partially rescued by)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_part_rescued_by&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>(Not rescued by)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_non_rescued_by&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>(Rescues)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_rescues&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>(Partially rescues)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_part_rescues&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>(Fails to rescue)</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_non_rescues&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Comments</td>
<td></td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE, p.uniquename
  FROM feature a, featureprop frp, featureprop_pub frpp, pub p, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_allele_complementation_comment&#39; AND frp.featureprop_id = frpp.featureprop_id AND
    frpp.pub_id = p.pub_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">STOCKS</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Bloomington</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE
  FROM feature a, featureprop frp, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_stock_Bloomington&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Kyoto</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE
  FROM feature a, featureprop frp, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_stock_Kyoto&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Szeged</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE
  FROM feature a, featureprop frp, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_stock_Szeged&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Tucson</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE
  FROM feature a, featureprop frp, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_stock_Tucson&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Carpenter</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE
  FROM feature a, featureprop frp, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_stock_Carpenter&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Garcia-Bellido</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE
  FROM feature a, featureprop frp, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_stock_Garcia-Bellido&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Harvard</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE
  FROM feature a, featureprop frp, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_stock_Harvard&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Nusslein-Volhard</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE
  FROM feature a, featureprop frp, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_stock_Nusslein-Volhard&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Saxton</td>
<td>

<pre class="de1"><code>SELECT a.uniquename, a.name, frp.VALUE
  FROM feature a, featureprop frp, cvterm cvt
  WHERE a.feature_id = frp.feature_id AND frp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_stock_Saxton&#39;;</code></pre>

</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Notes on availability</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">NOTES ON ORIGIN</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Discoverer</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td> </td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">COMMENTS</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">SYNONYMS AND SECONDARY IDs</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">REPORTED AS</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Symbol Synonym</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Name Synonym</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">SECONDARY FLYBASE IDs</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">REFERENCES</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Research paper</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Supplementary<br />
material</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Review</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Abstract</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">Other</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

## FlyBase Gene Expression Report

**Example report:**
<a href="http://flybase.org/reports/FBgn0259750_exp.html"

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">GENERAL INFORMATION [unattributed]</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Symbol</td>
<td>

<pre class="de1"><code>SELECT DISTINCT(s.name)
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt, cvterm cvt2
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;gene&#39; AND
    f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt2.cvterm_id AND cvt2.name = &#39;symbol&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Species</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, o.genus, o.species
  FROM feature f, cvterm cvt, organism o
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;gene&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename LIKE &#39;FBgn%&#39; AND
    f.organism_id = o.organism_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT DISTINCT(s.name)
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt, cvterm cvt2
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;gene&#39; AND
    f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt2.cvterm_id AND cvt2.name = &#39;fullname&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Annotation symbol</td>
<td>

<pre class="de1"><code>SELECT accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;FlyBase Annotation IDs&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Feature type</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;promoted_gene_type&#39; AND f.uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT f.uniquename
  FROM feature f, cvterm cvt
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;gene&#39; AND
    f.name = &#39;ab&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Created/ Updated</td>
<td>

<pre class="de1"><code>SELECT timeaccessioned, timelastmodified
  FROM feature f
  WHERE uniquename = &#39;FBgn0000011&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">TRANSCRIPT EXPRESSION</td>
</tr>
<tr class="odd">
<td colspan="2">EXPRESSION DATA</td>
</tr>
<tr class="even">
<td>Stage</td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_transcript_bodypart_expression_cv&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;; NOTE that this will RETURN a structured string that contains stage information IN the bracketed &#39;t&#39; portion OF the statement.;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Tissue/Position</td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_transcript_bodypart_expression_cv&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;; NOTE that this will RETURN a structured string that contains tissue/POSITION information IN the bracketed &#39;a&#39; (AND &#39;p&#39;) portion OF the statement.;</code></pre>

</td>
</tr>
<tr class="even">
<td>Reference</td>
<td>

<pre class="de1"><code>NOTE: the pub uniquename associated WITH a statement IS returned USING the queries above. TO directly GET a specific pub association you need either the featureprop_id OR the feature_id/rank/featureprop.type_id UNIQUE KEY VALUES WITH which you can:
SELECT uniquename
  FROM featureprop fp, featureprop_pub, pub
  WHERE fp.featureprop_id = fpp.featureprop_id AND fpp.pub_id = pub.pub_id AND
    fp.featureprop_id = ?;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">ADDITIONAL DESCRIPTIVE DATA</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_transcript_bodypart_expression_text&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Assay mode</td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_transcript_mode_of_assay&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Marker for</td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_transcript_bodypart_expression_marker&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">SUBCELLULAR LOCALIZATION</td>
</tr>
<tr class="even">
<td>Subcellular localization</td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_transcript_subcellular_expression_cv&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Reference</td>
<td>

<pre class="de1"><code>NOTE: the pub uniquename associated WITH a statement IS returned USING the queries above. TO directly GET a specific pub association you need either the featureprop_id OR the feature_id/rank/featureprop.type_id UNIQUE KEY VALUES WITH which you can:
SELECT uniquename
  FROM featureprop fp, featureprop_pub, pub
  WHERE fp.featureprop_id = fpp.featureprop_id AND fpp.pub_id = pub.pub_id AND
    fp.featureprop_id = ?;</code></pre>

</td>
</tr>
<tr class="even">
<td>Notes</td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_transcript_subcellular_expression_text&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">POLYPEPTIDE EXPRESSION REPORT</td>
</tr>
<tr class="even">
<td colspan="2">EXPRESSION DATA</td>
</tr>
<tr class="odd">
<td>Stage</td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_polypeptide_bodypart_expression_cv&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;; NOTE that this will RETURN a structured string that contains stage information IN the bracketed &#39;t&#39; portion OF the statement.;</code></pre>

</td>
</tr>
<tr class="even">
<td>Tissue/Position</td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_polypeptide_bodypart_expression_cv&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;; NOTE that this will RETURN a structured string that contains stage information IN the bracketed &#39;a&#39; (AND &#39;p&#39;) portion OF the statement.;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Reference</td>
<td>

<pre class="de1"><code>NOTE: the pub uniquename associated WITH a statement IS returned USING the queries above. TO directly GET a specific pub association you need either the featureprop_id OR the feature_id/rank/featureprop.type_id UNIQUE KEY VALUES WITH which you can:
SELECT uniquename
  FROM featureprop fp, featureprop_pub, pub
  WHERE fp.featureprop_id = fpp.featureprop_id AND fpp.pub_id = pub.pub_id AND
    fp.featureprop_id = ?;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">ADDITIONAL DESCRIPTIVE DATA</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_polypeptide_bodypart_expression_text&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Assay mode</td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_polypeptide_bodypart_expression_cv&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;; NOTE: assay IS found IN the &#39;as&#39; bracketed tag IN the statement;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Marker for</td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_polypeptide_bodypart_expression_marker&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">SUBCELLULAR LOCALIZATION</td>
</tr>
<tr class="odd">
<td>Subcellular localization</td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_polypeptide_subcellular_expression_cv&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Reference</td>
<td>

<pre class="de1"><code>NOTE: the pub uniquename associated WITH a statement IS returned USING the queries above. TO directly GET a specific pub association you need either the featureprop_id OR the feature_id/rank/featureprop.type_id UNIQUE KEY VALUES WITH which you can:
SELECT uniquename
  FROM featureprop fp, featureprop_pub, pub
  WHERE fp.featureprop_id = fpp.featureprop_id AND fpp.pub_id = pub.pub_id AND
    fp.featureprop_id = ?;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Notes</td>
<td>

<pre class="de1"><code>SELECT VALUE, pub.uniquename
  FROM feature f, featureprop fp, cvterm cvt, featureprop_pub fpp, pub
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_polypeptide_subcellular_expression_text&#39; AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = pub.pub_id AND f.uniquename = &#39;FBgn0000490&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">REFERENCES</td>
</tr>
<tr class="odd">
<td>Research paper</td>
<td></td>
</tr>
<tr class="even">
<td>Supplementary<br />
material</td>
<td></td>
</tr>
<tr class="odd">
<td>Review</td>
<td></td>
</tr>
<tr class="even">
<td>Abstract</td>
<td></td>
</tr>
<tr class="odd">
<td>Other</td>
<td></td>
</tr>
</tbody>
</table>

## FlyBase Transcript Report

**Example report:**
<a href="http://flybase.org/reports/FBtr0087703.html"

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">GENERAL INFORMATION</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Symbol</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt, cvterm cvt2
  WHERE f.type_id = cvt.cvterm_id AND (cvt.name = &#39;pseudogene&#39; OR
    cvt.name LIKE &#39;%RNA&#39;) AND f.feature_id = fs.feature_id AND
    fs.synonym_id = s.synonym_id AND fs.is_current = &#39;t&#39; AND
    fs.is_internal = &#39;f&#39; AND s.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;symbol&#39; AND f.is_obsolete = &#39;f&#39; AND
    f.uniquename = &#39;FBtr0087703&#39; GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>Species</td>
<td>

<pre class="de1"><code>SELECT o.genus, o.species
  FROM feature f, cvterm cvt, organism o
  WHERE f.type_id = cvt.cvterm_id AND (cvt.name = &#39;pseudogene&#39; OR
    cvt.name LIKE &#39;%RNA&#39;) AND f.is_obsolete = &#39;f&#39; AND
    f.uniquename = &#39;FBtr0087703&#39; AND f.organism_id = o.organism_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Annotation symbol</td>
<td>

<pre class="de1"><code>SELECT accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;FlyBase Annotation IDs&#39; AND f.uniquename = &#39;FBtr0087703&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT f.uniquename
  FROM feature f, cvterm cvt
  WHERE f.type_id = cvt.cvterm_id AND (cvt.name = &#39;pseudogene&#39; OR
    cvt.name LIKE &#39;%RNA&#39;) AND f.name = &#39;cnn-RA&#39; AND
    f.is_analysis=FALSE AND f.is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Feature type</td>
<td>

<pre class="de1"><code>SELECT cvt.name
  FROM feature f, cvterm cvt
  WHERE f.type_id = cvt.cvterm_id AND f.uniquename = &#39;FBtr0087703&#39; AND
    f.is_analysis=FALSE AND f.is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="even">
<td>Associated gene</td>
<td>

<pre class="de1"><code>SELECT DISTINCT(g.uniquename),g.name
  FROM feature tr, feature g, feature_relationship fr, cvterm fr_type, cvterm tr_type,
     cvterm g_type
  WHERE tr.uniquename=&#39;FBtr0087703&#39; AND tr.is_obsolete=FALSE AND
    tr.is_analysis=FALSE AND fr_type.name=&#39;partof&#39; AND
    g_type.name=&#39;gene&#39; AND tr.feature_id=fr.subject_id AND
    fr.object_id=g.feature_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Created/ Updated</td>
<td>

<pre class="de1"><code>SELECT timeaccessioned, timelastmodified
  FROM feature f, cvterm cvt
  WHERE f.type_id = cvt.cvterm_id AND (cvt.name = &#39;pseudogene&#39; OR
    cvt.name LIKE &#39;%RNA&#39;) AND f.uniquename = &#39;FBtr0087703&#39; AND
    f.is_analysis=FALSE AND f.is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="even">
<td>Evidence score</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBtr0087703&#39; AND fp_type.name=&#39;score&#39; AND
    f.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Evidence rank</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBtr0087703&#39; AND fp_type.name=&#39;score_text&#39; AND
    f.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Length (nt)</td>
<td>

<pre class="de1"><code>SELECT seqlen
  FROM feature f, cvterm cvt
  WHERE f.type_id = cvt.cvterm_id AND (cvt.name = &#39;pseudogene&#39; OR
    cvt.name LIKE &#39;%RNA&#39;) AND f.uniquename = &#39;FBtr0087703&#39; AND
    f.is_analysis=FALSE AND f.is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Map (GBrowse)</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">SUPPORTING cDNA CLONES</td>
</tr>
<tr class="odd">
<td colspan="2">cDNA clones, fully sequenced</td>
</tr>
<tr class="even">
<td>Exact Match</td>
<td>

<pre class="de1"><code>SELECT clone.name, clone.uniquename
  FROM feature tr, feature cDNA, feature clone, feature_relationship fr1, feature_relationshipprop fr1_prop,
     feature_relationship fr2, cvterm fr1_type, cvterm cDNA_type, cvterm clone_type
  WHERE tr.uniquename = &#39;FBtr0070000&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND fr1_type.name=&#39;supports&#39; AND
    fr1_prop.VALUE=&#39;exact&#39; AND cDNA_type.name=&#39;cDNA&#39; AND
    clone_type.name=&#39;cDNA_clone&#39; AND tr.feature_id=fr1.object_id AND
    fr1.feature_relationship_id=fr1_prop.feature_relationship_id AND fr1.subject_id=cDNA.feature_id AND
    cDNA.type_id=cDNA_type.cvterm_id AND cDNA.feature_id=fr2.subject_id AND
    fr2.object_id=clone.feature_id AND clone.type_id=clone_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Contained within the<br />
annotated transcript,<br />
internally consistent</td>
<td>

<pre class="de1"><code>SELECT clone.name, clone.uniquename
  FROM feature tr, feature cDNA, feature clone, feature_relationship fr1, feature_relationshipprop fr1_prop,
     feature_relationship fr2, cvterm fr1_type, cvterm cDNA_type, cvterm clone_type
  WHERE tr.uniquename = &#39;FBtr0005088&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND fr1_type.name=&#39;supports&#39; AND
    fr1_prop.VALUE=&#39;full&#39; AND cDNA_type.name=&#39;cDNA&#39; AND
    clone_type.name=&#39;cDNA_clone&#39; AND tr.feature_id=fr1.object_id AND
    fr1.feature_relationship_id=fr1_prop.feature_relationship_id AND fr1.subject_id=cDNA.feature_id AND
    cDNA.type_id=cDNA_type.cvterm_id AND cDNA.feature_id=fr2.subject_id AND
    fr2.object_id=clone.feature_id AND clone.type_id=clone_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>End(s) extend beyond<br />
the annotated transcript,<br />
internally consistent</td>
<td>

<pre class="de1"><code>SELECT clone.name, clone.uniquename
  FROM feature tr, feature cDNA, feature clone, feature_relationship fr1, feature_relationshipprop fr1_prop,
     feature_relationship fr2, cvterm fr1_type, cvterm cDNA_type, cvterm clone_type
  WHERE tr.uniquename = &#39;FBtr0005009&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND fr1_type.name=&#39;supports&#39; AND
    fr1_prop.VALUE IN (&#39;not_five&#39;,&#39;not_three&#39;,
      &#39;not_ends&#39;) AND cDNA_type.name=&#39;cDNA&#39; AND
    clone_type.name=&#39;cDNA_clone&#39; AND tr.feature_id=fr1.object_id AND
    fr1.feature_relationship_id=fr1_prop.feature_relationship_id AND fr1.subject_id=cDNA.feature_id AND
    cDNA.type_id=cDNA_type.cvterm_id AND cDNA.feature_id=fr2.subject_id AND
    fr2.object_id=clone.feature_id AND clone.type_id=clone_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">cDNA clones, end sequence only (ESTs)</td>
</tr>
<tr class="even">
<td>Contained within the<br />
annotated transcript,<br />
internally consistent</td>
<td>

<pre class="de1"><code>SELECT clone.name, clone.uniquename
  FROM feature tr, feature EST, feature clone, feature_relationship fr1, feature_relationshipprop fr1_prop,
     feature_relationship fr2, cvterm fr1_type, cvterm EST_type, cvterm clone_type
  WHERE tr.uniquename = &#39;FBtr0005009&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND fr1_type.name=&#39;supports&#39; AND
    fr1_prop.VALUE=&#39;full&#39; AND EST_type.name=&#39;EST&#39; AND
    clone_type.name=&#39;cDNA_clone&#39; AND tr.feature_id=fr1.object_id AND
    fr1.feature_relationship_id=fr1_prop.feature_relationship_id AND fr1.subject_id=EST.feature_id AND
    EST.type_id=EST_type.cvterm_id AND EST.feature_id=fr2.subject_id AND
    fr2.object_id=clone.feature_id AND clone.type_id=clone_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>End(s) extend beyond<br />
the annotated transcript,<br />
internally consistent</td>
<td>

<pre class="de1"><code>SELECT clone.name, clone.uniquename
  FROM feature tr, feature EST, feature clone, feature_relationship fr1, feature_relationshipprop fr1_prop,
     feature_relationship fr2, cvterm fr1_type, cvterm EST_type, cvterm clone_type
  WHERE tr.uniquename = &#39;FBtr0005009&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND fr1_type.name=&#39;supports&#39; AND
    fr1_prop.VALUE IN (&#39;not_five&#39;,&#39;not_three&#39;,
      &#39;not_ends&#39;) AND EST_type.name=&#39;EST&#39; AND
    clone_type.name=&#39;cDNA_clone&#39; AND tr.feature_id=fr1.object_id AND
    fr1.feature_relationship_id=fr1_prop.feature_relationship_id AND fr1.subject_id=EST.feature_id AND
    EST.type_id=EST_type.cvterm_id AND EST.feature_id=fr2.subject_id AND
    fr2.object_id=clone.feature_id AND clone.type_id=clone_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">EXONS</td>
</tr>
<tr class="odd">
<td>Exon</td>
<td></td>
</tr>
<tr class="even">
<td>Sequence Location</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">SEQUENCE</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT residues
  FROM feature f, cvterm cvt
  WHERE f.type_id = cvt.cvterm_id AND (cvt.name = &#39;pseudogene&#39; OR
    cvt.name LIKE &#39;%RNA&#39;) AND f.uniquename = &#39;FBtr0005009&#39; AND
    f.is_analysis=FALSE AND f.is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">OTHER PRODUCTS OF THIS GENE</td>
</tr>
<tr class="even">
<td colspan="2">Other Transcripts</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature tr, feature g, feature otr, cvterm tr_type, cvterm g_type,
     cvterm otr_type, feature_relationship fr1, feature_relationship fr2, cvterm fr1_type, cvterm fr2_type,
     featureloc fl, feature_synonym fs, synonym s, cvterm s_type
  WHERE tr.uniquename=&#39;FBtr0087703&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND otr.uniquename ~ &#39;^FBtr[0-9]+$&#39; AND
    g.uniquename ~ &#39;^FBgn[0-9]+$&#39; AND (tr_type.name = &#39;pseudogene&#39; OR
    tr_type.name LIKE &#39;%RNA&#39;) AND (otr_type.name = &#39;pseudogene&#39; OR
    otr_type.name LIKE &#39;%RNA&#39;) AND g_type.name=&#39;gene&#39; AND
    fr1_type.name=&#39;partof&#39; AND fr2_type.name=&#39;partof&#39; AND
    otr.uniquename != tr.uniquename AND fs.is_current=TRUE AND
    fs.is_internal=FALSE AND s_type.name=&#39;symbol&#39; AND
    tr.feature_id=fr1.subject_id AND fr1.object_id=g.feature_id AND
    g.feature_id=fr2.object_id AND fr2.subject_id=otr.feature_id AND
    fr1.type_id=fr1_type.cvterm_id AND fr2.type_id=fr2_type.cvterm_id AND
    tr.type_id=tr_type.cvterm_id AND g.type_id=g_type.cvterm_id AND
    otr.type_id=otr_type.cvterm_id AND otr.feature_id=fl.feature_id AND
    otr.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=s_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT otr.uniquename
  FROM feature tr, feature g, feature otr, cvterm tr_type, cvterm g_type,
     cvterm otr_type, feature_relationship fr1, feature_relationship fr2, cvterm fr1_type, cvterm fr2_type,
     featureloc fl
  WHERE tr.uniquename=&#39;FBtr0087703&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND otr.uniquename ~ &#39;^FBtr[0-9]+$&#39; AND
    g.uniquename ~ &#39;^FBgn[0-9]+$&#39; AND (tr_type.name = &#39;pseudogene&#39; OR
    tr_type.name LIKE &#39;%RNA&#39;) AND (otr_type.name = &#39;pseudogene&#39; OR
    otr_type.name LIKE &#39;%RNA&#39;) AND g_type.name=&#39;gene&#39; AND
    fr1_type.name=&#39;partof&#39; AND fr2_type.name=&#39;partof&#39; AND
    otr.uniquename != tr.uniquename AND tr.feature_id=fr1.subject_id AND
    fr1.object_id=g.feature_id AND g.feature_id=fr2.object_id AND
    fr2.subject_id=otr.feature_id AND fr1.type_id=fr1_type.cvterm_id AND
    fr2.type_id=fr2_type.cvterm_id AND tr.type_id=tr_type.cvterm_id AND
    g.type_id=g_type.cvterm_id AND otr.type_id=otr_type.cvterm_id AND
    otr.feature_id=fl.feature_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Length (nt)</td>
<td>

<pre class="de1"><code>SELECT otr.seqlen
  FROM feature tr, feature g, feature otr, cvterm tr_type, cvterm g_type,
     cvterm otr_type, feature_relationship fr1, feature_relationship fr2, cvterm fr1_type, cvterm fr2_type,
     featureloc fl
  WHERE tr.uniquename=&#39;FBtr0087703&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND otr.uniquename ~ &#39;^FBtr[0-9]+$&#39; AND
    g.uniquename ~ &#39;^FBgn[0-9]+$&#39; AND (tr_type.name = &#39;pseudogene&#39; OR
    tr_type.name LIKE &#39;%RNA&#39;) AND (otr_type.name = &#39;pseudogene&#39; OR
    otr_type.name LIKE &#39;%RNA&#39;) AND g_type.name=&#39;gene&#39; AND
    fr1_type.name=&#39;partof&#39; AND fr2_type.name=&#39;partof&#39; AND
    otr.uniquename != tr.uniquename AND tr.feature_id=fr1.subject_id AND
    fr1.object_id=g.feature_id AND g.feature_id=fr2.object_id AND
    fr2.subject_id=otr.feature_id AND fr1.type_id=fr1_type.cvterm_id AND
    fr2.type_id=fr2_type.cvterm_id AND tr.type_id=tr_type.cvterm_id AND
    g.type_id=g_type.cvterm_id AND otr.type_id=otr_type.cvterm_id AND
    otr.feature_id=fl.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">Polypeptides derived from this transcript</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature tr, feature p, cvterm tr_type, cvterm p_type, feature_relationship fr1,
     cvterm fr1_type, featureloc fl, feature_synonym fs, synonym s, cvterm s_type
  WHERE tr.uniquename=&#39;FBtr0087703&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND p.uniquename ~ &#39;^FBpp[0-9]+$&#39; AND
    (tr_type.NAME = &#39;pseudogene&#39; OR tr_type.NAME LIKE &#39;%RNA&#39;) AND
    p_type.NAME=&#39;protein&#39; AND fr1_type.NAME=&#39;producedby&#39; AND
    fs.is_current=TRUE AND fs.is_internal=FALSE AND
    s_type.NAME=&#39;symbol&#39; AND tr.feature_id=fr1.object_id AND
    fr1.subject_id=p.feature_id AND fr1.type_id=fr1_type.cvterm_id AND
    tr.type_id=tr_type.cvterm_id AND p.feature_id=fl.feature_id AND
    p.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=s_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT p.uniquename
  FROM feature tr, feature p, cvterm tr_type, cvterm p_type, feature_relationship fr1,
     cvterm fr1_type, featureloc fl
  WHERE tr.uniquename=&#39;FBtr0087703&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND p.uniquename ~ &#39;^FBpp[0-9]+$&#39; AND
    (tr_type.NAME = &#39;pseudogene&#39; OR tr_type.NAME LIKE &#39;%RNA&#39;) AND
    p_type.NAME=&#39;protein&#39; AND fr1_type.NAME=&#39;producedby&#39; AND
    tr.feature_id=fr1.object_id AND fr1.subject_id=p.feature_id AND
    fr1.type_id=fr1_type.cvterm_id AND tr.type_id=tr_type.cvterm_id AND
    p.feature_id=fl.feature_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Length (nt)</td>
<td>

<pre class="de1"><code>SELECT p.seqlen
  FROM feature tr, feature p, cvterm tr_type, cvterm p_type, feature_relationship fr1,
     cvterm fr1_type, featureloc fl
  WHERE tr.uniquename=&#39;FBtr0087703&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND p.uniquename ~ &#39;^FBpp[0-9]+$&#39; AND
    (tr_type.NAME = &#39;pseudogene&#39; OR tr_type.NAME LIKE &#39;%RNA&#39;) AND
    p_type.NAME=&#39;protein&#39; AND fr1_type.NAME=&#39;producedby&#39; AND
    tr.feature_id=fr1.object_id AND fr1.subject_id=p.feature_id AND
    fr1.type_id=fr1_type.cvterm_id AND tr.type_id=tr_type.cvterm_id AND
    p.feature_id=fl.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">Polypeptides derived from other transcripts of this
gene</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature tr, feature g, feature otr, feature op, cvterm g_type,
     cvterm otr_type, cvterm op_type, feature_relationship fr1, feature_relationship fr2, feature_relationship fr3,
     cvterm fr1_type, cvterm fr2_type, cvterm fr3_type, featureloc fl, feature_synonym fs,
     synonym s, cvterm s_type
  WHERE tr.uniquename=&#39;FBtr0087703&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND (otr_type.name = &#39;pseudogene&#39; OR
    otr_type.name LIKE &#39;%RNA&#39;) AND g_type.name=&#39;gene&#39; AND
    op_type.name=&#39;protein&#39; AND fr1_type.name=&#39;partof&#39; AND
    fr2_type.name=&#39;partof&#39; AND fr3_type.name=&#39;producedby&#39; AND
    otr.uniquename != tr.uniquename AND fs.is_current=TRUE AND
    fs.is_internal=FALSE AND s_type.name=&#39;symbol&#39; AND
    tr.feature_id=fr1.subject_id AND fr1.object_id=g.feature_id AND
    g.feature_id=fr2.object_id AND fr2.subject_id=otr.feature_id AND
    otr.feature_id=fr3.object_id AND fr3.subject_id=op.feature_id AND
    fr1.type_id=fr1_type.cvterm_id AND fr2.type_id=fr2_type.cvterm_id AND
    fr3.type_id=fr3_type.cvterm_id AND g.type_id=g_type.cvterm_id AND
    otr.type_id=otr_type.cvterm_id AND op.type_id=op_type.cvterm_id AND
    op.feature_id=fl.feature_id AND op.feature_id=fs.feature_id AND
    fs.synonym_id=s.synonym_id AND s.type_id=s_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT op.uniquename
  FROM feature tr, feature g, feature otr, feature op, cvterm g_type,
     cvterm otr_type, cvterm op_type, feature_relationship fr1, feature_relationship fr2, feature_relationship fr3,
     cvterm fr1_type, cvterm fr2_type, cvterm fr3_type, featureloc fl
  WHERE tr.uniquename=&#39;FBtr0087703&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND (otr_type.name = &#39;pseudogene&#39; OR
    otr_type.name LIKE &#39;%RNA&#39;) AND g_type.name=&#39;gene&#39; AND
    op_type.name=&#39;protein&#39; AND fr1_type.name=&#39;partof&#39; AND
    fr2_type.name=&#39;partof&#39; AND fr3_type.name=&#39;producedby&#39; AND
    otr.uniquename != tr.uniquename AND tr.feature_id=fr1.subject_id AND
    fr1.object_id=g.feature_id AND g.feature_id=fr2.object_id AND
    fr2.subject_id=otr.feature_id AND otr.feature_id=fr3.object_id AND
    fr3.subject_id=op.feature_id AND fr1.type_id=fr1_type.cvterm_id AND
    fr2.type_id=fr2_type.cvterm_id AND fr3.type_id=fr3_type.cvterm_id AND
    g.type_id=g_type.cvterm_id AND otr.type_id=otr_type.cvterm_id AND
    op.type_id=op_type.cvterm_id AND op.feature_id=fl.feature_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Length (nt)</td>
<td>

<pre class="de1"><code>SELECT op.seqlen
  FROM feature tr, feature g, feature otr, feature op, cvterm g_type,
     cvterm otr_type, cvterm op_type, feature_relationship fr1, feature_relationship fr2, feature_relationship fr3,
     cvterm fr1_type, cvterm fr2_type, cvterm fr3_type, featureloc fl
  WHERE tr.uniquename=&#39;FBtr0087703&#39; AND tr.is_analysis=FALSE AND
    tr.is_obsolete=FALSE AND (otr_type.name = &#39;pseudogene&#39; OR
    otr_type.name LIKE &#39;%RNA&#39;) AND g_type.name=&#39;gene&#39; AND
    op_type.name=&#39;protein&#39; AND fr1_type.name=&#39;partof&#39; AND
    fr2_type.name=&#39;partof&#39; AND fr3_type.name=&#39;producedby&#39; AND
    otr.uniquename != tr.uniquename AND tr.feature_id=fr1.subject_id AND
    fr1.object_id=g.feature_id AND g.feature_id=fr2.object_id AND
    fr2.subject_id=otr.feature_id AND otr.feature_id=fr3.object_id AND
    fr3.subject_id=op.feature_id AND fr1.type_id=fr1_type.cvterm_id AND
    fr2.type_id=fr2_type.cvterm_id AND fr3.type_id=fr3_type.cvterm_id AND
    g.type_id=g_type.cvterm_id AND otr.type_id=otr_type.cvterm_id AND
    op.type_id=op_type.cvterm_id AND op.feature_id=fl.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">COMMENTS</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature tr, featureprop fp, cvterm fp_type
  WHERE tr.uniquename=&#39;FBtr0000021&#39; AND fp_type.name=&#39;comment&#39; AND
    tr.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">EXTERNAL CROSSREFERENCES</td>
</tr>
<tr class="odd">
<td>DNA sequence</td>
<td></td>
</tr>
<tr class="even">
<td>Name</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">SYNONYMS</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, s.name AS synonym, synonym_sgml, cvt.name, p.uniquename
  FROM cvterm cvt, feature f, feature_synonym fs, synonym s, pub p
  WHERE f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.pub_id = p.pub_id AND s.type_id = cvt.cvterm_id AND
    fs.is_current = &#39;f&#39; AND f.uniquename = &#39;FBtr0087703&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">REFERENCES</td>
</tr>
<tr class="even">
<td>Primary</td>
<td>

<pre class="de1"><code>SELECT p.uniquename, p.miniref, p.title
  FROM feature f, pub p, feature_pub fp
  WHERE f.uniquename = &#39;FBtr0087703&#39; AND f.feature_id=fp.feature_id AND
    fp.pub_id=p.pub_id;</code></pre>

</td>
</tr>
</tbody>
</table>

## FlyBase Polypeptide Report

**Example report:**
<a href="http://flybase.org/reports/FBpp0086822.html"

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">GENERAL INFORMATION</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Symbol</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt, cvterm cvt2
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;protein&#39; AND
    f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt2.cvterm_id AND cvt2.name = &#39;symbol&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBpp0086822&#39; GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>Species</td>
<td>

<pre class="de1"><code>SELECT o.genus, o.species
  FROM feature f, cvterm cvt, organism o
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;protein&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBpp0086822&#39; AND
    f.organism_id = o.organism_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Annotation symbol</td>
<td>

<pre class="de1"><code>SELECT accession
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;t&#39; AND d.db_id = db.db_id AND
    db.name = &#39;FlyBase Annotation IDs&#39; AND f.uniquename = &#39;FBpp0086822&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT f.uniquename
  FROM feature f, cvterm cvt
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;protein&#39; AND
    f.name = &#39;cnn-PA&#39; AND f.is_analysis=FALSE AND
    f.is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Associated gene</td>
<td>

<pre class="de1"><code>SELECT DISTINCT(g.uniquename),g.name
  FROM feature p, feature tr, feature g, feature_relationship fr1, feature_relationship fr2,
     cvterm fr1_type, cvterm fr2_type, cvterm p_type, cvterm g_type
  WHERE p.uniquename=&#39;FBpp0086822&#39; AND p.is_obsolete=FALSE AND
    p.is_analysis=FALSE AND fr1_type.name=&#39;producedby&#39; AND
    fr2_type.name=&#39;partof&#39; AND p_type.name=&#39;protein&#39; AND
    g_type.name=&#39;gene&#39; AND p.feature_id=fr1.subject_id AND
    fr1.object_id=tr.feature_id AND tr.feature_id=fr2.subject_id AND
    fr2.object_id=g.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Created/ Updated</td>
<td>

<pre class="de1"><code>SELECT timeaccessioned, timelastmodified
  FROM feature f, cvterm cvt
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;protein&#39; AND
    f.uniquename = &#39;FBpp0086822&#39; AND f.is_analysis=FALSE AND
    f.is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Length (aa)</td>
<td>

<pre class="de1"><code>SELECT seqlen
  FROM feature f, cvterm cvt
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;protein&#39; AND
    f.uniquename = &#39;FBpp0086822&#39; AND f.is_analysis=FALSE AND
    f.is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="even">
<td>Theoretical pI</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_isoelectric_point&#39; AND f.uniquename = &#39;FBpp0086822&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Predicted MW (kD)</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;derived_molecular_weight&#39; AND f.uniquename = &#39;FBpp0086822&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Map (GBrowse)</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">SEQUENCE</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT residues
  FROM feature f, cvterm cvt
  WHERE f.type_id = cvt.cvterm_id AND cvt.name = &#39;protein&#39; AND
    f.uniquename = &#39;FBpp0086822&#39; AND f.is_analysis=FALSE AND
    f.is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">OTHER PRODUCTS OF THIS GENE</td>
</tr>
<tr class="even">
<td colspan="2">Transcripts Corresponding to THIS polypeptide</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature pp, feature_relationship fr, cvterm fr_type, feature tr, feature_synonym fs,
     synonym s, cvterm s_type
  WHERE pp.uniquename=&#39;FBpp0086822&#39; AND fr_type.name=&#39;producedby&#39; AND
    s_type.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    pp.feature_id=fr.subject_id AND fr.type_id=fr_type.cvterm_id AND
    fr.object_id=tr.feature_id AND tr.feature_id=fs.feature_id AND
    fs.synonym_id=s.synonym_id AND s.type_id=s_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT tr.uniquename
  FROM feature pp, feature_relationship fr, cvterm fr_type, feature tr
  WHERE pp.uniquename=&#39;FBpp0086822&#39; AND fr_type.name=&#39;producedby&#39; AND
    pp.feature_id=fr.subject_id AND fr.type_id=fr_type.cvterm_id AND
    fr.object_id=tr.feature_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Length (nt)</td>
<td>

<pre class="de1"><code>SELECT tr.seqlen
  FROM feature pp, feature_relationship fr, cvterm fr_type, feature tr
  WHERE pp.uniquename=&#39;FBpp0086822&#39; AND fr_type.name=&#39;producedby&#39; AND
    pp.feature_id=fr.subject_id AND fr.type_id=fr_type.cvterm_id AND
    fr.object_id=tr.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">Transcripts Corresponding to OTHER polypeptides</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature pp, feature tr, feature g, feature otr, feature_relationship fr1,
     feature_relationship fr2, feature_relationship fr3, cvterm fr1_type, cvterm fr2_type, cvterm fr3_type,
     feature_synonym fs, synonym s, cvterm s_type, featureloc fl
  WHERE pp.uniquename=&#39;FBpp0086822&#39; AND otr.is_analysis=FALSE AND
    otr.is_obsolete=FALSE AND otr.uniquename LIKE &#39;FBtr%&#39; AND
    otr.uniquename != tr.uniquename AND fr1_type.name=&#39;producedby&#39; AND
    fr2_type.name=&#39;partof&#39; AND fr3_type.name=&#39;partof&#39; AND
    fs.is_current=TRUE AND fs.is_internal=FALSE AND
    s_type.name=&#39;symbol&#39; AND pp.feature_id=fr1.subject_id AND
    fr1.type_id=fr1_type.cvterm_id AND fr1.object_id=tr.feature_id AND
    tr.feature_id=fr2.subject_id AND fr2.type_id=fr2_type.cvterm_id AND
    fr2.object_id=g.feature_id AND g.feature_id=fr3.object_id AND
    fr3.type_id=fr3_type.cvterm_id AND fr3.subject_id=otr.feature_id AND
    otr.feature_id=fs.feature_id AND otr.feature_id=fl.feature_id AND
    fs.synonym_id=s.synonym_id AND s.type_id=s_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT otr.uniquename
  FROM feature pp, feature tr, feature g, feature otr, feature_relationship fr1,
     feature_relationship fr2, feature_relationship fr3, cvterm fr1_type, cvterm fr2_type, cvterm fr3_type,
     featureloc fl
  WHERE pp.uniquename=&#39;FBpp0086822&#39; AND otr.is_analysis=FALSE AND
    otr.is_obsolete=FALSE AND otr.uniquename LIKE &#39;FBtr%&#39; AND
    otr.uniquename != tr.uniquename AND fr1_type.name=&#39;producedby&#39; AND
    fr2_type.name=&#39;partof&#39; AND fr3_type.name=&#39;partof&#39; AND
    pp.feature_id=fr1.subject_id AND fr1.type_id=fr1_type.cvterm_id AND
    fr1.object_id=tr.feature_id AND tr.feature_id=fr2.subject_id AND
    fr2.type_id=fr2_type.cvterm_id AND fr2.object_id=g.feature_id AND
    g.feature_id=fr3.object_id AND fr3.type_id=fr3_type.cvterm_id AND
    fr3.subject_id=otr.feature_id AND otr.feature_id=fl.feature_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Length (nt)</td>
<td>

<pre class="de1"><code>SELECT otr.seqlen
  FROM feature pp, feature tr, feature g, feature otr, feature_relationship fr1,
     feature_relationship fr2, feature_relationship fr3, cvterm fr1_type, cvterm fr2_type, cvterm fr3_type,
     featureloc fl
  WHERE pp.uniquename=&#39;FBpp0086822&#39; AND otr.is_analysis=FALSE AND
    otr.is_obsolete=FALSE AND otr.uniquename LIKE &#39;FBtr%&#39; AND
    otr.uniquename != tr.uniquename AND fr1_type.name=&#39;producedby&#39; AND
    fr2_type.name=&#39;partof&#39; AND fr3_type.name=&#39;partof&#39; AND
    pp.feature_id=fr1.subject_id AND fr1.type_id=fr1_type.cvterm_id AND
    fr1.object_id=tr.feature_id AND tr.feature_id=fr2.subject_id AND
    fr2.type_id=fr2_type.cvterm_id AND fr2.object_id=g.feature_id AND
    g.feature_id=fr3.object_id AND fr3.type_id=fr3_type.cvterm_id AND
    fr3.subject_id=otr.feature_id AND otr.feature_id=fl.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">Other Polypeptides</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature pp, feature tr, feature g, feature otr, feature opp,
     feature_relationship fr1, feature_relationship fr2, feature_relationship fr3, feature_relationship fr4, cvterm fr1_type,
     cvterm fr2_type, cvterm fr3_type, cvterm fr4_type, feature_synonym fs, synonym s,
     cvterm s_type, featureloc otrfl, featureloc oppfl
  WHERE pp.uniquename=&#39;FBpp0086822&#39; AND opp.is_obsolete=FALSE AND
    opp.is_analysis=FALSE AND opp.uniquename LIKE &#39;FBpp%&#39; AND
    opp.uniquename != pp.uniquename AND fr1_type.name=&#39;producedby&#39; AND
    fr2_type.name=&#39;partof&#39; AND fr3_type.name=&#39;partof&#39; AND
    fr4_type.name=&#39;producedby&#39; AND fs.is_current=TRUE AND
    fs.is_internal=FALSE AND s_type.name=&#39;symbol&#39; AND
    pp.feature_id=fr1.subject_id AND fr1.type_id=fr1_type.cvterm_id AND
    fr1.object_id=tr.feature_id AND tr.feature_id=fr2.subject_id AND
    fr2.type_id=fr2_type.cvterm_id AND fr2.object_id=g.feature_id AND
    g.feature_id=fr3.object_id AND fr3.type_id=fr3_type.cvterm_id AND
    fr3.subject_id=otr.feature_id AND otr.feature_id=fr4.object_id AND
    fr4.type_id=fr4_type.cvterm_id AND fr4.subject_id=opp.feature_id AND
    otr.feature_id=otrfl.feature_id AND opp.feature_id=oppfl.feature_id AND
    opp.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=s_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT opp.uniquename
  FROM feature pp, feature tr, feature g, feature otr, feature opp,
     feature_relationship fr1, feature_relationship fr2, feature_relationship fr3, feature_relationship fr4, cvterm fr1_type,
     cvterm fr2_type, cvterm fr3_type, cvterm fr4_type, featureloc otrfl, featureloc oppfl
  WHERE pp.uniquename=&#39;FBpp0086822&#39; AND opp.uniquename LIKE &#39;FBpp%&#39; AND
    opp.uniquename != pp.uniquename AND opp.is_analysis=FALSE AND
    opp.is_obsolete=FALSE AND fr1_type.name=&#39;producedby&#39; AND
    fr2_type.name=&#39;partof&#39; AND fr3_type.name=&#39;partof&#39; AND
    fr4_type.name=&#39;producedby&#39; AND pp.feature_id=fr1.subject_id AND
    fr1.type_id=fr1_type.cvterm_id AND fr1.object_id=tr.feature_id AND
    tr.feature_id=fr2.subject_id AND fr2.type_id=fr2_type.cvterm_id AND
    fr2.object_id=g.feature_id AND g.feature_id=fr3.object_id AND
    fr3.type_id=fr3_type.cvterm_id AND fr3.subject_id=otr.feature_id AND
    otr.feature_id=fr4.object_id AND fr4.type_id=fr4_type.cvterm_id AND
    fr4.subject_id=opp.feature_id AND otr.feature_id=otrfl.feature_id AND
    opp.feature_id=oppfl.feature_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Length (nt)</td>
<td>

<pre class="de1"><code>SELECT opp.seqlen
  FROM feature pp, feature tr, feature g, feature otr, feature opp,
     feature_relationship fr1, feature_relationship fr2, feature_relationship fr3, feature_relationship fr4, cvterm fr1_type,
     cvterm fr2_type, cvterm fr3_type, cvterm fr4_type, featureloc otrfl, featureloc oppfl
  WHERE pp.uniquename=&#39;FBpp0086822&#39; AND opp.uniquename LIKE &#39;FBpp%&#39; AND
    opp.uniquename != pp.uniquename AND opp.is_analysis=FALSE AND
    opp.is_obsolete=FALSE AND fr1_type.name=&#39;producedby&#39; AND
    fr2_type.name=&#39;partof&#39; AND fr3_type.name=&#39;partof&#39; AND
    fr4_type.name=&#39;producedby&#39; AND pp.feature_id=fr1.subject_id AND
    fr1.type_id=fr1_type.cvterm_id AND fr1.object_id=tr.feature_id AND
    tr.feature_id=fr2.subject_id AND fr2.type_id=fr2_type.cvterm_id AND
    fr2.object_id=g.feature_id AND g.feature_id=fr3.object_id AND
    fr3.type_id=fr3_type.cvterm_id AND fr3.subject_id=otr.feature_id AND
    otr.feature_id=fr4.object_id AND fr4.type_id=fr4_type.cvterm_id AND
    fr4.subject_id=opp.feature_id AND otr.feature_id=otrfl.feature_id AND
    opp.feature_id=oppfl.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">EXTERNAL CROSSREFERENCES</td>
</tr>
<tr class="odd">
<td>Protein accessions</td>
<td>

<pre class="de1"><code>SELECT db.name,dbx.accession
  FROM feature f, feature_dbxref fdbx, dbxref dbx, db
  WHERE f.uniquename=&#39;FBpp0086822&#39; AND fdbx.is_current=TRUE AND
    db.name IN (&#39;GB_protein&#39;,&#39;REFSEQ&#39;) AND f.feature_id=fdbx.feature_id AND
    fdbx.dbxref_id=dbx.dbxref_id AND dbx.db_id=db.db_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">SYNONYMS</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, s.name AS synonym, synonym_sgml, cvt.name, p.uniquename
  FROM cvterm cvt, feature f, feature_synonym fs, synonym s, pub p
  WHERE f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.pub_id = p.pub_id AND s.type_id = cvt.cvterm_id AND
    fs.is_current = &#39;f&#39; AND f.uniquename = &#39;FBpp0086822&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">REFERENCES</td>
</tr>
<tr class="odd">
<td>Primary</td>
<td>

<pre class="de1"><code>SELECT p.uniquename, p.miniref, p.title
  FROM feature f, pub p, feature_pub fp
  WHERE f.uniquename = &#39;FBpp0086822&#39; AND f.feature_id=fp.feature_id AND
    fp.pub_id=p.pub_id;</code></pre>

</td>
</tr>
</tbody>
</table>

## FlyBase Insertion Report

**Example report:**
<a href="http://flybase.org/reports/FBti0000001.html"

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">GENERAL INFORMATION [unattributed]</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Symbol</td>
<td>

<pre class="de1"><code>SELECT DISTINCT(s.synonym_sgml)
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt
  WHERE f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt.cvterm_id AND cvt.name = &#39;symbol&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Species</td>
<td>

<pre class="de1"><code>SELECT o.genus, o.species
  FROM feature f, organism o
  WHERE f.is_obsolete = &#39;f&#39; AND f.uniquename =&#39;FBti0000001&#39; AND
    f.organism_id = o.organism_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Name</td>
<td></td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td></td>
</tr>
<tr class="odd">
<td>Feature type</td>
<td>

<pre class="de1"><code>SELECT cvterm.name
  FROM feature f, cvterm
  WHERE f.type_id=cvterm.cvterm_id AND f.uniquename = &#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Created\ Updated</td>
<td>

<pre class="de1"><code>SELECT timeaccessioned, timelastmodified
  FROM feature f
  WHERE uniquename = &#39;FBti0000001&#39; AND is_obsolete=&#39;f&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">DESCRIPTION [unattributed]</td>
</tr>
<tr class="even">
<td>Inserted element</td>
<td>

<pre class="de1"><code>SELECT fp.name
  FROM feature f, feature fp, feature_relationship fr
  WHERE fr.subject_id=f.feature_id AND fr.object_id=fp.feature_id AND
    fr.type_id=27 AND f.uniquename=&#39;FBti0000001&#39; AND
    f.is_obsolete=&#39;f&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Affected gene(s)</td>
<td>

<pre class="de1"><code>SELECT fg.name
  FROM feature fg, feature f, feature_relationship fr, cvterm cvt
  WHERE fr.subject_id=fg.feature_id AND f.feature_id=fr.object_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;associated_with&#39; AND
    fg.type_id=219 AND fg.uniquename LIKE &#39;FBgn%&#39; AND
    fg.organism_id=f.organism_id AND f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Causes allele(s)</td>
<td>

<pre class="de1"><code>SELECT fg.name
  FROM feature fg, feature f, feature_relationship fr, cvterm cvt
  WHERE fr.subject_id=fg.feature_id AND f.feature_id=fr.object_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;associated_with&#39; AND
    fg.type_id=219 AND fg.uniquename LIKE &#39;FBal%&#39; AND
    fg.organism_id=f.organism_id AND f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>LINE ID</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE cvt.name=&#39;originating_line&#39; AND cvt.cvterm_id=fp.type_id AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39; AND
    fp.feature_id=f.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Localized function</td>
<td></td>
</tr>
<tr class="odd">
<td>Expression data</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND f.uniquename=&#39;FBti0000001&#39; AND
    f.is_obsolete=&#39;f&#39; AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_expression_data&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Viability/fertility</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND f.uniquename=&#39;FBti0000001&#39; AND
    f.is_obsolete=&#39;f&#39; AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;curated_phenotype&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Stock availability</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">GENOMIC LOCATION [unattributed]</td>
</tr>
<tr class="odd">
<td>Chromosomal location [part 1: arm]</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND f.uniquename=&#39;FBti0000001&#39; AND
    f.is_obsolete=&#39;f&#39; AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_chromosome_location&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Chromosomal location [part 2: cytol]</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND f.uniquename=&#39;FBti0000001&#39; AND
    f.is_obsolete=&#39;f&#39; AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_genomic_cyto_location&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Sequence location</td>
<td>

<pre class="de1"><code>SELECT src.uniquename fl.fmin, fl.fmax
  FROM feature f, featureloc fl, feature src
  WHERE fl.feature_id=f.feature_id AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39; AND fl.srcfeature_id=src.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Map (GBrowse)</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">DETAILED MAPPING DATA</td>
</tr>
<tr class="even">
<td>Chromosome (arm)</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, feature f, cvterm cvt, pub, featureprop_pub frp
  WHERE fp.feature_id=f.feature_id AND f.uniquename=&#39;FBti0000001&#39; AND
    f.is_obsolete=&#39;f&#39; AND fp.type_id=cvt.cvterm_id AND
    frp.pub_id=pub.pub_id AND frp.featureprop_id=fp.featureprop_id AND
    cvt.name=&#39;curated_chromosomal_location&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Sequence location</td>
<td>

<pre class="de1"><code>SELECT src.uniquename fl.fmin, fl.fmax, pub.uniquename
  FROM feature f, featureloc fl,featureloc_pub, flp, pub,
     feature src
  WHERE fl.feature_id=f.feature_id AND flp.pub_id=pub.pub_id AND
    flp.featureloc_id=fl.featureloc_id AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39; AND fl.srcfeature_id=src.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Orientation</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, featureprop_pub, fpp, pub, feature f,
     cvterm cvt
  WHERE fp.feature_id=f.feature_id AND fpp.featureprop_id=fp.featureprop_id AND
    pub.pub_id=fpp.pub_id AND f.uniquename=&#39;FBti0000001&#39; AND
    f.is_obsolete=&#39;f&#39; AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;chromosomal_orientation&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Cytological location (computed by FlyBase)</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND f.uniquename=&#39;FBti0000001&#39; AND
    f.is_obsolete=&#39;f&#39; AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_compute_cyto_location&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Cytological location (reported)</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, feature f, cvterm cvt, pub, featureprop_pub frp
  WHERE fp.feature_id=f.feature_id AND f.uniquename=&#39;FBti0000001&#39; AND
    f.is_obsolete=&#39;f&#39; AND fp.type_id=cvt.cvterm_id AND
    frp.pub_id=pub.pub_id AND frp.featureprop_id=fp.featureprop_id AND
    cvt.name=&#39;curated_cytological_location&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Comments concerning location</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, feature f, cvterm cvt, pub, featureprop_pub frp
  WHERE fp.feature_id=f.feature_id AND f.uniquename=&#39;FBti0000001&#39; AND
    f.is_obsolete=&#39;f&#39; AND fp.type_id=cvt.cvterm_id AND
    frp.pub_id=pub.pub_id AND frp.featureprop_id=fp.featureprop_id AND
    cvt.name=&#39;gen_loc_comment&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Chromosome in situ</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">SEQUENCE DATA</td>
</tr>
<tr class="even">
<td>Flanking sequence</td>
<td>

<pre class="de1"><code>SELECT fo.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, cvterm cvt2
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;associated_with&#39; AND
    fo.type_id= cvt2.cvterm_id AND cvt2.name=&#39;transposable_element_flanking_region&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">INSERTED ELEMENT</td>
</tr>
<tr class="even">
<td>Construct</td>
<td>

<pre class="de1"><code>SELECT fo.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, cvterm cvt2
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;producedby&#39; AND
    fo.type_id= cvt2.cvterm_id AND cvt2.name!=&#39;natural_transposon&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Location-dependent role</td>
<td></td>
</tr>
<tr class="even">
<td>Size</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, feature_relationship fr, feature ft, featureprop fp, cvterm cvt,
     cvterm cvt2
  WHERE f.feature_id=fr.subject_id AND fr.object_id=ft.feature_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;producedby&#39; AND
    ft.feature_id=fp.feature_id AND fp.type_id=cvt2.cvterm_id AND
    (cvt2.name=&#39;compiled_kb_length&#39; OR cvt2.name=&#39;kb_length&#39;) AND
    f1.is_obsolete=&#39;f&#39; AND f1.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Associated alleles</td>
<td>

<pre class="de1"><code>SELECT fp.name
  FROM feature f, feature_relationship fr1, feature_relationship fr2, feature fp, cvterm c1,
     cvterm c2
  WHERE fr1.type_id=c1.cvterm_id AND c1.name=&#39;producedby&#39; AND
    f.feature_id=fr1.subject_id AND fr1.object_id=fr2.object_id AND
    fr2.object_id=fp.feature_id AND fr2.type_id=c2.cvterm_id AND
    c2.name=&#39;derived_tp_assoc_alleles&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Molecular map</td>
<td></td>
</tr>
<tr class="odd">
<td>Transposon class</td>
<td></td>
</tr>
<tr class="even">
<td>Element type</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">AFFECTED GENES</td>
</tr>
<tr class="even">
<td>Insertion within gene</td>
<td></td>
</tr>
<tr class="odd">
<td>Insertion may affect gene</td>
<td>

<pre class="de1"><code>SELECT fo.uniquename, pub.uniquename
  FROM feature fo, feature f, feature_relationship fr, feature_relationship_pub frp, pub,
     cvterm cvt
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;associated_with&#39; frp.feature_relationship_id=fr.feature_relationship_id AND
    frp.pub_id=pub.pub_id AND fo.uniquename LIKE &#39;FBgn%&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Orientation (relative to gene)</td>
<td>

<pre class="de1"><code>SELECT fo.name, frp.VALUE, pub.uniquename
  FROM feature fo, feature f, feature_relationship fr, feature_relationshipprop frp, feature_relationshipprop_pub frpp,
     pub, cvterm cvt, cvterm cvt2
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;associated_with&#39; AND
    fo.uniquename LIKE &#39;FBgn%&#39; AND frp.feature_relationshipprop_id=frpp.feature_relationshipprop_id AND
    frpp.pub_id=pub.pub_id AND fr.feature_relationship_id=frp.feature_relationship_id AND
    frp.type_id= cvt2.cvterm_id AND cvt2.name=&#39;relative_orientation&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">ALLELES AND PHENOTYPES</td>
</tr>
<tr class="even">
<td>Causes alleles</td>
<td>

<pre class="de1"><code>SELECT fo.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;associated_with&#39; AND
    fo.uniquename LIKE &#39;FBal%&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Lethality (table)</td>
<td></td>
</tr>
<tr class="even">
<td>Sterility (table)</td>
<td></td>
</tr>
<tr class="odd">
<td>Phenotype manifest in</td>
<td></td>
</tr>
<tr class="even">
<td>Detailed description</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">EXPRESSION DATA</td>
</tr>
<tr class="even">
<td>[Transcript]</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Reporter expression</td>
</tr>
<tr class="even">
<td>Stage</td>
<td></td>
</tr>
<tr class="odd">
<td>Tissue/Position</td>
<td></td>
</tr>
<tr class="even">
<td>Reference</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Additional Information</td>
</tr>
<tr class="even">
<td>Statement</td>
<td></td>
</tr>
<tr class="odd">
<td>Reference</td>
<td></td>
</tr>
<tr class="even">
<td>Assay mode</td>
<td></td>
</tr>
<tr class="odd">
<td>Marker for</td>
<td></td>
</tr>
<tr class="even">
<td>Reflects expression of</td>
<td></td>
</tr>
<tr class="odd">
<td>EXTERNAL IMAGES</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">DATA ON GENETIC LINE</td>
</tr>
<tr class="odd">
<td>Line ID</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, featureprop_pub frp, pub, feature f, cvterm cvt
  WHERE cvt.name=&#39;originating_line&#39; AND cvt.cvterm_id=fp.type_id AND
    frp.featureprop_id=fp.featureprop_id AND frp.pub_id=pub.pub_id AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39; AND
    fp.feature_id=f.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Origin as multiple insertion line</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp,featureprop_pub frp, pub, feature f, cvterm cvt
  WHERE cvt.name=&#39;is_multiple_insertion_line&#39; AND frp.featureprop_id=fp.featureprop_id AND
    frp.pub_id=pub.pub_id AND cvt.cvterm_id=fp.type_id AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39; AND
    fp.feature_id=f.feature_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">PROGENITOR(S) WITHIN GENOME</td>
</tr>
<tr class="even">
<td> </td>
<td></td>
</tr>
<tr class="odd">
<td>Transposed descendant of</td>
<td>

<pre class="de1"><code>SELECT fo.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, cvterm cvt2
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;transposed_descendant_of&#39; AND
    fo.type_id= cvt2.cvterm_id AND cvt2.name=&#39;transgenic_transposon_insertion_site&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Recombinant descendant of (donor)</td>
<td>

<pre class="de1"><code>SELECT fo.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, cvterm cvt2
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;recombinant_descendant_of&#39; AND
    fo.type_id= cvt2.cvterm_id AND cvt2.name=&#39;transgenic_transposon_insertion_site&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Replacement descendant of (target)</td>
<td>

<pre class="de1"><code>SELECT fo.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, cvterm cvt2
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;replacement_descendant_of&#39; AND
    fo.type_id= cvt2.cvterm_id AND cvt2.name=&#39;transgenic_transposon_insertion_site&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Modified descendant of</td>
<td>

<pre class="de1"><code>SELECT fo.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, cvterm cvt2
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;modified_descendant_of&#39; AND
    fo.type_id= cvt2.cvterm_id AND cvt2.name=&#39;transgenic_transposon_insertion_site&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">RELATED ABERRATION OR BALANCER</td>
</tr>
<tr class="even">
<td>Aberration</td>
<td>

<pre class="de1"><code>SELECT fo.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, cvterm cvt2
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;associated_with&#39; AND
    fo.type_id= cvt2.cvterm_id AND cvt2.name=&#39;chromosome_structure_variation&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Balancer</td>
<td>

<pre class="de1"><code>SELECT fo.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, cvterm cvt2
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;associated_with&#39; AND
    fo.type_id= cvt2.cvterm_id AND cvt2.name=&#39;single balancer&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">STOCKS</td>
</tr>
<tr class="odd">
<td>Bloomington</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_stock_Bloomington&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Kyoto</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_stock_Kyoto&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Szeged</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_stock_Szeged&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Tucson</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_stock_Tucson&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Carpenter</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_stock_Carpenter&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Garcia-Bellido</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_stock_Garcia-Bellido&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Harvard</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_stock_Harvard&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Nusslein-Volhard</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_stock_Nusslein-Volhard&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Saxton</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM featureprop fp, feature f, cvterm cvt
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;derived_stock_Saxton&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Notes on availability</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, feature f, featureprop_pub frp, cvterm cvt, pub
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;availability&#39; AND pub.pub_id=frp.pub_id AND
    frp.featureprop_id=fp.featureprop_id AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">LINK OUTS</td>
</tr>
<tr class="even">
<td>DrosDel</td>
<td></td>
</tr>
<tr class="odd">
<td>FlyView</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">COMMENTS</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, feature f, featureprop_pub frp, cvterm cvt, pub
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;comment&#39; AND pub.pub_id=frp.pub_id AND
    frp.featureprop_id=fp.featureprop_id AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">SYNONYMS AND SECONDARY IDs</td>
</tr>
<tr class="odd">
<td colspan="2">REPORTED AS</td>
</tr>
<tr class="even">
<td>Symbol Synonym</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml, pub.uniquename
  FROM feature_synonym fs, feature f, synonym s, pub
  WHERE fs.feature_id=f.feature_id AND fs.synonym_id=s.synonym_id AND
    fs.is_internal=&#39;f&#39; AND fs.pub_id=pub.pub_id AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">SECONDARY FLYBASE IDs</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT dbxref.accession
  FROM dbxref, feature_dbxref fd, feature f, db
  WHERE f.feature_id=fd.feature_id AND dbxref.dbxref_id=fd.dbxref_id AND
    fd.is_current=&#39;f&#39; AND dbxref.db_id=db.db_id AND
    db.name=&#39;FlyBase&#39; AND f.uniquename=&#39;FBti0000001&#39; AND
    f.is_obsolete=&#39;f&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">REFERENCES</td>
</tr>
<tr class="even">
<td>Research paper</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name AS pub_type, p.uniquename AS FBrf_id, miniref AS citation
  FROM feature f, feature_pub fp, pub p, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.pub_id = p.pub_id AND
    p.type_id = cvt.cvterm_id AND f.uniquename = &#39;FBti0000001&#39; ORDER BY cvt.name;</code></pre>

</td>
</tr>
<tr class="odd">
<td>High-throughput resource research paper</td>
<td></td>
</tr>
<tr class="even">
<td>Supplementary<br />
material</td>
<td></td>
</tr>
<tr class="odd">
<td>FlyBase analysis</td>
<td></td>
</tr>
<tr class="even">
<td>Computer file</td>
<td></td>
</tr>
<tr class="odd">
<td>Review</td>
<td></td>
</tr>
<tr class="even">
<td>Abstract</td>
<td></td>
</tr>
<tr class="odd">
<td>Other</td>
<td></td>
</tr>
</tbody>
</table>

## FlyBase Clone Report

**Example report:**
<a href="http://flybase.org/reports/FBcl0000001.html"

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">General information</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Symbol</td>
<td>

<pre class="de1"><code>SELECT name
  FROM feature
  WHERE uniquename = &#39;FBcl0000001&#39; AND is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="even">
<td>Species</td>
<td>

<pre class="de1"><code>SELECT o.genus, o.species
  FROM feature f, organism o
  WHERE f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBcl0000001&#39; AND
    f.organism_id = o.organism_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT name
  FROM feature
  WHERE uniquename = &#39;FBcl0000001&#39; AND is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT uniquename
  FROM feature
  WHERE uniquename = &#39;FBcl0000001&#39; AND is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Feature type</td>
<td>

<pre class="de1"><code>SELECT cvt.NAME
  FROM feature f, cvterm cvt
  WHERE f.uniquename = &#39;FBcl0000001&#39; AND f.is_obsolete=FALSE AND
    f.type_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Created/Updated</td>
<td>

<pre class="de1"><code>SELECT timeaccessioned, timelastmodified
  FROM feature
  WHERE uniquename = &#39;FBcl0000001&#39; AND is_obsolete=FALSE;</code></pre>

</td>
</tr>
<tr class="odd">
<td>(Computed) gene</td>
<td>

<pre class="de1"><code>SELECT DISTINCT g.name
  FROM feature c, feature evidence, feature tr, feature g, feature_relationship fr1,
     feature_relationship fr2, feature_relationship fr3, cvterm evidence_type, cvterm fr2_type, cvterm g_type
  WHERE c.uniquename=&#39;FBcl0000001&#39; AND evidence_type.name IN (&#39;cDNA&#39;,&#39;EST&#39;) AND
    fr2_type.name=&#39;supports&#39; AND g_type.name = &#39;gene&#39; AND
    c.feature_id=fr1.object_id AND fr1.subject_id=evidence.feature_id AND
    evidence.type_id=evidence_type.cvterm_id AND evidence.feature_id=fr2.subject_id AND
    fr2.type_id=fr2_type.cvterm_id AND fr2.object_id=tr.feature_id AND
    tr.feature_id=fr3.subject_id AND fr3.object_id=g.feature_id AND
    g.type_id=g_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Collection Status</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;status&#39; AND f.uniquename = &#39;FBcl0000003&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Known Problems</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;problem&#39; AND f.uniquename = &#39;FBcl0000248&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Library</td>
<td>

<pre class="de1"><code>SELECT l.name
  FROM feature f, library_feature lf, library l
  WHERE f.uniquename=&#39;FBcl0000001&#39; AND f.feature_id=lf.feature_id AND
    lf.library_id=l.library_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Strain</td>
<td>

<pre class="de1"><code>SELECT lp.VALUE
  FROM feature f, library_feature lf, library l, libraryprop lp, cvterm lp_type
  WHERE f.uniquename=&#39;FBcl0394020&#39; AND lp_type.name=&#39;strain&#39; AND
    f.feature_id=lf.feature_id AND lf.library_id=l.library_id AND
    l.library_id=lp.library_id AND lp.type_id=lp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Stage</td>
<td>

<pre class="de1"><code>SELECT lbp.VALUE FROM feature f, library_feature lf, library l, libraryprop lbp, cvterm cvt WHERE f.uniquename=&#39;FBcl0000001&#39; AND
  cvt.name=&#39;stage&#39; AND f.feature_id=lf.feature_id AND  lf.library_id=l.library_id AND
  l.library_id=lbp.library_id AND lbp.type_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Tissue Source</td>
<td>

<pre class="de1"><code>SELECT DISTINCT cvt.name FROM feature f, library_feature lf, library l, library_cvterm lcvt, cvterm cvt, cv
  WHERE f.uniquename=&#39;FBcl0000001&#39; AND cv.name IN (&#39;FlyBase anatomy CV&#39;,&#39;cellular_component&#39;) AND
  f.feature_id=lf.feature_id AND lf.library_id=l.library_id AND l.library_id=lcvt.library_id AND lcvt.cvterm_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Vector</td>
<td>

<pre class="de1"><code>SELECT DISTINCT s.synonym_sgml
  FROM feature cl, feature vector, feature_relationship fr, feature_synonym fs, synonym s,
     cvterm fs_type, cvterm vector_type
  WHERE cl.uniquename = &#39;FBcl0000001&#39; AND fs.is_current = TRUE AND
    fs.is_internal = FALSE AND fs_type.NAME = &#39;symbol&#39; AND
    vector_type.name=&#39;engineered_construct&#39; AND cl.feature_id=fr.object_id AND
    fr.subject_id=vector.feature_id AND vector.type_id=vector_type.cvterm_id AND
    vector.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    s.type_id = fs_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">INSERT SEQUENCE DATA</td>
</tr>
<tr class="even">
<td colspan="2">Full length sequence</td>
</tr>
<tr class="odd">
<td>Total bases</td>
<td>

<pre class="de1"><code>SELECT fls.seqlen
  FROM feature cl, feature fls, feature_relationship fr, cvterm fls_type
  WHERE cl.uniquename=&#39;FBcl0000003&#39; AND fls_type.name IN (&#39;cDNA&#39;,&#39;BAC_cloned_genomic_insert&#39;) AND
    cl.feature_id=fr.object_id AND fr.subject_id=fls.feature_id AND
    fls.type_id=fls_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Submission date</td>
<td></td>
</tr>
<tr class="odd">
<td>Genbank</td>
<td>

<pre class="de1"><code>SELECT dbx.accession
  FROM feature cl, feature fls, feature_relationship fr, cvterm fls_type, feature_dbxref fdbx,
     dbxref dbx, db
  WHERE cl.uniquename=&#39;FBcl0000003&#39; AND fls_type.name IN (&#39;cDNA&#39;,&#39;BAC_cloned_genomic_insert&#39;) AND
    db.name=&#39;GB&#39; AND fdbx.is_current=TRUE AND
    cl.feature_id=fr.object_id AND fr.subject_id=fls.feature_id AND
    fls.type_id=fls_type.cvterm_id AND fls.feature_id=fdbx.feature_id AND
    fdbx.dbxref_id=dbx.dbxref_id AND dbx.db_id=db.db_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>sequence data</td>
<td>

<pre class="de1"><code>SELECT fls.residues
  FROM feature cl, feature fls, feature_relationship fr, cvterm fls_type
  WHERE cl.uniquename=&#39;FBcl0000003&#39; AND fls_type.name IN (&#39;cDNA&#39;,&#39;BAC_cloned_genomic_insert&#39;) AND
    cl.feature_id=fr.object_id AND fr.subject_id=fls.feature_id AND
    fls.type_id=fls_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">5prime sequence</td>
</tr>
<tr class="even">
<td>Total bases</td>
<td>

<pre class="de1"><code>SELECT fiveps.seqlen
  FROM feature cl, feature fiveps, feature_relationship fr, cvterm fiveps_type
  WHERE cl.uniquename=&#39;FBcl0000001&#39; AND fiveps_type.name=&#39;EST&#39; AND
    fiveps.is_obsolete=FALSE AND (fiveps.name LIKE &#39;%5prime&#39; OR
    fiveps.name LIKE &#39;%contig1&#39;) AND cl.feature_id=fr.object_id AND
    fr.subject_id=fiveps.feature_id AND fiveps.type_id=fiveps_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>High quality bases</td>
<td></td>
</tr>
<tr class="even">
<td>Submission date</td>
<td></td>
</tr>
<tr class="odd">
<td>dbEST</td>
<td></td>
</tr>
<tr class="even">
<td>Genbank</td>
<td>

<pre class="de1"><code>SELECT DISTINCT dbx.accession
  FROM feature cl, feature fiveps, feature_relationship fr, cvterm fiveps_type, feature_dbxref fdbx,
     dbxref dbx, db
  WHERE cl.uniquename=&#39;FBcl0000001&#39; AND fiveps_type.name=&#39;EST&#39; AND
    db.name=&#39;GB&#39; AND fdbx.is_current=TRUE AND
    fiveps.is_obsolete=FALSE AND (fiveps.name LIKE &#39;%5prime&#39; OR
    fiveps.name LIKE &#39;%contig1&#39;) AND cl.feature_id=fr.object_id AND
    fr.subject_id=fiveps.feature_id AND fiveps.type_id=fiveps_type.cvterm_id AND
    fiveps.feature_id=fdbx.feature_id AND fdbx.dbxref_id=dbx.dbxref_id AND
    dbx.db_id=db.db_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>5prime<br />
sequence data</td>
<td>

<pre class="de1"><code>SELECT fiveps.residues
  FROM feature cl, feature fiveps, feature_relationship fr, cvterm fiveps_type
  WHERE cl.uniquename=&#39;FBcl0000001&#39; AND fiveps_type.name=&#39;EST&#39; AND
    fiveps.is_obsolete=FALSE AND (fiveps.name LIKE &#39;%5prime&#39; OR
    fiveps.name LIKE &#39;%contig1&#39;) AND cl.feature_id=fr.object_id AND
    fr.subject_id=fiveps.feature_id AND fiveps.type_id=fiveps_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">3prime sequence</td>
</tr>
<tr class="odd">
<td>Total bases</td>
<td>

<pre class="de1"><code>SELECT threeps.seqlen
  FROM feature cl, feature threeps, feature_relationship fr, cvterm threeps_type
  WHERE cl.uniquename=&#39;FBcl0000002&#39; AND threeps_type.name=&#39;EST&#39; AND
    threeps.is_obsolete=FALSE AND (threeps.name LIKE &#39;%3prime&#39; OR
    threeps.name LIKE &#39;%contig2&#39;) AND cl.feature_id=fr.object_id AND
    fr.subject_id=threeps.feature_id AND threeps.type_id=threeps_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>High quality bases</td>
<td></td>
</tr>
<tr class="odd">
<td>Submission date</td>
<td></td>
</tr>
<tr class="even">
<td>dbEST</td>
<td></td>
</tr>
<tr class="odd">
<td>Genbank</td>
<td>

<pre class="de1"><code>SELECT DISTINCT dbx.accession
  FROM feature cl, feature threeps, feature_relationship fr, cvterm threeps_type, feature_dbxref fdbx,
     dbxref dbx, db
  WHERE cl.uniquename=&#39;FBcl0000002&#39; AND threeps_type.name=&#39;EST&#39; AND
    db.name=&#39;GB&#39; AND fdbx.is_current=TRUE AND
    threeps.is_obsolete=FALSE AND (threeps.name LIKE &#39;%3prime&#39; OR
    threeps.name LIKE &#39;%contig2&#39;) AND cl.feature_id=fr.object_id AND
    fr.subject_id=threeps.feature_id AND threeps.type_id=threeps_type.cvterm_id AND
    threeps.feature_id=fdbx.feature_id AND fdbx.dbxref_id=dbx.dbxref_id AND
    dbx.db_id=db.db_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>3prime<br />
sequence data</td>
<td>

<pre class="de1"><code>SELECT threeps.residues
  FROM feature cl, feature threeps, feature_relationship fr, cvterm threeps_type
  WHERE cl.uniquename=&#39;FBcl0000002&#39; AND threeps_type.name=&#39;EST&#39; AND
    threeps.is_obsolete=FALSE AND (threeps.name LIKE &#39;%3prime&#39; OR
    threeps.name LIKE &#39;%contig2&#39;) AND cl.feature_id=fr.object_id AND
    fr.subject_id=threeps.feature_id AND threeps.type_id=threeps_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Partial sequence</td>
</tr>
<tr class="even">
<td>Total bases</td>
<td>

<pre class="de1"><code>SELECT partial.seqlen
  FROM feature cl, feature partial, feature_relationship fr, cvterm partial_type
  WHERE cl.uniquename=&#39;FBcl0000111&#39; AND partial_type.name=&#39;EST&#39; AND
    partial.is_obsolete=FALSE AND partial.name !~ &#39;(5prime|contig1|3prime|contig2)$&#39; AND
    cl.feature_id=fr.object_id AND fr.subject_id=partial.feature_id AND
    partial.type_id=partial_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>High quality bases</td>
<td></td>
</tr>
<tr class="even">
<td>Submission date</td>
<td></td>
</tr>
<tr class="odd">
<td>dbEST</td>
<td></td>
</tr>
<tr class="even">
<td>Genbank</td>
<td>

<pre class="de1"><code>SELECT DISTINCT dbx.accession
  FROM feature cl, feature partial, feature_relationship fr, cvterm partial_type, feature_dbxref fdbx,
     dbxref dbx, db
  WHERE cl.uniquename=&#39;FBcl0000111&#39; AND partial_type.name=&#39;EST&#39; AND
    db.name=&#39;GB&#39; AND fdbx.is_current=TRUE AND
    partial.is_obsolete=FALSE AND partial.name !~ &#39;(5prime|contig1|3prime|contig2)$&#39; AND
    cl.feature_id=fr.object_id AND fr.subject_id=partial.feature_id AND
    partial.type_id=partial_type.cvterm_id AND partial.feature_id=fdbx.feature_id AND
    fdbx.dbxref_id=dbx.dbxref_id AND dbx.db_id=db.db_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Partial<br />
sequence data</td>
<td>

<pre class="de1"><code>SELECT partial.residues
  FROM feature cl, feature partial, feature_relationship fr, cvterm partial_type
  WHERE cl.uniquename=&#39;FBcl0000111&#39; AND partial_type.name=&#39;EST&#39; AND
    partial.is_obsolete=FALSE AND partial.name !~ &#39;(5prime|contig1|3prime|contig2)$&#39; AND
    cl.feature_id=fr.object_id AND fr.subject_id=partial.feature_id AND
    partial.type_id=partial_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">SEQUENCING PRIMERS</td>
</tr>
<tr class="odd">
<td>Forward</td>
<td></td>
</tr>
<tr class="even">
<td>Reverse</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">VECTOR INFORMATION</td>
</tr>
<tr class="even">
<td>Vector map<br />
&amp; Polylinker</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">COMMENTS</td>
</tr>
<tr class="even">
<td> </td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">VECTOR SEQUENCE</td>
</tr>
<tr class="even">
<td> </td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">VECTOR SYNONYMS AND SECONDARY IDs</td>
</tr>
<tr class="even">
<td colspan="2">REPORTED AS</td>
</tr>
<tr class="odd">
<td>Symbol Synonym</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">SECONDARY FLYBASE IDs</td>
</tr>
<tr class="odd">
<td> </td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">VECTOR REFERENCES</td>
</tr>
<tr class="odd">
<td>Research paper</td>
<td></td>
</tr>
<tr class="even">
<td>Supplementary<br />
material</td>
<td></td>
</tr>
<tr class="odd">
<td>Review</td>
<td></td>
</tr>
<tr class="even">
<td>Abstract</td>
<td></td>
</tr>
<tr class="odd">
<td>Other</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">LIBRARY INFORMATION</td>
</tr>
<tr class="odd">
<td>Comments</td>
<td>

<pre class="de1"><code>SELECT lp.VALUE
  FROM feature f, library_feature lf, library l, libraryprop lp, cvterm lp_type
  WHERE f.uniquename=&#39;FBcl0000111&#39; AND lp_type.name=&#39;comment&#39; AND
    f.feature_id=lf.feature_id AND lf.library_id=l.library_id AND
    l.library_id=lp.library_id AND lp.type_id=lp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">LIBRARY SYNONYMS AND SECONDARY IDs</td>
</tr>
<tr class="odd">
<td colspan="2">REPORTED AS</td>
</tr>
<tr class="even">
<td>Symbol Synonym</td>
<td>

<pre class="de1"><code>SELECT DISTINCT s.synonym_sgml
  FROM feature f, library_feature lf, library l, library_synonym ls, synonym s
  WHERE f.uniquename=&#39;FBcl0000111&#39; AND f.feature_id=lf.feature_id AND
    lf.library_id=l.library_id AND l.library_id=ls.library_id AND
    ls.synonym_id=s.synonym_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">SECONDARY FLYBASE IDs</td>
</tr>
<tr class="even">
<td> </td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">LIBRARY REFERENCES</td>
</tr>
<tr class="even">
<td>Research paper</td>
<td>

<pre class="de1"><code>SELECT p.uniquename
  FROM feature f, library_feature lf, library l, library_pub lp, pub p
  WHERE f.uniquename=&#39;FBcl0000111&#39; AND f.feature_id=lf.feature_id AND
    lf.library_id=l.library_id AND l.library_id=lp.library_id AND
    lp.pub_id=p.pub_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Supplementary<br />
material</td>
<td>same as above use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Review</td>
<td>same as above use pub type to distinguish</td>
</tr>
<tr class="odd">
<td>Abstract</td>
<td>same as above use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Other</td>
<td>same as above use pub type to distinguish</td>
</tr>
<tr class="odd">
<td colspan="2">COMMENTS</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;comment&#39; AND f.uniquename = &#39;FBcl0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">SYNONYMS AND SECONDARY IDs</td>
</tr>
<tr class="even">
<td colspan="2">REPORTED AS</td>
</tr>
<tr class="odd">
<td>Symbol Synonym</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, s.name AS synonym, synonym_sgml, cvt.name, p.uniquename
  FROM cvterm cvt, feature f, feature_synonym fs, synonym s, pub p
  WHERE f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.pub_id = p.pub_id AND s.type_id = cvt.cvterm_id AND
    fs.is_current = &#39;f&#39; AND f.uniquename = &#39;FBcl0000001&#39; AND
    cvt.name=&#39;symbol&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Name Synonym</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, s.name AS synonym, synonym_sgml, cvt.name, p.uniquename
  FROM cvterm cvt, feature f, feature_synonym fs, synonym s, pub p
  WHERE f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.pub_id = p.pub_id AND s.type_id = cvt.cvterm_id AND
    fs.is_current = &#39;f&#39; AND f.uniquename = &#39;FBcl0000001&#39; AND
    cvt.name=&#39;fullname&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">SECONDARY FLYBASE IDs</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT dbxref.accession
  FROM dbxref, feature_dbxref fd, feature f, db
  WHERE f.feature_id=fd.feature_id AND dbxref.dbxref_id=fd.dbxref_id AND
    fd.is_current=&#39;f&#39; AND dbxref.db_id=db.db_id AND
    db.name=&#39;FlyBase&#39; AND f.uniquename=&#39;FBcl0006217&#39; AND
    f.is_obsolete=&#39;f&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">REFERENCES</td>
</tr>
<tr class="even">
<td>Research paper</td>
<td>

<pre class="de1"><code>SELECT p.uniquename, p.miniref, p.title
  FROM feature f, pub p, feature_pub fp
  WHERE f.uniquename = &#39;FBcl0006217&#39; AND f.feature_id=fp.feature_id AND
    fp.pub_id=p.pub_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Supplementary<br />
material</td>
<td>same as above use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Review</td>
<td>same as above use pub type to distinguish</td>
</tr>
<tr class="odd">
<td>Abstract</td>
<td>same as above use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Other</td>
<td>same as above use pub type to distinguish</td>
</tr>
</tbody>
</table>

## FlyBase Stock Report

**Example report:**
<a href="http://flybase.org/reports/FBst0000001.html"

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">GENERAL INFORMATION</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<th>Collection</th>
<td>

<pre class="de1"><code>SELECT sc.uniquename
  FROM stock s, stockcollection_stock scs, stockcollection sc
  WHERE s.uniquename=&#39;FBst0000001&#39; AND s.stock_id=scs.stock_id AND
    scs.stockcollection_id=sc.stockcollection_id;</code></pre>

</td>
</tr>
<tr class="even">
<th>Collection Type</th>
<td>

<pre class="de1"><code>SELECT sc_type.name
  FROM stock s, stockcollection_stock scs, stockcollection sc, cvterm sc_type
  WHERE s.uniquename=&#39;FBst0000001&#39; AND s.stock_id=scs.stock_id AND
    scs.stockcollection_id=sc.stockcollection_id AND sc.type_id=sc_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<th>Stock Number</th>
<td>

<pre class="de1"><code>SELECT name
  FROM stock s
  WHERE s.uniquename=&#39;FBst0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<th>Species</th>
<td>

<pre class="de1"><code>SELECT genus,species
  FROM stock s, organism o
  WHERE s.uniquename=&#39;FBst0000001&#39; AND s.organism_id=o.organism_id;</code></pre>

</td>
</tr>
<tr class="odd">
<th>FlyBase ID</th>
<td>

<pre class="de1"><code>SELECT uniquename
  FROM stock s
  WHERE s.uniquename=&#39;FBst0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<th>Created\ Updated</th>
<td></td>
</tr>
<tr class="odd">
<th>Stock List Description</th>
<td>

<pre class="de1"><code>SELECT description
  FROM stock s
  WHERE s.uniquename=&#39;FBst0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<th>FlyBase Genotype</th>
<td>

<pre class="de1"><code>SELECT genotype.name
  FROM stock s, stock_genotype sg, genotype
  WHERE s.uniquename=&#39;FBst0000001&#39; AND s.stock_id=sg.stock_id AND
    sg.genotype_id=genotype.genotype_id;</code></pre>

</td>
</tr>
<tr class="odd">
<th>State of Stock</th>
<td>

<pre class="de1"><code>SELECT s_type.name
  FROM stock s, cvterm s_type
  WHERE s.uniquename=&#39;FBst0000001&#39; AND s.type_id=s_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<th>Classification</th>
<td>

<pre class="de1"><code>SELECT cvt.name
  FROM stock s, stock_cvterm scvt, cvterm cvt
  WHERE s.uniquename=&#39;FBst0000001&#39; AND s.stock_id=scvt.stock_id AND
    scvt.cvterm_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<th>Images</th>
<td></td>
</tr>
<tr class="even">
<th>Expression</th>
<td></td>
</tr>
<tr class="odd">
<th>To Request Stock</th>
<td>

<pre class="de1"><code>SELECT scp.VALUE
  FROM stock s, stockcollection_stock scs, stockcollection sc, stockcollectionprop scp, cvterm scp_type
  WHERE s.uniquename=&#39;FBst0000001&#39; AND scp_type.name IN (&#39;request_text&#39;, &#39;homepage_url&#39;,
       &#39;order_url&#39;, &#39;request_text&#39;,
       &#39;email_order_contact_name&#39;) AND
    s.stock_id=scs.stock_id AND scs.stockcollection_id=sc.stockcollection_id AND
    sc.stockcollection_id=scp.stockcollection_id AND scp.type_id=scp_type.cvterm_id;</code></pre>

</td>
</tr>
</tbody>
</table>

## FlyBase Aberration Report

**Example report:**
<a href="http://flybase.org/reports/FBab0000001.html"

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">GENERAL INFORMATION [unattributed]</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Symbol</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt, cvterm cvt2
  WHERE f.type_id = cvt.cvterm_id AND cvt.NAME = &#39;chromosome_structure_variation&#39; AND
    f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt2.cvterm_id AND cvt2.NAME = &#39;symbol&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBab0000001&#39; GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>Species</td>
<td>

<pre class="de1"><code>SELECT o.genus, o.species
  FROM feature f, organism o
  WHERE f.uniquename=&#39;FBab0000001&#39; AND f.organism_id=o.organism_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Name</td>
<td></td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT uniquename
  FROM feature f
  WHERE f.uniquename=&#39;FBab0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Feature type</td>
<td>

<pre class="de1"><code>SELECT c.name
  FROM feature f, cvterm c, feature_cvterm fc, feature_cvtermprop cp, cvterm c1,
     cvterm c2, pub p
  WHERE f.type_id = c1.cvterm_id AND c1.name = &#39;chromosome_structure_variation&#39; AND
    f.feature_id = fc.feature_id AND fc.cvterm_id = c.cvterm_id AND
    cp.feature_cvterm_id = fc.feature_cvterm_id AND cp.type_id = c2.cvterm_id AND
    c2.name = &#39;wt_class&#39; AND fc.pub_id = p.pub_id AND
    p.uniquename LIKE &#39;FBrf%&#39; AND f.uniquename=&#39;FBab0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Created/ Updated</td>
<td>

<pre class="de1"><code>SELECT timeaccessioned,timelastmodified
  FROM feature f
  WHERE f.uniquename=&#39;FBab0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">[additional unattributed data]</td>
</tr>
<tr class="even">
<td>Formalized<br />
genetic data</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBab0000001&#39; AND fp_type.name = &#39;computed_map&#39; AND
    f.feature_id = fp.feature_id AND fp.type_id = fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Sequence coordinates</td>
<td>

<pre class="de1"><code>SELECT s.uniquename, fmin, fmax, miniref AS citation
  FROM feature f, feature b, feature_relationship fr, cvterm cvt1, cvterm cvt2,
     featureloc fl, feature s, featureloc_pub flp, pub p
  WHERE f.uniquename = &#39;FBab0030010&#39; AND f.feature_id = fr.object_id AND
    fr.type_id = cvt1.cvterm_id AND cvt1.name = &#39;break_of&#39; AND
    fr.subject_id = b.feature_id AND b.type_id = cvt2.cvterm_id AND
    cvt2.name = &#39;breakpoint&#39; AND b.feature_id = fl.feature_id AND
    fl.srcfeature_id = s.feature_id AND fl.featureloc_id = flp.featureloc_id AND
    flp.pub_id = p.pub_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Deleted segment</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBab0000001&#39; AND fp_type.name = &#39;deleted_segment&#39; AND
    f.feature_id = fp.feature_id AND fp.type_id = fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Duplicated segment</td>
<td></td>
</tr>
<tr class="even">
<td>Computed<br />
Breakpoints include</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename LIKE &#39;FBab%&#39; AND f.organism_id = 1 AND
    fp_type.name = &#39;derived_computed_breakpoint&#39; AND f.feature_id = fp.feature_id AND
    fp.type_id = fp_type.cvterm_id UNION
SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename LIKE &#39;FBab%&#39; AND f.organism_id != 1 AND
    fp_type.name = &#39;non_Dmel_location&#39; AND f.feature_id = fp.feature_id AND
    fp.type_id = fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Breakpoints Inherited</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">NATURE OF THE ABERRATION</td>
</tr>
<tr class="odd">
<td>Cytological Order</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE , miniref AS citation
  FROM feature f, featureprop fp, cvterm fp_type, featureprop_pub fpp, pub p
  WHERE f.uniquename=&#39;FBab0044894&#39; AND fp_type.name = &#39;new_order&#39; AND
    f.feature_id = fp.feature_id AND fp.type_id = fp_type.cvterm_id AND
    fp.featureprop_id = fpp.featureprop_id AND fpp.pub_id = p.pub_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Progenitor</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature ab, feature prog, feature_relationship fr, feature_synonym fs, synonym s,
     cvterm fs_type, cvterm fr_type
  WHERE ab.uniquename = &#39;FBab0030010&#39; AND fs.is_current = &#39;t&#39; AND
    fs.is_internal = &#39;f&#39; AND fs_type.NAME = &#39;symbol&#39; AND
    fr_type.NAME=&#39;progenitor&#39; AND ab.feature_id=fr.subject_id AND
    fr.type_id=fr_type.cvterm_id AND fr.object_id=prog.feature_id AND
    prog.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    s.type_id = fs_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Mutagen</td>
<td>

<pre class="de1"><code>SELECT c.name
  FROM feature f, cvterm c, feature_cvterm fc, cvtermprop cp, cvterm c1,
     pub p
  WHERE f.type_id = c1.cvterm_id AND c1.name = &#39;chromosome_structure_variation&#39; AND
    f.feature_id = fc.feature_id AND fc.cvterm_id = c.cvterm_id AND
    c.cvterm_id = cp.cvterm_id AND cp.VALUE = &#39;origin_of_mutation&#39; AND
    fc.pub_id = p.pub_id AND p.uniquename LIKE &#39;FBrf%&#39; AND
    f.uniquename=&#39;FBab0030010&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Class of aberration<br />
(relative to progenitor)</td>
<td>

<pre class="de1"><code>SELECT c.name
  FROM feature f, cvterm c, feature_cvterm fc, feature_cvtermprop cp, cvterm c1,
     cvterm c2, pub p
  WHERE f.type_id = c1.cvterm_id AND c1.name = &#39;chromosome_structure_variation&#39; AND
    f.feature_id = fc.feature_id AND fc.cvterm_id = c.cvterm_id AND
    cp.feature_cvterm_id = fc.feature_cvterm_id AND cp.type_id = c2.cvterm_id AND
    c2.name = &#39;aberr_class&#39; AND fc.pub_id = p.pub_id AND
    p.uniquename LIKE &#39;FBrf%&#39; AND f.uniquename=&#39;FBab0030010&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Breakpoints</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, miniref AS citation
  FROM feature f, featureprop fp, cvterm fp_type , featureprop_pun fpp, pub p
  WHERE f.uniquename LIKE &#39;FBab%&#39; AND f.organism_id = 1 AND
    fp_type.name = &#39;derived_attributed_breakpoint&#39; AND f.feature_id = fp.feature_id AND
    fp.type_id = fp_type.cvterm_id AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND p.uniquename lik &#39;FBrf%&#39; UNION
SELECT fp.VALUE, miniref AS citation
  FROM feature f, featureprop fp, cvterm fp_type , featureprop_pun fpp, pub p
  WHERE f.uniquename LIKE &#39;FBab%&#39; AND f.organism_id != 1 AND
    fp_type.name = &#39;non_Dmel_location&#39; AND f.feature_id = fp.feature_id AND
    fp.type_id = fp_type.cvterm_id AND fp.featureprop_id = fpp.featureprop_id AND
    fpp.pub_id = p.pub_id AND p.uniquename lik &#39;FBrf%&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Causes alleles</td>
<td></td>
</tr>
<tr class="odd">
<td>Carries alleles</td>
<td></td>
</tr>
<tr class="even">
<td>Transposon Insertions</td>
<td></td>
</tr>
<tr class="odd">
<td>Genetic mapping information</td>
<td></td>
</tr>
<tr class="even">
<td>Comments</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">COMMENTS ON CYTOLOGY</td>
</tr>
<tr class="even">
<td> </td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">MOLECULARLY MAPPED BREAKPOINTS</td>
</tr>
<tr class="even">
<td>Symbol</td>
<td></td>
</tr>
<tr class="odd">
<td>Location</td>
<td></td>
</tr>
<tr class="even">
<td>Additional Notes</td>
<td></td>
</tr>
<tr class="odd">
<td>References</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">SEQUENCE CROSSREFERENCES</td>
</tr>
<tr class="odd">
<td>DNA sequence</td>
<td></td>
</tr>
<tr class="even">
<td>Protein sequence</td>
<td></td>
</tr>
<tr class="odd">
<td>Name</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">GENE DELETION &amp; DUPLICATION DATA</td>
</tr>
<tr class="odd">
<td colspan="2">GENES DELETED/DISRUPTED</td>
</tr>
<tr class="even">
<td colspan="2">COMPLEMENTATION DATA</td>
</tr>
<tr class="odd">
<td>Completely deleted/ disrupted</td>
<td></td>
</tr>
<tr class="even">
<td>Partially deleted/ disrupted</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">MOLECULAR DATA</td>
</tr>
<tr class="even">
<td>Completely deleted</td>
<td></td>
</tr>
<tr class="odd">
<td>Partially deleted</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">GENES NOT DELETED/DISRUPTED</td>
</tr>
<tr class="odd">
<td colspan="2">COMPLEMENTATION DATA</td>
</tr>
<tr class="even">
<td> </td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">MOLECULAR DATA</td>
</tr>
<tr class="even">
<td> </td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">GENES DUPLICATED</td>
</tr>
<tr class="even">
<td colspan="2">COMPLEMENTATION DATA</td>
</tr>
<tr class="odd">
<td>Completely duplicated</td>
<td></td>
</tr>
<tr class="even">
<td>Partially duplicated</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">MOLECULAR DATA</td>
</tr>
<tr class="even">
<td>Completely duplicated</td>
<td></td>
</tr>
<tr class="odd">
<td>Partially duplicated</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">GENES NOT DUPLICATED</td>
</tr>
<tr class="odd">
<td colspan="2">COMPLEMENTATION DATA</td>
</tr>
<tr class="even">
<td> </td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">MOLECULAR DATA</td>
</tr>
<tr class="even">
<td> </td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">RELATED COMMENTS</td>
</tr>
<tr class="even">
<td> </td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">PHENOTYPIC DATA</td>
</tr>
<tr class="even">
<td>In combination with<br />
other aberrations</td>
<td></td>
</tr>
<tr class="odd">
<td>NOT in combination with<br />
other aberrations</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">POSITION EFFECT VARIEGATION DATA</td>
</tr>
<tr class="odd">
<td>Genes<br />
subject to PEV</td>
<td></td>
</tr>
<tr class="even">
<td>Genes showing<br />
dominant PEV</td>
<td></td>
</tr>
<tr class="odd">
<td>Genes NOT<br />
subject to PEV</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">STOCKS</td>
</tr>
<tr class="odd">
<td>Bloomington</td>
<td></td>
</tr>
<tr class="even">
<td>Kyoto</td>
<td></td>
</tr>
<tr class="odd">
<td>Szeged</td>
<td></td>
</tr>
<tr class="even">
<td>Tucson</td>
<td></td>
</tr>
<tr class="odd">
<td>Carpenter</td>
<td></td>
</tr>
<tr class="even">
<td>Garcia-Bellido</td>
<td></td>
</tr>
<tr class="odd">
<td>Harvard</td>
<td></td>
</tr>
<tr class="even">
<td>Nusslein-Volhard</td>
<td></td>
</tr>
<tr class="odd">
<td>Saxton</td>
<td></td>
</tr>
<tr class="even">
<td>Notes on availability</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">NOTES ON ORIGIN</td>
</tr>
<tr class="even">
<td>Discoverer</td>
<td></td>
</tr>
<tr class="odd">
<td> </td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">BALANCER/ GENOTYPE VARIANTS OF THE ABERRATION</td>
</tr>
<tr class="odd">
<td> </td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">SEPARABLE COMPONENTS</td>
</tr>
<tr class="odd">
<td> </td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">OTHER COMMENTS</td>
</tr>
<tr class="odd">
<td> </td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">SYNONYMS AND SECONDARY IDs</td>
</tr>
<tr class="odd">
<td colspan="2">REPORTED AS</td>
</tr>
<tr class="even">
<td>Symbol Synonym</td>
<td></td>
</tr>
<tr class="odd">
<td>Name Synonym</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">SECONDARY FLYBASE IDs</td>
</tr>
<tr class="odd">
<td> </td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">REFERENCES</td>
</tr>
<tr class="odd">
<td>Research paper</td>
<td></td>
</tr>
<tr class="even">
<td>Supplementary<br />
material</td>
<td></td>
</tr>
<tr class="odd">
<td>Review</td>
<td></td>
</tr>
<tr class="even">
<td>Abstract</td>
<td></td>
</tr>
<tr class="odd">
<td>Other</td>
<td></td>
</tr>
</tbody>
</table>

## FlyBase Balancer Report

**Example report:**
<a href="http://flybase.org/reports/FBba0000005.html"

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">GENERAL INFORMATION [unattributed]</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Symbol</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt, cvterm cvt2
  WHERE f.type_id = cvt.cvterm_id AND cvt.NAME = &#39;single balancer&#39; AND
    f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt2.cvterm_id AND cvt2.NAME = &#39;symbol&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBba0000005&#39; GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>Species</td>
<td>

<pre class="de1"><code>SELECT o.genus, o.species
  FROM feature f, organism o
  WHERE f.uniquename=&#39;FBba0000005&#39; AND f.organism_id=o.organism_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT uniquename
  FROM feature f
  WHERE f.uniquename=&#39;FBba0000005&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Created/ Updated</td>
<td>

<pre class="de1"><code>SELECT timeaccessioned,timelastmodified
  FROM feature f
  WHERE f.uniquename=&#39;FBba0000005&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Short genotype</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt, cvterm cvt2
  WHERE f.type_id = cvt.cvterm_id AND cvt.NAME = &#39;single balancer&#39; AND
    f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt2.cvterm_id AND cvt2.NAME = &#39;nickname&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBba0000005&#39; GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>Parent aberration</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature ba, feature pab, feature_relationship fr, feature_synonym fs, synonym s,
     cvterm fs_type, cvterm fr_type
  WHERE ba.uniquename = &#39;FBba0000005&#39; AND fs.is_current = &#39;t&#39; AND
    fs.is_internal = &#39;f&#39; AND fs_type.NAME = &#39;symbol&#39; AND
    fr_type.NAME=&#39;variant_of&#39; AND ba.feature_id=fr.subject_id AND
    fr.type_id=fr_type.cvterm_id AND fr.object_id=pab.feature_id AND
    pab.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    s.type_id = fs_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Parent Cytology</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, feature pab, feature_relationship fr, cvterm fr_type, featureprop fp,
     cvterm fp_type
  WHERE ba.uniquename = &#39;FBba0000005&#39; AND fp_type.NAME=&#39;new_order&#39; AND
    fr_type.NAME=&#39;variant_of&#39; AND ba.feature_id=fr.subject_id AND
    fr.type_id=fr_type.cvterm_id AND fr.object_id=pab.feature_id AND
    pab.feature_id = fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Progenitor</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature ba, feature prog, feature_relationship fr, feature_synonym fs, synonym s,
     cvterm fs_type, cvterm fr_type
  WHERE ba.uniquename = &#39;FBba0000005&#39; AND fs.is_current = &#39;t&#39; AND
    fs.is_internal = &#39;f&#39; AND fs_type.NAME = &#39;symbol&#39; AND
    fr_type.NAME=&#39;progenitor&#39; AND ba.feature_id=fr.subject_id AND
    fr.type_id=fr_type.cvterm_id AND fr.object_id=prog.feature_id AND
    prog.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    s.type_id = fs_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td>(Described as Balancer)</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, p.miniref
  FROM feature ba, featureprop fp, featureprop_pub fpp, pub p, cvterm fp_type
  WHERE ba.uniquename=&#39;FBba0000005&#39; AND fp_type.NAME=&#39;balancer_status&#39; AND
    p.uniquename ~ &#39;^FBrf[0-9]+$&#39; AND ba.feature_id=fp.feature_id AND
    fp.type_id=fp_type.cvterm_id AND fp.featureprop_id=fpp.featureprop_id AND
    fpp.pub_id=p.pub_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Alleles</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature ba, feature al, feature_relationship fr, feature_synonym fs, synonym s,
     cvterm fs_type, cvterm fr_type
  WHERE ba.uniquename = &#39;FBba0000005&#39; AND fs.is_current = &#39;t&#39; AND
    fs.is_internal = &#39;f&#39; AND fs_type.NAME = &#39;symbol&#39; AND
    fr_type.NAME=&#39;carried_on&#39; AND ba.feature_id=fr.object_id AND
    fr.type_id=fr_type.cvterm_id AND fr.subject_id=al.feature_id AND
    al.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    s.type_id = fs_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Transposon Insertions</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature ba, feature ti, feature_relationship fr, feature_synonym fs, synonym s,
     cvterm fs_type, cvterm fr_type
  WHERE ba.uniquename = &#39;FBba0000473&#39; AND fs.is_current = &#39;t&#39; AND
    fs.is_internal = &#39;f&#39; AND fs_type.NAME = &#39;symbol&#39; AND
    fr_type.NAME=&#39;associated_with&#39; AND ba.feature_id=fr.subject_id AND
    fr.type_id=fr_type.cvterm_id AND fr.object_id=ti.feature_id AND
    ti.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    s.type_id = fs_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>Discoverer</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, featureprop fp, cvterm fp_type
  WHERE ba.uniquename =&#39;FBba0000006&#39; AND fp_type.NAME=&#39;discoverer&#39; AND
    ba.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">STOCKS</td>
</tr>
<tr class="even">
<td>Bloomington</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, featureprop fp, cvterm fp_type
  WHERE ba.uniquename =&#39;FBba0000001&#39; AND fp_type.NAME=&#39;derived_stock_Bloomington&#39; AND
    ba.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Kyoto</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, featureprop fp, cvterm fp_type
  WHERE ba.uniquename =&#39;FBba0000002&#39; AND fp_type.NAME=&#39;derived_stock_Bloomington&#39; AND
    ba.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Szeged</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, featureprop fp, cvterm fp_type
  WHERE ba.uniquename =&#39;FBba0000003&#39; AND fp_type.NAME=&#39;derived_stock_Szeged&#39; AND
    ba.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Tucson</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, featureprop fp, cvterm fp_type
  WHERE ba.uniquename =&#39;FBba0000001&#39; AND fp_type.NAME=&#39;derived_stock_Tucson&#39; AND
    ba.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Carpenter</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, featureprop fp, cvterm fp_type
  WHERE ba.uniquename =&#39;FBba0000001&#39; AND fp_type.NAME=&#39;derived_stock_Carpenter&#39; AND
    ba.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Garcia-Bellido</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, featureprop fp, cvterm fp_type
  WHERE ba.uniquename =&#39;FBba0000001&#39; AND fp_type.NAME=&#39;derived_stock_Garcia-Bellido&#39; AND
    ba.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Harvard</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, featureprop fp, cvterm fp_type
  WHERE ba.uniquename =&#39;FBba0000001&#39; AND fp_type.NAME=&#39;derived_stock_Harvard&#39; AND
    ba.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Nusslein-Volhard</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, featureprop fp, cvterm fp_type
  WHERE ba.uniquename =&#39;FBba0000001&#39; AND fp_type.NAME=&#39;derived_stock_Nusslein-Volhard&#39; AND
    ba.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Saxton</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, featureprop fp, cvterm fp_type
  WHERE ba.uniquename =&#39;FBba0000001&#39; AND fp_type.NAME=&#39;derived_stock_Saxton&#39; AND
    ba.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Notes on availability</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, featureprop fp, cvterm fp_type
  WHERE ba.uniquename =&#39;FBba0000001&#39; AND fp_type.NAME=&#39;availability&#39; AND
    ba.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">GENETIC DATA</td>
</tr>
<tr class="odd">
<td>Genes subject to position-effect variegation</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature ba, feature g, feature_relationship fr, feature_synonym fs, synonym s,
     cvterm fs_type, cvterm fr_type
  WHERE ba.uniquename = &#39;FBba0000116&#39; AND fs.is_current = &#39;t&#39; AND
    fs.is_internal = &#39;f&#39; AND fs_type.NAME = &#39;symbol&#39; AND
    fr_type.NAME=&#39;rec_position_effect&#39; AND ba.feature_id=fr.object_id AND
    fr.type_id=fr_type.cvterm_id AND fr.subject_id=g.feature_id AND
    g.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    s.type_id = fs_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td>Genes showing dominant position-effect variegation</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature ba, feature g, feature_relationship fr, feature_synonym fs, synonym s,
     cvterm fs_type, cvterm fr_type
  WHERE ba.uniquename = &#39;FBba0000119&#39; AND fs.is_current = &#39;t&#39; AND
    fs.is_internal = &#39;f&#39; AND fs_type.NAME = &#39;symbol&#39; AND
    fr_type.NAME=&#39;dom_position_effect&#39; AND ba.feature_id=fr.object_id AND
    fr.type_id=fr_type.cvterm_id AND fr.subject_id=g.feature_id AND
    g.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    s.type_id = fs_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Genes NOT subject to position-effect variegation</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM feature ba, feature g, feature_relationship fr, feature_synonym fs, synonym s,
     cvterm fs_type, cvterm fr_type
  WHERE ba.uniquename = &#39;FBba0000119&#39; AND fs.is_current = &#39;t&#39; AND
    fs.is_internal = &#39;f&#39; AND fs_type.NAME = &#39;symbol&#39; AND
    fr_type.NAME=&#39;no_position_effect&#39; AND ba.feature_id=fr.object_id AND
    fr.type_id=fr_type.cvterm_id AND fr.subject_id=g.feature_id AND
    g.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    s.type_id = fs_type.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">OTHER INFORMATION</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature ba, featureprop fp, cvterm fp_type
  WHERE ba.uniquename =&#39;FBba0000002&#39; AND fp_type.NAME=&#39;misc&#39; AND
    ba.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">SYNONYMS AND SECONDARY IDs</td>
</tr>
<tr class="odd">
<td colspan="2">REPORTED AS</td>
</tr>
<tr class="even">
<td>Symbol Synonym</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.NAME, s.NAME AS synonym, synonym_sgml, cvt.NAME, p.uniquename
  FROM cvterm cvt, feature f, feature_synonym fs, synonym s, pub p
  WHERE f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.pub_id = p.pub_id AND s.type_id = cvt.cvterm_id AND
    fs.is_current = &#39;f&#39; AND f.uniquename = &#39;FBba0000116&#39; AND
    cvt.name=&#39;symbol&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Name Synonym</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.NAME, s.NAME AS synonym, synonym_sgml, cvt.NAME, p.uniquename
  FROM cvterm cvt, feature f, feature_synonym fs, synonym s, pub p
  WHERE f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.pub_id = p.pub_id AND s.type_id = cvt.cvterm_id AND
    fs.is_current = &#39;f&#39; AND f.uniquename = &#39;FBba0000116&#39; AND
    cvt.name=&#39;fullname&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">SECONDARY FLYBASE IDs</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.NAME, accession, db.NAME
  FROM feature f, feature_dbxref fd, dbxref d, db
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = d.dbxref_id AND
    fd.is_current = &#39;f&#39; AND d.db_id = db.db_id AND
    db.NAME = &#39;FlyBase&#39; AND f.uniquename = &#39;FBba0000005&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">REFERENCES</td>
</tr>
<tr class="odd">
<td>Research paper</td>
<td>

<pre class="de1"><code>SELECT p.uniquename, p.miniref, p.title
  FROM feature f, pub p, feature_pub fp
  WHERE f.uniquename = &#39;FBba0000005&#39; AND f.feature_id=fp.feature_id AND
    fp.pub_id=p.pub_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Supplementary<br />
material</td>
<td>Same as above use pub type to distinguish</td>
</tr>
<tr class="odd">
<td>Review</td>
<td>Same as above use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Abstract</td>
<td>Same as above use pub type to distinguish</td>
</tr>
<tr class="odd">
<td>Other</td>
<td>Same as above use pub type to distinguish</td>
</tr>
</tbody>
</table>

## FlyBase Reference Report

**Example report:**
<a href="http://flybase.org/reports/FBrf0126983.html"

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">REFERENCE</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Citation</td>
<td>

<pre class="de1"><code>SELECT p.uniquename, p.pyear, p.title, array_to_string( array(
SELECT pa.surname | &#39;, &#39; | pa.givennames
  FROM pubauthor pa
  WHERE pa.pub_id=p.pub_id), &#39;, &#39; ) AS authors, (SELECT pp.VALUE
  FROM pubprop pp, cvterm pp_type
  WHERE pp_type.name=&#39;pubmed_fulltext_url&#39; AND pp.pub_id=p.pub_id AND
    pp.type_id=pp_type.cvterm_id) AS fulltext_url, (SELECT pub_in.miniref
  FROM pub pub_in, pub_relationship pr, cvterm pr_type
  WHERE pr_type.name=&#39;published_in&#39; AND p.pub_id=pr.subject_id AND
    pr.object_id=pub_in.pub_id AND pr.type_id=pr_type.cvterm_id) AS journal, p.volume, p.issue, p.pages
  FROM pub p
  WHERE p.uniquename=&#39;FBrf0126983&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT uniquename
  FROM pub
  WHERE uniquename=&#39;FBrf0126983&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Type of publication</td>
<td></td>
</tr>
<tr class="even">
<td>Offprint</td>
<td>

<pre class="de1"><code>SELECT pp.VALUE
  FROM pub p, pubprop pp, cvterm cvt
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND cvt.name=&#39;cam_offprint&#39; AND
    p.pub_id=pp.pub_id AND pp.type_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">EXTERNAL CROSSREFERENCES</td>
</tr>
<tr class="even">
<td>PubMed ID</td>
<td>

<pre class="de1"><code>SELECT dbx.accession
  FROM pub p, pub_dbxref pdbx, dbxref dbx, db
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND db.name=&#39;pubmed&#39; AND
    pdbx.is_current=TRUE AND p.pub_id=pdbx.pub_id AND
    pdbx.dbxref_id = dbx.dbxref_id AND dbx.db_id=db.db_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>PubMed Abstract</td>
<td>

<pre class="de1"><code>SELECT pp.VALUE
  FROM pub p, pubprop pp, cvterm cvt
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND cvt.name=&#39;pubmed_abstract&#39; AND
    p.pub_id=pp.pub_id AND pp.type_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>(Conference Abstract)</td>
<td>

<pre class="de1"><code>SELECT pp.VALUE
  FROM pub p, pubprop pp, cvterm cvt
  WHERE p.uniquename=&#39;FBrf0188865&#39; AND cvt.name=&#39;conf_abs_text&#39; AND
    p.pub_id=pp.pub_id AND pp.type_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Biosis</td>
<td>

<pre class="de1"><code>SELECT dbx.accession
  FROM pub p, pub_dbxref pdbx, dbxref dbx, db
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND db.name=&#39;biosis&#39; AND
    pdbx.is_current=TRUE AND p.pub_id=pdbx.pub_id AND
    pdbx.dbxref_id = dbx.dbxref_id AND dbx.db_id=db.db_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Zoological record</td>
<td>

<pre class="de1"><code>SELECT dbx.accession
  FROM pub p, pub_dbxref pdbx, dbxref dbx, db
  WHERE p.uniquename=&#39;FBrf0025508&#39; AND db.name=&#39;zoorec_id&#39; AND
    pdbx.is_current=TRUE AND p.pub_id=pdbx.pub_id AND
    pdbx.dbxref_id = dbx.dbxref_id AND dbx.db_id=db.db_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">ASSOCIATED INFORMATION</td>
</tr>
<tr class="even">
<td>Comments</td>
<td>

<pre class="de1"><code>SELECT pp.VALUE
  FROM pub p, pubprop pp, cvterm cvt
  WHERE p.uniquename=&#39;FBrf0148886&#39; AND cvt.name=&#39;associated_text&#39; AND
    p.pub_id=pp.pub_id AND pp.type_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Text of personal<br />
communication</td>
<td>

<pre class="de1"><code>SELECT pp.VALUE
  FROM pub p, pubprop pp, cvterm cvt
  WHERE p.uniquename=&#39;FBrf0188739&#39; AND cvt.name=&#39;perscommtext&#39; AND
    p.pub_id=pp.pub_id AND pp.type_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Associated files</td>
<td>

<pre class="de1"><code>SELECT pp.VALUE
  FROM pub p, pubprop pp, cvterm cvt
  WHERE p.uniquename=&#39;FBrf0191798&#39; AND cvt.name=&#39;deposited_files&#39; AND
    p.pub_id=pp.pub_id AND pp.type_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">RELATED PUBLICATIONS</td>
</tr>
<tr class="even">
<td>Research paper</td>
<td>

<pre class="de1"><code>SELECT related_pub.uniquename, related_pub.miniref, pub_type.name
  FROM pub p, pub_relationship pr, pub related_pub, cvterm rel_type, cvterm pub_type
  WHERE p.uniquename=&#39;FBrf0000634&#39; AND rel_type.name=&#39;related_to&#39; AND
    p.pub_id=pr.object_id AND pr.subject_id=related_pub.pub_id AND
    pr.type_id=rel_type.cvterm_id AND related_pub.type_id=pub_type.cvterm_id UNION
SELECT related_pub.uniquename, related_pub.miniref, pub_type.name
  FROM pub p, pub_relationship pr, pub related_pub, cvterm rel_type, cvterm pub_type
  WHERE p.uniquename=&#39;FBrf0000634&#39; AND rel_type.name=&#39;related_to&#39; AND
    p.pub_id=pr.subject_id AND pr.object_id=related_pub.pub_id AND
    pr.type_id=rel_type.cvterm_id AND related_pub.type_id=pub_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Supplementary<br />
material</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Review</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="odd">
<td>Erratum</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Retraction</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="odd">
<td>Personal<br />
communication</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Abstract</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="odd">
<td>FlyBase analysis</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Other</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="odd">
<td colspan="2">ALSO PUBLISHED AS</td>
</tr>
<tr class="even">
<td>Research paper</td>
<td>

<pre class="de1"><code>SELECT related_pub.uniquename, related_pub.miniref, pub_type.name
  FROM pub p, pub_relationship pr, pub related_pub, cvterm rel_type, cvterm pub_type
  WHERE p.uniquename=&#39;FBrf0000424&#39; AND rel_type.name=&#39;also_in&#39; AND
    p.pub_id=pr.object_id AND pr.subject_id=related_pub.pub_id AND
    pr.type_id=rel_type.cvterm_id AND related_pub.type_id=pub_type.cvterm_id UNION
SELECT related_pub.uniquename, related_pub.miniref, pub_type.name
  FROM pub p, pub_relationship pr, pub related_pub, cvterm rel_type, cvterm pub_type
  WHERE p.uniquename=&#39;FBrf0000424&#39; AND rel_type.name=&#39;also_in&#39; AND
    p.pub_id=pr.subject_id AND pr.object_id=related_pub.pub_id AND
    pr.type_id=rel_type.cvterm_id AND related_pub.type_id=pub_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Supplementary<br />
material</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Review</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="odd">
<td>Erratum</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Retraction</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="odd">
<td>Personal<br />
communication</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Abstract</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="odd">
<td>FlyBase analysis</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Other</td>
<td>same as above, use pub type to distinguish</td>
</tr>
<tr class="odd">
<td colspan="2">OTHER REFERENCE INFORMATION</td>
</tr>
<tr class="even">
<td>Secondary IDs</td>
<td>

<pre class="de1"><code>SELECT dbx.accession
  FROM pub p, pub_dbxref pdbx, dbxref dbx, db
  WHERE p.uniquename=&#39;FBrf0000810&#39; AND db.name=&#39;FlyBase&#39; AND
    pdbx.is_current=FALSE AND p.pub_id=pdbx.pub_id AND
    pdbx.dbxref_id = dbx.dbxref_id AND dbx.db_id=db.db_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Language of publication</td>
<td>

<pre class="de1"><code>SELECT pp.VALUE
  FROM pub p, pubprop pp, cvterm cvt
  WHERE p.uniquename=&#39;FBrf0000002&#39; AND cvt.name=&#39;languages&#39; AND
    p.pub_id=pp.pub_id AND pp.type_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Additional Language(s)<br />
of abstract</td>
<td>

<pre class="de1"><code>SELECT pp.VALUE
  FROM pub p, pubprop pp, cvterm cvt
  WHERE p.uniquename=&#39;FBrf0064412&#39; AND cvt.name=&#39;abstract_languages&#39; AND
    p.pub_id=pp.pub_id AND pp.type_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>ISBN</td>
<td>

<pre class="de1"><code>SELECT dbx.accession
  FROM pub p, pub_dbxref pdbx, dbxref dbx, db
  WHERE p.uniquename=&#39;FBrf0019088&#39; AND db.name=&#39;isbn&#39; AND
    pdbx.is_current=TRUE AND p.pub_id=pdbx.pub_id AND
    pdbx.dbxref_id = dbx.dbxref_id AND dbx.db_id=db.db_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Place of Publication</td>
<td>

<pre class="de1"><code>SELECT pubplace
  FROM pub
  WHERE uniquename =&#39;FBrf0075564&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">PUBLISHED IN</td>
</tr>
<tr class="even">
<td>Abbreviation</td>
<td>

<pre class="de1"><code>SELECT pub_in.miniref
  FROM pub p, pub pub_in, pub_relationship pr, cvterm rel_type
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND rel_type.name=&#39;published_in&#39; AND
    p.pub_id=pr.subject_id AND pr.object_id=pub_in.pub_id AND
    pr.type_id=rel_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Title</td>
<td>

<pre class="de1"><code>SELECT pub_in.title
  FROM pub p, pub pub_in, pub_relationship pr, cvterm rel_type
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND rel_type.name=&#39;published_in&#39; AND
    p.pub_id=pr.subject_id AND pr.object_id=pub_in.pub_id AND
    pr.type_id=rel_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Authors</td>
<td>

<pre class="de1"><code>SELECT array_to_string( array(
SELECT pa.surname | &#39;, &#39; | pa.givennames
  FROM pubauthor pa
  WHERE pa.pub_id=pub_in.pub_id), &#39;, &#39; ) AS authors
  FROM pub p, pub pub_in, pub_relationship pr, cvterm rel_type
  WHERE p.uniquename=&#39;FBrf0191612&#39; AND rel_type.name=&#39;published_in&#39; AND
    p.pub_id=pr.subject_id AND pr.object_id=pub_in.pub_id AND
    pr.type_id=rel_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Volume Range</td>
<td>

<pre class="de1"><code>SELECT pub_in.volume
  FROM pub p, pub pub_in, pub_relationship pr, cvterm rel_type
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND rel_type.name=&#39;published_in&#39; AND
    p.pub_id=pr.subject_id AND pr.object_id=pub_in.pub_id AND
    pr.type_id=rel_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Year Range</td>
<td>

<pre class="de1"><code>SELECT pub_in.pyear
  FROM pub p, pub pub_in, pub_relationship pr, cvterm rel_type
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND rel_type.name=&#39;published_in&#39; AND
    p.pub_id=pr.subject_id AND pr.object_id=pub_in.pub_id AND
    pr.type_id=rel_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Page Range</td>
<td>

<pre class="de1"><code>SELECT pub_in.pages
  FROM pub p, pub pub_in, pub_relationship pr, cvterm rel_type
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND rel_type.name=&#39;published_in&#39; AND
    p.pub_id=pr.subject_id AND pr.object_id=pub_in.pub_id AND
    pr.type_id=rel_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Publisher</td>
<td>

<pre class="de1"><code>SELECT pub_in.publisher
  FROM pub p, pub pub_in, pub_relationship pr, cvterm rel_type
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND rel_type.name=&#39;published_in&#39; AND
    p.pub_id=pr.subject_id AND pr.object_id=pub_in.pub_id AND
    pr.type_id=rel_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Place of publication</td>
<td>

<pre class="de1"><code>SELECT pub_in.pubplace
  FROM pub p, pub pub_in, pub_relationship pr, cvterm rel_type
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND rel_type.name=&#39;published_in&#39; AND
    p.pub_id=pr.subject_id AND pr.object_id=pub_in.pub_id AND
    pr.type_id=rel_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Language of publication</td>
<td>

<pre class="de1"><code>SELECT pp.VALUE
  FROM pub p, pub pub_in, pub_relationship pr, cvterm rel_type, pubprop pp,
     cvterm pp_type
  WHERE p.uniquename=&#39;FBrf0002356&#39; AND rel_type.name=&#39;published_in&#39; AND
    pp_type.name=&#39;languages&#39; AND p.pub_id=pr.subject_id AND
    pr.object_id=pub_in.pub_id AND pr.type_id=rel_type.cvterm_id AND
    pp.type_id=pp_type.cvterm_id AND pub_in.pub_id=pp.pub_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>ISBN or ISSN</td>
<td>

<pre class="de1"><code>SELECT dbx.accession
  FROM pub p, pub pub_in, pub_relationship pr, cvterm rel_type, pub_dbxref pdbx,
     dbxref dbx, db
  WHERE p.uniquename=&#39;FBrf0000051&#39; AND rel_type.name=&#39;published_in&#39; AND
    db.name IN (&#39;isbn&#39;,&#39;issn&#39;) AND pdbx.is_current=TRUE AND
    p.pub_id=pr.subject_id AND pr.object_id=pub_in.pub_id AND
    pr.type_id=rel_type.cvterm_id AND pub_in.pub_id=pdbx.pub_id AND
    pdbx.dbxref_id=dbx.dbxref_id AND dbx.db_id=db.db_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>CODEN</td>
<td>

<pre class="de1"><code>SELECT dbx.accession
  FROM pub p, pub pub_in, pub_relationship pr, cvterm rel_type, pub_dbxref pdbx,
     dbxref dbx, db
  WHERE p.uniquename=&#39;FBrf0000015&#39; AND rel_type.name=&#39;published_in&#39; AND
    db.name=&#39;coden&#39; AND pdbx.is_current=TRUE AND
    p.pub_id=pr.subject_id AND pr.object_id=pub_in.pub_id AND
    pr.type_id=rel_type.cvterm_id AND pub_in.pub_id=pdbx.pub_id AND
    pdbx.dbxref_id=dbx.dbxref_id AND dbx.db_id=db.db_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Associated files</td>
<td>

<pre class="de1"><code>SELECT pp.VALUE
  FROM pub p, pub pub_in, pub_relationship pr, cvterm rel_type, pubprop pp,
     cvterm pp_type
  WHERE p.uniquename=&#39;FBrf0002356&#39; AND rel_type.name=&#39;published_in&#39; AND
    pp_type.name=&#39;deposted_files&#39; AND p.pub_id=pr.subject_id AND
    pr.object_id=pub_in.pub_id AND pr.type_id=rel_type.cvterm_id AND
    pp.type_id=pp_type.cvterm_id AND pub_in.pub_id=pp.pub_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">DATA FROM REFERENCE</td>
</tr>
<tr class="odd">
<td colspan="2">Genes</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM pub p, feature_pub fp, feature f, feature_synonym fs, synonym s,
     cvterm cvt
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND f.uniquename LIKE &#39;FBgn%&#39; AND
    cvt.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    p.pub_id=fp.pub_id AND fp.feature_id=f.feature_id AND
    f.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=cvt.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Transcripts</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM pub p, feature_pub fp, feature f, feature_synonym fs, synonym s,
     cvterm cvt
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND f.uniquename LIKE &#39;FBtr%&#39; AND
    cvt.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    p.pub_id=fp.pub_id AND fp.feature_id=f.feature_id AND
    f.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=cvt.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Polypeptides</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM pub p, feature_pub fp, feature f, feature_synonym fs, synonym s,
     cvterm cvt
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND f.uniquename LIKE &#39;FBpp%&#39; AND
    cvt.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    p.pub_id=fp.pub_id AND fp.feature_id=f.feature_id AND
    f.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=cvt.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Alleles</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM pub p, feature_pub fp, feature f, feature_synonym fs, synonym s,
     cvterm cvt
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND f.uniquename LIKE &#39;FBal%&#39; AND
    cvt.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    p.pub_id=fp.pub_id AND fp.feature_id=f.feature_id AND
    f.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=cvt.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Constructs</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM pub p, feature_pub fp, feature f, feature_synonym fs, synonym s,
     cvterm cvt
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND f.uniquename ~ &#39;FB(tp|ms|mc)[0-9]+$&#39; AND
    cvt.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    p.pub_id=fp.pub_id AND fp.feature_id=f.feature_id AND
    f.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=cvt.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Insertions</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM pub p, feature_pub fp, feature f, feature_synonym fs, synonym s,
     cvterm cvt
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND f.uniquename LIKE &#39;FBti%&#39; AND
    cvt.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    p.pub_id=fp.pub_id AND fp.feature_id=f.feature_id AND
    f.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=cvt.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Aberations</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM pub p, feature_pub fp, feature f, feature_synonym fs, synonym s,
     cvterm cvt
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND f.uniquename LIKE &#39;FBab%&#39; AND
    cvt.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    p.pub_id=fp.pub_id AND fp.feature_id=f.feature_id AND
    f.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=cvt.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Balancers</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM pub p, feature_pub fp, feature f, feature_synonym fs, synonym s,
     cvterm cvt
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND f.uniquename LIKE &#39;FBba%&#39; AND
    cvt.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    p.pub_id=fp.pub_id AND fp.feature_id=f.feature_id AND
    f.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=cvt.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Images</td>
</tr>
<tr class="even">
<td> </td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Clones</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM pub p, feature_pub fp, feature f, feature_synonym fs, synonym s,
     cvterm cvt
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND f.uniquename LIKE &#39;FBcl%&#39; AND
    cvt.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    p.pub_id=fp.pub_id AND fp.feature_id=f.feature_id AND
    f.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=cvt.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Natural Transposons</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml
  FROM pub p, feature_pub fp, feature f, feature_synonym fs, synonym s,
     cvterm cvt
  WHERE p.uniquename=&#39;FBrf0126983&#39; AND f.uniquename LIKE &#39;FBte%&#39; AND
    cvt.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    p.pub_id=fp.pub_id AND fp.feature_id=f.feature_id AND
    f.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=cvt.cvterm_id GROUP BY s.synonym_sgml;</code></pre>

</td>
</tr>
</tbody>
</table>

## FlyBase Transgenic Construct Report

**Example report:**
<a href="http://flybase.org/reports/FBtp0000001.html"

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">GENERAL INFORMATION [unattributed]</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Symbol</td>
<td>

<pre class="de1"><code>SELECT DISTINCT s.synonym_sgml
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt
  WHERE f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt.cvterm_id AND cvt.name = &#39;symbol&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBtp0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td>

<pre class="de1"><code>SELECT f.uniquename
  FROM feature f
  WHERE f.uniquename = &#39;FBtp0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Feature type</td>
<td>

<pre class="de1"><code>SELECT cvt.name
  FROM feature f, cvterm cvt
  WHERE f.uniquename = &#39;FBtp0000001&#39; AND f.type_id=cvt.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Created / Updated</td>
<td>

<pre class="de1"><code>SELECT f.timeaccessioned,f.timelastmodified
  FROM feature f
  WHERE f.uniquename = &#39;FBtp0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">[additional unattributed data]</td>
</tr>
<tr class="even">
<td>Size</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBtp0018202&#39; AND (fp_type.name=&#39;kb_length&#39; OR
    fp_type.name=&#39;compiled_kb_length&#39;) AND f.feature_id=fp.feature_id AND
    fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Expression data</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBtp0036669&#39; AND fp_type.name=&#39;derived_expression_data&#39; AND
    f.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Localized function</td>
<td></td>
</tr>
<tr class="odd">
<td>Associated insertions</td>
<td>

<pre class="de1"><code>SELECT DISTINCT s.synonym_sgml
  FROM feature tp, feature ins, feature_relationship fr, feature_synonym fs, synonym s,
     cvterm fs_type, cvterm fr_type
  WHERE tp.uniquename=&#39;FBtp0036624&#39; AND fs.is_current=&#39;t&#39; AND
    fs.is_internal=&#39;f&#39; AND fs_type.NAME=&#39;symbol&#39; AND
    fr_type.NAME=&#39;producedby&#39; AND tp.feature_id=fr.object_id AND
    fr.type_id=fr_type.cvterm_id AND fr.subject_id=ins.feature_id AND
    ins.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=fs_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Molecular map</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">DESCRIPTION &amp; USES</td>
</tr>
<tr class="even">
<td colspan="2">Description</td>
</tr>
<tr class="odd">
<td>Species</td>
<td>

<pre class="de1"><code>SELECT o.genus,o.species
  FROM feature f, organism o
  WHERE f.uniquename=&#39;FBtp0000001&#39; AND f.organism_id=o.organism_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>CV term</td>
<td>

<pre class="de1"><code>SELECT cvt.name
  FROM feature f, feature_cvterm fcvt, cvterm cvt, cv
  WHERE f.uniquename=&#39;FBtp0022777&#39; AND cv.name=&#39;transgene_description&#39; AND
    f.feature_id=fcvt.feature_id AND fcvt.cvterm_id=cvt.cvterm_id AND
    cvt.cv_id=cv.cv_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Qualifiers and info</td>
<td>

<pre class="de1"><code>SELECT fcvtp.VALUE
  FROM feature f, feature_cvterm fcvt, feature_cvtermprop fcvtp, cvterm cvt, cv
  WHERE f.uniquename=&#39;FBtp0022777&#39; AND cv.name=&#39;transgene_description&#39; AND
    fcvt.feature_cvterm_id=fcvtp.feature_cvterm_id AND f.feature_id=fcvt.feature_id AND
    fcvt.cvterm_id=cvt.cvterm_id AND cvt.cv_id=cv.cv_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Reference</td>
<td>

<pre class="de1"><code>SELECT p.uniquename
  FROM feature f, feature_cvterm fcvt, pub p, cvterm cvt, cv
  WHERE f.uniquename=&#39;FBtp0022777&#39; AND cv.name=&#39;transgene_description&#39; AND
    fcvt.pub_id=p.pub_id AND f.feature_id=fcvt.feature_id AND
    fcvt.cvterm_id=cvt.cvterm_id AND cvt.cv_id=cv.cv_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Uses</td>
</tr>
<tr class="even">
<td>CV term</td>
<td>

<pre class="de1"><code>SELECT cvt.name
  FROM feature f, feature_cvterm fcvt, cvterm cvt, cv
  WHERE f.uniquename=&#39;FBtp0022777&#39; AND cv.name=&#39;transgene_uses&#39; AND
    f.feature_id=fcvt.feature_id AND fcvt.cvterm_id=cvt.cvterm_id AND
    cvt.cv_id=cv.cv_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Qualifier &amp; info</td>
<td>

<pre class="de1"><code>SELECT fcvtp.VALUE
  FROM feature f, feature_cvterm fcvt, feature_cvtermprop fcvtp, cvterm cvt, cv
  WHERE f.uniquename=&#39;FBtp0022777&#39; AND cv.name=&#39;transgene_uses&#39; AND
    fcvt.feature_cvterm_id=fcvtp.feature_cvterm_id AND f.feature_id=fcvt.feature_id AND
    fcvt.cvterm_id=cvt.cvterm_id AND cvt.cv_id=cv.cv_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Reference</td>
<td>

<pre class="de1"><code>SELECT p.uniquename
  FROM feature f, feature_cvterm fcvt, pub p, cvterm cvt, cv
  WHERE f.uniquename=&#39;FBtp0022777&#39; AND cv.name=&#39;transgene_uses&#39; AND
    fcvt.pub_id=p.pub_id AND f.feature_id=fcvt.feature_id AND
    fcvt.cvterm_id=cvt.cvterm_id AND cvt.cv_id=cv.cv_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Cloning Sites</td>
</tr>
<tr class="even">
<td>Location</td>
<td></td>
</tr>
<tr class="odd">
<td>Restriction sites</td>
<td></td>
</tr>
<tr class="even">
<td>Reference</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">SEQUENCE DATA</td>
</tr>
<tr class="even">
<td>Sequence (FB)</td>
<td></td>
</tr>
<tr class="odd">
<td>Sequence</td>
<td></td>
</tr>
<tr class="even">
<td>Alternative sequence</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">ASSOCIATED SEQUENCE DATA</td>
</tr>
<tr class="even">
<td colspan="2">DDBJ /EMBL /GenBank</td>
</tr>
<tr class="odd">
<td>DNA sequence</td>
<td>

<pre class="de1"><code>SELECT arm.name, fl.fmin+1, fl.fmax
  FROM feature f, featureloc fl, feature arm
  WHERE f.uniquename=&#39;FBtp0000078&#39; AND f.feature_id=fl.feature_id AND
    fl.srcfeature_id=arm.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Comments</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBtp0036625&#39; AND fp_type.name=&#39;comment&#39; AND
    f.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">SEGMENTS &amp; SIZE</td>
</tr>
<tr class="even">
<td>Total Size</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBtp0018202&#39; AND (fp_type.name=&#39;kb_length&#39; OR
    fp_type.name=&#39;compiled_kb_length&#39;) AND f.feature_id=fp.feature_id AND
    fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Left end</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBtp0000078&#39; AND fp_type.name=&#39;original_left_end&#39; AND
    f.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Right end</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBtp0000078&#39; AND fp_type.name=&#39;original_right_end&#39; AND
    f.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Segments</td>
</tr>
<tr class="even">
<td>Number</td>
<td>

<pre class="de1"><code>SELECT fr.rank
  FROM feature f, feature seg, feature_relationship fr, cvterm fr_type
  WHERE f.uniquename=&#39;FBtp0000078&#39; AND fr_type.name=&#39;partof&#39; AND
    f.feature_id=fr.object_id AND fr.subject_id=seg.feature_id AND
    fr.type_id=fr_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Orientation</td>
<td>

<pre class="de1"><code>SELECT frp.VALUE
  FROM feature f, feature seg, feature_relationship fr, cvterm fr_type, cvterm frp_type,
     feature_relationshipprop frp
  WHERE f.uniquename=&#39;FBtp0000078&#39; AND fr_type.name=&#39;partof&#39; AND
    frp_type.name=&#39;relative_orientation&#39; AND f.feature_id=fr.object_id AND
    fr.subject_id=seg.feature_id AND fr.type_id=fr_type.cvterm_id AND
    fr.feature_relationship_id=frp.feature_relationship_id AND frp.type_id=frp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Symbol</td>
<td>

<pre class="de1"><code>SELECT DISTINCT s.synonym_sgml
  FROM feature f, feature seg, feature_relationship fr, cvterm fr_type, feature_synonym fs,
     synonym s, cvterm s_type
  WHERE f.uniquename=&#39;FBtp0000078&#39; AND fr_type.name=&#39;partof&#39; AND
    fs.is_current=TRUE AND s_type.name=&#39;symbol&#39; AND
    f.feature_id=fr.object_id AND fr.subject_id=seg.feature_id AND
    fr.type_id=fr_type.cvterm_id AND seg.feature_id=fs.feature_id AND
    fs.synonym_id=s.synonym_id AND s.type_id=s_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Reference</td>
<td>

<pre class="de1"><code>SELECT p.uniquename
  FROM feature f, feature seg, feature_relationship fr, cvterm fr_type, feature_relationship_pub frp,
     pub p
  WHERE f.uniquename=&#39;FBtp0000078&#39; AND fr_type.name=&#39;partof&#39; AND
    f.feature_id=fr.object_id AND fr.subject_id=seg.feature_id AND
    fr.type_id=fr_type.cvterm_id AND fr.feature_relationship_id=frp.feature_relationship_id AND
    frp.pub_id=p.pub_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">FEATURES</td>
</tr>
<tr class="odd">
<td>CV term</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBtp0022777&#39; AND fp_type.name=&#39;derived_transgene_features&#39; AND
    f.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Qualifiers &amp; info</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBtp0022777&#39; AND fp_type.name=&#39;derived_transgene_features&#39; AND
    f.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Reference</td>
<td>

<pre class="de1"><code>SELECT p.uniquename
  FROM feature f, featureprop fp, featureprop_pub fpp, pub p, cvterm fp_type
  WHERE f.uniquename=&#39;FBtp0022777&#39; AND fp_type.name=&#39;derived_transgene_features&#39; AND
    f.feature_id=fp.feature_id AND fp.type_id=fp_type.cvterm_id AND
    fp.featureprop_id=fpp.featureprop_id AND fpp.pub_id=p.pub_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">COMPONENT ALLELES</td>
</tr>
<tr class="odd">
<td>Allele</td>
<td>

<pre class="de1"><code>SELECT DISTINCT s.synonym_sgml
  FROM feature tp, feature al, feature_relationship fr, feature_synonym fs, synonym s,
     cvterm fs_type, cvterm fr_type
  WHERE tp.uniquename = &#39;FBtp0022777&#39; AND fs.is_current = &#39;t&#39; AND
    fs.is_internal = &#39;f&#39; AND fs_type.NAME = &#39;symbol&#39; AND
    fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND tp.feature_id=fr.object_id AND
    fr.type_id=fr_type.cvterm_id AND fr.subject_id=al.feature_id AND
    al.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    s.type_id = fs_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Reference(s)</td>
<td>

<pre class="de1"><code>SELECT p.uniquename
  FROM feature tp, feature al, feature_relationship fr, cvterm fr_type, feature_relationship_pub frp,
     pub p
  WHERE tp.uniquename = &#39;FBtp0022777&#39; AND fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    tp.feature_id=fr.object_id AND fr.type_id=fr_type.cvterm_id AND
    fr.subject_id=al.feature_id AND fr.feature_relationship_id=frp.feature_relationship_id AND
    frp.pub_id=p.pub_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Molecular data</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature tp, feature al, feature_relationship fr, cvterm fr_type, featureprop fp,
     cvterm fp_type
  WHERE tp.uniquename = &#39;FBtp0022777&#39; AND fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    fp_type.name=&#39;molecular_info&#39; AND tp.feature_id=fr.object_id AND
    fr.type_id=fr_type.cvterm_id AND fr.subject_id=al.feature_id AND
    al.feature_id = fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Phenotypic class</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature tp, feature al, feature_relationship fr, cvterm fr_type, featureprop fp,
     cvterm fp_type
  WHERE tp.uniquename = &#39;FBtp0022777&#39; AND fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    fp_type.name=&#39;derived_pheno_class&#39; AND tp.feature_id=fr.object_id AND
    fr.type_id=fr_type.cvterm_id AND fr.subject_id=al.feature_id AND
    al.feature_id = fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Phenotype manifest in</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature tp, feature al, feature_relationship fr, cvterm fr_type, featureprop fp,
     cvterm fp_type
  WHERE tp.uniquename = &#39;FBtp0022777&#39; AND fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    fp_type.name=&#39;derived_pheno_manifest&#39; AND tp.feature_id=fr.object_id AND
    fr.type_id=fr_type.cvterm_id AND fr.subject_id=al.feature_id AND
    al.feature_id = fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Other information</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature tp, feature al, feature_relationship fr, cvterm fr_type, featureprop fp,
     cvterm fp_type
  WHERE tp.uniquename = &#39;FBtp0022777&#39; AND fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    fp_type.name=&#39;derived_allele_phendesc&#39; AND tp.feature_id=fr.object_id AND
    fr.type_id=fr_type.cvterm_id AND fr.subject_id=al.feature_id AND
    al.feature_id = fp.feature_id AND fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">EXPRESSION DATA</td>
</tr>
<tr class="even">
<td>[Transcript]</td>
<td></td>
</tr>
<tr class="odd">
<td colspan="2">Reporter expression</td>
</tr>
<tr class="even">
<td>Stage</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature tp, feature al, feature_relationship fr, cvterm fr_type, featureprop fp,
     cvterm fp_type
  WHERE tp.uniquename = &#39;FBtp0036669&#39; AND fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    (fp_type.name=&#39;derived_transcript_bodypart_expression_cv&#39; OR fp_type.name=&#39;derived_polypeptide_bodypart_expression_cv&#39;) AND
    tp.feature_id=fr.object_id AND fr.type_id=fr_type.cvterm_id AND
    fr.subject_id=al.feature_id AND al.feature_id = fp.feature_id AND
    fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Tissue/Position</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature tp, feature al, feature_relationship fr, cvterm fr_type, featureprop fp,
     cvterm fp_type
  WHERE tp.uniquename = &#39;FBtp0036669&#39; AND fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    (fp_type.name=&#39;derived_transcript_bodypart_expression_cv&#39; OR fp_type.name=&#39;derived_polypeptide_bodypart_expression_cv&#39;) AND
    tp.feature_id=fr.object_id AND fr.type_id=fr_type.cvterm_id AND
    fr.subject_id=al.feature_id AND al.feature_id = fp.feature_id AND
    fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Reference</td>
<td>

<pre class="de1"><code>SELECT DISTINCT p.uniquename
  FROM feature tp, feature al, feature_relationship fr, cvterm fr_type, featureprop fp,
     featureprop_pub fpp, pub p, cvterm fp_type
  WHERE tp.uniquename = &#39;FBtp0036669&#39; AND fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    (fp_type.name=&#39;derived_transcript_bodypart_expression_cv&#39; OR fp_type.name=&#39;derived_polypeptide_bodypart_expression_cv&#39;) AND
    tp.feature_id=fr.object_id AND fr.type_id=fr_type.cvterm_id AND
    fr.subject_id=al.feature_id AND al.feature_id = fp.feature_id AND
    fp.type_id=fp_type.cvterm_id AND fp.featureprop_id=fpp.featureprop_id AND
    fpp.pub_id=p.pub_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">Additional Information</td>
</tr>
<tr class="even">
<td>Statement</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature tp, feature al, feature_relationship fr, cvterm fr_type, featureprop fp,
     cvterm fp_type
  WHERE tp.uniquename = &#39;FBtp0001557&#39; AND fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    (fp_type.name=&#39;derived_transcript_bodypart_expression_text&#39; OR fp_type.name=&#39;derived_polypeptide_bodypart_expression_text&#39;) AND
    tp.feature_id=fr.object_id AND fr.type_id=fr_type.cvterm_id AND
    fr.subject_id=al.feature_id AND al.feature_id = fp.feature_id AND
    fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Reference</td>
<td>

<pre class="de1"><code>SELECT DISTINCT p.uniquename
  FROM feature tp, feature al, feature_relationship fr, cvterm fr_type, featureprop fp,
     featureprop_pub fpp, pub p, cvterm fp_type
  WHERE tp.uniquename = &#39;FBtp0001557&#39; AND fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    (fp_type.name=&#39;derived_transcript_bodypart_expression_text&#39; OR fp_type.name=&#39;derived_polypeptide_bodypart_expression_text&#39;) AND
    tp.feature_id=fr.object_id AND fr.type_id=fr_type.cvterm_id AND
    fr.subject_id=al.feature_id AND al.feature_id = fp.feature_id AND
    fp.type_id=fp_type.cvterm_id AND fp.featureprop_id=fpp.featureprop_id AND
    fpp.pub_id=p.pub_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Assay mode</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature tp, feature al, feature_relationship fr, cvterm fr_type, featureprop fp,
     cvterm fp_type
  WHERE tp.uniquename = &#39;FBtp0036669&#39; AND fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    (fp_type.name=&#39;derived_transcript_bodypart_expression_cv&#39; OR fp_type.name=&#39;derived_polypeptide_bodypart_expression_cv&#39;) AND
    tp.feature_id=fr.object_id AND fr.type_id=fr_type.cvterm_id AND
    fr.subject_id=al.feature_id AND al.feature_id = fp.feature_id AND
    fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Marker for</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature tp, feature al, feature_relationship fr, cvterm fr_type, featureprop fp,
     cvterm fp_type
  WHERE tp.uniquename = &#39;FBtp0000365&#39; AND fr_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    (fp_type.name=&#39;derived_transcript_bodypart_expression_marker&#39; OR fp_type.name=&#39;derived_polypeptide_bodypart_expression_marker&#39;) AND
    tp.feature_id=fr.object_id AND fr.type_id=fr_type.cvterm_id AND
    fr.subject_id=al.feature_id AND al.feature_id = fp.feature_id AND
    fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Reflects expression of</td>
<td>

<pre class="de1"><code>SELECT DISTINCT s.synonym_sgml
  FROM feature tp, feature al, feature tr, feature gn, feature_relationship fr1,
     feature_relationship fr2, feature_relationship fr3, cvterm fr1_type, cvterm fr2_type, cvterm fr3_type,
     feature_synonym fs, synonym s, cvterm s_type
  WHERE tp.uniquename = &#39;FBtp0000362&#39; AND fr1_type.NAME=&#39;derived_tp_assoc_alleles&#39; AND
    fr2_type.name=&#39;partof&#39; AND fr3_type.name=&#39;attributed_as_expression_of&#39; AND
    fs.is_current=TRUE AND fs.is_internal=FALSE AND
    s_type.name=&#39;symbol&#39; AND tp.feature_id=fr1.object_id AND
    fr1.type_id=fr1_type.cvterm_id AND fr1.subject_id=al.feature_id AND
    al.feature_id = fr2.object_id AND fr2.type_id=fr2_type.cvterm_id AND
    fr2.subject_id=tr.feature_id AND tr.feature_id=fr3.subject_id AND
    fr3.type_id=fr3_type.cvterm_id AND fr3.object_id=gn.feature_id AND
    gn.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=s_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">PROGENITORS &amp; DESCENDANTS</td>
</tr>
<tr class="even">
<td>Progenitor(s)</td>
<td>

<pre class="de1"><code>SELECT DISTINCT s.synonym_sgml
  FROM feature tp, feature prog, feature_relationship fr, cvterm fr_type, feature_synonym fs,
     synonym s, cvterm s_type
  WHERE tp.uniquename=&#39;FBtp0001096&#39; AND fr_type.name=&#39;in_vitro_descendant_of&#39; AND
    s_type.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    fs.is_internal=FALSE AND tp.feature_id=fr.subject_id AND
    fr.type_id=fr_type.cvterm_id AND fr.object_id=prog.feature_id AND
    prog.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=s_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Descendant(s)</td>
<td>

<pre class="de1"><code>SELECT DISTINCT s.synonym_sgml
  FROM feature tp, feature descn, feature_relationship fr, cvterm fr_type, feature_synonym fs,
     synonym s, cvterm s_type
  WHERE tp.uniquename=&#39;FBmc0001085&#39; AND fr_type.name=&#39;in_vitro_descendant_of&#39; AND
    s_type.name=&#39;symbol&#39; AND fs.is_current=TRUE AND
    fs.is_internal=FALSE AND tp.feature_id=fr.object_id AND
    fr.type_id=fr_type.cvterm_id AND fr.subject_id=descn.feature_id AND
    descn.feature_id=fs.feature_id AND fs.synonym_id=s.synonym_id AND
    s.type_id=s_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">COMMENTS</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT fp.VALUE
  FROM feature f, featureprop fp, cvterm fp_type
  WHERE f.uniquename=&#39;FBtp0036625&#39; AND (fp_type.name=&#39;comment&#39; OR
    fp_type.name=&#39;restriction_sites&#39;) AND f.feature_id=fp.feature_id AND
    fp.type_id=fp_type.cvterm_id;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">SYNONYMS AND SECONDARY IDs</td>
</tr>
<tr class="odd">
<td colspan="2">REPORTED AS</td>
</tr>
<tr class="even">
<td>Symbol Synonym</td>
<td>

<pre class="de1"><code>SELECT DISTINCT s.synonym_sgml
  FROM feature tp, feature_synonym fs, synonym s, cvterm s_type
  WHERE tp.uniquename=&#39;FBtp0036625&#39; AND tp.feature_id=fs.feature_id AND
    fs.is_internal=FALSE AND fs.synonym_id=s.synonym_id AND
    s.type_id=s_type.cvterm_id AND s_type.name=&#39;symbol&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">SECONDARY FLYBASE IDs</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT dbx.accession
  FROM feature tp, feature_dbxref fdbx, dbxref dbx, db
  WHERE tp.uniquename=&#39;FBtp0023480&#39; AND tp.feature_id=fdbx.feature_id AND
    fdbx.is_current=FALSE AND fdbx.dbxref_id=dbx.dbxref_id AND
    dbx.db_id=db.db_id AND db.name=&#39;FlyBase&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">REFERENCES</td>
</tr>
<tr class="even">
<td>Research paper</td>
<td>

<pre class="de1"><code>SELECT p.uniquename, p.miniref, p.title
  FROM feature f, pub p, feature_pub fp
  WHERE f.uniquename = &#39;FBtp0023480&#39; AND f.feature_id=fp.feature_id AND
    fp.pub_id=p.pub_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Supplementary<br />
material</td>
<td>same as above use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Review</td>
<td>same as above use pub type to distinguish</td>
</tr>
<tr class="odd">
<td>Abstract</td>
<td>same as above use pub type to distinguish</td>
</tr>
<tr class="even">
<td>Other</td>
<td>same as above use pub type to distinguish</td>
</tr>
</tbody>
</table>

## FlyBase Natural Transposon Report

**Example report:**
<a href="http://flybase.org/reports/FBte0000001.html"

<table class="wikitable">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2">General information</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Symbol</td>
<td>

<pre class="de1"><code>SELECT DISTINCT(s.synonym_sgml)
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt2
  WHERE f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt2.cvterm_id AND cvt2.name = &#39;symbol&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Species</td>
<td>

<pre class="de1"><code>SELECT o.genus, o.species
  FROM feature f, organism o
  WHERE f.is_obsolete = &#39;f&#39; AND f.uniquename =&#39;FBte0000001&#39; AND
    f.organism_id = o.organism_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>

<pre class="de1"><code>SELECT DISTINCT(s.synonym_sgml)
  FROM feature f, feature_synonym fs, synonym s, cvterm cvt2
  WHERE f.feature_id = fs.feature_id AND fs.synonym_id = s.synonym_id AND
    fs.is_current = &#39;t&#39; AND fs.is_internal = &#39;f&#39; AND
    s.type_id = cvt2.cvterm_id AND cvt2.name = &#39;fullname&#39; AND
    f.is_obsolete = &#39;f&#39; AND f.uniquename = &#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>FlyBase ID</td>
<td></td>
</tr>
<tr class="odd">
<td>Created/ Updated</td>
<td>

<pre class="de1"><code>SELECT timeaccessioned, timelastmodified
  FROM feature f
  WHERE uniquename = &#39;FBte0000001&#39; AND is_obsolete=&#39;f&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">SEQUENCES &amp; COMPONENTS</td>
</tr>
<tr class="odd">
<td>Complete element (bp)</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE , pub.uniquename
  FROM featureprop fp, feature f, cvterm cvt, featureprop_pub fpp, pub
  WHERE cvt.name=&#39;TE_total_length&#39; AND cvt.cvterm_id=fp.type_id AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBte0000001&#39; AND
    fp.featureprop_id=fpp.featureprop_id AND fpp.pub_id=pub.pub_id AND
    fp.feature_id=f.feature_id;</code></pre>

</td>
</tr>
<tr class="even">
<td>Terminal repeat (bp)</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE , pub.uniquename
  FROM featureprop fp, feature f, cvterm cvt, featureprop_pub fpp, pub
  WHERE cvt.name=&#39;TE_repeat_length&#39; AND cvt.cvterm_id=fp.type_id AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBte0000001&#39; AND
    fp.featureprop_id=fpp.featureprop_id AND fpp.pub_id=pub.pub_id AND
    fp.feature_id=f.feature_id;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Reference sequence</td>
<td></td>
</tr>
<tr class="even">
<td>Component genes</td>
<td>

<pre class="de1"><code>SELECT fp.name
  FROM feature f, feature fp, feature_relationship fr, cvterm cvt
  WHERE fr.subject_id=f.feature_id AND fr.object_id=fp.feature_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;has_component_gene&#39; AND
    f.uniquename=&#39;FBte0000001&#39; AND f.is_obsolete=&#39;f&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">SEQUENCE ACCESSIONS</td>
</tr>
<tr class="even">
<td> </td>
<td></td>
</tr>
<tr class="odd">
<td>Transposon sequence</td>
<td>

<pre class="de1"><code>SELECT dbxref.accession
  FROM dbxref, feature_dbxref fd, feature f, db
  WHERE f.feature_id=fd.feature_id AND dbxref.dbxref_id=fd.dbxref_id AND
    fd.is_current=&#39;f&#39; AND dbxref.db_id=db.db_id AND
    db.name LIKE &#39;GB%&#39; AND f.uniquename=&#39;FBte0000001&#39; AND
    f.is_obsolete=&#39;f&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Flanking sequence</td>
<td>

<pre class="de1"><code>SELECT fo.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, cvterm cvt2
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND cvt.name=&#39;associated_with&#39; AND
    fo.type_id= cvt2.cvterm_id AND cvt2.name=&#39;transposable_element_flanking_region&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">SEQUENCE ONTOLOGY (SO)</td>
</tr>
<tr class="even">
<td>Transposon type</td>
<td>

<pre class="de1"><code>SELECT c.name
  FROM cvterm c, feature f, feature_cvterm fc, cv
  WHERE fc.feature_id=f.feature_id AND c.cvterm_id=fc.cvterm_id AND
    c.cv_id=cv.cv_id AND cv.name=&#39;SO&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">INSERTIONS &amp; COPY NUMBER</td>
</tr>
<tr class="even">
<td>Copy number<br />
and comments</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, feature f, featureprop_pub frp, cvterm cvt, pub
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;TE_copies_in_genome&#39; AND pub.pub_id=frp.pub_id AND
    frp.featureprop_id=fp.featureprop_id AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Search for</td>
<td>

<pre class="de1"><code>SELECT s.name
  FROM feature f, feature_relationship fr, cvterm c, feature s
  WHERE f.feature_id=fr.object_id AND fr.type_id=c.cvterm_id AND
    c.name=&#39;producedby&#39; AND fr.subject_id=s.feature_id AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Sequenced genome</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, feature f, featureprop_pub frp, cvterm cvt, pub
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;TE_copies_in_sequenced_genome&#39; AND pub.pub_id=frp.pub_id AND
    frp.featureprop_id=fp.featureprop_id AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Copies in<br />
sequenced genome</td>
<td>Same as above</td>
</tr>
<tr class="even">
<td>Other genomes</td>
<td></td>
</tr>
<tr class="odd">
<td>Copies in<br />
other genomes</td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">TARGET SITE DUPLICATION</td>
</tr>
<tr class="odd">
<td>Size</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, feature f, featureprop_pub frp, cvterm cvt, pub
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;TE_duplication_length&#39; AND pub.pub_id=frp.pub_id AND
    frp.featureprop_id=fp.featureprop_id AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>consensus sequence</td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, feature f, featureprop_pub frp, cvterm cvt, pub
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;TE_target_sequence&#39; AND pub.pub_id=frp.pub_id AND
    frp.featureprop_id=fp.featureprop_id AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">DERIVATIVES &amp; RELATED CONSTRUCTS</td>
</tr>
<tr class="even">
<td>Named isolates</td>
<td>

<pre class="de1"><code>SELECT fo.name, pub.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, feature_relationship_pub frp,
     pub
  WHERE fo.feature_id=fr.object_id AND f.feature_id=fr.subject_id AND
    fr.type_id=cvt.cvterm_id AND frp.feature_relationship_id=fr.feature_relationship_id AND
    pub.pub_id=frp.pub_id AND cvt.name=&#39;isolate_of&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Characterisation constructs</td>
<td>

<pre class="de1"><code>SELECT fo.name, pub.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, feature_relationship_pub frp,
     pub
  WHERE fo.feature_id=fr.subject_id AND fo.is_obsolete=&#39;f&#39; AND
    f.feature_id=fr.object_id AND fr.type_id=cvt.cvterm_id AND
    frp.feature_relationship_id=fr.feature_relationship_id AND pub.pub_id=frp.pub_id AND
    cvt.name=&#39;in_vitro_descendant_of&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td>Derived constructs</td>
<td>

<pre class="de1"><code>SELECT fo.name, pub.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, feature_relationship_pub frp,
     pub
  WHERE fo.feature_id=fr.subject_id AND fo.is_obsolete=&#39;f&#39; AND
    f.feature_id=fr.object_id AND fr.type_id=cvt.cvterm_id AND
    frp.feature_relationship_id=fr.feature_relationship_id AND pub.pub_id=frp.pub_id AND
    (cvt.name=&#39;in_vitro_descendant_of&#39; OR cvt.name=&#39;belongs_to&#39;) AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Other variants</td>
<td>

<pre class="de1"><code>SELECT fo.name, pub.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, feature_relationship_pub frp,
     pub
  WHERE fo.feature_id=fr.subject_id AND fo.is_obsolete=&#39;f&#39; AND
    f.feature_id=fr.object_id AND fr.type_id=cvt.cvterm_id AND
    frp.feature_relationship_id=fr.feature_relationship_id AND pub.pub_id=frp.pub_id AND
    cvt.name=&#39;alleleof&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">ORTHOLOGS</td>
</tr>
<tr class="odd">
<td>Curated drosophilid orthologs</td>
<td>

<pre class="de1"><code>SELECT fo.name, pub.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, feature_relationship_pub frp,
     pub
  WHERE fo.feature_id=fr.subject_id AND fo.is_obsolete=&#39;f&#39; AND
    f.feature_id=fr.object_id AND fr.type_id=cvt.cvterm_id AND
    frp.feature_relationship_id=fr.feature_relationship_id AND pub.pub_id=frp.pub_id AND
    cvt.name=&#39;homologue&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBte0000001&#39; UNION
SELECT fo.name, pub.uniquename
  FROM feature fo, feature f, feature_relationship fr, cvterm cvt, feature_relationship_pub frp,
     pub
  WHERE fo.feature_id=fr.object_id AND fo.is_obsolete=&#39;f&#39; AND
    f.feature_id=fr.subject_id AND fr.type_id=cvt.cvterm_id AND
    frp.feature_relationship_id=fr.feature_relationship_id AND pub.pub_id=frp.pub_id AND
    cvt.name=&#39;homologue&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">COMMENTS</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, feature f, featureprop_pub frp, cvterm cvt, pub
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;comment&#39; AND pub.pub_id=frp.pub_id AND
    frp.featureprop_id=fp.featureprop_id AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">OTHER INFORMATION</td>
</tr>
<tr class="odd">
<td colspan="2">ETYMOLOGY</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, feature f, featureprop_pub frp, cvterm cvt, pub
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;etymology&#39; AND pub.pub_id=frp.pub_id AND
    frp.featureprop_id=fp.featureprop_id AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">PHYLOGENETIC RANGE</td>
</tr>
<tr class="even">
<td> </td>
<td>

<pre class="de1"><code>SELECT fp.VALUE, pub.uniquename
  FROM featureprop fp, feature f, featureprop_pub frp, cvterm cvt, pub
  WHERE fp.feature_id=f.feature_id AND fp.type_id=cvt.cvterm_id AND
    cvt.name=&#39;phylogentic_range&#39; AND pub.pub_id=frp.pub_id AND
    frp.featureprop_id=fp.featureprop_id AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td colspan="2">EXTERNAL CROSSREFERENCES &amp; LINKOUTS</td>
</tr>
<tr class="even">
<td colspan="2">SEQUENCE CROSSREFERENCES</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT dbxref.accession
  FROM dbxref, feature_dbxref fd, feature f, db
  WHERE f.feature_id=fd.feature_id AND dbxref.dbxref_id=fd.dbxref_id AND
    fd.is_current=&#39;f&#39; AND dbxref.db_id=db.db_id AND
    (db.name LIKE &#39;GB%&#39; OR db.name =&#39;UNIPROT/TREMBL&#39; )AND f.uniquename=&#39;FBte0000001&#39; AND
    f.is_obsolete=&#39;f&#39; AND fd.is_current=&#39;t&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">OTHER CROSSREFERENCES</td>
</tr>
<tr class="odd">
<td> </td>
<td></td>
</tr>
<tr class="even">
<td colspan="2">LINKOUTS</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, db.name, accession
  FROM feature f, feature_dbxref fd, dbxref dx, dbxrefprop dxp, cvterm cvt
  WHERE f.feature_id = fd.feature_id AND fd.dbxref_id = dx.dbxref_id AND
    dx.dbxref_id = dxp.dbxref_id AND dxp.type_id = cvt.cvterm_id AND
    cvt.name = &#39;linkout&#39; AND f.is_obsolete=&#39;f&#39; AND
    f.uniquename = &#39;FBsf0000000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">SYNONYMS &amp; SECONDARY IDs</td>
</tr>
<tr class="odd">
<td colspan="2">REPORTED AS</td>
</tr>
<tr class="even">
<td>Symbol Synonym</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml, pub.uniquename
  FROM feature_synonym fs, feature f, synonym s, cvterm cvt, pub
  WHERE fs.feature_id=f.feature_id AND fs.synonym_id=s.synonym_id AND
    fs.is_internal=&#39;f&#39; AND fs.pub_id=pub.pub_id AND
    cvt.cvterm_id=s.type_id AND cvt.name=&#39;symbol&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBti0000001&#39;;</code></pre>

</td>
</tr>
<tr class="odd">
<td>Name Synonym</td>
<td>

<pre class="de1"><code>SELECT s.synonym_sgml, pub.uniquename
  FROM feature_synonym fs, feature f, synonym s, cvterm cvt, pub
  WHERE fs.feature_id=f.feature_id AND fs.synonym_id=s.synonym_id AND
    fs.is_internal=&#39;f&#39; AND fs.pub_id=pub.pub_id AND
    cvt.cvterm_id=s.type_id AND cvt.name=&#39;fullname&#39; AND
    f.is_obsolete=&#39;f&#39; AND f.uniquename=&#39;FBte0000001&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">SECONDARY FLYBASE IDs</td>
</tr>
<tr class="odd">
<td> </td>
<td>

<pre class="de1"><code>SELECT dbxref.accession
  FROM dbxref, feature_dbxref fd, feature f, db
  WHERE f.feature_id=fd.feature_id AND dbxref.dbxref_id=fd.dbxref_id AND
    fd.is_current=&#39;f&#39; AND dbxref.db_id=db.db_id AND
    db.name=&#39;FlyBase&#39; AND f.uniquename=&#39;FBte0000001&#39; AND
    f.is_obsolete=&#39;f&#39;;</code></pre>

</td>
</tr>
<tr class="even">
<td colspan="2">REFERENCES</td>
</tr>
<tr class="odd">
<td>Research paper</td>
<td>

<pre class="de1"><code>SELECT f.uniquename, f.name, cvt.name AS pub_type, p.uniquename AS FBrf_id, miniref AS citation
  FROM feature f, feature_pub fp, pub p, cvterm cvt
  WHERE f.feature_id = fp.feature_id AND fp.pub_id = p.pub_id AND
    p.type_id = cvt.cvterm_id AND f.uniquename = &#39;FBte0000001&#39; ORDER BY cvt.name;</code></pre>

</td>
</tr>
<tr class="even">
<td>Supplementary material</td>
<td></td>
</tr>
<tr class="odd">
<td>Review</td>
<td></td>
</tr>
<tr class="even">
<td>Abstract</td>
<td></td>
</tr>
<tr class="odd">
<td>Other</td>
<td></td>
</tr>
</tbody>
</table>

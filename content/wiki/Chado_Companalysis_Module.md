---
title: "Chado Companalysis Module"
---




<span id="top"></span>




# <span dir="auto">Chado Companalysis Module</span>









The companalysis module is designed for the storage of computational
sequence analysis. The key concept is that the results of a
computational analysis can be interpreted or described as a sequence
feature.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Using the
  companalysis module</span>](#Using_the_companalysis_module)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Alignment
    Results in Flybase</span>](#Alignment_Results_in_Flybase)
    - [<span class="tocnumber">1.1.1</span>
      <span class="toctext">Background</span>](#Background)
    - [<span class="tocnumber">1.1.2</span>
      <span class="toctext">General
      implementation</span>](#General_implementation)
    - [<span class="tocnumber">1.1.3</span>
      <span class="toctext">Examples</span>](#Examples)
    - [<span class="tocnumber">1.1.4</span>
      <span class="toctext">Evidence data types in
      chado</span>](#Evidence_data_types_in_chado)
      - [<span class="tocnumber">1.1.4.1</span>
        <span class="toctext">Aligned
        features</span>](#Aligned_features)
      - [<span class="tocnumber">1.1.4.2</span>
        <span class="toctext">Predicted
        features</span>](#Predicted_features)
- [<span class="tocnumber">2</span>
  <span class="toctext">Tables</span>](#Tables)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Table:
    analysis</span>](#Table:_analysis)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Table:
    analysisfeature</span>](#Table:_analysisfeature)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Table:
    analysisprop</span>](#Table:_analysisprop)
  - [<span class="tocnumber">2.4</span> <span class="toctext">UML
    diagram</span>](#UML_diagram)



# <span id="Using_the_companalysis_module" class="mw-headline">Using the companalysis module</span>

The following are examples showing how to use this module to describe
the results from a given computational analysis.

## <span id="Alignment_Results_in_Flybase" class="mw-headline">Alignment Results in Flybase</span>

Written by Andy Schroeder, the original Wiki page is here: <a
href="http://cedar.bio.indiana.edu/mediawiki/index.php/Aligned_computational_analyses_implementation"
class="external free"
rel="nofollow">http://cedar.bio.indiana.edu/mediawiki/index.php/Aligned_computational_analyses_implementation</a>.

### <span id="Background" class="mw-headline">Background</span>

Alignment of nucleic acids and conceptually back translated proteins to
the genomic chromosomal arms provides much of the evidence for gene
model annotation. Several different algorithms have been employed to
produce alignments of various types of features to the chromosomal arms.
The aligned features and the corresponding alignments are implemented in
chado in a similar manner for each of the analyses.

There also exists sets of data primarily derived from gene prediction
algorithms in which non-localized alignment match features and their
associated genome localized match features (analogous to hsp matches)
are stored. These localized match features are only localized via
featureloc to the genome and not to a second type of feature.

### <span id="General_implementation" class="mw-headline">General implementation</span>

**Nucleotide and protein alignments**

         ----------------------------------------------  genome
                 ^                   ^
                 |   _______A______  |          alignment feature type = match
            floc |    ^          ^   | floc (rank = 0)
                 |    | f_r  f_r |   |
                --B----        ---C---        hsp feature type = match
                      |        |
                 floc |        | floc (rank = 1)
                      V        V
                      ----D-----              aligned feature type = EST, cDNA, protein etc.

**Predicted features**

         ----------------------------------------------  genome
                 ^                   ^
                 |   _______A______  |          alignment feature type = match
            floc |    ^          ^   | floc (rank = 0)
                 |    | f_r  f_r |   |
                --B----        ---C---        hsp feature type = match

### <span id="Examples" class="mw-headline">Examples</span>

See the diagrams above.

Feature A (uniquename = 4191059_sim4) is the alignment feature of type
*match*.

- *feature.is_analysis* = 't'
- this is an abstract feature used to group and order HSP features
- feature A is linked to the HSP features B and C via a
  *feature_relationship* with feature A as the object and features B and
  C as subjects with the *feature_relationship* rank indicating ordering
  of features
  - note that the rank has not been implemented for many of the current
    alignments (sim4 and sim4tandem)
- this feature is linked to *analysis* via *analysisfeature*

Feature B (uniquename = 10425228) and feature C (uniquename = 10425229)
are HSP features.

- *feature.is_analysis* = 't'
- the HSP features linked via *feature_relationship* as described above
  to explicitly represent ordering and grouping and are linked via a
  *partof* relationship type
- these features are located to the genome (*srcfeature.id* = arm) and
  this featureloc info has *featureloc.rank* = 0
- the HSPs are also linked to the specific analysis via
  *analysisfeature*
  - for aligned sequences these features are also located to the aligned
    feature (i.e. cDNA, EST etc.) and this featureloc info has a
    *featureloc.rank* = 1
- note that this only applies to aligned sequences and not gene
  predictions

Feature D (uniquename = CO056789) is the aligned feature i.e. cDNA, EST,
protein.

- feature.is_analysis = 't'
- the aligned HSPs are located to this feature via *featureloc* with
  featureloc.rank = 1
- *featureloc.residue_info* should contain the residues of this feature
  that correspond to the extent of the HSP
  - note that the *residue_info* is specific to the type of feature that
    is aligned (for example if a protein is aligned to the genome via
    blastx then the *featureloc.residue_info* should be aminoacid
    residues)

### <span id="Evidence_data_types_in_chado" class="mw-headline">Evidence data types in chado</span>

#### <span id="Aligned_features" class="mw-headline">Aligned features</span>

Here is a list from 'chado_dmel_r4_3_16a_reporting' of aligned feature
types and the algorithms used to align them (not filtered by species).

    SQL query:
    SELECT DISTINCT c.name as feature_type, a.program
    FROM   feature alg, feature hsp, analysisfeature af, analysis a, cvterm c, featureloc fl
    WHERE  hsp.feature_id = af.feature_id and af.analysis_id = a.analysis_id
    and    hsp.feature_id = fl.feature_id and alg.feature_id = fl.srcfeature_id
    and    fl.rank = 1 and c.cvterm_id = alg.type_id
    ORDER BY program;

    results:
       feature_type       |           program
    ----------------------+------------------------------
     so                   | assembly
     BAC                  | bdgp_unknown_clonelocator
     EST                  | blastn
     protein              | blastx_masked
     oligonucleotide      | dmel_r3_to_dmel_r4_migration
     protein              | prosplign
     RepeatMasker:dummy   | repeatmasker
     so                   | repeatmasker
     EST                  | sim4
     alignment            | sim4
     mRNA                 | sim4
     ncRNA                | sim4
     pseudogene           | sim4
     rRNA                 | sim4
     region               | sim4
     snRNA                | sim4
     snoRNA               | sim4
     so                   | sim4
     tRNA                 | sim4
     transposable_element | sim4
     cDNA                 | sim4tandem
     so                   | sim4tandem
     cDNA                 | splign
     protein              | tblastn
     EST                  | tblastx_masked
     so                   | tblastx_masked
     DNA                  | tblastxwrap_masked
     so                   | tblastxwrap_masked
    (28 rows)

#### <span id="Predicted_features" class="mw-headline">Predicted features</span>

Note that this was determined by a process of elimination from the
results of the following query:

    SELECT DISTINCT c.name, a.program
      FROM feature map_feat, feature hsp, analysisfeature af,
           analysis a, cvterm c, feature_relationship fr
     WHERE hsp.feature_id = af.feature_id and af.analysis_id = a.analysis_id
       and hsp.feature_id = fr.subject_id  and map_feat.feature_id = fr.object_id
       and c.cvterm_id = map_feat.type_id ORDER BY program;

    and then removing those matches that corresponded to the alignment features for the
    part A query

          name       |           program
    -----------------+------------------------------
     match           | augustus
     match           | genewise
     match           | genie_masked
     match           | genscan
     match           | genscan_masked
     match           | promoter
     match           | repeat_runner_seg
     match           | tRNAscan-SE
     syntenic_region | tblastn
     match           | twinscan

  

# <span id="Tables" class="mw-headline">Tables</span>

## <span id="Table:_analysis" class="mw-headline">Table: analysis</span>

An analysis is a particular type of a computational analysis; it may be
a blast of one sequence against another, or an all by all blast, or a
different kind of analysis altogether. It is a single unit of
computation.

<table data-border="1" data-cellpadding="3">
<caption>analysis Structure</caption>
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
<td>analysis_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>name</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
A way of grouping analyses. This should be a handy short identifier that
can help people find an analysis they want. For instance "tRNAscan",
"cDNA", "FlyPep", "SwissProt", and it should not be assumed to be
unique. For instance, there may be lots of separate analyses done
against a cDNA database.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>description</td>
<td>text</td>
<td><em></em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>program</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Program name, e.g. blastx, blastp, sim4, genscan.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>programversion</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1 NOT NULL</em><br />
<br />
Version description, e.g. TBLASTX 2.0MP-WashU [09-Nov-2000].</td>
</tr>
<tr class="even tr1">
<td></td>
<td>algorithm</td>
<td>character varying(255)</td>
<td><em></em><br />
<br />
Algorithm name, e.g. blast.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>sourcename</td>
<td>character varying(255)</td>
<td><em>UNIQUE#1</em><br />
<br />
Source name, e.g. cDNA, SwissProt.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>sourceversion</td>
<td>character varying(255)</td>
<td><em></em></td>
</tr>
<tr class="odd tr0">
<td></td>
<td>sourceuri</td>
<td>text</td>
<td><em></em><br />
<br />
This is an optional, permanent URL or URI for the source of the
analysis. The idea is that someone could recreate the analysis directly
by going to this URI and fetching the source data (e.g. the blast
database, or the training model).</td>
</tr>
<tr class="even tr1">
<td></td>
<td>timeexecuted</td>
<td>timestamp without time zone</td>
<td><em>NOT NULL DEFAULT ('now'::text)::timestamp(6) with time
zone</em></td>
</tr>
</tbody>
</table>

analysis Structure

Tables referencing this one via Foreign Key Constraints:

- [analysisfeature](Chado_Tables#Table:_analysisfeature "Chado Tables")

<!-- -->

- [analysisprop](Chado_Tables#Table:_analysisprop "Chado Tables")

<!-- -->

- [quantification](Chado_Tables#Table:_quantification "Chado Tables")

------------------------------------------------------------------------

  

## <span id="Table:_analysisfeature" class="mw-headline">Table: analysisfeature</span>

Computational analyses generate features (e.g. Genscan generates
transcripts and exons; sim4 alignments generate similarity/match
features). analysisfeatures are stored using the feature table from the
sequence module. The analysisfeature table is used to decorate these
features, with analysis specific attributes. A feature is an
analysisfeature if and only if there is a corresponding entry in the
analysisfeature table. analysisfeatures will have two or more featureloc
entries, with rank indicating query/subject

<table data-border="1" data-cellpadding="3">
<caption>analysisfeature Structure</caption>
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
<td>analysisfeature_id</td>
<td>serial</td>
<td><em>PRIMARY KEY</em></td>
</tr>
<tr class="even tr1">
<td><p><a href="Chado_Tables#Table:_feature"
title="Chado Tables">feature</a></p></td>
<td>feature_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="odd tr0">
<td><p><a href="Chado_Tables#Table:_analysis"
title="Chado Tables">analysis</a></p></td>
<td>analysis_id</td>
<td>integer</td>
<td><em>UNIQUE#1 NOT NULL</em></td>
</tr>
<tr class="even tr1">
<td></td>
<td>rawscore</td>
<td>double precision</td>
<td><em></em><br />
<br />
This is the native score generated by the program; for example, the
bitscore generated by blast, sim4 or genscan scores. One should not
assume that high is necessarily better than low.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>normscore</td>
<td>double precision</td>
<td><em></em><br />
<br />
This is the rawscore but semi-normalized. Complete normalization to
allow comparison of features generated by different programs would be
nice but too difficult. Instead the normalization should strive to
enforce the following semantics: * normscores are floating point numbers
&gt;= 0, * high normscores are better than low one. For most programs,
it would be sufficient to make the normscore the same as this rawscore,
providing these semantics are satisfied.</td>
</tr>
<tr class="even tr1">
<td></td>
<td>significance</td>
<td>double precision</td>
<td><em></em><br />
<br />
This is some kind of expectation or probability metric, representing the
probability that the analysis would appear randomly given the model. As
such, any program or person querying this table can assume the following
semantics: * 0 &lt;= significance &lt;= n, where n is a positive number,
theoretically unbounded but unlikely to be more than 10 * low numbers
are better than high numbers.</td>
</tr>
<tr class="odd tr0">
<td></td>
<td>identity</td>
<td>double precision</td>
<td><em></em><br />
<br />
Percent identity between the locations compared. Note that these 4
metrics do not cover the full range of scores possible; it would be
undesirable to list every score possible, as this should be kept
extensible. instead, for non-standard scores, use the analysisprop
table.</td>
</tr>
</tbody>
</table>

analysisfeature Structure

------------------------------------------------------------------------

  

## <span id="Table:_analysisprop" class="mw-headline">Table: analysisprop</span>

| F-Key | Name | Type | Description |
|----|----|----|----|
|  | analysisprop_id | serial | *PRIMARY KEY* |
| [analysis](Chado_Tables#Table:_analysis "Chado Tables") | analysis_id | integer | *UNIQUE#1 NOT NULL* |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables") | type_id | integer | *UNIQUE#1 NOT NULL* |
|  | value | text | *UNIQUE#1* |

analysisprop Structure

------------------------------------------------------------------------

## <span id="UML_diagram" class="mw-headline">UML diagram</span>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1d/ChadoMod-Companalysis.png/600px-ChadoMod-Companalysis.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1d/ChadoMod-Companalysis.png/900px-ChadoMod-Companalysis.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1d/ChadoMod-Companalysis.png/1200px-ChadoMod-Companalysis.png 2x"
width="600" height="360" alt="ChadoMod-Companalysis.png" />




[Categories](Special%253ACategories "Special%253ACategories"):

- [Analysis](Category%253AAnalysis "Category%253AAnalysis")
- [BLAST](Category%253ABLAST "Category%253ABLAST")
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Companalysis_Module"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 10:04 on 26 May
  2010.</span>
<!-- - <span id="footer-info-viewcount">92,736 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





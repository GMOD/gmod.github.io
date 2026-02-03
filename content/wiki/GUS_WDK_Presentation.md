---
title: "GUS WDK Presentation"
---
# GUS WDK Presentation

  Overview](#Overview)
- [The GUS Perl
  Object Layer](#The_GUS_Perl_Object_Layer)
- [The GUS
  WDK](#The_GUS_WDK)





#### Overview

Genome databases typically have distinct layers

- batch data production
- data presentation
- curation

<a href="http://www.plasmodb.org" class="external text"
rel="nofollow">PlasmoDB</a>, the Genome Resource for Plasmodium, the
malaria parasite, is a warehouse that integrates a large number of data
sources about Plasmodium. It does not do curation. The experience of
PlasmoDB is that the batch data production back end and the web front
end have very different middleware needs.

The PlasmoDB uses

- backend: the GUS Perl Object Layer
- frontend: the GUS Web Development Kit

#### The GUS Perl Object Layer

The GUS Perl Object Layer is an in-house developed O-R layer specific to
GUS databases. It was presented at the caucus only briefly as an example
backend layer.

- Written eight years ago (Mark Gibson/Brian Brunk)
  - There were no Perl O-R tools available
- One table \<-\> one object (including linking tables)
  - Columns become accessors: getScore(), setScore()
  - Relationships modeled with get/setChild() and get/setParent()
  - Conscious of “one-level” subclassing (GUS style)
- Cascading retrieve, update, delete
  - Cascade can also follow parent links
- Default transaction scope: one object graph
  - Or, you can manually control transactions
- Simple object retrieval “language”
  - Equal in power to a single table select
  - Can also retrieve by navigation
- Code generator
- Recently evaluated Class::DBI
  - Would have worked nicely, but we didn’t transition
  - Nice subclassing model

#### The GUS WDK

The GUS WDK is a presentation layer toolkit (for any relational schema).
It uses a M-V-C design. The focus of this caucus is O-R middleware,
which corresponds to the WDK's Model.

The intention of the WDK Model's design is to allow non-programmers to
design coarse grained objects that correspond to the entities presented
to a user in a web UI, and to specify the queries that users can ask
with respect to those entities.

The WDK's Model is configured in XML. The model author specifies

- record classes (eg Gene, SNP)
- queries against those classes
- site content

Here is a sample specification of an ArrayElement entity:

``` de1
<wdkModel>
<recordClass idPrefix="" name="ArrayElementRecordClass" type="Array Element">

  <attributeQueryRef ref="ArrayElementAttributes.ProviderAndOrganism">
     <columnAttribute name="provider" displayName="Provider"/>
     <columnAttribute name="genus_species" displayName="genus_species"/>
     <columnAttribute name="organism" displayName="Organism"/>
     <columnAttribute name="sequence" displayName="Sequence"/>
  </attributeQueryRef>

  <table name="GenomicLocations" displayName="Genomic Locations"
               queryRef="ArrayElementTables.GenomicLocations">
    <columnAttribute name="source_id" internal="true"/>
    <linkAttribute name="genomicSequence" displayName="Genomic Sequence"
                   visible="$$source_id$$">
      <url>
        <![CDATA[showRecord.do?name=SequenceRecordClasses.SequenceRecordClass&primary_key=$$source_id$$]]>
      </url>
    </linkAttribute>
    <columnAttribute name="min_subject_start" displayName="Start"/>
    <columnAttribute name="max_subject_end" displayName="End"/>
    <columnAttribute name="gbrowse_start" internal="true"/>
    <columnAttribute name="gbrowse_end" internal="true"/>
    <columnAttribute name="max_subject_end" displayName="End"/>
    <columnAttribute name="is_reversed" displayName="Reversed"/>
    <linkAttribute name="gbrowseLink" displayName="Genome Browser" visible="view">
      <url>
         <![CDATA[@CGI_URL@/gbrowse/plasmodb/?name=$$source_id$$:$$gbrowse_start$$-$$gbrowse_end$$;enable=AnnotatedGenes]]>
      </url>
    </linkAttribute>
  </table>

  <table name="Genes" displayName="Mapped Genes" queryRef="ArrayElementTables.Genes">
     <columnAttribute name="source_id" internal="true"/>
     <linkAttribute name="gene" displayName="Gene" visible="$$source_id$$">
       <url>
         <![CDATA[showRecord.do?name=GeneRecordClasses.GeneRecordClass&primary_key=$$source_id$$]]>
       </url>
     </linkAttribute>
  </table>
</recordClass>

<querySet name="ArrayElementAttributes">
  <sqlQuery name="ProviderAndOrganism" isCacheable="false">
      <paramRef ref="params.primaryKey"/>
      <column name="provider"/>
      <column name="genus_species"/>
      <column name="sequence"/>
      <column name="organism"/>
      <syntaxhighlight lang="sql">
      <![CDATA[
            SELECT ens.source_id, ed.name as provider, ens.sequence,
                   tn.name as genus_species,
                   SUBSTR(tn.name, 1, 1) | '. '
                   | SUBSTR(tn.name, INSTR(tn.name, ' ', 1, 1) +1) as organism
            FROM sres.ExternalDatabase ed, sres.ExternalDatabaseRelease edr,
                 dots.ExternalNASequence ens, sres.TaxonName tn
            WHERE ens.source_id = '$$primaryKey$$'
              AND ens.external_database_release_id = edr.external_database_release_id
              AND edr.external_database_id = ed.external_database_id
              AND tn.taxon_id = ens.taxon_id
              AND tn.name_class = 'scientific name'
             ]]>
```

     </sqlQuery>

\</querySet\>

\<querySet name="ArrayElementTables"\>

     <sqlQuery name="Genes" isCacheable="false">
       <paramRef ref="params.primaryKey"/>
       <column name="source_id" />

``` de1
    <![CDATA[
              SELECT t.source_id
              FROM dots.Similarity s, dots.Transcript t,
                   dots.ExternalNaSequence ens,
                   core.TableInfo ti1, core.TableInfo ti2
              WHERE ens.source_id = '$$primaryKey$$'
                AND ens.na_sequence_id = s.query_id
                AND 'ExternalNASequence' = ti1.name
                AND ti1.table_id = s.query_table_id
                AND 'Transcript' = ti2.name
                AND ti2.table_id = s.subject_table_id
                AND t.na_feature_id = s.subject_id
             ]]>
```

     </sqlQuery>

     <sqlQuery name="GenomicLocations" isCacheable="false">
       <paramRef ref="params.primaryKey"/>
       <column name="source_id" />
       <column name="min_subject_start" />
       <column name="max_subject_end" />
       <column name="gbrowse_start" />
       <column name="gbrowse_end" />
       <column name="is_reversed" />

``` de1
     <![CDATA[
              SELECT ens2.source_id, s.min_subject_start, s.max_subject_end,
                     s.is_reversed,
                     s.min_subject_start - 25000 AS gbrowse_start,
                     s.min_subject_start + 25000 AS gbrowse_end
              FROM dots.Similarity s,
                   dots.ExternalNaSequence ens1,
                   core.TableInfo ti1,
                   sres.ExternalDatabase ed2,
                   sres.ExternalDatabaseRelease edr2,
                   dots.ExternalNaSequence ens2,
                   core.TableInfo ti2
              WHERE ens1.source_id = '$$primaryKey$$'
                AND ens1.na_sequence_id = s.query_id
                AND 'ExternalNASequence' = ti1.name
                AND ti1.table_id = s.query_table_id
                AND ed2.name IN ('Sanger P. falciparum chromosomes',
                                 'Jane Carlton P. yoelii chromosomes')
                AND ed2.external_database_id = edr2.external_database_id
                AND edr2.external_database_release_id = ens2.external_database_release_id
                AND ens2.na_sequence_id = s.subject_id
                AND 'ExternalNASequence' = ti2.name
                AND ti2.table_id = s.subject_table_id
             ]]>
```

     </sqlQuery>

\</querySet\> \</wdkModel\>

\</syntaxhighlight\>

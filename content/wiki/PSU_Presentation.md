---
title: "PSU Presentation"
---
# PSU Presentation

This Wiki page is an edited version of
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/56/PSU.pdf" class="internal"
title="PSU.pdf">Chinmay's presentation</a>.

  Pathogen Sequencing Unit
  (PSU)</span>](#Sanger_Pathogen_Sequencing_Unit_.28PSU.29)
- [Technical -
  Connections](#Technical_-_Connections)
- [Technical -
  Code Generation](#Technical_-_Code_Generation)
- [Technical -
  Transactions](#Technical_-_Transactions)
- [Problems 1, 2,
  & 3](#Problems_1.2C_2.2C_.26_3)
- [Demo – Sample
  Problem](#Demo_.E2.80.93_Sample_Problem)

##### Sanger Pathogen Sequencing Unit (PSU)

- GeneDB is the organism data and annotation database for the Pathogen
  Sequencing Unit (PSU) at the Sanger Institute, UK
- Contains 37 organisms, which is expected to grow to 62
- [Artemis](Artemis "Artemis") is an annotation/DNA graphical interface
- PSU is currently migrating to chado schema
- We've implemented a common interface with the two leading open source
  frameworks: Hibernate and iBatis

##### Technical - Connections

Connections for the **Hibernate** engine are configured in the Spring
configuration file

``` de1
<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource">
               <property name="driverClassName" value="org.postgresql.Driver" />
               <property name="url" value="jdbc:postgresql://holly.sanger.ac.uk:5432/chado" />
               <property name="username" value="DELIBERATELY_BOGUS_NAME"/>
               <property name="password" value="WIBBLE" />
</bean>
```

- Uses a connection pool
- Connection to the database is specified graphically, so the **iBatis**
  configuration file has variables for the location:

``` de1
<property name="JDBC.Driver" value="org.postgresql.Driver"/>

<property name="JDBC.ConnectionURL” value="jdbc:postgresql://${chado}"/>

<property name="JDBC.Username" value="${username}"/>

<property name="JDBC.Password" value="${password}"/>
```

- provide database location, username & password
- select from scrollable list of feature with residues (organisms in
  separate Postgres schemas) what to open in Artemis

##### Technical - Code Generation

- The shared interface and hibernate implementation were originally
  generated
- There’s no explicit code generation (although the Spring and Hibernate
  runtimes may use them behinds the scenes)

##### Technical - Transactions

- Transactions are fully supported

##### Problems 1, 2, & 3

Creating a gene

``` de1
genes[0] = new Feature(ORG, GENE, "xfile", false, false, now, now);

genes[0].setSeqLen(1029);
sequenceDao.persist(genes[0]);

FeatureLoc loc = new FeatureLoc(SOURCE_FEATURE, genes[0], 13691, false, 14720, false, (short)1, 0, 0 ,0);

sequenceDao.persist(loc);

addFeatureProp(genes[0], "description", "A test gene for GMOD meeting");

addSynonymsToFeature(genes[0], "mulder", "scully");

createExon("exon1", genes[0], 13691, 13767, now, 0);

createExon("exon2", genes[0], 14687, 14720, now, 1);
```

Retrieve a gene

``` de1
Feature f = sequenceDao.getFeatureByUniqueName("xfile");
displayGene(f);
```

Update a gene

``` de1
genes[0].setUniqueName("x-file");

sequenceDao.merge(genes[0]);
```



``` de1
private Feature createExon(String name, Feature gene, int min, int max, Timestamp now, int rank) {

        Feature exon = new Feature(ORG, EXON, name, false, false, now, now);
        exon.setSeqLen(max-min);
        sequenceDao.persist(exon);

        FeatureLoc loc = new FeatureLoc(SOURCE_FEATURE, exon, min, false, max, false,
                                      (short)1, 0, 0 ,0);
        sequenceDao.persist(loc);

        return exon;

}
```

##### Demo – Sample Problem

Simple web page to demonstrate displaying a basic feature

``` de1
<st:section name="Naming" id="gene_naming" collapsed="false" collapsible="false"
hideIfEmpty="true">
   <dl>
            <dt><b>symbol:</b></dt>
            <dd>${feature.uniqueName}</dd>
  </dl>
  <db:synonym name="synonym" var="name" collection="${feature.featureSynonyms}">
    <br /><b>Synonym:</b> <db:list-string collection="${name}" />
  </db:synonym>
  <dt><b>Type:</b></dt>
  <dd>${feature.cvTerm.name}</dd>

<st:section name="Exons" collapsed="false" collapsible="true" hideIfEmpty="true">
            <display:table name="exons" uid="tmp" pagesize="30" class="simple" cellspacing="0"
cellpadding="4">
                 <display:column property="uniqueName" title="Exon"/>
                 <display:column property="featureLocsForSrcFeatureId.fmin" title="Start"/>
                 <display:column property="featureLocsForSrcFeatureId.fmax" title="end"/>
            </display:table>
</st:section>

<st:section name="cds" collapsible="true">
            <b>${feature.residues}</b>
</st:section>
```

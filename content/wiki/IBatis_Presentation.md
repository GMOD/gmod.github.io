---
title: "IBatis Presentation"
---
# IBatis Presentation

Jeff Bowes, Xenbase, University of Calgary. This Wiki section is an
edited version of
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2e/IBatis.pdf" class="internal"
title="IBatis.pdf">Jeff's presentation</a>.

  ibatis](#ibatis)
- [Abator](#Abator)
- [Abator
  Example](#Abator_Example)
- [Abator
  Example](#Abator_Example_2)
- [Abator
  Example](#Abator_Example_3)
- [Abator](#Abator_2)
- [DAO
  Methods](#DAO_Methods)
- [Insert](#Insert)
- [Insert](#Insert_2)
- [Insert](#Insert_3)
- [Insert](#Insert_4)
- [Insert](#Insert_5)
- [Problem 1 -
  Insert](#Problem_1_-_Insert)
- [Problem 1 -
  Insert](#Problem_1_-_Insert_2)
- [Transactions](#Transactions)
- [Retrieval](#Retrieval)
- [Problem 2 -
  Master Detail Reports](#Problem_2_-_Master_Detail_Reports)
- [Problem 2 -
  Master Detail Report](#Problem_2_-_Master_Detail_Report)
- [Master Detail
  Report](#Master_Detail_Report)
- [Dynamic
  Queries](#Dynamic_Queries)
- [Dynamic
  Queries](#Dynamic_Queries_2)
- [Dynamic
  Queries](#Dynamic_Queries_3)
- [Miscellaneous
  Features](#Miscellaneous_Features)
- [Support](#Support)
- [What iBatis
  Does Well](#What_iBatis_Does_Well)
- [Acknowledgements](#Acknowledgements)

##### ibatis

- iBatis
  - Light-weight framework
  - Still based on SQL but eliminates the repetitive drudgery of JDBC
  - You can tune a query by re-writing the SQL in XML & the API does not
    change.
- iBatis does not create your database in memory as objects
- Shallow learning curve
- Manually create a Java class and SQL map to describe higher-level
  objects
  - Example: *Gene*
- Support for inheritance
  - Inheritance in result maps, allows fair amount of re-use.
- Supports different transaction schemes
  - For example, JDBC, Java Transaction API

##### Abator

- Generates ibatis CRUD objects by introspecting database tables
- Abator creates *SQL in XML* files (SQL Map files) and Java classes
  - Within these files is a Result Map section.
- Abator config files are simple, set connection parameters, tell where
  the files are.
- In the SQL Map files you can specify how to find parent ids, such as
  feature_id.

##### Abator Example

``` de1
 <abatorConfiguration>
  <abatorContext>    <!-- TODO: Add Database Connection Information -->
    <jdbcConnection driverClass="COM.ibm.db2.jdbc.app.DB2Driver"
        connectionURL="jdbc:db2:XBDV05"
        userId="db2inst1"
        password=“*******">
      <classPathEntry location="/Program Files/IBM/SQLLIB/java/db2java.zip" />
    </jdbcConnection>

    <javaModelGenerator
   targetPackage="org.gmod.architecture.framework.bakeoff.abator.model"
   targetProject="gene" />
    <sqlMapGenerator
   targetPackage="org.gmod.architecture.framework.bakeoff.abator.sql"
   targetProject="gene" />
    <daoGenerator type="IBATIS"
   targetPackage="org.gmod.architecture.framework.bakeoff.abator.dao"
   targetProject="gene" />
 <abatorConfiguration>
```

##### Abator Example

``` de1
 <abatorConfiguration>
  <abatorContext>    <!-- TODO: Add Database Connection Information -->
    <jdbcConnection driverClass="COM.ibm.db2.jdbc.app.DB2Driver"
        connectionURL="jdbc:db2:XBDV05"
        userId="db2inst1"
        password=“*******">
      <classPathEntry location="/Program Files/IBM/SQLLIB/java/db2java.zip" />
    </jdbcConnection>

    <javaModelGenerator
   targetPackage="org.gmod.architecture.framework.bakeoff.abator.model"
   targetProject="gene" />
    <sqlMapGenerator
   targetPackage="org.gmod.architecture.framework.bakeoff.abator.sql"
   targetProject="gene" />
    <daoGenerator type="IBATIS"
   targetPackage="org.gmod.architecture.framework.bakeoff.abator.dao"
   targetProject="gene" />
 <abatorConfiguration>
```

##### Abator Example

``` de1
 <table schema="db2inst1" tableName="synonym"></nowiki>
      <generatedKey column="synonym_id" sqlStatement="VALUES PREVVAL FOR
             synonym_seq" identity="true" />
      <columnOverride column="CREATED_BY" jdbcType="INTEGER" />
      <columnOverride column="MODIFIED_BY" jdbcType="INTEGER" />
 </table>
```



##### Abator

Works as:

- Eclipse plug-in
- ANT
- Standalone

##### DAO Methods

- Insert (Feature)
- Update (Feature)
- DeletebyKey (FeatureKey)
- SelectbyKey (FeatureKey)
- SelectbyExample (FeatureExample)
- DeletebyExample (FeatureExample)

##### Insert

``` de1
 <insert id="abatorgenerated_insert" parameterClass=
  "org.gmod.architecture.framework.bakeoff.abator.model.FeatureWithBLOBs">
    insert into db2inst1.feature
            (DBXREF_ID, ORGANISM_ID, NAME, UNIQUENAME,
             RESIDUES, SEQLEN, MD5CHECKSUM, TYPE_ID, IS_ANALYSIS,
             IS_OBSOLETE, CREATED_BY)
    values (#dbxrefId:INTEGER#, #organismId:INTEGER#, #name:VARCHAR#,
            #uniquename:VARCHAR#, #residues:CLOB#, #seqlen:INTEGER#,
            #md5checksum:CHAR#, #typeId:INTEGER#,
            #isAnalysis:SMALLINT#,  #isObsolete:SMALLINT#,
           #createdBy:INTEGER#)

    <selectKey resultClass="java.lang.Integer" keyProperty="featureId">
        VALUES PREVVAL FOR feature_seq
    </selectKey>
  </insert>
```

##### Insert

``` de1
 <insert id="abatorgenerated_insert" parameterClass=
  "org.gmod.architecture.framework.bakeoff.abator.model.FeatureWithBLOBs">
    insert into db2inst1.feature
            (DBXREF_ID, ORGANISM_ID, NAME, UNIQUENAME,
             RESIDUES, SEQLEN, MD5CHECKSUM, TYPE_ID, IS_ANALYSIS,
             IS_OBSOLETE, CREATED_BY)
    values (#dbxrefId:INTEGER#, #organismId:INTEGER#, #name:VARCHAR#,
            #uniquename:VARCHAR#, #residues:CLOB#, #seqlen:INTEGER#,
            #md5checksum:CHAR#, #typeId:INTEGER#,
            #isAnalysis:SMALLINT#,  #isObsolete:SMALLINT#,
                       #createdBy:INTEGER#)

    <selectKey resultClass="java.lang.Integer" keyProperty="featureId">
        VALUES PREVVAL FOR feature_seq
    </selectKey>
  </insert>
```

##### Insert

``` de1
 <insert id="abatorgenerated_insert" parameterClass=
  "org.gmod.architecture.framework.bakeoff.abator.model.FeatureWithBLOBs">
    insert into db2inst1.feature
            (DBXREF_ID, ORGANISM_ID, NAME, UNIQUENAME,
             RESIDUES, SEQLEN, MD5CHECKSUM, TYPE_ID, IS_ANALYSIS,
             IS_OBSOLETE, CREATED_BY)
    values (#dbxrefId:INTEGER#, #organismId:INTEGER#, #name:VARCHAR#,
            #uniquename:VARCHAR#, #residues:CLOB#, #seqlen:INTEGER#,
            #md5checksum:CHAR#, #typeId:INTEGER#,
            #isAnalysis:SMALLINT#,  #isObsolete:SMALLINT#,
           #createdBy:INTEGER#)

    <selectKey resultClass="java.lang.Integer" keyProperty="featureId">
        VALUES PREVVAL FOR feature_seq
    </selectKey>
  </insert>
```

##### Insert

``` de1
 <selectKey resultClass="java.lang.Integer"
            keyProperty="featureId">
        VALUES PREVVAL FOR feature_seq
 </selectKey>
```

##### Insert

``` de1
 <selectKey resultClass="java.lang.Integer"
            keyProperty="featureId">
        VALUES PREVVAL FOR feature_seq
 </selectKey>
```

##### Problem 1 - Insert

``` de1
 try {
  sqlMap.startTransaction();
  pGene.id =featureDAO.insert(pGene.getFeatureWithBLOBs());
  featurepropDAO.insert(pGene.getPropertyDescription());
  pGene.featurelocId = featurelocDAO.insert(pGene
                                   .getFeaturelocWithBLOBS());
  pGene = insertExons(pGene);
  insertSynonyms(pGene);
  sqlMap.commitTransaction();
 } catch (Exception e) {
        System.out.println(e);
        throw (e);
 } finally {
       sqlMap.endTransaction();
 }
```

##### Problem 1 - Insert

``` de1
 try {
  sqlMap.startTransaction();
  pGene.id =featureDAO.insert(pGene.getFeatureWithBLOBs());
  featurepropDAO.insert(pGene.getPropertyDescription());
  pGene.featurelocId = featurelocDAO.insert(pGene
                                   .getFeaturelocWithBLOBS());
  pGene = insertExons(pGene);
  insertSynonyms(pGene);
  sqlMap.commitTransaction();
 } catch (Exception e) {
        System.out.println(e);
        throw (e);
 } finally {
       sqlMap.endTransaction();
 }
```

##### Transactions

- SQLMap
- JDBC
- JTA - Java Transaction API
  - 2-Phase commit
- Hibernate
- External (Customized)

##### Retrieval

    symbol: xfile
    description: A test gene for GMOD meeting
    mRNA Feature
            exon_1: start: 13691 end: 13767
                            strand: 1
                            srcFeature_id: Id of genomic sample
            exon_2:      start: 14687 end: 14720
                             strand: 1
                             srcFeature_id: Id of genomic sample

##### Problem 2 - Master Detail Reports

Account for cycles or recursion in Master Detail Report.

``` de1
 <resultMap id="SelectGeneResults"
   class="org.gmod.architecture.framework.bakeoff.Gene" groupBy="id">
      <result column="FEATURE_ID" property="id" jdbcType="INTEGER"/>
      <result column="GENE_NAME" property="name" jdbcType="VARCHAR" />
      <result column="DESCRIPTION" property="description“
   jdbcType="VARCHAR" />
      <result column="TYPE_ID" property="typeId" jdbcType="INTEGER" />
      <result property="exons" resultMap = "gene.SelectExonResults"/>
  </resultMap>

 <resultMap id="SelectExonResults"
   class="org.gmod.architecture.framework.bakeoff.Exon">
     <result column="EXON_ID" property="id" jdbcType="INTEGER"/>
     <result column="EXON_NAME" property="name" jdbcType="VARCHAR" />
     <result column="EXON_RESIDUES" property="residues" jdbcType="CLOB" />
     <result column="STRAND" property="strand" jdbcType="INTEGER" />
     <result column="FMIN" property="fmin" jdbcType="INTEGER" />
     <result column="FMAX" property="fmax" jdbcType="INTEGER" />
     <result column="SRCFEATURE_ID" property="sourceFeatureId"
   jdbcType="INTEGER" />
 </resultMap>
```

##### Problem 2 - Master Detail Report

``` de1
 <resultMap id="SelectGeneResults"
   class="org.gmod.architecture.framework.bakeoff.Gene" groupBy="id">
      <result column="FEATURE_ID" property="id" jdbcType="INTEGER"/>
      <result column="GENE_NAME" property="name" jdbcType="VARCHAR" />
      <result column="DESCRIPTION" property="description“
   jdbcType="VARCHAR" />
      <result column="TYPE_ID" property="typeId" jdbcType="INTEGER" />
      <result property="exons" resultMap = "gene.SelectExonResults"/>
  </resultMap>

 <resultMap id="SelectExonResults"
   class="org.gmod.architecture.framework.bakeoff.Exon">
     <result column="EXON_ID" property="id" jdbcType="INTEGER"/>
     <result column="EXON_NAME" property="name" jdbcType="VARCHAR" />
     <result column="EXON_RESIDUES" property="residues" jdbcType="CLOB" />
     <result column="STRAND" property="strand" jdbcType="INTEGER" />
     <result column="FMIN" property="fmin" jdbcType="INTEGER" />
     <result column="FMAX" property="fmax" jdbcType="INTEGER" />
     <result column="SRCFEATURE_ID" property="sourceFeatureId"
   jdbcType="INTEGER" />
 </resultMap>
```

##### Master Detail Report

    gene_id  Symbol   Type      Fmin   Fmax
    6129482  x-files  gene      13691   13767
    6129482  x-files  gene      14687   14720

Becomes:

    gene_id  Symbol   Type      Fmin   Fmax
    6129482  x-files  gene      13691   13767
                                              14687   14720

##### Dynamic Queries

- Gene Name (Description)
  - Feature, Featureprop
- Symbol
  - Feature
- Feature Synonyms
  - Feature, Feature_Synonym, Synonym
- Ortholog Synonyms
  - Feature, Feature_relationship, Feature, Feature Synonyms

##### Dynamic Queries

    FROM
        CAT_X_GENE_V gc
     <isEqual
    prepend=",property="searchSymbol"
                 compareValue="true">
        GENE_SYMBOLS s
     </isEqual>

     <isEqual prepend=","
    property="searchNcbi"
    compareValue="true">
        NCBI_GI n
     </isEqual>

##### Dynamic Queries

    <dynamic prepend="WHERE">
     <isEqual prepend="AND" property="searchNameOnly“
                   compareValue="true">
      <iterate property="searchTokens" conjunction="AND"
                       open=" (" close=") ">
             LOWER(VARCHAR(gc.longname)) LIKE
            LOWER(CAST(#searchTokens[]:VARCHAR# AS VARCHAR(512)))
      </iterate>
    </isEqual>

Iterate very useful for multiple search terms

##### Miscellaneous Features

- Supports various data sources
  - Simple JDBC
  - DBCP – Apache Connection Pooling
  - JNDI – Java Naming Directory Interface
- Very flexible
- Local caching of results
  - Lazy loading

##### Support

- In GMOD used by
  - Xenbase, [Artemis](Artemis "Artemis") at Sanger
- Many other users
  - e.g. MySpace.com
- Top level Apache Project
  - www.ibatis.apache.org
- Active community

##### What iBatis Does Well

- Does not hide SQL
  - No new query language to learn
- Separates and groups SQL
- Simple!!
  - Light wrapper - No real tweaks
- Does the job well
- Excellent support for Master-Detail
- Dynamically generated queries
  - You can structure conditions around clauses in SQL
  - One XML statement can represent many variations on a query

##### Acknowledgements

GMOD

- Eric Just
- Everyone else

Ibatis Developers

- Kevin Snyder,
- Chris Jarabek,
- Ross Gibb

PI

- Peter Vize

Financial Support

- Alberta Heritage Foundation for Medical Research
- Alberta Network for Proteomics Innovation
- University of Calgary, Faculty of Science
- University of Calgary Dept. of Computer Science
- NICHD

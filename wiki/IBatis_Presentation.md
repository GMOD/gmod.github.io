



<span id="top"></span>




# <span dir="auto">IBatis Presentation</span>









Jeff Bowes, Xenbase, University of Calgary. This Wiki section is an
edited version of
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2e/IBatis.pdf" class="internal"
title="IBatis.pdf">Jeff's presentation</a>.


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">ibatis</span>](#ibatis)
- [<span class="tocnumber">2</span>
  <span class="toctext">Abator</span>](#Abator)
- [<span class="tocnumber">3</span> <span class="toctext">Abator
  Example</span>](#Abator_Example)
- [<span class="tocnumber">4</span> <span class="toctext">Abator
  Example</span>](#Abator_Example_2)
- [<span class="tocnumber">5</span> <span class="toctext">Abator
  Example</span>](#Abator_Example_3)
- [<span class="tocnumber">6</span>
  <span class="toctext">Abator</span>](#Abator_2)
- [<span class="tocnumber">7</span> <span class="toctext">DAO
  Methods</span>](#DAO_Methods)
- [<span class="tocnumber">8</span>
  <span class="toctext">Insert</span>](#Insert)
- [<span class="tocnumber">9</span>
  <span class="toctext">Insert</span>](#Insert_2)
- [<span class="tocnumber">10</span>
  <span class="toctext">Insert</span>](#Insert_3)
- [<span class="tocnumber">11</span>
  <span class="toctext">Insert</span>](#Insert_4)
- [<span class="tocnumber">12</span>
  <span class="toctext">Insert</span>](#Insert_5)
- [<span class="tocnumber">13</span> <span class="toctext">Problem 1 -
  Insert</span>](#Problem_1_-_Insert)
- [<span class="tocnumber">14</span> <span class="toctext">Problem 1 -
  Insert</span>](#Problem_1_-_Insert_2)
- [<span class="tocnumber">15</span>
  <span class="toctext">Transactions</span>](#Transactions)
- [<span class="tocnumber">16</span>
  <span class="toctext">Retrieval</span>](#Retrieval)
- [<span class="tocnumber">17</span> <span class="toctext">Problem 2 -
  Master Detail Reports</span>](#Problem_2_-_Master_Detail_Reports)
- [<span class="tocnumber">18</span> <span class="toctext">Problem 2 -
  Master Detail Report</span>](#Problem_2_-_Master_Detail_Report)
- [<span class="tocnumber">19</span> <span class="toctext">Master Detail
  Report</span>](#Master_Detail_Report)
- [<span class="tocnumber">20</span> <span class="toctext">Dynamic
  Queries</span>](#Dynamic_Queries)
- [<span class="tocnumber">21</span> <span class="toctext">Dynamic
  Queries</span>](#Dynamic_Queries_2)
- [<span class="tocnumber">22</span> <span class="toctext">Dynamic
  Queries</span>](#Dynamic_Queries_3)
- [<span class="tocnumber">23</span> <span class="toctext">Miscellaneous
  Features</span>](#Miscellaneous_Features)
- [<span class="tocnumber">24</span>
  <span class="toctext">Support</span>](#Support)
- [<span class="tocnumber">25</span> <span class="toctext">What iBatis
  Does Well</span>](#What_iBatis_Does_Well)
- [<span class="tocnumber">26</span>
  <span class="toctext">Acknowledgements</span>](#Acknowledgements)



##### <span id="ibatis" class="mw-headline">ibatis</span>

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

##### <span id="Abator" class="mw-headline">Abator</span>

- Generates ibatis CRUD objects by introspecting database tables
- Abator creates *SQL in XML* files (SQL Map files) and Java classes
  - Within these files is a Result Map section.
- Abator config files are simple, set connection parameters, tell where
  the files are.
- In the SQL Map files you can specify how to find parent ids, such as
  feature_id.

##### <span id="Abator_Example" class="mw-headline">Abator Example</span>


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


##### <span id="Abator_Example_2" class="mw-headline">Abator Example</span>


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


##### <span id="Abator_Example_3" class="mw-headline">Abator Example</span>


``` de1
 <table schema="db2inst1" tableName="synonym"></nowiki> 
      <generatedKey column="synonym_id" sqlStatement="VALUES PREVVAL FOR
             synonym_seq" identity="true" />
      <columnOverride column="CREATED_BY" jdbcType="INTEGER" />
      <columnOverride column="MODIFIED_BY" jdbcType="INTEGER" />
 </table>
```


  

##### <span id="Abator_2" class="mw-headline">Abator</span>

Works as:

- Eclipse plug-in
- ANT
- Standalone

##### <span id="DAO_Methods" class="mw-headline">DAO Methods</span>

- Insert (Feature)
- Update (Feature)
- DeletebyKey (FeatureKey)
- SelectbyKey (FeatureKey)
- SelectbyExample (FeatureExample)
- DeletebyExample (FeatureExample)

##### <span id="Insert" class="mw-headline">Insert</span>


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


##### <span id="Insert_2" class="mw-headline">Insert</span>


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


##### <span id="Insert_3" class="mw-headline">Insert</span>


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


##### <span id="Insert_4" class="mw-headline">Insert</span>


``` de1
 <selectKey resultClass="java.lang.Integer"
            keyProperty="featureId">
        VALUES PREVVAL FOR feature_seq
 </selectKey>
```


##### <span id="Insert_5" class="mw-headline">Insert</span>


``` de1
 <selectKey resultClass="java.lang.Integer"
            keyProperty="featureId">
        VALUES PREVVAL FOR feature_seq
 </selectKey>
```


##### <span id="Problem_1_-_Insert" class="mw-headline">Problem 1 - Insert</span>


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


##### <span id="Problem_1_-_Insert_2" class="mw-headline">Problem 1 - Insert</span>


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


##### <span id="Transactions" class="mw-headline">Transactions</span>

- SQLMap
- JDBC
- JTA - Java Transaction API
  - 2-Phase commit
- Hibernate
- External (Customized)

##### <span id="Retrieval" class="mw-headline">Retrieval</span>

    symbol: xfile
    description: A test gene for GMOD meeting
    mRNA Feature
            exon_1: start: 13691 end: 13767
                            strand: 1
                            srcFeature_id: Id of genomic sample
            exon_2:      start: 14687 end: 14720
                             strand: 1
                             srcFeature_id: Id of genomic sample

##### <span id="Problem_2_-_Master_Detail_Reports" class="mw-headline">Problem 2 - Master Detail Reports</span>

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


##### <span id="Problem_2_-_Master_Detail_Report" class="mw-headline">Problem 2 - Master Detail Report</span>


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


##### <span id="Master_Detail_Report" class="mw-headline">Master Detail Report</span>

    gene_id  Symbol   Type      Fmin   Fmax
    6129482  x-files  gene      13691   13767
    6129482  x-files  gene      14687   14720

Becomes:

    gene_id  Symbol   Type      Fmin   Fmax
    6129482  x-files  gene      13691   13767
                                              14687   14720

##### <span id="Dynamic_Queries" class="mw-headline">Dynamic Queries</span>

- Gene Name (Description)
  - Feature, Featureprop
- Symbol
  - Feature
- Feature Synonyms
  - Feature, Feature_Synonym, Synonym
- Ortholog Synonyms
  - Feature, Feature_relationship, Feature, Feature Synonyms

##### <span id="Dynamic_Queries_2" class="mw-headline">Dynamic Queries</span>

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

##### <span id="Dynamic_Queries_3" class="mw-headline">Dynamic Queries</span>

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

##### <span id="Miscellaneous_Features" class="mw-headline">Miscellaneous Features</span>

- Supports various data sources
  - Simple JDBC
  - DBCP – Apache Connection Pooling
  - JNDI – Java Naming Directory Interface
- Very flexible
- Local caching of results
  - Lazy loading

##### <span id="Support" class="mw-headline">Support</span>

- In GMOD used by
  - Xenbase, [Artemis](Artemis "Artemis") at Sanger
- Many other users
  - e.g. MySpace.com
- Top level Apache Project
  - www.ibatis.apache.org
- Active community

##### <span id="What_iBatis_Does_Well" class="mw-headline">What iBatis Does Well</span>

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

##### <span id="Acknowledgements" class="mw-headline">Acknowledgements</span>

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




[Categories](Special%253ACategories "Special%253ACategories"):

- [Java](Category%253AJava "Category%253AJava")
- [Middleware
  Presentations](Category%253AMiddleware_Presentations "Category%253AMiddleware Presentations")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/IBatis_Presentation" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:10 on 9 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">32,339 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





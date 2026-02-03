---
title: "PSU Presentation"
---




<span id="top"></span>




# <span dir="auto">PSU Presentation</span>









This Wiki page is an edited version of
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/56/PSU.pdf" class="internal"
title="PSU.pdf">Chinmay's presentation</a>.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Sanger
  Pathogen Sequencing Unit
  (PSU)</span>](#Sanger_Pathogen_Sequencing_Unit_.28PSU.29)
- [<span class="tocnumber">2</span> <span class="toctext">Technical -
  Connections</span>](#Technical_-_Connections)
- [<span class="tocnumber">3</span> <span class="toctext">Technical -
  Code Generation</span>](#Technical_-_Code_Generation)
- [<span class="tocnumber">4</span> <span class="toctext">Technical -
  Transactions</span>](#Technical_-_Transactions)
- [<span class="tocnumber">5</span> <span class="toctext">Problems 1, 2,
  & 3</span>](#Problems_1.2C_2.2C_.26_3)
- [<span class="tocnumber">6</span> <span class="toctext">Demo – Sample
  Problem</span>](#Demo_.E2.80.93_Sample_Problem)



##### <span id="Sanger_Pathogen_Sequencing_Unit_.28PSU.29" class="mw-headline">Sanger Pathogen Sequencing Unit (PSU)</span>

- GeneDB is the organism data and annotation database for the Pathogen
  Sequencing Unit (PSU) at the Sanger Institute, UK
- Contains 37 organisms, which is expected to grow to 62
- [Artemis](Artemis "Artemis") is an annotation/DNA graphical interface
- PSU is currently migrating to chado schema
- We've implemented a common interface with the two leading open source
  frameworks: Hibernate and iBatis

##### <span id="Technical_-_Connections" class="mw-headline">Technical - Connections</span>

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

##### <span id="Technical_-_Code_Generation" class="mw-headline">Technical - Code Generation</span>

- The shared interface and hibernate implementation were originally
  generated
- There’s no explicit code generation (although the Spring and Hibernate
  runtimes may use them behinds the scenes)

##### <span id="Technical_-_Transactions" class="mw-headline">Technical - Transactions</span>

- Transactions are fully supported

##### <span id="Problems_1.2C_2.2C_.26_3" class="mw-headline">Problems 1, 2, & 3</span>

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


##### <span id="Demo_.E2.80.93_Sample_Problem" class="mw-headline">Demo – Sample Problem</span>

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





[Category](Special%253ACategories "Special%253ACategories"):

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/PSU_Presentation" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:16 on 9 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">19,221 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





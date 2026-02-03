---
title: "Hibernate Presentation"
---




<span id="top"></span>




# <span dir="auto">Hibernate Presentation</span>









Chado API via Java & Hibernate, Robert Bruggner, VectorBase.org. This
Wiki page is an edited version of
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5b/HibernateChadoAPI.pdf"
class="internal" title="HibernateChadoAPI.pdf">Robert's presentation</a>.


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Overview</span>](#Overview)
- [<span class="tocnumber">2</span>
  <span class="toctext">Background</span>](#Background)
- [<span class="tocnumber">3</span> <span class="toctext">Hibernate
  Background</span>](#Hibernate_Background)
- [<span class="tocnumber">4</span> <span class="toctext">Hibernate
  Database Connectivity</span>](#Hibernate_Database_Connectivity)
- [<span class="tocnumber">5</span> <span class="toctext">POJO and HBM
  Example ﬁle - CV</span>](#POJO_and_HBM_Example_.EF.AC.81le_-_CV)
- [<span class="tocnumber">6</span> <span class="toctext">HBM Example
  CVTerm</span>](#HBM_Example_CVTerm)
- [<span class="tocnumber">7</span> <span class="toctext">Hibernate
  Object Retrieve</span>](#Hibernate_Object_Retrieve)
- [<span class="tocnumber">8</span> <span class="toctext">Hibernate
  Object Update</span>](#Hibernate_Object_Update)
- [<span class="tocnumber">9</span> <span class="toctext">Hibernate
  Save</span>](#Hibernate_Save)
- [<span class="tocnumber">10</span>
  <span class="toctext">Inheritance</span>](#Inheritance)
- [<span class="tocnumber">11</span>
  <span class="toctext">ChadoAPI</span>](#ChadoAPI)
- [<span class="tocnumber">12</span> <span class="toctext">Problem 1 -
  GMOD Example</span>](#Problem_1_-_GMOD_Example)
- [<span class="tocnumber">13</span> <span class="toctext">Problem 2 -
  GMOD Example</span>](#Problem_2_-_GMOD_Example)
- [<span class="tocnumber">14</span> <span class="toctext">Problems 3,
  4, & 5 - GMOD Update &
  Delete</span>](#Problems_3.2C_4.2C_.26_5_-_GMOD_Update_.26_Delete)
- [<span class="tocnumber">15</span> <span class="toctext">What
  Hibernate Does Well</span>](#What_Hibernate_Does_Well)
- [<span class="tocnumber">16</span>
  <span class="toctext">Acknowledgements</span>](#Acknowledgements)



##### <span id="Overview" class="mw-headline">Overview</span>

- Background
- Quick Hibernate Overview
- Hibernate Connectivity and O/R Mapping Example
- GMOD Demo

Also see [Comparison of XORT and Hibernate for Chado
Reporting](Comparison_of_XORT_and_Hibernate_for_Chado_reporting "Comparison of XORT and Hibernate for Chado reporting").

##### <span id="Background" class="mw-headline">Background</span>

- VectorBase
  - A bioinformatic resource center for invertebrate vectors of human
    pathogens
- Responsible for storage and display of multiple organisms’ genomes
  - Anopheles gambiae, Aedes aegypti, Ixodes scapularis, Culex pipiens
    and so on....
- Want to store data for many organisms- Chado a natural choice
- Ensembl Genome Browser already used for *A. gambiae*
  - Wrote Ensembl API Database adaptor for Chado... Not maintainable.
- Use Both Databases
  - Transfer genomic data from Ensembl to Chado
  - Search Engine and Indexer using Lucene
  - Run DAS
  - Export data via ChadoXML and GFF3
- Need API for Database I/O

##### <span id="Hibernate_Background" class="mw-headline">Hibernate Background</span>

- They say: “A powerful, high performance object/relational persistence
  and query service.”
- Automates the persistence of plain old Java objects (POJO)
  - User maps their POJO properties to database tables via XML (HBM
    File).
  - There are Hibernate tools that generate HBMs
    - Configurable in the sense that one can create get & set tables
      where the methods map one-to-one to fields.
- Persist a speciﬁc object by storing it the database.
- Intelligent Database I/O
  - Smart detection of *Dirty Properties* when performing Save / Update
    / Delete.
  - Cascadable Save / Update / Delete for complex objects.
- Everything's done within the scope of a transaction.

##### <span id="Hibernate_Database_Connectivity" class="mw-headline">Hibernate Database Connectivity</span>

- Conﬁgure Hibernate in hibernate.cfg.xml
- Deﬁne a Data Source
  - We use a simple, single JDBC connection Chado
  - Can be conﬁgured to use a connection pool or data source accessible
    by the Java Naming and Directory Interface (JNDI).
  - Deﬁne a connection “dialect”
  - org.hibernate.dialect.PostgreSQLDialect
- Describe the relationship between Java objects and database tables
  - Use XML to describe where to store POJO property data in the
    database
- Create a new Hibernate Session based on the conﬁguration
- Begin a transaction to start performing work

##### <span id="POJO_and_HBM_Example_.EF.AC.81le_-_CV" class="mw-headline">POJO and HBM Example ﬁle - CV</span>


``` de1
 public class CV {
 
    private int cv_id
    private String name;
    private String definition;
 
    public property gettersandsetters() {
            ....
    }
 
    public boolean equals(CV comparaCV) {
         ....
    }
    public int hashCode(){
         ...
    }
 }
```



``` de1
 <hibernate-mapping>
 
    <class name="org.vectorbase.chadoAPI.chadoObjects.CV" table="cv">
 
    <id name="cv_id" column="cv_id" unsaved-value="undefined">
 
    <generator class="sequence">
 
    <param name="sequence">cv_cv_id_seq</param>
 
    </generator>
 
    </id>  
 
    <property name="name" column=”name” type="java.lang.String” not-null="true"/>
 
    <property name="definition" column=”definition” type="java.lang.String”/>
 
    </class>
 </hibernate-mapping>
```


##### <span id="HBM_Example_CVTerm" class="mw-headline">HBM Example CVTerm</span>


``` de1
 public class CVTerm {
 
    private int cvterm_id;
 
    private CV cv;
 
    private String name;
 
    private String definition;
 
    private DBXref dbxref;
 
    private int is_obsolete;
 
    private int is_relationshiptype;
 
   .....
 
}
```



``` de1
 <hibernate-mapping>
 
    <class name="org.vectorbase.chadoAPI.chadoObjects.CVTerm" table="cvterm">
 
    <id name="cvterm_id" column="cvterm_id" unsaved-value="undefined">
 
    <generator class="sequence">
 
    <param name="sequence">cvterm_cvterm_id_seq</param>
 
    </generator>
 
    </id>
 
    <many-to-one name="cv" class="org.vectorbase.chadoAPI.chadoObjects.CV" column="cv_id" 
            not-null="true" cascade="save-update"/>
 
    <property name="name" not-null="true" type="java.lang.String"/>
 
    <property name="definition"/>
 
    <one-to-one name="dbxref" class="org.vectorbase.chadoAPI.chadoObjects.DBXref" cascade="all"/>
 
    <property name="is_obsolete"/>
 
    <property name="is_relationshiptype"/>
 
    </class>
  </hibernate-mapping>
```


##### <span id="Hibernate_Object_Retrieve" class="mw-headline">Hibernate Object Retrieve</span>

One can use Java, Hibernate Query Language, or SQL, this example uses
HQL


``` de1
 import org.hibernate.Session;
 import org.vectorbase.chadoAPI.CVTerm;
 import org.vectorbase.chadoAPI.CV;
 
 // Load the configuration from hibernate.cfg.xml
 
 // Build a session factory first (not shown)
 
 // Get the session based on the configuration and begin transaction
 Session session = HibernateSessionFactory.getCurrentSession();
 session.beginTransaction();
 
 // Load a CVTerm by its ID
 CVTerm cvt = (CVTerm) session.get(CVTerm.class,1);
 
 // Load a CVTerm using HQL
 CVTerm cvt = session.createQuery(“from CVTerm where name=?”).setString(0,”name”).uniqueResult();
 
 // Print out the name of the cvterm
 System.out.println(cvt.getName());
 
 // Get the cv that the cvterm is associated with
 // Hibernate doesn’t return the cv_id - it returns a CV Object.
 CV cv = cvt.getCv();
 
 // Print out the cv’s name
 System.out.println(cv.getName());
```


##### <span id="Hibernate_Object_Update" class="mw-headline">Hibernate Object Update</span>


``` de1
 import org.hibernate.Session;
 import org.vectorbase.chadoAPI.CVTerm;
 
 // Load the configuration from hibernate.cfg.xml
 
 // Build a session factory first (not shown)
 
 // Get the session based on the configuration and begin transaction
 Session session = HibernateSessionFactory.getCurrentSession();
 session.beginTransaction();
 
 // Load a CVTerm by its ID
 CVTerm cvt = (CVTerm) session.get(CVTerm.class,1);
 
 // Change cvt’s name
 cvt.setName(“New CVTerm name”);
 
 // Save!
 // Generated SQL updates “Dirty” properties (name, in this case)
 session.save(cvt);
 
 // Commit data to database
 session.commit();
```


##### <span id="Hibernate_Save" class="mw-headline">Hibernate Save</span>


``` de1
 import org.hibernate.Session;
 import org.vectorbase.chadoAPI.CVTerm;
 import org.vectorbase.chadoAPI.CV;
 
 // Load the configuration from hibernate.cfg.xml
 // Build a session factory first and get begin transaction (not shown)
 
 // Make a new CV
 CV new_cv = new CV();
 new_cv.setName(“New CV”);
 new_cv.setDefinition(“New CV Def”);
 
 // Make a new cvterm for that cv
 CVTerm new_cvterm = new CVTerm();
 new_cvterm.setName(“New CVTerm Name”);
 // ..... save dbxref etc......
 
 // Add that CVTerm to our new CV
 new_cv.addCVTerm(new_cvterm);
 
 // Save the new data...
 // Hibernate recognizes that it has to first save new_cv, then save new_cvterm.
 session.save(new_cvterm);
 
 session.commit();
 
 // You can see the new id’s assigned by the database
 System.out.println(new_cv.getCv_id());
 System.out.println(new_cvterm.getCvterm_id());
```


##### <span id="Inheritance" class="mw-headline">Inheritance</span>


``` de1
 <hibernate-mapping>
 
     <class name="org.vectorbase.chadoAPI.chadoObjects.Feature" table="feature" discriminator-
  value="not null">
 
     <id name="feature_id" column="feature_id" unsaved-value="undefined">
 
    <generator class="sequence">
 
    <param name="sequence">feature_feature_id_seq</param>
 
    </generator>
 
     </id> 
 
      <discriminator column="type_id" type="integer" insert="false"/>
 
     <many-to-one name="dbxref" class="org.vectorbase.chadoAPI.chadoObjects.DBXref" 
                  column="dbxref_id" cascade="all"/>
 
     <many-to-one name="organism" class="org.vectorbase.chadoAPI.chadoObjects.Organism" 
                  column="organism_id" not-null="true" cascade="save-update"/>
 
     <property name="name"/>
                  .....
 
 <hibernate-mapping>   
 
     <subclass name="org.vectorbase.chadoAPI.chadoFeatures.Gene" 
          extends="org.vectorbase.chadoAPI.chadoObjects.Feature" discriminator-value="767">
 
     </subclass>
 </hibernate-mapping>
```


Write custom methods for speciﬁc sub-classes

##### <span id="ChadoAPI" class="mw-headline">ChadoAPI</span>

- POJO Mappings
  - CV, CVTerm, DB, DBXref, Feature, FeatureCVTerm, FeatureDBXref,
    FeatureLoc, FeatureProp, FeatureRelationship, FeatureSynonym,
    Organism, Pub, Synonym
- Extended Features
  - Chromosome, Gene, Transcript, Exon, Protein
- Constants
  - CVTerms, FeatureFeatureRelationships, Ontologies
- Special
  - ChadoAdapter

##### <span id="Problem_1_-_GMOD_Example" class="mw-headline">Problem 1 - GMOD Example</span>


``` de1
 // Set up our session and begin transaction
 Session session = HibernateUtil.getSessionFactory().getCurrentSession();
 session.beginTransaction();
 
 // Make a chado adpator and load up some utility objects
 ChadoAdaptor ca = new ChadoAdaptor();
 Chromosome c = ca.fetchChromosomeByUniqueName("fake_chromosome");
 Pub null_pub = ca.fetchPubByPubID(1);
 Organism agambiae = ca.fetchOrganismByScientificName("Anopheles","gambiae");
 
 // Begin GMOD Demo Code
 
 // Make our new gene;
 Gene xfile = new Gene();
 xfile.setOrganism(agambiae);
 xfile.setUniquename("xfile");
 xfile.setDescription("A test gene for GMOD meeting");
 
 /* Set the location of our gene. No need to set coordinates because they'll be updated
   * based on the exon boundaries. 
   */
 FeatureLoc xfile_loc = new FeatureLoc();
 xfile_loc.setSrcfeature(c);
 xfile_loc.setStrand(1);
 xfile.setFeatureLoc(xfile_loc);
 
 // Add synonyms to xfile
 xfile.createNewFeatureSynonym("mulder", null_pub, CVTerms.EXACT_SYNONYM);
 xfile.createNewFeatureSynonym("scully", null_pub, CVTerms.EXACT_SYNONYM);
```


##### <span id="Problem_2_-_GMOD_Example" class="mw-headline">Problem 2 - GMOD Example</span>


``` de1
 // Create a new transcript for our gene.
 Transcript t = xfile.createGeneTranscript("xfile-RA");
 
 // Create some exons for that transcript.
 t.createTranscriptExon("xfile:1", 13691, 13767);
 t.createTranscriptExon("xfile:2", 14687, 14720);
 
 // Save our new gene
 session.save(xfile);
 System.out.println("xfile feature_id is " + xfile.getFeature_id());
 
 // Fetch our saved gene from the database
 Gene xfile_r = ca.fetchGeneByUniqueName("xfile");
 System.out.println("symbol: " + xfile_r.getUniquename());
 System.out.print("synonyms: ");
 for (FeatureSynonym fs : xfile_r.getFeatureSynonyms()){
 
         System.out.print(fs.getSynonym().getName() + " ");
 }
 
 System.out.println("description: " + xfile_r.getDescription());
 System.out.println("type: " + xfile_r.getType().getName());
 
 for (Transcript tx : xfile_r.fetchAllTranscripts()){
     for (Exon e : tx.fetchAllExons()){
          System.out.println(e.getUniquename() + " Start:\t" + e.getFeatureLoc().getFmin());
          System.out.println(e.getUniquename() + " End:\t" + e.getFeatureLoc().getFmax());
          System.out.println("\tSrcFeatureID: " + e.getFeatureLoc().getSrcfeature().getFeature_id());
     }
     System.out.println(">" + tx.getUniquename());
     System.out.println(tx.generateTranscriptSequenceFromExons().toUpperCase());
 }
```


##### <span id="Problems_3.2C_4.2C_.26_5_-_GMOD_Update_.26_Delete" class="mw-headline">Problems 3, 4, & 5 - GMOD Update & Delete</span>


``` de1
 // Lets update our name...
 xfile_r.setUniquename("x-file");
 
 session.save(xfile_r);
 
 // Not part of the ChadoAdaptor utility object, but a good example of HQL
 List<Gene> genes = (List<Gene>)session.createQuery("from Gene where uniquename like ?").setString(0,”x-%”).list();
 
 for (Gene g : genes){
 
    System.out.println(g.getFeature_id() + 
                          "\t" + g.getUniquename() + 
                          "\t" + g.getOrganism().getGenus() +
                          " " + g.getOrganism().getSpecies());
 }
 
 // Deleting... hmm...
 Gene delete_me = ca.fetchGeneByUniqueName("x-ray");
 session.delete(delete_me);
 
 // All Finished
 session.getTransaction().commit();
```


  

##### <span id="What_Hibernate_Does_Well" class="mw-headline">What Hibernate Does Well</span>

- Hibernate can be configured to perform specialized functions
  - For example, it has its own notion of a cascade
- Flexible with respect to language
  - Java, Hibernate Query Language, or SQL
- Any JDBC driver

##### <span id="Acknowledgements" class="mw-headline">Acknowledgements</span>

- VectorBase People
  - Frank Collins, EO Stinson, Ryan Butler
- GMOD
- NIAID




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [Middleware](Category%253AMiddleware "Category%253AMiddleware")
- [Java](Category%253AJava "Category%253AJava")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Hibernate_Presentation" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:16 on 9 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">25,451 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





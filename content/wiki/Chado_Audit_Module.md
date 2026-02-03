---
title: "Chado Audit Module"
---




<span id="top"></span>




# <span dir="auto">Chado Audit Module</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Audit
    Policy</span>](#Audit_Policy)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">Transaction Use
    Cases</span>](#Transaction_Use_Cases)
    - [<span class="tocnumber">1.2.1</span>
      <span class="toctext">Insertion of a New
      Record</span>](#Insertion_of_a_New_Record)
    - [<span class="tocnumber">1.2.2</span> <span class="toctext">Update
      of an Existing Record</span>](#Update_of_an_Existing_Record)
    - [<span class="tocnumber">1.2.3</span>
      <span class="toctext">Deletion of an Existing
      Record</span>](#Deletion_of_an_Existing_Record)
  - [<span class="tocnumber">1.3</span>
    <span class="toctext">Implementation
    Issues</span>](#Implementation_Issues)
  - [<span class="tocnumber">1.4</span> <span class="toctext">Listing of
    MODs' Implemented Audit Tracking
    Systems</span>](#Listing_of_MODs.27_Implemented_Audit_Tracking_Systems)



## <span id="Introduction" class="mw-headline">Introduction</span>

The Audit module is not a module in the same sense as the other Chado
modules. It is a set of recommendations on how one might implement audit
trail logging in Chado. This documentation describes an example of such
an implementation which is in use at
<a href="http://flybase.org" class="external text"
rel="nofollow">FlyBase</a>. The SQL used at Flybase is
`chado/modules/audit/audit_tables.sql`.

  

### <span id="Audit_Policy" class="mw-headline">Audit Policy</span>

We consider the implementation of auditing policy as a database
administration issue and subject to the local requirements of specific
database groups. We therefore have not developed a detailed audit
module, providing instead this policy statement.

Database project groups who would use chado as their primary DBMS would
be well advised to implement as robust and detailed an audit trail as
possible, while groups who would use chado more informally, for instance
primarily as a read-only resource, may have no need for auditing.

We here describe how auditing will be implemented at FlyBase, where
chado will serve as the primary DBMS.

Auditing will be implemented in a separate, orthogonal database to the
chado, with each chado table having a corresponding shadow audit table
which will include all of the columns of the chado table, plus these
additional columns:


``` de1
    transaction_date TIMESTAMP NOT NULL
    transaction_type CHAR NOT NULL
```


Where *transaction_type* value is one of:

- i (insertion)
- u (update)
- d (deletion)

  
Thus an chado db instance chado.1 containing a table *gene*, for
example:


``` de1
    CREATE TABLE gene (
           gene_id serial NOT NULL,
           PRIMARY KEY (gene_id),
           name VARCHAR(255) NOT NULL,
           dbxref_id INT,
           FOREIGN KEY (dbxref_id) REFERENCES dbxref(dbxref_id),
           UNIQUE(name),
           UNIQUE(dbxref_id)
    );
```


Would have a corresponding audit database, chado.1_audit, containing a
shadow audit table, *gene_audit*:


``` de1
    CREATE TABLE gene_audit (
           gene_id serial NOT NULL,
           PRIMARY KEY (gene_id),
           name VARCHAR(255) NOT NULL,
           dbxref_id INT,
               FOREIGN KEY (dbxref_id) REFERENCES dbxref(dbxref_id),
               UNIQUE(name),
               UNIQUE(dbxref_id),
               transaction_date TIMESTAMP NOT NULL,
               transaction_type CHAR NOT NULL
    );
```


  

### <span id="Transaction_Use_Cases" class="mw-headline">Transaction Use Cases</span>

#### <span id="Insertion_of_a_New_Record" class="mw-headline">Insertion of a New Record</span>

When a record is initially inserted into an chado table, the same record
is inserted into the corresponding shadow audit table, with the current
timestamp and *transaction_type* = 'i'.

#### <span id="Update_of_an_Existing_Record" class="mw-headline">Update of an Existing Record</span>

When a record is to be updated, before the update transaction is
executed in chado, the existing chado record is copied to the
corresponding shadow audit table, with the current timestamp and
*transaction_type* = 'u'. The update transaction is then executed in
chado.

#### <span id="Deletion_of_an_Existing_Record" class="mw-headline">Deletion of an Existing Record</span>

When a record is to be deleted, before the delete transaction is executed
in chado, the existing chado record is copied to the corresponding
shadow audit table, with the corrent timestamp and *transaction_type* =
'd'. The delete transaction is then executed in chado.

  

### <span id="Implementation_Issues" class="mw-headline">Implementation Issues</span>

The benefit of this system is that it allows a certain amount of "time
travel", or the ability to reconstruct the database to its state at a
particular time in the past. We don't anticipate making this
functionality available to the general user population, but recognize
that from a database programming point of view, it is often quite
useful, and sometimes vital, for a programmer to be able to track
changes in the database in detail.

While the auditing policy described here fulfills all of our auditing
requirements in principle, it remains to be seen how it will work in
practice. The size of the shadow audit database may become an issue over
time. How the handling of audit transactions will affect overall
database transaction performance is also unknown. FlyBase makes a
practice of reporting certain audit details to the public (e.g. date
entered and date last updated of gene records) - it is not know whether
implementing this will be too expensive using this shadow audit db
method

### <span id="Listing_of_MODs.27_Implemented_Audit_Tracking_Systems" class="mw-headline">Listing of MODs' Implemented Audit Tracking Systems</span>

A listing of instances of audit tracking systems implemented by
different MODs is provided
[here](Audit_tracking_by_mods "Audit tracking by mods").




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado Modules](Category%253AChado_Modules "Category%253AChado Modules")
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_Audit_Module" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 04:31 on 18 February
  2015.</span>
<!-- - <span id="footer-info-viewcount">63,616 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





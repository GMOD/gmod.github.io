---
title: "A Brief Guide to Databases"
---




<span id="top"></span>




# <span dir="auto">A Brief Guide to Databases</span>









A database provides infrastructure for storing, managing, and retrieving
information.

  


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Tables,
  Records, and Attributes</span>](#Tables.2C_Records.2C_and_Attributes)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">Example</span>](#Example)
- [<span class="tocnumber">2</span>
  <span class="toctext">Keys</span>](#Keys)
  - [<span class="tocnumber">2.1</span>
    <span class="toctext">Example</span>](#Example_2)



## <span id="Tables.2C_Records.2C_and_Attributes" class="mw-headline">Tables, Records, and Attributes</span>

Databases store information in **tables**. A database usually has
multiple tables containing data on different types of things.

Each table in the database can be broken down into rows and columns,
like a spreadsheet.

Rows, or **records**, represent one instance of the type of item
described in the table.

Columns, or **attributes**, are the aspects of the item that we are
collecting information on.

### <span id="Example" class="mw-headline">Example</span>

Here's an example of a table in a database containing information about
some books. Each record represents a book, and the attributes that we
are collecting information on are the ISBN, the title, the author, the
publication date, and whether a Kindle version is available.

| Title | Author | ISBN | Publication date | Kindle version |
|----|----|----|----|----|
| Mouse as a Model Organism: From Animals to Cells | Cord Brakebusch and Taina Pihlajaniemi | 9400707495 | Apr 2011 | 1 |
| Evolutionary Ecology of Social and Sexual Systems: Crustaceans As Model Organisms | J. Emmett Duffy and Martin Thiel | 0879698659 | Sep 2007 | 1 |
| Emerging Model Organisms: A Laboratory Manual, Volume 2 | Cold Spring Harbor Laboratory Press | 0879698721 | Apr 2011 | 0 |
| Emerging Model Organisms: A Laboratory Manual, Volume 1 | Cold Spring Harbor Laboratory Press | 0805074589 | Nov 2008 | 0 |
| A Feeling for the Organism, 10th Anniversary Edition: The Life and Work of Barbara McClintock | Evelyn Fox Keller | 0898715547 | Feb 1984 | 0 |

book

  

## <span id="Keys" class="mw-headline">Keys</span>

In a database table, certain attributes (columns) are **keys**. Keys are
used to identify records (rows) and link records together.

A **primary key** uniquely identifies a record in a database table; the
attribute to be the primary key would usually be decided when the
database schema is being designed, rather than waiting until after the
database has been populated. Some database tables contain more than
attribute that can uniquely identify a record. These extra unique keys
are **alternate keys**.

In a relational database, tables are linked together by using the
primary key from one table in a related table. The primary key then
becomes a **foreign** key.

  

### <span id="Example_2" class="mw-headline">Example</span>

Looking at our previous example of the book database, the ISBN is the
primary key in this database table. The title could be used as an
alternate key, but given how common some book titles are, it would not
be a good long term strategy.

| Title | Author | ISBN | Publication date | Kindle version |
|----|----|----|----|----|
| Mouse as a Model Organism: From Animals to Cells | Cord Brakebusch and Taina Pihlajaniemi | 9400707495 | Apr 2011 | 1 |
| Evolutionary Ecology of Social and Sexual Systems: Crustaceans As Model Organisms | J. Emmett Duffy and Martin Thiel | 0879698659 | Sep 2007 | 1 |
| Emerging Model Organisms: A Laboratory Manual, Volume 2 | Cold Spring Harbor Laboratory Press | 0879698721 | Apr 2011 | 0 |
| Emerging Model Organisms: A Laboratory Manual, Volume 1 | Cold Spring Harbor Laboratory Press | 0805074589 | Nov 2008 | 0 |
| A Feeling for the Organism, 10th Anniversary Edition: The Life and Work of Barbara McClintock | Evelyn Fox Keller | 0898715547 | Feb 1984 | 0 |

book

  
If we now imagine a second table with book prices in it:

| ISBN       | Format    | Price (\$) |
|------------|-----------|------------|
| 9400707495 | Hardback  | 189.00     |
| 9400707495 | Ebook     | 151.20     |
| 0879698659 | Hardback  | 59.99      |
| 0879698659 | Paperback | 14.99      |
| 0879698659 | Ebook     | 34.99      |
| 0879698721 | Hardback  | 234.00     |
| 0879698721 | Paperback | 134.00     |
| 0805074589 | Hardback  | 234.00     |
| 0805074589 | Paperback | 129.00     |
| 0898715547 | Hardback  | 64.99      |

price

This table has no primary keys, and the ISBN is acting as a **foreign
key**.

If we look at an individual record from each table, we can see how the
two tables relate to each other.


|                  |                                                  |
|------------------|--------------------------------------------------|
| Title            | Mouse as a Model Organism: From Animals to Cells |
| Author           | Cord Brakebusch and Taina Pihlajaniemi           |
| ISBN             | 9400707495                                       |
| Publication date | Apr 2011                                         |
| Kindle version   | 1                                                |

book


|        |            |
|--------|------------|
| ISBN   | 9400707495 |
| format | Hardback   |
| price  | 189.00     |

price





[Categories](Special%253ACategories "Special%253ACategories"):

- [Documentation](Category%253ADocumentation "Category%253ADocumentation")







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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/A_Brief_Guide_to_Databases"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:18 on 7 September
  2012.</span>
<!-- - <span id="footer-info-viewcount">19,185 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





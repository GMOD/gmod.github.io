---
title: "A Brief Guide to Databases"
---
# A Brief Guide to Databases

A database provides infrastructure for storing, managing, and retrieving
information.

  

  Records, and Attributes</span>](#Tables.2C_Records.2C_and_Attributes)
  - [Example](#Example)
- [Keys](#Keys)
  - [Example](#Example_2)

## Tables, Records, and Attributes

Databases store information in **tables**. A database usually has
multiple tables containing data on different types of things.

Each table in the database can be broken down into rows and columns,
like a spreadsheet.

Rows, or **records**, represent one instance of the type of item
described in the table.

Columns, or **attributes**, are the aspects of the item that we are
collecting information on.

### Example

Here's an example of a table in a database containing information about
some books. Each record represents a book, and the attributes that we
are collecting information on are the ISBN, the title, the author, the
publication date, and whether a Kindle version is available.

| Title | Author | ISBN | Publication date | Kindle version |----|----|----|----|----| Mouse as a Model Organism: From Animals to Cells | Cord Brakebusch and Taina Pihlajaniemi | 9400707495 | Apr 2011 | 1 | Evolutionary Ecology of Social and Sexual Systems: Crustaceans As Model Organisms | J. Emmett Duffy and Martin Thiel | 0879698659 | Sep 2007 | 1 | Emerging Model Organisms: A Laboratory Manual, Volume 2 | Cold Spring Harbor Laboratory Press | 0879698721 | Apr 2011 | 0 | Emerging Model Organisms: A Laboratory Manual, Volume 1 | Cold Spring Harbor Laboratory Press | 0805074589 | Nov 2008 | 0 | A Feeling for the Organism, 10th Anniversary Edition: The Life and Work of Barbara McClintock | Evelyn Fox Keller | 0898715547 | Feb 1984 | 0 |

book

  

## Keys

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

  

### Example

Looking at our previous example of the book database, the ISBN is the
primary key in this database table. The title could be used as an
alternate key, but given how common some book titles are, it would not
be a good long term strategy.

| Title | Author | ISBN | Publication date | Kindle version |----|----|----|----|----| Mouse as a Model Organism: From Animals to Cells | Cord Brakebusch and Taina Pihlajaniemi | 9400707495 | Apr 2011 | 1 | Evolutionary Ecology of Social and Sexual Systems: Crustaceans As Model Organisms | J. Emmett Duffy and Martin Thiel | 0879698659 | Sep 2007 | 1 | Emerging Model Organisms: A Laboratory Manual, Volume 2 | Cold Spring Harbor Laboratory Press | 0879698721 | Apr 2011 | 0 | Emerging Model Organisms: A Laboratory Manual, Volume 1 | Cold Spring Harbor Laboratory Press | 0805074589 | Nov 2008 | 0 | A Feeling for the Organism, 10th Anniversary Edition: The Life and Work of Barbara McClintock | Evelyn Fox Keller | 0898715547 | Feb 1984 | 0 |

book

  
If we now imagine a second table with book prices in it:

| ISBN       | Format    | Price (\$) |------------|-----------|------------| 9400707495 | Hardback  | 189.00     | 9400707495 | Ebook     | 151.20     | 0879698659 | Hardback  | 59.99      | 0879698659 | Paperback | 14.99      | 0879698659 | Ebook     | 34.99      | 0879698721 | Hardback  | 234.00     | 0879698721 | Paperback | 134.00     | 0805074589 | Hardback  | 234.00     | 0805074589 | Paperback | 129.00     | 0898715547 | Hardback  | 64.99      |

price

This table has no primary keys, and the ISBN is acting as a **foreign
key**.

If we look at an individual record from each table, we can see how the
two tables relate to each other.

|------------------|--------------------------------------------------| Title            | Mouse as a Model Organism: From Animals to Cells | Author           | Cord Brakebusch and Taina Pihlajaniemi           | ISBN             | 9400707495                                       | Publication date | Apr 2011                                         | Kindle version   | 1                                                |

book

|--------|------------| ISBN   | 9400707495 | format | Hardback   | price  | 189.00     |

price

---
title: "Chado WWW Module"
---
<span id="top"></span>

# <span dir="auto">Chado WWW Module</span>

## Contents

- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
- [<span class="tocnumber">2</span>
  <span class="toctext">Tables</span>](#Tables)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Table:
    wwwuser</span>](#Table:_wwwuser)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Table:
    wwwuser_cvterm</span>](#Table:_wwwuser_cvterm)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Table:
    wwwuser_expression</span>](#Table:_wwwuser_expression)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Table:
    wwwuser_feature</span>](#Table:_wwwuser_feature)
  - [<span class="tocnumber">2.5</span> <span class="toctext">Table:
    wwwuser_genotype</span>](#Table:_wwwuser_genotype)
  - [<span class="tocnumber">2.6</span> <span class="toctext">Table:
    wwwuser_organism</span>](#Table:_wwwuser_organism)
  - [<span class="tocnumber">2.7</span> <span class="toctext">Table:
    wwwuser_phenotype</span>](#Table:_wwwuser_phenotype)
  - [<span class="tocnumber">2.8</span> <span class="toctext">Table:
    wwwuser_project</span>](#Table:_wwwuser_project)
  - [<span class="tocnumber">2.9</span> <span class="toctext">Table:
    wwwuser_pub</span>](#Table:_wwwuser_pub)
  - [<span class="tocnumber">2.10</span> <span class="toctext">Table:
    wwwuserrelationship</span>](#Table:_wwwuserrelationship)

# <span id="Introduction" class="mw-headline">Introduction</span>

# <span id="Tables" class="mw-headline">Tables</span>

## <span id="Table:_wwwuser" class="mw-headline">Table: wwwuser</span>

Keep track of WWW users. This may also be useful in an audit module at
some point.

| F-Key | Name       | Type                   | Description       |
| ----- | ---------- | ---------------------- | ----------------- |
|       | wwwuser_id | serial                 | _PRIMARY KEY_     |
|       | username   | character varying(32)  | _UNIQUE NOT NULL_ |
|       | password   | character varying(32)  | _NOT NULL_        |
|       | email      | character varying(128) | _NOT NULL_        |
|       | profile    | text                   |                   |

wwwuser Structure

Tables referencing this one via Foreign Key Constraints:

- [wwwuser_cvterm](Chado_Tables#Table:_wwwuser_cvterm "Chado Tables")

<!-- -->

- [wwwuser_expression](Chado_Tables#Table:_wwwuser_expression "Chado Tables")

<!-- -->

- [wwwuser_feature](Chado_Tables#Table:_wwwuser_feature "Chado Tables")

<!-- -->

- [wwwuser_genotype](Chado_Tables#Table:_wwwuser_genotype "Chado Tables")

<!-- -->

- [wwwuser_organism](Chado_Tables#Table:_wwwuser_organism "Chado Tables")

<!-- -->

- [wwwuser_phenotype](Chado_Tables#Table:_wwwuser_phenotype "Chado Tables")

<!-- -->

- [wwwuser_project](Chado_Tables#Table:_wwwuser_project "Chado Tables")

<!-- -->

- [wwwuser_pub](Chado_Tables#Table:_wwwuser_pub "Chado Tables")

<!-- -->

- [wwwuserrelationship](Chado_Tables#Table:_wwwuserrelationship "Chado Tables")

---

## <span id="Table:_wwwuser_cvterm" class="mw-headline">Table: wwwuser_cvterm</span>

Track wwwuser interest in cvterms.

| F-Key                                                 | Name              | Type     | Description          |
| ----------------------------------------------------- | ----------------- | -------- | -------------------- |
|                                                       | wwwuser_cvterm_id | serial   | _PRIMARY KEY_        |
| [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables") | wwwuser_id        | integer  | _UNIQUE#1 NOT NULL_  |
| [cvterm](Chado_Tables#Table:_cvterm "Chado Tables")   | cvterm_id         | integer  | _UNIQUE#1 NOT NULL_  |
|                                                       | world_read        | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_cvterm Structure

---

## <span id="Table:_wwwuser_expression" class="mw-headline">Table: wwwuser_expression</span>

Track wwwuser interest in expressions.

| F-Key                                                       | Name                  | Type     | Description          |
| ----------------------------------------------------------- | --------------------- | -------- | -------------------- |
|                                                             | wwwuser_expression_id | serial   | _PRIMARY KEY_        |
| [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables")       | wwwuser_id            | integer  | _UNIQUE#1 NOT NULL_  |
| [expression](Chado_Tables#Table:_expression "Chado Tables") | expression_id         | integer  | _UNIQUE#1 NOT NULL_  |
|                                                             | world_read            | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_expression Structure

---

## <span id="Table:_wwwuser_feature" class="mw-headline">Table: wwwuser_feature</span>

Track wwwuser interest in features.

| F-Key                                                 | Name               | Type     | Description          |
| ----------------------------------------------------- | ------------------ | -------- | -------------------- |
|                                                       | wwwuser_feature_id | serial   | _PRIMARY KEY_        |
| [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables") | wwwuser_id         | integer  | _UNIQUE#1 NOT NULL_  |
| [feature](Chado_Tables#Table:_feature "Chado Tables") | feature_id         | integer  | _UNIQUE#1 NOT NULL_  |
|                                                       | world_read         | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_feature Structure

---

## <span id="Table:_wwwuser_genotype" class="mw-headline">Table: wwwuser_genotype</span>

Track wwwuser interest in genotypes.

| F-Key                                                   | Name                | Type     | Description          |
| ------------------------------------------------------- | ------------------- | -------- | -------------------- |
|                                                         | wwwuser_genotype_id | serial   | _PRIMARY KEY_        |
| [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables")   | wwwuser_id          | integer  | _UNIQUE#1 NOT NULL_  |
| [genotype](Chado_Tables#Table:_genotype "Chado Tables") | genotype_id         | integer  | _UNIQUE#1 NOT NULL_  |
|                                                         | world_read          | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_genotype Structure

---

## <span id="Table:_wwwuser_organism" class="mw-headline">Table: wwwuser_organism</span>

Track wwwuser interest in organisms.

| F-Key                                                   | Name                | Type     | Description          |
| ------------------------------------------------------- | ------------------- | -------- | -------------------- |
|                                                         | wwwuser_organism_id | serial   | _PRIMARY KEY_        |
| [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables")   | wwwuser_id          | integer  | _UNIQUE#1 NOT NULL_  |
| [organism](Chado_Tables#Table:_organism "Chado Tables") | organism_id         | integer  | _UNIQUE#1 NOT NULL_  |
|                                                         | world_read          | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_organism Structure

---

## <span id="Table:_wwwuser_phenotype" class="mw-headline">Table: wwwuser_phenotype</span>

Track wwwuser interest in phenotypes.

| F-Key                                                     | Name                 | Type     | Description          |
| --------------------------------------------------------- | -------------------- | -------- | -------------------- |
|                                                           | wwwuser_phenotype_id | serial   | _PRIMARY KEY_        |
| [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables")     | wwwuser_id           | integer  | _UNIQUE#1 NOT NULL_  |
| [phenotype](Chado_Tables#Table:_phenotype "Chado Tables") | phenotype_id         | integer  | _UNIQUE#1 NOT NULL_  |
|                                                           | world_read           | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_phenotype Structure

---

## <span id="Table:_wwwuser_project" class="mw-headline">Table: wwwuser_project</span>

Link wwwuser accounts to projects

| F-Key                                                 | Name               | Type     | Description          |
| ----------------------------------------------------- | ------------------ | -------- | -------------------- |
|                                                       | wwwuser_project_id | serial   | _PRIMARY KEY_        |
| [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables") | wwwuser_id         | integer  | _UNIQUE#1 NOT NULL_  |
| [project](Chado_Tables#Table:_project "Chado Tables") | project_id         | integer  | _UNIQUE#1 NOT NULL_  |
|                                                       | world_read         | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_project Structure

---

## <span id="Table:_wwwuser_pub" class="mw-headline">Table: wwwuser_pub</span>

Track wwwuser interest in publications.

| F-Key                                                 | Name           | Type     | Description          |
| ----------------------------------------------------- | -------------- | -------- | -------------------- |
|                                                       | wwwuser_pub_id | serial   | _PRIMARY KEY_        |
| [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables") | wwwuser_id     | integer  | _UNIQUE#1 NOT NULL_  |
| [pub](Chado_Tables#Table:_pub "Chado Tables")         | pub_id         | integer  | _UNIQUE#1 NOT NULL_  |
|                                                       | world_read     | smallint | _NOT NULL DEFAULT 1_ |

wwwuser_pub Structure

---

## <span id="Table:_wwwuserrelationship" class="mw-headline">Table: wwwuserrelationship</span>

Track wwwuser interest in other wwwusers.

| F-Key                                                 | Name                   | Type     | Description          |
| ----------------------------------------------------- | ---------------------- | -------- | -------------------- |
|                                                       | wwwuserrelationship_id | serial   | _PRIMARY KEY_        |
| [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables") | objwwwuser_id          | integer  | _UNIQUE#1 NOT NULL_  |
| [wwwuser](Chado_Tables#Table:_wwwuser "Chado Tables") | subjwwwuser_id         | integer  | _UNIQUE#1 NOT NULL_  |
|                                                       | world_read             | smallint | _NOT NULL DEFAULT 1_ |

wwwuserrelationship Structure

[Categories](Special%253ACategories "Special%253ACategories"):

- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Chado_WWW_Module" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 04:41 on 18 February 2015.</span>
<!-- - <span id="footer-info-viewcount">37,909 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

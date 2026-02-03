---
title: "GMOD RPC API"
---
# GMOD RPC API

(Redirected from [GMOD REST
API](/wiki/GMOD_REST_API)

  Status</span>](#Document_Status)
- [Background](#Background)
- [Members](#Members)
- [Goals](#Goals)
- [Related
  projects](#Related_projects)
- [Data
  classes](#Data_classes)
- [API
  Version](#API_Version)
- [Data
  version](#Data_version)
- [Result
  dates](#Result_dates)
- [Return
  types](#Return_types)
- [Compression](#Compression)
- [Supported
  HTTP methods](#Supported_HTTP_methods)
- [Querying or
  Filtering by Organism](#Querying_or_Filtering_by_Organism)
- [Pretty
  URLs](#Pretty_URLs)
- [Language
  Implementation Pages](#Language_Implementation_Pages)
- [Error
  handling](#Error_handling)
  - [HTTP
    error code 400](#HTTP_error_code_400)
- [Use
  Cases](#Use_Cases)
- [Services](#Services)
  - [Searches](#Searches)
    - [Organism List](#Organism_List)
      - [Service Name](#Service_Name)
      - [Purpose](#Purpose)
      - [URL](#URL)
      - [Return types](#Return_types_2)
      - [Default return
        type](#Default_return_type)
      - [Example URLs](#Example_URLs)
      - [XML Result](#XML_Result)
      - [JSON Result](#JSON_Result)
    - [Gene
      full text search](#Gene_full_text_search)
      - [Service Name](#Service_Name_2)
      - [Purpose](#Purpose_2)
      - [Description](#Description)
      - [URL](#URL_2)
      - [Return types](#Return_types_3)
      - [Default return
        type](#Default_return_type_2)
      - [Example URLs](#Example_URLs_2)
      - [XML Result](#XML_Result_2)
      - [JSON Result](#JSON_Result_2)
    - [Gene
      location](#Gene_location)
      - [Service Name](#Service_Name_3)
      - [Purpose](#Purpose_3)
      - [Description](#Description_2)
      - [URL](#URL_3)
      - [Return types](#Return_types_4)
      - [Default return
        type](#Default_return_type_3)
      - [Example URLs](#Example_URLs_3)
      - [XML Result](#XML_Result_3)
      - [JSON Result](#JSON_Result_3)
    - [Gene
      Ontology search](#Gene_Ontology_search)
      - [Service Name](#Service_Name_4)
      - [Purpose](#Purpose_4)
      - [Description](#Description_3)
      - [URL](#URL_4)
      - [Return types](#Return_types_5)
      - [Default return
        type](#Default_return_type_4)
      - [Example URLs](#Example_URLs_4)
      - [XML Result](#XML_Result_4)
      - [JSON Result](#JSON_Result_4)
    - [Gene
      ortholog search](#Gene_ortholog_search)
      - [Service name](#Service_name_5)
      - [Purpose](#Purpose_5)
      - [Description](#Description_4)
      - [URL](#URL_5)
      - [Return types](#Return_types_6)
      - [Default return
        type](#Default_return_type_5)
      - [Example URLs](#Example_URLs_5)
      - [XML Result:](#XML_Result:)
      - [JSON Result](#JSON_Result_5)
    - [Organism ortholog
      search](#Organism_ortholog_search)
      - [Service name](#Service_name_6)
      - [Purpose](#Purpose_6)
      - [Description](#Description_5)
      - [URL](#URL_6)
      - [Return types](#Return_types_7)
      - [Default return
        type](#Default_return_type_6)
      - [Example URLs](#Example_URLs_6)
      - [XML Result:](#XML_Result:_2)
      - [JSON Result](#JSON_Result_6)
  - [Fetching](#Fetching)
    - [Gene
      records](#Gene_records)
      - [Service name](#Service_name_7)
      - [Purpose](#Purpose_7)
      - [Description](#Description_6)
      - [URL](#URL_7)
      - [Return types](#Return_types_8)
      - [Default return
        type](#Default_return_type_7)
      - [Example URLs](#Example_URLs_7)
      - [XML Result](#XML_Result_5)
    - [Sequence](#Sequence)
      - [Service name](#Service_name_8)
      - [Purpose](#Purpose_8)
      - [Description](#Description_7)
      - [URL](#URL_8)
      - [Return types](#Return_types_9)
      - [Example URLs](#Example_URLs_8)
      - [FASTA Result:](#FASTA_Result:)
- [TODO](#TODO)

## Document Status

In progress.

## Background

This effort was started after [Josh
Goodman](User%253AJogoodma "User%253AJogoodma")'s talk at the [January 2009 GMOD
Meeting](January_2009_GMOD_Meeting "January 2009 GMOD Meeting") meeting
titled "[MOD Web API (A RESTful interface for
MODs)](January_2009_GMOD_Meeting#A_RESTful_Interface_for_MODs.3F "January 2009 GMOD Meeting")".
The main idea is to increase interoperability among the various model
organism databases by creating an easy to use high level RESTful
[API](Glossary#API "Glossary"). The queries iterated below are currently
in the proposal stage and have no been implemented at any
[MOD](MOD "MOD").

## Members

- [Josh Goodman](User%253AJogoodma "User%253AJogoodma") -
  <a href="http://flybase.org" class="external text"
  rel="nofollow">FlyBase</a>
- Robert Buels -
  <a href="http://www.sgn.cornell.edu/" class="external text"
  rel="nofollow">Sol Genomics Network</a>
- Richard Smith -
  <a href="http://www.intermine.org" class="external text"
  rel="nofollow">InterMine</a>
- Giles Velarde

## Services

### Searches

#### Organism List

##### Service Name

organisms

##### Purpose

Provides a list of organisms that are able to be queried with the
service provider.

##### URL

http://yourmod.org/gmodrpc/v\<api version\>/organisms\[.xml \| .json\]

##### Return types

XML or JSON

##### Default return type

XML

##### Example URLs

- http://flybase.org/gmodrpc/v1.1/organisms
- http://flybase.org/gmodrpc/v1.1/organisms.xml
- http://flybase.org/gmodrpc/v1.1/organisms.json

##### XML Result

``` de1
<?xml version="1.0" encoding="UTF-8"?>
<resultset>
   <api_version>1.1</api_version>
   <data_provider>FlyBase</data_provider>
   <data_version>FB2008_10</data_version>
   <result>
      <organism>
         <genus>Drosophila</genus>
         <species>melanogaster</species>
         <taxonomy_id>7227</taxonomy_id>
      </organism>
   </result>
   <result>
      <organism>
          <species>Drosophila</species>
          <genus>simulans</genus>
          <taxonomy_id>7240</taxonomy_id>
      </organism>
    </result>
</resultset>
```

##### JSON Result

    {
       resultset:{
           api_version:1.1,
           data_provider:'FlyBase',
           data_version:'FB2008_10',
           result:[
               {
                   organism:{
                       genus:'Drosophila',
                       species:'melanogaster',
                       taxonomy_id:7227
                   }
               },
               {
                   organism:{
                       species:'Drosophila',
                       genus:'simulans',
                       taxonomy_id:7240
                   }
               }
           ]
       }
    }

#### Gene full text search

##### Service Name

fulltext

##### Purpose

Performs a full text search on records and returns the IDs for matching
records.

##### Description

This service returns features that contain the search term anywhere in
the gene record. Results can be restricted to a specific organism by
supplying the NCBI taxonomy id.

##### URL

http://yourmod.org/gmodrpc/v\<api version\>/fulltext/\<search
term\>\[.xml \| .json\]?\[type=\<SO term
ID\>\]\[taxid=\<taxid\>\]\[genus=\<genus\>\]\[species=\<species\>\]

##### Return types

XML or JSON

##### Default return type

XML

##### Example URLs

- http://flybase.org/gmodrpc/v1.1/fulltext/cotransfection?type=SO:0000704 -
  Find genes that contain the term cotransfection.
- http://flybase.org/gmodrpc/v1.1/fulltext/cotransfection?type=SO:0000704&taxid=7227 -
  Find Drosophila melanogaster genes that contain the term
  cotransfection.
- http://flybase.org/gmodrpc/v1.1/fulltext/AE003845.json?type=SO:0000704 -
  Find genes that contain the term AE003845 and return a JSON result.
- http://flybase.org/gmodrpc/v1.1/fulltext/IPR000483.json?taxid=7240&type=SO:0000704 -
  Find Drosophila simulans genes that are labeled with InterPro ID
  IPR000483.

##### XML Result

``` de1
<?xml version="1.0" encoding="UTF-8"?>
<resultset>
   <api_version>1.1</api_version>
   <data_provider>FlyBase</data_provider>
   <data_version>FB2008_10</data_version>
   <query_time>2009-01-15 09:03:00</query_time>
   <query_url>http://flybase.org/gmodrpc/v1.1/fulltext/cotransfection?type=SO:0000704</query_url>
   <result>
      <dbxref>
         <db>FlyBase</db>
         <accession>FBgn0085432</accession>
         <url>http://flybase.org/gmodrpc/v1.1/fetch/FBgn0085432</url>
      </dbxref>
      <date_created>2003-03-08 00:00:00</date_created>
      <last_modified>2005-01-15 09:03:00</last_modified>
   </result>
   <result>
      <dbxref>
         <db>FlyBase</db>
         <accession>FBgn0004364</accession>
         <url>http://flybase.org/gmodrpc/v1.1/fetch/FBgn0004364</url>
      </dbxref>
      <date_created>2005-01-08 00:00:00</date_created>
      <last_modified>2009-01-01 00:00:00</last_modified>
   </result>
</resultset>
```

##### JSON Result

    {
       resultset:{
           api_version:1.1,
           data_provider:'FlyBase',
           data_version:'FB2008_10',
           query_time:'2009-01-15 09:03:00',
           query_url:'http://flybase.org/gmodrpc/v1.1/fulltext/cotransfection?type=SO:0000704',
           result:[
               {
                   dbxref:{
                       db:'FlyBase',
                       accession:'FBgn0085432',
                       url:'http://flybase.org/gmodrpc/v1.1/fetch/FBgn0085432'
                   },
                   date_created:'2003-03-08 00:00:00',
                   last_modified:'2005-01-15 09:03:00'
               },
               {
                   dbxref:{
                       db:'FlyBase',
                       accession:'FBgn0004364',
                       url:'http://flybase.org/gmodrpc/v1.1/fetch/FBgn0004364'
                   },
                   date_created:'2005-01-08 00:00:00',
                   last_modified:'2009-01-01 00:00:00'
               }
           ]
       }
    }

#### Gene location

##### Service Name

location

##### Purpose

Retrieves a list of features that lie within a specific sequence range.

##### Description

This service returns features that lie within a specific sequence range.
Arguments include the name of the largest assembled unit (i.e.
chromosome, scaffold, etc...), location start (fmin), location stop
(fmax), and strand. Results can be restricted to a specific organism by
supplying the NCBI taxonomy id.

##### URL

http://yourmod.org/gmodrpc/v\<api
version\>/location/chromosome/\<name\>\[.xml \| .json\]?\[type=\<SO term
ID\>\]\[fmin=\<int\>\]\[fmax=\<int\>\]\[strand=(1 \|
-1)\]\[taxid=\<taxid\>\]\[genus=\<genus\>\]\[species=\<species\>\]

##### Return types

XML or JSON

##### Default return type

XML

##### Example URLs

- http://flybase.org/gmodrpc/v1.1/location/chromosome/X?type=SO:0000704 -
  Find all genes that are localized on the X chromosome of any
  Drosophila species.
- http://flybase.org/gmodrpc/v1.1/location/chromosome/X?type=SO:0000704&taxid=7227 -
  Find all genes that are localized to the X chromosome of melanogaster.
- http://flybase.org/gmodrpc/v1.1/location/chromosome/X.json?type=SO:0000704&fmin=40000&taxid=7227 -
  Find all genes that are localized on the X chromosome in the range of
  40,000 bp to the end of X on any strand.
- http://flybase.org/gmodrpc/v1.1/location/chromosome/X.xml?type=SO:0000704&genus=Drosophila&species=melanogaster&fmax=40000 -
  Find all genes that are localized on the X chromosome in the range of
  the start of the X up to and including 40,000 bp on any strand.
- http://flybase.org/gmodrpc/v1.1/location/chromosome/X.xml?type=SO:0000704&fmin=50000&fmax=140000&strand=1&taxid=7227 -
  Find all genes that are localized on the plus strand of the X
  chromosome between and including 50,000 bp and 140,000 bp.

##### XML Result

``` de1
<?xml version="1.0" encoding="UTF-8"?>
<resultset>
   <api_version>1.1</api_version>
   <data_provider>FlyBase</data_provider>
   <data_version>FB2008_10</data_version>
   <query_time>2009-01-15 09:03:00</query_time>
   <query_url>http://flybase.org/gmodrpc/v1.1/location/chromosome/2L?type=SO:0000704&amp;fmin=12587000&amp;fmax=12629000&amp;taxid=7227</query_url>
   <result>
      <dbxref>
         <db>FlyBase</db>
         <accession>FBgn0085424</accession>
         <url>http://flybase.org/gmodrpc/v1.1/fetch/FBgn0085424</url>
      </dbxref>
      <date_created>2003-03-08 00:00:00</date_created>
      <last_modified>2005-01-15 09:03:00</last_modified>
   </result>
</resultset>
```

##### JSON Result

    {
       resultset:{
           api_version:1.1,
           data_provider:'FlyBase',
           data_version:'FB2008_10',
           query_time:'2009-01-15 09:03:00',
           query_url:'http://flybase.org/gmodrpc/v1.1/location/chromosome/2L?type=SO:0000704&fmin=12587000&fmax=12629000&taxid=7227',
           result:[
               {
                   dbxref:{
                       db:'FlyBase',
                       accession:'FBgn0085424',
                       url:'http://flybase.org/gmodrpc/v1.1/fetch/FBgn0085424'
                   },
                   date_created:'2003-03-08 00:00:00',
                   last_modified:'2005-01-15 09:03:00'
               }
           ]
       }
    }

#### Gene Ontology search

##### Service Name

ontology

##### Purpose

Search for genes that have been annotated with a particular gene
ontology ID.

##### Description

This service returns genes that have been annotated with a particular
ontology term. Results can be restricted to a specific organism by
supplying the NCBI taxonomy id.

##### URL

http://yourmod.org/gmodrpc/v\<api version\>/ontology/gene/\<ontology
ID\>\[.xml \|
.json\]?\[taxid=\<taxid\>\]\[genus=\<genus\>\]\[species=\<species\>\]

##### Return types

XML or JSON

##### Default return type

XML

##### Example URLs

- http://flybase.org/gmodrpc/v1.1/ontology/gene/GO:0005515 - Find all
  genes annotated with GO:0005515.
- http://flybase.org/gmodrpc/v1.1/ontology/gene/!GO:0005515 - Find all
  genes annotated with GO:0005515 and the GO NOT operator.
- http://flybase.org/gmodrpc/v1.1/ontology/gene/GO:0005515?taxid=7227 -
  Find all Drosophila melanogaster genes annotated with GO:0005515.
- http://flybase.org/gmodrpc/v1.1/ontology/gene/GO:0005515.json - Find
  all genes annotated with GO:0005515 and return a JSON result.

##### XML Result

``` de1
<?xml version="1.0" encoding="UTF-8"?>
<resultset>
   <api_version>1.1</api_version>
   <data_provider>FlyBase</data_provider>
   <data_version>FB2008_10</data_version>
   <query_time>2009-01-15 09:03:00</query_time>
   <query_url>http://flybase.org/gmodrpc/v1.1/ontology/gene/GO:0005515</query_url>
   <result>
      <dbxref>
         <db>FlyBase</db>
         <accession>FBgn0085432</accession>
         <url>http://flybase.org/gmodrpc/v1.1/fetch/FBgn0085432</url>
      </dbxref>
      <date_created>2003-03-08 00:00:00</date_created>
      <last_modified>2005-01-15 09:03:00</last_modified>
   </result>
   <result>
      <dbxref>
         <db>FlyBase</db>
         <accession>FBgn0004364</accession>
         <url>http://flybase.org/gmodrpc/v1.1/fetch/FBgn0004364</url>
      </dbxref>
      <date_created>2005-01-08 00:00:00</date_created>
      <last_modified>2009-01-01 00:00:00</last_modified>
   </result>
</resultset>
```

##### JSON Result

    {
       resultset:{
           api_version:1.1,
           data_provider:'FlyBase',
           data_version:'FB2008_10',
           query_time:'2009-01-15 09:03:00',
           query_url:'http://flybase.org/gmodrpc/v1.1/ontology/gene/GO:0005515',
           result:[
               {
                   dbxref:{
                       db:'FlyBase',
                       accession:'FBgn0085432',
                       url:'http://flybase.org/gmodrpc/v1.1/fetch/FBgn0085432'
                   },
                   date_created:'2003-03-08 00:00:00',
                   last_modified:'2005-01-15 09:03:00'
               },
               {
                   dbxref:{
                       db:'FlyBase',
                       accession:'FBgn0004364',
                       url:'http://flybase.org/gmodrpc/v1.1/fetch/FBgn0004364'
                   },
                   date_created:'2005-01-08 00:00:00',
                   last_modified:'2009-01-01 00:00:00'
               }
           ]
       }
    }

#### Gene ortholog search

##### Service name

orthologs/gene

##### Purpose

Search for orthologs of the supplied gene ID.

##### Description

This service returns genes that have been determined by some means to be
orthologous to the supplied gene ID. If the supplied gene ID is within
the namespace of the web service provider then all known orthologs of
that gene are returned. If the supplied gene ID is not within the
namespace of the web service provider then it only returns genes for
organisms that are offered by the service provider.

For example, for a given gene FlyBase stores orthology calls to other
FlyBase genes and non FlyBase genes. Thus, given a FlyBase gene ID you
can obtain a list of gene IDs for genes within FlyBase and to other non
Drosophila species. In addition, given a non FlyBase gene ID you can
obtain a list of FlyBase genes that are orthologous to it.

Results can be restricted to a specific organism by supplying the NCBI
taxonomy ID.

##### URL

http://yourmod.org/gmodrpc/v\<api version\>/orthologs/gene/\<gene
ID\>\[.xml \|
.json\]?\[taxid=\<taxid\>\]\[genus=\<genus\>\]\[species=\<species\>\]

##### Return types

XML or JSON

##### Default return type

XML

##### Example URLs

- http://flybase.org/gmodrpc/v1.1/orthologs/gene/FBgn0004364 - Find all
  FlyBase and non FlyBase genes that are orthologous to FBgn0004364.
- http://flybase.org/gmodrpc/v1.1/orthologs/gene/FBgn0004364?taxid=7240 -
  Find out if FBgn0004364 has an ortholog in Drosophila simulans.
- http://flybase.org/gmodrpc/v1.1/orthologs/gene/WBGene12345.json - Find
  all FlyBase genes that are orthologous to WBGene12345 and return a
  JSON result.

##### XML Result:

``` de1
<?xml version="1.0" encoding="UTF-8"?>
<resultset>
   <api_version>1.1</api_version>
   <data_provider>FlyBase</data_provider>
   <data_version>FB2008_10</data_version>
   <query_time>2009-01-15 09:03:00</query_time>
   <query_url>http://flybase.org/gmodrpc/v1.1/orthologs/gene/FBgn0000490</query_url>
   <result>
      <dbxref>
         <db>FlyBase</db>
         <accession>FBgn0097591</accession>
         <data_provider>FlyBase</data_provider>
         <url>http://flybase.org/gmodrpc/v1.1/fetch/FBgn0097591</url>
      </dbxref>
   </result>
   <result>
      <dbxref>
          <db>ENSEMBL</db>
          <accession>ENSBTAP00000004992</accession>
          <data_provider>InParanoid</data_provider>
      </dbxref>
   </result>
</resultset>
```

##### JSON Result

    {
       resultset:{
           api_version:1.1,
           data_provider:'FlyBase',
           data_version:'FB2008_10',
           query_time:'2009-01-15 09:03:00',
           query_url:'http://flybase.org/gmodrpc/v1.1/orthologs/gene/FBgn0000490',
           result:[
               {
                   dbxref:{
                       db:'FlyBase',
                       accession:'FBgn0097591',
                       data_provider:'FlyBase'
                       url:'http://flybase.org/gmodrpc/v1.1/fetch/FBgn0097591'
                   }
               },
               {
                   dbxref:{
                       db:'ENSEMBL',
                       accession:'ENSBTAP00000004992',
                       data_provider:'InParanoid'
                   }
               }
           ]
       }
    }

#### Organism ortholog search

##### Service name

orthologs/organism

##### Purpose

Returns a list of orthologs between an organism and one or more other
organisms.

##### Description

This service returns genes that have been determined by some means to be
orthologous between a single organism and one or more other organisms.
The organisms are specified by providing taxonomy IDs.

##### URL

http://yourmod.org/gmodrpc/v\<api
version\>/orthologs/organism\[/\<taxid\>\]\[/genus/\<genus\>/species/\<species\>\]\[.xml
\|
.json\]?\[to_taxid=\<taxid\>\]\[to_genus=\<genus\>&to_species=\<species\>\]

##### Return types

XML or JSON

##### Default return type

XML

##### Example URLs

- http://flybase.org/gmodrpc/v1.1/orthologs/organism/genus/Drosophila/species/melanogaster -
  Find all orthologs between Dmel and any other species.
- http://flybase.org/gmodrpc/v1.1/orthologs/organism/7227.xml?to_taxid=7240 -
  Find all orthologs between Dmel and Dsim.
- http://flybase.org/gmodrpc/v1.1/orthologs/organism/7227.json?to_taxid=7240 -
  Same as above except returned in JSON format.

##### XML Result:

``` de1
<?xml version="1.0" encoding="UTF-8"?>
<resultset>
   <api_version>1.1</api_version>
   <data_provider>FlyBase</data_provider>
   <data_version>FB2008_10</data_version>
   <query_time>2009-01-15 09:03:00</query_time>
   <query_url>http://flybase.org/gmodrpc/v1.1/orthologs/organism/genus/Drosophila/species/melanogaster</query_url>
   <result>
      <dbxref>
         <db>FlyBase</db>
         <accession>FBgn0000490</accession>
         <taxonomy_id>7227</taxonomy_id>
         <data_provider>FlyBase</data_provider>
         <url>http://flybase.org/gmodrpc/v1.1/fetch/FBgn0000490</url>
      </dbxref>
      <dbxref>
         <db>FlyBase</db>
         <accession>FBgn0015673</accession>
         <taxonomy_id>7240</taxonomy_id>
         <data_provider>FlyBase</data_provider>
         <url>http://flybase.org/gmodrpc/v1.1/fetch/FBgn0015673</url>
      </dbxref>
      <dbxref>
         <db>WormBase</db>
         <accession>WBGene00006570</accession>
         <taxonomy_id>6239</taxonomy_id>
         <data_provider>InParanoid</data_provider>
         <url>http://wormbase.org/gmodrpc/v1.1/fetch/WBGene00006570</url>
      </dbxref>
   </result>
...
</resultset>
```

##### JSON Result

    {
       resultset:{
           api_version:1.1,
           data_provider:'FlyBase',
           data_version:'FB2008_10',
           query_time:'2009-01-15 09:03:00',
           query_url:'http://flybase.org/gmodrpc/v1.1/orthologs/organism/genus/Drosophila/species/melanogaster',
           result:[
             {
               dbxref:[
                   {
                       db:'FlyBase',
                       accession:'FBgn0000490',
                       taxonomy_id:7227,
                       data_provider:'FlyBase',
                       url:'http://flybase.org/gmodrpc/v1.1/fetch/FBgn0000490'
                   },
                   {
                       db:'FlyBase',
                       accession:'FBgn0015673'
                       taxonomy_id:7240,
                       data_provider:'FlyBase',
                       url:'http://flybase.org/gmodrpc/v1.1/fetch/FBgn0015673'
                   },
                   {
                       db:'WormBase',
                       accession:'WBGene00006570',
                       taxonomy_id:6239,
                       data_provider:'InParanoid',
                       url:'http://wormbase.org/gmodrpc/v1.1/fetch/WBGene00006570'
                   }
               ]
             }
           ]
       }
    }

### Fetching

#### Gene records

##### Service name

fetch/gene

##### Purpose

To fetch gene records in the Generic gene page XML format as implemented
by [Bio GMOD
GenericGenePage](Bio_GMOD_GenericGenePage "Bio GMOD GenericGenePage").

##### Description

##### URL

http://yourmod.org/gmodrpc/v\<api version\>/fetch/gene/\<gene ID\>

##### Return types

XML

##### Default return type

XML

##### Example URLs

- http://flybase.org/gmodrpc/v1.1/fetch/gene/FBgn0097591

##### XML Result

See [Bio GMOD
GenericGenePage](Bio_GMOD_GenericGenePage "Bio GMOD GenericGenePage")
for example XML.

#### Sequence

##### Service name

fetch/seq

##### Purpose

Returns FASTA sequence for the specified query.

##### Description

##### URL

http://yourmod.org/gmodrpc/v\<api version\>/fetch/seq/\<ID\>\[/\<SO term
ID of subtype\>\]

##### Return types

FASTA

##### Example URLs

- http://flybase.org/gmodrpc/v1.1/fetch/seq/FBgn0097591.fasta - Fetch
  the FASTA sequence of FBgn0097591
- http://flybase.org/gmodrpc/v1.1/fetch/seq/FBgn0097591/SO:0000204.fasta -
  Download all 5' UTRs of the gene FBgn0097591
- http://flybase.org/gmodrpc/v1.1/fetch/seq/FBgn0097591/SO:0000316.fasta -
  Download all CDS features of the gene FBgn0097591
- http://flybase.org/gmodrpc/v1.1/fetch/seq/FBgn0097591/SO:0000316.fasta -
  Download all CDS features of the gene FBgn0097591



##### FASTA Result:

## TODO

- WADLs for all services?

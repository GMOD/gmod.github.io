---
title: "GMOD RPC API"
---




<span id="top"></span>




# <span dir="auto">GMOD RPC API</span>












## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Document
  Status</span>](#Document_Status)
- [<span class="tocnumber">2</span>
  <span class="toctext">Background</span>](#Background)
- [<span class="tocnumber">3</span>
  <span class="toctext">Members</span>](#Members)
- [<span class="tocnumber">4</span>
  <span class="toctext">Goals</span>](#Goals)
- [<span class="tocnumber">5</span> <span class="toctext">Related
  projects</span>](#Related_projects)
- [<span class="tocnumber">6</span> <span class="toctext">Data
  classes</span>](#Data_classes)
- [<span class="tocnumber">7</span> <span class="toctext">API
  Version</span>](#API_Version)
- [<span class="tocnumber">8</span> <span class="toctext">Data
  version</span>](#Data_version)
- [<span class="tocnumber">9</span> <span class="toctext">Result
  dates</span>](#Result_dates)
- [<span class="tocnumber">10</span> <span class="toctext">Return
  types</span>](#Return_types)
- [<span class="tocnumber">11</span>
  <span class="toctext">Compression</span>](#Compression)
- [<span class="tocnumber">12</span> <span class="toctext">Supported
  HTTP methods</span>](#Supported_HTTP_methods)
- [<span class="tocnumber">13</span> <span class="toctext">Querying or
  Filtering by Organism</span>](#Querying_or_Filtering_by_Organism)
- [<span class="tocnumber">14</span> <span class="toctext">Pretty
  URLs</span>](#Pretty_URLs)
- [<span class="tocnumber">15</span> <span class="toctext">Language
  Implementation Pages</span>](#Language_Implementation_Pages)
- [<span class="tocnumber">16</span> <span class="toctext">Error
  handling</span>](#Error_handling)
  - [<span class="tocnumber">16.1</span> <span class="toctext">HTTP
    error code 400</span>](#HTTP_error_code_400)
- [<span class="tocnumber">17</span> <span class="toctext">Use
  Cases</span>](#Use_Cases)
- [<span class="tocnumber">18</span>
  <span class="toctext">Services</span>](#Services)
  - [<span class="tocnumber">18.1</span>
    <span class="toctext">Searches</span>](#Searches)
    - [<span class="tocnumber">18.1.1</span>
      <span class="toctext">Organism List</span>](#Organism_List)
      - [<span class="tocnumber">18.1.1.1</span>
        <span class="toctext">Service Name</span>](#Service_Name)
      - [<span class="tocnumber">18.1.1.2</span>
        <span class="toctext">Purpose</span>](#Purpose)
      - [<span class="tocnumber">18.1.1.3</span>
        <span class="toctext">URL</span>](#URL)
      - [<span class="tocnumber">18.1.1.4</span>
        <span class="toctext">Return types</span>](#Return_types_2)
      - [<span class="tocnumber">18.1.1.5</span>
        <span class="toctext">Default return
        type</span>](#Default_return_type)
      - [<span class="tocnumber">18.1.1.6</span>
        <span class="toctext">Example URLs</span>](#Example_URLs)
      - [<span class="tocnumber">18.1.1.7</span>
        <span class="toctext">XML Result</span>](#XML_Result)
      - [<span class="tocnumber">18.1.1.8</span>
        <span class="toctext">JSON Result</span>](#JSON_Result)
    - [<span class="tocnumber">18.1.2</span> <span class="toctext">Gene
      full text search</span>](#Gene_full_text_search)
      - [<span class="tocnumber">18.1.2.1</span>
        <span class="toctext">Service Name</span>](#Service_Name_2)
      - [<span class="tocnumber">18.1.2.2</span>
        <span class="toctext">Purpose</span>](#Purpose_2)
      - [<span class="tocnumber">18.1.2.3</span>
        <span class="toctext">Description</span>](#Description)
      - [<span class="tocnumber">18.1.2.4</span>
        <span class="toctext">URL</span>](#URL_2)
      - [<span class="tocnumber">18.1.2.5</span>
        <span class="toctext">Return types</span>](#Return_types_3)
      - [<span class="tocnumber">18.1.2.6</span>
        <span class="toctext">Default return
        type</span>](#Default_return_type_2)
      - [<span class="tocnumber">18.1.2.7</span>
        <span class="toctext">Example URLs</span>](#Example_URLs_2)
      - [<span class="tocnumber">18.1.2.8</span>
        <span class="toctext">XML Result</span>](#XML_Result_2)
      - [<span class="tocnumber">18.1.2.9</span>
        <span class="toctext">JSON Result</span>](#JSON_Result_2)
    - [<span class="tocnumber">18.1.3</span> <span class="toctext">Gene
      location</span>](#Gene_location)
      - [<span class="tocnumber">18.1.3.1</span>
        <span class="toctext">Service Name</span>](#Service_Name_3)
      - [<span class="tocnumber">18.1.3.2</span>
        <span class="toctext">Purpose</span>](#Purpose_3)
      - [<span class="tocnumber">18.1.3.3</span>
        <span class="toctext">Description</span>](#Description_2)
      - [<span class="tocnumber">18.1.3.4</span>
        <span class="toctext">URL</span>](#URL_3)
      - [<span class="tocnumber">18.1.3.5</span>
        <span class="toctext">Return types</span>](#Return_types_4)
      - [<span class="tocnumber">18.1.3.6</span>
        <span class="toctext">Default return
        type</span>](#Default_return_type_3)
      - [<span class="tocnumber">18.1.3.7</span>
        <span class="toctext">Example URLs</span>](#Example_URLs_3)
      - [<span class="tocnumber">18.1.3.8</span>
        <span class="toctext">XML Result</span>](#XML_Result_3)
      - [<span class="tocnumber">18.1.3.9</span>
        <span class="toctext">JSON Result</span>](#JSON_Result_3)
    - [<span class="tocnumber">18.1.4</span> <span class="toctext">Gene
      Ontology search</span>](#Gene_Ontology_search)
      - [<span class="tocnumber">18.1.4.1</span>
        <span class="toctext">Service Name</span>](#Service_Name_4)
      - [<span class="tocnumber">18.1.4.2</span>
        <span class="toctext">Purpose</span>](#Purpose_4)
      - [<span class="tocnumber">18.1.4.3</span>
        <span class="toctext">Description</span>](#Description_3)
      - [<span class="tocnumber">18.1.4.4</span>
        <span class="toctext">URL</span>](#URL_4)
      - [<span class="tocnumber">18.1.4.5</span>
        <span class="toctext">Return types</span>](#Return_types_5)
      - [<span class="tocnumber">18.1.4.6</span>
        <span class="toctext">Default return
        type</span>](#Default_return_type_4)
      - [<span class="tocnumber">18.1.4.7</span>
        <span class="toctext">Example URLs</span>](#Example_URLs_4)
      - [<span class="tocnumber">18.1.4.8</span>
        <span class="toctext">XML Result</span>](#XML_Result_4)
      - [<span class="tocnumber">18.1.4.9</span>
        <span class="toctext">JSON Result</span>](#JSON_Result_4)
    - [<span class="tocnumber">18.1.5</span> <span class="toctext">Gene
      ortholog search</span>](#Gene_ortholog_search)
      - [<span class="tocnumber">18.1.5.1</span>
        <span class="toctext">Service name</span>](#Service_name_5)
      - [<span class="tocnumber">18.1.5.2</span>
        <span class="toctext">Purpose</span>](#Purpose_5)
      - [<span class="tocnumber">18.1.5.3</span>
        <span class="toctext">Description</span>](#Description_4)
      - [<span class="tocnumber">18.1.5.4</span>
        <span class="toctext">URL</span>](#URL_5)
      - [<span class="tocnumber">18.1.5.5</span>
        <span class="toctext">Return types</span>](#Return_types_6)
      - [<span class="tocnumber">18.1.5.6</span>
        <span class="toctext">Default return
        type</span>](#Default_return_type_5)
      - [<span class="tocnumber">18.1.5.7</span>
        <span class="toctext">Example URLs</span>](#Example_URLs_5)
      - [<span class="tocnumber">18.1.5.8</span>
        <span class="toctext">XML Result:</span>](#XML_Result:)
      - [<span class="tocnumber">18.1.5.9</span>
        <span class="toctext">JSON Result</span>](#JSON_Result_5)
    - [<span class="tocnumber">18.1.6</span>
      <span class="toctext">Organism ortholog
      search</span>](#Organism_ortholog_search)
      - [<span class="tocnumber">18.1.6.1</span>
        <span class="toctext">Service name</span>](#Service_name_6)
      - [<span class="tocnumber">18.1.6.2</span>
        <span class="toctext">Purpose</span>](#Purpose_6)
      - [<span class="tocnumber">18.1.6.3</span>
        <span class="toctext">Description</span>](#Description_5)
      - [<span class="tocnumber">18.1.6.4</span>
        <span class="toctext">URL</span>](#URL_6)
      - [<span class="tocnumber">18.1.6.5</span>
        <span class="toctext">Return types</span>](#Return_types_7)
      - [<span class="tocnumber">18.1.6.6</span>
        <span class="toctext">Default return
        type</span>](#Default_return_type_6)
      - [<span class="tocnumber">18.1.6.7</span>
        <span class="toctext">Example URLs</span>](#Example_URLs_6)
      - [<span class="tocnumber">18.1.6.8</span>
        <span class="toctext">XML Result:</span>](#XML_Result:_2)
      - [<span class="tocnumber">18.1.6.9</span>
        <span class="toctext">JSON Result</span>](#JSON_Result_6)
  - [<span class="tocnumber">18.2</span>
    <span class="toctext">Fetching</span>](#Fetching)
    - [<span class="tocnumber">18.2.1</span> <span class="toctext">Gene
      records</span>](#Gene_records)
      - [<span class="tocnumber">18.2.1.1</span>
        <span class="toctext">Service name</span>](#Service_name_7)
      - [<span class="tocnumber">18.2.1.2</span>
        <span class="toctext">Purpose</span>](#Purpose_7)
      - [<span class="tocnumber">18.2.1.3</span>
        <span class="toctext">Description</span>](#Description_6)
      - [<span class="tocnumber">18.2.1.4</span>
        <span class="toctext">URL</span>](#URL_7)
      - [<span class="tocnumber">18.2.1.5</span>
        <span class="toctext">Return types</span>](#Return_types_8)
      - [<span class="tocnumber">18.2.1.6</span>
        <span class="toctext">Default return
        type</span>](#Default_return_type_7)
      - [<span class="tocnumber">18.2.1.7</span>
        <span class="toctext">Example URLs</span>](#Example_URLs_7)
      - [<span class="tocnumber">18.2.1.8</span>
        <span class="toctext">XML Result</span>](#XML_Result_5)
    - [<span class="tocnumber">18.2.2</span>
      <span class="toctext">Sequence</span>](#Sequence)
      - [<span class="tocnumber">18.2.2.1</span>
        <span class="toctext">Service name</span>](#Service_name_8)
      - [<span class="tocnumber">18.2.2.2</span>
        <span class="toctext">Purpose</span>](#Purpose_8)
      - [<span class="tocnumber">18.2.2.3</span>
        <span class="toctext">Description</span>](#Description_7)
      - [<span class="tocnumber">18.2.2.4</span>
        <span class="toctext">URL</span>](#URL_8)
      - [<span class="tocnumber">18.2.2.5</span>
        <span class="toctext">Return types</span>](#Return_types_9)
      - [<span class="tocnumber">18.2.2.6</span>
        <span class="toctext">Example URLs</span>](#Example_URLs_8)
      - [<span class="tocnumber">18.2.2.7</span>
        <span class="toctext">FASTA Result:</span>](#FASTA_Result:)
- [<span class="tocnumber">19</span>
  <span class="toctext">TODO</span>](#TODO)


## <span id="Document_Status" class="mw-headline">Document Status</span>

In progress.

## <span id="Background" class="mw-headline">Background</span>

This effort was started after [Josh
Goodman](/wiki/User%253AJogoodma "User%253AJogoodma")'s talk at the [January
2009 GMOD
Meeting](/wiki/January_2009_GMOD_Meeting "January 2009 GMOD Meeting")
meeting titled "[MOD Web API (A RESTful interface for
MODs)](/wiki/January_2009_GMOD_Meeting#A_RESTful_Interface_for_MODs.3F "January 2009 GMOD Meeting")".
The main idea is to increase interoperability among the various model
organism databases by creating an easy to use high level RESTful
[API](/wiki/Glossary#API "Glossary"). The queries iterated below are
currently in the proposal stage and have no been implemented at any
[MOD](/wiki/MOD "MOD").

## <span id="Members" class="mw-headline">Members</span>

- [Josh Goodman](/wiki/User%253AJogoodma "User%253AJogoodma") -
  <a href="http://flybase.org" class="external text"
  rel="nofollow">FlyBase</a>
- Robert Buels -
  <a href="http://www.sgn.cornell.edu/" class="external text"
  rel="nofollow">Sol Genomics Network</a>
- Richard Smith -
  <a href="http://www.intermine.org" class="external text"
  rel="nofollow">InterMine</a>
- Giles Velarde 

## <span id="Services" class="mw-headline">Services</span>

### <span id="Searches" class="mw-headline">Searches</span>

#### <span id="Organism_List" class="mw-headline">Organism List</span>

##### <span id="Service_Name" class="mw-headline">Service Name</span>

organisms

##### <span id="Purpose" class="mw-headline">Purpose</span>

Provides a list of organisms that are able to be queried with the
service provider.

##### <span id="URL" class="mw-headline">URL</span>

http://yourmod.org/gmodrpc/v\<api version\>/organisms\[.xml \| .json\]

##### <span id="Return_types_2" class="mw-headline">Return types</span>

XML or JSON

##### <span id="Default_return_type" class="mw-headline">Default return type</span>

XML

##### <span id="Example_URLs" class="mw-headline">Example URLs</span>

- http://flybase.org/gmodrpc/v1.1/organisms
- http://flybase.org/gmodrpc/v1.1/organisms.xml
- http://flybase.org/gmodrpc/v1.1/organisms.json

##### <span id="XML_Result" class="mw-headline">XML Result</span>


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


##### <span id="JSON_Result" class="mw-headline">JSON Result</span>

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

#### <span id="Gene_full_text_search" class="mw-headline">Gene full text search</span>

##### <span id="Service_Name_2" class="mw-headline">Service Name</span>

fulltext

##### <span id="Purpose_2" class="mw-headline">Purpose</span>

Performs a full text search on records and returns the IDs for matching
records.

##### <span id="Description" class="mw-headline">Description</span>

This service returns features that contain the search term anywhere in
the gene record. Results can be restricted to a specific organism by
supplying the NCBI taxonomy id.

##### <span id="URL_2" class="mw-headline">URL</span>

http://yourmod.org/gmodrpc/v\<api version\>/fulltext/\<search
term\>\[.xml \| .json\]?\[type=\<SO term
ID\>\]\[taxid=\<taxid\>\]\[genus=\<genus\>\]\[species=\<species\>\]

##### <span id="Return_types_3" class="mw-headline">Return types</span>

XML or JSON

##### <span id="Default_return_type_2" class="mw-headline">Default return type</span>

XML

##### <span id="Example_URLs_2" class="mw-headline">Example URLs</span>

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

##### <span id="XML_Result_2" class="mw-headline">XML Result</span>


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


##### <span id="JSON_Result_2" class="mw-headline">JSON Result</span>

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

#### <span id="Gene_location" class="mw-headline">Gene location</span>

##### <span id="Service_Name_3" class="mw-headline">Service Name</span>

location

##### <span id="Purpose_3" class="mw-headline">Purpose</span>

Retrieves a list of features that lie within a specific sequence range.

##### <span id="Description_2" class="mw-headline">Description</span>

This service returns features that lie within a specific sequence range.
Arguments include the name of the largest assembled unit (i.e.
chromosome, scaffold, etc...), location start (fmin), location stop
(fmax), and strand. Results can be restricted to a specific organism by
supplying the NCBI taxonomy id.

##### <span id="URL_3" class="mw-headline">URL</span>

http://yourmod.org/gmodrpc/v\<api
version\>/location/chromosome/\<name\>\[.xml \| .json\]?\[type=\<SO term
ID\>\]\[fmin=\<int\>\]\[fmax=\<int\>\]\[strand=(1 \|
-1)\]\[taxid=\<taxid\>\]\[genus=\<genus\>\]\[species=\<species\>\]

##### <span id="Return_types_4" class="mw-headline">Return types</span>

XML or JSON

##### <span id="Default_return_type_3" class="mw-headline">Default return type</span>

XML

##### <span id="Example_URLs_3" class="mw-headline">Example URLs</span>

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

##### <span id="XML_Result_3" class="mw-headline">XML Result</span>


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


##### <span id="JSON_Result_3" class="mw-headline">JSON Result</span>

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

#### <span id="Gene_Ontology_search" class="mw-headline">Gene Ontology search</span>

##### <span id="Service_Name_4" class="mw-headline">Service Name</span>

ontology

##### <span id="Purpose_4" class="mw-headline">Purpose</span>

Search for genes that have been annotated with a particular gene
ontology ID.

##### <span id="Description_3" class="mw-headline">Description</span>

This service returns genes that have been annotated with a particular
ontology term. Results can be restricted to a specific organism by
supplying the NCBI taxonomy id.

##### <span id="URL_4" class="mw-headline">URL</span>

http://yourmod.org/gmodrpc/v\<api version\>/ontology/gene/\<ontology
ID\>\[.xml \|
.json\]?\[taxid=\<taxid\>\]\[genus=\<genus\>\]\[species=\<species\>\]

##### <span id="Return_types_5" class="mw-headline">Return types</span>

XML or JSON

##### <span id="Default_return_type_4" class="mw-headline">Default return type</span>

XML

##### <span id="Example_URLs_4" class="mw-headline">Example URLs</span>

- http://flybase.org/gmodrpc/v1.1/ontology/gene/GO:0005515 - Find all
  genes annotated with GO:0005515.
- http://flybase.org/gmodrpc/v1.1/ontology/gene/!GO:0005515 - Find all
  genes annotated with GO:0005515 and the GO NOT operator.
- http://flybase.org/gmodrpc/v1.1/ontology/gene/GO:0005515?taxid=7227 -
  Find all Drosophila melanogaster genes annotated with GO:0005515.
- http://flybase.org/gmodrpc/v1.1/ontology/gene/GO:0005515.json - Find
  all genes annotated with GO:0005515 and return a JSON result.

##### <span id="XML_Result_4" class="mw-headline">XML Result</span>


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


##### <span id="JSON_Result_4" class="mw-headline">JSON Result</span>

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

#### <span id="Gene_ortholog_search" class="mw-headline">Gene ortholog search</span>

##### <span id="Service_name_5" class="mw-headline">Service name</span>

orthologs/gene

##### <span id="Purpose_5" class="mw-headline">Purpose</span>

Search for orthologs of the supplied gene ID.

##### <span id="Description_4" class="mw-headline">Description</span>

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

##### <span id="URL_5" class="mw-headline">URL</span>

http://yourmod.org/gmodrpc/v\<api version\>/orthologs/gene/\<gene
ID\>\[.xml \|
.json\]?\[taxid=\<taxid\>\]\[genus=\<genus\>\]\[species=\<species\>\]

##### <span id="Return_types_6" class="mw-headline">Return types</span>

XML or JSON

##### <span id="Default_return_type_5" class="mw-headline">Default return type</span>

XML

##### <span id="Example_URLs_5" class="mw-headline">Example URLs</span>

- http://flybase.org/gmodrpc/v1.1/orthologs/gene/FBgn0004364 - Find all
  FlyBase and non FlyBase genes that are orthologous to FBgn0004364.
- http://flybase.org/gmodrpc/v1.1/orthologs/gene/FBgn0004364?taxid=7240 -
  Find out if FBgn0004364 has an ortholog in Drosophila simulans.
- http://flybase.org/gmodrpc/v1.1/orthologs/gene/WBGene12345.json - Find
  all FlyBase genes that are orthologous to WBGene12345 and return a
  JSON result.

##### <span id="XML_Result:" class="mw-headline">XML Result:</span>


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


##### <span id="JSON_Result_5" class="mw-headline">JSON Result</span>

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

#### <span id="Organism_ortholog_search" class="mw-headline">Organism ortholog search</span>

##### <span id="Service_name_6" class="mw-headline">Service name</span>

orthologs/organism

##### <span id="Purpose_6" class="mw-headline">Purpose</span>

Returns a list of orthologs between an organism and one or more other
organisms.

##### <span id="Description_5" class="mw-headline">Description</span>

This service returns genes that have been determined by some means to be
orthologous between a single organism and one or more other organisms.
The organisms are specified by providing taxonomy IDs.

##### <span id="URL_6" class="mw-headline">URL</span>

http://yourmod.org/gmodrpc/v\<api
version\>/orthologs/organism\[/\<taxid\>\]\[/genus/\<genus\>/species/\<species\>\]\[.xml
\|
.json\]?\[to_taxid=\<taxid\>\]\[to_genus=\<genus\>&to_species=\<species\>\]

##### <span id="Return_types_7" class="mw-headline">Return types</span>

XML or JSON

##### <span id="Default_return_type_6" class="mw-headline">Default return type</span>

XML

##### <span id="Example_URLs_6" class="mw-headline">Example URLs</span>

- http://flybase.org/gmodrpc/v1.1/orthologs/organism/genus/Drosophila/species/melanogaster -
  Find all orthologs between Dmel and any other species.
- http://flybase.org/gmodrpc/v1.1/orthologs/organism/7227.xml?to_taxid=7240 -
  Find all orthologs between Dmel and Dsim.
- http://flybase.org/gmodrpc/v1.1/orthologs/organism/7227.json?to_taxid=7240 -
  Same as above except returned in JSON format.

##### <span id="XML_Result:_2" class="mw-headline">XML Result:</span>


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


##### <span id="JSON_Result_6" class="mw-headline">JSON Result</span>

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

### <span id="Fetching" class="mw-headline">Fetching</span>

#### <span id="Gene_records" class="mw-headline">Gene records</span>

##### <span id="Service_name_7" class="mw-headline">Service name</span>

fetch/gene

##### <span id="Purpose_7" class="mw-headline">Purpose</span>

To fetch gene records in the Generic gene page XML format as implemented
by [Bio GMOD
GenericGenePage](/wiki/Bio_GMOD_GenericGenePage "Bio GMOD GenericGenePage").

##### <span id="Description_6" class="mw-headline">Description</span>

##### <span id="URL_7" class="mw-headline">URL</span>

http://yourmod.org/gmodrpc/v\<api version\>/fetch/gene/\<gene ID\>

##### <span id="Return_types_8" class="mw-headline">Return types</span>

XML

##### <span id="Default_return_type_7" class="mw-headline">Default return type</span>

XML

##### <span id="Example_URLs_7" class="mw-headline">Example URLs</span>

- http://flybase.org/gmodrpc/v1.1/fetch/gene/FBgn0097591

##### <span id="XML_Result_5" class="mw-headline">XML Result</span>

See [Bio GMOD
GenericGenePage](/wiki/Bio_GMOD_GenericGenePage "Bio GMOD GenericGenePage")
for example XML.

#### <span id="Sequence" class="mw-headline">Sequence</span>

##### <span id="Service_name_8" class="mw-headline">Service name</span>

fetch/seq

##### <span id="Purpose_8" class="mw-headline">Purpose</span>

Returns FASTA sequence for the specified query.

##### <span id="Description_7" class="mw-headline">Description</span>

##### <span id="URL_8" class="mw-headline">URL</span>

http://yourmod.org/gmodrpc/v\<api version\>/fetch/seq/\<ID\>\[/\<SO term
ID of subtype\>\]

##### <span id="Return_types_9" class="mw-headline">Return types</span>

FASTA

##### <span id="Example_URLs_8" class="mw-headline">Example URLs</span>

- http://flybase.org/gmodrpc/v1.1/fetch/seq/FBgn0097591.fasta - Fetch
  the FASTA sequence of FBgn0097591
- http://flybase.org/gmodrpc/v1.1/fetch/seq/FBgn0097591/SO:0000204.fasta -
  Download all 5' UTRs of the gene FBgn0097591
- http://flybase.org/gmodrpc/v1.1/fetch/seq/FBgn0097591/SO:0000316.fasta -
  Download all CDS features of the gene FBgn0097591
- http://flybase.org/gmodrpc/v1.1/fetch/seq/FBgn0097591/SO:0000316.fasta -
  Download all CDS features of the gene FBgn0097591

  

##### <span id="FASTA_Result:" class="mw-headline">FASTA Result:</span>

## <span id="TODO" class="mw-headline">TODO</span>

- WADLs for all services?




[Categories](/wiki/Special%253ACategories "Special%253ACategories"):


- [Web services](/wiki/Category%253AWeb_services "Category%253AWeb services")







## Navigation menu









### Navigation



- <span id="n-GMOD-Home">[GMOD Home](/wiki/Main_Page)</span>
- <span id="n-Software">[Software](/wiki/GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](/wiki/Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](/wiki/Special:AllPages)</span>




### Documentation



- <span id="n-Overview">[Overview](/wiki/Overview)</span>
- <span id="n-FAQs">[FAQs](/wiki/Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](/wiki/Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](/wiki/Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](/wiki/GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](/wiki/Training_and_Outreach)</span>
- <span id="n-Support">[Support](/wiki/Support)</span>
- <span id="n-GMOD-Promotion">[GMOD
  Promotion](/wiki/GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](/wiki/Meetings)</span>
- <span id="n-Calendar">[Calendar](/wiki/Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="/wiki/Special%253ABrowse/GMOD_RPC_API" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:02 on 15 August
  2013.</span>
<!-- - <span id="footer-info-viewcount">187,467 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





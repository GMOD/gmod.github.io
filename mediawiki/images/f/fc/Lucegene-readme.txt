README for LuceGene

LuceGene ('Lucy Jean')
is a document/object search and retrieval system
for Genome and Bioinformatic Databases

Version:  1.4  (released)
Date   :  20 January 2005

Authors: D. Gilbert, gilbertd@indiana.edu, http://marmot.bio.indiana.edu/
         Paul Poole, pppoole@bio.indiana.edu,  
         and others

This is an open-source document/object search and retrieval system
specially tuned for bioinformatics text databases and documents.
It is part of the GMOD (Generic Model Organism Database) project,
http://www.gmod.org/lucegene/, and also http://eugenes.org/gmod/lucegene/

LuceGene is similar in concept to the widely used, commercially
successful, bioinformatics program SRS (Sequence Retrieval System).
LuceGene and Lucene will always be available in source form for
public database uses, due to their open-source license.

Though written in Java language, it can be used from command-line
shells, and performs well that way (current uses include Perl CGI's
calling lucegene).

LuceGene is built on top of the open-source Lucene package,
http://jakarta.apache.org/lucene/
Lucene is used un-changed, with added methods for biology data.

See the accompanying INSTALL.txt for instructions for use of
the lucegene web application with sample data.

The basic package is available at
http://eugenes.org/gmod/lucegene/dist/lucegene.war
with a Demo server at http://eugenes.org/demolucegene/ 


ABOUT LuceGene
---------------

Information Retrieval for Genomes
* IR text search/retrieval tools tuned for data access, not management
* Good for a wide range of semi-structured and complex structured data
* Better functional match for textual data common in biology than
	numeric, table-oriented RDBMS
* Easier to add new data (e.g. SRS parses 100s of existing bio-databanks)

Lucene and LuceGene
* Lucene open-source project at jakarta.apache.org/lucene
* Common text search features: booleans, phrases, word stemming, fuzzy
	and field range searches, relevance ranking
* Comparable to Glimpse, Exite, WAIS, Isearch, ht/dig, Alta-vista, Google backends
* Author Doug Cutting has written text search engines for Apple and Excite

* LuceGene additions
  Data input adaptors for HTML; XML (e.g. MedLine); FlyBase flatfile;
	Biosequences (GenBank, EMBL, etc.)
  Basic output formats for XML, HTML via XSLT, Text, Spreadsheet
  Numeric Range search (** ADDED April 2004)

* Tested with
  100,000s of FlyBase Genes, References, Game and Chado XML annotations
  euGenes gene summaries & Daphnia Medline, Sequences, HTML documents

* LuceGene/Lucene needs
  Links/joins among databases
  Output adaptors ; more flexible configuration for webapp use

* WebServices support as Genome Directory System 
  Access to FlyBase data via GDS (WebServices) using  LuceGene backend added, 
  with simple server/client SOAP using org.eugenes.services.Directory interface.
  

Distribution files
------------------
Currently these alpha distribution files are available -
-- lucegene-1.4-src.jar : sources, documents, configuration for base
   lucegene software with indexing methods for biology data
-- lucegene.war : binary distribution, for webapp (Tomcat) uses
-- lucegene_fb.war : webapp customized for FlyBase use

-- sample data for lucegene.war
   (extracts of BIND, BLAST, FlyBas, GEO, Medline, PDF, UniProt)
 lucegene_demo-data.zip   (4 MB)
 lucegene_demo-indices.zip (5 MB)
 lucegene_demo-pdfpapers.zip (10 MB)

LuceGene is also available as part of the ARGOS genome database
replication system at
  rsync://eugenes.org/argos/common/java/lucegene/ 
  rsync://flybase.net/argos/common/java/lucegene/ 
  
 

Development
-----------
The ant java build program is used for building sources, and should
be configured to rebuild all the distribution files (you will
need to edit build.properties)  The '*src.jar' distribution files
include needed library files to build all source.  The "*.war" files
are packaged with all needed library files 
Release v 1.4, January 2005


Data Indexing
-------------

For a worked example using command-line tools to
index and search, see  docs/lucegene-index-example.txt.

The primary first step to use LuceGene or Lucene is to index a set
of files.  Currently this shell script handles indexing:
  bin/lucegene-index.sh
  Usage: lucegene-index.sh -p dbs/lucegene/go.properties
  Options: (most options are in .properties)
      -data  DATA_ROOT    lucene data directory
      -index INDEX_ROOT   lucene indices directory
      -lib   LIB_NAME     lucene library
      -prop  PROP_FILE    index properties
      -test      list files to index
      -debug     debug output

Data configuration files specify data formats, fields, structures, and
are located in
   conf/{library-name}.properties
These are key=value files (Java properties), with information
on where to locate data, its format (and Java class to index),
with field-specifications on how to index each data field.

Besides configuration files, the indexer will take Java 'plugin' classes
that allow tuning of indexing specific data formats and fields.  The
src/LucegeneIndexers.java is an example of this.  The shell index.sh
script recompiles these as needed.

This shell script will run command line and interactive searches of
indexed data.
  bin/lucegene-search.sh
  Usage: lucegene-search.sh -l go -c 'lookup docid:1'
  Options: (other options are in .properties)
      -command 'search command'   
      -index INDEX_ROOT   lucene indices directory
      -lib   LIB_NAME     lucene library
      -prop  PROP_FILE    search properties
      -debug     debug output

The Perl CGI chado2apollo.cgi is one example how to search lucene
indices from programs.


Example command-line operation
------------------------------

bin/lucegene-search.sh -l gamexml -p dbs/lucegene/gamexml.properties
   -c 'format native; find arm:X AND (start:[2000000 3000000])'
 -- commands from line
 
bin/lucegene-search.sh -l fbgn -debug -p dbs/lucegene/fbgn.properties
 -- interactive operation

Find ARM:X AND (BLOC.start:[100000 200000] OR BLOC.stop:[100000 200000])

6 matches to 15589 documents
16 ms search time

docid   GSYM    SYM     ID      ARM     BLOC.start      BLOC.stop
FBan0013374     pcl     CG13374 FBgn0011822;FBan0013374 X       193624  193624
FBan0003796     ac      CG3796  FBgn0000022;FBan0003796 X       127469  127469
FBan0003827     sc      CG3827  FBgn0004170;FBan0003827 X       153498  153498
FBan0003839     l(1)sc  CG3839  FBgn0002561;FBan0003839 X       167161  167161
FBan0003757     y       CG3757  FBgn0004034;FBan0003757 X       113947  113947
FBan0069523             3S18{}4;3S18{}4 FBti0019523;FBan0069523 X       185912  185912



Public service addition using LuceGene (June 2004)
-----------------------------------------
A use for genome directory system (WebServices) with FlyBase 
  http://flybase.net/ws/services/Directory?wsdl

See also http://preview.flybase.net/lucegene/webservices/
and LuceGene distribution bin/gdsflybase.pl, gdsflybase.java
for sample clients.

Given LuceGene with indices to data, the set up for WebServices
access follows using Tomcat server and Axis, with interface
org.eugenes.services.Directory 


Public services using LuceGene (Jan 2005)
-----------------------------------------

FlyBase Search system preview
  http://preview.flybase.net/lucegene/

euGenes multi-organism gene search/retrieval
  http://eugenes.org/lucegene/
  
Daphnia/wFleaBase search for sequences, Medline abstracts, Web documents
  http://wfleabase.org/search/

FlyBase Annotated sequence bulk-retrieval service using LuceGene
  http://flybase.net/cgi-bin/gnoseqbatch

FlyBase Apollo annotation data web service using LuceGene
  http://flybase.net/apollo/
  http://flybase.net/apollo-cgi/chado2apollo.cgi
  

Apollo Service notes:
Game XML object retrieval using Lucene is 10x to 20x faster than
generating them from Postgres Chado db (Pg slows down more the larger
the object set/region).  You will get a gene query result in 10 to 15
seconds (in my tests from IU to my home computer via cable). 
A full cytoband of 20 MB of XML took 66 seconds using Lucene (most of
that in data transfer time), but took 20 minutes calling Postgres (and
it died with an error after that time).

That is about as speedy as one can expect, though some tweaking (doing
away with Postgres queries entirely) could speed it up a bit.



Why use LuceGene ?
------------------

Lucene and LuceGene support fast search and retrieval 
from document/object databanks, databases, or
as many would call them, flat-files.  These are commonly
used in bioinformatics to represent and exchange
the complex, hierarchical data that rapidly builds up from
biosciences.

Lucene is fast and capable with high-volume data sets (millions
of documents, multi-gigabytes of data).

Lucene handles full, semi-structured text searching well, and much
biology data is in these formats.

Lucene and LuceGene use common fielded document parsing, and
can index for retrieval a very large variety of document formats,
with minimal work.  Current supported formats include
  XML (including biology examples Medline abstracts and Game sequence annotation), 
  HTML, Text, PDF
  Tabular data (about any single-line row/colum table format)
  Bio-sequences (including Fasta, GenBank, EMBL and others)
  Gene object data used in FlyBase, euGenes
  
A major benefit of a document/object approach to search/retrieval
is that the complex data objects ('genes', 'proteins', etc.) known
by biologists, are often represented in RDBMS by complex, normalized, 
multiple tables which, while very good for data management, are slow
at extracting all the parts needed in a full data object.

Document/object databases are often text storage that are indexed
by means such as lucene, SRS, and other text-retrieval methods.
These doc/obj dbs are very non-normalized, but are a close match in
structure to the knowledge structures representing 'genes', 'proteins',
etc.  

For a simple tabular data set, RDBMS and Lucene/text retrieval systems
will perform similarly (biodata tests suggest lucene is a bit faster).
As the complexity of data objects increase, the RDBMS structure needed
to represent them in normal form require a more complex searches, while
the search methods of Lucene tend to cost about the same with increasing 
data complexity.

For example the Chado Postgres database used by FlyBase currently takes
minutes to generate a single gene object, from a fairly small subset of
FlyBase's total gene object data (sequence annotations only). Search and
retrieval of the same data objects using Lucene indexed XML data
pregenerated from Chado Postgres takes just a few seconds. 
 
(See also docs/BiodevelopersLucene-BIND.html for note from uses
of lucene at BIND project).
-----------------



---
title: "XORT/tool data"
---
# XORT/tool data

\| name = XORT \| full_name = \| status = mature \|
dev = maintenance \| support = active \| type = Database tools,
Middleware \| os = linux, unix \| logo = \| home =
<a href="../XORT.1" class="external free"
rel="nofollow">http://gmod.org/wiki/XORT</a> \| about = XORT is a
utility written in Perl that can be used to read to and write from a
[relational](../Glossary#Relational "Glossary")
[schema](../Glossary#Schema "Glossary") using
[XML](../Glossary#XML "Glossary") as an interchange format. In GMOD XORT
is frequently used to transfer data to and from
<a href="../Chado" class="mw-redirect" title="Chado">Chado</a>.

XORT’s three major elements are an XML-database schema mapping
specification, an XORT language for both data retrieval and data
construction, and a collection of tools that are based on the
specification to facilitate the mapping and data exchange. The mapping
specification specifies the schema requirement, mapping, operation, and
object reference mechanism; the XORT language is used to construct the
dump specification; the tool collections comprise the data validation,
data input, data output and data debug system. Because it originates
from the <a href="../Chado" class="mw-redirect" title="Chado">Chado</a>
database, we denote the corresponding XML "Chado XML."

\| screenshot = \| public_server = \| dl = \| dl_url =
<a href="http://sourceforge.net/projects/gmod/files/OldFiles/"
class="external free"
rel="nofollow">http://sourceforge.net/projects/gmod/files/OldFiles/</a>
\| dl_src = \| dl_src_url = \| dl_dev = \| dl_dev_url = \|
getting_started_preamble = \| req =

- <a href="http://search.cpan.org/perldoc?XML::DOM" class="external text"
  rel="nofollow">XML::DOM</a>
- <a href="http://search.cpan.org/perldoc?XML::Parser::PerlSAX"
  class="external text" rel="nofollow">XML::Parser::PerlSAX</a>

\| install = \| config = \| doc =

- <a
  href="http://gmod.svn.sourceforge.net/viewvc/gmod/XML-XORT/trunk/README"
  class="external text" rel="nofollow">README</a>
- <a href="http://iubio.bio.indiana.edu:8081/docs/chadopg-oct03-notes.txt"
  class="external text" rel="nofollow">Loading Chado Using XORT and
  Chado-XML</a>
- [File:XORTSpecification
  0.pdf](https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/12/XORTSpecification_0.pdf "File:XORTSpecification 0.pdf")

\| papers = \| presentations =

- [Presentation on XORT by Pinglei
  Zhou](../XORT_Presentation "XORT Presentation")
- [Comparison of XORT and Hibernate for Chado
  reporting](../Comparison_of_XORT_and_Hibernate_for_Chado_reporting "Comparison of XORT and Hibernate for Chado reporting")

\| tutorials = \| wild_urls = \| mail = There is no mailing list for
XORT; please direct queries to the
<a href="mailto:help@gmod.org" class="external text" rel="nofollow">GMOD
helpdesk</a> or to the XORT developer
<a href="mailto:zhou@morgan.harvard.edu" class="external text"
rel="nofollow">Pinglei Zhou</a>. \| logo_info = \| dev_ppl =
<a href="http://flybase.org" class="external text"
rel="nofollow">FlyBase at Harvard</a> \| dev_status = \| contact_email =
zhou@morgan.harvard.edu \| formats = \| see_also =

Note that [GMODTools](../GMODTools "GMODTools") offers an alternative
approach to bulk uploads and downloads from a Chado database.

  DBStag](#DBStag)
- [Chado-XML](#Chado-XML)
- [Tools that
  read and write Chado-XML](#Tools_that_read_and_write_Chado-XML)
  - [go2chadoxml](#go2chadoxml)
  - [BioPerl](#BioPerl)
  - [Bio-Chaos](#Bio-Chaos)
- [Macros](#Macros)

### DBStag

The [DBStag](../DBStag "DBStag") XML\<-\>SQL API implements the XORT
spec for bulkloading of data; it does not support the dump spec

### Chado-XML

[Chado XML](../Chado_XML "Chado XML") is a direct mapping of the
<a href="../Chado" class="mw-redirect" title="Chado">Chado</a>
relational schema into XML.

### Tools that read and write Chado-XML

#### go2chadoxml

Distributed as part of
<a href="http://search.cpan.org/~cmungall/go-perl/"
class="external text" rel="nofollow">go-perl</a>. Takes any obo file and
exports as Chado-XML. Can be loaded using XML::Xort or
[DBStag](../DBStag "DBStag")

Status: Stable

The
<a href="http://www.berkeleybop.org/ontologies/" class="external text"
rel="nofollow">OBO repository</a> is pre-converted to Chado-XML on a
nightly basis.

#### BioPerl

- <a
  href="http://search.cpan.org/~cjfields/BioPerl-1.6.901/Bio/SeqIO/chadoxml.pm"
  class="external text" rel="nofollow">Bio::SeqIO::chadoxml</a>

writes chadoXML

Status: ?

#### Bio-Chaos

The <a href="http://www.fruitfly.org/chaos-xml/" class="external text"
rel="nofollow">bio-chaos</a> library reads and writes chaos-xml, which
can be converted to and from chado

Status: no longer supported

### Macros

The basic chadoXMLl expansion can be extremely verbose - this is because
chadoXML uses the unique keys from the chado db, yet it does not use
database internal foreign keys. XORT can be configured with macros that
can be used to capture repeated nodes in the XML and give them XML IDs
that are valid within a particular document.

\| demo_server = \| survey_link = \|release date=2006

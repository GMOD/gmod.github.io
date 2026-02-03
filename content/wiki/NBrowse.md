---
title: "NBrowse"
---




<span id="top"></span>




# <span dir="auto">NBrowse</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Description</span>](#Description)
- [<span class="tocnumber">2</span> <span class="toctext">Internet
  Resources</span>](#Internet_Resources)
  - [<span class="tocnumber">2.1</span>
    <span class="toctext">N-Browse</span>](#N-Browse)
  - [<span class="tocnumber">2.2</span> <span class="toctext">N-Browse
    Version 2 Launch</span>](#N-Browse_Version_2_Launch)
- [<span class="tocnumber">3</span>
  <span class="toctext">Documentation</span>](#Documentation)
  - [<span class="tocnumber">3.1</span> <span class="toctext">N-Browse
    Version 1</span>](#N-Browse_Version_1)
  - [<span class="tocnumber">3.2</span> <span class="toctext">N-Browse
    Version 2</span>](#N-Browse_Version_2)
- [<span class="tocnumber">4</span>
  <span class="toctext">Downloads</span>](#Downloads)
  - [<span class="tocnumber">4.1</span> <span class="toctext">N-Browse
    Version 1 Source Code Download (tar.gz
    file)</span>](#N-Browse_Version_1_Source_Code_Download_.28tar.gz_file.29)
  - [<span class="tocnumber">4.2</span> <span class="toctext">N-Browse
    Version 2 Source Code
    Download</span>](#N-Browse_Version_2_Source_Code_Download)
    - [<span class="tocnumber">4.2.1</span> <span class="toctext">SVN
      N-Browse Version 2</span>](#SVN_N-Browse_Version_2)
- [<span class="tocnumber">5</span>
  <span class="toctext">Installation</span>](#Installation)
  - [<span class="tocnumber">5.1</span> <span class="toctext">Installing
    and configuring the N-Browse client-server package for N-Browse
    Version
    1</span>](#Installing_and_configuring_the_N-Browse_client-server_package_for_N-Browse_Version_1)
  - [<span class="tocnumber">5.2</span> <span class="toctext">Installing
    and configuring N-Browse N-Browse Version
    2</span>](#Installing_and_configuring_N-Browse_N-Browse_Version_2)
  - [<span class="tocnumber">5.3</span> <span class="toctext">Installing
    and populating the N-Browse generic
    database</span>](#Installing_and_populating_the_N-Browse_generic_database)
- [<span class="tocnumber">6</span>
  <span class="toctext">Contacts</span>](#Contacts)



## <span id="Description" class="mw-headline">Description</span>

N-Browse is a graphical network browser for the visualization and
navigation of heterogeneous molecular interaction data. The latest
version of N-Browse (Version 2) runs as either a Java applet in a web
browser, or as a Java webstart application (launched/accessed by web
browser). N-Browse providing highly dynamic and interactive on-demand
access to network data available from a remote server. The N-Browse
interface is easy to use and accommodates multiple types of functional
linkages with associated information, allowing the exploration of many
layers of functional information simultaneously. Although created for
applications in biology, N-Browse uses a generic database schema that
can be adapted to network representations in any knowledge domain. The
N-Browse client-server package is freely available for distribution,
providing a convenient way for data producers and providers to
distribute and offer interactive visualization of network-based data.

Since May 2009, N-Browse version 2 became available. As of August 2009,
N-Browse version became ready for beta testing. N-Browse Beta version 1
has been replaced by version 2.

N-Browse version 2 supports pluggable data adapters. N-Browse 2 does not
talk to chado, but a chado data adapter could be written if one wanted
to store interactions in chado. N-Browse version 2 currently supports
MySQL databases and is integrated with the modMine database web service
\[link
<a href="http://intermine.modencode.org/query/" class="external text"
rel="nofollow">modMine: search, mine and download data from the
modENCODE project (www.modencode.org)</a> \]. N-Browse 2 communicates
with MySQL databases directly via direct JDBC and can also use
<a href="http://vjdbc.sourceforge.net/" class="external text"
rel="nofollow">vjdbc</a> to connect to databases via http.

N-Browse version 2 can save/export data in a variety of formats. Please
visit <a href="http://www.gnetbrowse.org" class="external text"
rel="nofollow">N-Browse</a> for more information.

## <span id="Internet_Resources" class="mw-headline">Internet Resources</span>

### <span id="N-Browse" class="mw-headline">N-Browse</span>

The main <a href="http://www.gnetbrowse.org" class="external text"
rel="nofollow">N-Browse website</a>, is the where N-Browse can be
accessed, along with documentation. The NYU database (accessed from the
main web site and is the default database) currently provides access to
heterogenous functional data in *E. coli*, *C. elegans*, *D.
melanogaster*, and *H. sapiens* (see the website for details on
available datasets).

<a href="http://www.wormbase.org" class="external text"
rel="nofollow">WormBase</a> and
<a href="http://www.arabidopsis.org/" class="external text"
rel="nofollow">TAIR</a> currently use N-Browse as a graphical interface
to molecular interaction data that they provide. Links to the N-Browse
GUI at WormBase are available on the Gene Summary pages. TAIR's N-Browse
search page can be accessed via the Tools menu on the TAIR home page.
The
<a href="http://intermine.modencode.org/query/" class="external text"
rel="nofollow">modMine database web service</a> will be providing links
to N-Browse in their next release.

### <span id="N-Browse_Version_2_Launch" class="mw-headline">N-Browse Version 2 Launch</span>

Launch <a href="http://aquila.bio.nyu.edu/NBrowse2/nbrowse.jnlp"
class="external text" rel="nofollow">N-Browse beta version 2
WebStart</a> or try the
<a href="http://aquila.bio.nyu.edu/NBrowse2/nbrowseprodapplet.html"
class="external text" rel="nofollow">N-Browse beta version 2 Applet</a>

Or:

Launch directly from the
<a href="http://www.gnetbrowse.org" class="external text"
rel="nofollow">N-Browse Home Page</a>

## <span id="Documentation" class="mw-headline">Documentation</span>

### <span id="N-Browse_Version_1" class="mw-headline">N-Browse Version 1</span>

No longer available and supported from the
<a href="http://www.gnetbrowse.org" class="external text"
rel="nofollow">N-Browse web site</a> - source code can be found on
<a href="http://sourceforge.net/projects/nbrowse/" class="external text"
rel="nofollow">sourceforge N-Browse Version 1 repository</a>

### <span id="N-Browse_Version_2" class="mw-headline">N-Browse Version 2</span>

<a href="http://www.gnetbrowse.org/N-Browse_tutorial.html"
class="external text" rel="nofollow">N-Browse_tutorial</a>

<a href="http://www.gnetbrowse.org/info.html" class="external text"
rel="nofollow">N-Browse_system_requirement</a>

## <span id="Downloads" class="mw-headline">Downloads</span>

### <span id="N-Browse_Version_1_Source_Code_Download_.28tar.gz_file.29" class="mw-headline">N-Browse Version 1 Source Code Download (tar.gz file)</span>

Download the source from the
<a href="http://sourceforge.net/project/showfiles.php?group_id=203428"
class="external text" rel="nofollow">SourceForge download page</a>.

### <span id="N-Browse_Version_2_Source_Code_Download" class="mw-headline">N-Browse Version 2 Source Code Download</span>

Download the source from the
<a href="http://sourceforge.net/scm/?type=svn&amp;group_id=27707"
class="external text" rel="nofollow">SourceForge download page</a> under
the trunk directory.

#### <span id="SVN_N-Browse_Version_2" class="mw-headline">SVN N-Browse Version 2</span>

N-Browse Version 2 source code is available using
<a href="Subversion" class="mw-redirect"
title="Subversion">Subversion</a> and is available in the
<a href="http://gmod.svn.sourceforge.net/viewvc/gmod/nbrowse"
class="external text" rel="nofollow">GMOD SourceForge repository</a>.
You can browse the source code directly here:
<a href="http://gmod.svn.sourceforge.net/viewvc/gmod/nbrowse/trunk"
class="external text" rel="nofollow">N-Browse Code</a>

## <span id="Installation" class="mw-headline">Installation</span>

### <span id="Installing_and_configuring_the_N-Browse_client-server_package_for_N-Browse_Version_1" class="mw-headline">Installing and configuring the N-Browse client-server package for N-Browse Version 1</span>

1\. Download and install the required software
(<a href="http://tomcat.apache.org/" class="external text"
rel="nofollow">Tomcat</a>,
<a href="http://www.perl.org" class="external text"
rel="nofollow">Perl</a>,and
<a href="http://www.mysql.com/" class="external text"
rel="nofollow">MySQL</a>).

2\. Download the N-Browse installation package from the
<a href="http://sourceforge.net/project/showfiles.php?group_id=203428"
class="external text" rel="nofollow">SourceForge download page</a>.

3\. Configure the install_conf file in the nbrowse_server_client/
directory of N-Browse installation package. Note: This configuration
file MUST be modified before installing the N-Browse package. Check
README file for more details.

4\. Run the install.pl script located in the nbrowse_server_client/
directory:

\$ perl install.pl

### <span id="Installing_and_configuring_N-Browse_N-Browse_Version_2" class="mw-headline">Installing and configuring N-Browse N-Browse Version 2</span>

No installation/configuration is needed for running the N-Browse Version
2 application itself. Please view system requirements
<a href="http://aquila.bio.nyu.edu/NBrowse2/info.html"
class="external text" rel="nofollow">N-Browse Version 2 System
Requirements</a>. If you wish to host your own copy of N-Browse, or
create your own database, etc., please refer the to the
**DeveloperDoc.txt** file in the source code's **doc** directory.

### <span id="Installing_and_populating_the_N-Browse_generic_database" class="mw-headline">Installing and populating the N-Browse generic database</span>

Note the following instructions are common to both N-Browse 1 and 2. The
Perl dataloader scripts and README file are located in the
nbrowse_dataloader/ directory of the N-Browse installation package.

5\. Configure the dataloader_conf file in the nbrowse_dataloader/
directory.

6\. Run dataloader perl scripts in the nbrowse_dataloader/ directory.
Please see README for the detail information about file formats and
HOWTO.

Note for N-Browse 2 users: If you wish to create your own database, the
directory server/nbrowse-db contains database scripts, etc. to use.
Please refer to sections **Data Loaders** and **Creating your own
database** in the source code's **DeveloperDoc.txt** file in the **doc**
directory for more information.

## <span id="Contacts" class="mw-headline">Contacts</span>

Please send questions to the
<a href="mailto:admin@gnetbrowse.org" class="external text"
rel="nofollow">N-Browse_admin</a>. This is the product of Kris Gunsalus'
(kcg1@nyu.edu) lab at NYU. Huey-Ling Kao developed N-Browse Version 1.
N-Browse Version 2 was initially developed by Victor Chest and by Mark
Gibson. It is currently being developed by Monty Schulman.




[Category](Special%253ACategories "Special%253ACategories"):

- [External](Category%253AExternal "Category%253AExternal")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/NBrowse" rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 16:57 on 30 September
  2010.</span>
<!-- - <span id="footer-info-viewcount">98,297 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





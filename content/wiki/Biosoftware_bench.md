---
title: "Biosoftware bench"
---




<span id="top"></span>




# <span dir="auto">Biosoftware bench</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Overview</span>](#Overview)
- [<span class="tocnumber">2</span>
  <span class="toctext">Dependencies</span>](#Dependencies)
- [<span class="tocnumber">3</span>
  <span class="toctext">Features</span>](#Features)
  - [<span class="tocnumber">3.1</span> <span class="toctext">For the
    system administrator:</span>](#For_the_system_administrator:)
  - [<span class="tocnumber">3.2</span> <span class="toctext">For the
    end-user:</span>](#For_the_end-user:)
- [<span class="tocnumber">4</span> <span class="toctext">Demos and
  Screenshots</span>](#Demos_and_Screenshots)
- [<span class="tocnumber">5</span>
  <span class="toctext">License</span>](#License)



# <span id="Overview" class="mw-headline">Overview</span>

The Bioinformatic Software Bench (BSB) for Drupal allows for a rapid and
secure deployment of bioinformatic software. The BLAST, InterProScan,
SSAHA2 and annot8r software are provided by default and plugins for new
software can be readily written. An innovative graphical user interface
guides both end-user and administration of the software, including the
secure provision of pre-publication datasets.

It is available from
<a href="http://drupal.org/project/biosoftware_bench"
class="external free"
rel="nofollow">http://drupal.org/project/biosoftware_bench</a> or
<a href="http://gmod-dbsf.googlecode.com" class="external free"
rel="nofollow">http://gmod-dbsf.googlecode.com</a> with the latter being
a more complete repository.

# <span id="Dependencies" class="mw-headline">Dependencies</span>

BSB is written for
<a href="http://drupal.org" class="external text" rel="nofollow">Drupal
6</a> and it depends on the Drupal gmod_dbsf module
(<a href="http://drupal.org/project/gmod_dbsf" class="external free"
rel="nofollow">http://drupal.org/project/gmod_dbsf</a>). The NCBI
BLASTALL package and other relevant software for each plugin are
required in order to provide the relevant facilities but administrators
can choose which software to enable.

# <span id="Features" class="mw-headline">Features</span>

It has a number of attractive features:

## <span id="For_the_system_administrator:" class="mw-headline">For the system administrator:</span>

- Secure & fast to deploy: the demonstration required 30' to setup from
  scratch, 10' of which was the BLAST server. The administrator has to
  merely click on a checkbox to activate the software and then choose
  which databases will be available to the plugins.

<!-- -->

- Secure with private data: We know that laboratories often have two
  types of data: those they wish to make public and the unpublished ones
  they wish to utilize only in-house. The solution is often the creation
  of two separate servers, one password protected. The DBFS takes care
  of user management and allows you to choose which datasets are
  available to which users. An unlimited number of user groups can be
  created included the anonymous/guest visitor who has not logged in.

<!-- -->

- Plugin format: It comes with NCBI's BLASTALL but DBFS is an API
  framework and easy to extend, our publication will have a manual as
  supplementary material to guide bioinformaticians in writing their
  plugins with 1-2 days.

<!-- -->

- High Performance Computing (HPC) support: Optionally, it can utilise
  the Condor job management system so jobs run on a PC-farm instead of
  the often meek BLAST server. A perl daemon manages the submissions
  automatically.

<!-- -->

- Database API is Chado-compatible: It is GMOD compatible and uses the
  robust, normalized Chado database. As Chado is sequence feature-driven
  we created sequence-less table set which follows Chado-convention. The
  future aim is to be able to integrate multiple website deploying this
  software.

## <span id="For_the_end-user:" class="mw-headline">For the end-user:</span>

- Build for wet-lab researchers. They can upload a multi-FASTA file to
  be used as the query or even the reference database: there is no need
  to restrict the user to the administrator's datasets. The file size
  limit is customizable. Users can bookmark their search and re-retrieve
  it within 7 days. Further, they can simultaneously run multiple BLAST
  algorithm searches.

<!-- -->

- Driven by open-source software and adheres to community standards: The
  output is driven by BioPerl? (XML, HTML, TXT and a graph using
  Bio::Graphics). The database infrastructure is GMOD-compatible and the
  visualization is securely managed by Drupal.

# <span id="Demos_and_Screenshots" class="mw-headline">Demos and Screenshots</span>

- A <a href="http://www.scivee.tv/node/20325" class="external text"
  rel="nofollow">screencast on how to install it</a>

  

# <span id="License" class="mw-headline">License</span>

This software is GPLv2+ licensed as part of the Drupal package. It is
currently supported by [Alexie
Papanicolaou](User%253AAlpapan "User%253AAlpapan") while at CSIRO, the
Australian Commonwealth Scientific and Research Organization
(<a href="http://www.csiro.au" class="external free"
rel="nofollow">http://www.csiro.au</a>).




[Categories](Special%253ACategories "Special%253ACategories"):

- [Drupal](Category%253ADrupal "Category%253ADrupal")
- [Analysis](Category%253AAnalysis "Category%253AAnalysis")
- [Web services](Category%253AWeb_services "Category%253AWeb services")
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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Biosoftware_bench" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 01:55 on 16 February
  2011.</span>
<!-- - <span id="footer-info-viewcount">27,890 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





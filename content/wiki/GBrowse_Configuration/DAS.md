---
title: "GBrowse Configuration/DAS"
---




<span id="top"></span>




# <span dir="auto">GBrowse Configuration/DAS</span>









This article describes the **Distributed Annotation System** (DAS) and
how to configure GBrowse to work with it.

*For the main GBrowse configuration article, see:
<a href="../GBrowse_Configuration" class="mw-redirect"
title="GBrowse Configuration">GBrowse Configuration</a>.*

  

# <span id="Using_DAS_.28Distributed_Annotation_System.29_Databases" class="mw-headline">Using DAS (Distributed Annotation System) Databases</span>

You may insert features from a DAS source into any named track. Create a
stanza as usual but instead of specifying the feature type using the
"feature" option, give the desired DAS URL using the "remote feature"
option:

    remote feature = http://dev.hapmap.org/cgi-perl/das/t2d_testing?type=ldblock

Because DAS sources specify the glyph and visualization options, most of
the settings such as bgcolor will be ignored. However, the track key and
citation options are honored.

You can use the same syntax to load a GFF file or a feature file in
Gbrowse upload format into a track. Just provide a URL that returns the
desired data.

You can also run GBrowse entirely off a single DAS source. To get this
support, you must use Bio::Das version 0.90 or higher, available from
<a href="http://www.biodas.org" class="external free"
rel="nofollow">http://www.biodas.org</a>.

A sample \[GENERAL\] configuration section looks like this:

    [GENERAL]
    description   = Das Example Database (dicty)
    db_adaptor    = Bio::Das
    db_args       = -source http://www.biodas.org/cgi-bin/das
                    -dsn    dicty

The db_adaptor option must be set to "Bio::Das". The db_args option must
contain a -source pointing to the base of the remote DAS server, and a
-dsn pointing to the name of the annotation database.

The remainder of the configuration file should be configured as
described earlier. The following short script will return a list of the
feature types known to the remote DAS server. You can use the output of
this script as the basis for the tracks to configure.


``` de1
 #!/usr/bin/perl
 
 use strict;
 
 use Bio::Das;
 my $db = Bio::Das->new('http://localhost/cgi-bin/das'=>'dicty');
 print join "\n",$db->types;
```


Limitations:

The DAS implementation does not descend into subcomponents. For example,
if the user requests features on a chromosome, but the remote DAS server
has annotated genes using contig coordinates, then the genes will not
appear on the chromosome.

The gbrowse_details script does not provide useful information because
the DAS/1 protocol does not provide a way to retrieve attribute
information on a named feature.




[Categories](../Special%253ACategories "Special%253ACategories"):

- [GBrowse](../Category%253AGBrowse "Category%253AGBrowse")
- [HOWTO](../Category%253AHOWTO "Category%253AHOWTO")
- [Configuration](../Category%253AConfiguration "Category%253AConfiguration")






## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="../Talk%253AGBrowse_Configuration/DAS" accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>



<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>


### Navigation



- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>




### Documentation



- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/GBrowse_Configuration-2FDAS"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:05 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">28,042 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





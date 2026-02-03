---
title: "GMOD RPC API/PHP"
---




<span id="top"></span>




# <span dir="auto">GMOD RPC API/PHP</span>









Plans/Architecture for the PHP tools for implementing gmod-rpc


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Components</span>](#Components)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">index.php</span>](#index.php)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">class.myDomDocument.php</span>](#class.myDomDocument.php)
  - [<span class="tocnumber">1.3</span> <span class="toctext">version
    directories</span>](#version_directories)
    - [<span class="tocnumber">1.3.1</span>
      <span class="toctext">gmod-rpc/v1/rpc.php</span>](#gmod-rpc.2Fv1.2Frpc.php)
    - [<span class="tocnumber">1.3.2</span>
      <span class="toctext">gmod-rpc/v1/sources/</span>](#gmod-rpc.2Fv1.2Fsources.2F)
    - [<span class="tocnumber">1.3.3</span>
      <span class="toctext">gmod-rpc/v1/services/</span>](#gmod-rpc.2Fv1.2Fservices.2F)
    - [<span class="tocnumber">1.3.4</span>
      <span class="toctext">gmod-rpc/v1/class.View.php</span>](#gmod-rpc.2Fv1.2Fclass.View.php)



## <span id="Components" class="mw-headline">Components</span>

### <span id="index.php" class="mw-headline">index.php</span>

    gmod-rpc/index.php

Use mod_rewrite so that gmod-rpc URLs all go to this script

    <IfModule mod_rewrite.c>   
    RewriteEngine on  
    RewriteRule ^/gmod-rpc/.*$ /gmod-rpc/index.php  
    </IfModule>

index.php looks for a version directory based on the URL.

### <span id="class.myDomDocument.php" class="mw-headline">class.myDomDocument.php</span>

Very small class from Joe Grissom at Oklahoma for making XML. There is
probably something more sophisticated that could be used in the future,
but this works.

### <span id="version_directories" class="mw-headline">version directories</span>

put everything else in a directory based on the version, e.g. v1

#### <span id="gmod-rpc.2Fv1.2Frpc.php" class="mw-headline">gmod-rpc/v1/rpc.php</span>

All this does is parse the URL to instantiate a controller object for the
desired service and a view object. The class files live in

#### <span id="gmod-rpc.2Fv1.2Fsources.2F" class="mw-headline">gmod-rpc/v1/sources/</span>

This will be where data source adaptors live class.SourceName.php/

#### <span id="gmod-rpc.2Fv1.2Fservices.2F" class="mw-headline">gmod-rpc/v1/services/</span>

This directory holds a file defining a base class

    class.Service.php

implement additional services by adding object classes that extend this
base class e.g. class.Organisms.php:


``` de1
class Organisms extends Service{
...
```


Service class names should be ucfirst.

#### <span id="gmod-rpc.2Fv1.2Fclass.View.php" class="mw-headline">gmod-rpc/v1/class.View.php</span>

A views object to generate xml or json








## Navigation menu







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

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/GMOD_RPC_API-2FPHP" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:12 on 9 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">21,907 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





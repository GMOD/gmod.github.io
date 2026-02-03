---
title: "Gbrowse Benchmarking"
---




<span id="top"></span>




# <span dir="auto">Gbrowse Benchmarking</span>









# <span id="Using_Javascript_to_Benchmark_Gbrowse_Image_Generation_and_Loading" class="mw-headline">Using Javascript to Benchmark Gbrowse Image Generation and Loading</span>

The following recipe shows how to use existing options, such as
**head**, **html2**, etc., to add javascript functionality to
[GBrowse](GBrowse.1 "GBrowse") via the configuration file. This example
is used for benchmarking page loading and image generation.  
  


<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/7a/BenchMark.png" width="946" height="503"
alt="BenchMark.png" />


  



- **Note:** When coding Javascript in GBrowse config files, there are a
  few caveats:
  - The option text gets parsed into a string with no line-breaks, so be
    sure to terminate all javascript statements with a ';'.
  - Do not add javascript style '//' or '/\*\*/' comments to the
    javascript code. They will break the script due to the way the
    configuration file is parsed.
  - You can add comments to your javascript, or anywhere else in the
    configuration file, by starting a new line with '#', which will be
    ignored by the parser and not added to the final javascript.



### <span id="First_Step:_Adding_a_simple_script_to_the_page_header" class="mw-headline">First Step: Adding a simple script to the page header</span>

- The first bit of javascript goes into the page header using the
  "**head**" option in the \[GENERAL\] section:
- Any text added with the **head** option gets added to the
  \<head\>\</head\> element, before the body of the page is printed.
- In this case, we are initializing a javascript global variable
  'start', which stores the time at which the \<head\>\</head\> element
  was printed, to a precision of .001 seconds.

<!-- -->

    head=  <script type="text/javascript">
             var d = new Date();
             var start = d.getTime()/1000;
            </script>

### <span id="Next_Step:_Inserting_Time_Stamps_into_the_Gbrowse_Output" class="mw-headline">Next Step: Inserting Time Stamps into the Gbrowse Output</span>

- The next steps use the **html*x*** options, where ***x*** = 1-6. These
  options will add HTML to strategic locations in the GBrowse output.
- **html3** and **html4** both add HTML immediately after the 'Overview,
  'Region' (if applicable) and 'Details' panels are printed and can be
  use interchangeably.
- The three panels contains all of the genome browser images.
- Once printed to the browser, the javascript code will execute and
  replace the "placeholder" text with a calculated time interval since
  the \<head\>\</head\> element was printed.
- This gives an approximation of how long it has taken to render or
  un-cache the images.
- It is useful for testing load times of different track combinations,
  new features, etc.

<!-- -->

    html3 = <h1 id=html3>placeholder</h1>
            <script>
              var d  = new Date();
              var e  = d.getTime()/1000 - start;
              var re = Math.round(e*100)/100;
              document.getElementById('html3').innerHTML='Load time '+re+' seconds';
            </script>




[Categories](Special%253ACategories "Special%253ACategories"):

- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")
- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")
- [Javascript](Category%253AJavascript "Category%253AJavascript")
- [Documentation](Category%253ADocumentation "Category%253ADocumentation")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Gbrowse_Benchmarking" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 02:17 on 4 April
  2008.</span>
<!-- - <span id="footer-info-viewcount">31,585 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





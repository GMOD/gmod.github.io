<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">RubberBandSelection</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

"Rubber-band", or drag-selection is a user-interface feature of GBrowse
1.69 and later. It a javascript/DHTML-based feature that works in all
major web browsers and is turned on by default. The purpose of this page
is to describe how to control features of the rubber-band selection via
the GBrowse configuration-file.

The video below is a demonstration of using the mouse to navigate in
GBrowse 2.0

\<oflash file=<File:Rubberband1.swf> width=500 height=275 /\>

## <span id="User_interface" class="mw-headline">User interface</span>

- To activate rubber-band selection, click and drag (without releasing
  the mouse button) on the ruler for the overview, regionview, or
  details panel.
- A highlighted region, as depicted above, will appear.
- If configured, the menu appears when the mouse button is release.

## <span id="Configurable_options" class="mw-headline">Configurable options</span>

<table data-border="1" data-bgcolor="lightyellow">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header" data-bgcolor="lightsteelblue">
<th>Options</th>
<th>Values</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>autoSubmit</td>
<td>1 or 0</td>
<td><ul>
<li>This option is a BOOLEAN true or false.</li>
<li>The purpose of this option is to indicate what is to happen when the
selection is complete, triggered by an onmouseup event in the selectable
area.</li>
<li>If autoSubmit = 1, the page will be reloaded non-interactively, with
focus set to the selected region.</li>
<li>If autoSubmit = 0, a menu will be used to direct which operation
will be performed on the selected sequence regions. A generic menu is
supplied by default. The menu can be customized (see below).</li>
</ul></td>
</tr>
<tr class="even">
<td>marginTop</td>
<td>5px</td>
<td><p>How far the select area text (indicating the size of the selected
region) will be placed from the top of the select box. This value must
be a positive integer, 'px' is mandatory.</p></td>
</tr>
<tr class="odd">
<td>background</td>
<td>web-color or hex</td>
<td><p>The background color of the select box. Any valid web color name
or hex code is accepted.</p></td>
</tr>
<tr class="even">
<td>opacity</td>
<td>0-1</td>
<td><p>The degree of transparency of the select box in all modern web
browsers except Konqueror. The opacity value should be a float between 0
and 1, where 1 is opaque.</p></td>
</tr>
<tr class="odd">
<td>fontColor</td>
<td>web-color or hex</td>
<td><p>The color of the text select area text. Any valid web color name
or hex code is accepted.</p></td>
</tr>
<tr class="even">
<td>border</td>
<td>'1px solid black'</td>
<td><p>The select area border style, using CSS syntax.</p></td>
</tr>
<tr class="odd">
<td>width</td>
<td>160px</td>
<td><p>The width of the menu, if applicable</p></td>
</tr>
</tbody>
</table>

    # Advanced feature: an example of a customized popup menu for rubber band selection
    [OVERVIEW SELECT MENU]
    width = 100
    html  =  <table style="width:100%">
             <tr>
               <th style="background:lightgrey">
                 Overview
                 </span>
               </th>
             </tr>
             <tr>
               <td>
                 <span style="color:blue;cursor:pointer" onclick="SelectArea.prototype.clearAndSubmit()">
                  Zoom
                 </span>
               </td>
             </tr>
             <tr>
               <td>
                 <span style="color:blue;cursor:pointer" onclick="SelectArea.prototype.cancelRubber()">
                   Cancel
                 </span>
               </td>
             </tr>
            </table>


    [DETAIL SELECT MENU]
    width = 250
    html  = <table style="width:100%">
             <tr>
               <th style="background:lightgrey;cell-padding:5">
                 SELECTION
                 <span style="right:0px;position:absolute;color:blue;cursor:pointer"
                       onclick="SelectArea.prototype.cancelRubber()">
                   [X]
                 </span>
               </th>
             </tr>
             <tr>
               <td>
                 <span style="color:blue;cursor:pointer" onclick="SelectArea.prototype.clearAndSubmit()">
                  Zoom in
                 </span>
               </td>
             </tr>
             <tr>
               <td>
                 <span style="color:blue;cursor:pointer" onclick="SelectArea.prototype.clearAndRecenter()">
                   Recenter on this region
                 </span>
               </td>
             </tr>
             <tr>
               <td onmouseup="SelectArea.prototype.cancelRubber()">
                 <a href="?plugin=FastaDumper;plugin_action=Go;name=SELECTION" target="_BLANK">
                  Dump selection as FASTA
                 </a>
               </td>
             </tr>
             <tr>
               <td onmouseup="SelectArea.prototype.cancelRubber()">
                 <a href="?name=SELECTION;plugin=Submitter;plugin_do=Go;Submitter.target=UCSC_BLAT" target="_BLANK">
                   Submit selection to UCSC BLAT
                 </a>
               </td>
             </tr>
             <tr>
               <td onmouseup="SelectArea.prototype.cancelRubber()">
                 <a href="?name=SELECTION;plugin=Submitter;plugin_do=Go;Submitter.target=NCBI_BLAST" target="_BLANK">
                   Submit selection to NCBI BLAST
                 </a>
               </td>
             </tr>
           </table>

  
Configuration for submitter plugin (used in above menu).

- the key/value pairs can be anything (that corresponds to the remote
  web services' parameters)
- the ***url*** option is required to handle the submission
- the ***extra_html*** option can be used to specify form elements, etc

<!-- -->

    [Submitter:plugin]
    submitter = [UCSC_BLAT]
                url        = http://genome.ucsc.edu/cgi-bin/hgBlat
                seq_label  = userSeq
                output     = hyperlink
                type       = DNA
                extra_html = Genome:
                             <SELECT name=org>
                             <OPTION VALUE="Human">Human</OPTION>
                             <OPTION VALUE="Chimp">Chimp</OPTION>
                             <OPTION VALUE="Rhesus">Rhesus</OPTION>
                             <OPTION VALUE="Mouse">Mouse</OPTION>
                             <OPTION VALUE="Stickleback">Stickleback</OPTION>
                             <OPTION VALUE="Medaka">Medaka</OPTION>
                             <OPTION VALUE="C. intestinalis">C. intestinalis</OPTION>
                             <OPTION VALUE="S. purpuratus">S. purpuratus</OPTION>
                             <OPTION VALUE="D. persimilis">D. persimilis</OPTION>
                             <OPTION VALUE="D. virilis">D. virilis</OPTION>
                             <OPTION VALUE="D. mojavensis">D. mojavensis</OPTION>
                             <OPTION VALUE="D. grimshawi">D. grimshawi</OPTION>
                             <OPTION VALUE="A. gambiae">A. gambiae</OPTION>
                             <OPTION VALUE="A. mellifera">A. mellifera</OPTION>
                             <OPTION SELECTED VALUE="S. cerevisiae">S. cerevisiae</OPTION>
                             <OPTION VALUE="SARS">SARS</OPTION>
                             </SELECT>

                [NCBI_BLAST]
                confirm   = 1
                url       = http://www.ncbi.nlm.nih.gov/blast/Blast.cgi
                seq_label = QUERY
                PAGE      = Nucleotides
                PROGRAM   = blastn
                DATABASE  = nr
                CLIENT    = web
                CMD       = put

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=RubberBandSelection&oldid=22122>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](Special%3ACategories "Special%3ACategories"):

- [AJAX](Category%3AAJAX "Category%3AAJAX")
- [GBrowse](Category%3AGBrowse "Category%3AGBrowse")
- [GMOD Developers](Category%3AGMOD_Developers "Category%3AGMOD Developers")
- [Javascript](Category%3AJavascript "Category%3AJavascript")
- [Documentation](Category%3ADocumentation "Category%3ADocumentation")

</div>

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">



<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces


- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:RubberBandSelection&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>





</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%3AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%3AHOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">


- <span id="t-smwbrowselink"><a href="Special%3ABrowse/RubberBandSelection" rel="smw-browse">Browse
  properties</a></span>


</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 23:05 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">101,144 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->






</div>

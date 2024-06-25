<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">JBrowseDev/The UrlTemplate Option</span>

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

In [JBrowse](../JBrowse.1 "JBrowse"), the urlTemplate option is used to
link features to an external website.

# <span id="Examples" class="mw-headline">Examples</span>

If you would like to follow along with the next few examples, switch to
your jbrowse directory, then input the volvox sequence:

    bin/prepare-refseqs.pl --fasta docs/tutorial/data_files/volvox.fa

**1. Link each feature to the same url**

As a simple example, this call to flatfile-to-json.pl will link every
feature in the track to google.com:

    bin/flatfile-to-json.pl --urlTemplate http://www.google.com --type remark --gff docs/tutorial/data_files/volvox.gff3 --tracklabel same_URL

Admittedly, when used in this way, urlTemplate is not very useful.

**2. Link each feature to its own url**

In order to make urlTemplate link different features to different urls,
try this example:

    bin/flatfile-to-json.pl --urlTemplate http://www.google.com/search?q={name} --getLabels --type remark --gff docs/tutorial/data_files/volvox.gff3 --tracklabel unique_URLs

Now, for any given feature, clicking on the link causes google to be
queried for that feature's name. With the correct website, this function
could be used to link each feature to an annotation page that
specifically describes it.

# <span id="Explanation" class="mw-headline">Explanation</span>

In order to understand how this works, it is necessary to understand a
few aspects of the output JSON. Before reading any further, open the
first output JSON file:

    less data/tracks/ctgA/same_URL/trackData.json

By default, the JSON file is as compact as possible, containing the
minimum amount of data necessary for the javascript to render the track.
Locate the "headers" key toward the beginning of the text. This key
should be associated with the JSON array:
\["start","end","strand","id"\]. These are the types of feature data
that the flatfile-to-json.pl script preserves by default. Further down,
following the "featureNCList" key, you will find the actual feature data
that corresponds to these column headers.

Next, open 'data/tracks/ctgA/unique_URLs/trackData.json'.

    less data/tracks/ctgA/unique_URLs/trackData.json

Once again, locate the "headers" array. In addition to the columns that
were previously present, there is now an additional one called "name".
This is present because of the --getLabels switch that was used in the
second call to flatfile-to-json.pl.

By putting any of the headers from the output JSON files in curly
braces, the values in the header's column are substituted for each
individual feature. In the case of the above example, the names of each
feature are substituted. It is also possible to substitute values from
any of the other columns, e.g.:

    ... --urlTemplate http://www.google.com/search?q={start} ...

# <span id="See_also" class="mw-headline">See also</span>

- <a href="General_Usage" class="mw-redirect"
  title="JBrowseDev/General Usage">General Usage Notes</a>

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=JBrowseDev/The_UrlTemplate_Option&oldid=18362>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Category](../Special:Categories "Special:Categories"):

- [JBrowse](../Category:JBrowse "Category:JBrowse")

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

- <span id="ca-nstab-main"><a href="The_UrlTemplate_Option" accesskey="c"
  title="View the content page [c]">Page</a></span>
- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:JBrowseDev/The_UrlTemplate_Option&amp;action=edit&amp;redlink=1"
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

<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category:FAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category:HOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">


- <span id="t-smwbrowselink"><a href="../Special:Browse/JBrowseDev-2FThe_UrlTemplate_Option"
  rel="smw-browse">Browse properties</a></span>


</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 17:46 on 29 July
  2011.</span>
<!-- - <span id="footer-info-viewcount">14,435 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](../GMOD:About "GMOD:About")</span>

<!-- -->






</div>

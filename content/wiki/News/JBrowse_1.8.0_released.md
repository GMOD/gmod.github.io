---
title: "News/JBrowse 1.8.0 released"
---




<span id="top"></span>




# <span dir="auto">News/JBrowse 1.8.0 released</span>









I am pleased to announce the release of JBrowse 1.8.0, a major new
JBrowse release with some great new features, and lots of smaller
improvements.

It can be downloaded from
<a href="http://jbrowse.org/jbrowse-1-8-0/" class="external free"
rel="nofollow">http://jbrowse.org/jbrowse-1-8-0/</a>.

The number 1 new feature is: JBrowse **can now open local BAM, BigWig,
and GFF3 files** that reside on the user’s computer, without the need to
transfer any data over the network. For example, if a user is viewing a
genome in JBrowse 1.8 at her favorite database website, and she has a
20GB BAM file on her computer for that same genome, she can just open
her local BAM file and view it alongside the data from the website,
without needing to upload the BAM file anywhere. Give this new feature a
try, and let us know how it goes! The File-\>Open dialog works for
remote URLs too, or even mixtures of local files and URLs.

There are also two new track types designed for even better display of
BAM data:

First, there is the **new Alignments2 track type, which is a faster,
\<canvas\>-based track for viewing alignments**, including base-level
indels and mismatches. It is much more performant when viewing very
dense or deep sets of alignments, and is meant to largely replace the
HTML-based Alignments track type that was introduced in JBrowse 1.7.0.

Second, there is a **new SNPCoverage track, that draws the coverage of
alignment features along the genome**, along with a graphical
representation of SNP distribution, and tables showing frequencies for
each SNP. Many thanks to Julien Smith-Roberge, a co-op student at the
Ontario Institute for Cancer Research for the initial implementation of
this!



### <span id="SNPCoverage_track" class="mw-headline">SNPCoverage track</span>

![snpcoverage.png](http://jbrowse.org/wordpress/wp-content/uploads/2013/01/snpcoverage.png)



The last headline feature, which will be of interest primarily for
developers, is the introduction of a **new plugin system for JBrowse**.
It’s still a work in progress, the details of the plugin API will
probably not be finalized for a while, but the broad strokes of it are
set out on the JBrowse Plugin API page on the GMOD wiki. If you are
interested in living on the bleeding edge and developing a JBrowse
plugin, contact the gmod-ajax mailing list, or contact me directly.

Happy browsing.  ;-)

Robert Buels  
Lead Developer  
JBrowse - <a href="http://jbrowse.org" class="external free"
rel="nofollow">http://jbrowse.org</a>

  



*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2013/01/31*






[Category](../Special%253ACategories "Special%253ACategories"):

- [News Items](../Category%253ANews_Items "Category%253ANews Items")






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

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/News-2FJBrowse_1.8.0_released"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 14:44 on 1 February
  2013.</span>
<!-- - <span id="footer-info-viewcount">6,697 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





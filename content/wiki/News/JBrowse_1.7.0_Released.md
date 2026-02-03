---
title: "News/JBrowse 1.7.0 Released"
---




<span id="top"></span>




# <span dir="auto">News/JBrowse 1.7.0 Released</span>









*from Rob Buels, JBrowse developer*

I am pleased to announce the release of JBrowse 1.7.0, which includes a
great many enhancements both large and small. Very exciting!

It can be downloaded from
<a href="http://jbrowse.org/jbrowse-1-7-0/" class="external text"
rel="nofollow">the JBrowse website</a>. As always, see the updated
[JBrowse Configuration
Guide](../JBrowse_Configuration_Guide "JBrowse Configuration Guide") for
documentation on how to use the new features.

Firstly, JBrowse can now quickly and efficiently display alignment data
directly from BAM files over the web, with no need for any intermediate
formatting steps. Just put your .bam and .bai files on your web server,
add a few lines of configuration to point JBrowse at them, and go!
Moreover, JBrowse has two new track types optimized for displaying
alignment data: new “Alignments” track type, showing basepair
differences and insertions between aligned reads and the reference
(using a BAM alignment’s MD field), and a new FeatureCoverage track type
that generates a depth-of-coverage plot from a BAM file (or from any
other source of feature data). Many thanks to Thomas Down and his
Dalliance Genome Browser project, from which the JBrowse BAM data
backend was derived.

The second headline feature of this release is long-awaited support for
exporting and saving sequence and annotation data in FASTA, GFF3, bed,
bedGraph, and Wiggle formats. Just turn on the track of interest and
click on its track label to bring up a new menu of things you can do
with that track, one of which is “Save track data”. This has been one of
the top features users have been requesting for a long time, and now
it’s finally here!

Third, we have two important enhancements to JBrowse’s already-excellent
support for BigWig quantitative data: a new Wiggle/Density track type,
analogous to GBrowse’s popular wiggle_density track type, that shows
quantitative data using varying intensity of color. Additionally, the
existing Wiggle/XYPlot supports a new bg_color option that, if set,
provides a background color for all data points in the track, making it
easy to distinguish between regions with no data, and regions with
0-valued data. Many thanks to Steffi Geisen at the University of Granada
for her continued help driving progress on this and many other issues.

For full details, check out the
<a href="http://jbrowse.org/jbrowse-1-7-0/" class="external text"
rel="nofollow">1.7.0 release information</a> on the
<a href="http://jbrowse.org/" class="external text"
rel="nofollow">JBrowse website</a>.

  



*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2012/11/05*






[Categories](../Special%253ACategories "Special%253ACategories"):

- [News Items](../Category%253ANews_Items "Category%253ANews Items")
- [JBrowse](../Category%253AJBrowse "Category%253AJBrowse")






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

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/News-2FJBrowse_1.7.0_Released"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 01:39 on 6 November
  2012.</span>
<!-- - <span id="footer-info-viewcount">6,530 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





---
title: "ABRF2010 Workshop"
---
<span id="top"></span>

# <span dir="auto">ABRF2010 Workshop</span>

<table style="vertical-align: middle; border: 2px solid #A6A6BC"
data-cellpadding="10">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td>

<a href="http://www.abrf2010.org/" rel="nofollow" title="ABRF 2010">

You have your own JBrowse instance on the server:

<a href="http://abrf2010.jbrowse.org/~profilename/"
class="external free"
rel="nofollow">http://abrf2010.jbrowse.org/~profilename/</a>

SSH into the ABRF jbrowse machine:
<span style="font-size: large; font-family: monospace">abrf2010.jbrowse.org</span>

User%253A your profile name from the morning session

Password: abrf_HTS

    ssh profilename@abrf2010.jbrowse.org

Copy your GFF file from this morning to this machine:

    wget --http-user=abrf_workshop --http-password=abrf_HTS http://abrf.cgrb.oregonstate.edu/UserData/mitch/finaloutput-cashx_18887.dir/finaloutput-cashx.gff

OR

    cp ~mitch/finaloutput-cashx.gff ~/

Go into your JBrowse installation:

    cd public_html

Add the GFF file to your JBrowse instance:

    bin/flatfile-to-json.pl --gff2 ~mitch/finaloutput-cashx.gff --tracklabel "ABRF_Test" --key "ABRF Test" --cssclass feature3

## <span id="Conference_Talk" class="mw-headline">Conference Talk</span>

**Seeing the Forest and the Trees: Visualizing Next Generation Sequence
Data**, by [Mitch Skinner](User%253AMitchSkinner "User%253AMitchSkinner")

Part of the Session _Tools to Facilitate Management, Analysis and
Visualization of 2nd Generation Sequencing Data_

3:45pm - 5:00pm, Monday, March 22

[Categories](Special%253ACategories "Special%253ACategories"):

- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")
- [GBrowse 2](Category%253AGBrowse_2 "Category%253AGBrowse 2")
- [Tutorials](Category%253ATutorials "Category%253ATutorials")
- [Education and
  Outreach](Category%253AEducation_and_Outreach "Category%253AEducation and Outreach")
- [JBrowse](Category%253AJBrowse "Category%253AJBrowse")

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/ABRF2010_Workshop" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 18:52 on 8 October 2012.</span>
<!-- - <span id="footer-info-viewcount">223,725 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->

---
title: "MediaWiki%253ACommon.css"
---




<span id="top"></span>




# <span dir="auto">MediaWiki%253ACommon.css</span>











**Note:** After saving, you may have to bypass your browser's cache to
see the changes.

- **Firefox / Safari:** Hold *Shift* while clicking *Reload*, or press
  either *Ctrl-F5* or *Ctrl-R* (*⌘-R* on a Mac)
- **Google Chrome:** Press *Ctrl-Shift-R* (*⌘-Shift-R* on a Mac)
- **Internet Explorer:** Hold *Ctrl* while clicking *Refresh*, or press
  *Ctrl-F5*
- **Opera:** Clear the cache in *Tools → Preferences*


``` css
/** CSS placed here will be applied to all skins */
 
/* making scraping a little easier */
#ca-nstab-user { display: none !important; }
#ca-talk { display: none !important; }
/*
#ca-edit { display: none !important; }
#ca-ve-edit { display: none !important; }
*/
#ca-formedit { display: none !important; }
#ca-history { display: none !important;}
#ca-viewsource { display: none !important; }
 
/* Don't display Main Page on main page.  Code from the MediaWiki Manual FAQ. */
body.page-Main_Page .firstHeading { 
  display:none; 
}
 
/* some hacks to get the floating logos to look nice */
.logos .thumb, .componentBox .thumb { display: inline-block; width: 260px; text-align: center; }
.logos .thumb { margin: 0 10px }
.logos .thumbinner, .componentBox .thumbinner { background: inherit; border: 1px solid transparent; }
.logos .thumbimage, .componentBox .thumbimage { border: 1px solid transparent; }
.logos .thumbinner .magnify, .componentBox .thumbinner .magnify { display: none; }
.logos .thumbinner .thumbcaption, .componentBox .thumbinner .thumbcaption { text-align: center; }
 
html, body { font-family: 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif; }
tt, pre, .enter {
    font-family: "Lucida Console", Monaco,"Courier New", Courier, monospace;
}
 
.floatL { float: left; }
.clearL { clear: left; }
.floatR { float: right; }
.clearR { clear: right; }
.clear { clear: both }
 
.C { text-align: center; }
.R, .R td { text-align: right; }
.noborder { border: 0 none;}
.zero { margin: 0; padding: 0; border: 0 none; }
 
blockquote {
margin-left: 2em;
border-left: #aaa solid .25em;
padding-left: 2em;
}
 
/* Used in Site Guidelines page to highlight guidelines */
.guideline {
  background: #eeffee;  /* light green */
  font-weight: 500;
  border: 1px solid #9999ff;
  padding: 0.5em;
}
 
 
/* Adding wikitable and prettytable from wikipedia. */
/* wikitable/prettytable class for skinning normal tables
.wikitable {
    margin: 1em 1em 1em 0;
    background: #f9f9f9;
    border: 1px #aaa solid;
    border-collapse: collapse;
}
 
.wikitable th, .wikitable td {
    border: 1px #aaa solid;
    padding: 0.2em 0.4em;
}
 
.wikitable th {
    background: #f2f2f2;
    text-align: center;
}
 
.wikitable caption {
    margin-left: inherit;
    margin-right: inherit;
    font-weight: bold;
} */
 
.prettytable code {
    background-color: transparent;
}
 
/* ======================================================= */
/* Special settings for Chado table descriptions, themselves
 * shown in mediawiki tables. */
 
.chadotable {
    background: #ffddbb;
}
 
.chadotable th {
    background: #ffccaa;
}
 
 
/* ======================================================= */
/* Highlight parts of shell script interactions */
 
/* Highlight text that needs to be typed by the user. */
div.enter {
padding: 1em;
border: 1px dashed #2F6FAB;
background-color: #F9F9F9;
}
 
.enter {
    font-weight: bold;
    color: #004444;
}
 
/* Highlight commands that users should not do. */
.dont {
    background-color: #ffff77;
}
 
/* ========================================================= */
/* Tutorial Headers */
 
.tutorialheader {
    font-size: 160%;
    margin: 0px auto; /* center it */
    background: #f9f9f9;
    border: 1px #aaa solid;
    border-collapse: collapse;
    vertical-align: middle;
}
.tutorialheader td {
    padding: 1em;
}
 
 
/* ========================================================= */
/* Styles for the WikiCategoryTagCloud extension. */
 
.tagcloud {
/*        width: 98%; */
        text-align: center;
        background-color: #FDFDFD;
        border: 1px solid #EEEEEE;
        padding: 15px 10px 15px 10px;
 }
.tagcloud a {
        color: #0052CB;
        margin-left: 10px;
        margin-right: 10px;
 }
/* ========================================================== */
/* Indent a whole section, without any other emphasis. */
 
.indent {
    margin: 0 2em;
}
 
/* ========================================================== */
/* Emphasize a whole section
 * Details of this may change over time as other types of boxes are added.
 * For example, font size may be increased, or the border color changed.
 */
 
.emphasisbox {
    margin: 2em 10%;
    padding: 1em;
    border: 2px #004040 solid;
    background-color: #ffffdd;
}
 
/* ========================================================== */
/* Quote box
 * Less emphasis than, well, an emphasis box!
 */
 
.quotebox {
    margin: 1em;
    padding: .5em 1em;
    border-left: 3px #cccccc solid;
}
 
/* ========================================================== */
/* Image cloud at bottom of home page (and maybe elsewhere?) 
 */
 
.imagecloud img {
    padding-bottom: 0.5em;
    padding-right: 0.5em;
}
 
/* ========================================================== */
/* Get rid of the default MediaWiki book. We are not an encyclopedia.  To restore it, comment out the body statement below.
*/
body { background: #f3f3f3; }
 
/* ========================================================== */
/* Floating links box on the component pages */
.componentBox {
    float: right; 
    margin-left: 1em;
    margin-bottom: 1em;
    padding-left: 0.5em;
    padding-right: 0.5em;
    border: 1px solid #888888;
    color: #000;
    background-color: #fafafa;
    text-align: center;
    width: 150px;
}
 
.componentBox li a { /* display: block; */ }
.componentBox ul, .componentBox ol { list-style-type: none; list-style-image: none; margin: 0 }
.componentBox .compBoxHdr { margin-top: 0.5em; color: #000; background: #ADD8E6; padding: 0.5em; font-weight: bold; clear: left; }
 
.componentBox img {
max-width: 100%;
}
 
.page-Main_Page .componentBox {
    text-align: left;
    width: 20em;
}
@media only screen and (max-width: 479px) {
    .page-Main_Page .componentBox {
        width: 100%;
    }
}
@media only screen and (min-width: 480px) and (max-width: 767px) {
    .page-Main_Page .componentBox {
        width: 50%;
    }
}
 
.page-Main_Page .compBoxHdr {
text-align: center;
}
.page-Main_Page .componentBox ul {
font-weight: bold;
}
 
.page-Main_Page .componentBox .rss li {
font-weight: normal;
}
 
.page-Main_Page .componentBox ul ul {
font-weight: normal;
padding-left: 1em;
}
 
/* 
.small {
font-size: 10px;
line-height: 19px;
}
 
pre, .enter {
line-height: 19px;
}
 */
/* niceCategoryList lame css
table.category_link td { padding-left: 1 em; padding-right: 1 em; }
*/
 
.RSSReader-head {
  text-align: center;
  padding: 0.2em;
  border-bottom: 0.1em solid #aaa;
}
 
div.rss {
    margin: 0 0 20px 0;
    padding: 5px;
    border: 1px solid #D0D6F0;
}
div.rss h3 {
    background: #D0D6F0;
    padding: 2px 5px;
    margin: 0;
}
#content .rss h3 a { color: #4E507F }
 
cite { font-style: normal; }
.hcite .journal { font-style: italic; }
.hcite .volume { font-weight: bold; }
 
/* class for news footer items. Adding clear */
.newsfooter {
font-size: .9em;
text-align: center;
background-color: #ddd;
border: 1px solid #aaa;
padding-left: 1em;
padding-right: 1em;
clear: both;
}
 
.intro { font-size: 1.25em; }
 
.impactstory-embed, .altmetric-embed { float: right; margin-left: 1em; }
.impactstory-embed ul, .altmetric-embed ul { list-style-image: none; }
.references>li { clear: right; padding: .5em 0; border-top: 1px solid #ccc }
 
.sponsorbox {
clear: right;
float: right;
width: 300px;
}
.sponsortext {
float: left;
width: 140px;
margin-top: 1.5em;
}
 
.img-div-r .floatright {
min-height: 50px;
}
```







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




- <span id="footer-info-lastmod">Last updated at 17:21 on 29 May
  2024.</span>
<!-- - <span id="footer-info-viewcount">58,256 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





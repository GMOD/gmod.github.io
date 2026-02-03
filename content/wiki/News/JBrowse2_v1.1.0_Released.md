---
title: "News/JBrowse2 v1.1.0 Released"
---




<span id="top"></span>




# <span dir="auto">News/JBrowse2 v1.1.0 Released</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">We're pleased
  to announce a new release of JBrowse
  Web!</span>](#We.27re_pleased_to_announce_a_new_release_of_JBrowse_Web.21)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Changed
    callbacks language from JavaScript to
    Jexl</span>](#Changed_callbacks_language_from_JavaScript_to_Jexl)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Fetch
    intron and upstream/downstream
    sequences</span>](#Fetch_intron_and_upstream.2Fdownstream_sequences)
  - [<span class="tocnumber">1.3</span>
    <span class="toctext">Interactive documentation using
    Storybook</span>](#Interactive_documentation_using_Storybook)
  - [<span class="tocnumber">1.4</span> <span class="toctext">Enhanced
    navigation to drawer widget
    stack</span>](#Enhanced_navigation_to_drawer_widget_stack)
  - [<span class="tocnumber">1.5</span>
    <span class="toctext">Downloads</span>](#Downloads)
  - [<span class="tocnumber">1.6</span> <span class="toctext">1.1.0
    (2021-03-29)</span>](#1.1.0_.282021-03-29.29)
    - [<span class="tocnumber">1.6.1</span> <span class="toctext">🚀
      Enhancement</span>](#.F0.9F.9A.80_Enhancement)
    - [<span class="tocnumber">1.6.2</span> <span class="toctext">🐛 Bug
      Fix</span>](#.F0.9F.90.9B_Bug_Fix)
    - [<span class="tocnumber">1.6.3</span> <span class="toctext">📝
      Documentation</span>](#.F0.9F.93.9D_Documentation)
    - [<span class="tocnumber">1.6.4</span> <span class="toctext">🏠
      Internal</span>](#.F0.9F.8F.A0_Internal)
    - [<span class="tocnumber">1.6.5</span>
      <span class="toctext">Committers: 6</span>](#Committers:_6)



## <span id="We.27re_pleased_to_announce_a_new_release_of_JBrowse_Web.21" class="mw-headline">We're pleased to announce a new release of JBrowse Web!</span>

(Reposted by permission from
<a href="https://jbrowse.org/jb2/blog/2021/03/29/v1.1.0-release"
class="external free"
rel="nofollow">https://jbrowse.org/jb2/blog/2021/03/29/v1.1.0-release</a>

### <span id="Changed_callbacks_language_from_JavaScript_to_Jexl" class="mw-headline">Changed callbacks language from JavaScript to Jexl</span>

To allow users to safely and seamlessly share advanced configurations in
sessions, we now use Jexl to express configuration callbacks. Note that
this is a breaking change, function()-style callbacks will no longer
work.

For details, see the <a
href="https://jbrowse.org/jb2/docs/config_guide#configuration-callbacks#configuration-callbacks"
class="external text" rel="nofollow">callbacks section of our
configuration guide</a>.

### <span id="Fetch_intron_and_upstream.2Fdownstream_sequences" class="mw-headline">Fetch intron and upstream/downstream sequences</span>

We also have several other improvements including the ability to get
intron and upstream/downstream sequence in the feature details

<a href="../File:Upstream_downstream.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/76/Upstream_downstream.png/700px-Upstream_downstream.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/76/Upstream_downstream.png/1050px-Upstream_downstream.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/76/Upstream_downstream.png/1400px-Upstream_downstream.png 2x"
width="700" height="248" alt="Upstream downstream.png" /></a>

### <span id="Interactive_documentation_using_Storybook" class="mw-headline">Interactive documentation using Storybook</span>

Another new update is the first release of our interactive Storybook
docs for the embeddable React Linear Genome View. The docs contain live
examples of how the LGV component can be used, along with source-code
examples. The site can be found
<a href="https://jbrowse.org/storybook/lgv/v1.1.0" class="external text"
rel="nofollow">here</a>.

### <span id="Enhanced_navigation_to_drawer_widget_stack" class="mw-headline">Enhanced navigation to drawer widget stack</span>

We have added a dropdown to enhance navigation between stack of active
widgets. The update also adds a minimize button to allow quick access to
full screen JBrowse web.

See below for demos of the new navigation UI.

<a href="../File:Minimize_button_demo.gif" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/0f/Minimize_button_demo.gif" width="480"
height="414" alt="Minimize button demo.gif" /></a>

Demo of using the minimize button in the drawer

### <span id="Downloads" class="mw-headline">Downloads</span>

- <a href="https://github.com/GMOD/jbrowse-components/releases/tag/v1.1.0"
  class="external text" rel="nofollow">v1.1.0</a>

To install JBrowse 2 for the web, you can download the link above, or
you can use the JBrowse CLI to automatically download the latest
version. See the JBrowse web quick start for more details.

### <span id="1.1.0_.282021-03-29.29" class="mw-headline">1.1.0 (2021-03-29)</span>

#### <span id=".F0.9F.9A.80_Enhancement" class="mw-headline">🚀 Enhancement</span>

core

1.  1846 Improve copy+paste in the data grids for feature details
    (@cmdcolin)
2.  1814 Add ability to get promoter sequence and intron sequence for
    genes from the feature details panel (@cmdcolin)
3.  1816 Remove some animation effects (@cmdcolin)
4.  1778 Adds dropdown to show drawer widget stack (@teresam856)
5.  1685 Change callbacks language from JavaScript to Jexl (@peterkxie)

Other

1.  1831 Add dialog for launching breakpoint split view from variant
    feature details (@cmdcolin)
2.  1803 Transcript and gene glyphs can now display implied UTRs, active
    by default (@cmdcolin)
3.  1808 Add another heuristic for returning gene features from BigBed
    (@cmdcolin)
4.  1774 Add warning dialog in LGV before returning to import form to
    prevent accidentally losing the current view (@cmdcolin)

#### <span id=".F0.9F.90.9B_Bug_Fix" class="mw-headline">🐛 Bug Fix</span>

core

1.  1811 Check for existence of window more robustly to allow in SSR or
    node applications (@elliothershberg)
2.  1793 Fix dotplot rendering outside it's allowed bounds (@cmdcolin)
3.  1783 Add hic aborting and fix remoteAbort signal propagation
    (@cmdcolin)
4.  1723 A few bugfixes (@garrettjstevens)

Other

1.  1815 Clear tracks when using "Return to import form" (@cmdcolin)
2.  1819 Standardized sentence casing on drawer widget titles
    (@cmdcolin)
3.  1796 Bump generic-filehandle for fixing CORS errors from Chrome
    cache pollution (@cmdcolin)

#### <span id=".F0.9F.93.9D_Documentation" class="mw-headline">📝 Documentation</span>

1.  1824 Add storybook docs page for nextjs usage (@elliothershberg)
2.  1770 1469 storybook deploy (@elliothershberg)
3.  1807 Update developer guide to cover displays, and highlight working
    external plugins (@cmdcolin)
4.  1779 Collaborative release announcement editing (@rbuels)
5.  1791 Add a couple more demos for our live version with MDX
    (@cmdcolin)

#### <span id=".F0.9F.8F.A0_Internal" class="mw-headline">🏠 Internal</span>

Other

1.  1820 Create v1.1.0.md, draft of release announcements
    (@garrettjstevens)
2.  1823 Add note about previewing changelog to CONTRIBUTING.md
    (@garrettjstevens)

core

1.  1834 Change jbrowse-components monorepo default branch from 'master'
    to 'main' (@rbuels)

#### <span id="Committers:_6" class="mw-headline">Committers: 6</span>

- Colin Diesh (@cmdcolin)
- Elliot Hershberg (@elliothershberg)
- Garrett Stevens (@garrettjstevens)
- Peter Xie (@peterkxie)
- Robert Buels (@rbuels)
- Teresa Martinez (@teresam856)

  



*Posted to the [GMOD News](../GMOD_News "GMOD News") on 2021/03/30*






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

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/News-2FJBrowse2_v1.1.0_Released"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:28 on 30 March
  2021.</span>
<!-- - <span id="footer-info-viewcount">13,736 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





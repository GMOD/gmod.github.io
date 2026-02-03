---
title: "December 2 2010"
---




<span id="top"></span>




# <span dir="auto">December 2 2010</span>









## <span id="Minutes_for_December_9_.28Suzi.29" class="mw-headline">Minutes for December 9 (Suzi)</span>

**participants**: Nomi, Gregg, Ed, Suzie, Mitch, Chris and Chris

- AI: Suzi to contact John about getting code for BRIX

<!-- -->

- Gregg
  - Draggable and Droppable issue. Both Gregg and Mitch had possible
    solutions. Went with Mitch's suggestion to implement the needed
    method in the constructor. Eliminated global variable and Nomi has
    picked up the changes which seem to work.
  - Ed: Firebug saying there is an error message when loading JBrowse,
    but no other visible effect on behavior (re. Chrome although both
    are using Firefox)
  - More caching optimizations for other UCSC (minimal time before
    rechecking)
  - More data types in Trellis, bed-graph, bigwig,
  - AI: Gregg, Chris, and Mitch to list these all, rationale for need,
    and prioritize
    - <a
      href="https://spreadsheets.google.com/ccc?key=0Ag9y46wZI6EVdGFYa0V6WXhQaXRDMmhoQm9GRVBVMEE&amp;hl=en&amp;authkey=CJn73pAB"
      class="external text" rel="nofollow">UCSC genome database: track counts
      by type per genome assembly</a>

<!-- -->

- Nomi
  - Working on allowing users to select multiple features and drag all
    at once to create annotation
  - Adding/removing features from selection set is working, and the
    creation of annotations upon drop is mostly working
  - However, JQuery doesn't directly support multiple-drag, so you can
    only see one feature being dragged, not all the selected features.
    - There is a multi-drag plugin for JQuery, but it seems to work on
      Chrome but not on Firefox.
  - Possible solution: create a combined faux feature either
    - At the time the drag event begins
    - Or cumulatively as additional features are selected.

<!-- -->

- Ed
  - Current JBrowse only supports one level of nesting, so where do
    genes go?
  - Mitch, perhaps just keep genes out of the display level
    - NCList knows what features are contained in a region
    - Whereas subfeatures know about parent-child relation (e.g.
      gene-transcripts)
  - AI: Mitch to send example to Ed
  - JQuery used typically where server is generating HTML elements,
    client adds behavior
  - However in our case the HTML elements are being created on the
    client and are dynamic, so need to synchronize when the queries are
    run.
  - Mitch is working on code to support tracks containing heterogeneous
    features (and corresponding mix of graphics for these)
    - Each track has a reference to a DIV and code to access this can be
      added (though not part of the constructor). Analogous to what
      feature track does to setViewInfo

<!-- -->

- Chris
  - How do we handle ID of features? DB assigned IDs are one thing,
    checksums on the feature sequence might be enough for users.

<!-- -->

- Mitch
  - Still working on scalability stuff, then paired-end followed by a
    new release early 2011 (if not sooner)




[Categories](Special%253ACategories "Special%253ACategories"):

- [Webapollo](Category%253AWebapollo "Category%253AWebapollo")
- [Webapollo-minutes](Category%253AWebapollo-minutes "Category%253AWebapollo-minutes")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/December_2_2010" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 17:52 on 16 December
  2010.</span>
<!-- - <span id="footer-info-viewcount">38,042 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





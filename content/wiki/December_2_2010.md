---
title: "December 2 2010"
---
# December 2 2010

## Minutes for December 9 (Suzi)

**participants**: Nomi, Gregg, Ed, Suzie, Mitch, Chris and Chris

- AI: Suzi to contact John about getting code for BRIX
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
- Chris
  - How do we handle ID of features? DB assigned IDs are one thing,
    checksums on the feature sequence might be enough for users.
- Mitch
  - Still working on scalability stuff, then paired-end followed by a
    new release early 2011 (if not sooner)

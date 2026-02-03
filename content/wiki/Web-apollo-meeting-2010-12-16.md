---
title: "Web-apollo-meeting-2010-12-16"
---
# Web-apollo-meeting-2010-12-16

## Agenda items

## Minutes

- Review of action items
  - More data types in Trellis
  - Gregg has create the spreadsheet with all of these
    - <a
      href="https://spreadsheets.google.com/ccc?key=0Ag9y46wZI6EVdGFYa0V6WXhQaXRDMmhoQm9GRVBVMEE&amp;hl=en&amp;authkey=CJn73pAB"
      class="external text" rel="nofollow">UCSC genome database: track counts
      by type per genome assembly</a>
    - Only high implementation priority to add are rmsk and wig
- Gregg
  - Looking at different data types in terms of difficulty and priority
    (as above)
  - Needs to incorporate CDS/UTR information to get it into the display
    (bit of an oversight)
  - Also looking at functionality of caching to not bother rechecking
    until a certain threshold of time expires (somewhat working now).
    Code is checked in. Struggling with firebug to get information
    needed to debug.
- Chris
  - Some problems installing JBrowse using bam
  - Will have new bovine assembly in January
  - (Gregg) says we can now (via config file) view data from multiple
    sources in a single JBrowse instance. Next version, would allow a
    set of URLs be used to specify tracks. In longer term is to make
    this dynamic.
  - Honeybee has funding for a whole new consortium, plus 2 bumblebees.
    This is a complete pass reannotation.
  - Honeybee includes a lot for RNAseq data as well.
  - Editing functionality JBrowse is higher priority than viewing data
    from multiple sources
- Next meeting will be January 6, 2011

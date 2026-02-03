---
title: "Web-apollo-meeting-2011-3-15"
---




<span id="top"></span>




# <span dir="auto">Web-apollo-meeting-2011-3-15</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">3/15/2011:
  Suzi, Gregg, Ed, and
  Nomi</span>](#3.2F15.2F2011:_Suzi.2C_Gregg.2C_Ed.2C_and_Nomi)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Progress
    Report</span>](#Progress_Report)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">Hardware</span>](#Hardware)
  - [<span class="tocnumber">1.3</span> <span class="toctext">JBrowse
    issues</span>](#JBrowse_issues)
  - [<span class="tocnumber">1.4</span> <span class="toctext">What does
    WebApollo need to
    provide?</span>](#What_does_WebApollo_need_to_provide.3F)
  - [<span class="tocnumber">1.5</span> <span class="toctext">Discussed
    commonality between editing
    operations</span>](#Discussed_commonality_between_editing_operations)
  - [<span class="tocnumber">1.6</span>
    <span class="toctext">Undo/Redo</span>](#Undo.2FRedo)



## <span id="3.2F15.2F2011:_Suzi.2C_Gregg.2C_Ed.2C_and_Nomi" class="mw-headline">3/15/2011: Suzi, Gregg, Ed, and Nomi</span>

### <span id="Progress_Report" class="mw-headline">Progress Report</span>

- WebApollo year 1 progress report submitted. Thanks to all who
  contributed to it.

### <span id="Hardware" class="mw-headline">Hardware</span>

- What hardware do we need for a WebApollo server?
  - One server (Linux or OSX). (Budget?)
  - Server itself doesn't need to be too studly--mostly we need a lot of
    storage.
  - Four 3-terabyte drives (or at least 8 terabytes to start with)
  - Need space to double every year (but hopefully that will be constant
    cost/year as price of memory drops)
  - Server speed is not a huge issue. The client side (how much data a
    browser can handle) will be the limiting factor.
  - Seth says we have space on campus and the networking we need.
- Action items:
  - AI: Suzi will check on time constraint (when does this grant year
    end? April 30?) and hardware budget
  - AI: Seth will get a price quote
  - AI: Seth and/or Ed will do the ordering
  - AI: Ed will get Tomcat up on the server
  - AI: Gregg will deal with the rsync
- Backups and server use by outside groups
  - Need to back up user data (though not the UCSC data, which we can
    always get again).
  - Larger groups may set up their own servers, but we need to be a
    server for smaller groups that want to use WebApollo.
  - Would we have to set limits about how much data users could save on
    our server?
- Seth proposed buying a server with the following (which we can afford
  with our current hardware budget):
  - 2x 4 core
  - 6GB RAM
  - 7x 2TB hd (RAID 6 + one hot spare = 8TB)
  - 1x 120MB SSD boot disk
  - 3U profile, 12 hd slots
  - 4x Gb ethernet (for bonding on two interfaces)
  - Gregg said: "Seth and I talked briefly in person on Tuesday, and he
    convinced me that it makes sense to spend the money for enough hard
    drives to set up RAID 6 for the UCSC data. And I agree to allow for
    future expansion we should go ahead with a 4U 16 slot box."
  - I believe the server has now been ordered?

### <span id="JBrowse_issues" class="mw-headline">JBrowse issues</span>

- JBrowse currently only supports two-level feature hierarchy.
  - Mitch wants to do a JSON approach that allows arbitrary levels of
    features, and also different kinds of features at the same level
    (possibly with different fields).
    - Gregg and Mitch have talked about details of this approach, sounds
      like it'll provide what we need
    - Mitch may be able to implement this in the next several months
    - If Mitch doesn't get to it before we need it, Gregg can implement

### <span id="What_does_WebApollo_need_to_provide.3F" class="mw-headline">What does WebApollo need to provide?</span>

- We looked at old Apollo to see what it has so we could decide what
  WebApollo needs.
- Authentication service with read/write privileges (records who made
  the annotation)
- Sequence window (old Apollo)--view as cDNA, AA, etc., and can
  copy&paste or save to a file
  - Suzi notes that it's really annoying when web apps pop up extra
    windows
  - Gregg says what he'd want is a menu item, Copy to Clipboard
- Alignment viewer
- (Exon Detail Editor--don't want)
- Show start/stop codons (when you've zoomed in enough to see
  bases)--calculate on the fly on client. (Would need to show which
  strand they were on.)
- Stuff that's in Apollo's Annotation Information Editor--what do we
  need?
  - Ability to rename annotations
  - Add/edit comments
  - Synonyms
  - Dbxrefs (JBrowse already provides this?)
  - Ability to paste in new exon boundaries (?) (Maybe this doesn't
    belong in the Annotation Info Editor)
  - Little pieces of info, some of which are calculated automatically
    (e.g., missing start/stop codons)
  - Ontology terms? (Old Apollo doesn't really have this, except via the
    dbxref, which has a checkbox for "is from an ontology".)
    - Gregg suggests that this panel could pull out as a slider, or it
      could be brought up by a right-menu option. We don't want it
      around taking up space unless it's requested. We don't want it to
      pop up as a separate window.
- Ability to create de novo annotation (Apollo offers a right-menu
  option to choose annotation type)--types should be a subset of the
  Sequence Ontology, but you should also be able to create your own new
  annotation type.
- Time-stamp annotations
- Let user set an anchor? (Keep a point centered even when zooming in
  and out.)
- Should we offer zoomed-in and zoomed-out views (vertically) in the
  same screen? Suzi says yes. Can have two vertical scrollbars. Can zoom
  the two views independently.
- Splice view (like in [IGB](IGB "IGB"))--show all the exons (plus a bit
  of the introns) and leave out the boring empty intron stretches.
- Annotation editing operations:
  - Undo
  - Merge
  - Split
  - ...

### <span id="Discussed_commonality_between_editing_operations" class="mw-headline">Discussed commonality between editing operations</span>

- Interval algebra
  - Add exon, extend exon, merge exons, create transcript, merge
    transcripts can all be considered union operations on
    exon/transcript intervals
  - Delete exon, shorten exon, split exon, delete transcript, split
    transcript can all be considered intersect (or alternatively XOR or
    NOT) operations on exon/transcript intervals
  - Not exactly sure what this implies for user interface, but hopefully
    thinking about this will help simplify the GUI

### <span id="Undo.2FRedo" class="mw-headline">Undo/Redo</span>

- Discussed global undo vs. per-annotation undo
- Implementing undo/redo as ancestor/descendant traversal
- Handling splits and merges -- implies multiple ancestors, multiple
  descendants
- UI for undo/redo -- back/forward, select from version list, or both




[Category](Special%253ACategories "Special%253ACategories"):

- [Webapollo](Category%253AWebapollo "Category%253AWebapollo")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Web-2Dapollo-2Dmeeting-2D2011-2D3-2D15"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 16:53 on 21 February
  2012.</span>
<!-- - <span id="footer-info-viewcount">14,146 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





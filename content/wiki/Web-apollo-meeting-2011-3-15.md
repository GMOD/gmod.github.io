---
title: "Web-apollo-meeting-2011-3-15"
---
# Web-apollo-meeting-2011-3-15

  Suzi, Gregg, Ed, and
  Nomi</span>](#3.2F15.2F2011:_Suzi.2C_Gregg.2C_Ed.2C_and_Nomi)
  - [Progress
    Report](#Progress_Report)
  - [Hardware](#Hardware)
  - [JBrowse
    issues](#JBrowse_issues)
  - [What does
    WebApollo need to
    provide?](#What_does_WebApollo_need_to_provide.3F)
  - [Discussed
    commonality between editing
    operations](#Discussed_commonality_between_editing_operations)
  - [Undo/Redo](#Undo.2FRedo)

## 3/15/2011: Suzi, Gregg, Ed, and Nomi

### Progress Report

- WebApollo year 1 progress report submitted. Thanks to all who
  contributed to it.

### Hardware

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

### JBrowse issues

- JBrowse currently only supports two-level feature hierarchy.
  - Mitch wants to do a JSON approach that allows arbitrary levels of
    features, and also different kinds of features at the same level
    (possibly with different fields).
    - Gregg and Mitch have talked about details of this approach, sounds
      like it'll provide what we need
    - Mitch may be able to implement this in the next several months
    - If Mitch doesn't get to it before we need it, Gregg can implement

### What does WebApollo need to provide?

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
- Splice view (like in [IGB](/wiki/IGB))--show all the exons (plus a bit
  of the introns) and leave out the boring empty intron stretches.
- Annotation editing operations:
  - Undo
  - Merge
  - Split
  - ...

### Discussed commonality between editing operations

- Interval algebra
  - Add exon, extend exon, merge exons, create transcript, merge
    transcripts can all be considered union operations on
    exon/transcript intervals
  - Delete exon, shorten exon, split exon, delete transcript, split
    transcript can all be considered intersect (or alternatively XOR or
    NOT) operations on exon/transcript intervals
  - Not exactly sure what this implies for user interface, but hopefully
    thinking about this will help simplify the GUI

### Undo/Redo

- Discussed global undo vs. per-annotation undo
- Implementing undo/redo as ancestor/descendant traversal
- Handling splits and merges -- implies multiple ancestors, multiple
  descendants
- UI for undo/redo -- back/forward, select from version list, or both

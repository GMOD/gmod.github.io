---
title: "News/JBrowse 1.9.0 released"
---
# News/JBrowse 1.9.0 released

<a href="http://jbrowse.org/jbrowse-1-9-0" class="external text"
rel="nofollow">JBrowse 1.9.0</a> is out today, with some great new
features, and **lots** of smaller improvements and bug fixes.

It can be downloaded from
<a href="http://jbrowse.org/jbrowse-1-9-0" class="external text"
rel="nofollow">jbrowse.org</a>.

Headline features for this release:

- **VCF variants support:** we've added a new direct-access data backend
  for reading VCF files that have been compressed and indexed with bgzip
  and tabix, along with a new track type (HTMLVariants) optimized for
  viewing the sometimes-huge amounts of detail (particularly genotypes)
  associated with VCF variants.
- Wiggle track types now by default **choose a y-axis scale dynamically
  for the region being displayed** (set as `"autoscale": "local"` in
  JBrowse configuration JSON).  This is a big win for usability!  Thanks
  to Gregor Rot and Raymond Wan for pushing for this feature!
- If configured to do so, JBrowse can now display a dropdown **dataset
  selector **on the left side of the menu bar (similar to the one in
  GBrowse) that lets users switch between multiple datasets in the same
  JBrowse installation.
- The default "Simple" track selector now has a search input at the top
  that can quickly filter the list of displayed tracks to find the text
  you type.
- JBrowse now ships with a **REST datastore backend** that lets
  developers serve data to JBrowse from custom back-end systems.  See
  [JBrowse_Configuration_Guide#JBrowse_REST_Feature_Store_API](../JBrowse_Configuration_Guide#JBrowse_REST_Feature_Store_API)
  for details.

Happy browsing!

--[RobertBuels](../User%253ARobertBuels)
([talk](../User_talk%253ARobertBuels)) 10:09, 17
April 2013 (EDT)



*Posted to the [GMOD News](../GMOD_News) on 2013/04/16*


- [News Items](../Category%253ANews_Items)

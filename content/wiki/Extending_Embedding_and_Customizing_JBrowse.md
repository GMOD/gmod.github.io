---
title: "Extending Embedding and Customizing JBrowse"
---
# Extending Embedding and Customizing JBrowse

Result of discussions at GMOD satellite meeting, March 2011

Potential upcoming changes to JSON format:

<a href="http://biowiki.org/view/JBrowse/JsonFormatStabilization"

TODO/wishlist for JBrowse:

- namespace CSS
- putting track list into separate DOM element (e.g., Drupal "block")
- "Browser" API: anything you can do manually
- Hooks:
  - featureCreate: has access to: feature data, feature HTML element,
    can:
    - style the element, and
    - add callbacks to the element
  - featureEventHooks:
    { click: function(feature array, HTML element, getAttr, event)
     mouseover: function(...
     mouseout: ...
     [DOM event name]: [callback function]
    }

    current approach:

    fields:
    { "start": 1,
      "end": 2,
      "strand": 3,
      ...
    }

    changing to: getAttr

- - access to region selections (e.g., for creation of lists of
    features)
  - function that: takes currently visible sequence, PSSM or set of
    regexes, returns: set of regions

"Browser" API extensions:

Browser.iterateFeaturesInTrack("gene", function(feature, elem, getAttr)
{if (getAttr(feature, "id") == "foo")
{elem.style.backgroundColor="red"}})

?Browser.filterTrackBy("gene", function(feature, elem, getAttr { return
(getAttr(feature, "id") == "foo") });

e.g.,

- all genes in a given pathway with expression \> 2 s.d. above average
- all genes tagged with a given GO term

sequence logos for summarizing overlapping alignments

common GBrowse glyphs not currently reproducible in JBrowse:

- LD plot? (not common)
- GBrowse uses gene-\>mRNA relationships to layout ("bump") transcripts
  for a given gene together.
- GBrowse shows different representation of break between read pairs and
  gaps within individual reads
- Glyph/image.pm (associates images with seqfeatures)

General JBrowse feature requests:

- "no data" screen a la GBrowse
- example data to browse included distribution
- region selection

---
title: "Extending Embedding and Customizing JBrowse"
---




<span id="top"></span>




# <span dir="auto">Extending Embedding and Customizing JBrowse</span>









Result of discussions at GMOD satellite meeting, March 2011

Potential upcoming changes to JSON format:

<a href="http://biowiki.org/view/JBrowse/JsonFormatStabilization"
class="external free"
rel="nofollow">http://biowiki.org/view/JBrowse/JsonFormatStabilization</a>

TODO/wishlist for JBrowse:

- namespace CSS
- putting track list into separate DOM element (e.g., Drupal "block")
- "Browser" API: anything you can do manually

<!-- -->

- Hooks:
  - featureCreate: has access to: feature data, feature HTML element,
    can:
    - style the element, and
    - add callbacks to the element
  - featureEventHooks:

<!-- -->

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Extending_Embedding_and_Customizing_JBrowse"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:23 on 7 March
  2011.</span>
<!-- - <span id="footer-info-viewcount">23,476 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





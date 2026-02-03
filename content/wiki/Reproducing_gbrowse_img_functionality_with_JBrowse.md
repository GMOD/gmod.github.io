---
title: "Reproducing gbrowse img functionality with JBrowse"
---




<span id="top"></span>




# <span dir="auto">Reproducing gbrowse img functionality with JBrowse</span>









That is, "Reproducing gbrowse_img functionality with JBrowse"
(underscores don't survive the Mediawiki page naming process). A current
implementation of this can be seen at the WormBase staging site for the
<a
href="https://staging.wormbase.org/species/c_elegans/gene/WBGene00001340#09--10#09--10"
class="external text" rel="nofollow">etr-1 gene</a>, which has quite a
few transcripts and so needs a "tall" JBrowse image.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Why this is
  needed</span>](#Why_this_is_needed)
- [<span class="tocnumber">2</span> <span class="toctext">What this
  solution does</span>](#What_this_solution_does)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Fetch
    JBrowse into a div</span>](#Fetch_JBrowse_into_a_div)
  - [<span class="tocnumber">2.2</span> <span class="toctext">CSS
    tricks</span>](#CSS_tricks)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Monitor
    JBrowse loading</span>](#Monitor_JBrowse_loading)
  - [<span class="tocnumber">2.4</span> <span class="toctext">"Div
    overlay" to allow
    clicking</span>](#.22Div_overlay.22_to_allow_clicking)
- [<span class="tocnumber">3</span>
  <span class="toctext">Acknowledgments</span>](#Acknowledgments)



## <span id="Why_this_is_needed" class="mw-headline">Why this is needed</span>

While [JBrowse](JBrowse.1 "JBrowse") is a terrific tool for browsing
genomes, there is one piece of functionality that is missing from this
excellent client-side tool: getting an image from the server with a URL
request that can be dynamically inserted into a web page, like what one
might want for a gene page at a model organism database.

The most common solution that is used when people need this
functionality from JBrowse has been to put the needed URL in an html
iframe. This approach has a few down sides:

- The content in the iframe remains active. Users can interact with it
  in the same way that they can interact with a full JBrowse instance.
  While this is kind of neat in some instances, there is no way to get
  back to the original view. If the designer of the page put that view
  there for a reason, the user might want to see that view in the
  context of the page. (Note that this is technically not true--one
  could write some JavaScript and attach it to a "reset" button, but it
  is an ugly solution).
- The iframe captures mouse scroll wheel events. If a user is scrolling
  down a page and the mouse pointer enters a JBrowse iframe, the iframe
  starts capturing the scroll so that scrolling in the page stops while
  the JBrowse in the iframe scrolls. This is \*very\* annoying to the
  user.
- There is no way to know before the JBrowse URL is invoked how tall the
  resulting "image" (JBrowse page) will be, so the page designer
  generally has to assign a fixed height and then the resulting JBrowse
  page is frequently either too large or too small. When it's too large,
  it results in ugly white space; but even worse, when it's too small,
  it requires the user to scroll to see the entirety of the content,
  which can result in accidentally scrolling away from the genomic
  location originally defined for the page.
- iframes are ugly.

## <span id="What_this_solution_does" class="mw-headline">What this solution does</span>

- Puts the JBrowse content in a div with a JavaScript function
- Uses CSS to prevent mouse interactions (like scrolling) in the JBrowse
  div
- Uses JavaScript to monitor the size of the resulting JBrowse content
  and dynamically resize the div to show all of the content
- Creates a div "overlay" for the resulting image so that a click on it
  goes to the full JBrowse site.

The example code below uses JQuery but could easily be reimplemented in
another framework (or vanilla JavaScript, which is how it was originally
written--putting it into JQuery made it much cleaner).

### <span id="Fetch_JBrowse_into_a_div" class="mw-headline">Fetch JBrowse into a div</span>

The first thing to do is to fetch JBrowse into a div using an html
object tag with the URL that you need to fetch in the "data" attribute
of the object tag. In practice, the result looks like this:

    
      <object id="innerJBrowse" 
             type="text/html" 
             style="pointer-events: none; position: relative; top: -1px; left: 0px; width: 100%; height: 1273px; overflow: hidden;" 
             data="/tools/genome/jbrowse-simple/full.html?overview=0&tracks=Curated_Genes%2CClassical_alleles%2CYACs_Fosmids_Cosmids&loc=II%253A158247..173104&data=data%2Fc_elegans_simple&nav=0&tracklist=0">
      </object>
    

But the trick is that the object tag gets created dynamically when the
page is loaded, using some simple JavaScript like this:

    <script type="text/javascript">
        var preembedURL = "full.html?tracks=Curated_Genes%2CClassical_alleles%2CYACs_Fosmids_Cosmids&loc=X%253A12392257..12418393&data=data%2Fc_elegans_simple"; 
        var embed_part = "&nav=0&tracklist=0&overview=0";
        $("#jbrowse-view-iframe").html('<object id="innerJBrowse" type="text/html" style="pointer-events: none; position: relative; top: -1px; left: 0px; width: 100%; height: 14px; overflow: hidden;" data="'+preembedURL+embed_part+'"></object>');
    </script>

Note that the class of the div is "jbrowse-view-iframe" but of course,
it's really a div, not an iframe.

### <span id="CSS_tricks" class="mw-headline">CSS tricks</span>

Now for a few comments about the styling of the JBrowse div. There are
few neat tricks that are going on here that are important to making this
work. Here they are laid out in full:

- `pointer-events: none;` This is one of the most important items;
  pointer-effects none tells the browser to ignore anything the mouse
  does inside this div, so there is no clicking on features or scrolling
  with the mouse wheel.
- `position: relative; ` Makes the coordinate assignments in the next
  line work properly.
- `top: -1px; left: 0px; ` Positioning--put JBrowse starting at the top
  left of the div.
- `width: 100%; ` Not supper important what the width is; I like 100% in
  our implementation because it just fills with width of the parent.
- `height: 14px; ` This height will allow the top coordinate bar of
  JBrowse be visible while it's loading; another option is to set it to
  zero so the user sees nothing while it's loading. Finally, what was
  implemented at WormBase was to place a "loading spinner" in the div
  while it's loading.
- `overflow: hidden;` This prevents the browser from creating a scroll
  bar from forming when the content gets bigger than the div height. Of
  course, the scrollbar wouldn't work anyway because of the
  pointer-events setting.

### <span id="Monitor_JBrowse_loading" class="mw-headline">Monitor JBrowse loading</span>

Below is the script used at WormBase for checking the height required
for JBrowse while it's loading. It checks every 2 seconds if the height
needs to be changed for 30 seconds. Note that the stuff in `[% .... %]`
brackets are variables being substituted in by Perl's Template::Toolkit
which drives the WormBase website.

     <script type="text/javascript">
                (function() {
                    var viewId = "#[% view_id %]";
                    var viewUrl = "[% view_url %]";
                    var innerJBrowseContainer = $jq(viewId + " .jbrowse-view-iframe");
                    var heightDefault = 400;

                    var reset = (function(innerJBrowseContainer, url) {
                      return function(height) {
                        var innerJBrowseElement = innerJBrowseContainer.find('object');
                        innerJBrowseContainer.addClass('jbrowse-view-iframe__loading');
                        innerJBrowseElement.attr('data', url);
                        innerJBrowseElement.height(height);

                        function updateHeight() {
                            var heightComputed = 0;
                            var jbrowseDocument = document.getElementById('innerJBrowse').contentDocument || document.getElementById('innerJBrowse').contentWindow.document;
                            var tracks = jbrowseDocument.getElementsByClassName('track');
                            for (var i=0; i < tracks.length; i++) {
                              var id = tracks[i].id;
                              if (id !== 'gridtrack' && id !== 'overviewtrack_overview_loc_track' && id !== 'static_track') {
                                heightComputed += tracks[i].offsetHeight;
                              }
                            }
                            var previousHeight = innerJBrowseElement.height();
                            innerJBrowseElement.height(Math.max(heightDefault, heightComputed));
                            WB.scrollToOffsetHeightDiff(innerJBrowseElement, previousHeight);
                            return heightComputed;
                        }

                        function progressInit(max_num_retries, num_stabilization_step) {
                          var previousHeights = [0];
                          return {
                            isProgressComplete: function() {
                              return previousHeights.length > max_num_retries || (
                                previousHeights.length > num_stabilization_step &&
                                previousHeights[0] !== 0 &&
                                previousHeights.slice(1, num_stabilization_step).every(
                                  function(prevHeight) {
                                    return prevHeight === previousHeights[0];
                                  }
                                )
                              );
                            },
                            updateProgress: function(newHeight) {
                              previousHeights.unshift(newHeight);
                            },
                          };
                        }


                        var progress = progressInit(30, 3);
                        var interval = setInterval(function() {
                          if (progress.isProgressComplete()) {
                            innerJBrowseContainer.removeClass('jbrowse-view-iframe__loading');
                            clearInterval(interval);
                          } else {
                            var newHeight = updateHeight();
                            progress.updateProgress(newHeight);
                          }
                        }, 2000);

                      };
                    })(innerJBrowseContainer, viewUrl);

                    reset(heightDefault);

                    $jq(viewId + " .jbrowse-view-iframe").click(function(){
                      window.location.href = "[% jbrowse_url(taxonomy, padded_coords, bp, 0, tracks); %]";
                    });

                })();
                </script>

### <span id=".22Div_overlay.22_to_allow_clicking" class="mw-headline">"Div overlay" to allow clicking</span>

The last piece that is required to make this really work well is for the
page to open a full JBrowse instance when the image is clicked on. In
this implementation, that is accomplished with the last few lines of the
script in the previous sections:

     $jq(viewId + " .jbrowse-view-iframe").click(function(){
                      window.location.href = "[% jbrowse_url(taxonomy, padded_coords, bp, 0, tracks); %]";
                    });

Where we are using the JQuery "click" method to add a click target that
sits "on top of" the JBrowse image but isn't subject to the
pointer-events restriction that we placed in the first section of this
outline.

## <span id="Acknowledgments" class="mw-headline">Acknowledgments</span>

Special thanks to Sibyl Gao at WormBase for taking the prototype I
created and turning it into something that would actually work well in
the context of a full website.




[Category](Special%253ACategories "Special%253ACategories"):

- [JBrowse](Category%253AJBrowse "Category%253AJBrowse")






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

- <span id="t-smwbrowselink"><a
  href="Special%253ABrowse/Reproducing_gbrowse_img_functionality_with_JBrowse"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:14 on 10 April
  2018.</span>
<!-- - <span id="footer-info-viewcount">27,668 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





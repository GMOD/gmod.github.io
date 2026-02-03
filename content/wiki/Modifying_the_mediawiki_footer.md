---
title: "Modifying the mediawiki footer"
---




<span id="top"></span>




# <span dir="auto">Modifying the mediawiki footer</span>









To modify the footer in MediaWiki pages, I had to edit
skins/MonoBook.php. I added this line:

    <p><table><tr><td><img src="/w/images/e/ef/Nihlogo.gif" alt="National Institutes of Health"></td><td>GMOD is supported by a specific cooperative agreement from the USDA Agricultural Research Service, and by NIH grants co-funded from the National Human Genome Research Institute and the National Institute of General Medical Sciences.</td><td><img src="/w/images/7/7e/ARSlogo.jpg" alt="USDA Agricultural Research Service"></td></tr></table><hr /></p>

Here is what the surrounding code looked like:

                    <!-- end of the left (by default at least) column -->
                            
                            
    <?php
                    if($this->data['poweredbyico']) { ?>
                                    <?php $this->html('poweredbyico') ?>
    <?php   }
                    if($this->data['copyrightico']) { ?>
                                    <?php $this->html('copyrightico') ?>
    <?php   }

                    // Generate additional footer links
    ?>
    <!--#######INSERT FOOTER HERE###########-->

                            <ul id="f-list">
    <?php
                    $footerlinks = array(
                            'lastmod', 'viewcount', 'numberofwatchingusers', 'credits', 'copyright',
                            'privacy', 'about', 'disclaimer', 'tagline',
                    );
                    foreach( $footerlinks as $aLink ) {
                            if( isset( $this->data[$aLink] ) && $this->data[$aLink] ) {
    ?>                              <li id="<?php echo$aLink?>"><?php $this->html($aLink) ?></li>




[Category](Special%253ACategories "Special%253ACategories"):

- [Wiki Tools](Category%253AWiki_Tools "Category%253AWiki Tools")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Modifying_the_mediawiki_footer"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:22 on 27 August
  2008.</span>
<!-- - <span id="footer-info-viewcount">17,239 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





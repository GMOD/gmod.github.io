---
title: "Modifying the mediawiki footer"
---
# Modifying the mediawiki footer

To modify the footer in MediaWiki pages, I had to edit
skins/MonoBook.php. I added this line:

 <p><table><tr><td><img src="/w/images/e/ef/Nihlogo.gif" alt="National Institutes of Health"></td><td>GMOD is supported by a specific cooperative agreement from the USDA Agricultural Research Service, and by NIH grants co-funded from the National Human Genome Research Institute and the National Institute of General Medical Sciences.</td><td><img src="/w/images/7/7e/ARSlogo.jpg" alt="USDA Agricultural Research Service"></td></tr></table><hr /></p>

Here is what the surrounding code looked like:

 <!-- end of the left (by default at least) column -->

 <?php
 if($this->data['poweredbyico']) { ?>
 <?php $this->html('poweredbyico') ?>
 <?php }
 if($this->data['copyrightico']) { ?>
 <?php $this->html('copyrightico') ?>
 <?php }

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
 ?> <li id="<?php echo$aLink?>"><?php $this->html($aLink) ?></li>

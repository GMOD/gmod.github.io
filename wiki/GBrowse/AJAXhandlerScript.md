<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">GBrowse/AJAXhandlerScript</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span> <span class="toctext">Proposal to
  convert gbrowse_details to an AJAX request
  handler</span>](#Proposal_to_convert_gbrowse_details_to_an_AJAX_request_handler)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">Examples</span>](#Examples)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Changes to
    gbrowse_details</span>](#Changes_to_gbrowse_details)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Changes To
    Configuration File</span>](#Changes_To_Configuration_File)
  - [<span class="tocnumber">1.4</span> <span class="toctext">Changes to
    Bio::Graphics::Browser</span>](#Changes_to_Bio::Graphics::Browser)

</div>

# <span id="Proposal_to_convert_gbrowse_details_to_an_AJAX_request_handler" class="mw-headline">Proposal to convert gbrowse_details to an AJAX request handler</span>

**A temporary page to describe a low-impact change to existing code to
provide a built-in ajax handler for Gbrowse**

## <span id="Examples" class="mw-headline">Examples</span>

- A balloon hover with contents generated using an AJAX call to
  gbrowse_details and the ***params*** callback shown below

<a href="../File:Sample1b.png" class="image"><img
src="../../mediawiki/images/e/eb/Sample1b.png" width="492" height="239"
alt="Sample1b.png" /></a>

  

- A sticky balloon with contents generated from gbrowse-details (via an
  \<iframe\> element) and the ***default*** callback shown below.

<a href="../File:Sample2b.png" class="image"><img
src="../../mediawiki/images/8/8d/Sample2b.png" width="454" height="364"
alt="Sample2b.png" /></a>

## <span id="Changes_to_gbrowse_details" class="mw-headline">Changes to gbrowse_details</span>

- A new CGI parameter to invoke the AJAX-handling behavior

<!-- -->

    my $rmt   = param('remote');

  

- A response is triggered after the feature(s) are defined but before
  ***PrintTop*** is called.

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="perl source-perl">

``` de1
 if (defined $rmt) {
   print header,start_html;
   print remote_content($rmt,$features[0]);
   print end_html;
   exit 0;
 }
```

</div>

</div>

- The ***remote_content*** subroutine will get the text or coderef. It
  will return the text or execute the callback with user-defined
  arguments

<div class="mw-geshi mw-code mw-content-ltr" dir="ltr">

<div class="perl source-perl">

``` de1
 # do something for popup balloons
 sub remote_content {
   my $key = shift; # the key for the text or code-ref in the gbrowse config file
   my $feat = shift;
   my $contents = $CONFIG->config->code_setting('TOOLTIPS',$key) or die "$key is empty";
   my $coderef = (ref $contents||&#39;&#39;) eq 'CODE';
   return $contents unless $coderef;
   # paranoia?
   die "Error: $key is not a CODE-REF" if ref $contents && !$coderef;
   # args are user-defined
   my %args = (feature => $feat) if $feat;
   for my $arg (param()) {
     my @vals = param($arg);
     my $val  = @vals > 1 ? \@vals : $vals[0];
     $args{$arg} = $val;
   }
   return $contents->(\%args);
 }
```

</div>

</div>

## <span id="Changes_To_Configuration_File" class="mw-headline">Changes To Configuration File</span>

- A new section \[TOOLTIPS\] that has all the named text sections or
  callbacks you need to access through gbrowse_details
  - **NOTE:** This section must be placed at the end of the \[GENERAL\]
    section.

<a href="../File:Callbacks" class="image"><img
src="../../mediawiki/images/9/92/Callbacks" width="687" height="408"
alt="Callbacks" /></a>

  

- The \[ORF\] configuration stanza used to generate the images above.
  The relevant section is highlighted

<a href="../File:Orf_stanza" class="image"><img
src="../../mediawiki/images/3/30/Orf_stanza" width="749" height="267"
alt="Orf stanza" /></a>

## <span id="Changes_to_Bio::Graphics::Browser" class="mw-headline">Changes to Bio::Graphics::Browser</span>

- Minimal changes to balloons code. Width option introduced to allow
  custom width constraints. Setting the iframe width should hopefully
  make the contents stay inside the balloon boundaries.

<a href="../File:Browsercode" class="image"><img
src="../../mediawiki/images/b/b2/Browsercode" width="666" height="385"
alt="Browsercode" /></a>

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=GBrowse/AJAXhandlerScript&oldid=22092>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](../Special:Categories "Special:Categories"):

- [AJAX](../Category%3AAJAX "Category%3AAJAX")
- [GBrowse](../Category%3AGBrowse "Category%3AGBrowse")

</div>

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">



<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces


- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:GBrowse/AJAXhandlerScript&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>





</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category%3AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category%3AHOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">


- <span id="t-smwbrowselink"><a href="../Special%3ABrowse/GBrowse-2FAJAXhandlerScript"
  rel="smw-browse">Browse properties</a></span>


</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 20:05 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">47,503 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](../GMOD:About "GMOD:About")</span>

<!-- -->






</div>

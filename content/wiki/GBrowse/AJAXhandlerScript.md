---
title: "GBrowse/AJAXhandlerScript"
---
# GBrowse/AJAXhandlerScript

 convert gbrowse_details to an AJAX request
 handler</span>](#Proposal_to_convert_gbrowse_details_to_an_AJAX_request_handler)
 - [Examples](#Examples)
 - [Changes to
 gbrowse_details](#Changes_to_gbrowse_details)
 - [Changes To
 Configuration File](#Changes_To_Configuration_File)
 - [Changes to
 Bio::Graphics::Browser](#Changes_to_Bio::Graphics::Browser)

# Proposal to convert gbrowse_details to an AJAX request handler

**A temporary page to describe a low-impact change to existing code to
provide a built-in ajax handler for Gbrowse**

## Examples

- A balloon hover with contents generated using an AJAX call to
 gbrowse_details and the ***params*** callback shown below

<a href="../File:Sample1b.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/eb/Sample1b.png" width="492" height="239"
alt="Sample1b.png" /></a>

- A sticky balloon with contents generated from gbrowse-details (via an
 \<iframe\> element) and the ***default*** callback shown below.

<a href="../File:Sample2b.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8d/Sample2b.png" width="454" height="364"
alt="Sample2b.png" /></a>

## Changes to gbrowse_details

- A new CGI parameter to invoke the AJAX-handling behavior
 my $rmt = param('remote');

- A response is triggered after the feature(s) are defined but before
 ***PrintTop*** is called.

``` de1
 if (defined $rmt) {
 print header,start_html;
 print remote_content($rmt,$features[0]);
 print end_html;
 exit 0;
 }
```

- The ***remote_content*** subroutine will get the text or coderef. It
 will return the text or execute the callback with user-defined
 arguments

``` de1
 # do something for popup balloons
 sub remote_content {
 my $key = shift; # the key for the text or code-ref in the gbrowse config file
 my $feat = shift;
 my $contents = $CONFIG->config->code_setting('TOOLTIPS',$key) or die "$key is empty";
 my $coderef = (ref $contents|&#39;&#39;) eq 'CODE';
 return $contents unless $coderef;
 # paranoia?
 die "Error: $key is not a CODE-REF" if ref $contents && !$coderef;
 # args are user-defined
 my %args = (feature => $feat) if $feat;
 for my $arg (param()) {
 my @vals = param($arg);
 my $val = @vals > 1 ? \@vals : $vals[0];
 $args{$arg} = $val;
 }
 return $contents->(\%args);
 }
```

## Changes To Configuration File

- A new section \[TOOLTIPS\] that has all the named text sections or
 callbacks you need to access through gbrowse_details
 - **NOTE:** This section must be placed at the end of the \[GENERAL\]
 section.

<a href="../File:Callbacks" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/92/Callbacks" width="687" height="408"
alt="Callbacks" /></a>

- The \[ORF\] configuration stanza used to generate the images above.
 The relevant section is highlighted

<a href="../File:Orf_stanza" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/30/Orf_stanza" width="749" height="267"
alt="Orf stanza" /></a>

## Changes to Bio::Graphics::Browser

- Minimal changes to balloons code. Width option introduced to allow
 custom width constraints. Setting the iframe width should hopefully
 make the contents stay inside the balloon boundaries.

<a href="../File:Browsercode" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b2/Browsercode" width="666" height="385"
alt="Browsercode" /></a>

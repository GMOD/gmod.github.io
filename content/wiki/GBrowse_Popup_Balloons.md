---
title: "GBrowse Popup Balloons"
---
<span id="top"></span>

# <span dir="auto">GBrowse Popup Balloons</span>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/48/Balloon.png" class="thumbborder"
width="414" height="308" alt="Balloon.png" />

## Contents

- [<span class="tocnumber">1</span> <span class="toctext">Using
  Balloons</span>](#Using_Balloons)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Linking
    back to GBrowse</span>](#Linking_back_to_GBrowse)
- [<span class="tocnumber">2</span> <span class="toctext">Customizing
  Balloons</span>](#Customizing_Balloons)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Using AJAX
    and remote content</span>](#Using_AJAX_and_remote_content)
  - [<span class="tocnumber">2.2</span> <span class="toctext">Using
    GBrowse_details as an AJAX Request Handler for Popup
    Balloons</span>](#Using_GBrowse_details_as_an_AJAX_Request_Handler_for_Popup_Balloons)
    - [<span class="tocnumber">2.2.1</span>
      <span class="toctext">Examples</span>](#Examples)
    - [<span class="tocnumber">2.2.2</span>
      <span class="toctext">Changes to
      gbrowse_details</span>](#Changes_to_gbrowse_details)
    - [<span class="tocnumber">2.2.3</span>
      <span class="toctext">Changes To Configuration
      File</span>](#Changes_To_Configuration_File)
- [<span class="tocnumber">3</span> <span class="toctext">Popups in
  Gbrowse 2.0</span>](#Popups_in_Gbrowse_2.0)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Tooltip
    Styles</span>](#Tooltip_Styles)
    - [<span class="tocnumber">3.1.1</span>
      <span class="toctext">GBubble and
      GFade</span>](#GBubble_and_GFade)
    - [<span class="tocnumber">3.1.2</span>
      <span class="toctext">GPlain</span>](#GPlain)
    - [<span class="tocnumber">3.1.3</span>
      <span class="toctext">GBox</span>](#GBox)
  - [<span class="tocnumber">3.2</span> <span class="toctext">Changing
    the global default balloon
    style</span>](#Changing_the_global_default_balloon_style)
  - [<span class="tocnumber">3.3</span>
    <span class="toctext">Configuring Default Tooltip
    Styles</span>](#Configuring_Default_Tooltip_Styles)
  - [<span class="tocnumber">3.4</span> <span class="toctext">Other
    differences</span>](#Other_differences)
    - [<span class="tocnumber">3.4.1</span> <span class="toctext">Cursor
      Tracking</span>](#Cursor_Tracking)
    - [<span class="tocnumber">3.4.2</span>
      <span class="toctext">Overflow and
      Scrollbars</span>](#Overflow_and_Scrollbars)
    - [<span class="tocnumber">3.4.3</span> <span class="toctext">Both
      height and width can be
      constrained</span>](#Both_height_and_width_can_be_constrained)
    - [<span class="tocnumber">3.4.4</span>
      <span class="toctext">Tooltips will not go
      off-screen</span>](#Tooltips_will_not_go_off-screen)
  - [<span class="tocnumber">3.5</span> <span class="toctext">GBox for
    GBrowse 1.7</span>](#GBox_for_GBrowse_1.7)

# <span id="Using_Balloons" class="mw-headline">Using Balloons</span>

GBrowse can display popup balloons when the user hovers over or clicks
on a feature. The balloons can display arbitrary HTML, either provided
in the config file, or fetched remotely via a URL. You can use this
feature to create multiple choice menus when the user clicks on the
feature, to pop up images on mouse hovers, or even to create little
embedded query forms. See
<a href="http://mckay.cshl.edu/balloons2.html" class="external free"
rel="nofollow">http://mckay.cshl.edu/balloons2.html</a> for examples.

In the config file for the database you wish to modify, set \`\`balloon
tips

to a true value:

         [GENERAL]
         ...
         balloon tips = 1

Then add \`\`balloon hover _and/or \`\`balloon click_ options to the
track stanzas that you wish to add buttons to. You can also place these
options in \[TRACK DEFAULTS\] to create a default balloon.

\`\`balloon hover _specifies HTML or a URL that will be displayed when_
the user hovers over a feature. \`\`balloon click _specifies HTML or a_
URL that will appear when the user clicks on a feature. The HTML can
contain images, formatted text, and even controls. Examples:

     balloon hover = <h2>Gene $name</h2>
     balloon click = <h2>Gene $name</h2>
           <a href='<a href="http://www.google.com/search?q=">http://www.google.com/search?q=</a>$name'>Search Google</a><br>
           <a href='<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=pubmed&term=">http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=pubmed&term=</a>$name'>Search NCBI</a><br>

## <span id="Linking_back_to_GBrowse" class="mw-headline">Linking back to GBrowse</span>

It is often useful to include links in a popup balloon that change the
view in GBrowse. Use a callback to get the desired coordinates for the
new view. Example:

```de1
balloon hover = sub   {
      my $feature = shift;
      my $box_content = "";
      if ($feature->strand > 0){
            $box_content .= "<b>Zoom in:</b>&nbsp;<a class=ggbmenu_link href=?q=NC_010473:"
               .($feature->start-25)."..".($feature->start+24)."&enable=DNA target=_self>".$feature->name." N-terminus</a><br>";
     }else{
            $box_content .= "<b>Zoom in:</b>&nbsp;<a class=ggbmenu_link href=?q=NC_010473:"
               .($feature->end-25)."..".($feature->end+24)."&enable=DNA target=_self>".$feature->name." N-terminus</a><br>";
     }
      return $box_content;
 }
```

Note that `&enable=DNA` turns on the DNA track when following the link,
while preserving other track settings.

# <span id="Customizing_Balloons" class="mw-headline">Customizing Balloons</span>

GBrowse supports multiple balloons with different shapes, sizes,
background images and timing properties. There is one built-in balloon,
named "balloon", which should meet most peoples' needs. However, you can
configure any number of custom balloons.

To declare two new balloons, create a "custom balloons" option in the
\[GENERAL\] section:

     custom balloons = [blue_balloon]
                      images   =  /gbrowse/images/blue_balloons
                      maxWidth = 300
                      shadow   = 0

                      [wide_balloon]
                      maxWidth = 800

This creates two new balloons. The first, named "blue_balloon" will look
for its images and icons at the local URL /gbrowse/images/blue_balloons.
It will have a maximum width of 300 pixels, and will cast no shadow. The
second, named "wide_balloon" takes all the defaults for the default
balloon, including the location of its images in the directory
/gbrowse/images/balloons, except that it has a maximum width of 800
pixels. The various balloon options are described well at
[Popup Balloons](Popup_Balloons).

To use the blue balloon rather than the standard one, format the
"balloon hover" and/or "balloon click" options like this:

     balloon click = [blue_balloon] /cgi-bin/get_gene_data?gene=$name

The \[blue_balloon\] keyword tells gbrowse to use the blue balloon for
clicks on these features. The standard balloon is called "balloon", and
so the following two options are equivalent:

     balloon click = /cgi-bin/get_gene_data?gene=$name
     balloon click = [balloon] /cgi-bin/get_gene_data?gene=$name

The images for custom balloons reside in the default location of
/gbrowse/images/balloons, unless indicated otherwise using the
\`\`images _config option. To use custom balloon images, point "images"_
to a a web-accessible directory in your document tree which contains the
seven PNG images described in the
[documentation](Popup_Balloons#Notes_on_balloon_images).

These images must be named as listed below:

     balloon.png     down_right.png  up_right.png
     balloon_ie.png  down_left.png   up_left.png
     close.png

Tips for creating these images can be found
[here](Popup_Balloons#Customization.

## <span id="Using_AJAX_and_remote_content" class="mw-headline">Using AJAX and remote content</span>

Alternatively, you can populate the balloon using data from an HTML page
or dynamic CGI script running on the same server as GBrowse. This uses
AJAX; it can often speed up page loading by reducing the amount of text
that must be downloaded by the client. To dynamically load the balloon
contents from the server, use a balloon hover or balloon click option
like this:

     balloon click = /cgi-bin/get_gene_data?gene=$name

In this case, when the user clicks on the feature, it creates a balloon
whose content contains the HTML returned by the CGI script
\`\`get_gene_data*. GBrowse knows that this is a URL rather than the*
contents of the balloon by looking for the leading slash. However, to
reduce ambiguity, we recommend that you prefix the URL with \`\`url:
_as_ so:

     balloon click = url:/cgi-bin/get_gene_data?gene=$name

This also allows you to refer to relative URLs:

     balloon click = url:../../get_gene_data?gene=$name

It is also possible to fill the balloon with content from a remote
source. Simply specify a full URL beginning with \`\`http: _\`\`https:_
or \`\`ftp:

     balloon hover = <a href="http://www.wormbase.org/db/get?name=">http://www.wormbase.org/db/get?name=</a>$name;class=gene

Note that the balloon library uses an internal \<iframe\> to populate
the balloon with the content of external URLs. This means that vertical
and horizontal scrollbars will appear if the content is too large to be
contained within the balloon. If the formatting does not look right, you
can design a custom balloon of the proper size as described in the next
section.

The usual option value substitution rules (\$name, \$start, etc) work
with balloons, as do callbacks. GBrowse will automatically escapes
single (') and double (\`\`) quotes in the values returned by the
_balloon hover\`\` and_ balloon click\`\` options so that you don't have
to worry about them messing up the HTML.

You might also wish to specify \`\`titles are balloons _in the
\[GENERAL\]_ section:

     [GENERAL]
     titles are balloons = 1

This will generate balloons on all mouse hover events, using the content
that would otherwise have been placed in the built-in browser tooltip.

There is a limited amount of balloon customization that you can perform
within the \[track\] section. If you wish the balloon to be sticky
(require the user to press the close button) even if it is a hover
balloon, then place this option in the \[track section\]:

     balloon sticky = 1

Setting \`\`balloon sticky _to 0 will have the effect of making
balloons_ disappear as soon as the mouse leaves them, even if it was
created by a mouse click event.

If you are displaying content from a remote web or FTP server and you do
not like the height of the balloon, you can adjust the height with the
\`\`balloon height

option:

     balloon height = 400

## <span id="Using_GBrowse_details_as_an_AJAX_Request_Handler_for_Popup_Balloons" class="mw-headline">Using GBrowse_details as an AJAX Request Handler for Popup Balloons</span>

**How to make low-impact changes to existing code to provide a built-in
ajax handler for Gbrowse popup ballons (or other applications**

### <span id="Examples" class="mw-headline">Examples</span>

- A balloon hover with contents generated using an AJAX call to
  gbrowse_details and the **_params_** callback shown below

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/eb/Sample1b.png" width="492" height="239"
alt="Sample1b.png" />

- A sticky balloon with contents generated from gbrowse-details (via an
  \<iframe\> element) and the **_default_** callback shown below.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/8d/Sample2b.png" width="454" height="364"
alt="Sample2b.png" />

### <span id="Changes_to_gbrowse_details" class="mw-headline">Changes to gbrowse_details</span>

- A new CGI parameter to invoke the AJAX-handling behavior

<!-- -->

    my $rmt   = param('remote');

- A response is triggered after the feature(s) are defined but before
  **_PrintTop_** is called.

<!-- -->

    if (defined $rmt) {
      print header,start_html;
      print remote_content($rmt,$features[0]);
      print end_html;
      exit 0;
    }

- The **_remote_content_** subroutine will get the text or coderef. It
  will return the text or execute the callback with user-defined
  arguments

<!-- -->

    # do something for popup balloons
    sub remote_content {
      my $key = shift; # the key for the text or code-ref in the gbrowse config file
      my $feat = shift;
      my $contents = $CONFIG->config->code_setting('TOOLTIPS',$key) or die "$key is empty";
      my $coderef = (ref $contents||'') eq 'CODE';
      return $contents unless $coderef;
      # paranoia?
      die "Error: $key is not a CODE-REF" if ref $contents && !$coderef;
      # args are user-defined
      my %args = (feature => $feat) if $feat;
      for my $arg (param()) {
        my @vals = param($arg);
        my $val  = @vals > 1 ? \@vals : $vals[0];
        $args{$arg} = $val;
      }
      return $contents->(\%args);
    }

### <span id="Changes_To_Configuration_File" class="mw-headline">Changes To Configuration File</span>

- A new section \[TOOLTIPS\] that has all the named text sections or
  callbacks you need to access through gbrowse_details
  - **NOTE:** This section must be placed at the end of the \[GENERAL\]
    section.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/92/Callbacks" width="687" height="408"
alt="Callbacks" />

- The \[ORF\] configuration stanza used to generate the images above.
  The relevant section is highlighted

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/30/Orf_stanza" width="749" height="267"
alt="Orf stanza" />

# <span id="Popups_in_Gbrowse_2.0" class="mw-headline">Popups in Gbrowse 2.0</span>

The upcoming release of GBrowse 2.0 will have some changes to popup
balloons.  
Some key differences are:

### <span id="Tooltip_Styles" class="mw-headline">Tooltip Styles</span>

- There are four tooltip styles offered by default.
- The way they are used in GBrowse has not been changed substantially.
- You can select a particular style of balloon by calling it by name

eg

    balloon hover = [GPlain] This is my message

#### <span id="GBubble_and_GFade" class="mw-headline">GBubble and GFade</span>

This is the original popup balloon from GBrowse 1.69. It has a couple of
new behaviors, including an opacity setting (the example shown has
opacity set to 90%) and fades up to the full opacity setting rather than
abruptly appearing.

- GBubble the the default balloon style, so the \[GBubble\] name is
  optional.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e3/GBubble.png" class="thumbborder"
width="358" height="199" alt="GBubble.png" />

Example configuration

```
balloon hover = [GBubble] I am 'GBubble', the <i>classic</i> GBrowse popup balloon!
```

- GFade is identical to GBubble except that it fades into view rather
  than just popping up. This is accomplished by starting out transparent
  and gradually increasing the opacity over a span of 1200 msec.

#### <span id="GPlain" class="mw-headline">GPlain</span>

The GPlain style is a plainer style of balloon tooltip but still offers
fully HTML formatted contents, opacity, etc. The default configuration
has opacity set to 85% and cursor tracking enabled, so the tooltip will
follow the mouse until you mouseout from the text or image the tooltip
is attached to.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/83/GPlain.png" class="thumbborder"
width="515" height="172" alt="GPlain.png" />

Example configuration

```
balloon hover = [GPlain] I am 'GPlain', I am less fancy!
```

#### <span id="GBox" class="mw-headline">GBox</span>

GBox is a formatted box. It can have fixed dimensions or resize
dynamically (actually, this is true of all balloon tooltips).

- For sticky boxes, if the contents are too big, scrollbars will appear.
- The GBox style is used for the inline track configuration (called by
  clicking "?" in the titlebar for each track).
- You can also use is anywhere else in Gbrowse using the '\[GBox\]'
  name.

An example track configuration box  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/4a/GBox.png" class="thumbborder" width="672"
height="343" alt="The GBox style" />

An example showing a box resized to stay onscreen, despite a small
window.  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/43/RidiculouslySmallWindow.png"
class="thumbborder" width="447" height="504"
alt="This is too small" />

Example configuration:

```
balloon hover = [GBox] I am a box.
```

### <span id="Changing_the_global_default_balloon_style" class="mw-headline">Changing the global default balloon style</span>

The balloon style used by default is 'GBubble'. This can be changed
using the 'balloon style' option in either GBrowse.conf or in the
configuration file for individual data sources.

    # use GBubble as the default balloon style
    balloon style = GBubble

### <span id="Configuring_Default_Tooltip_Styles" class="mw-headline">Configuring Default Tooltip Styles</span>

Default balloon style options are configured in the file
balloon.config.js, which comes with the distribution. Many display
options are configurable, see
[Popup_Balloons#Customization](Popup_Balloons#Customization "Popup Balloons")
for details.

below is the default configuration applied to all balloon styles
balloon.config.js

```
  ////////////////////////////////////////////////////////////////
  // The default "base" config applied to all balloon objects.  //
  // See http://gmod.org/wiki/Popup_Balloons#Customization for  //
  // details about config options                               //
  //                                                            //
  // values can be overridden in custom config cases (see below) //
  ////////////////////////////////////////////////////////////////
  if (!balloon.configured) {                                    //
    balloon.fontColor          = 'black';                       //
    balloon.fontFamily         = 'Arial, sans-serif';           //
    balloon.fontSize           = '12pt';                        //
    balloon.minWidth           = 100;                           //
    balloon.maxWidth           = 400;                           //
    balloon.delayTime          = 750;                           //
    balloon.vOffset            = 10;                            //
    balloon.hOffset            = 10;                            //
    balloon.stem               = true;                          //
    balloon.balloonImage       = 'balloon.png';                 //
    balloon.upLeftStem         = 'up_left.png';                 //
    balloon.downLeftStem       = 'down_left.png';               //
    balloon.upRightStem        = 'up_right.png';                //
    balloon.downRightStem      = 'down_right.png';              //
    balloon.closeButton        = 'close.png';                   //
    balloon.closeButtonWidth   = 16;                            //
    balloon.allowAJAX          = true;                          //
    balloon.allowIframes       = true;                          //
    balloon.configured         = true;                          //
    balloon.trackCursor        = true;                          //
  }                                                             //
  ////////////////////////////////////////////////////////////////
```

Below is the syntax for default configuration for the three styles above
in balloon.config.js

```

  ////////////////////////////////////////////////////////////////
  // Custom configuration options -- Add a case below for your  //
  // config set (GBrowse defaults: GBox, GPlain and GBubble)    //
  ////////////////////////////////////////////////////////////////
  switch(set) {

    // A formatted box (no background image)
    case('GBox') :
      balloon.bgColor     = 'lightgoldenrodyellow';
      balloon.borderStyle = '2px solid gray';
      balloon.padding     = 5;
      balloon.shadow      = 0;
      balloon.stem        = false;
      balloon.opacity     = 90;
      break;

    // A simple balloon
    case('GPlain') :
      balloon.padding     = 5;
      balloon.shadow      = 0;
      balloon.stemHeight  = 15;
      balloon.stemOverlap = 1;
      balloon.opacity     = 85;
      break;

    // The original cartoon bubble
    case('GBubble') :
      balloon.ieImage     = 'balloon_ie.png';
      balloon.shadow      = 20;
      balloon.padding     = 10;
      balloon.stemHeight  = 32;
      balloon.stemOverlap = 3;
      balloon.vOffset     = 1;
      balloon.hOffset     = 1;
      balloon.opacity     = 85;
      break;

    // The cartoon bubble with a fade-in effect
    case('GFade') :
      balloon.ieImage     = 'balloon_ie.png';
      balloon.shadow      = 20;
      balloon.padding     = 10;
      balloon.stemHeight  = 32;
      balloon.stemOverlap = 3;
      balloon.vOffset     = 1;
      balloon.hOffset     = 1;
      balloon.opacity     = 85;
      balloon.allowFade   = true;
      balloon.trackCursor = false;
      break;
  }
```

### <span id="Other_differences" class="mw-headline">Other differences</span>

#### <span id="Cursor_Tracking" class="mw-headline">Cursor Tracking</span>

- By default, the position of non-sticky balloons (or boxes) will follow
  the mouse cursor until it leaves the text or image that triggered the
  balloon tooltip.

<!-- -->

- This option can be disabled via balloon.config.js

<!-- -->

     balloon.trackCursor = false;

#### <span id="Overflow_and_Scrollbars" class="mw-headline">Overflow and Scrollbars</span>

- When the size of the balloon contents exceeds the balloon (or box)
  size, two new behaviors have been introduced:

1.  for sticky tooltips, scrollbars will appear.
2.  for non-sticky tooltips, excess contents will be clipped (hidden).
    Note this will not usually happen unless the size of the balloons
    has been explicitly constrained. Reasonable care must be taken here,
    as popup balloons are not mean to contain contents exceeding
    500-600px width and height in any case.

#### <span id="Both_height_and_width_can_be_constrained" class="mw-headline">Both height and width can be constrained</span>

Height and width arguments are supported. In cases where the balloon
contents are smaller than the specified dimensions, the balloon or box
will shrink to fit. However, oversize contents will trigger clipping for
non-sticky balloons and scrollbars for sticky balloons

#### <span id="Tooltips_will_not_go_off-screen" class="mw-headline">Tooltips will not go off-screen</span>

Tooltips will automatically resize to stay inside the visible window.
Again, reasonable limits apply.

### <span id="GBox_for_GBrowse_1.7" class="mw-headline">GBox for GBrowse 1.7</span>

Most of the new tooltip feayures described above are specific to GBrowse 2. The following is a recipe to add a GBox-style tooltips to Gbrowse
1.7.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/42/GBoxretro.png" class="thumbborder"
width="440" height="263" alt="GBoxretro.png" />

1\) Add the image Box.png (broken link removed) to /var/www/html/gbrowse/images/balloons (or
wherever you have installed the gbrowse images on your web server).

2. Add the following text to the top of you GBrowse configuration file.
   It must be in the \[GENERAL\] section.

```
custom balloons = [GBox]
                  balloonImage  = Box.png
                  stem          = 0
                  vOffset       = 20
                  hOffset       = 20
                  padding       = 1
                  shadow        = 0
```

3. Add this function to the top of your configuration file (in the
   \[GENERAL\] section). This is a generic function to display all feature
   attributes in a formatted table. It is not strictly necessary to use a
   function like this, as you can put whatever you want in the tooltip. Be
   sure to get rid of any cut and paste artifacts like line wrapping, each
   new line of the code (including the closing brace) must start with at
   least one white space character.

```de1
# A generic function to display a table of all attribute values
# for a feature object
init_code =
 sub tooltip {
    my $f = shift;
    my $name = $f->name;
    my @tags = $f->all_tags;
    my $chr = $f->seq_id;
    $chr .= ':' . $f->start . '..' . $f->end;
    my $retval = qq([GBox] <table>);
    $retval   .= qq(<tr><th style="color:white;background:blue;margin:-2px" colspan=2>$name ($chr)</th></tr>);
 
    for my $tag (sort @tags) {
      my ($val) = $f->get_tag_values($tag);
      $retval .= qq(<tr valign=TO><td><b>$tag</b></td><td>$val</td>);
    }
 
    return $retval . "</table>";
  }
```

4\) Add the balloon tooltip option to the configuration stanza for your
track(s)

    balloon hover = sub {tooltip(shift)}

The above example passes the feature object to the tooltips function you
added to the init_code section. More simply, you could just do:

balloon hover = \[GBox\] Whatever text you want goes here.... balloon
click = \[GBox\] Whatever sticky text ...

[Categories](Special%253ACategories "Special%253ACategories"):

- [AJAX](Category%253AAJAX "Category%253AAJAX")
- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")
- [Javascript](Category%253AJavascript "Category%253AJavascript")
- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
- [HOWTO](Category%253AHOWTO "Category%253AHOWTO")

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/GBrowse_Popup_Balloons" rel="smw-browse">Browse
  properties</a></span>

- <span id="footer-info-lastmod">Last updated at 20:06 on 8 October 2012.</span>
<!-- - <span id="footer-info-viewcount">267,760 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->

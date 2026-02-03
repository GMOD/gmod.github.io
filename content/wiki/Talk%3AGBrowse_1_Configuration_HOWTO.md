---
title: "Talk%253AGBrowse 1 Configuration HOWTO"
---




<span id="top"></span>


# <span dir="auto">Talk%253AGBrowse 1 Configuration HOWTO</span>









Hello Reg. GFF file format: I was wondering if the group/region field
has to be (now or in the future) of the format

     ##sequence-region

I think Apollo (but not Artemis) breaks if that is not included.

[Alpapan](User%253AAlpapan "User%253AAlpapan")

_The current version of Apollo does require sequence-region, but I just
chatted with the developer and he is removing the requirement that it be
there; he thought it was required by the GFF3 spec. Of course, this
question would probably have been better asked on the Apollo mailing
list: <a href="http://mail.fruitfly.org/mailman/listinfo/apollo"
class="external free"
rel="nofollow">http://mail.fruitfly.org/mailman/listinfo/apollo</a>_
--[Scott](User%253AScott "User%253AScott") 16:21, 29 January 2008 (EST)

Ah, thanks Scott  
I also was under the impression it was in the
<a href="http://www.sequenceontology.org/gff3.shtml"
class="external text" rel="nofollow">GFF3 spec</a>.

     This element is optional, but strongly encouraged because it allows parsers to perform bounds checking on features.

So I assumed that it was GBrowse that did not follow the spec.
[Alpapan](User%253AAlpapan "User%253AAlpapan")

## <span id=".2A_-.3E_h3_for_track_properties.2C_etc.2C_easier_on_the_eyes.3F" class="mw-headline">\* -\> h3 for track properties, etc, easier on the eyes?</span>

I ran a snippet of code...

    s/^\*(.+)\n/===$1===\n/

...to produce the following
<a href="GBrowse_Configuration_HOWTO/bullets2h3" class="mw-redirect"
title="GBrowse Configuration HOWTO/bullets2h3">output</a>. If anyone
cares, I think it lets the track properties - which are currently
bulleted - stand out a bit more, making them easier to find. (check the
General \[SECTION\] for an example.)
--[Stewarta](User%253AStewarta "User%253AStewarta") 13:43, 14 March 2008 (EDT)

## <span id="Declaring_New_Aggregators" class="mw-headline">Declaring New Aggregators</span>

i think it should be

     aggregators = transcript{....

not

     aggregator = transcript{....

At least with my gbrowse dev branch... I didn't edit it in case i 'm
wrong. [Alpapan](User%253AAlpapan "User%253AAlpapan")

_Agreed and fixed. Thanks. [Scott](User%253AScott "User%253AScott") 23:13, 11
June 2008 (EDT)_

## <span id="Renaming_proposal.3F" class="mw-headline">Renaming proposal?</span>

Hi, I propose that this article is renamed 'Configuring
GBrowse', and that we start to split it up into sub documents by
heading. Each sub document would be categorized 'GBrowse configuration'.
It's just so large and unwieldy - I think lots of stuff, especially
advanced functionality could be split out.
--[DanBolser](User%253ADanBolser "User%253ADanBolser") 13:41, 22 May 2009 (UTC)

So I started doing this finally (since the discussion reached
consensus). If people want the mega-doc back for some reason, it can be
dynamically re-created from the individual pages on the wiki by
'transcluding' content from the individual pages into another 'calling'
page. For example, to include the content of [GBrowse
Configuration/Balloons](GBrowse_Configuration/Balloons "GBrowse Configuration/Balloons")
in another page, you just type Balloons on
that page. Note the use of the 'noinclude' tags in the above page allows
text (a header) in the individual pages that is not transcluded into the
calling page. --[DanBolser](User%253ADanBolser "User%253ADanBolser") 01:13, 10
July 2010 (UTC)








## Navigation menu




### Namespaces

- <span id="ca-talk"><a href="Talk%253AGBrowse_1_Configuration_HOWTO" accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>


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




- <span id="footer-info-lastmod">Last updated at 16:44 on 15 August 2011.</span>
<!-- - <span id="footer-info-viewcount">24,372 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->



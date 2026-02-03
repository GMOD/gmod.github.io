---
title: "Talk%253AGBrowse syn"
---




<span id="top"></span>




# <span dir="auto">Talk%253AGBrowse syn</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Upcoming
  Hackathon (7/11/2010)</span>](#Upcoming_Hackathon_.287.2F11.2F2010.29)
  - [<span class="tocnumber">1.1</span> <span class="toctext">User
    interface</span>](#User_interface)
    - [<span class="tocnumber">1.1.1</span> <span class="toctext">YES WE
      CAN!</span>](#YES_WE_CAN.21)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">Database</span>](#Database)
  - [<span class="tocnumber">1.3</span> <span class="toctext">Behind the
    scenes</span>](#Behind_the_scenes)
  - [<span class="tocnumber">1.4</span>
    <span class="toctext">Miscellaneous</span>](#Miscellaneous)
- [<span class="tocnumber">2</span> <span class="toctext">Report on the
  hackathon failure (and lessons to be
  learned)</span>](#Report_on_the_hackathon_failure_.28and_lessons_to_be_learned.29)



## <span id="Upcoming_Hackathon_.287.2F11.2F2010.29" class="mw-headline">Upcoming Hackathon (7/11/2010)</span>

Here are some ideas for things to work on w.r.t GBsyn dev. etc.

### <span id="User_interface" class="mw-headline">User interface</span>

- The tracks don't 'feel' like GB 2.0 tracks, and are described in the
  manual as 'gbrowse-like'. Why can't we have proper GBrowse tracks?
  Wouldn't this allow a lot of code to be refactored?
- I'd like to use my existing track configuration to configure tracks in
  GBsyn. Additional options could be added to the GBsyn conf to turn
  tracks off, because its a pain to reconfigure them all from scratch
  again (especially using GBrowse 1.7 syntax) for GBsyn.
- I'd like a global configuration file, like GBrowse 2.0 now has. To get
  anything up and running you need a specific config file, which feels
  wrong somehow.
- Sometimes the alignment is broken into blocks (each one should be a
  bona fide GB track remember) can we have a uniform scale across all
  blocks? I think small blocks are sometimes drawn to a different scale.
  - The rendering of rulers in small blocks is crappy.

<!-- -->

- People like circos output. I'm not crazy about it, but it could be a
  nice feature to develop, esp. w.r.t. gbrowse 'overview' tracks.

<!-- -->

- Debugging mode would be nice, mysterious failures are a pain in the
  assets.

#### <span id="YES_WE_CAN.21" class="mw-headline">YES WE CAN!</span>

- Allow users to re-position and re-orient blocks of the sequence. For
  example, one sequence may be composed of a set of 'BAC' features. You
  could allow users to flip and drag BACs around on the sequence so as
  to maximize synteny (while also visualizing the associated paired end
  data, naturally), and then write out the changes in some format.
  - By looking at the sequence ontology, you can determine which
    features are sequence components, and can therefore be moved in such
    a way.

### <span id="Database" class="mw-headline">Database</span>

- Make the use of 'namespace' (database table prefixes) for alignment
  data the norm.
  - Add support for namespaces. (It's all too easy for one dataset to
    trash another).
  - Make a GFF3 loader, dammit!

### <span id="Behind_the_scenes" class="mw-headline">Behind the scenes</span>

- Oh, also, could you go ahead and make GBrowse_syn run under fastcgi?
  kthxbai

### <span id="Miscellaneous" class="mw-headline">Miscellaneous</span>

- The GBsyn 'alignment blocks' look really nice. Can you add something
  similar to GBrowse to guide the eye between the overview, region and
  details panels?

## <span id="Report_on_the_hackathon_failure_.28and_lessons_to_be_learned.29" class="mw-headline">Report on the hackathon failure (and lessons to be learned)</span>

Only joking, there was a lot of basic ground work to get through before
the above feature requests could even begin to be tackled efficiently.
Here is the skinny:

<a href="https://www.nescent.org/wg_gmodevohackathon/GBrowse_syn2"
class="external free"
rel="nofollow">https://www.nescent.org/wg_gmodevohackathon/GBrowse_syn2</a>








## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AGBrowse_syn" accesskey="t"
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




- <span id="footer-info-lastmod">Last updated at 18:02 on 15 November
  2010.</span>
<!-- - <span id="footer-info-viewcount">24,848 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





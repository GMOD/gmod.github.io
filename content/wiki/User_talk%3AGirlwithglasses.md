---
title: "User talk:Girlwithglasses"
---




<span id="top"></span>




# <span dir="auto">User talk:Girlwithglasses</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">GMOD website
  feedback extension</span>](#GMOD_website_feedback_extension)
  - [<span class="tocnumber">1.1</span> <span class="toctext">In
    brief</span>](#In_brief)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Possible
    plug in uses</span>](#Possible_plug_in_uses)
  - [<span class="tocnumber">1.3</span>
    <span class="toctext">Details</span>](#Details)



## <span id="GMOD_website_feedback_extension" class="mw-headline">GMOD website feedback extension</span>

### <span id="In_brief" class="mw-headline">In brief</span>

A tool to allow anyone to submit a comment or feedback on any page of
the GMOD wiki.

### <span id="Possible_plug_in_uses" class="mw-headline">Possible plug in uses</span>

- Rate this page - give feedback on how easy/difficult a tutorial or
  piece of documentation is to follow
- Geographic location - two possible uses:

1.  1.  Express interest in having a GMOD workshop/meeting in a certain
        area
    2.  Add your DB and location to the [GMOD
        Users](GMOD_Users "GMOD Users") list

- Generic feedback - send a message to GMOD help if something is broken
  (e.g. OpenID login!) or a mistake is found

### <span id="Details" class="mw-headline">Details</span>

- clicking a link/button/icon brings up a form for submitting feedback
  - use jQuery to bring up form as a modal dialogue box

<!-- -->

- the extension should allow anyone, whether they are a member of the
  wiki or not, to give feedback
  - if the person is a logged-in wiki member, record their name
  - ask for name/email otherwise

<!-- -->

- form should be configurable
  - store the form in a Template page on the wiki? Or in its own
    namespace? See Mediawiki Widgets for examples of widgets in their
    own namespace
  - embed a locally-stored form (i.e. store the form html on the server
    and present it in an iframe)?
  - have the form content dynamically created from some sort of
    shorthand specification? e.g.

<!-- -->

     <feedback>
     [{ label = 'Name',
        name = username,
        type = text,
        value = ,
        required = true,
      },
      { label = 'Rate the contents of this page',
        name = page_rating,
        type = radio,
        value = ['poor','ok','good'],
        required = true,
      }]
     </feedback>

- how do we stop users from sabotaging the form, either accidentally or
  deliberately?
  - security risks?

<!-- -->

- some method for blocking automated submissions is required -- i.e. a
  captcha

<!-- -->

- submitting and storing form data:
  - how/where to store it?
    - in the wiki itself
      - investigate how existing ratings extensions store their data
    - in a local text file or database
    - in a remote text file or db, e.g. in Google docs
    - email the data

<!-- -->

- can the plugin appear on every page in a category without having to
  manually add it to each page?








## Navigation menu



### Namespaces

- <span id="ca-nstab-user"><a href="User%253AGirlwithglasses" accesskey="c"
  title="View the user page [c]">User page</a></span>
- <span id="ca-talk"><a href="User_talk%253AGirlwithglasses" accesskey="t"
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




- <span id="footer-info-lastmod">Last updated at 14:15 on 1 July
  2013.</span>
<!-- - <span id="footer-info-viewcount">35,056 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





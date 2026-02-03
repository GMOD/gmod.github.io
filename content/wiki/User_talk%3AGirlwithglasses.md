---
title: "User talk:Girlwithglasses"
---
# User talk:Girlwithglasses

  feedback extension</span>](#GMOD_website_feedback_extension)
  - [In
    brief](#In_brief)
  - [Possible
    plug in uses](#Possible_plug_in_uses)
  - [Details](#Details)

## GMOD website feedback extension

### In brief

A tool to allow anyone to submit a comment or feedback on any page of
the GMOD wiki.

### Possible plug in uses

- Rate this page - give feedback on how easy/difficult a tutorial or
  piece of documentation is to follow
- Geographic location - two possible uses:

1.  1.  Express interest in having a GMOD workshop/meeting in a certain
        area
    2.  Add your DB and location to the [GMOD
        Users](/wiki/GMOD_Users) list

- Generic feedback - send a message to GMOD help if something is broken
  (e.g. OpenID login!) or a mistake is found

### Details

- clicking a link/button/icon brings up a form for submitting feedback
  - use jQuery to bring up form as a modal dialogue box
- the extension should allow anyone, whether they are a member of the
  wiki or not, to give feedback
  - if the person is a logged-in wiki member, record their name
  - ask for name/email otherwise
- form should be configurable
  - store the form in a Template page on the wiki? Or in its own
    namespace? See Mediawiki Widgets for examples of widgets in their
    own namespace
  - embed a locally-stored form (i.e. store the form html on the server
    and present it in an iframe)?
  - have the form content dynamically created from some sort of
    shorthand specification? e.g.
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
- some method for blocking automated submissions is required -- i.e. a
  captcha
- submitting and storing form data:
  - how/where to store it?
    - in the wiki itself
      - investigate how existing ratings extensions store their data
    - in a local text file or database
    - in a remote text file or db, e.g. in Google docs
    - email the data
- can the plugin appear on every page in a category without having to
  manually add it to each page?

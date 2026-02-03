---
title: "Talk%253AGBrowse syn"
---
# Talk%253AGBrowse syn


  Hackathon (7/11/2010)</span>](#Upcoming_Hackathon_.287.2F11.2F2010.29)
  - [User
    interface](#User_interface)
    - [YES WE
      CAN!](#YES_WE_CAN.21)
  - [Database](#Database)
  - [Behind the
    scenes](#Behind_the_scenes)
  - [Miscellaneous](#Miscellaneous)
- [Report on the
  hackathon failure (and lessons to be
  learned)](#Report_on_the_hackathon_failure_.28and_lessons_to_be_learned.29)


## Upcoming Hackathon (7/11/2010)

Here are some ideas for things to work on w.r.t GBsyn dev. etc.

### User interface

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
- People like circos output. I'm not crazy about it, but it could be a
  nice feature to develop, esp. w.r.t. gbrowse 'overview' tracks.
- Debugging mode would be nice, mysterious failures are a pain in the
  assets.

#### YES WE CAN!

- Allow users to re-position and re-orient blocks of the sequence. For
  example, one sequence may be composed of a set of 'BAC' features. You
  could allow users to flip and drag BACs around on the sequence so as
  to maximize synteny (while also visualizing the associated paired end
  data, naturally), and then write out the changes in some format.
  - By looking at the sequence ontology, you can determine which
    features are sequence components, and can therefore be moved in such
    a way.

### Database

- Make the use of 'namespace' (database table prefixes) for alignment
  data the norm.
  - Add support for namespaces. (It's all too easy for one dataset to
    trash another).
  - Make a GFF3 loader, dammit!

### Behind the scenes

- Oh, also, could you go ahead and make GBrowse_syn run under fastcgi?
  kthxbai

### Miscellaneous

- The GBsyn 'alignment blocks' look really nice. Can you add something
  similar to GBrowse to guide the eye between the overview, region and
  details panels?

## Report on the hackathon failure (and lessons to be learned)

Only joking, there was a lot of basic ground work to get through before
the above feature requests could even begin to be tackled efficiently.
Here is the skinny:

<a href="https://www.nescent.org/wg_gmodevohackathon/GBrowse_syn2"
class="external free"
rel="nofollow">https://www.nescent.org/wg_gmodevohackathon/GBrowse_syn2</a>

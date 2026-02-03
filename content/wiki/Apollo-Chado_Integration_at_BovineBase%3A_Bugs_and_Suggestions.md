---
title: "Apollo-Chado Integration at BovineBase: Bugs and Suggestions"
---
# Apollo-Chado Integration at BovineBase: Bugs and Suggestions


This was written by Justin Reese in preparation for [Hackathon
2007](Hackathon_2007_info "Hackathon 2007 info").

In preparation for the Bovine Annotation effort, we set up a
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> database
containing annotation evidence, allow annotators to connect via
[Apollo](Apollo.1 "Apollo") and do their annotations (we haven't gotten
Apollo-\>Chado writebacks working yet, but we'd like to eventually).

We thought it might help GMOD developers improve [Apollo/Chado
interoperability](Apollo-Chado "Apollo-Chado") to get some feedback from
the Apollo users (annotators) and developers (the ones who set up our
Chado db). So, below are some bug reports and suggestions that compiled
from annotators and developers involved in the Bovine Genome annotation
effort. I will be fleshing this out in the next 12-24 hours, hopefully
before the hackathon starts hacking, but feel free to contact me if
something isn't clear.

## Bugs

- Apollo crashes when opening some genes from the opening Chado dialog
  box. These genes tend to be near scaffold edges, but not all genes
  near edges cause this error. Example - connect to
  genomes.tamu.edu:5432, id: nobody, no pwd, open (by type of region:
  gene) GLEAN_00599. Apollo outputs this on
  stderr:"java.langStringIndexOutOfBoundsException: String index out of
  range:-2858" and either throws up an empty dialog box, or a dialog box
  saying "Can't load region", after which Apollo dies on some machines,
  but continues on on other machines (e.g. my macbook) but in a very
  strange, unusable error state.
- Pulling down a piece of evidence into the annotation tier to start an
  annotation worked fine for most types of evidence, but not for some
  (ESTs, I think were one class that did not work).
- Pulling down a single exon and trying to add it to an existing
  annotation never worked. This is always a bit touchy, because the
  sweet spot (where you must position the exon over the existing
  annotation before dropping it) is a bit small. But I could not get it
  to work for the life of me, and I tried multiple times with various
  different genes, working with various different people.
- When Chado analysis data is opened (via jdbc), and BLAST results are
  layered on top, occasionally, but not always, blast results are on the
  wrong strand, similar to this bug: <a
  href="http://sourceforge.net/tracker/index.php?func=detail&amp;aid=1713046&amp;group_id=27707&amp;atid=462763"
  class="external free"
  rel="nofollow">http://sourceforge.net/tracker/index.php?func=detail&amp;aid=1713046&amp;group_id=27707&amp;atid=462763</a>
- Long timeout (a few minutes) during start up when network is
  unavailable. When Apollo starts, JDBC seems to automatically send a
  query out to the last database (I think to retrieve the chromosome
  names for the pull-down menu). This can result in a very long start up
  if the network is down or if the database in question is unavailable
  for some reason. Is there a way we could delay this db query until the
  user asks for it?

## A few ideas for future improvements

1.  Move as much Apollo configuration stuff as possible out of conf
    files like `chado-adapter.xml`, and instead query the user or the
    database, e.g:
    - Allow user to enter URLs, id's, password for Chado databases like
      they would in a web browser, rather than having them specified in
      `chado-adapter.xml`
    - Have apollo retrieve "track" information from Chado's 'analysis'
      table, rather than specifying them in `chado-adapter.xml`
      (searchHitPrograms, genePredictionPrograms, etc).

    Our annotators aren't particularly good at installing conf files\*
    and are spread out all over the world, so we can't really do it for
    them. Having things like tracks names and URLs hard-coded in conf
    files forces us to distribute new conf files to our annotators when
    we change something and hope they do it correctly. This hasn't
    always gone smoothly. Ideally, whenever possible, we would just
    change our Chado database (add a track or change our URL for
    example), and Apollo would automatically get hip by querying the
    Chado database or the user.
    \*no offense, if any of you annotators are reading this
2.  Simplify track naming schemes in Apollo conf files - the names of
    the tracks are a little complex and hard to understand for the
    uninitiated developer, and it's not always clear which one to use.
    For example, during my first foray, I naively tried loading
    repeatmasker results under searchHitPrograms, not realizing that
    searchHitPrograms are always alignments between the reference
    sequence and a second sequence. Not sure if I can suggest an
    intelligent improvement, but would it be possible to construct
    tracks like you do in [GBrowse](GBrowse.1 "GBrowse") (using
    aggregators and the names of the things I would like to aggregate,
    like gene/trancript/CDS) or have Apollo construct them automatically
    using some SQL magic (query for a parent, query for it's children,
    query for the children's children, etc?). Just a thought, this is
    probably asking a lot.

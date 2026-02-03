---
title: "MOD Face Summary"
---
# MOD Face Summary

### Meeting Report 

Model Organism Database User Interface Caucus  

GMOD Meeting, January 18, 2007, San Diego, CA, USA

# Executive Summary

The user interface (UI) is the most visible aspect of a model organism
database (MOD), and arguably has the most direct impact on the
satisfaction of its users. On the first day of the January 2007 GMOD
meeting, we shared experiences, discussed lessons learned, and
identified unsolved problems in the field of MOD user interface design.
To drive the discussion, representatives of several MODs (including both
model and multi-organism databases) presented aspects of their UI that
related to a common set of use cases. This brought to light several
useful topics that that are not widely known, and that new and old MODs
can benefit from.

**General lessons learned:** Clarity in actions required of users, and
clarity and reliability of results of these are important to users.
Contextual examples and *help* links are very useful to users.
Appearance is less important to users than functionality and
responsiveness. Developing good UIs takes sustained work, including
feedback and community testing. **Complexity is an inherent problem:**
MODs deal with rich, complex data that is constantly expanding and
changing. A central challenge for a MOD's user interface is to make
common tasks easy and complex tasks possible. This problem is addressed
through user interface design, engineering of site infrastructure, and
user education and documentation. There is a need at many MODs for
broader availability of power-user interfaces for complex queries, for
uploading and operating on sets of genes in one step, and for flexible
configuration of data output formats. **Good new ideas in development:**
Wikipedia provides an excellent example for science community
participation that several MODs are adopting. More dynamic web content
and graphical summaries can help manage information. Interactive
auto-complete of words typed in search boxes gives users immediate
feedback. Google can be harnessed to aid, but is not solely sufficient
for, searching MOD data. Providing "server snapshots" is a useful
mechanism for keeping older database versions available.  
  

  Model Organism Database User Interface Caucus GMOD Meeting, January
  18, 2007, San Diego, CA,
  USA</span>](#Meeting_Report_.0AModel_Organism_Database_User_Interface_Caucus.0AGMOD_Meeting.2C_January_18.2C_2007.2C_San_Diego.2C_CA.2C_USA)
- [Executive
  Summary](#Executive_Summary)
- [Participants
  and Presentations](#Participants_and_Presentations)
- [Detailed
  Report](#Detailed_Report)
  - [Addressing
    Six MOD Use Cases](#Addressing_Six_MOD_Use_Cases)
  - [User
    Interface Development](#User_Interface_Development)
    - [Lessons Learned from
      Experience](#Lessons_Learned_from_Experience)
    - [Gathering and Analyzing User
      Feedback](#Gathering_and_Analyzing_User_Feedback)
      - [Using User Feedback to Guide UI
        Design](#Using_User_Feedback_to_Guide_UI_Design)
      - [Site Logging](#Site_Logging)
      - [Card Sorting](#Card_Sorting)
      - [Watching Users](#Watching_Users)
    - [Balancing Completeness and
      Simplicity](#Balancing_Completeness_and_Simplicity)
  - [New Trends
    in MOD UIs](#New_Trends_in_MOD_UIs)
    - [Community
      Participation](#Community_Participation)
    - [Client-side Scripting
      (JavaScript)](#Client-side_Scripting_.28JavaScript.29)
    - [Using
      Virtualization for MOD
      Snapshots](#Using_Virtualization_for_MOD_Snapshots)
  - [Using
    Google and Other General Search
    Engines](#Using_Google_and_Other_General_Search_Engines)
  - [User
    Interface Conventions](#User_Interface_Conventions)
  - [General
    Discussion](#General_Discussion)
  - [Implementation
    Techniques](#Implementation_Techniques)
- [References](#References)

# Participants and [Presentations](MOD_Face_Talks "MOD Face Talks")

This meeting drew together some 60 biologists, bioinformaticians and
other interested people, representing more than 25 database projects and
organizations. The list of attendees is
[here](MOD_Participants "MOD Participants"). The day included thirteen
presentations, and a round table discussion at the end. Slides and text
summaries of individual presentations are provided at the [MOD Face
Talks](MOD_Face_Talks "MOD Face Talks") page.

# Detailed Report

## Addressing Six MOD Use Cases

*Many simple/quick/global searches.* Most MODs have some variation of a
"search everything" option that is the primary search entry. Simple
searches at MODs vary principally in the details of data classes (which
were searched and whether or not they needed to be specified) and how
terms are matched (exact, partial, phrase and/or wildcard). These types
of simple searches must balance ease of use with relevance of results.
How results can be handled also varies between MODs. Various MODs allow
searches and results to be saved, refined, downloaded and/or exported to
other tools. One challenge is how to support user expectations to make
"simple" searches that return quality answers. The TAIR presentation
details a several-year process to determine best functionality of simple
search from user feedback: it takes effort to develop "simple and quick"
searches that return what biologists really looking for. We note that
"simple" searches present a trade-off between simplicity of specifying
the query and simplicity of searching through the returned results. In
the case that a keyword entered into a "simple search" box returns only
a few results, merely listing the results is sufficient. In the case
that such a search returns many results, often of different types, it
makes sense to do one of the following 1) structure the returned
information by "type", list the types and show the first few of that
type, allowing the user to expand/contract those lists by type, 2)
permit the user at this point to interact to choose to either further
limit the returned results or to page through the results. The
threshold at which one strategy is preferable to another needs to be
determined through user studies.

*Gene page reports.* Most MODs agree that users like short summaries and
graphical presentations of data. Individual MODs vary widely in
deciding how much detail is displayed in the default view. Individual
MODs struggle with how to direct users, in an obvious manner, toward
deeper levels of information.

*Advanced/attribute searches.* Many MODs allow some sort of advanced
search where users can specify search criteria over multiple data types.
Some MODs (e.g. NCBI, ApiDB) allowed query histories to be combined,
allowing for complex, refined searches and results, and others (FlyMine)
provide this functionality through set operations on 'bags' of objects.

*User choices in data reports.* This is an acknowledged weak aspect at
many MODs. Most have yet to develop systems that allow users to fully
customize reports. The basic state is that users parse information from
a given MOD's defined formats (which tend to vary between MODs). Some
MODs (e.g. FlyMine, FlyBase) allow choice of output columns and their
order.

*UIs for bulk data handling.* Many MODs allow some sort of bulk query,
although the allowed data types varys.
<a href="http://www.biomart.org/" class="external text"
rel="nofollow">BioMart</a> provides a common UI that is used at several
MODs
(<a href="http://www.wormbase.org/BioMart/martview" class="external text"
rel="nofollow">WormBase</a>,
<a href="http://www.gramene.org/Multi/martview" class="external text"
rel="nofollow">Gramene</a>,
<a href="http://www.dictybase.org/biomart/martview"
class="external text" rel="nofollow">DictyBase</a>,
<a href="http://insects.eugenes.org/BioMart/martview"
class="external text" rel="nofollow">DroSpeGe</a>) for bulk data search
and retrieval, and is in development at others. Some MODs (e.g. FlyMine)
provide a more complex query UI that can operate on large lists (e.g.
all genes), supporting pre-defined or user-defined data export formats.
In addition intermediate results can be saved in 'bags' and these lists
combined and/ or used in subsequent queries.

*Cross-site facilitation.* Some MODs allow searches for IDs and/or names
that might be found elsewhere. Many MODs use ontologies (e.g. GO) or
orthologies to link to other databases, one at least (NCBI) offers
computed relations between databases. A common problem in this is
keeping up-to-date across databases. Some MODs (e.g. FlyMine, Wormbase,
SGD) maintain lists of orthologues for many species. This allows a set
of genes from one species to be imported, and the list of corresponding
genes from another, more data rich species, to be derived and then
explored.

## User Interface Development

### Lessons Learned from Experience

- Clear (better yet, obvious) input actions and requirements are
  important. For example, "What, exactly, are people expected to type
  into a 'quick search' box?" and "If the 'log on' box is at the top of
  the homepage, does that mean I have to register and log on to use the
  site?". Also, input fields should be prefilled with an example query
  value to give user an idea of the type of value to be entered (and to
  permit

easy exploration by novices).

  

- Reliable results are important.
- Fast results are good.
- What users ask for isn't always what they really want (see the ApiDB
  presentation).
- Appearance is less important than functionality.
- UI components and report sections should be clearly labeled and
  include tips, sample queries and default values. Results should
  include brief summaries whenever possible.
- Use terms the bio-community understands and try to stay away from
  those that you might want them to learn, but that aren't strictly
  necessary for usage (e.g. the word "Boolean" at ApiDB )
- Don't change what works for users; even if you develop a "better" more
  sophisticated tool, the users might still prefer the one they know how
  to use (e.g. the Batch Sequences tool at Wormbase). MODs generally
  thought that we should avoid rapid turnover in UI, but many felt that
  frequent, small changes and additions can be useful to community (if
  clearly explained)

  

- Support for User preferences/sessions/configurations (e.g. "MyNCBI",
  FlyMine's "MyMine")
  - default UI dilemma: simple/dumb for general audience, or
    sophisticated/complex for focused users
  - variable (low) use of preference options?
  - needs transparency to user (avoid logins/extra effort)

### Gathering and Analyzing User Feedback

#### Using User Feedback to Guide UI Design

*Start early.* There was broad agreement that usability studies for a
user interface should be conducted as early as possible in its
development cycle. The more development effort that has already been
devoted to a tool, the harder it is to make any suggested changes that
may arise from a usability study. Moreover, the existing structure of
the interface under test can profoundly influence the shape of suggested
changes, possibly stifling perhaps profitable UI design ideas that may
otherwise have been free to arise, or giving undue weight to ideas that
happen to coincide with the current direction of development.

*Users may not know what they need any better than the developers do.*
UI development should be a creative collaboration between users and
developers. Neither party alone should drive the development, but the
two should work closely together. In practice, users often have too
little opportunity to participate in the UI design process.

#### Site Logging

A MOD site's server logs can be useful for gathering indirect user
feedback. This user feedback mechanism is often overlooked, yet it is
relatively easy to work with and can provide very rich data, limited
only by the investigator's ingenuity. For example, a MOD might configure
its server logs to provide information on user searches, how much time
each search took, and the number of results returned by the search. The
MOD might then analyze this data to find common instances of "failed"
searches that return no results, then identify ways to improve its user
interface to make any obscure data more accessible. A MOD might also use
server logs to identify the types of data users search for most
frequently, and give that data a more prominent place in the site's user
interface. Tools for visualizing these logs, named "Ajaxalytics" have
been developed by ApiDB personnel and are available through sourceforge.
Further work with these tools to cluster and characterize user behavior
is underway.

#### Card Sorting

"Card sorting" is an easy to implement and powerful method of
discovering how users naturally group items of data. An investigator
gives each user a stack of cards, on each of which is written a word or
phrase describing a concept. The user is then asked to sort the cards
into piles, and optionally sub-piles, that group the concepts in the way
that makes the most "intuitive sense". The users are then asked to label
these piles, by writing a category name on a blank card and clipping
them together.

At least one MOD in the meeting reported successfully using this method
to design easy-to-navigate groupings of menu choices for their site's
UI.

#### Watching Users

Watching users interact with a MOD's user interface can tell an
investigator more than user opinions and surveys. ApiDB recounted some
of the methods they used for conducting user interface testing. One type
of study they did involved pairs of users sitting at computers outfitted
with video and keystroke capture devices, as well as audio recording.
These pairs of users were asked to perform various tasks using the user
interface under test. The video and keystroke capturing provided a
comprehensive record of all actions the users performed with the site.
Additionally, the audio recording of each pair allowed investigators to
hear how the users talked about and explained the site to each other,
shedding some light on the way users think about their interactions with
the site. ApiDB's presentation also pointed one disadvantage of this
approach, which is the difficulty of analyzing the large amount of data
collected during the study, since most of it is in the form of many
hours of audio and video recordings. Despite the analysis difficulties,
ApiDB reported that they had found the data to be quite useful. After
the ApiDB presentation, Ceri Van Slyke from ZFIN remarked that ZFIN had
conducted similar usability studies, with similar experiences.

### Balancing Completeness and Simplicity

Too much information and too many choices can overwhelm users, but
restricting choices and hiding data limits the usefulness of a MOD. This
dilemma and how best to handle it was a common theme in presentations.
*Easier to Use* versus *Does More Things* is a good way to express this.
Achieving a good balance requires a great deal of thought and user
input.

An illustrative example can be found in map displays and reports, where
detail sections are hidden, but available through linked pages or
dynamic web displays. At SGD, a sidebar of menu choices was found to
hide too much from users. It is being replaced with an web page that
openly exposes all choices.

A related issue is providing adequate information on what the different
choices available actually do, and the provenance of data: what data are
present and where they came from.

## New Trends in MOD UIs

### Community Participation

Wikipedia provides an excellent example of the power of community
participation in science documentation. Many new genomics and biology
wikis are springing up, running on the reusable software and
documentation provided by
<a href="http://www.mediawiki.org/" class="external text">Wikipedia</a>.
Members of this new generation of wikis include:
<a href="http://gmod.org/" class="external free"
rel="nofollow">http://gmod.org/</a> , an outcome of the GMOD meeting ,
<a href="http://genomewiki.ucsc.edu/" class="external free"
rel="nofollow">http://genomewiki.ucsc.edu/</a> ,
<a href="http://www.bioperl.org/wiki/" class="external free"
rel="nofollow">http://www.bioperl.org/wiki/</a> ,
<a href="http://www.wormbase.org/wiki/" class="external free"
rel="nofollow">http://www.wormbase.org/wiki/</a> ,
<a href="http://wiki.dictybase.org/dictywiki/" class="external free"
rel="nofollow">http://wiki.dictybase.org/dictywiki/</a> ,
<a href="http://rana.lbl.gov/drosophila/wiki/" class="external free"
rel="nofollow">http://rana.lbl.gov/drosophila/wiki/</a> ,
<a href="http://www.nescent.org/wikis.php" class="external free"
rel="nofollow">http://www.nescent.org/wikis.php</a> ,
<a href="http://openwetware.org/wiki/" class="external free"
rel="nofollow">http://openwetware.org/wiki/</a> ,
<a href="http://darwin.nerc-oxford.ac.uk/gc_wiki/" class="external free"
rel="nofollow">http://darwin.nerc-oxford.ac.uk/gc_wiki/</a> ,
<a href="http://wiki2.germonline.org/wiki/" class="external free"
rel="nofollow">http://wiki2.germonline.org/wiki/</a> ,
<a href="http://www.biodirectory.com/biowiki/" class="external free"
rel="nofollow">http://www.biodirectory.com/biowiki/</a> .

This growing list of wikis offer scientists a common, well-documented
user interface that is expected to facilitate expanded use, as
experience in participation one site carries over to others. The
<a href="http://ecoliwiki.net/colipedia/index.php/Main_Page"
class="external text" rel="nofollow">EcoliWiki</a> provides a prototype
for gene annotations. Further integration of wiki methods for genome
community annotation have been recently proposed
<sup>[\[1\]](#cite_note-1)</sup>, <sup>[\[2\]](#cite_note-2)</sup>. Also
at the meeting, <a href="http://sgn.cornell.edu" class="external text"
rel="nofollow">SGN</a> presented an experimental community gene curation
interface for use by authorized users of the site.

### Client-side Scripting (JavaScript)

In recent years, general web development practices have been trending
toward increased use of client-side scripts written in JavaScript to
provide richer, more responsive user interfaces for web sites. This
trend has been driven by the increasing market share of browsers with
relatively mature JavaScript implementations (IE 6+, Firefox), and by
the high-profile success of several web applications making use of this
increased JavaScript support (such as
<a href="http://maps.google.com" class="external text"
rel="nofollow">Google Maps</a>).

Most web developers at MODs have a responsibility to ensure broad access
to the MOD's data, thus they do not have unlimited freedom to introduce
new user interface features that may not be compatible with older
versions of browser software. Instead, they must take great care to
ensure either a.) that newer UI features "degrade gracefully" when
viewed with older browser software, but preserving basic functionality,
or b.) that an alternate method of accessing the data is available for
users of less functional browsers.

Some examples of gracefully degrading client-side features showcased at
this meeting were:

- dynamic, database-backed automatic completion of entries typed into
  web search forms (older browsers simply won't see any automatic
  completion)
- dynamically expanding or collapsing sections of large data displays
- drag-and-drop map track reording in GMOD's GBrowse software

------------------------------------------------------------------------

Dynamic web page content, user preferences and histories are becoming
more widely available at MODs. These are used for showing or hiding
contents (aiding the dilemma of supporting both the beginner and
advanced user), for map track reordering, retaining history of user
queries and answers, and other uses.

- more graphical summaries of long lists/tables are possible; can be
  useful
- improving comparative genomics aspects to aid broader audience
- include curator/community edits/updates to contents (part of same
  reading UI) (ZFIN,SGN,)

### Using Virtualization for MOD Snapshots

Providing stable "snapshots" of the data in a MOD is important for
reproducing results in publications that cite the MOD. Many MODs provide
snapshots in the form of large data dumps created at specific time
intervals, which could be used to laboriously reconstruct the state of
the MOD's data at a given point in time. WormBase takes this idea a step
further, using virtualization technology to capture the complete state
of the WormBase site for each snapshot. These snapshot images can be
accessed via the web in the same manner as the main WormBase site, or
can be downloaded for playback on any computer that supports the free
<a href="http://www.vmware.com" class="external text"
rel="nofollow">VMWare</a> player. This practice greatly facilitates
reproduction of results from papers that cite WormBase.

## Using Google and Other General Search Engines

A number of MODs represented at the meeting used Google to provide some
of the search functionality on their site. It was generally agreed that
if an external search engine is allowed to fully index a MOD's pages, it
can usually provide very useful full-text search results. However, since
generalized search engines do not have specific knowledge of the
structure of a MOD's data, it may not be possible to obtain relevant
results for very specific searches. For example, it would probably not
be possible to use a generalized search engine for searching genes based
on their exact physical locations in a genome.

It was briefly mentioned that some standard search engine optimization
techniques may be used to improve results with external search engines,
particularly providing a "site map" page with deep links to all or most
of the pages in your site.

One concern that was raised was that the "crawlers" used by external
search engines for indexing web pages sometimes impose unacceptable
demands on a MOD's web servers, particularly when crawlers from multiple
search engines are indexing a site at once. Some solutions to this were
suggested, including carefully tuning your site's `robots.txt` file to
avoid computation-intensive pages, and simply buying more servers and/or
optimizing your site's code to better handle the load. Googlebot and
perhaps other robots can be told to reduce their hit rate to an
acceptable level.

A different strategy pursued by some MODs is to use generalized search
software on their own servers, such as
<a href="http://lucene.apache.org/" class="external text"
rel="nofollow">Lucene</a> or
<a href="http://www.gmod.org/lucegene" class="external text"
rel="nofollow">LuceGene</a>, a Lucene variant customized for indexing
many types of biological data. This approach offers more control over
the indexing, searching, and result presentation than using an external
search engine.

## User Interface Conventions

One subject that was raised, but was not fully discussed in the time
available, was the idea of developing common user interface conventions
among MODs. Attendees notes several cases of "convergent evolution"
among the MOD user interfaces:

- most MODs seem to have some sort of unified search feature for all
  data in the MOD
- wide adoption of GMOD's GBrowse software
- existing tools for bulk data download, movement toward more flexible
  search and reporting tools such as BioMart and InterMine

Todd Harris proposed developing a convention for common URLs for bulk
downloading of genome data, but the subject was not fully discussed. A
page outling the common urls can be found at
<a href="Common_Download_URL" class="mw-redirect"
title="Common Download URL">Common Download URL</a>.

Dr. Peter Karp presented a useful list of common elements that every MOD
should be sure to include:

- procedures for citing the MOD in publications
- "contact us" links
- facilities for downloading datasets and software
- community news
- MOD data cross-referenced to publications
- summary statistics of data in the MOD
  - if possible, a history of these statistics over time
- update history (a.k.a. changelog) of MOD
- central credits list for MOD contributors

## General Discussion

- Steps in developing good MOD Faces
  Consensus  
  help links everywhere are useful. Examples on input fields are easy to
  add, and very useful.

  - Sample values are frequently invaluable near the text input box.
  - There is no one right answer in UI design, there are many right
    answers. There are also many wrong answers.
  - Never create a link to a location where there's nothing to be found.
    Indicate, by some means, if there's no information or more
    information.
- User community testing, interviews, surveys, HCI principles
  - Differing views on value of types and stages in user testing (Is
    user testing necessary? What about releasing software as a means to
    get feedback?)
    - It may be that user testing is most valuable when attempting to
      solve specific problems, as opposed to "design". User testing is
      probably most useful in the earliest phase, looking at prototypes
      or prototypes on paper.
    - Monitoring and logging is important, you must know what occupies
      the user the most.
- Dilemma of too much or too little information/choice
  - Consensus: complexity goes with the territory, but you have to make
    the most common things easy and the hard things possible, and have
    good user education and documentation.
  - Is it true that complexity should be concealed? How does one strike
    the balance between providing for the expert and for the novice?
- Google is your enemy/friend ...
  - Differing views on advantage/disadavantages of Google as adjunct to
    MOD search systems (No consensus that using Google is advantageous;
    Techniques for guiding Google/Bots below)
- Good new ideas
  - More dynamic content, graphics summaries may be good
    - Can we make more use of graphics to replace text? E.g. a generated
      image replaces expression information.
    - Word or string completion as user asks questions is useful UI
      technique (see Javascript and AJAX below)
- Common UIs across MODs?  
  Not discussed (sigh :()

## Implementation Techniques

- Easy way to direct Google/Bots to best or full content (e.g. gene
  pages) is with a site map with links to everything you want to expose.
  - detecting user agent, query referral string, etc., in web query lets
    report software alter output (e.g. give Google all of report to
    index, highlight Google user queries)
  - Google offers indexing tips, directions to update or hide specific
    parts
- Dynamic content (Javascript/AJAX):
  - Word or string completion using Javascript/AJAX and dedicated,
    simple databases of words to complete work well (Wormbase, EBI
    Ontology Lookup Service, others?).
  - use to hide and show sections of pages; reorder tracks in a genome
    browser;
- RSS is probably underutilized, but would it be widely used if
  available?
- An XML representation of an "entry" makes a "diff" or change easy to
  assess, and reliable alerts could be constructed.

  

# References

1.  <span id="cite_note-1"><span class="mw-cite-backlink">[↑](#cite_ref-1)</span>
    <span class="reference-text">Salzberg SL. Genome re-annotation: a
    wiki solution? Genome Biol. 2007 Feb 1;8(1):102; PMID:
    17274839</span></span>
2.  <span id="cite_note-2"><span class="mw-cite-backlink">[↑](#cite_ref-2)</span>
    <span class="reference-text">Bradley I. Arshinoff, Garret Suen,
    Eric M. Just, Sohel M. Merchant, Warren A. Kibbe, Rex L. Chisholm,
    and Roy D. Welch. Xanthusbase: adapting wikipedia principles to a
    model organism database. Nucl. Acids Res. 2007 35: D422-D426;
    doi:10.1093/nar/gkl881 </span></span>

<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">Interface test</span>

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

Meeting Report [Model Organism Database User Interface
Caucus](MOD_User_Interface_Caucus "MOD User Interface Caucus") January
18, 2007 Town and Country Hotel, San Diego, CA, USA

  
The user interface (UI) is the most visible aspect of a MOD, and
arguably has the most direct impact on the satisfaction of its users. On
the first day of the [January 2007 GMOD
Meeting](January_2007_GMOD_Meeting "January 2007 GMOD Meeting"), we
shared experiences, discussed lessons learned, and identified unsolved
problems in the field of MOD user interface design. To drive the
discussion, representatives of several MODs (including both model and
multi-organism databases) presented aspects of their MOD's UI that
related to a common set of use cases: searching by gene name and viewing
a gene report, searching for data related to a broader biological
concept, constructing customized reports to answer more specific
questions, extracting data in bulk for thousands of genes, and using one
MOD in concert with other MODs.

# <span id="Executive_Summary" class="mw-headline">Executive Summary</span>

The MOD user interface session brought to light some very useful topics
that many MODs (new and old) can benefit from discussing.

General UI Lessons  

- In all cases, it should be clear what actions are required from the
  user and what results those actions will produce.
- Contextual examples and "help" links are very useful to users, but are
  underutilized. Utilizing help facilities should not require navigation
  away from the user's current page or tool.
- Appearance is less important to users than responsiveness (speed) and
  functionality.
- Developing good UIs takes sustained work, including feedback and
  community testing.

Complexity is an inherent problem  

- MODs deal with rich, complex data that is constantly expanding and
  changing. It is critical to recognize that this complexity "comes with
  the territory." A central challenge for a MOD's user interface to this
  data is to make common tasks easy and complex tasks possible.
  Oversimplification is not helpful, but neither is overwhelming users
  with unfiltered, unorganized information. A MOD's UI must strive to
  balance the need for simplicity with the need for complete
  information.
- This problem is addressed through:
  - User interface design
  - Engineering of site infrastructure
  - User education and documentation

Ideas for future development  

- More dynamic web content options and graphical summaries to help
  manage information.
- Genuine auto-complete in text boxes to help guide searches (can be
  implemented with javascript doing asynchronous database lookups)
- Google can be harnessed to aid, but is not solely sufficient for,
  searching MOD data.
- Virtualization of "server snapshots" is a useful mechanism for keeping
  older database versions available.
- There is a need for broader availability of 'power-user' interfaces
  allowing
  - complex queries to be constructed
  - gathering / uploading / combining / operating on sets of e.g. genes
    in one step
  - flexible configuration of data output formats

*more here ..*

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span> <span class="toctext">Executive
  Summary</span>](#Executive_Summary)
- [<span class="tocnumber">2</span> <span class="toctext">In
  attendance</span>](#In_attendance)
- [<span class="tocnumber">3</span> <span class="toctext">Individual
  Presentations</span>](#Individual_Presentations)
- [<span class="tocnumber">4</span> <span class="toctext">Detailed
  Report</span>](#Detailed_Report)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Addressing
    Six MOD Use Cases</span>](#Addressing_Six_MOD_Use_Cases)
  - [<span class="tocnumber">4.2</span> <span class="toctext">User
    Interface Development</span>](#User_Interface_Development)
    - [<span class="tocnumber">4.2.1</span>
      <span class="toctext">Lessons Learned from
      Experience</span>](#Lessons_Learned_from_Experience)
    - [<span class="tocnumber">4.2.2</span>
      <span class="toctext">Gathering and Analyzing User
      Feedback</span>](#Gathering_and_Analyzing_User_Feedback)
    - [<span class="tocnumber">4.2.3</span>
      <span class="toctext">Balancing Completeness and
      Simplicity</span>](#Balancing_Completeness_and_Simplicity)
  - [<span class="tocnumber">4.3</span> <span class="toctext">New Trends
    in MOD UIs</span>](#New_Trends_in_MOD_UIs)
    - [<span class="tocnumber">4.3.1</span>
      <span class="toctext">Community
      Participation</span>](#Community_Participation)
    - [<span class="tocnumber">4.3.2</span>
      <span class="toctext">Client-side
      Scripting</span>](#Client-side_Scripting)
    - [<span class="tocnumber">4.3.3</span> <span class="toctext">Using
      Virtualization for MOD
      Snapshots</span>](#Using_Virtualization_for_MOD_Snapshots)
  - [<span class="tocnumber">4.4</span> <span class="toctext">Using
    Google and Other General Search
    Engines</span>](#Using_Google_and_Other_General_Search_Engines)
  - [<span class="tocnumber">4.5</span> <span class="toctext">User
    Interface Conventions</span>](#User_Interface_Conventions)
  - [<span class="tocnumber">4.6</span> <span class="toctext">General
    Discussion</span>](#General_Discussion)
  - [<span class="tocnumber">4.7</span>
    <span class="toctext">Implementation
    Techniques</span>](#Implementation_Techniques)

</div>

# <span id="In_attendance" class="mw-headline"> <a
href="http://gmod.org/mediawiki/index.php?title=Participants&amp;action=edit&amp;redlink=1"
class="new" title="Participants (page does not exist)">In attendance</a></span>

\- attendance list

# <span id="Individual_Presentations" class="mw-headline"> [Individual Presentations](MOD_Face_Talks "MOD Face Talks") </span>

Slides and text summaries of individual presentations.

  

# <span id="Detailed_Report" class="mw-headline">Detailed Report</span>

## <span id="Addressing_Six_MOD_Use_Cases" class="mw-headline">Addressing Six MOD Use Cases</span>

Commonalities, good ideas, strengths and weaknesses

1.  Many simple/quick/global searches
    - Most MODs have some variation of a "search everything" option that
      is the primary search entry.
    - Simple searches at MODs vary principally in the details of data
      classes (which were searched and whether or not they needed to be
      specified) and how terms are matched (exact, partial, phrase
      and/or wildcard).
    - These types of simple searches must balance ease of use with
      relevance of results.
    - How results can be handled also varies between MODs. Various MODs
      allow searches and results to be saved, refined, downloaded and/or
      exported to other tools.
    - One challenge is how to support user expectations to make "simple"
      searches that return quality answers. The TAIR presentation
      details a several-year process to determine best functionality of
      simple search from user feedback: it takes effort to develop
      "simple and quick" searches that return what biologists really
      looking for.
2.  Gene page reports
    - Most MODs agree that users like short summaries and graphical
      presentations of data.
    - Individiual MODs vary widely in deciding how much detail is
      displayed in the default view.
    - Individual MODs struggle with how to direct users, in an obvious
      manner, toward deeper levels of information
3.  Advanced/attribute searches.
    - Many MODs allow some sort of advanced search where users can
      specify search criteria over multiple data types.
    - Some MODs (e.g. NCBI, ApiDB) allowed query histories to be
      combined, allowing for complex, refined searches and results, and
      others (FlyMine) provide this functionality through set operations
      on 'bags' of objects.
4.  User choices in data reports
    - This is an aknowledged weak aspect many MODs; most have yet to
      develop systems that allow users to customize reports and instead
      expect users to parse information from current, defined formats
      (which can vary wildly between databases). Some MODs (e.g.
      FlyMine) allow choice of output columns and their order.
5.  UIs for bulk data handling.
    - Many MODs allow some sort of bulk query, although the allowed data
      types varys.
    - Some MODs (e.g. FlyMine) provide a more complex query UI that can
      operate on large lists (e.g. all genes), supporting pre-defined or
      user-defined data export formats. In addition intermediate results
      can be saved in 'bags' and these lists combined and/ or used in
      subsequent queries.
    - BioMart is used at two or more MODs for bulk data search/retreive
      and is in development at others.
6.  Cross-site facilitation
    - Some MODs allow searches for IDs and/or names that might be found
      elsewhere
    - Many MODs use ontologies (e.g. GO) or orthologies to link to other
      databases
    - computed relations between databases (ncbi/others?) e.g.
      homology/orthology, ontology/literature attributes, ..
    - problem: keeping up-to-date across dbs
    - Some MODs (e.g. FlyMine) maintain lists of orthologues for many
      species. This allows a set of genes from one species to be
      imported, and the list of corresponding genes from another, more
      data rich species, to be derived and then explored.

## <span id="User_Interface_Development" class="mw-headline">User Interface Development</span>

### <span id="Lessons_Learned_from_Experience" class="mw-headline">Lessons Learned from Experience</span>

- Clear (better yet, obvious) input actions and requirements are
  important. For example, "What, exactly, are people expected to type
  into a 'quick search' box?" and "If the 'log on' box is at the top of
  the homepage, does that mean I have to register and log on to use the
  site?"

<!-- -->

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
  clearly explaned)

### <span id="Gathering_and_Analyzing_User_Feedback" class="mw-headline">Gathering and Analyzing User Feedback</span>

- User community testing, interviews, surveys, HCI principles
  - Ask users **early** about new prototypes, rather than after UI
    development. Having an existing UI may limit the suggestions and
    feedback.
  - Users don't necessarily want what they ask for. Make sure that
    you're meeting their need over and above their request.
  - Concept "card sorting" test is another tool that lets users show
    best organization & grouping of MOD topics.
  - Watching users interact with MOD UI can tell a better, more
    informative story than user opinions and surveys. Paired,
    video/keystroke captured, user testing can be tedious to analyze but
    extremely useful (ApiDB and ZFin both have experience with these
    techniques). Using "paired" teams (matched for status/gender) allows
    you to hear people explaining, to each other, how to use your site.
  - Log site usage, moniter it enough to recognize common "failed"
    queries, and figure out how to address and prevent such errors

<!-- -->

- Support for User preferences/sessions/configurations (e.g. "MyNCBI",
  FlyMine's "MyMine")
  - default UI dilemma: simple/dumb for general audience, or
    sophisticated/complex for focused users
  - variable (low) use of preference options?
  - needs transparency to user (avoid logins/extra effort)

### <span id="Balancing_Completeness_and_Simplicity" class="mw-headline">Balancing Completeness and Simplicity</span>

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

## <span id="New_Trends_in_MOD_UIs" class="mw-headline">New Trends in MOD UIs</span>

### <span id="Community_Participation" class="mw-headline">Community Participation</span>

Wikipedia provides an excellent example of the power of community
participation in science documentation. Many new genomics and biology
wikis are springing up, running on the reusable software and
documentation provided by
<a href="http://www.mediawiki.org/" class="external text">Wikipedia</a>.
Members of this new generation of wikis include:
<a href="http://wiki.gmod.org/" class="external free"
rel="nofollow">http://wiki.gmod.org/</a> , an outcome of the GMOD
meeting , <a href="http://genomewiki.ucsc.edu/" class="external free"
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
rel="nofollow">http://www.biodirectory.com/biowiki/</a> . This growing
list of wikis offer scientists a common, well-documented user interface
that is expected to facilitate expanded use, as experience in
participation one site carries over to others.

### <span id="Client-side_Scripting" class="mw-headline">Client-side Scripting</span>

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

### <span id="Using_Virtualization_for_MOD_Snapshots" class="mw-headline">Using Virtualization for MOD Snapshots</span>

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

## <span id="Using_Google_and_Other_General_Search_Engines" class="mw-headline">Using Google and Other General Search Engines</span>

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

## <span id="User_Interface_Conventions" class="mw-headline">User Interface Conventions</span>

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
downloading of genome data, but the subject was not fully discussed.

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

## <span id="General_Discussion" class="mw-headline">General Discussion</span>

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

<!-- -->

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

<!-- -->

- Dilemma of too much or too little information/choice
  - Consensus: complexity goes with the territory, but you have to make
    the most common things easy and the hard things possible, and have
    good user education and documentation.
  - Is it true that complexity should be concealed? How does one strike
    the balance between providing for the expert and for the novice?

<!-- -->

- Google is your enemy/friend ...
  - Differing views on advantage/disadavantages of Google as adjunct to
    MOD search systems (No consensus that using Google is advantageous;
    Techniques for guiding Google/Bots below)

<!-- -->

- Good new ideas
  - More dynamic content, graphics summaries may be good
    - Can we make more use of graphics to replace text? E.g. a generated
      image replaces expression information.
    - Word or string completion as user asks questions is useful UI
      technique (see Javascript and AJAX below)

<!-- -->

- Common UIs across MODs?  
  Not discussed (sigh :()

## <span id="Implementation_Techniques" class="mw-headline">Implementation Techniques</span>

- Easy way to direct Google/Bots to best or full content (e.g. gene
  pages) is with a site map with links to everything you want to expose.
  - detecting user agent, query referal string, etc., in web query lets
    report software alter output (e.g. give Google all of report to
    index, highlight Google user queries)
  - Google offers indexing tips, directions to update or hide specific
    parts

<!-- -->

- Dynamic content (Javascript/AJAX):
  - Word or string completion using Javascript/AJAX and dedicated,
    simple databases of words to complete work well (Wormbase, EBI
    Ontology Lookup Service, others?).
  - use to hide and show sections of pages; reorder tracks in a genome
    browser;

<!-- -->

- RSS is probably underutilized, but would it be widely used if
  available?

<!-- -->

- An XML representation of an "entry" makes a "diff" or change easy to
  assess, and reliable alerts could be constructed.

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=Interface_test&oldid=4648>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](Special:Categories "Special:Categories"):

- [MOD User
  Interfaces](Category:MOD_User_Interfaces "Category:MOD User Interfaces")
- [Meetings](Category:Meetings "Category:Meetings")

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


- <span id="ca-talk"><a href="Talk:Interface_test" accesskey="t"
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

<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category:FAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category:HOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">


- <span id="t-smwbrowselink"><a href="Special%3ABrowse/Interface_test" rel="smw-browse">Browse
  properties</a></span>


</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 17:34 on 31 January
  2008.</span>
<!-- - <span id="footer-info-viewcount">13,212 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->






</div>

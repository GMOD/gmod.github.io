<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">MySQL</span>

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

<a href="http://mysql.com" class="external text"
rel="nofollow">MySQL</a> is a popular open source [database management
system](Glossary#Database_Management_System "Glossary") (DBMS). It's
generally considered to be the easiest of all relational database
management systems to install (Unix or Windows). It's not always viewed
as favorably by database experts as it lacks certain features that they
may consider useful, but one cannot deny that MySQL has proved its
utility in both the open source and commercial worlds. An excellent
*first* database for those who have no prior experience with relational
databases.

See also:

- [Databases and GMOD](Databases_and_GMOD "Databases and GMOD")
- [PostgreSQL](PostgreSQL "PostgreSQL") - The DBMS used with
  <a href="Chado" class="mw-redirect" title="Chado">Chado</a>.

## <span id="Scott_Cain.27s_thoughts_on_why_you_shouldn.27t_use_MySQL_for_Chado" class="mw-headline">Scott Cain's thoughts on why you shouldn't use MySQL for Chado</span>

Note: I plan on fleshing this out more, but I wanted to get my thoughts
down while I'm thinking about it.

MySQL is a very good database for some things: it is very fast as a read
only database, and so is quite good for driving data displays like
[GBrowse](GBrowse.1 "GBrowse"). My experience outlined below describes
why I learned to distrust it for 'important' data.

Some things that make me wary:

- The ability to either have or not have transactional integrity (and
  look out if you accidentally forget to declare one of your tables as
  INNODB). See
  <a href="http://sql-info.de/en/mysql/transaction-innodb-table.html"
  class="external free"
  rel="nofollow">http://sql-info.de/en/mysql/transaction-innodb-table.html</a>,
  <a href="http://sql-info.de/en/mysql/database-definition.html#2_3#2_3"
  class="external free"
  rel="nofollow">http://sql-info.de/en/mysql/database-definition.html#2_3</a>
  and
  <a href="http://sql-info.de/en/mysql/database-definition.html#2_4#2_4"
  class="external free"
  rel="nofollow">http://sql-info.de/en/mysql/database-definition.html#2_4</a>
- Silent dropping or truncation of data (To me, this is a VERY BIG DEAL
  if you care about your data.) See
  <a href="http://sql-info.de/mysql/gotchas.html#1_13#1_13"
  class="external free"
  rel="nofollow">http://sql-info.de/mysql/gotchas.html#1_13</a> for a
  simple example that is still broken on MySQL 5.0.45.
  - See the story below about silently throwing away data when inserting
    it; while MySQL 5 doesn't appear to be affected by this, you might
    see why my perception of MySQL is perhaps a little shaded by these
    events.
- Poor support for triggers (for example, you can't have more than one
  trigger that has the same trigger action time and event and triggers
  do not get executed when the event is caused by a cascading foreign
  key action (and Chado makes considerable use of cascading deletes, so
  this could affect trigger results)).
- We already have several years of development of tools devoted to
  PostgreSQL. I don't have the time to devote to porting, especially
  since PostgreSQL is an excellent RDBMS.

### <span id="How_I_learned_to_distrust_MySQL" class="mw-headline">How I learned to distrust MySQL</span>

When I started working on GMOD in 2002, the first project I tackled was
to write a port of the [GBrowse](GBrowse.1 "GBrowse") /
<a href="GBrowse_adaptors" class="mw-redirect"
title="GBrowse adaptors">Bio::DB::GFF adaptor</a> to
[PostgreSQL](PostgreSQL "PostgreSQL"). I did a perfect job the first
time through (not really, but pretend it's true for the moment). When I
went to load some test data, the load failed and PostgreSQL barfed with
an unfriendly error message, even though the same data loaded without
incident using the MySQL adaptor. After spending a few days looking for
bugs in the PostgreSQL adaptor that I'd written, I started looking at
the data. It turns out that the test data (the entire
[WormBase](Category%3AWormBase "Category%3AWormBase") [GFF](GFF "GFF") at
the time) had data in it that violated a unique constraint on the fdata
table. That is the main data table, and the constraint was over
(fref,fbin,fstart,fstop,ftypeid,gid). Basically, the WormBase GFF had a
data bug in it, and PostgreSQL was doing the right thing: I was trying
to load something that was inconsistent with what I told it to expect,
and it threw an error and stopped the load (and rolled back to the
previous state, since it has transactions like any good database server
should).

The only question for me at that point was, why didn't MySQL do the same
thing, or at least give a warning (which to me would still be
unacceptable, but it would be something)? Because it was designed to
silently throw away data that violated a unique constraint! So, how
about that? MySQL just decided I didn't need the data that was in that
line. I should mention that, although the WormBase GFF had lines that
violated the unique constraint, the lines that violated it were not 100%
identical: some data in the ninth column were unique, so that data just
disappeared from GBrowse. Nice.

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=MySQL&oldid=24482>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](Special:Categories "Special:Categories"):

- [MySQL](Category%3AMySQL "Category%3AMySQL")
- [External](Category%3AExternal "Category%3AExternal")

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


- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:MySQL&amp;action=edit&amp;redlink=1"
  accesskey="t"
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
- <span id="n-FAQs">[FAQs](Category%3AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%3AHOWTO)</span>
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


- <span id="t-smwbrowselink"><a href="Special%3ABrowse/MySQL" rel="smw-browse">Browse properties</a></span>


</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 19:28 on 4 September
  2013.</span>
<!-- - <span id="footer-info-viewcount">80,819 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD:About "GMOD:About")</span>

<!-- -->






</div>

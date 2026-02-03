---
title: "Site Guidelines"
---
# Site Guidelines

This page discusses editorial policies and best practices to follow when
updating or creating content in the GMOD web site.

  Introduction](#Introduction)
- [Meta-Guidelines](#Meta-Guidelines)
  - [Ignoring](#Ignoring)
  - [Updating](#Updating)
  - [Enforcing](#Enforcing)
- [Guidelines](#Guidelines)
  - [Page
    Names](#Page_Names)
    - [Capitalization](#Capitalization)
    - [Redirects](#Redirects)
  - [Minor vs
    Major Edits](#Minor_vs_Major_Edits)
  - [Tags /
    Categories](#Tags_.2F_Categories)
    - [New
      Categories](#New_Categories)
  - [Uploading
    Files](#Uploading_Files)
    - [Destination
      Filenames](#Destination_Filenames)
    - [File
      Categories](#File_Categories)
    - [Diagrams and
      Cartoons](#Diagrams_and_Cartoons)
  - [Format](#Format)
- [Embedding
  Media](#Embedding_Media)
  - [Flash](#Flash)
- [Writing
  Code](#Writing_Code)
- [Adding
  References](#Adding_References)
  - [Example](#Example)
- [Component
  Information Pages](#Component_Information_Pages)

## Introduction

The GMOD web site editorial policies and best practices are defined
here. Consistent use of these policies and practices will hopefully lead
to a consistent and readable web site.

This page first introduces _meta-guidelines_. These are guidelines about
these guidelines and cover things like how to update the guidelines, and
when you can ignore them. These are followed by the actual guidelines,
describing how content should be created.

## Meta-Guidelines

Or, **Guidelines on Guidelines**.

### Ignoring

**Q:** Can I ignore these guidelines?

**A:** Yes.

We would much rather have a contribution that completely ignores these
guidelines than not have the contribution at all.

This is for pragmatic and philosophical reasons. The whole goal of a
wiki is to encourage people to contribute and maintain content. Site
guidelines encourage a clean and well organized web site, but if the
guidelines discourage people from contributing in the first place, then
they have defeated the whole purpose.

It also takes some time to become proficient at
<a href="http://mediawiki.org" class="external text">MediaWiki</a> (the
wiki package behind this web site), and it can be a challenge to learn
MediaWiki details and site policies at the same time.

However, once you get comfortable with MediaWiki, please think about
writing your content so it does conform to these standards.

### Updating

These guidelines are a work in progress and you are encouraged to
suggest additions, deletions or revisions to them. The best way to do
this is to send your comments to the [GMOD Help
Desk](/wiki/GMOD_Help_Desk). Alternatively, you can post them
to this page (or to this page's discussion/talk
page).

### Enforcing

**Q:** Is there any enforcement of these guidelines?

**A:** Not really.

Beyond the usual wiki practices, there is no enforcement of these
guidelines. This means that any non-conforming material you write won't
be deleted, but it might be modified to follow the guidelines if and
when somebody notices.

## Guidelines

This is a list of guidelines for creating content in the GMOD web site.
Some guidelines are accompanied by discussion that explains them.

Guidelines are shown like this.

Discussion is shown as regular text.

### Page Names

#### Capitalization

Use _Generous Capitalization_ instead of _Parsimonious capitalization_.

For example, use "Site Guidelines" instead of "Site guidelines".

It looks better.

#### Redirects

Use of MediaWiki redirects for page name synonyms is encouraged.

This means that if a user types
"<a href="/wiki/Generic_Genome_Browser" class="mw-redirect"
title="Generic Genome Browser">Generic Genome Browser</a>" in the
"Go/Search" box and you have a redirect defined for
"[GBrowse](/wiki/GBrowse.1)" then they will go directly to the
GBrowse page, instead of the search results page.

To create a redirect page, enter the name of the redirect page in the
Go/Search box and hit enter. Then click on the "create this page" link.
In our example, you would enter/search for "Generic Genome Browser".

This will display an empty page. Enter

\#REDIRECT \[\[Page Name to Redirect to\]\]

In our example this would be:

\#REDIRECT \[\[GBrowse\]\]

and then save the page.

A slight downside of this is that the
 view now
displays lots of pages that are only redirects to other pages. This
turns into more of an index than a listing of all pages.

### Minor vs Major Edits

If you do not want the page you are editing to be listed in the _New &
Revised Pages_ list on the GMOD home page, then mark your edit as
_minor_.

When you update a page in this web site you can flag it as a _minor
edit_. As of December 2007, the minor/major edit distinction is used in
one place in the GMOD web site: Major edits (that is, edits that are
_not_ marked as minor) cause the page to be listed in the _New & Revised
Pages_ list on the [GMOD home page](/wiki/Main_Page). That list is
a reverse chronological ordering of all recent non-minor edits

If your edit is small, such as a spelling or other typo correction, then
mark it as a minor edit.

### Tags / Categories

Tag any pages you edit with appropriate categories for that page.

Be generous in your tagging. If a particular category gets too many
pages in it then the [help desk](/wiki/GMOD_Help_Desk) will
subdivide that category.

This web site makes extensive use of tags, called
in MediaWiki, to
flag pages as being related to different topics. To encourage the use of
categories, an input field and _tag cloud_ listing existing categories
is shown at the bottom of every edit page. You can either type in the
category name or click on the category in the tag cloud to add it to the
current page.

As of January, 2008 we are still adding category tags to pages. Once
that work is closer to complete, categories will be prominently featured
in site navigation.

#### New Categories

If you think we need a new category then create it.

You can create a new category by typing the new category name in the
**Categories** form on an edit page.

When creating a new category please:

- Check that the new category is not redundant with an existing
  category.
- Create a category only if it will apply to more than one page.
- Add the category to other pages that it applies to.
- Create the category page for the new category.
  - Include a description of the category in the page.
  - Also, make the new category a subcategory of any existing categories
    it could be a subcategory of.
    - You do this by using, you guessed it, the **Categories** form on
      the edit page when creating the category page.

Or, just send your new category suggestion to the [GMOD Help
Desk](/wiki/GMOD_Help_Desk) and we will add it.

### Uploading Files

#### Destination Filenames

When uploading a file, please give the file a meaningful **Destination
filename**.

The **Destination filename** is the name the file will have in the GMOD
web site. Why does this matter? Filenames are displayed in
[Categories](/wiki/Categories), but none of the text in the file
is. Therefore the filename should describe the contents of the file.

For example, the file
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a8/Gkl777.pdf" class="internal"
title="Gkl777.pdf">Gkl777.pdf</a> is an article on
[ParameciumDB](/wiki/ParameciumDB) from _Nucleic Acids
Research_, but if you look at the file's listing in the [Publications
category](/wiki/Category%3APublications) all you see is
"Gkl777.pdf". You have to follow the link to find out what the file is
about.

#### File Categories

When uploading a presentation or a paper, please add it to the
[Presentations](/wiki/Category%3APresentations) or
[Publications](/wiki/Category%3APublications)
categories. Also add the file to any other appropriate categories.

If the file is an image that is being linked to from a page then you
don't need to categorize it.

#### Diagrams and Cartoons

When uploading a diagram or cartoon that was created in a drawing
program upload the exported image file (png, jpg, gif) and the original
source file. Load both files with the same name, but different
extensions.

This will allow others (and yourself) to modify the diagrams in the
future rather than recreate them from scratch.

### Format

**Please Note:**

1.  These guidelines were first developed for the
    <a href="/wiki/GMOD_Summer_School" class="mw-redirect"
    title="GMOD Summer School">GMOD Courses</a>, where these were used
    to format the [Tutorial
    pages](/wiki/Training_and_Outreach#Online_Tutorials).
2.  If this seems daunting, please see Meta-Guideline \#1:
    [Ignoring](#Ignoring), and hopefully feel better.

Descriptions of what formatting is desired and how to achieve it. For
each type of text, this shows a minimum desired formatting, and, in most
cases, a better (but more work) formatting.

Many of these are the result of questions and suggestions from past
participants.

<table class="wikitable">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Type of text</th>
<th>Minimum</th>
<th>Better</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><dl>
<dt>Files, Directories and Paths</dt>
<dd>
Use fixed width font
</dd>
</dl></td>
<td><pre><code>Check the thingy.conf file.</code></pre>
<hr />
<p>Check the thingy.conf file.</p></td>
<td><pre><code>
Check the &lt;tt&gt;thingy.conf&lt;/tt&gt; file.  </code></pre>
<hr />
<p>Check the <code>thinigy.conf</code> file.</p></td>
</tr>
<tr class="even">
<td><dl>
<dt>Shell output</dt>
<dd>
Use fixed width font
</dd>
</dl></td>
<td>You can add a leading space on each line:
<pre><code> &gt; &quot;Pythium&quot; for the default organism</code></pre>
<p>Or use <code>pre</code> tags:</p>
<pre><code>&lt;pre&gt;
Available ontologies:
[1] Relationship Ontology
[2] Sequence Ontology
[3] Gene Ontology
[4] Chado Feature Properties
[5] Cell Ontology
[6] Plant Ontology
&lt;/pre&gt;</code></pre>
<hr />
<pre><code>&gt; &quot;Pythium&quot; for the default organism</code></pre>
<p>Or</p>
<pre><code>Available ontologies:
[1] Relationship Ontology
[2] Sequence Ontology
[3] Gene Ontology
[4] Chado Feature Properties
[5] Cell Ontology
[6] Plant Ontology</code></pre></td>
<td>Same</td>
</tr>
<tr class="odd">
<td><dl>
<dt>Text to be entered by student</dt>
<dd>
To distinguish it from surrounding text. Use fixed width font.
</dd>
</dl></td>
<td><pre><code> ~/work/galaxy-dist$ head tool_conf.xml</code></pre>
<hr />
<pre><code>~/work/galaxy-dist$ head tool_conf.xml</code></pre></td>
<td><p><br />
~/work/galaxy-dist$ &lt;span class="enter"&gt;head
tool_conf.xml&lt;/span&gt;</p>
<hr />
<pre><code>~/work/galaxy-dist$ head tool_conf.xml</code></pre></td>
</tr>
<tr class="even">
<td><dl>
<dt>Run a text editor</dt>
<dd>
Just use <code>gedit</code> in any examples. It's confusing to novices
to see <code>vi, emacs. vim, xemacs</code> and so on on different pages.
</dd>
</dl></td>
<td><p><br />
Edit the configuration file: gedit thingy.conf</p>
<hr />
<p>Edit the configuration file:</p>
<pre><code>gedit thingy.conf</code></pre></td>
<td><p><br />
Edit the configuration file: gedit thingy.conf
TextEditorLink|gedit</p>
<hr />
<p>Edit the configuration file:</p>
<pre><code>gedit thingy.conf</code></pre>

<a href="/wiki/Linux_Text_Editors" title="Linux Text Editors">A word on text
editors such as gedit</a>.
</td>
</tr>
<tr class="odd">
<td><dl>
<dt>Shell Prompt?</dt>
<dd>
Should we show the shell prompt in the wiki examples?
</dd>
</dl></td>
<td>I dunno</td>
<td>I dunno either</td>
</tr>
<tr class="even">
<td><dl>
<dt>Code</dt>
<dd>
Used fixed width font. Most programming languages can be color-coded in
this wiki.
</dd>
</dl></td>
<td><pre><code>&lt;pre&gt;
&lt;tool id=&quot;get_flanks1&quot; name=&quot;Get flanks&quot;&gt;
  &lt;description&gt;
    returns flanking region/s for genes
  &lt;/description&gt;
  &lt;command interpreter=&quot;python&quot;&gt;
    get_flanks.py $input ...
  &lt;/command&gt;
...&lt;/pre&gt;</code></pre>
<hr />
<pre><code>&lt;tool id=&quot;get_flanks1&quot; name=&quot;Get flanks&quot;&gt;
  &lt;description&gt;
    returns flanking region/s for genes
  &lt;/description&gt;
  &lt;command interpreter=&quot;python&quot;&gt;
    get_flanks.py $input ...
  &lt;/command&gt;
...</code></pre></td>
<td><pre><code>&lt;syntaxhighlight lang=&quot;xml&quot;&gt;
&lt;tool id=&quot;get_flanks1&quot; name=&quot;Get flanks&quot;&gt;
  &lt;description&gt;
    returns flanking region/s for genes
  &lt;/description&gt;
  &lt;command interpreter=&quot;python&quot;&gt;
    get_flanks.py $input ...
  &lt;/command&gt;
...&lt;/syntaxhighlight&gt;</code></pre>
<hr />

<pre class="de1"><code>&lt;tool id=&quot;get_flanks1&quot; name=&quot;Get flanks&quot;&gt;
  &lt;description&gt;
    returns flanking region/s for genes
  &lt;/description&gt;
  &lt;command interpreter=&quot;python&quot;&gt;
    get_flanks.py $input ...
  &lt;/command&gt;
...</code></pre>

</td>
</tr>
<tr class="odd">
<td><dl>
<dt>Instructions that are not to be performed during class</dt>
<dd>
These can be negative examples or things were done to the VMware image
before the course.
</dd>
</dl></td>
<td><pre><code>
&lt;div class=&quot;dont&quot;&gt;
Here&#39;s an example of what &#39;&#39;not&#39;&#39; to do:
 cd /;
 sudo rm -rf *
&lt;/div&gt;  </code></pre>
<hr />

<p>Here's an example of what <em>not</em> to do:</p>
<pre><code>cd /
sudo rm -rf *</code></pre>
</td>
<td>Same</td>
</tr>
<tr class="even">
<td><dl>
<dt>GUI Interaction</dt>
<dd>
Looking for terseness and clarity
</dd>
</dl></td>
<td><p><br />
Now, to enable this theme, navigate to Administer, Site Building, Themes
page and select the Pixture Reloaded radio button.</p>
<hr />
<p>Now, to enable this theme, navigate to Administer, Site Building,
Themes page and select the Pixture Reloaded radio button.</p></td>
<td><p><br />
Now, to enable this theme, ''navigate'' to the '''Administer &amp;rarr;
Site Building &amp;rarr; Themes''' page and ''select'' the '''Pixture
Reloaded''' button.</p>
<hr />
<p>Now, to enable this theme, <em>navigate</em> to the
<strong>Administer → Site Building → Themes</strong> page and
<em>select</em> the <strong>Pixture Reloaded</strong> button.</p></td>
</tr>
</tbody>
</table>

## Embedding Media

The GMOD wiki uses
<a href="http://www.mediawikiwidgets.org/Widgets_Catalog"
class="external text" rel="nofollow">Widgets</a> to embed various types
of file.

### Flash

To embed Flash into a page, use the following syntax:

    <oflash file="File:Movie.swf" caption="A cool flash movie that I made" width=500 height=900 />

More documentation on the
<a href="http://www.mediawiki.org/wiki/Extension:OFlash"
class="external text">OFlash MediaWiki page</a>.

## Writing Code

The GMOD wiki employs the extension
<a href="http://www.mediawiki.org/wiki/Extension:SyntaxHighlight_GeSHi"
class="external text">Syntax Highlight GeSHi</a> to produce code with
highlighting. For coloured code, use the ` <syntaxhighlight>` tag:

    <syntaxhighlight lang="perl">
    #!/usr/bin/perl
    my $life = "over";
    die("Goodbye, cruel world!");
    </syntaxhighlight>

```de1
 #!/usr/bin/perl
 my $life = "over";
 die("Goodbye, cruel world!");
```

Languages supported include Javascript, Java, Perl, PHP, XML, CSS, and
more. Full documentation can be found on the
<a href="http://www.mediawiki.org/wiki/Extension:SyntaxHighlight_GeSHi"
class="external text">Syntax Highlight GeSHi</a> MediaWiki page.

## Adding References

If you wish to reference a paper with a PubMed ID or a digital object
identifier (DOI), the full information can be automatically retrieved
from PubMed or the CrossRef server for you. To create the reference, use
the `<ref />` tag:

```de1
<ref name=PMID:15752432 />
```

The `name` attribute can contain either a PubMed ID in the form
PMID:00000000 or a DOI in the form DOI:10.1186/1471-2164-14-741.

Put the tag `<references />` where you want the full references to
appear on the page. The full details of each paper will magically appear
in place of the `<references />` tag.

### Example

**Wikitext**

    The 2013 paper by Leite ''et al.'' on the grooved shell carpet clam <ref name="DOI:10.1186/1471-2164-14-741" />
    represents a first attempt to characterize ''Ruditapes decussatus'' transcriptome; it cites the classic Ficklin
    ''et al.'' Tripal paper <ref name="PMID:21959868" />.

    <references />

**Result**

The 2013 paper by Leite _et al._ on the grooved shell carpet
clam<sup>[\[1\]](#cite_note-DOI:10.1186.2F1471-2164-14-741-1)</sup>
represents a first attempt to characterize _Ruditapes decussatus_
transcriptome; it cites the classic Ficklin _et al._ Tripal paper
<sup>[\[2\]](#cite_note-PMID:21959868-2)</sup>.

1.  <span id="cite_note-DOI:10.1186.2F1471-2164-14-741"><span class="mw-cite-backlink">[↑](#cite_ref-DOI:10.1186.2F1471-2164-14-741_0)</span>
    **Cite error: Invalid `<ref>` tag; no text was provided for refs
    named `DOI:10.1186.2F1471-2164-14-741`**</span>
2.  <span id="cite_note-PMID:21959868"><span class="mw-cite-backlink">[↑](#cite_ref-PMID:21959868_0)</span>
    **Cite error: Invalid `<ref>` tag; no text was provided for refs
    named `PMID:21959868`**</span>

## Component Information Pages

The information pages about each component are generated by feeding the
information on the `tool_data` page through a template. To edit what
appears on the component page, you need to edit the corresponding
`tool_data` page.

Tool data is stored in tag-value pairs in the format

     | tag = value

The value can be formatted wiki text or a wiki template, and may span
numerous lines. For example:

    | tag = value
    | tag = '''value'''
    | tag = [[Main Page|A link to a page]]

    Some more wikitext here

    [[Site Guidelines|A link to another page]]
    | tag = Include A Template

The `tool_data` pages essentially act as a data store, and the page
[Template:ToolDisplay](/wiki/Template:ToolDisplay)
parses and formats the data to produce a standardized GMOD component
page.

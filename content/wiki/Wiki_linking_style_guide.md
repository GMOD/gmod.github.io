---
title: "Wiki linking style guide"
---




<span id="top"></span>


# <span dir="auto">Wiki linking style guide</span>









NOTE: This style guide was written for gmod.org when it was hosted in a
MediaWiki server and may not make a lot of sense in the markdown context.

Stolen wholesale from BioPerl wiki
<a href="http://www.bioperl.org/wiki/Style_guide" class="extiw"
title="bp:Style guide">Style Guide</a>. See also the [Site
Guidelines](Site_Guidelines "Site Guidelines").

<table class="wikitable">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>What you want</th>
<th>Enter this</th>
<th>To create this</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Internal Wiki link</td>
<td><code>[[GMOD_Middleware|GMOD Middleware]]</code></td>
<td><a href="GMOD_Middleware" title="GMOD Middleware">GMOD
Middleware</a></td>
</tr>
<tr class="even">
<td>Internal Wiki link w/ display name</td>
<td><code>[[GMOD_Middleware|GMOD middleware meeting]]</code></td>
<td><a href="GMOD_Middleware" title="GMOD Middleware">GMOD middleware
meeting</a></td>
</tr>
<tr class="odd">
<td>BioPerl wiki link</td>
<td><code>BioPerl|Style_guide</code></td>
<td><a href="http://bioperl.org/wiki/BioPerl:Style_guide"
class="external text" rel="nofollow">Style_guide</a></td>
</tr>
<tr class="even">
<td>BioPerl interWiki link</td>
<td><code>[[bp:BioPerl:Style_guide|Bioperl Style Guide]]</code></td>
<td><a href="http://www.bioperl.org/wiki/BioPerl:Style_guide"
class="extiw" title="bp:BioPerl:Style guide">Bioperl Style
Guide</a></td>
</tr>
<tr class="odd">
<td>Wikipedia interWiki link</td>
<td><code>[[wp:The Beatles|The Fab Four]]</code></td>
<td><a href="http://en.wikipedia.org/wiki/The_Beatles" class="extiw"
title="wp:The Beatles">The Fab Four</a></td>
</tr>
<tr class="even">
<td>BioPerl module link</td>
<td><code>BPM|Bio::SeqIO</code></td>
<td><a href="http://bioperl.org/wiki/Module:Bio::SeqIO"
class="external text" rel="nofollow">Bio::SeqIO</a></td>
</tr>
<tr class="odd">
<td>GMOD SourceForge <a href="SVN" class="mw-redirect"
title="SVN">SVN</a> file/directory</td>
<td><code>SF_SVN|schema/trunk/chado/INSTALL.Chado|Chado install instructions</code></td>
<td><a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/schema/trunk/chado/INSTALL.Chado"
class="external text" rel="nofollow">Chado install instructions</a></td>
</tr>
<tr class="even">
<td>CPAN module link</td>
<td><code>CPAN|Class::DBI</code></td>
<td><a href="http://search.cpan.org/perldoc?Class::DBI"
class="external text" rel="nofollow">Class::DBI</a></td>
</tr>
<tr class="odd">
<td>Bare URL</td>
<td><code>http://www.google.com/</code></td>
<td><a href="http://www.google.com/" class="external free"
rel="nofollow">http://www.google.com/</a></td>
</tr>
<tr class="even">
<td>Display an image</td>
<td><code>[[Image:Bioperl-pub-data.png]]</code></td>
<td>Not working yet</td>
</tr>
<tr class="odd">
<td>URL w/ display name</td>
<td><code>[http://www.google.com/ Search Google]</code></td>
<td><a href="http://www.google.com/" class="external text"
rel="nofollow">Search Google</a></td>
</tr>
<tr class="even">
<td>Put page in category</td>
<td><code>[[Category%253ATools]]</code></td>
<td><em>(link to other Tools in page footer)</em></td>
</tr>
<tr class="odd">
<td>Sign your name with date</td>
<td><code>~~~~</code></td>
<td>scott 02:11, 28 December 2005 (EST)</td>
</tr>
<tr class="even">
<td>Filenames, paths, $ENV_VARS</td>
<td><code>&lt;tt&gt;$PREFIX/lib/perl.so&lt;/tt&gt;</code></td>
<td><code>$PREFIX/lib/perl.so</code></td>
</tr>
<tr class="odd">
<td>Inline code examples</td>
<td><code>&lt;code&gt;$fh-&gt;print("BioPerl")&lt;/code&gt;</code></td>
<td><code>$fh-&gt;print("BioPerl")</code></td>
</tr>
<tr class="even">
<td>Blocks of code</td>
<td>Indent it, or use <code>PRE</code> tags, or custom language
tags:<br />
<code>&lt;syntaxhighlight lang="perl"&gt;</code><br />
<code>#!/usr/bin/perl -w</code><br />
<code>use strict;</code><br />
<code>use Bio::Perl;</code><br />
<code>my $db = Bio::DB::GenBank-&gt;new&lt;br&gt;&lt;/syntaxhighlight&gt;</code></td>
<td>

<pre class="de1"><code>#!/usr/bin/perl -w
use strict;
use Bio::Perl;
my $db = Bio::DB::GenBank-&gt;new;</code></pre>

</td>
</tr>
</tbody>
</table>




[Categories](Special%253ACategories "Special%253ACategories"):

- [BioPerl](Category%253ABioPerl "Category%253ABioPerl")
- [Wiki Tools](Category%253AWiki_Tools "Category%253AWiki Tools")
- [GMOD Web Site](Category%253AGMOD_Web_Site "Category%253AGMOD Web Site")
- [Help](Category%253AHelp "Category%253AHelp")






## Navigation menu







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



- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Wiki_linking_style_guide"
  rel="smw-browse">Browse properties</a></span>





- <span id="footer-info-lastmod">Last updated at 20:06 on 8 October 2012.</span>
<!-- - <span id="footer-info-viewcount">48,216 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->



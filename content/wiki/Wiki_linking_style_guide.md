---
title: "Wiki linking style guide"
---
# Wiki linking style guide

NOTE: This style guide was written for gmod.org when it was hosted in a
MediaWiki server and may not make a lot of sense in the markdown context.

Stolen wholesale from BioPerl wiki
<a href="http://www.bioperl.org/wiki/Style_guide" class="extiw"
title="bp:Style guide">Style Guide</a>. See also the [Site
Guidelines](/wiki/Site_Guidelines).

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
<td><a href="/wiki/GMOD_Middleware" title="GMOD Middleware">GMOD
Middleware</a></td>
</tr>
<tr class="even">
<td>Internal Wiki link w/ display name</td>
<td><code>[[GMOD_Middleware|GMOD middleware meeting]]</code></td>
<td><a href="/wiki/GMOD_Middleware" title="GMOD Middleware">GMOD middleware
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
<td>GMOD SourceForge <a href="/wiki/SVN" class="mw-redirect"
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

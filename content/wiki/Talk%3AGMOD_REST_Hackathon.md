---
title: "Talk:GMOD REST Hackathon"
---
# Talk:GMOD REST Hackathon

  language groups</span>](#Programming_language_groups)
  - [PHP](#PHP)
  - [Perl](#Perl)
  - [Java](#Java)
  - [API
    structure](#API_structure)
  - [Misc
    Info](#Misc_Info)
  - [Pretty
    URLs](#Pretty_URLs)
  - [Other
    Backend APIs to Compare/Be Inspired
    By](#Other_Backend_APIs_to_Compare.2FBe_Inspired_By)
  - [Info from
    Adrian](#Info_from_Adrian)

# Programming language groups

## PHP

- Jim

Additional documentation/discussion at
[GMOD_RPC_API/PHP](GMOD_RPC_API/PHP "GMOD RPC API/PHP")

## Perl

- Rob
- Josh --Coordinator
- Jay
- Chris

## Java

- Brian
- Richard --Coordinator
- Josh

## API structure

- Controller to handle dispatching requests
- Plugin layer for data models
- View layer for rending XML, JSON, etc...

  

## Misc Info

- POST for read operations is ok to get around URL character limits w/
  GET
- Pretty URLs are limited and we should use a mix pretty URLS and
  param/value CGI calls
- Extend services for SO terms (exon, UTRs, etc...)
  - example gene/exon or chromosome/exon

## Pretty URLs

- Do we need mod_rewrite?
  - for php, use directory/index.php? No. appended directory/foo gives a
    404

## Other Backend APIs to Compare/Be Inspired By

- <a href="http://www.biojava.org/wiki/Dazzle:writeplugin"
  class="external free"
  rel="nofollow">http://www.biojava.org/wiki/Dazzle:writeplugin</a>
- <a href="http://seqware.sf.net" class="external text"
  rel="nofollow">SeqWare Query Engine</a> uses
  <a href="http://www.restlet.org" class="external text"
  rel="nofollow">Restlet</a> as a restful API, code available at "svn co
  <a
  href="https://seqware.svn.sourceforge.net/svnroot/seqware/trunk/seqware-queryengine/webservice/"
  class="external free"
  rel="nofollow">https://seqware.svn.sourceforge.net/svnroot/seqware/trunk/seqware-queryengine/webservice/</a>
  seqware-queryengine-webservice"

## Info from Adrian

From: art@xxxx To: jogoodma@xxxxx Cc: art@xxxxxxx Subject: GMOD REST API
feedback

Hi,

Firstly is there anyone there who I can skype for the first part of the
meeting, to follow the discussion?

Secondly, I implemented most of the spec for the Oxford meeting. We have
a bit of work to update to our latest libraries which I might do
tonight. I have a few observations. I've already mentioned some of these
to Giles so sorry if they've already been raised. I love the idea of the
common API so in that spirit a few constructive criticisms:

- I don't think the API is very RESTful, in the strictest sense. See eg

<a
href="http://roy.gbiv.com/untangled/2008/rest-apis-must-be-hypertext-driven"
class="external free"
rel="nofollow">http://roy.gbiv.com/untangled/2008/rest-apis-must-be-hypertext-driven</a>

I think the versioned API is a good idea, more important than strict
REST compliance. I just wonder if the label \*might\* cause problems in
a future publication or more importantly its takeup amongst purists. But
REST is such a overused term that maybe this doesn't matter.

  

- A small general problem for us is the use of NCBI taxonomy ids. Our

difficulty is always getting NCBI ids for new projects in a timely
matter, and for representing multiple samples of the same strain. It
might be good to say that the ids should be NCBI taxonomy ids if
possible, but that sequencing centres may also use 'internal' IDs.
Effectively this means people should always fetch the .../organisms
first to get the ids. This is really just requesting a textual
relaxation in the spec. (I'll also repeat my comment from the Oxford
workshop that it seems slightly odd that the 2 GMOD URL-related specs
use different methods of identifying organisms)

  

- Biggest point - the URLs are all constructed to avoid using query

parameters. From the Sam Ruby O'Reilly REST book it certainly doesn't
seem to be taboo to use them. One point is that forcing everything into
(possibly optional) positions in the URL makes both implementation, and
requesting more difficult if you're using a URI template-style
implementation, as we are. If you allow query parameters the gene
location could be:

<a href="http://yourmod.org/gmodrest/v" class="external free"
rel="nofollow">http://yourmod.org/gmodrest/v</a>\<api
version\>/location/chromosome/\<name\>/gene\[.xml \|
.json\]?\[min=\[fmin/\<int\>\]&\[fmax/\<int\>\]&\[strand/(1 \| -1)\]

eg <a
href="http://www.genedb.org/gmodrest/v1/location/chromosome/Tb927_v4.xml"
class="external free"
rel="nofollow">http://www.genedb.org/gmodrest/v1/location/chromosome/Tb927_v4.xml</a>

and

<a
href="http://www.genedb.org/gmodrest/v1/location/chromosome/Tb927_v4.xml&amp;fmax=2000"
class="external free"
rel="nofollow">http://www.genedb.org/gmodrest/v1/location/chromosome/Tb927_v4.xml&amp;fmax=2000</a>

This looks more natural to me, is more self-descriptive and is
completely compatible with REST principles. The implementation point
obviously isn't that important as it's a one-off cost but the I think
the naturalness is. What do other people think?

  

- The final issue I see here is that the Organism XML page is a bit

indefinite. The example links either don't work or return quite
different XML. Is it in scope to produce a RNC or XML schema to tie this
down?

Adrian

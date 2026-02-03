---
title: "Talk:GMOD REST Hackathon"
---




<span id="top"></span>




# <span dir="auto">Talk:GMOD REST Hackathon</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Programming
  language groups</span>](#Programming_language_groups)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">PHP</span>](#PHP)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">Perl</span>](#Perl)
  - [<span class="tocnumber">1.3</span>
    <span class="toctext">Java</span>](#Java)
  - [<span class="tocnumber">1.4</span> <span class="toctext">API
    structure</span>](#API_structure)
  - [<span class="tocnumber">1.5</span> <span class="toctext">Misc
    Info</span>](#Misc_Info)
  - [<span class="tocnumber">1.6</span> <span class="toctext">Pretty
    URLs</span>](#Pretty_URLs)
  - [<span class="tocnumber">1.7</span> <span class="toctext">Other
    Backend APIs to Compare/Be Inspired
    By</span>](#Other_Backend_APIs_to_Compare.2FBe_Inspired_By)
  - [<span class="tocnumber">1.8</span> <span class="toctext">Info from
    Adrian</span>](#Info_from_Adrian)



# <span id="Programming_language_groups" class="mw-headline">Programming language groups</span>

## <span id="PHP" class="mw-headline">PHP</span>

- Jim

Additional documentation/discussion at
[GMOD_RPC_API/PHP](GMOD_RPC_API/PHP "GMOD RPC API/PHP")

## <span id="Perl" class="mw-headline">Perl</span>

- Rob
- Josh --Coordinator
- Jay
- Chris

## <span id="Java" class="mw-headline">Java</span>

- Brian
- Richard --Coordinator
- Josh

## <span id="API_structure" class="mw-headline">API structure</span>

- Controller to handle dispatching requests
- Plugin layer for data models
- View layer for rending XML, JSON, etc...

  

## <span id="Misc_Info" class="mw-headline">Misc Info</span>

- POST for read operations is ok to get around URL character limits w/
  GET
- Pretty URLs are limited and we should use a mix pretty URLS and
  param/value CGI calls
- Extend services for SO terms (exon, UTRs, etc...)
  - example gene/exon or chromosome/exon

## <span id="Pretty_URLs" class="mw-headline">Pretty URLs</span>

- Do we need mod_rewrite?
  - for php, use directory/index.php? No. appended directory/foo gives a
    404

## <span id="Other_Backend_APIs_to_Compare.2FBe_Inspired_By" class="mw-headline">Other Backend APIs to Compare/Be Inspired By</span>

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

## <span id="Info_from_Adrian" class="mw-headline">Info from Adrian</span>

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








## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AGMOD_REST_Hackathon" accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>





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




- <span id="footer-info-lastmod">Last updated at 21:11 on 15 January
  2010.</span>
<!-- - <span id="footer-info-viewcount">29,863 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





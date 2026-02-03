---
title: "Talk:Bio%253A%253AChado%253A%253ASchema"
---




<span id="top"></span>




# <span dir="auto">Talk:Bio%253A%253AChado%253A%253ASchema</span>









# <span id="Boundaries_between_BCS_and_Modware" class="mw-headline">Boundaries between BCS and Modware</span>

Where is the boundary between this and [modware](Modware "Modware")
then? I thought the point of modware was to provide that level of
compatibility. [Scott](User%253AScott "User%253AScott") 17:55, 14 April 2011
(UTC)

------------------------------------------------------------------------

Well, Modware's not my project, but it just has a lot more stuff in it,
and it uses BCS as a data access layer. It's a comprehensive, heavy data
model, with high-level abstractions like 'Gene', while BCS is basically
just a thin wrapper around the Chado tables. It's also Moosey, with
everything that goes along with that.

Being a thin wrapper doesn't mean BCS can't have some BioPerl
compatibility though. The only example so far is that
BCS::Result::Sequence::Feature implements Bio::PrimarySeqI, but that's
illustrative of how a thin wrapper can be Bioperl compatible. Feature's
implementation of SeqI is mostly just aliasing the DBIC column accessors
to the Bio::SeqI accessors: \`seq()\` is an alias for \`residues()\`,
\`display_id()\` is an alias for \`name()\`, etc.

I don't think anything much more involved than that belongs in BCS
though. --[RobertBuels](User%253ARobertBuels "User%253ARobertBuels") 18:15, 14
April 2011 (UTC)








## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk:Bio%253A%253AChado%253A%253ASchema" accesskey="t"
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




- <span id="footer-info-lastmod">Last updated at 18:17 on 14 April
  2011.</span>
<!-- - <span id="footer-info-viewcount">8,753 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





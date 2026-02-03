---
title: "News/Bio%253A%253AChado%253A%253ASchema 0.05 Released"
---
# News/Bio%253A%253AChado%253A%253ASchema 0.05 Released

I'd like to announce a new
[Bio%253A%253AChado%253A%253ASchema](../Bio%253A%253AChado%253A%253ASchema)
release, version 0.05. Changes in this release:

- Got POD generation working, now all classes and methods have POD,
  **including** the embedded table and column comments! Thanks to the
  wonderful DBIx::Class::Schema::Loader folks.
- Turned off DBIC's cascade_delete and cascade_copy on all relations
  (thanks to Siddhartha Basu for troubleshooting). Deletes break if
  these are on and you don't have every part of the schema installed.

I <a href="http://search.cpan.org/dist/Bio-Chado-Schema/"
class="external text" rel="nofollow">uploaded</a> it to
<a href="http://cpan.org" class="external text" rel="nofollow">CPAN</a>
a week ago, so it should have propagated by now to almost all of the
CPAN mirrors.

See the [Bio%253A%253AChado%253A%253ASchema](../Bio%253A%253AChado%253A%253ASchema)
wiki page for more on what
[Bio%253A%253AChado%253A%253ASchema](../Bio%253A%253AChado%253A%253ASchema) is and
what it's for.

[Rob Buels](../User%253ARobertBuels)
[SGN](../Category%253ASGN)



*Posted to the [GMOD News](../GMOD_News) on 2010/01/08*


- [News Items](../Category%253ANews_Items)

---
title: "Bio%253A%253AChado%253A%253ASchema"
---
# Bio%253A%253AChado%253A%253ASchema

Bio%253A%253AChado%253A%253ASchema is a standard
<a href="http://search.cpan.org/perldoc?DBIx::Class"
class="external text" rel="nofollow">DBIx::Class</a> layer for Chado, in
Perl. DBIx::Class is an object-relational mapping system similar to
other ORMs in other languages, such as Python's SQLAlchemy and Java's
Hibernate.

**If you use Chado and Perl, please consider contributing to the
project. See the Development section below.**

Bio%253A%253AChado%253A%253ASchema is a standard set of Perl modules that should work
with any database supported by DBIx::Class. So far, it has been used
successfully with Chado schemas running on both PostgreSQL and Oracle.
Please try it out and report back to the mailing list!

  Development](#Development)
  - [To-Do](#To-Do)
  - [Contributors](#Contributors)
- [Documentation](#Documentation)
- [Download](#Download)
- [Support](#Support)

## Development

Development of Bio%253A%253AChado%253A%253ASchema uses `git`, hosted on GitHub:
<a href="http://github.com/solgenomics/bio-chado-schema"
class="external free"
rel="nofollow">http://github.com/solgenomics/bio-chado-schema</a>

### To-Do

- Need many more many_to_many relationships throughout. These have to be
  added manually. If you find one missing that you need, please git
  clone the repository and send a pull request with it.
- Need more compatibility with BioPerl. Right now you can use a
  Sequence::Feature as a Bio::SeqI, but that's all. Patches and ideas
  are welcome, see the BCS discussion page.

### Contributors

- [Robert Buels](/wiki/User%253ARobertBuels) (Sol Genomics
  Network)
- [Naama Menda](/wiki/User%253ANaamaMenda) (Sol Genomics
  Network)
- Aureliano Bombarely (Sol Genomics Network)
- Jonathan "Duke" Leto (Sol Genomics Network)

## Documentation

API Documentation is in Perl POD format, and can be browsed at
<a href="http://search.cpan.org/dist/Bio-Chado-Schema"
class="external free"
rel="nofollow">http://search.cpan.org/dist/Bio-Chado-Schema</a>

## Download

Releases of Bio%253A%253AChado%253A%253ASchema are available on CPAN:
<a href="http://search.cpan.org/dist/Bio-Chado-Schema"
class="external free"
rel="nofollow">http://search.cpan.org/dist/Bio-Chado-Schema</a>

Use your preferred CPAN client to install it:

      cpan Bio%253A%253AChado%253A%253ASchema

is often sufficient.

## Support

|
|----|----|----|----|
|  | Mailing List Link | Description | Archive(s) |
| **Bio%253A%253AChado%253A%253ASchema** | <a href="https://lists.sourceforge.net/lists/listinfo/gmod-schema" |  |  |
class="external text" rel="nofollow">gmod-schema</a> | Use the <a href="/wiki/Chado" class="mw-redirect" title="Chado">Chado</a> list (gmod-schema) for all **Bio%253A%253AChado%253A%253ASchema** questions. | <a href="http://dir.gmane.org/gmane.science.biology.gmod.schema"
class="external text" rel="nofollow">Gmane</a>, <a href="http://old.nabble.com/gmod-schema-f3506.html"
class="external text" rel="nofollow">Nabble (old)</a>, <a href="http://gmod.827538.n3.nabble.com/Chado-f815597.html"
class="external text" rel="nofollow">Nabble (new, 2010/05+)</a>, <a
href="http://sourceforge.net/mailarchive/forum.php?forum_name=gmod-schema"
class="external text" rel="nofollow">Sourceforge</a> |

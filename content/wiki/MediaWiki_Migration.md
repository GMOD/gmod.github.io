---
title: "MediaWiki Migration"
---
# MediaWiki Migration

In June, 2024, we undertook a migration from a rather aged MediaWiki instance that has
housed gmod.org for nearly 20 years to a set of markdown files that are now
stored in a [GitHub repo](https://github.com/GMOD/gmod.github.io) and hosted
by GitHub.io.

## Details

While I'd hoped to use a straight forward path suggested in several places on the web
(MediaWiki XML dump -> Pandoc -> markdown), I realized after a few days of
trying that this wouldn't work: the GMOD MediaWiki instance used several
Templates extensively, and the content that results from those templates getting
executed in the process of pages being displayed weren't present in the dumped
XML, just the fact that those templates were being called. So, to use the XML
dump, would have to have written my own (I couldn't find one) template ->
XML producer to fill in the blanks.

What I realized while thinking about the template problem is that I had a
template evaluator in the form of MediaWiki itself, I just had to write a spider
that would crawl the entire site and save the files as html (or markdown, if
I were clever enough). Since I tend to reach for Perl first in this sort
of situation, I spent a little time thinking about writing a bespoke spider
to do what I wanted. I think it was Colin Diesh (yes,
that user page is waaaay out of date) that suggested that I just try mirroring
the site to my local computer with `wget`. After a few false starts trying to
mirror it to my workhorse laptop (the big problem was that the wget process didn't always
restart successfully after being asleep), I ran `wget2` on an old laptop that I
could leave running non-stop for the 4+ days it took to mirror the entire site
(I put a 20 second wait between fetches to avoid DDOSing our own site). The result
was over 18,000 files.

### Converting html to markdown files

Before I tried trimming down the number of files I had, I undertook the transformation
from html to markdown so that I could import markdown files into GitHub before
trying to reduce the number of files. The obvious reason for this is that if I
accidentally "over deleted" I could roll back. It had the added benefit that browsing
the files in the GitHub web interface would give me an idea of how the generated
markdown was being evaluated (though it appears that the GitHub web UI treats
markdown differently than jekyll).

Pandoc seemed like the obvious choice for that, so I wrote a [perl script](../html_to_md.pl)
that would iterate over all of the files, handling a weird edge case (Pandoc
refused to treat an html file that had a `.pdf` extension as an html file,
which I suppose I can't blame it for (thank MediaWiki for making those files)) and
running Pandoc to generate gft (GitHub-Flavored Markdown). The resulting files
where imported in the gmod.github.io repo.

### Trimming down the file count

Yeah, 18,000 is a lot. GMOD is a big and "old" project, but that still seems crazy.
There were multiple sources of "extra" files:

- SemanticMediaWiki: the GMOD MediaWiki used this extension that provides a lot of
 really cool metadata pages but most of them didn't make sense outside of the context
 of MediaWiki. Conveniently, these files were either named in such a way that it was
 obvious what they were or were in subdirectories that I could wholesale delete.
 Some of those files still exist, like this "Special:Browse" page for
 , which lists what categories Apollo is tagged with.
- Special MediaWiki pages: there are lots of pages that MediaWiki will generate
 including history, talk and Template pages. Again these are pretty easy to identify and remove.
- Uploads: There are nearly 5000 files in the MediaWiki `images` directory
 (which is more than just images, it's also PDF and PowerPoint presentations
 from meetings). These need to be kept but they also present another issue,
 discussed below.
- "File:" files: MediaWiki creates files for every upload. Getting rid of these files
 is easy, but there were MANY references in the other files to these File: files.
 I had to create a list of these File: files and the URLs of the uploaded files
 that they referred to with this [script](../make_File_lookup.pl) and then
 write a script that would [substitute image references in the markdown files](../fix_File_urls.pl).

After trimming out lots of unnecessary files, the file count was reduced to just
under 9000 (still a lot!)

### Getting jekyll to build

The were a few issues with getting `jekyll` to build in the GitHub context. The
first was the size of the repository: GitHub limits the size of a GitHub.io
repository to 1 GB, but even after deleting about half of the files from the
initial dump, the repo is about 2 GB. Fortunately, about 1.5 GB of that is
in the "images" directory, which I could then just serve up directly from
the repo via the "raw" URLs. I just had to configure jekyll to ignore the
directory that contains the uploads. An additional issue related to the size of
the repository is that GitHub also indicates in their documentation that
the jekyll build times are limited to 10 minutes, but the build currently
takes about 15 minutes. Hopefully GH won't notice.

The other issue is that jekyll doesn't like colons (:) in file names. While it
is possible that I could configure around that, my inexperience with jekyll
combined with a reasonable desire to keep special characters out of URLs anyway,
conspired to lead me down the path of replacing colons with its URI escape code,
`%3A`. Implementing this required a 2 and a half step process, run several times
over subsets of the files that had colons in their names. Since I was making
bulk changes to hundreds or thousands of files at a time, I wanted to make sure
that I was working with a small enough set for most of the change steps that I
could examine `git diff` results after the steps were complete. The steps
generally looked like this:

1. Rename the files themselves. This is the easy step. I create a list of the
 files I want to modify and put them in a file. Then I modify the file in NeoVim
 to make it a simple bash script that will `git mv` the files, renaming to include
 `%3A` replacing the colon(s).
2. The second step is a little more complicated, as it has to update all references
 to the original file names to the updated file names. To do this, I start with the
 same list of original file names in step 1 and then again use NeoVim to modify
 the list to a series of command line perl executions to do inline replacements.
 There are example scripts that remain from this step in the top level
 directory of this repo, like this one for updating references to files in
 the ["Special" directory](../perl_special.sh). Basically, a lot of the updates
 take the form of this Perl command line invocation:
 ```
 perl -pi -e 'BEGIN{undef $/;} s/Bio::GMOD/Bio%3A%3AGMOD/smg' *
 ```
 This command line form was a real workhorse of this project. One downside
 to this approach is that text references to these file (like the anchor text
 for URLs that are getting created) will also have the substituted text. That is
 annoying but I'm willing to live with it given that the regex required to
 avoid it would be fragile and/or really hard to write and I didn't want to
 spend the time on it.

The "half" step I referred to above was due to the fact that jekyll also doesn't
like "%" in hrefs that it writes, so those had to be expanded in markup files,
so filenames that had %3A added to them to escape colons, now had to have the
% sign escaped, so there are lots of instances of `%253A`. How that percent
sign didn't have to be escaped I don't know but I'm thankful for the fact
that it didn't devolve into an infinite loop.

### Fixing translation issues and generally cleaning up

There are lots of fixes that were performed on the files as a whole that used
similar perl cli invocations like the one above. Many links to files that don't
exist in the repo, either because the file they linked to were removed in the
clean up outlined above or because they didn't exist to begin with. There
were also lots of html `span`s and `div`s removed that caused jekyll to
incorrectly render the markdown into html.

There is one big class of "broken rendering" that remains in this codebase:
Pandoc had a hard time creating markdown tables where there were html href links
in table cells, and so it left the html mark up, which then causes jekyll to
incorrectly convert those tables back into html. They remain because they are messy
and the only way I could figure out how to fix them in a clean way was to do
it in a one-off basis. If you see them in a page you care about, please do
some clean up and create a pull request.

## Acknowledgements

Special thanks to Colin Diesh who bounced around some ideas when I was working on this
and to Peter Cock who pointed out examples of OpenBio sites like
[BioSQL.org](/wiki/biosql.org) that had successfully made a similar transition, so I
could use their jekyll config for a cheatsheet.

Thanks to everybody who has ever had any involvement in the GMOD project, since
it is because of you that there is so much content that needed my attention in
this porting process.

Scott

July 29, 2024

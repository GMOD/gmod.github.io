---
title: "JBrowseDev/The UrlTemplate Option"
---
# JBrowseDev/The UrlTemplate Option

In [JBrowse](../JBrowse.1 "JBrowse"), the urlTemplate option is used to
link features to an external website.

# Examples

If you would like to follow along with the next few examples, switch to
your jbrowse directory, then input the volvox sequence:

    bin/prepare-refseqs.pl --fasta docs/tutorial/data_files/volvox.fa

**1. Link each feature to the same url**

As a simple example, this call to flatfile-to-json.pl will link every
feature in the track to google.com:

    bin/flatfile-to-json.pl --urlTemplate http://www.google.com --type remark --gff docs/tutorial/data_files/volvox.gff3 --tracklabel same_URL

Admittedly, when used in this way, urlTemplate is not very useful.

**2. Link each feature to its own url**

In order to make urlTemplate link different features to different urls,
try this example:

    bin/flatfile-to-json.pl --urlTemplate http://www.google.com/search?q={name} --getLabels --type remark --gff docs/tutorial/data_files/volvox.gff3 --tracklabel unique_URLs

Now, for any given feature, clicking on the link causes google to be
queried for that feature's name. With the correct website, this function
could be used to link each feature to an annotation page that
specifically describes it.

# Explanation

In order to understand how this works, it is necessary to understand a
few aspects of the output JSON. Before reading any further, open the
first output JSON file:

    less data/tracks/ctgA/same_URL/trackData.json

By default, the JSON file is as compact as possible, containing the
minimum amount of data necessary for the javascript to render the track.
Locate the "headers" key toward the beginning of the text. This key
should be associated with the JSON array:
\["start","end","strand","id"\]. These are the types of feature data
that the flatfile-to-json.pl script preserves by default. Further down,
following the "featureNCList" key, you will find the actual feature data
that corresponds to these column headers.

Next, open 'data/tracks/ctgA/unique_URLs/trackData.json'.

    less data/tracks/ctgA/unique_URLs/trackData.json

Once again, locate the "headers" array. In addition to the columns that
were previously present, there is now an additional one called "name".
This is present because of the --getLabels switch that was used in the
second call to flatfile-to-json.pl.

By putting any of the headers from the output JSON files in curly
braces, the values in the header's column are substituted for each
individual feature. In the case of the above example, the names of each
feature are substituted. It is also possible to substitute values from
any of the other columns, e.g.:

    ... --urlTemplate http://www.google.com/search?q={start} ...

# See also

- <a href="General_Usage" class="mw-redirect"
  title="JBrowseDev/General Usage">General Usage Notes</a>

:

- [JBrowse](../Category%253AJBrowse "Category%253AJBrowse")

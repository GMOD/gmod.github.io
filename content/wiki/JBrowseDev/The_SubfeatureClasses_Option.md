---
title: "JBrowseDev/The SubfeatureClasses Option"
---
# JBrowseDev/The SubfeatureClasses Option

In order to make subfeatures appear in
[JBrowse](../JBrowse.1), it is necessary to assign a
genome.css class to them. This is done in with an association list in
JSON syntax, where the key is the type of subfeature (e.g. CDS, UTR,
match_part, mRNA), and the value is the genome.css class that will be
used as the appearance of that subfeature.

As an example, the '--subfeatureClasses' argument to flatfile-to-json
might look something like '{ "CDS" : "transcript-CDS", "UTR" :
"transcript-UTR" }'. This could be rewritten as:

    '{
       "CDS" : "transcript-CDS",
       "UTR" : "transcript-UTR"
     }'

This second format makes the JSON structure more obvious, but the first
format is easier to use as a command line argument.

# See also

- <a href="/wiki/General_Usage" class="mw-redirect"
  title="JBrowseDev/General Usage">General Usage Notes</a>

- [JBrowse](../Category:JBrowse)

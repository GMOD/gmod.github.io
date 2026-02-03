---
title: "JBrowseDev/The ExtraData Option"
---




<span id="top"></span>




# <span dir="auto">JBrowseDev/The ExtraData Option</span>









In [JBrowse](../JBrowse.1 "JBrowse"), the extraData option causes
additional data from a data source to be incorporated into the output
file. In particular, it is useful when used with the urlTemplate option,
because the data it extracts can be used to query annotation databases.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Argument
  Structure</span>](#Argument_Structure)
- [<span class="tocnumber">2</span> <span class="toctext">Evaluation of
  the Subroutine: Three Main
  Points</span>](#Evaluation_of_the_Subroutine:_Three_Main_Points)
- [<span class="tocnumber">3</span> <span class="toctext">A Simple Use
  Case</span>](#A_Simple_Use_Case)
- [<span class="tocnumber">4</span> <span class="toctext">A Word of
  Caution</span>](#A_Word_of_Caution)
- [<span class="tocnumber">5</span> <span class="toctext">See
  also</span>](#See_also)



# <span id="Argument_Structure" class="mw-headline">Argument Structure</span>

The argument for the extraData option is a JSON association list, where
the keys are names (strings) and the values are perl subroutine
definitions (also strings). It will look something like this:

    '{
       "ColumnHeader1": "sub { <any perl subroutine> }",
       "ColumnHeader2": "sub { <any perl subroutine> }",
       ...
     }'

# <span id="Evaluation_of_the_Subroutine:_Three_Main_Points" class="mw-headline">Evaluation of the Subroutine: Three Main Points</span>

**1. The subroutine is evaluated once for each feature in the track.**

To convince yourself of this, switch to your jbrowse directory, and try
the following:

    $ bin/prepare-refseqs.pl --fasta volvox.fa
    $ bin/flatfile-to-json.pl --gff docs/tutorial/data_files/volvox.gff3 --tracklabel ExtraData_NoTrackChanges --type mRNA --extraData '{ "empty_column" : "sub { print(\"$0 is invoking the subroutine you defined.\\n\") }"}'

The message is printed four times, because there are four features whose
type is 'mRNA'. For this simple example, the subroutine did not return
anything, nor did it access the feature object it received as argument.

**2. For every evaluation of the subroutine, the subroutine receives
exactly one argument: a *feature object*.**

The ability to extract feature data from a data structure in the
underlying code suggests that we will need to understand how the data is
stored in that structure. After a few minor simplifications, this is
what the structure of each feature object looks like (in Perl syntax):

    {
      "attributes" => {
        # attributes are optional; the ones listed here may or may not be defined for a given feature.
        # also, there could be any number of additional attributes.
        "load_id" => [<list of strings>],
        "parent_id" => [<list of strings>],
        "Alias" => [<list of strings>],
        "Note" => [<list of strings>],
        ...
      },
      "ref" => <string>,
      "type" => <string>
      "name" => <string>,
      "phase" => <number>,
      "score" => <number>,
      "start" => <number>,
      "stop" => <number>,
      "strand" => <number>
    }

When the extraData subroutine is invoked, it is invoked with a feature
object (which has the data structure shown above) as the only argument.

As an example, to get the type for each feature, one could do:

    --extraData '{ "the_type" : "sub { return $_[0]->{\"type\"}; }" }'

or, equivalently,

    --extraData '{ "the_type" : "sub { shift->{\"type\"}; }" }'

I will describe the first syntax, since I think it is more intuitive.
\$\_\[0\] is a reference to the first argument to the subroutine (the
feature object), and the arrow pointing to the curly braced, escaped
string ("type") gets the data associated with that string from the
feature object. That data is then returned.

**3. The data returned by an extraData subroutine appears in the JSON
output file as a new column whose header is the key associated with the
subroutine.**

If you open the trackData.json file generated when extraData is used
(look in "data/tracks/\<chromosome name\>/\<track label\>/"), and locate
the "headers" array, you will notice that there are extra headers for
each subroutine used, and that these headers are the same strings used
as the keys in the JSON name-subroutine association list.

To find the headers array quickly, try:

    $ less data/tracks/<chromosome name>/<track label>/trackData.json
    /headers

The "/headers" command searches for the for the string "headers" in the
file opened by less. If you tried the example above, you would find the
string "the_type" in the headers array, and a a value for "the_type"
would be present for each feature.

# <span id="A_Simple_Use_Case" class="mw-headline">A Simple Use Case</span>

The above example was not quite a practical use of extraData, since it
performed the same operation that --getType performs. The only
difference between the above example and the result of --getType is that
I have chosen to refer to the extracted data as "the_type", and when it
is done through --getType, the data is referred to simply as "type".
Whenever you actually want to get the type data, you should use
--getType instead of extraData, since '--getType' is more succinct and
more easily understood.

Now, let's try to do something useful with --extraData that cannot be
done with any other option. Let's extract an attribute.

Here's the command to extract the load_id attribute:

    ... --extraData '{ "load_id" : "sub { return $_[0]->{\"attributes\"}->{\"load_id\"}[0]; }" }' ...

It turns out that there is a somewhat cleaner way of doing this:

    ... --extraData '{ "load_id" : "sub { return $_[0]->attributes(\"load_id\"); }" }' ...

Now, when it is desirable to use this data in another option, the header
associated with the data should be wrapped in curly braces, e.g.:

    ... --urlTemplate http://www.google.com/?q={load_id} ...

This is the most basic use case of extraData, where it is desirable to
get data from each feature object and then immediately return it as is.
With some knowledge of Perl, it would be straightforward to extend this
case to map a subroutine over the data, or to combine different types of
data.

# <span id="A_Word_of_Caution" class="mw-headline">A Word of Caution</span>

When you use the extraData option, the files with the data for the track
must get larger to accommodate this extra data. The larger the files
are, the longer it takes to load them from the server to the client. For
this reason, it might be wise to use extraData sparingly, and to
minimize the size of the data extracted from each feature.

# <span id="See_also" class="mw-headline">See also</span>

- <a href="General_Usage" class="mw-redirect"
  title="JBrowseDev/General Usage">General Usage Notes</a>




[Category](../Special%253ACategories "Special%253ACategories"):

- [JBrowse](../Category%253AJBrowse "Category%253AJBrowse")






## Navigation menu







<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>


### Navigation



- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>




### Documentation



- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/JBrowseDev-2FThe_ExtraData_Option"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:16 on 29 July
  2011.</span>
<!-- - <span id="footer-info-viewcount">11,760 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





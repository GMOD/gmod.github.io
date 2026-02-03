---
title: "JBrowseDev/The ClientConfig Option"
---
# JBrowseDev/The ClientConfig Option

The `--clientConfig` option can be used to customize the appearance of a
non-quantitative feature tracks.

  Representations of Non-Quantitative Tracks in
  JBrowse](#Representations_of_Non-Quantitative_Tracks_in_JBrowse)
- [Argument
  Structure](#Argument_Structure)
- [Descriptions
  of clientConfig Options](#Descriptions_of_clientConfig_Options)
- [Relevant CSS
  Attributes to be used with featureCss and
  histCss](#Relevant_CSS_Attributes_to_be_used_with_featureCss_and_histCss)
- [Examples](#Examples)
- [See
  also](#See_also)

# Representations of Non-Quantitative Tracks in JBrowse

Non-quantitative tracks have two different types of representations.
There is the traditional feature representation, where each feature is
visible as a horizontal bar extending from its start to end positions on
the reference sequence, and there is also a histogram representation,
where the density of features in each region of the reference sequence
is shown with a histogram. Normally, when zoomed in on a reference
sequence, the feature representation is used, and after zooming out to a
certain extent, it is replaced with the histogram representation. The
clientConfig option can be used to alter the appearance of either of
these representations, and can also be used to choose the zoom levels at
which the transition between them occurs. In addition, it can be used to
choose at which zoom levels the feature labels and subfeatures become
visible.

# Argument Structure

The structure of the argument to clientConfig looks something like this:

    '{
       "featureCss" : <string of css settings>,
       "histCss" : <string of css settings>,
       "histScale" : <pixels per feature>,
       "labelScale" : <pixels per feature>,
       "subfeatureScale" : <pixels per feature>,
       "featureCallback": <string of javascript code>
     }'

See
[JBrowse_Configuration_Guide#Using_callbacks_to_customize_feature_tracks](../JBrowse_Configuration_Guide#Using_callbacks_to_customize_feature_tracks)
for a discussion of the featureCallback option.

# Descriptions of clientConfig Options

You can think of clientConfig as being "an option with sub-options." Any
(or all) of these options can be omitted. Here is a list of them, along
with descriptions:

| Option | Description |
|----|----|
| featureCss | CSS configuration edits for the features. Overrides any configuration in genome.css. |
| histCss | CSS configuration edits for the histogram. Overrides any configuration in genome.css. |
| histScale | A number that defines the zoom levels at which the individual features are replaced with the histogram (or vice versa). For higher histScale values, the histogram representation will be used at more zoom levels (it will be necessary to zoom in more in order to view the feature representation). The default value is 4. |
| labelScale | A number that defines the zoom level at which the labels begin to be visible. Decreasing this value causes the feature label visibility transition to occur at a lower zoom level (when zoomed out further). The default value is 50. |
| subfeatureScale | A number that defines the zoom level at which the subfeatures begin to be visible. Decreasing this value causes the subfeature visibility transition to occur at a lower zoom level (when zoomed out further). The default value is 80. |

# Relevant CSS Attributes to be used with featureCss and histCss

With the exception of the height attribute, all of these can be used
with both featureCss and histCss:

| Option | Description | Input |
|----|----|----|
| height | The top to bottom height of each feature. | Some number of pixels (e.g., 5px). Do not edit the height property for histCss. Changing it will cause each of the histogram bars to be set to the same height. |
| background-color | the background color of each feature or each bar of the histogram. | A RGB hexadecimal color code (e.g. \#A4C or \#8FA366). |
| background-image | An image to use as the background for the features or histogram bars. | A path to an image file, with the syntax: url(\<path/to/image\>). |
| background-repeat | Describes how repetition of a background image will occur, if at all. | One of these: repeat, repeat-x, repeat-y, no-repeat. |
| border-style | The type of border each feature or histogram bar has. | One of these: solid, dotted, dashed, double, groove, ridge, inset, outset. |
| border-color | The border color of a feature or histogram bar. | A RGB hexadecimal color code (e.g. \#A4C or \#8FA366). |
| border-width | The thickness of the border for a feature or histogram bar. | Some number of pixels (e.g., 1px). |

# Examples

If you would like to follow along, please begin by switching to your
jbrowse directory and inputting the reference sequence:

    $ bin/prepare-refseqs.pl --fasta docs/tutorial/data_files/volvox.fa

**Example 1:** Change the colors in an existing CSS class.

    $ bin/flatfile-to-json.pl --gff docs/tutorial/data_files/volvox.gff3 --tracklabel PurpleFeatures --type mRNA --cssClass exon --clientConfig '{ "featureCss": "background-color:#9A61CF;border-color:#440D78"}'

Example explained: If the color of the features hadn't changed, they
would have been blue, as defined by the 'exon' class in genome.css. This
example demonstrates that input to clientConfig overrides the default
characteristics of a CSS class.

**Example 2:** Force a histogram to be displayed at low zoom levels.
Also, use a background image for the features.

    $ bin/flatfile-to-json.pl --gff docs/tutorial/data_files/volvox.gff3 --tracklabel AllFeatures --cssClass basic --clientConfig '{"histScale": 30, "histCss": "background-color:#11A""featureCss": "height:12px;background-image:url(img/helix2-green.png);background-repeat:repeat-x"}'

Example explained: Increasing histScale (from the default value 4)
causes the histogram to appear. The histogram is made blue by editing
the background color for histCss. The image for the features is created
using background-image and background-repeat for featureCss. This
example demonstrates the use of several clientConfig options at once.

**Example 3:** Cause the subfeatures to appear at all zoom levels.

    $ bin/flatfile-to-json.pl --gff docs/tutorial/data_files/volvox.gff3 --tracklabel SubfeaturesEverywhere --cssclass transcript --getSubs --subfeatureClasses '{"CDS": "transcript-CDS", "UTR": "transcript-UTR"}' --clientConfig '{"subfeatureScale": 0}'

Example explained: In order to make the subfeatures appear at all
levels, the value associated with subfeatureScale must be reduced. In
the extreme case that we want subfeatures visible at all zoom levels,
the value associated with subfeatureScale can simply be set to zero.
This idea is also applicable to labelScale (making the labels appear at
every zoom level) and histScale (making the histogram never appear).

**Example 4:** Cause the names to appear at the two highest zoom levels
only.

    $ bin/flatfile-to-json.pl --gff docs/tutorial/data_files/volvox.gff3 --tracklabel FewerZoomsWithNames --type match --getLabel --clientConfig '{"labelScale": 1600}'

Example explained: By default, the names appear at the seven highest
levels. This is demonstrated by counting the zoom levels with feature
labels from the track generated by:

    $ bin/flatfile-to-json.pl --gff docs/tutorial/data_files/volvox.gff3 --tracklabel MoreZoomsWithNames --type match --getLabel

Thus, the value of labelScale must be increased from the default value.
Assuming that each zoom-in operation with the smaller magnifying glass
icon approximately doubles the level of magification, the difference in
magnification between the second and seventh highest zoom levels is
approximately 32-fold. So multiplying 32 by the default value (50)
should yield a value for labelScale that is close to what we want, if
not precisely what we want. This logic is also applicable to
subfeatureScale and histScale.

# See also

- <a href="/wiki/General_Usage" class="mw-redirect"
  title="JBrowseDev/General Usage">General Usage Notes</a>


- [JBrowse](../Category%253AJBrowse)

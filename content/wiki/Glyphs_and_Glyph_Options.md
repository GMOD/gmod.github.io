---
title: "Glyphs and Glyph Options"
---
<span id="top"></span>

# <span dir="auto">Glyphs and Glyph Options</span>

## Contents

- [<span class="tocnumber">1</span> <span class="toctext">Selecting and
  Configuring Glyphs</span>](#Selecting_and_Configuring_Glyphs)
- [<span class="tocnumber">2</span> <span class="toctext">Values Used in
  Glyph Options</span>](#Values_Used_in_Glyph_Options)
  - [<span class="tocnumber">2.1</span>
    <span class="toctext">Colors</span>](#Colors)
    - [<span class="tocnumber">2.1.1</span> <span class="toctext">By
      Name</span>](#By_Name)
    - [<span class="tocnumber">2.1.2</span> <span class="toctext">By
      HTML Value</span>](#By_HTML_Value)
    - [<span class="tocnumber">2.1.3</span> <span class="toctext">Using
      CSS Notation</span>](#Using_CSS_Notation)
    - [<span class="tocnumber">2.1.4</span> <span class="toctext">Alpha
      (Transparency) Values</span>](#Alpha_.28Transparency.29_Values)
  - [<span class="tocnumber">2.2</span> <span class="toctext">True/False
    Values</span>](#True.2FFalse_Values)
  - [<span class="tocnumber">2.3</span>
    <span class="toctext">Fonts</span>](#Fonts)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Screen
    Measurements</span>](#Screen_Measurements)
- [<span class="tocnumber">3</span> <span class="toctext">Glyphs and
  their Configuration
  Options</span>](#Glyphs_and_their_Configuration_Options)
  - [<span class="tocnumber">3.1</span>
    <span class="toctext">generic</span>](#generic)
  - [<span class="tocnumber">3.2</span>
    <span class="toctext">alignment</span>](#alignment)
  - [<span class="tocnumber">3.3</span>
    <span class="toctext">allele_tower</span>](#allele_tower)
  - [<span class="tocnumber">3.4</span>
    <span class="toctext">anchored_arrow</span>](#anchored_arrow)
  - [<span class="tocnumber">3.5</span>
    <span class="toctext">arrow</span>](#arrow)
  - [<span class="tocnumber">3.6</span>
    <span class="toctext">box</span>](#box)
  - [<span class="tocnumber">3.7</span>
    <span class="toctext">broken_line</span>](#broken_line)
  - [<span class="tocnumber">3.8</span>
    <span class="toctext">cds</span>](#cds)
  - [<span class="tocnumber">3.9</span>
    <span class="toctext">christmas_arrow</span>](#christmas_arrow)
  - [<span class="tocnumber">3.10</span>
    <span class="toctext">cross</span>](#cross)
  - [<span class="tocnumber">3.11</span>
    <span class="toctext">dashed_line</span>](#dashed_line)
  - [<span class="tocnumber">3.12</span>
    <span class="toctext">diamond</span>](#diamond)
  - [<span class="tocnumber">3.13</span>
    <span class="toctext">dna</span>](#dna)
  - [<span class="tocnumber">3.14</span>
    <span class="toctext">dot</span>](#dot)
  - [<span class="tocnumber">3.15</span>
    <span class="toctext">dumbbell</span>](#dumbbell)
  - [<span class="tocnumber">3.16</span>
    <span class="toctext">ellipse</span>](#ellipse)
  - [<span class="tocnumber">3.17</span>
    <span class="toctext">ex</span>](#ex)
  - [<span class="tocnumber">3.18</span>
    <span class="toctext">extending_arrow</span>](#extending_arrow)
  - [<span class="tocnumber">3.19</span>
    <span class="toctext">fixedwidth</span>](#fixedwidth)
  - [<span class="tocnumber">3.20</span>
    <span class="toctext">flag</span>](#flag)
  - [<span class="tocnumber">3.21</span>
    <span class="toctext">gene</span>](#gene)
  - [<span class="tocnumber">3.22</span>
    <span class="toctext">graded_segments</span>](#graded_segments)
  - [<span class="tocnumber">3.23</span>
    <span class="toctext">group</span>](#group)
  - [<span class="tocnumber">3.24</span>
    <span class="toctext">hat</span>](#hat)
  - [<span class="tocnumber">3.25</span>
    <span class="toctext">heat_map</span>](#heat_map)
  - [<span class="tocnumber">3.26</span>
    <span class="toctext">heat_map_ideogram</span>](#heat_map_ideogram)
  - [<span class="tocnumber">3.27</span>
    <span class="toctext">heterogeneous_segments</span>](#heterogeneous_segments)
  - [<span class="tocnumber">3.28</span>
    <span class="toctext">hidden</span>](#hidden)
  - [<span class="tocnumber">3.29</span>
    <span class="toctext">hybrid_plot</span>](#hybrid_plot)
  - [<span class="tocnumber">3.30</span>
    <span class="toctext">ideogram</span>](#ideogram)
  - [<span class="tocnumber">3.31</span>
    <span class="toctext">image</span>](#image)
  - [<span class="tocnumber">3.32</span>
    <span class="toctext">lightning</span>](#lightning)
  - [<span class="tocnumber">3.33</span>
    <span class="toctext">line</span>](#line)
  - [<span class="tocnumber">3.34</span>
    <span class="toctext">merge_parts</span>](#merge_parts)
  - [<span class="tocnumber">3.35</span>
    <span class="toctext">merged_alignment</span>](#merged_alignment)
  - [<span class="tocnumber">3.36</span>
    <span class="toctext">minmax</span>](#minmax)
  - [<span class="tocnumber">3.37</span>
    <span class="toctext">oval</span>](#oval)
  - [<span class="tocnumber">3.38</span>
    <span class="toctext">pairplot</span>](#pairplot)
  - [<span class="tocnumber">3.39</span>
    <span class="toctext">pentagram</span>](#pentagram)
  - [<span class="tocnumber">3.40</span>
    <span class="toctext">phylo_align</span>](#phylo_align)
  - [<span class="tocnumber">3.41</span>
    <span class="toctext">pinsertion</span>](#pinsertion)
  - [<span class="tocnumber">3.42</span>
    <span class="toctext">primers</span>](#primers)
  - [<span class="tocnumber">3.43</span>
    <span class="toctext">processed_transcript</span>](#processed_transcript)
  - [<span class="tocnumber">3.44</span>
    <span class="toctext">protein</span>](#protein)
  - [<span class="tocnumber">3.45</span>
    <span class="toctext">ragged_ends</span>](#ragged_ends)
  - [<span class="tocnumber">3.46</span>
    <span class="toctext">rainbow_gene</span>](#rainbow_gene)
  - [<span class="tocnumber">3.47</span>
    <span class="toctext">redgreen_box</span>](#redgreen_box)
  - [<span class="tocnumber">3.48</span>
    <span class="toctext">redgreen_segment</span>](#redgreen_segment)
  - [<span class="tocnumber">3.49</span>
    <span class="toctext">repeating_shape</span>](#repeating_shape)
  - [<span class="tocnumber">3.50</span>
    <span class="toctext">rndrect</span>](#rndrect)
  - [<span class="tocnumber">3.51</span>
    <span class="toctext">ruler_arrow</span>](#ruler_arrow)
  - [<span class="tocnumber">3.52</span>
    <span class="toctext">saw_teeth</span>](#saw_teeth)
  - [<span class="tocnumber">3.53</span>
    <span class="toctext">segmented_keyglyph</span>](#segmented_keyglyph)
  - [<span class="tocnumber">3.54</span>
    <span class="toctext">segments</span>](#segments)
  - [<span class="tocnumber">3.55</span>
    <span class="toctext">smoothing</span>](#smoothing)
  - [<span class="tocnumber">3.56</span>
    <span class="toctext">span</span>](#span)
  - [<span class="tocnumber">3.57</span>
    <span class="toctext">spectrogram</span>](#spectrogram)
  - [<span class="tocnumber">3.58</span>
    <span class="toctext">splice_site</span>](#splice_site)
  - [<span class="tocnumber">3.59</span>
    <span class="toctext">stackedplot</span>](#stackedplot)
  - [<span class="tocnumber">3.60</span>
    <span class="toctext">ternary_plot</span>](#ternary_plot)
  - [<span class="tocnumber">3.61</span>
    <span class="toctext">text_in_box</span>](#text_in_box)
  - [<span class="tocnumber">3.62</span>
    <span class="toctext">three_letters</span>](#three_letters)
  - [<span class="tocnumber">3.63</span>
    <span class="toctext">tic_tac_toe</span>](#tic_tac_toe)
  - [<span class="tocnumber">3.64</span>
    <span class="toctext">toomany</span>](#toomany)
  - [<span class="tocnumber">3.65</span>
    <span class="toctext">topoview</span>](#topoview)
  - [<span class="tocnumber">3.66</span>
    <span class="toctext">trace</span>](#trace)
  - [<span class="tocnumber">3.67</span>
    <span class="toctext">track</span>](#track)
  - [<span class="tocnumber">3.68</span>
    <span class="toctext">transcript</span>](#transcript)
  - [<span class="tocnumber">3.69</span>
    <span class="toctext">transcript2</span>](#transcript2)
  - [<span class="tocnumber">3.70</span>
    <span class="toctext">translation</span>](#translation)
  - [<span class="tocnumber">3.71</span>
    <span class="toctext">triangle</span>](#triangle)
  - [<span class="tocnumber">3.72</span>
    <span class="toctext">two_bolts</span>](#two_bolts)
  - [<span class="tocnumber">3.73</span>
    <span class="toctext">vista_plot</span>](#vista_plot)
  - [<span class="tocnumber">3.74</span>
    <span class="toctext">wave</span>](#wave)
  - [<span class="tocnumber">3.75</span>
    <span class="toctext">weighted_arrow</span>](#weighted_arrow)
  - [<span class="tocnumber">3.76</span>
    <span class="toctext">whiskerplot</span>](#whiskerplot)
  - [<span class="tocnumber">3.77</span>
    <span class="toctext">wiggle_box</span>](#wiggle_box)
  - [<span class="tocnumber">3.78</span>
    <span class="toctext">wiggle_density</span>](#wiggle_density)
  - [<span class="tocnumber">3.79</span>
    <span class="toctext">wiggle_xyplot</span>](#wiggle_xyplot)
  - [<span class="tocnumber">3.80</span>
    <span class="toctext">wiggle_minmax</span>](#wiggle_minmax)
  - [<span class="tocnumber">3.81</span>
    <span class="toctext">xyplot</span>](#xyplot)

See also: [GBrowse
Configuration/Glyphs](GBrowse_Configuration/Glyphs "GBrowse Configuration/Glyphs")

[GBrowse](GBrowse.1 "GBrowse") offers many different options for
displaying tracks. Tracks are generated by the Perl
<a href="http://search.cpan.org/perldoc?Bio::Graphics"
class="external text" rel="nofollow">Bio::Graphics</a> module, which is
the definitive reference for the various display options in GBrowse.
This page provides an introduction to the most commonly used glyphs.

# <span id="Selecting_and_Configuring_Glyphs" class="mw-headline">Selecting and Configuring Glyphs</span>

Every GBrowse \[Track\] stanza should have a **glyph** option. This
option selects the shape and behavior of each feature rendered in the
track. Other options fine tune the glyph's appearance by selecting its
height, color, and other display properties. Several standard display
options are shared among all glyphs; others are glyph-specific.

The simplest \[Track\] stanza will look like this:

Sample track containing 5 "stacked" wiggle_xyplot glyphs.

An xy-plot compatible with dense "wig" data. See the documentation for
<a
href="http://search.cpan.org/perldoc?Bio::Graphics::Glyph::wiggle_xyplot"
class="external text"
rel="nofollow">Bio::Graphics::Glyph::wiggle_xyplot</a>.

It produces the typical xyplot, but uses the wig data for dense data
sets. In the example the `bicolor_pivot` parameter has been set to `0`,
and the `pos_color` and `neg_color` were set to obtain the conditional
coloring.

    [wiggle_xyplot]
    feature       = Mooney_wiggle
    glyph         = wiggle_xyplot
    height        = 20
    fgcolor       = black
    bicolor_pivot = 0
    pos_color     = red
    neg_color     = blue
    key           = Mooney ChIP-chip (Plot)
    category      = Experimental Data
    label         = 0
    citation      = Mooney RA, Davis SE, Peters JM, Rowland JL et al.
                    Regulator trafficking on bacterial transcription units in vivo. Mol Cell 2009 Jan 16;33(1):97-108.
    label         = 1

## <span id="wiggle_minmax" class="mw-headline">wiggle_minmax</span>

Bio::Graphics::Glyph::wiggle_minmax

## <span id="xyplot" class="mw-headline">xyplot</span>

Bio::Graphics::Glyph::xyplot

[Categories](Special%253ACategories "Special%253ACategories"):

- [Needs Editing](Category%253ANeeds_Editing "Category%253ANeeds Editing")
- [GBrowse](Category%253AGBrowse "Category%253AGBrowse")

## Navigation menu

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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Glyphs_and_Glyph_Options"
  rel="smw-browse">Browse properties</a></span>

- <span id="footer-info-lastmod">Last updated at 22:35 on 27 March 2015.</span>
<!-- - <span id="footer-info-viewcount">253,396 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

<!-- -->





<span id="top"></span>




# <span dir="auto">MotifFinder.pm</span>









MotifFinder.pm is a [GBrowse](GBrowse.1 "GBrowse") plugin written by
[Xiaoqi Shi](User%253AXshi "User%253AXshi"). It finds sequence specific motifs
using Position Weight Matrix and display results graphically as tracks
in the genome browser.

Please feel free to
<a href="mailto:xshi@oicr.on.ca?subject=MotifFinder%20plugin"
class="external text" rel="nofollow">contact the author</a> for help or
more information. Follow this link for
<span class="pops"><a href="http://en.wikipedia.org/wiki/Position-specific_scoring_matrix"
class="external text" rel="nofollow">background reading of Position
Weight Matrix</a></span>


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">download the
  plugin</span>](#download_the_plugin)
- [<span class="tocnumber">2</span> <span class="toctext">How to use
  MotifFinder plugin</span>](#How_to_use_MotifFinder_plugin)
  - [<span class="tocnumber">2.1</span> <span class="toctext">Access The
    Plugin</span>](#Access_The_Plugin)
  - [<span class="tocnumber">2.2</span>
    <span class="toctext">MotifFinder
    Parameters</span>](#MotifFinder_Parameters)
  - [<span class="tocnumber">2.3</span> <span class="toctext">Position
    Frequency Matrices</span>](#Position_Frequency_Matrices)
  - [<span class="tocnumber">2.4</span> <span class="toctext">Indel
    Detection</span>](#Indel_Detection)
  - [<span class="tocnumber">2.5</span> <span class="toctext">Graphical
    Presentation</span>](#Graphical_Presentation)
- [<span class="tocnumber">3</span> <span class="toctext">How is the
  motif predicted?</span>](#How_is_the_motif_predicted.3F)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Calculate
    Weight Score</span>](#Calculate_Weight_Score)
  - [<span class="tocnumber">3.2</span>
    <span class="toctext">Algorithms</span>](#Algorithms)



# <span id="download_the_plugin" class="mw-headline">download the plugin</span>

The plugin is installed on the GBrowse of WormBase&modENCODE, you may
access it directory here:
<a href="http://www.wormbase.org/db/gb2/gbrowse" class="external free"
rel="nofollow">http://www.wormbase.org/db/gb2/gbrowse</a> or
<a href="http://modencode.oicr.on.ca/" class="external free"
rel="nofollow">http://modencode.oicr.on.ca/</a>

If you want to install it on your own GBrowse, please
<a href="mailto:xshi@oicr.on.ca?subject=MotifFinder%20plugin"
class="external text" rel="nofollow">contact the author</a> for source
code and then follow the instruction below:

- save both 'motiffinder' and 'MotifFinder.pm' under GBrowse plugin
  directory(set the permission as executable).
- save 'matrices.txt'(example of the PFM tables) under GBrowse conf
  directory
- include "MotifFinder" in your main GBrowse.conf.
- specify the matrix file name in your species \*.conf

<!-- -->

            [MotifFinder:plugin]
            matrix = matrices.txt

Then you should be able to run the plugin!

# <span id="How_to_use_MotifFinder_plugin" class="mw-headline">How to use MotifFinder plugin</span>

## <span id="Access_The_Plugin" class="mw-headline">Access The Plugin</span>

- From GBrowse main page, the PrimerDesigner plugin, as well as other
  installed plugins, can be accessed via the upper right menu.
- In GBrowse, navigate to the genomic region you interested in, then
  select 'Annotate Sequence Motif' from the menu and click 'Configure'

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e8/Select.png" class="thumbborder"
width="389" height="112" alt="Select.png" />

  

## <span id="MotifFinder_Parameters" class="mw-headline">MotifFinder Parameters</span>

- Reasonable default options are provided for each parameter.
- Threshold: a cutoff score between 0.8 to 1 is recommended.
- Background Probability: should be inputted in (A C G T) order.
- Indel Size: currently only small Indels(length under 6) can be
  handled.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/da/Parameter.png" width="428" height="289"
alt="boarder" />

  

## <span id="Position_Frequency_Matrices" class="mw-headline">Position Frequency Matrices</span>

Existing PFMs were loaded from file 'matrices.txt' under GBrowse
configuration directory, they are mostly curated PFMs from existing
publications.

Click here for a list of
<a href="http://www.wormbase.org/db/seq/position_matrix?list=all"
class="external text" rel="nofollow">all the available PFMs from
WormBase</a>

However, you can also add your own PFMs to the toggle section "Paste
PFMs Here" in fasta format(arrange rows in A C G T order). e.g.

     >name of the matrix ( the '>' sign is required !)
     0       1       1       1       1       23      0       0       1       7       0       0       19
     10      18      1       13      14      2       20      0       17      0       7       16      0
     2       4       24      1       0       0       0       26      8       2       0       10      7
     14      3       0       11      11      1       6       0       0       17      19      0       0

## <span id="Indel_Detection" class="mw-headline">Indel Detection</span>

User can search for sequence motifs that contain Indels up to certain
length. This part hasn't been fully tested and depends on future
improvement.

## <span id="Graphical_Presentation" class="mw-headline">Graphical Presentation</span>

- each matching motifs is displayed as a glyph box on the tracks
- box arrow indicates the strand info
- move mouse on glyph will show you the computed similarity score and
  start/stop position of the motif


<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/29/Display.png" width="1035" height="293"
alt="Display.png" />


# <span id="How_is_the_motif_predicted.3F" class="mw-headline">How is the motif predicted?</span>

The problem is to find occurrences of known patterns(represented by
position matrix) in new sequences.

## <span id="Calculate_Weight_Score" class="mw-headline">Calculate Weight Score</span>

Scoring function is the same as the
<a href="http://tfbs.genereg.net/" class="external text"
rel="nofollow">TFBS Perl modules</a> developed by Bergen University.

     w = log2 ( ( f + sqrt(N) * p ) / ( N + sqrt(N) ) / 0.25 )

If we have PFM from TRANSFAC 7.0:

       A 1 12 0 0 0 0 0 7 1 1 0 0 0 2 1
       C 8 0 0 0 0 0 13 1 7 0 0 3 8 7 8
       G 2 1 12 0 0 0 0 1 2 0 0 0 0 2 3
       T 2 0 0 13 13 13 0 4 3 12 13 10 5 2 1

w - is a weight for the current nucleotide we are calculating

f - is a number of occurrences of the current nucleotide in the current
column (e.g., "1" for A in column 1, "8" for C etc)

N - total number of observations, the sum of all nucleotides occurrences
in a column (13 in this example)

p - \[prior\] \[background\] frequency of the current nucleotide; this
one usually defaults to 0.25 (i.e. one nucleotide out of four)

## <span id="Algorithms" class="mw-headline">Algorithms</span>

- Backtrack: use recursive function to build all possible motifs,
  terminate recursion when an intermediate score is not reached.
- Brute-Force: calculate the similarity score across the whole region
  using a sliding window of motif size

This program uses a combined strategy by choosing between above two
methods(depending length of the motif and cutoff score) to achieve
faster computational speed .




[Category](Special%253ACategories "Special%253ACategories"):

- [GBrowse Plugins](Category%253AGBrowse_Plugins "Category%253AGBrowse Plugins")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/MotifFinder.pm" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 15:00 on 11 July
  2016.</span>
<!-- - <span id="footer-info-viewcount">53,940 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





---
title: "Artemis-Chado Integration Tutorial"
---




<span id="top"></span>




# <span dir="auto">Artemis-Chado Integration Tutorial</span>









  


<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c3/Artemis_logo.gif" width="250" height="159"
alt="Artemis" />


This [Artemis-Chado Integration](Artemis "Artemis") tutorial was
presented by [Robin Houston](User%253ARobinHouston "User%253ARobinHouston"),
[Tim Carver](User%253ATimCarver "User%253ATimCarver") and [Giles
Velarde](User%253ABuggy "User%253ABuggy") at the 2009 GMOD Summer School -
Europe, August 2009. The most recent Artemis tutorial can be found at
the <a href="Artemis_Tutorial" class="mw-redirect"
title="Artemis Tutorial">Artemis Tutorial</a> page.

This [tutorial](Category%253ATutorials "Category%253ATutorials") walks you
through how to use the Artemis annotation editor with a
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> database.

## <span id="VMware" class="mw-headline">VMware</span>

.

To run ACT use the `act` script:

    ./act -Dchado="localhost:5432/chado_pathogen?gmod" -Dibatis

From the 'File' menu select the option 'Open Database and SSH File
Manager' and login. Drag and drop the *Plasmodium* entries from the
Database Manager into the ACT selection window. Also, drag and drop the
comparison files into this window, so it looks something like this (note
the featureId numbers may well be different as these are the Chado
feature_id):

  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/a/a3/ActSelection2seqs.gif" width="528"
height="187" alt="ActSelection2seqs.gif" />

  
Click on Apply to read these entries and open up ACT. You can use the
right hand scroll bar to zoom in and out. If you zoom out you can
identify the regions that match between these sequences.

  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/3c/Pf10_Pk6.gif" width="900" height="700"
alt="Pf10 Pk6.gif" />

  
ACT can display multiple pairwise comparison. So the two `P.knowlesi`
sequences can be compared to the `P.falciparum sequence`. From the ACT
launch window go to the File menu and select 'Open Database and SSH File
Manager'. Drag in the sequences and comparison files (clicking on 'more
files' to add the additional sequence and comparison).

  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b5/ActSelection.gif" width="528" height="245"
alt="ActSelection.gif" />

  
Zooming out you will see that *Pfalciparum* chromosome 10 matches to
regions in *Pknowlesi* chromosome 7 and 9.

  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2a/Pk6_Pf10_Pk8.gif" width="900" height="700"
alt="Pk6 Pf10 Pk8.gif" />

  

## <span id="Writing_Out_Sequence_Files" class="mw-headline">Writing Out Sequence Files</span>

Artemis can write out EMBL and [GFF](GFF "GFF") files for an entry
opened from the database. You can optionally flatten the gene model
(i.e. gene, transcript, exon) to just a CDS feature. Also an option is
given to ignore any obsolete features. For EMBL it uses mappings for
conversion of the keys and qualifiers. These mappings are stored in the
`etc/key_mapping` and `etc/qualifier_mapping` files.

A utility script (`etc/write_db_entry`) is also provided as a means of
writing out multiple sequences from the database. The script takes the
following options:

    -h      show help
    -f      [y|n] flatten the gene model, default is y
    -i      [y|n] ignore obsolete features, default is y
    -s      space separated list of sequences to read and write out
    -o      [EMBL|GFF] output format, default is EMBL
    -a      [y|n] for EMBL submission format change to n, default is y

Try running:

    etc/writedb_entry -Dchado="localhost:5432/chado_pathogen?gmod" NC_004314

## <span id="Mailing_List" class="mw-headline">Mailing List</span>

There is an Artemis mailing list:
<a href="http://lists.sanger.ac.uk/mailman/listinfo/artemis-users"
class="external text" rel="nofollow">artemis-user</a>.

## <span id="References" class="mw-headline">References</span>

- <a href="http://www.sanger.ac.uk/Software/Artemis/"
  class="external text" rel="nofollow">Artemis home page</a>
- <a href="http://www.sanger.ac.uk/Software/ACT/" class="external text"
  rel="nofollow">ACT home page</a>
- <a href="http://www.sanger.ac.uk/Software/Artemis/v11/chado/"
  class="external text" rel="nofollow">Artemis Connecting to Chado
  Databases</a>
- <a
  href="http://www.sanger.ac.uk/Software/Artemis/v11/database/chado.practical.guide.pdf"
  class="external text" rel="nofollow">User Practical Guide</a>




[Categories](Special%253ACategories "Special%253ACategories"):

- [Tutorials](Category%253ATutorials "Category%253ATutorials")
- [Annotation](Category%253AAnnotation "Category%253AAnnotation")



<span class="smwfactboxhead">Facts about
"<span class="swmfactboxheadbrowse">[Artemis-Chado Integration
Tutorial](Special%253ABrowse/Artemis-2DChado-20Integration-20Tutorial "Special%253ABrowse/Artemis-2DChado-20Integration-20Tutorial")</span>"</span>

|  |  |
|----|----|
| [Has topic](Property%253AHas_topic "Property:Has topic") | [Artemis](Artemis "Artemis") <span class="smwsearch">[+](Special%253ASearchByProperty/Has-20topic/Artemis "Special%253ASearchByProperty/Has-20topic/Artemis")</span> |






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Artemis-2DChado_Integration_Tutorial"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 23:33 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">54,132 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





---
title: "Talk:Chado Post-Composed Phenotypes"
---




<span id="top"></span>




# <span dir="auto">Talk:Chado Post-Composed Phenotypes</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Older
  proposals</span>](#Older_proposals)
  - [<span class="tocnumber">1.1</span> <span class="toctext">Option 1:
    Group Module is an intrinsic part of the phenotype_cvterm
    table</span>](#Option_1:_Group_Module_is_an_intrinsic_part_of_the_phenotype_cvterm_table)
  - [<span class="tocnumber">1.2</span> <span class="toctext">Option 2:
    Group Module is decoupled from the phenotype_cvterm
    table</span>](#Option_2:_Group_Module_is_decoupled_from_the_phenotype_cvterm_table)
  - [<span class="tocnumber">1.3</span>
    <span class="toctext">Alternative: Represented directly in Group
    Module</span>](#Alternative:_Represented_directly_in_Group_Module)



## <span id="Older_proposals" class="mw-headline">Older proposals</span>

An example of an EQ statement and two options for how it could be stored
in the proposed revised Phenotype Module are shown below. Both examples
used the proposed [Group
Module](Chado_Group_Module "Chado Group Module"). New and modified
tables relative to Chado version 1.23 are indicated in green.

### <span id="Option_1:_Group_Module_is_an_intrinsic_part_of_the_phenotype_cvterm_table" class="mw-headline">Option 1: [Group Module](Chado_Group_Module "Chado Group Module") is an intrinsic part of the phenotype_cvterm table</span>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/53/SampleEQstatementInChado.png" width="1109"
height="1199" alt="SampleEQstatementInChado.png" />

### <span id="Option_2:_Group_Module_is_decoupled_from_the_phenotype_cvterm_table" class="mw-headline">Option 2: [Group Module](Chado_Group_Module "Chado Group Module") is decoupled from the phenotype_cvterm table</span>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/d/dc/Chado_phenotype_proposal.op2.png"
width="1454" height="1382" alt="Chado phenotype proposal.op2.png" />
Sample SQL for loading and querying this structure is
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/13/EQstatements.sql" class="internal"
title="EQstatements.sql">here</a>.

### <span id="Alternative:_Represented_directly_in_Group_Module" class="mw-headline">Alternative: Represented directly in Group Module</span>

This option separates the post-composed term completely from the
phenotype table, permitting a particular statement to be re-used and to
be attached to different types of data objects.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/38/Chado_phenotype_proposal.v4.png"
width="1500" height="1367" alt="Chado phenotype proposal.v4.png" />




[Category](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")






## Navigation menu



### Namespaces


- <span id="ca-talk"><a href="Talk%253AChado_Post-Composed_Phenotypes" accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>





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




- <span id="footer-info-lastmod">Last updated at 15:27 on 19 August
  2015.</span>
<!-- - <span id="footer-info-viewcount">4,515 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





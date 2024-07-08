



<span id="top"></span>




# <span dir="auto">IFALT</span>





(Redirected from
[TableEdit/IFALT](http://gmod.org/mediawiki/index.php?title=TableEdit/IFALT&redirect=no "TableEdit/IFALT"))





## <span id="specifications" class="mw-headline">specifications</span>

Each field is **tab delimited**, and each new row is seperated by a
**newline.** If a field is empty, you can either skip it completely (and
put the double pipes immediately next to each other as in the first row
in the example below,) or insert the word **NULL** as a space-holder.
NULL will be ignored by the loader.

<table class="sortable" data-border="1" data-cellpadding="4"
data-cellspacing="0"
style="margin: 1em 1em 1em 0; border: 1px #aaa solid; border-collapse: collapse;">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header" style="background-color:#bbcc55; font-size:larger;">
<th>column</th>
<th>data</th>
<th>notes</th>
<th>required?</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>1</p></td>
<td><p>Page title</p></td>
<td><p>This can come from the <a
href="http://gmod.org/mediawiki/index.php?title=Pagelist.php&amp;action=edit&amp;redlink=1"
class="new" title="Pagelist.php (page does not exist)">Pagelist.php</a>
script.</p></td>
<td><p>yes</p></td>
</tr>
<tr class="even">
<td><p>2</p></td>
<td><p>Page template</p></td>
<td><p>Do not include the <strong>Template:</strong> namespace prefix --
it is assumed.</p></td>
<td><p>yes</p></td>
</tr>
<tr class="odd">
<td><p>3</p></td>
<td><p>Table template</p></td>
<td><p>Do not include the <strong>Template:</strong> namespace prefix --
it is assumed.</p></td>
<td><p>yes</p></td>
</tr>
<tr class="even">
<td><p>4</p></td>
<td><p>Row data</p></td>
<td><p>Each cell is delimited by the double-pipe.<br />
<strong>If a cell is empty</strong>, you can either place a space there
or just put another double-pipe. If the remainder of the cells for a row
are empty, you can omit them completely.<br />
Avoid tabs and newlines at all costs.</p></td>
<td><p>sometimes (if update type is not clear_old )</p></td>
</tr>
<tr class="odd">
<td><p>5</p></td>
<td><p>Metadata</p></td>
<td><p>Any data that should get saved to the <em>row_metadata</em> table
in the database should be put here. Avoid tabs and newlines at all
costs.</p></td>
<td><p>no, but it's a good idea to have some metadata</p></td>
</tr>
<tr class="even">
<td><p>6</p></td>
<td><p>Update type</p></td>
<td><p>see below.</p></td>
<td><p>no, defaults to <em>merge</em></p></td>
</tr>
<tr class="odd">
<td><p>7</p></td>
<td><p>Other / Misc</p></td>
<td><p>things that go here should follow the normal URL-style query
string format. key=value&amp;key2=value2. For more information, see the
PHP <a href="http://us2.php.net/parse_str" class="external text"
rel="nofollow">parse_str</a> function man page.</p></td>
<td><p>no</p></td>
</tr>
</tbody>
</table>

  

## <span id="update_types" class="mw-headline">update types</span>

1.  append
    - force an append
2.  merge *(default)*
    - try and find matching row and merge new row with it, falling back
      on an append.
3.  clear
    - set a timestamp at the beginning of script execution, and
      clear_old will use that to delete any row_data from before the
      script ran.

## <span id="example" class="mw-headline">example</span>

    lacZ:Gene  Gene    Gene_sequence_features_table    a||b||c metadata for the row    append  key=value&arr[]=foo+bar
    lacZ:Gene   Gene    Gene_sequence_features_table    1||2||3 more metadata   append  key2=value2
    lacZ:Gene   Gene    Gene_accessions_table   EcoCyc (EcoliWiki Page)
    lacZ:Gene   Gene    Gene_accessions_table   EcoCyc:EG10527
    lacZ:Gene   Gene    Gene_accessions_table   EchoBASE (EcoliWiki Page)
    lacZ:Gene   Gene    Gene_accessions_table   EchoBASE:EB0522
    lacZ:Gene_Product(s)    Product GO_table_product     ||GO:0009088|| || || || || ||Seeded from EcoCyc 11.6 <ref name = 'LIB:EcoCyc11.6'/>
    lacZ:Gene_Product(s)    Product GO_table_product     ||GO:0005575|| || || || || ||Seeded from EcoCyc 11.6 <ref name = 'LIB:EcoCyc11.6'/>
    lacZ:Gene_Product(s)    Product GO_table_product     ||GO:0003617|| || || || || ||Seeded from EcoCyc 11.6 <ref name = 'LIB:EcoCyc11.6'/>

  
` `<span style="color:#ff9700">`lacZ:Gene`</span>` `<span style="color:#aaff00">`Gene`</span>` `<span style="color:#00ffe1">`Gene_sequence_features_table`</span>` `<span style="color:#1d6fff">`a||b||c`</span>` `<span style="color:#ff2022">`metadata for the row`</span>` `<span style="color:#da37e0">`append`</span>` key=value&arr[]=foo+bar`  
<span style="color:#ff9700">`lacZ:Gene`</span>` `<span style="color:#aaff00">`Gene`</span>` `<span style="color:#00ffe1">`Gene_sequence_features_table`</span>` `<span style="color:#1d6fff">`1||2||3`</span>` `<span style="color:#ff2022">`more metadata`</span>` `<span style="color:#da37e0">`append`</span>` key2=value2 `




[Category](../Special%3ACategories "Special%3ACategories"):

- [TableEdit](../Category%3ATableEdit "Category%3ATableEdit")






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
- <span id="n-FAQs">[FAQs](../Category%3AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category%3AHOWTO)</span>
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

- <span id="t-smwbrowselink"><a href="../Special%3ABrowse/IFALT" rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 02:27 on 15 January
  2010.</span>
<!-- - <span id="footer-info-viewcount">17,079 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](../GMOD%3AAbout "GMOD%3AAbout")</span>

<!-- -->





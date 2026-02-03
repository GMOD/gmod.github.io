---
title: "Html.tmpl.module"
---




<span id="top"></span>




# <span dir="auto">Html.tmpl.module</span>











The process described on this page is obsolete. The process described on
[Chado Schema Documentation
HOWTO](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
is the the current one. This page should be deleted once the new process
has been fully adopted.



    <!-- $Header: /cvsroot/autodoc/autodoc/html.tmpl,v 1.4 2006/05/16 19:01:27 rbt Exp $ -->
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
       "http://www.w3.org/TR/html4/strict.dtd">

    <html>
      <head>
        <title>Index for <!-- TMPL_VAR ESCAPE="HTML" name="database" --></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
        BODY {
            color:  #000000;
            background-color: #FFFFFF;
            font-family: Helvetica, sans-serif;
        }

        P {
            margin-top: 5px;
            margin-bottom: 5px;
        }

        P.w3ref {
            font-size: 8pt;
            font-style: italic;
            text-align: right;
        }

        P.detail {
            font-size: 10pt;
        }

        .error {
            color: #FFFFFF;
            background-color: #FF0000;
        }

        H1, H2, H3, H4, H5, H6 {
        }

        OL {
            list-style-type: upper-alpha;
        }

        UL.topic {
            list-style-type: upper-alpha;
        }

        LI.topic {
            font-weight : bold;
        }

        HR {
            color: #00FF00;
            background-color: #808080;
        }

        TABLE {
            border-width: medium;
            padding: 3px;
            background-color: #000000;
            width: 90%;
        }

        CAPTION {
            text-transform: capitalize;
            font-weight : bold;
            font-size: 14pt;
        }

        TH {
            color: #FFFFFF;
            background-color: #000000;
            text-align: left;
        }

        TR {
            color: #000000;
            background-color: #000000;
            vertical-align: top;
        }

        TR.tr0 {
            background-color: #F0F0F0;
        }

        TR.tr1 {
            background-color: #D8D8D8;
        }

        TD {
            font-size: 12pt;
        }

        TD.col0 {
            font-weight : bold;
            width: 20%;
        }

        TD.col1 {
            font-style: italic;
            width: 15%;
        }

        TD.col2 {
            font-size: 12px;
        }
        </style>
        <link rel="stylesheet" type="text/css" media="all" href="all.css">
        <link rel="stylesheet" type="text/css" media="screen" href="screen.css">
        <link rel="stylesheet" type="text/css" media="print" href="print.css">
        <meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
      </head>
      <body>

        <!-- Primary Index -->
        <p><!-- TMPL_VAR ESCAPE="HTML" name="database_comment" --><br><br>Dumped on <!-- TMPL_VAR ESCAPE="HTML" name="dumped_on" --></p>
    <h1><a name="index">Index of database - <!-- TMPL_VAR ESCAPE="HTML" name="database" --></a></h1>
    <ul>
        <!-- TMPL_LOOP name="schemas" -->
        <li><a name="<!-- TMPL_VAR ESCAPE="HTML" name="schema_sgmlid" -->"><!-- TMPL_VAR ESCAPE="HTML" name="schema" --></a></li><ul>
            <!-- TMPL_LOOP name="tables" --><li><a href="#<!-- TMPL_VAR ESCAPE="URL" name="table_sgmlid" -->"><!-- TMPL_VAR ESCAPE="HTML" name="table" --></a></li><!-- /TMPL_LOOP name="tables" -->
        <!-- TMPL_LOOP name="functions" --><li><a href="#<!-- TMPL_VAR ESCAPE="URL" name="function_sgmlid" -->"><!-- TMPL_VAR ESCAPE="HTML" name="function" --></a></li><!-- /TMPL_LOOP name="functions" -->
        </ul>
        <!-- /TMPL_LOOP name="schemas" -->
    </ul>

        <!-- Schema Creation -->
        <!-- TMPL_LOOP name="schemas" --><!-- <!-- TMPL_VAR ESCAPE="HTML" name="schema" --><!-- TMPL_VAR ESCAPE="HTML" name="schema" --> -->

            <!-- TMPL_IF name="number_of_schemas" -->
            <hr>
            <h1>Schema <!-- TMPL_VAR ESCAPE="HTML" name="schema" --></h1>
            <!-- TMPL_IF name="schema_comment" -->
                <p><!-- TMPL_VAR name="schema_comment" --></p>
            <!-- /TMPL_IF name="schema_comment" -->

            <!-- /TMPL_IF name="number_of_schemas" -->
            <!-- TMPL_LOOP name="tables" -->
            <hr>
            <h2><!-- TMPL_IF name="view_definition" -->View:<!-- TMPL_ELSE -->Table:<!-- /TMPL_IF -->
                <!-- TMPL_IF name="number_of_schemas" -->
                <a href="#<!-- TMPL_VAR ESCAPE="URL" name="schema_sgmlid" -->"><!-- TMPL_VAR ESCAPE="HTML" name="schema" --></a>.<!-- /TMPL_IF name="number_of_schemas" --><a name="<!-- TMPL_VAR ESCAPE="URL" name="table_sgmlid" -->"><!-- TMPL_VAR ESCAPE="HTML" name="table" --></a>
            </h2>
            <!-- TMPL_IF name="table_comment" -->
             <p><!-- TMPL_VAR ESCAPE="HTML" name="table_comment" --></p>
            <!-- /TMPL_IF name="table_comment" -->

            <table border="1" cellspacing="0" cellpadding="3">
                    <caption><!-- TMPL_IF name="number_of_schemas" --><!-- TMPL_VAR ESCAPE="HTML" name="schema" -->.<!-- /TMPL_IF name="number_of_schemas" --><!-- TMPL_VAR ESCAPE="HTML" name="table" --> Structure</caption>
                    <tr>
                    <th>FK</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Description</th>
                    </tr>
                <!-- TMPL_LOOP name="columns" -->
                <tr class="<!-- TMPL_IF name="__odd__" -->tr0<!-- tmpl_else name="__odd__" -->tr1<!-- /TMPL_IF name="__odd__" -->"><td><!-- TMPL_LOOP name="column_constraints" --><!-- TMPL_IF name="column_fk" --><a href="[Chado_Tables#Table:_<!-- TMPL_VAR ESCAPE="URL" name="column_fk_table" -->|"><!-- TMPL_IF name="column_fk_keygroup" -->#<!-- TMPL_VAR name="column_fk_keygroup" --><!-- /TMPL_IF name="column_fk_keygroup" --><!-- TMPL_VAR name="column_fk_table" -->]</a><!-- /TMPL_IF name="column_fk" --><!-- /TMPL_LOOP name="column_constraints" --></td><td><!-- TMPL_VAR ESCAPE="HTML" name="column" --></td><td><!-- TMPL_VAR ESCAPE="HTML" name="column_type" --></td>
                    <td><i>
                    <!-- TMPL_LOOP name="column_constraints" -->
                        <!-- TMPL_IF name="column_primary_key" -->PRIMARY KEY
                        <!-- /TMPL_IF name="column_primary_key" -->
                        <!-- TMPL_IF name="column_unique" -->
                           UNIQUE<!-- TMPL_IF name="column_unique_keygroup" -->#<!-- TMPL_VAR name="column_unique_keygroup" --><!-- /TMPL_IF name="column_unique_keygroup" -->
                        <!-- /TMPL_IF name="column_unique" -->
                    <!-- /TMPL_LOOP name="column_constraints" -->

                    <!-- TMPL_IF name="column_constraint_notnull" -->NOT NULL<!-- /TMPL_IF name="column_constraint_notnull" -->
                    <!-- TMPL_IF name="column_default" -->DEFAULT <!-- TMPL_VAR ESCAPE="HTML" name="column_default" --><!-- /TMPL_IF name="column_default" -->
                    </i>
                    <!-- TMPL_IF name="column_comment" --><br><br><!-- TMPL_VAR ESCAPE="HTML" name="column_comment" --><!-- /TMPL_IF name="column_comment" -->
                    </td>
                 </tr>
                <!-- /TMPL_LOOP name="columns" -->
            </table>

            <!-- Inherits -->
            <!-- TMPL_IF name="inherits" -->
            <p>Table <!-- TMPL_IF name="number_of_schemas" --><!-- TMPL_VAR ESCAPE="HTML" name="schema" -->.<!-- /TMPL_IF name="number_of_schemas" --><!-- TMPL_VAR ESCAPE="HTML" name="table" --> Inherits
            <!-- TMPL_LOOP name="inherits" -->
               <!-- TMPL_VAR name="index_name" --> <!-- TMPL_VAR name="index_definition" -->
               <a href="#<!-- TMPL_VAR ESCAPE="URL" name="parent_sgmlid" -->"><!-- TMPL_IF name="number_of_schemas" --><!-- TMPL_VAR ESCAPE="HTML" name="parent_schema" -->.<!-- /TMPL_IF name="number_of_schemas" --><!-- TMPL_VAR ESCAPE="HTML" name="parent_table" --></a>,
            <!-- /TMPL_LOOP name="inherits" -->
            </p>
            <!-- /TMPL_IF name="inherits" -->

            <!-- TMPL_UNLESS name="view_definition" -->
            <!-- TMPL_IF name="stats_enabled" -->
            <p> </p>
            <table width="100%" cellspacing="0" cellpadding="3">
             <caption>Statistics</caption>
             <tr>
              <th>Total Space (disk usage)</th>
              <th>Tuple Count</th>
              <th>Active Space</th>
              <th>Dead Space</th>
              <th>Free Space</th>
             </tr>
             <tr class="tr0">
              <td><!-- TMPL_VAR ESCAPE="HTML" name="stats_table_bytes" --></td>
              <td><!-- TMPL_VAR ESCAPE="HTML" name="stats_tuple_count" --></td>
              <td><!-- TMPL_VAR ESCAPE="HTML" name="stats_tuple_bytes" --></td>
              <td><!-- TMPL_VAR ESCAPE="HTML" name="stats_dead_bytes" --></td>
              <td><!-- TMPL_VAR ESCAPE="HTML" name="stats_free_bytes" --></td>
             </tr>
            </table>
            <!-- /TMPL_IF name="stats_enabled" -->
            <!-- /TMPL_UNLESS name="view_definition" -->

            <!-- Constraint List -->
            <!-- TMPL_IF name="constraints" -->
            <p> </p>
            <table width="100%" cellspacing="0" cellpadding="3">
                <caption><!-- TMPL_IF name="number_of_schemas" --><!-- TMPL_VAR ESCAPE="HTML" name="schema" -->.<!-- /TMPL_IF name="number_of_schemas" --><!-- TMPL_VAR ESCAPE="HTML" name="table" --> Constraints</caption>
                <tr>
                    <th>Name</th>
                    <th>Constraint</th>
                </tr>
                <!-- TMPL_LOOP name="constraints" -->
                <tr class="<!-- TMPL_IF name="__odd__" -->tr0<!-- TMPL_ELSE name="__odd__" -->tr1<!-- /TMPL_IF name="__odd__" -->">
                    <td><!-- TMPL_VAR ESCAPE="HTML" name="constraint_name" --></td>
                    <td><!-- TMPL_VAR ESCAPE="HTML" name="constraint" --></td>
                </tr>
                <!-- /TMPL_LOOP name="constraints" -->
            </table>
            <!-- /TMPL_IF name="constraints" -->

            <!-- Foreign Key Discovery -->
            <!-- TMPL_IF name="fk_schemas" -->
                <p>Tables referencing this one via Foreign Key Constraints:</p>
            <!-- TMPL_LOOP name="fk_schemas" -->
                <ul>
                    <li><a href="[Chado_Tables#Table:_<!-- TMPL_VAR ESCAPE="URL" name="fk_table" -->|"><!-- TMPL_VAR name="fk_table" -->]</a></li>
                </ul>
            <!-- /TMPL_LOOP name="fk_schemas" -->
            <!-- /TMPL_IF name="fk_schemas" -->

        <!-- /TMPL_LOOP name="tables" -->


    <!-- /TMPL_LOOP name="schemas" -->
    <p class="w3ref">Generated by <a href="http://www.rbt.ca/autodoc/">PostgreSQL Autodoc</a></p>
    <p class="w3ref"><a href="http://validator.w3.org/check/referer">W3C HTML 4.01 Strict</a></p>
    </body></html>




[Category](Special%253ACategories "Special%253ACategories"):

- [Wiki Tools](Category%253AWiki_Tools "Category%253AWiki Tools")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Html.tmpl.module" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:29 on 10 December
  2010.</span>
<!-- - <span id="footer-info-viewcount">10,728 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





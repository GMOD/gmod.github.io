



<span id="top"></span>




# <span dir="auto">Apollo-Chado</span>









This page is pulled directly from the README.Apollo documentation in the
Chado code repository and is converted to text and dynamically loaded in
this page. The README was most recently changed on **Thursday 21st of
September 2006 01:26:42 PM**

------------------------------------------------------------------------

  

    Reading and Writing to a Chado database with Apollo
        This needs to be better documented, but here is a start:

        In order to use Apollo read/write with chado, here are things that need
        to be done:

        Grant privileges to users to several tables (list here)
            In the absence of a complete list of tables, you can grant access to
            all tables using sqlt and the perl Template::Toolkit template,
            bin/privileges.tmpl

                sqlt -f PostgreSQL -t TTSchema --template bin/privileges.tmpl modules/nofuncs.sql | psql

            You can edit the template to grant privileges to just specific users
            instead of PUBLIC, which of course would be a lot more secure.

        Insert several ad hoc cv terms found in
        modules/sequence/apollo-bridge/cv_inserts.sql.
            This file contains sql commands to insert several controlled
            vocabulary terms that Apollo expects to be in the database. This
            file can be recreated with additional terms as needed by editing the
            file modules/sequence/apollo-bridge/ad_hoc_cv and running the perl
            script modules/sequence/apollo-bridge/insert_ad_doc_cv.pl. The
            resulting sql file can be inserted into the database with this
            command:

                $ psql $DBNAME < modules/sequence/apollo-bridge/cv_inserts.sql

        Insert a few misc items like those found in
        modules/sequence/apollo-bridge/apollo.inserts
            Essentially, Apollo and chado have to agree about what the names of
            the programs in the analysis table are, and there needs to be a few
            terms in the cv table.

            About naming analysis results: there are no restrictions on what you
            name them, however the GFF3 bulk loader will insert them typically
            one of two ways:

            1   If you specify the -a (--analysis) flag with an argument, the
                loader will look for an entry in the analysis table where
                analysis.name is equal to the argument supplied with -a.

            2   If you don't give an argument with -a, the loader will look for
                analysis.name that is equal to the GFF source and type
                concatenated with and underscore between them, ie
                'source_type', eg, 'Rice_cDNA_match'.

            The inserts into the db table are there so that dbxref entries in
            GFF files I typically process. They can be ignored unless you are
            loading GFF files with Dbxref entries.

            Then there is the uniquename_id_generator sequence, for which
            integers for building uniquenames are used. Then there are two
            interts in to cvtermprop for the suffix and prefix for uniquename
            generation. Generated uniquenames with be of the form:

                $prefix . (int from uniquename_id sequence) . $suffix

            For example, if you insert 'RICE' for the prefix and 'X' for the
            suffix, the resulting name of the first feature will be
            'RICE000001X';

        Add the functions and triggers to chado.
            Use the perl script:

                % /usr/local/bin/gmod_apollo_triggers.pl create

            Note that this script can also be used to drop and add the triggers
            in case you want to do some bulk loading and want to disactivate the
            triggers for that.

        Modify the Apollo configuration file, chado-adapter.xml.
            IS THERE DOCUMENTATION FOR DOING THAT IN APOLLO'S DOCS? Yes, there
            is a section for connecteding directly to flybase chado in the
            apollo doc directory: doc/html/userguide.html but it is somewhat out
            of date. I need to work with Mark to update it (it will probably
            need me to write it and have Mark proof it).

        I understand that these directions are somewhat vague. Getting Apollo to
        work with chado requires a little hands on tinkering. If you find
        yourself having difficulties, please contact me.

        Scott Cain

        cain@cshl.edu

        4/29/05

  

- [Apollo-Chado example
  database](Apollo-Chado_example_database "Apollo-Chado example database")




[Categories](Special%253ACategories "Special%253ACategories"):

- [Apollo](Category%253AApollo "Category%253AApollo")
- [Chado](Category%253AChado "Category%253AChado")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Apollo-2DChado" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 18:06 on 28 December
  2007.</span>
<!-- - <span id="footer-info-viewcount">17,479 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





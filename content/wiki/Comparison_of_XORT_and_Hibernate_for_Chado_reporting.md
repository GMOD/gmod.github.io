---
title: "Comparison of XORT and Hibernate for Chado reporting"
---




<span id="top"></span>




# <span dir="auto">Comparison of XORT and Hibernate for Chado reporting</span>









<span style="color: red;">Please note: The age of this document means
that it is no longer relevant given the technological changes that have
occurred with the databases and ORM technologies discussed herein. It is
left here for historical purposes.</span>

  
**Comparison of [XORT](XORT.1 "XORT") and
<a href="http://www.hibernate.org/" class="external text"
rel="nofollow">Hibernate</a> for Chado reporting** - written by Josh
Goodman, FlyBase - Indiana University

**Introduction**  
At <a href="http://flybase.org/" class="external text"
rel="nofollow">FlyBase</a> we are currently in the process of migrating
all our existing data into Chado. In order to deal with data in this new
format we are re-vamping all of our report generation tools. The
qualities we were looking for in a new reporting framework were a good
balance of speed, flexibility, and minimizing the amount of in house
code that needed to be written. The term "reporting" here is referring
to the presentation aspect of Chado data to end users, i.e. a gene page,
an allele page, etc...

Thus, we evaluated two approaches to reporting Chado data, XORT and
Hibernate. XORT was chosen because it is already used with Chado and
provides a nice language neutral interface for extracting your data from
Chado into XML. Hibernate was chosen because it is one of the most
mature and stable object to relational mapping tools available. It is
very well documented, maintained by a large community, and can mostly be
tweaked through its XML files rather than modifying java code.
<a href="http://ibatis.org/" class="external text"
rel="nofollow">iBATIS</a> was also investigated but no formal tests were
done with it, more on that later.

In the end XORT proved to be the better choice, but only because it
excelled in areas that were most important to us. Other situations may
not be the same so please don't take this case study literally without
carefully weighing your needs and expectations. We hope that our
experience can prove to be useful in this respect.

**Tools Used**

- <a href="http://hibernate.org/" class="external text"
  rel="nofollow">Hibernate 3.0</a>
- <a
  href="http://sourceforge.net/project/showfiles.php?group_id=27707&amp;package_id=148718"
  class="external text" rel="nofollow">XORT 0.001</a>
- <a href="http://eclipse.org/" class="external text"
  rel="nofollow">Eclipse Java IDE 3.1.1</a>
- <a href="http://www.jboss.com/products/jbosside/downloads"
  class="external text" rel="nofollow">JBOSS Eclipse plugin v1.5</a>
- <a href="http://www.postgresql.org/" class="external text"
  rel="nofollow">Postgres 8.0</a>

**Setting up Hibernate**  
In order to use Hibernate you need two things, the Hibernate XML mapping
files and java code to set up the objects that will be populated.
Hibernate mapping files are usually set up by hand but the JBOSS Eclipse
IDE has a nice tool that will read your database schema and generate
them for you. This is also the first place we encountered a small
problem.

The chado schema has many indices that are not explicitly named and on
older versions of Postgres (7.x and maybe some early 8.0.x) indices that
are not named will automatically be given a name of \$1, \$2, \$3,
etc... The problem is that it doesn't check if it has already used those
names for other tables and so you end up with indices that are named in
duplicate. The JBOSS plugin doesn't like this and so it dies when
reading a schema with duplicate names. We dropped the schema, named the
indices, and reimported to correct this problem. Newer versions of
Postgres (8.0.x, 8.1) use unique names when creating indices that aren't
explicitly named.

Once this was fixed, the JBOSS hibernate plugin expertly read our
schema, generated all of our XML mapping files, and the necessary java
code.

**Setting up XORT**  
Setting up XORT is fairly simple if you've installed perl modules
before. The trickiest part is making sure that the ddl.properties file
that describes your schema matches the actual schema that is in the
database. Once that is done all you need to do is write a dumpspec to
dump the data you want.

**Results**  
The test plan was fairly simple, it consisted of first working with a
single table and adding linked table information one by one to see how
each system scaled. The hub table we started with was the pub table with
~130,000 records, it is fairly simple and we had a nice test data set
available. For Hibernate we setup a query that fetched all the
publication records and all their fields and for XORT we setup a
dumpspec that did the same. Since XORT also fetches the cvterm table by
default we modified the Hibernate query to fetch the same.

For this simple test case we did 5 runs each and Hibernate took 181
seconds and XORT took 372 on average. The advantage here can best be
explained by the caching strategies used by Hibernate when dealing with
the cvterm. XORT is executing a query to the cvterm table for each pub
record it encounters, whereas Hibernate caches the hits and only queries
the cvterm table when it finds an entry it hasn't cached.

One problem we did have with Hibernate was with its session based cache
because it was trying to keep a copy of each pub object as we scanned
the entire pub table. To get around this we had to explicitly cast the
pub object out of the session cache after we were done processing it.

The next table we added was the feature and organism tables linked via
the feature_pub table. This time Hibernate took 402 seconds and XORT
took 546 seconds on average. Hibernate is still out performing XORT but
not by much. The next table added was the pubauthor table, for this case
Hibernate's performance advantage went away taking 1800 seconds vs
XORT's 780 seconds. This huge change with such a simple table took us by
surprise. A single cause couldn't be pinpointed but it is thought that a
mix of the Hibernate table prefetching and cache performance caused most
of it. By this point we had to start using a disk based cache for some
of the objects and this caused a lot of disk IO. Several attempts to
bring this time down by tweaking various Hibernate parameters failed and
further table additions got exponentially worse compared to XORT.

Another possible cause of performance problems is the fact that, by
default, when an object is fetched you get all fields of that object
populated. Thus, if you are simply wanting a list of all feature names
and their type that are related to a particular publication what you end
up getting back is a fully populated feature object with name, type,
sequence, length, etc... Fetching these additional fields can put a lot
of overhead on a query and caching.

There are two options for getting around this field fetching problem.
First, you can customize the XML mapping files to set, on a field by
field basis, whether or not it is retrieved by default or not. The
problem with this is that for our purposes the optimal fetching strategy
is going to change depending on the task we are carrying out. i.e. When
querying/dumping out features for reporting we may want to get all
fields by default and a only a sub set of them when fetching features
attributed to publications. We could create a set of mapping files for a
table based on the different strategies but this would make our
application overly complex and hard to maintain in the long term.

The second approach is to use what Hibernate calls projection queries.
They amount to:

select new Feature(name,type) from feature where
uniquename='FBgn0000001'

This approach requires additional POJO code, is much less flexible, and
is essentially doing things the iBATIS way without the flexibility that
iBATIS provides so we saw little point of trying this method. On a side
note, we did not evaluate iBATIS because it required a greater degree of
direct java code manipulation than Hibernate. We wanted a solution that
all members of our dev team could edit and maintain rather than have
this responsibility sit with a few key people who know java. iBATIS
itself looked very capable and excelled at being less complicated in
certain areas where Hibernate can make your head spin. Other groups who
aren't concerned with committing your group to maintaining Java code in
the long term should definitely give it a look.

**Conclusion**  
In conclusion, we chose XORT over Hibernate because it provides a
language neutral interface and has good performance when dealing with a
realistic amount of tables compared to Hibernate. Hibernate's forte is
geared more towards a fetch/modify/update workflow and working with
numbers of objects on the scale of 1 to a few hundred at a time and not
tens or hundreds of thousands. We often felt like we were going against
the Hibernate grain by trying to setup this reporting system with a
large number of objects. Thus if you are working on applications that
fit this model it might be a good system to evaluate. It provides so
much functionality out of the box like advanced caching, application
level transactions, and much more that it is worth considering.
Hibernate's query language (HQL) does take a small amount of time to
get used to but it is rich enough to provide almost as much flexibility
as standard SQL. If you do find it limiting for some things it is
possible to place SQL in the mapping files to get around the
limitations.

XORT would greatly benefit by borrowing some of the strategies used by
iBATIS and Hibernate such as a caching layer to reduce the impact of
redundant calls to tables. It also needs to have improved documentation
so that the barrier for using it is lowered for those who may not be
familiar with Chado and how it is structured. A tutorial with a few use
case scenarios that describe what each line does would be immensely
helpful. Once you become familiar with Chado's structure, writing
dumpspecs is fairly straightforward. Overall, these are minor short
comings and we were pleased with XORT.




[Categories](Special%253ACategories "Special%253ACategories"):

- [Chado](Category%253AChado "Category%253AChado")
- [Java](Category%253AJava "Category%253AJava")
- [Middleware](Category%253AMiddleware "Category%253AMiddleware")
- [XORT](Category%253AXORT "Category%253AXORT")






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

- <span id="t-smwbrowselink"><a
  href="Special%253ABrowse/Comparison_of_XORT_and_Hibernate_for_Chado_reporting"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 15:48 on 12 September
  2011.</span>
<!-- - <span id="footer-info-viewcount">18,965 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





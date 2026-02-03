---
title: "Version Control System Access"
---




<span id="top"></span>




# <span dir="auto">Version Control System Access</span>





(Redirected from
[SVN](SVN)





*Subversion* (often abbreviated *SVN* is the *source code control*
system used by most of GMOD. Source code control systems, also known as
*revision control* or *version control* systems are used to record
changes to computer files. GMOD's main source code repository is at
<a href="http://gmod.svn.sourceforge.net/" class="external text"
rel="nofollow">SourceForge</a>.

This page explains how to both download and update the main GMOD
repository at SourceForge. For more on SVN itself see the
<a href="http://subversion.tigris.org/" class="external text"
rel="nofollow">Subversion Home Page</a> and the official
<a href="http://svnbook.red-bean.com/" class="external text"
rel="nofollow">Subversion Book</a>.

SVN is used by GMOD developers to update the components. SVN is also
used by some GMOD users, most of whom never modify any GMOD code. GMOD
users access SVN when they want to get component source code so they can
use the latest development version of that component, without having to
wait for the next official release. Please note, however, that
components pulled from SVN are **development** versions, and may not
always work as expected.


## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Browsing SVN
  Repositories</span>](#Browsing_SVN_Repositories)
- [<span class="tocnumber">2</span> <span class="toctext">SVN Read-only
  Access</span>](#SVN_Read-only_Access)
- [<span class="tocnumber">3</span> <span class="toctext">SVN Developer
  Access</span>](#SVN_Developer_Access)
- [<span class="tocnumber">4</span> <span class="toctext">Legacy CVS
  Read-only Access</span>](#Legacy_CVS_Read-only_Access)



## <span id="Browsing_SVN_Repositories" class="mw-headline">Browsing SVN Repositories</span>

GMOD SVN repositories can be browsed via web:
<a href="http://gmod.svn.sourceforge.net/gmod/" class="external free"
rel="nofollow">http://gmod.svn.sourceforge.net/gmod/</a>.

## <span id="SVN_Read-only_Access" class="mw-headline">SVN Read-only Access</span>

The GMOD [SVN](Glossary#SVN "Glossary") repository can be checked out
through anonymous SVN with the following instruction set. The module you
wish to check out must be specified in place of **PROJECTNAME**.

    svn co https://gmod.svn.sourceforge.net/svnroot/gmod/PROJECTNAME/trunk

See <a href="http://gmod.svn.sourceforge.net/" class="external free"
rel="nofollow">http://gmod.svn.sourceforge.net/</a> for available GMOD
projects in SVN repositories.

You can then get updates with the `svn update` command.

## <span id="SVN_Developer_Access" class="mw-headline">SVN Developer Access</span>

Developer access uses the same URLs as read-only access. When performing
write operations, you will simply be prompted for your SourceForge.net
username and password. To perform write operations, a GMOD project
administrator must have granted you write access to the repository.

## <span id="Legacy_CVS_Read-only_Access" class="mw-headline">Legacy CVS Read-only Access</span>



GMOD has migrated all projects from CVS to
<a href="http://subversion.tigris.org/" class="external text"
rel="nofollow">Subversion</a> as of September 15, 2009. See the [CVS to
Subversion
Conversion](CVS_to_Subversion_Conversion "CVS to Subversion Conversion")
page.



The old GMOD [CVS](Glossary#CVS "Glossary") repositories can be checked
out through anonymous (pserver) CVS with the following instruction set.
The module you wish to check out must be specified as the *modulename*.
When prompted for a password for anonymous, simply press the Enter or
Return key.

    cvs -d:pserver:anonymous@gmod.cvs.sourceforge.net:/cvsroot/gmod login
    cvs -d:pserver:anonymous@gmod.cvs.sourceforge.net:/cvsroot/gmod co modulename

If you need to check out a particular revision/tag in the repository,
add *-r tag_name* to the command. For example, if you needed the
'stable' branch of the GBrowse repository, you would do this in your
checkout command:

     cvs -d:pserver:anonymous@gmod.cvs.sourceforge.net:/cvsroot/gmod co -r stable Generic-Genome-Browser

See <a href="http://gmod.cvs.sourceforge.net/" class="external free"
rel="nofollow">http://gmod.cvs.sourceforge.net/</a> for available CVS
repositories.

You can then get updates with the `cvs update -d` command (the `-d`
command tells CVS to get any new directories that have been added to the
repository since the last update).

GMOD CVS repositories can also be browsed on the web:
<a href="http://gmod.cvs.sourceforge.net/gmod/" class="external free"
rel="nofollow">http://gmod.cvs.sourceforge.net/gmod/</a>.




[Category](Special%253ACategories "Special%253ACategories"):

- [GMOD Developers](Category%253AGMOD_Developers "Category%253AGMOD Developers")






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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Version_Control_System_Access"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 16:46 on 15 September
  2009.</span>
<!-- - <span id="footer-info-viewcount">125,099 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





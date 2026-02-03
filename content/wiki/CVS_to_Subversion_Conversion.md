---
title: "CVS to Subversion Conversion"
---
# CVS to Subversion Conversion

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/0e/Cvs_logo.gif/70px-Cvs_logo.gif"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/0e/Cvs_logo.gif 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/0e/Cvs_logo.gif 2x"
width="70" height="54" alt="CVS to Subversion Conversion" /></th>
<th><span style="font-size: 400%; font-weight: bold">⇒</span></th>
<th><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/9c/Subversion_logo.jpg" width="73"
height="52" alt="Subversion CVS to Subversion Conversion" /></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<th colspan="3">
Done
</th>
</tr>
&#10;</tbody>
</table>

[Rob Buels](/wiki/User:RobertBuels) ran the conversion on
September 15, 2009. The conversion finished around 12:45pm, Eastern US.
See <a href="/wiki/Subversion" class="mw-redirect"
title="Subversion">Subversion</a> for how to access the new repository.
We spent the rest of the day locking down CVS access (it is still there,
but is read-only), and updating this website to refer to
<a href="/wiki/SVN" class="mw-redirect" title="SVN">SVN</a> instead of CVS.

## Outstanding Issues

We do have a few unfinished items, and we expect a few bumps to pop up
over the coming weeks. We'll keep track of those problems here. Thus far
we have identified 2 issues. If you find any more, please add them here,
or email them to the
<a href="mailto:help@gmod.org" class="external text" rel="nofollow">GMOD
Help Desk</a>.

| Issue Name | Description | Status |
|----|----|----|
| Commit Mailing Lists | Several [GMOD Mailing Lists](/wiki/GMOD_Mailing_Lists) exist that automatically sent out emails whenever a commit was made to a CVS project. Need to create new lists or modify existing ones to read from SVN instead. | Work is under way. GBrowse, Schema, and Apollo have been set up. |
| [GBrowse](/wiki/GBrowse) net installer | The GBrowse net install program gets GBrowse from CVS. Needs to now get it from SVN | Fixed in the STABLE branch |

## Announcement

GMOD's CVS source code repository will be converted to Subversion (SVN)
on September 15, 2009. [Rob Buels](/wiki/User:RobertBuels)
of Cornell /  has generously offered
to to do this. The discussion leading up to this decision on the
<a href="http://comments.gmane.org/gmane.science.biology.gmod.devel/364"
class="external text" rel="nofollow">GMOD Developers mailing list</a>.

*If you are not a GMOD developer then this will, at most, change how you
get pre-release copies of GMOD components.* In the future you will do
SVN checkouts instead of CVS checkouts. The doc on this web site will be
updated to describe how to do this.

**If you are a GMOD developer and your project is in GMOD's CVS
repository then this move will significantly affect you.**

See
<a href="http://gmod.cvs.sourceforge.net/gmod/" class="external text"

CVS. This list is reproduced below. We have contacted all project
developers to confirm what projects are still active. All projects will
be moved to SVN, but any projects that are no longer active will be
placed in a separate archive directory. This will significantly clean up
the repository. See below for the future SVN status of each project.

Rob has created a
<a href="http://bugs.sgn.cornell.edu/trac/gmod_test_svn/browser/"
class="external text" rel="nofollow">preview version of the
repository</a>. Feel free to poke around. This version does not have any
projects archived.

Rob will move the projects on September 15. **Everyone with uncommitted
code changes should commit them to CVS by 3am, Eastern US time, on
September 15.** Rob will notify folks once the move is complete. After
September 15, all CVS checkouts you have should be removed and new
checkouts made with SVN. We'll provide doc on how to do this.

Please let Rob and Dave know if you have any questions.

Thanks,

[Dave Clements](/wiki/User:Clements) and [Rob
Buels](/wiki/User:RobertBuels)

## Projects

All projects will be moved, but some will be taken out of the active
repository and put in an `attic, archive,` or `frozen_projects`
directory.

This table keeps track of our efforts to identify which of the many
projects are still active.

| Name | Rev | Age | Last Touch | Last Change | Asked | Response | Action |
|----|----|----|----|----|----|----|----|
| apollo | 8803 | 2 weeks | gk_fan | \+ Check to make sure a match has the hit sequence data in case of id … |  | Keep | argos |
| 8808 | 5 years | dongilbert | v0.7 updates | Asked Don, Josh | Don said keep | Keep | balloon-tooltips |
| 8893 | 5 weeks | sheldon_mckay | Adding fall through for pre-existing mouseout event handlers. I hope this … |  | Keep | Bio-Graphics | 9120 |
| 5 days | anonymous | This commit was manufactured by cvs2svn to create tag 'release-1_981'. |  | Keep | blastGraphic | 9133 | 3 years |
| briano | Correct POD | Asked Shuai. Had 7 users in [2008 GMOD Community Survey](/wiki/2008_GMOD_Community_Survey). | *No response*, but keep anyway b/c of users. | Keep | bop | 9168 | 4 years |
| nomi | Removing this old redundant BOP repository--BOP is now integrated into the … | Ed, apollo list | Didn't address bop, but it's empty with a comment that it has been moved inside Apollo. | Archive | Bundle-GMOD | 9177 | 12 days |
| scottcain | adding prereqs for DBIx::DBStag, since DBStag's Makefile.PL doesn't … |  | Keep | citrina | 9289 | 4 years | jogoodma |
| Various minor bug fixes. | Josh Goodman, citrina list | Archive it | Archive | cmap | 692 | 2 weeks | kycl4rk |
| Commit. | Asked Ken, CMap list about existing CVS and SVN and what we should do with them. | Still under negotiation. The SVN CMap is for CMap 2, while the CVS CMap is CVS 1. These will probably become cmap1 and cma2 in SVN. | Keep both | das2 | 9753 | 2 years | allenday |
| fix to allow 1-column EGR for mas5 call, p-value. still need to make this … | Asked Allen Day, Brian O'Connor. | Brian said this is done and can be archived. | Archive | FlashGViewer | 9877 | 12 months | simont |
| updating from laptop |  | Keep | gbrowse-adaptors | 9921 | 5 days | anonymous | This commit was manufactured by cvs2svn to create tag 'release-1_03'. |
|  | Keep | gbrowse-tag | 9932 | 5 weeks | idavies | Updated links for use with login scripts | Asked Ian Davies what the future of this is. |
| Yep, it's his tagging work, but no it won't be merged by Sept 15 | Keep | GBrowse_karyotype | 9959 | 5 months | sheldon_mckay | Working on Bio::DB::SeqFeature::Store compatibility issues |  |
| Keep | gds | 10023 | 5 years | jogoodma | Latest GDS jar with new sort function. | Josh, don | Josh said Archive it. |
| Archive | genepages | 10131 | 3 years | anonymous | This commit was manufactured by cvs2svn to create tag 'r1'. | Asked Josh, don | Don said keep. |
| Keep | Generic-Genome-Browser | 13464 | 3 days | idavies | Better handling of same e-mail user creation, pre-global config |  | Keep |
| GenericGenePage | 13488 | 7 months | scottcain | I think the newer xml schema spec calls for xs: not xsd: |  | Keep | genogrid |
| 13513 | 14 months | dongilbert | genogrid v0.5 updates |  | Keep | gff-validator | 13538 |
| 4 months | zzgw | changed according to latest pod |  | Keep | gmod | 14270 | 6 years |
| scottcain | appended ggb\_ to special make targets for gbrowse | Asked Scott | Scott said this can go away. It was an idea that was never realized. | Don't copy | gmod-home | 14152 | 2 years |
| scottcain | pointing to cvs for diagrams in really old website | Asked Scott | Archive | gmod-web | 14261 | 5 years | scottcain |
| Looks good! Minor fixes, and tt2/custom/feature.tt2 is generated … | Asked Allen and Brian | Brian responded that the current version of [GMODWeb](/wiki/GMODWeb) is inside the [Turnkey](/wiki/Turnkey) Subversion repository. | Archive | goet | 14326 | 7 years | jmr39 |
| \*\*\* empty log message \*\*\* | Wrote to John Day-Richter | *No responses. Drop because of no updates in 7 years.* | Archive | GOView | 14330 | 4 years | anonymous |
| This commit was manufactured by cvs2svn to create tag 'start'. | Asked Shuai. Had 1 user in 2008 survey. | *No response.* Keep b/c of 1 user. | Keep | graphbrowse | 14349 | 5 years | sletovsky |
| fixed vertical_layout in new forms | No idea where Stan is. Asked Ben F and Scott. | Scott and Ben said archive it. Work never finished and never used. | Archive | imdb | 14374 | 6 years | x-pan |
| modified httpd.conf | IMDB is already classified as unsupported | Archive | jalview | 14452 | 8 years | searle | Removed the Jalview source which was mistakenly included with the … |
| Asked Ed, Apollo community. | Apollo has its own copy inside Apollo, and the Jalview project (which is quite active, didn't even know about this copy. | Archive | javaSean | 14488 | 3 years | smutniak | \*\*\* empty log message \*\*\* |
| Is already flagged as unsupported. | Archive | labdoc | 14504 | 7 years | allenday | added install file | Asked Brian O'Connor and Allen Day and Scott. |
| *No response, and no updates for 7 years.* | Archive | lucegene | 14549 | 15 months | dongilbert | updates 08june |  |
| Keep | nbrowse | 710 | 4 days | mgibson | handling clusters for khans cytoscape gaggle cluster data |  | Keep |
| org.bdgp | 14587 | 4 years | nomi | ClassLoader?.getSystemClassLoader() doesn't work from webstart. Need to use … | Asked Ed, Apollo list. | Apollo has its own copy inside. Chris M says definitive copy is at the GO web site. | Archive |
| pubfetch | 14818 | 4 years | simont | updated with new version changes | Asked Simon, Danny. Pubfetch is already tagged as unsupported. | Simon said Pubfetch is inactive and unsupported | Archive |
| pubsearch | 17657 | 4 years | dyoo | Added note about how our repository is now in Subversion under … | Asked Simon, Danny | Keep | pubtrack |
| 17780 | 4 years | vnarayan | binary | Asked Simon, Danny. PubTrack has no presence on the GMOD web site. | Simon said PubTrack is inactive and unsupported. | Archive | RestGraph |
| 17784 | 4 years | anonymous | This commit was manufactured by cvs2svn to create tag 'start'. | Asked Shuai. There were no users in 2008 survey. | *No response. No users.* | Archive. | sample_dbs |
| 17792 | 3 years | anonymous | This commit was manufactured by cvs2svn to create tag 'first'. | Asked Scott, schema list. | Scott said "sample_dbs is a good idea, but I don't know that cvs/svn is the right way to do it. In any event, the one db that is in there can go away as it is old" | Keep | schema |
| 19460 | 3 days | scottcain | adding an option to execute sql after the load of GFF is complete (to, for … |  | Keep | standard-urls | 19465 |
| 4 years | dongilbert | sample genome url soft from flybase | Asked Don, Josh | Don said keep | Keep | SynBrowse | 19469 |
| 4 years | anonymous | This commit was manufactured by cvs2svn to create tag 'initial_import'. |  | Keep | tripal | 695 | 11 days |
| scottcain | initial import of tripal |  | Keep | XML-XORT | 19544 | 2 years | briano |
| Minor edits, correct POD |  | Keep |  |  |  |  |  |

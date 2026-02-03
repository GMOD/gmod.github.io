---
title: "Hackathon 2007 info"
---
# Hackathon 2007 info

  Accomplishments](#Accomplishments)
  - [Apollo](#Apollo)
  - [Core](#Core)
  - [MediaWiki](#MediaWiki)
- [Location
  info](#Location_info)
  - [Dates](#Dates)
  - [Agenda](#Agenda)
  - [Location](#Location)
  - [Transportation](#Transportation)
    - [Airports](#Airports)
    - [Driving](#Driving)
    - [Public
      Transportation](#Public_Transportation)
  - [Lodging](#Lodging)
- [Goal](#Goal)
  - [Possible
    Goals considered](#Possible_Goals_considered)
- [Preparation](#Preparation)
- [Attendees](#Attendees)

# Accomplishments

## Apollo

- Created an example organism-specific webstart build of Apollo and an
  accompanying ant build file for repeating the build.
- Verified that the triggers required for the original JDBC connector
  work with PostgreSQL 8.1 (they work in Pg 7.4 but not in 8.0).
- Wrote an alternative set of triggers in plperl (converted from
  plpgsql)

Needs to be done still:

- Document the process for creating an organism specific release

## Core

- Created a webpage outlining the various configuration parameters that
  need to be adjusted to make it organism-specific.
- Created tools for users to upload GAME-XML files and for admins to
  load the XML files into Chado.
- Tested the GBrowse Chado adaptor with the GBrowse DAS server to verify
  that the Chado adaptor can work as a DAS-1 source.

Needs to be done still:

## MediaWiki

See [Hackathon_wikidb](Hackathon_wikidb "Hackathon wikidb")

- Did most of a new release of TableEdit to conform better to MW coding
  standards
- Wiki Chado round trip partly successful
  - Chado2Wiki worked via dumps to intermediate flatfile formats
  - Wiki2Chado worked for simple case with [Modware](Modware "Modware")
  - Wiki2Chado via Chado XML and XORT - close but not completed before
    we left

# Location info

## Dates

August 23-24

## Agenda

Thursday 8:40 Meet in the lobby of the hotel to walk over to NU

9:00 Introductions and network administrivia

9:30 The current state of things:

- Chado
- Wiki/TableEdit  : working notes at
  [Hackathon_wikidb](Hackathon_wikidb "Hackathon wikidb")
- Apollo
- Documentation\`

10:15 Sorting out who wants to do what

10:30 Hack!

## Location

Center For Genetic Medicine Northwestern University Chicago Campus  
in **Downtown Chicago**, IL  
Lurie Building Room 6-127 (6th floor)  
303 E Superior St  
<a
href="http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=303+E.+Superior+St.+Chicago,+IL&amp;sll=37.0625,-95.677068&amp;sspn=53.300127,102.919922&amp;ie=UTF8&amp;z=16&amp;iwloc=addr&amp;om=1"
class="external text" rel="nofollow">Google Map of Location</a>  

Elevators are located on the south side of the lobby. There is a
security guard who may stop you on the way to the elevator, you will
have to sign in and mention that you are with the GMOD hackathon.

This is on the **Northwestern University Medical School Campus in
DOWNTOWN CHICAGO**, not to be confused with the main campus in Evanston

## Transportation

### Airports

There are two major airports in Chicago: Midway and O'Hare. Both are
about equally convenient to Northwestern's Chicago Campus

- <a
  href="http://www.northwestern.edu/visiting/chicago/transportation/ohare/"
  class="external text" rel="nofollow">Directions from O'Hare</a>
- <a
  href="http://www.northwestern.edu/visiting/chicago/transportation/midway/"
  class="external text" rel="nofollow">Directions from Midway</a>

### Driving

- <a href="http://www.northwestern.edu/visiting/chicago/north/"
  class="external text" rel="nofollow">Driving from the North</a>
- <a href="http://www.northwestern.edu/visiting/chicago/south/"
  class="external text" rel="nofollow">Driving from the South</a>
- <a href="http://www.northwestern.edu/visiting/chicago/east/"
  class="external text" rel="nofollow">Driving from the East</a>
- <a href="http://www.northwestern.edu/visiting/chicago/west/"
  class="external text" rel="nofollow">Driving from the West</a>

Be aware that above driving directions for South and East travel take
you through I-90/94. This stretch of interstate is currently undergoing
major construction and you might encounter significant delays. See
<a href="http://www.danryanexpressway.com/" class="external free"
rel="nofollow">http://www.danryanexpressway.com/</a> for more
information and suggested alternate routes.

### Public Transportation

If you are taking the Chicago CTA (a.k.a the 'El') the closest stop is
Chicago Ave. on the RED LINE. <a
href="http://maps.google.com/maps?saddr=Chicago%2FState+Station+%4041.896671,-87.628176&amp;geocode=&amp;daddr=303+E+Superior+St,+Chicago,+IL+60611&amp;f=d&amp;hl=en&amp;sll=41.895776,-87.62028&amp;sspn=0.012363,0.025127&amp;ie=UTF8&amp;z=17&amp;om=1"
class="external text" rel="nofollow">Google map of route from Red line
to Hackathon Location</a>

## Lodging

There is a room block **at the <a
href="http://www.redroof.com/reservations/inn_details.asp?innNumber=281"
class="external text" rel="nofollow">Red Roof Inn Chicago - (312)
787-3580</a>** for August 22nd checking out on the 25th. This one of the
least expensive hotels in the area, but it is clean, secure, and very
close to the Hackathon venue. We blocked 5 doubles (so people can room
share if they like) and 5 kings at a rate of \$109 and \$119. **When you
are booking, please mention that you are with the 'HACKATHON' group in
order to get our group rate.** (code:b281hack)  

If you are interested in other hotels, there are a couple of very
conveniently located hotels:

- <a
  href="http://www.marriott.com/hotels/travel/chimm-courtyard-chicago-downtown-magnificent-mile/"
  class="external text" rel="nofollow">Courtyard by Mariott</a>
- <a href="http://www.wyndham.com/hotels/ORDDT/main.wnt"
  class="external text" rel="nofollow">The Wyndham hotel</a>
- <a href="http://www.omnihotels.com/FindAHotel/Chicago.aspx"
  class="external text" rel="nofollow">The Omni hotel</a>

Lastly, because of Chicago's public transportation system, anywhere that
is relatively near an 'El' stop is convenient!

# Goal

Several people have expressed interest in tuning the Apollo ↔ Chado
interaction. With that in mind, I would like to propose this goal: to
produce a VMware image that has
<a href="Chado" class="mw-redirect" title="Chado">Chado</a> and
associated tools, [Apollo](Apollo.1 "Apollo"), and MediaWiki with
[TableEdit](TableEdit.1 "TableEdit"), with the point of producing a
server that could be picked up and used for a nascent model organism
database for use with community annotation.

Other things that would make sense to put in the VMware image but are
secondary to the goal are [GBrowse](GBrowse.1 "GBrowse") and
[GMODWeb](GMODWeb "GMODWeb"). Other things that could be worked on
during the hackathon are rebuilding rpm packages for biopackages.net,
tuning [Modware](Modware "Modware") for the newer Chado schema, and
tuning PostgreSQL to get better performance.

More specific subgoals:

**Core:**

- A cgi file upload/drop box for community created GAMEXML/ChadoXML
  files (perhaps the wiki could handle this, since it would also take
  care of user identification, though it would almost certainly make the
  script below a little more complicated).
- A script for periodically loading uploaded XML files to Chado (this
  could use command line Apollo or XORT).
- A set up script that will prompt the user for items specific to the
  user/community and will make appropriate changes to *everything*,
  including:
  - Modifying mediawiki's LocalSettings.php with names, email addresses
    and icons
  - Inserting organism data into Chado (allowing for the possibility of
    multiple organisms)
  - Modifying appropriate Apollo config files that would then be
    downloadable by members of the community
  - Modifying the default organism in /usr/local/gmod/conf/default.conf.
- An easy to understand 'Getting started' guide that gives an overview
  of the contents and how to get started (presumably, this would go in
  the wiki so that the users would have the ability to edit the contents
  for their community)
- An easy to understand guide on how to update any software when
  necessary--mediawiki, extensions, GBrowse, Chado. More than anything,
  these should be pointers to where to get further information.

**Apollo:**

- An easy to understand Apollo configuration set up. Will we need a new
  release of Apollo (I'm betting yes)
- A good example config that works with the dicty example database.

**MediaWiki/[TableEdit](TableEdit.1 "TableEdit"):**

- See [Table Edit at Hackathon
  2007](TableEdit.1#Table_Edit_at_Hackathon_2007 "TableEdit")

All of this should be saved in the schema cvs, in the hackathon_2007
directory:
<a href="http://gmod.cvs.sourceforge.net/gmod/schema/hackathon_2007/"
class="external free"
rel="nofollow">http://gmod.cvs.sourceforge.net/gmod/schema/hackathon_2007/</a>

## Possible Goals considered

While definitive goals have not been established yet, here are some
possibilities. Please feel free to add more.

- Improving [Apollo-Chado](Apollo-Chado "Apollo-Chado") round tripping
  (documentation, examples, tutorials, configuration files, installation
  procedures, etc)

[Justin](User%253AJustaddcoffee "User%253AJustaddcoffee"): I've written
[Apollo-Chado Integration at BovineBase: Bugs and
Suggestions](Apollo-Chado_Integration_at_BovineBase%253A_Bugs_and_Suggestions "Apollo-Chado Integration at BovineBase: Bugs and Suggestions")
containing a list of bugs and suggestions from our developers and
[Apollo](Apollo.1 "Apollo") users, compiled during our construction of a
Chado\<-\>Apollo setup for the Bovine genome annotation effort.

- Beginning work on Apollo-Ensembl round tripping
- Merging the ClassDBI classes the [Modware](Modware "Modware") and
  [GMODWeb](GMODWeb "GMODWeb") use (Chado::AutoDBO and Turnkey::AutoDBI)
- Giving a small MOD a 'GMOD make over'
- Work on perl XML::DOM tools for writing [Chado
  XML](Chado_XML "Chado XML")
- Building VMware instances for distribution
- Rebuilding RPM packages for updated GMOD software
- Polishing a gmod 0.5 release
- Modify Apollo to annotate with GO terms and enable Chado round
  tripping of feature_cvterms
- improving analysis plugins for chado via [Modware](Modware "Modware")
  or [GBrowse](GBrowse.1 "GBrowse")
- performance tuning.
- community [wiki development/wiki table editor
  work](TableEdit.1#Table_Edit_at_Hackathon_2007 "TableEdit")

# Preparation

Things we'll need provided either by Eric (the host) or various people
coming:

- A server that a few VMware instances can go on (this could potentially
  be a fast laptop with a fair amount of memory)
- A base VMware instance to start working with (Scott will provide--what
  distro to use? Ubuntu server (its a bit of a hassle and the lack of a
  gui may turn some people off)? Ubuntu desktop? Fedora 7?)
- A VMWare instance with Chado already installed and some sample data
  (what to use? a few chromosomes of worm, or a few chromosomes of fly,
  something else? Perhaps a 'younger' organism that someone attending
  works on?) (Eric already created a vmware appliance with <a
  href="http://wiki.dictybase.org/dictywiki/index.php/Getting_Started_With_Modware_using_Vmware_appliance"
  class="external text" rel="nofollow">Chado populated with Dicty data</a>--I'll
  probably use that.)
- Also in the vmware instance: ~~phpmyadmin, phppgadmin,~~ mediawiki all
  configured and ready to use.
  [Scott](User%253AScott "User%253AScott") 20:46, 30 July 2007 (EDT): *I don't
  think the admin stuff needs to be a priority*
- A printer (maybe--do people use paper anymore?)
- A computer projector

**Prep for attendees:**

- All attendees should have SourceForge accounts and have them added as
  GMOD developers since we will be using a SourceForge GMOD cvs
  repository for work at the hackathon. Email Scott Cain with your
  SourceForge account name so he can add you.
- Get a developer's cvs checkout of the GMOD schema repository (if you
  already have one, do an "update -d" to get the new directory for the
  hackathon).
- Get a developer's cvs checkout of Apollo (in the GMOD cvs reposotiry),
  and try to build it. See apollo/doc/README.developers for pointers on
  running/building Apollo.

# Attendees

- Scott Cain, CSHL
- Eric Just, DictyBase, Northwestern
- Jim Hu, EcoliWiki, TAMU
- Don Gilbert, euGenes, IndianaU
- Mark Gibson, Apollo, Berkeley?
- Josh Goodman, FlyBase, IndianaU
- Mike Wong, SFSU, Center for Computing for Life Science (CCLS,
  <a href="http://ccls.lab.sfsu.edu" class="external free"
  rel="nofollow">http://ccls.lab.sfsu.edu</a>)
- Brian O'Connor, UCLA, biopackages.net
- Ben Faga, CSHL
- Debra Burhans, CSHL, Dolan Center
- Chinmay Patel, GeneDB
- Sanjay Chellapilla, Kansas State University
- Barry Wanner, Purdue University
- Colonel Ghiban, CSHL, Dolan Center
- David Sigfredo Angulo, DePaul University
  - <a href="http://IllinoisBioGrid.org" class="external free"
    rel="nofollow">http://IllinoisBioGrid.org</a>
  - <a href="http://facweb.cs.depaul.edu/bioinformatics/"
    class="external free"
    rel="nofollow">http://facweb.cs.depaul.edu/bioinformatics/</a>
  - <a href="http://gridweb.cti.depaul.edu/twiki/bin/view/IBG/WebHome"
    class="external free"
    rel="nofollow">http://gridweb.cti.depaul.edu/twiki/bin/view/IBG/WebHome</a>

Possible:

- Emmanuelle Morin, Sea urchin, CalTech
- Kris Khamvongsa, Sea urchin, CalTech
- Dave Emmert, FlyBase, Harvard
- Jonathan Crabtree, Apollo, The institute that was TIGR
- Justin Reese, Georgetown U. (via Skype)

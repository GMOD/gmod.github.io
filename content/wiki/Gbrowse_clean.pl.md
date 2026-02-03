---
title: "Gbrowse clean.pl"
---
# Gbrowse clean.pl

------------------------------------------------------------------------

**NAME**

gbrowse_clean.pl - Clean up sessions and other temporary gbrowse2 files



------------------------------------------------------------------------

**SYNOPSIS**

From the command line:

    sudo -u www-data gbrowse_clean.pl

Replace "www-data" with the web server account name on your system.

To run automatically under cron, create a crontab file for the web
server user that contains a line like the following:

    # m h  dom mon dow   command
    5 0  *  *  * /usr/bin/gbrowse_clean.pl >>/var/log/gbrowse2/gbrowse_clean.log



------------------------------------------------------------------------

**OPTIONS**

    -verbose: Report actions verbosely, printing out each session, file and directory deleted.
    -help   : Print a brief help message and exits.
    -man    : Prints the manual page and exits.



------------------------------------------------------------------------

**DESCRIPTION**

GBrowse2 generates a number of temporary files during its operations.
These files include session data, data cache files, and temporary image
files, as well as user upload data from custom tracks.

This script expires these temporary files, releasing unneeded space. The
script honors the following options from the GBrowse.conf master
configuration file:

    Name                   Default Description
    ----                   ------- -----------
    expire session         1M      How long to keep session data
    expire cache           2h      How long to keep cache data
    expire uploads         6w      How long to keep user track data

Time intervals are indicated using a count and a unit:

    Suffix     Time Unit
    ------     ---------
     s         seconds
     m         minutes
     h         hours
     d         days
     w         weeks
     M         months
     y         years

**expire session** controls how long before user session data expires.
Once a session expires, the user's saved settings, such as his preferred
data source, track visibility settings, and custom track uploads are
purged. The expiration interval is measured since the last time the user
*accessed* his session, so simply loading a region in the browser
without changing settings is sufficient to prevent a session from
expiring.

**expire cache** controls how long before cached track data is purged
from the system. Caching for up to a few hours increases performance
because users frequently reload the same region. Caching for longer
periods increases the time between updating the database and tracks
displaying those changes.

**expire uploads** controls how long to keep user uploaded data for
custom tracks on disk. It makes sense to keep it on disk for as long or
longer than the session. Even if the user's session expires, he can
still get at the uploaded data if he bookmarked his session or shared
the uploaded track at any point.

This script should be run periodically, ideally under cron. Once per day
should be adequate for most uses, but heavily-used sites may wish to run
the script more frequently. It is important to run the script under the
same user account as the web server; otherwise the script will be unable
to delete the files created by the web server user during gbrowse
execution. **Do not run this script as root.**



------------------------------------------------------------------------

**AUTHOR**

Lincoln D. Stein \<lincoln.stein@gmail.com\> Copyright 2009 Ontario
Institute for Cancer Research

This script is available under either the GNU General Public License or
the Perl Artistic License version 2.0. See LICENSE in the GBrowse source
code distribution for details.



------------------------------------------------------------------------

**SEE ALSO**

[GBrowse 2.0 HOWTO](GBrowse_2.0_HOWTO "GBrowse 2.0 HOWTO")

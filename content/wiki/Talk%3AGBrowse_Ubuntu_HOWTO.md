---
title: "Talk%253AGBrowse Ubuntu HOWTO"
---
# Talk%253AGBrowse Ubuntu HOWTO


I don't want to add this to the official doc, but I think somebody who
understands the pre-req's better could cull my list of packages down to
the correct set.

From the instructions on the page, I didn't have success. I went on to
use this set of packages (from <a
href="http://www.bioperl.org/wiki/Installing_BioPerl_on_Ubuntu_Server"
class="external free"
rel="nofollow">http://www.bioperl.org/wiki/Installing_BioPerl_on_Ubuntu_Server</a>):

    lynx unzip zip ncftp gcc libc6-dev make mysql-server apache2
    perl libgd-gd2-perl libcgi-session-perl libclass-base-perl

and threw this package in for good measure:

    libmodule-build-perl

...and it worked!

I'm tempted to add everything here (other than lynx) to the package list
on the page, but I suspect it might include more packages than are
really necessary.

  

------------------------------------------------------------------------

When I installed GBrowse using the script gbrowse_netinstall.pl, I got
the error message as follows;

    Force getting a BioPerl nightly build; the most recent release is too old

    *** Installing BioPerl ***
    Downloading bioperl-live...
    Failed to get nightly bioperl-live file: 

The reason of the error is the typo in a line of the
gbrowse_netinstall.pl script

               my $url = BIOPERL_LIVE_URL."/$filename";

must be changed to

               my $url = BIOPERL_LIVE_URL."$filename";

Then, the script can download the nightly bioperl-live file correctly
and install it.

--Mgenome
09:56, 18 March 2009 (UTC)

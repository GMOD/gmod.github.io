---
title: "Talk%253AGBrowse MacOSX HOWTO"
---
# Talk%253AGBrowse MacOSX HOWTO

## Defaults in the net installer

The net installer claims that going with the defaults should be just
fine, but I think a caveat should be added... especially on this page
where fink is described as the simplest way to install gbrowse's
prereqs. For example, /sw/lib would be the appropriate choice for the
first question during the script (where is libgd) rather than /usr/lib.
--[Stewarta](User%253AStewarta "User%253AStewarta") 13:14, 29 August 2007 (EDT)

*Good point; the comment about using the defaults is really referring to
the defaults for the GBrowse install proper, as opposed to the
prerequisites that get installed before GBrowse does (like GD.pm). I'll
see if I can craft a clearer explanation both in the installer script
and the MacOSX specific page. Thanks!* [Scott](User%253AScott "User%253AScott")
13:30, 29 August 2007 (EDT)

Another thing to consider is "path". This only worked for me with
non-fink perl (and who knows what else). Be default I use fink-enabled
binaries first. I had to re-order my path so that fink (as well as
darwin-ports) didn't come up. Its a little confusing since we use fink
to install the other stuff. Hope this helps Nathan 7
January 2009

## LWP::Simple on Tiger

I had to install LWP::Simple on Tiger via CPAN (error message: Can't
find LWP/Simple in @INC...):

% sudo cpan -i LWP::Simple

If cpan is not properly installed try

% sudo cpan install Bundle::CPAN

*I just tried using the net installer on a fresh install of Leopard and
it worked fine. Unfortunately, I don't have a Tiger install disk around
to do testing on, so I can't modify the gbrowse installer. I will add a
note about needing LWP::Simple to the mac install page though.*
[Scott](User%253AScott "User%253AScott") 17:10, 19 August 2008 (UTC)

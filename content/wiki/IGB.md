---
title: "IGB"
---
# IGB

<a href="http://genoviz.sourceforge.net/" class="external text"

is an application built upon the GenoViz SDK and Genometry for
[visualization](/wiki/Visualization) and exploration of
genomes and corresponding annotations from multiple data sources. IGB is
also a client for the DAS (Distributed Annotation System) protocol.

## From a Mac client to a Perl DAS/2 server

I'm going to see if I can get IGB on my Mac to connect to a local Perl
DAS/2 server I'm writing. This section is for Gregg to see my progress
(more likely lack thereof) and slap me if I stray too far.
--[Jhannah](/wiki/User:Jhannah) 14:30, 7 November 2007 (EST)

Gregg instructions from a Windows client:

    In your user home directory (not sure exactly where that is on Mac),
    IGB sets up an igb_prefs.xml file.  To add more DAS/2 servers to IGB,
    add a line like this to the file:

      <das2_server name="localhost" url="http://localhost:9092/das2/genome" />

Unfortunately on a Mac this apparently isn't so straight forward. My
preferences are getting stuck here:

     /Users/jhannah/Library/Preference/com.affymetrix.igb.plist

And OS/X is whacking the XML in very creative ways, into this key/dict
structure:

    ...
    <key>das2/</key>
    <dict>
      <key>http:%%netaffxdas.affymetrix.com%das2%genome/</key>
        <dict>
          <key>http:%%netaffxdas.affymetrix.com%das2%genome%H_sapiens/</key>
           <dict>
             <key>http:%%netaffxdas.affymetrix.com%das2%genome%H_sapiens_Mar_2006/</key>
               <dict>
                 ...

So I'm trying to reverse engineer how I can add my localhost as a DAS/2
server.

UPDATE from Gregg: The preferences stored in the \*.plist file are
serialized Java Preferences nodes, which are different from the
preferences kept in the "igb_prefs.xml" file -- IGB uses both. If you've
run IGB there should be an "igb_prefs.xml" file in your home directory,
which on OS X is usually /Users/\[user_id\]/. That's the file where you
need to add the das2_server line.

I've hit several apparently out-of-date things in the downloadable
IGB_User_Guide.pdf... I'm not sure if Gregg is interested in me
submitting documentation errata or not. (e.g.: "Exporting Preference
Settings" seems to have disappeared.)

UPDATE from Gregg: Yep the IGB User's Guide definitely needs an update.
I wouldn't worry about listing all the places the docs don't agree with
the current release -- there's a lot of those. If you encounter any
problems with IGB there is a discussion forum set up: <a
href="https://www.affymetrix.com/community/forums/forum.jspa?forumID=28"

### Misc plist wars

    Command line:
      plutil -convert xml1 -o j com.affymetrix.igb.plist
      plutil -convert binary1 -o com.affymetrix.igb.plist j
      defaults read com.affymetrix.igb
    GUI:
      /Developer/Applications/Utilities/Property List Editor.app
         (Part of the OS/X Developer Toolkit)

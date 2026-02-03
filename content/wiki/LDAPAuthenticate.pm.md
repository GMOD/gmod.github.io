---
title: "LDAPAuthenticate.pm"
---




<span id="top"></span>




# <span dir="auto">LDAPAuthenticate.pm</span>










## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">NAME</span>](#NAME)
  - [<span class="tocnumber">1.1</span>
    <span class="toctext">SYNOPSIS</span>](#SYNOPSIS)
  - [<span class="tocnumber">1.2</span>
    <span class="toctext">DESCRIPTION</span>](#DESCRIPTION)
  - [<span class="tocnumber">1.3</span>
    <span class="toctext">CONFIGURATION</span>](#CONFIGURATION)
  - [<span class="tocnumber">1.4</span> <span class="toctext">SEE
    ALSO</span>](#SEE_ALSO)
  - [<span class="tocnumber">1.5</span>
    <span class="toctext">AUTHOR</span>](#AUTHOR)



# <span id="NAME" class="mw-headline">NAME</span>

Bio::Graphics::Browser2::Plugin::LDAPAuthenticate - Authenticate user
against an LDAP server

## <span id="SYNOPSIS" class="mw-headline">SYNOPSIS</span>

In the GBrowse.conf configuration file:

    authentication plugin = LDAPAuthenticate

    [LDAPAuthenticate:plugin]
    login hint = your foobar corp account
    ldap server = ldap.foobar.com
    people base = ou=People,dc=foobar,dc=ny,dc=usa
    groups base = ou=Groups,dc=foobar,dc=ny,dc=usa
    # the following only needed if the LDAP server forbids anonymous (unbound) searches:
    bind dn    = uid=root,ou=People,dc=foobar,dc=ny,dc=usa
    bind pass  = xyzzy

## <span id="DESCRIPTION" class="mw-headline">DESCRIPTION</span>

This plugin uses hard-coded values to authenticate users against an LDAP
database. Users can log in using their Unix login names and passwords
(LDAP "posixAccount"). Groups are authorized against the posixGroup
memberUID fields.

## <span id="CONFIGURATION" class="mw-headline">CONFIGURATION</span>

For this plugin to work, you must configure an
\[LDAPAuthenticate:plugin\] section in the main GBrowse.conf file. It
will look like this:

    [LDAPAuthenticate:plugin]
    login hint = your foobar corp account
    ldap server = ldap.foobar.com
    people base = ou=People,dc=foobar,dc=ny,dc=usa
    groups base = ou=Groups,dc=foobar,dc=ny,dc=usa

**login hint** (optional) is displayed to the user so that he knows what
account credentials he or she is being asked for.

**ldap server** (required) is the address of the LDAP server you wish to
contact. If the server is running on a non-standard, port, you can
indicate it as "ldap.foobar.com:1118".

**people base** (required) is the search base for the People records
where the provided user id will be found.

**groups base** (required) is the search base for the Group records
where the user's group membership can be determined.

In addition, if your LDAP server requires a username and password to
bind to B\<before\> permitting searches, then you will need to provide:

**bind dn** (optional) the distinguished name of the LDAP user to bind
to. This is often called the LDAP "root" user.

**bind pass** (optional) the password of the LDAP user to bind to.

Note that providing this bind user's account name and password in a file
that is readable by the web server can be considered a security risk.
Consider allowing anonymous searches on the LDAP server, or else create
an unprivileged user account for the initial binding step.

## <span id="SEE_ALSO" class="mw-headline">SEE ALSO</span>

Bio::Graphics::Browser2::Plugin

## <span id="AUTHOR" class="mw-headline">AUTHOR</span>

Lincoln Steinlincoln.stein@oicr.on.ca

Copyright (c) 2011 Ontario Institute for Cancer Research

This library is free software distributed under the Perl Artistic
License v2; you can redistribute it and/or modify it under the same
terms as Perl itself.








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

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/LDAPAuthenticate.pm" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 17:05 on 4 December
  2012.</span>
<!-- - <span id="footer-info-viewcount">7,658 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





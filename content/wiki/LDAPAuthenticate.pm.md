---
title: "LDAPAuthenticate.pm"
---
# LDAPAuthenticate.pm

 NAME](#NAME)
 - [SYNOPSIS](#SYNOPSIS)
 - [DESCRIPTION](#DESCRIPTION)
 - [CONFIGURATION](#CONFIGURATION)
 - [SEE
 ALSO](#SEE_ALSO)
 - [AUTHOR](#AUTHOR)

# NAME

Bio::Graphics::Browser2::Plugin::LDAPAuthenticate - Authenticate user
against an LDAP server

## SYNOPSIS

In the GBrowse.conf configuration file:

 authentication plugin = LDAPAuthenticate

 [LDAPAuthenticate:plugin]
 login hint = your foobar corp account
 ldap server = ldap.foobar.com
 people base = ou=People,dc=foobar,dc=ny,dc=usa
 groups base = ou=Groups,dc=foobar,dc=ny,dc=usa
 # the following only needed if the LDAP server forbids anonymous (unbound) searches:
 bind dn = uid=root,ou=People,dc=foobar,dc=ny,dc=usa
 bind pass = xyzzy

## DESCRIPTION

This plugin uses hard-coded values to authenticate users against an LDAP
database. Users can log in using their Unix login names and passwords
(LDAP "posixAccount"). Groups are authorized against the posixGroup
memberUID fields.

## CONFIGURATION

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

## SEE ALSO

Bio::Graphics::Browser2::Plugin

## AUTHOR

Lincoln Steinlincoln.stein@oicr.on.ca

Copyright (c) 2011 Ontario Institute for Cancer Research

This library is free software distributed under the Perl Artistic
License v2; you can redistribute it and/or modify it under the same
terms as Perl itself.

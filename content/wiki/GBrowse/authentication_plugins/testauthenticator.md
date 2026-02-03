---
title: "Gbrowse/authentication plugins/testauthenticator"
---
# Gbrowse/authentication plugins/testauthenticator

The TestAuthenticator plugin is used for testing the GBrowse
authentication system. The entire module's code looks like this:

``` de1
 package Bio::Graphics::Browser2::Plugin::TestAuthenticator;
 use strict;
 use base 'Bio::Graphics::Browser2::Plugin::AuthPlugin';
 
 sub authenticate {
    my $self = shift;
    my ($name,$password) = $self->credentials;
    return unless $name eq 'lincoln' && $password eq 'foobar';
    return ($name,'Lincoln Stein');  # username, fullname
 }
 
 1;
```

The idea is very simple. The module inherits from
Bio::Graphics::Browser2::Plugin::AuthPlugin, a "template" module that
does the hard work. It then overrides the authenticate() method, which
does the actual matching of username and password. The call to
\$self-\>credentials() returns a username and password previously
entered into the login dialog box. We return false unless the username
is "lincoln" and the password is "foobar". Otherwise, we return a
two-element list consisting of the username and the user's full name.

Run **perldoc Bio::Graphics::Browser2::Plugin::AuthPlugin** for
information on how to write more sophisticated authentication plugins.

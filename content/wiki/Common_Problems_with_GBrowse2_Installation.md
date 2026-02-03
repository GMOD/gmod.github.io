---
title: "Common Problems with GBrowse2 Installation"
---
# Common Problems with GBrowse2 Installation

Here are some common problems.

GBrowse loads, but the fonts and colors are wrong, and none of the click or drag options works.  
This happens when GBrowse can't find its css and/or javascript files. To
confirm, check the server error log. You will see messages about missing
.css and .js files. Check and correct the **url_base** setting in
GBrowse.conf. This can sometimes happen when you tell the installer to
put GBrowse's htdocs files in a non-standard location.
When upgrading from an earlier version of GBrowse2, you get an "Internal Server Error" message and the server error log complains about a "Deparse" error.  
This is caused by the GBrowse2 config file parsing and caching system,
which speeds up loading of large config files. Perl can't correctly
cache certain complex callbacks. To fix this problem, try to isolate
which callback(s) are causing the problem and rewrite them to be
standard sub {} callbacks. If nothing else works, edit the Apache config
file to set the environment variable GBROWSE_NOCACHE to a true value
(such as "1") and restart the server. This will disable the caching
system.

More information on this: for standard CGI installs, find the Apache
config file that contains GBrowse configuration information (often in
/etc/apache2/conf.d/gbrowse2.conf), and add a SetEnv directive. E.g.

    <Directory "/usr/lib/cgi-bin/gb2">
     SetEnv GBROWSE_NOCACHE "1"
     SetEnv GBROWSE_CONF   "/etc/gbrowse2"  # this should already be there
    </Directory>

For mod_fcgid:

    DefaultInitEnv GBROWSE_NOCACHE "1"

For mod_fastcgi:

    FastCGIConfig -initial-env GBROWSE_NOCACHE=1

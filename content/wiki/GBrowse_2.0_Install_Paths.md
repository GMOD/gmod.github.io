---
title: "GBrowse 2.0 Install Paths"
---
# GBrowse 2.0 Install Paths

Gbrowse 2.0 typically installs in several different locations. If, for
whatever reason, you need to do a manual clean uninstall of all Gbrowse
files, you need to clear the following directories. Note that depending
on how GBrowse was installed in the first place (ie, CPAN versus apt-get
for instance), the paths may be different.

## Ubuntu

- **/var/www/gbrowse2/**: Holds the website files (HTML, etc.),
  Javascript & CSS files, and any databases.
- **/etc/gbrowse2/**: Holds the language files for help, MobyServices,
  the themes & various configuration files.
- **/usr/local/lib/perl/\[perl version\]/Bio/Graphics/Browser2**: The
  perl modules which make up the majority of the Gbrowse code.
- **/etc/apache2/conf.d/gbrowse2.conf**: The apache configuration file.
- **/usr/lib/cgi-bin/**: CGI scripts for use when the site is running
  (anything in the source /cgi-bin/ directory).
- **/var/tmp/gbrowse2/**: Temporary files like sessions, user data,
  images, etc.

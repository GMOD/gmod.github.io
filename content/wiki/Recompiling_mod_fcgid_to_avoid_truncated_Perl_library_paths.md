---
title: "Recompiling mod fcgid to avoid truncated Perl library paths"
---
# Recompiling mod fcgid to avoid truncated Perl library paths

Apache's
<a href="http://httpd.apache.org/mod_fcgid/" class="external text"

over the older mod_fastcgi, but has one major gotcha. Many people will
install custom Perl libraries in non-standard locations, and then use
the PERL5LIB environment variable to point GBrowse at those locations.
The way to set environment variables for fcgid scripts is to use
FcgidInitialEnv (or DefaultInitEnv in older versions of mod_fcgid) in
the apache configuration file:

 # from /etc/apache2/conf.d/gbrowse2.conf
 Alias /fgb2 "/usr/lib/cgi-bin/gb2"
 <Location /fgb2>
 SetHandler fcgid-script
 Options ExecCGI
 </Location>
 IdleTimeout 300
 FcgidInitialEnv GBROWSE_CONF /etc/gbrowse2
 FcgidInitialEnv PERL5LIB /home/lstein/projects/Bio-Graphics/trunk/lib:/home/lstein/projects/bioperl-
 live:/home/lstein/projects/Generic-Genome-Browser-Trunk/lib:/home/lstein/projects/Bio-
 BigFile/lib:/home/lstein/projects/Bio-BigFile/blib/arch

Unfortunately, you will find that PERL5LIB is truncated at 127
characters, causing Perl to complain that some libraries are missing and
possibly causing an Internal Server Error.

The problem is that mod_fcgid limits environment variables to 127
characters and will truncate their values if they exceed this. To fix
this problem, you must get the source, modify one line of a header file,
reinstall the module. Here is the recipe:

 1% wget http://apache.sunsite.ualberta.ca/httpd/mod_fcgid/mod_fcgid-2.3.6.tar.gz
 2% tar zxvf mod_fcgid-2.3.6.tar.gz
 3% cd mod_fcgid-2.3.6
 4% perl -pi.bak -e 's/INITENV_VAL_LEN 128/INITENV_VAL_LEN 512/' modules/fcgid/fcgid_conf.h
 5% APXS=/usr/bin/apxs2 ./configure.apxs
 6% make
 7% sudo make install

Line 5 requires you to set the APXS environment variable to indicate
where Apache's apxs2 compiler is located. Please change it to match
where apxs2 is installed on your system. If you don't have apxs2, then
you may need to install the development version of Apache. After
reinstalling mod_fcgid, please restart Apache.

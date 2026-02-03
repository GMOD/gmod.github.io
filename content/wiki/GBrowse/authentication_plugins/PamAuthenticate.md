---
title: "Gbrowse/authentication plugins/PamAuthenticate"
---




<span id="top"></span>




# <span dir="auto">Gbrowse/authentication plugins/PamAuthenticate</span>









The PamAuthenticate plugin is one of a very small number of [GBrowse
Plugins](../../GBrowse_Plugins "GBrowse Plugins") that can be used to
gather user credentials and authenticate them. This associates a user
with a stable username and can be used to:

1.  Remember a user's preferences, uploads and other settings across
    multiple computers.
2.  Allow users to share tracks with each other and to make uploaded
    tracks public.
3.  [Authorize](../../GBrowse_Configuration/Authentication "GBrowse Configuration/Authentication")
    certain users to access tracks and/or datasources.


## Contents



- [<span class="tocnumber">1</span>
  <span class="toctext">Introduction</span>](#Introduction)
- [<span class="tocnumber">2</span> <span class="toctext">Setting Up
  Username/Password
  Authentication</span>](#Setting_Up_Username.2FPassword_Authentication)
- [<span class="tocnumber">3</span> <span class="toctext">Setting up
  Group Definitions</span>](#Setting_up_Group_Definitions)
- [<span class="tocnumber">4</span> <span class="toctext">Customizing
  the Plugin</span>](#Customizing_the_Plugin)
- [<span class="tocnumber">5</span> <span class="toctext">Further
  Information</span>](#Further_Information)



# <span id="Introduction" class="mw-headline">Introduction</span>

The PamAuthenticate plugin is installed by default in
/etc/gbrowse2/plugins, but is not activated. When activated, it uses the
<a href="http://www.kernel.org/pub/linux/libs/pam/"
class="external text" rel="nofollow">Pluggable Authentication Module
(PAM)</a> to authenticate users, and /etc/nsswitch.conf to associate
users with groups. This allows considerable flexibility in connecting
GBrowse to enterprise authentication/authorization backends, and allows
you to use systems ranging in complexity from simple UNIX shadow files
to complex Kerberos authentication systems.

# <span id="Setting_Up_Username.2FPassword_Authentication" class="mw-headline">Setting Up Username/Password Authentication</span>

To set up the PamAuthenticate system, you need to configure a PAM
service called "gbrowse" by creating the file /etc/pam.d/gbrowse. A
simple /etc/pam.d/gbrowse file that uses local UNIX password/shadow
databases would look like this:

    auth     requisite   pam_unix.so

an LDAP-based authentication would refer to *pam_ldap.so* instead.

Note that if you are going to use the UNIX shadow password system for
authentication, the web user must belong to the "shadow" group on many
systems. You can arrange this as follows:

    usermod -G shadow -a www-data

Change "shadow" and "www-data" to the group that can read the
/etc/shadow file and the Apache user respectively. Note that you will
typically **not** want to give server login privileges to all
individuals who have genome browser accounts. You can use PAM to forbid
actual logins to members of certain groups (see the pam_group.so module
for more information).

# <span id="Setting_up_Group_Definitions" class="mw-headline">Setting up Group Definitions</span>



<a href="../../File:Pam_authenticate.png" class="image"><img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/c0/Pam_authenticate.png" width="426"
height="330" alt="Pam authenticate.png" /></a>



The PAM authentication plugin uses **/etc/nsswitch.conf** system
configuration file to map users onto groups for group-based
authentication. nsswitch.conf, in turn, provides connections to the
traditional **/etc/group** file, the NIS database, or LDAP databases,
depending on how it is configured. For example, to fetch user and group
information from the local filesystem first, and then to look in LDAP,
nsswitch.conf should have lines that looks like this:

    passwd: compat ldap
    group:  compat ldap

Once these steps are taken, you'll configure GBrowse to use the PAM
authentication plugin. Edit **/etc/gbrowse2/GBrowse.conf** and add or
uncomment the following line in the \[GENERAL\] section:

    authentication plugin = PamAuthenticate

When you reload GBrowse, you will see a simple "Login" link in the upper
right hand corner of the screen. Clicking on this link will bring up a
dialog that prompts you for your login username and password. If all is
configured correctly, then you'll be able to log in using your Unix
username and password.

  

# <span id="Customizing_the_Plugin" class="mw-headline">Customizing the Plugin</span>

You can customize the messages that appear at the top and bottom of the
login dialog box by setting configuration options in the
\[PamAuthenticate:plugin\] stanza located in GBrowse.conf:

    [PamAuthenticate:plugin]
    login hint = your UNIX account
    login help = Please see your system administrator for help
    if you have lost your  password.
    pam service name = gbrowse

login hint  
This is the message that appears at the top of the dialog box, and is
intended to be used to tell the user what credentials he is to supply.
For example, you can change it to read "your Acme username and
Cryptocard password".

login help  
This is the message that appears at the bottom of the dialog box and is
intended to provide contact information for the user if he cannot
remember his password. It can contain HTML links if desired.

pam service name  
This is the name of the pam.d service for gbrowse. You can place any
defined service name in this option. For example, to use the PAM
configuration for the login service, simply change the value to "login"
and the same restrictions that are used for local logins (e.g. time of
day) will be applied to GBrowse.

# <span id="Further_Information" class="mw-headline">Further Information</span>

For further information on how this plugin works, and some hints on how
to create your own customized authentication plugin, please see
[Creating GBrowse
Plugins](../../Creating_GBrowse_Plugins "Creating GBrowse Plugins").




[Category](../../Special%253ACategories "Special%253ACategories"):

- [GBrowse
  Plugins](../../Category%253AGBrowse_Plugins "Category%253AGBrowse Plugins")






## Navigation menu







<a href="../../Main_Page"
style="background-image: url(../../../images/GMOD-cogs.png);"
title="Visit the main page"></a>


### Navigation



- <span id="n-GMOD-Home">[GMOD Home](../../Main_Page)</span>
- <span id="n-Software">[Software](../../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../../Special:AllPages)</span>




### Documentation



- <span id="n-Overview">[Overview](../../Overview)</span>
- <span id="n-FAQs">[FAQs](../../Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../../Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](../../Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](../../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD
  Promotion](../../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../../Meetings)</span>
- <span id="n-Calendar">[Calendar](../../Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a
  href="../../Special%253ABrowse/Gbrowse-2Fauthentication_plugins-2FPamAuthenticate"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 14:18 on 4 May
  2011.</span>
<!-- - <span id="footer-info-viewcount">15,371 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





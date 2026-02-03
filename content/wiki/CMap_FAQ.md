---
title: "CMap FAQ"
---
# CMap FAQ

  FAQ</span>](#About_this_FAQ)
  - [What is
    this FAQ?](#What_is_this_FAQ.3F)
  - [How is it
    maintained?](#How_is_it_maintained.3F)
- [Install](#Install)
  - [How do I
    install CMap?](#How_do_I_install_CMap.3F)
- [Configuration](#Configuration)
  - [How do I
    configure CMap?](#How_do_I_configure_CMap.3F)
  - [How do I
    configure CMap so that when someone does mouse over a feature, it
    shows the name, beginning position and end
    position?](#How_do_I_configure_CMap_so_that_when_someone_does_mouse_over_a_feature.2C_it_shows_the_name.2C_beginning_position_and_end_position.3F)
  - [How do I
    configure CMap to include an attribute value in the mouse over
    pop-up for a feature or
    map?](#How_do_I_configure_CMap_to_include_an_attribute_value_in_the_mouse_over_pop-up_for_a_feature_or_map.3F)
- [Administration](#Administration)
  - [How can I
    password protect some data sources while leaving other data sources
    open in the same CMap
    installation?](#How_can_I_password_protect_some_data_sources_while_leaving_other_data_sources_open_in_the_same_CMap_installation.3F)

## About this FAQ

### What is this FAQ?

It is the list of [Frequently Asked
Questions](/wiki/Category%253AFAQ) about [CMap](/wiki/CMap.1).

### How is it maintained?

It is now maintained as a
<a href="http://en.wikipedia.org/wiki/Wiki" class="extiw"
title="wp:Wiki">Wiki</a> on this site. You can help maintain it by
adding questions and answers.

## Install

### How do I install CMap?

You can download CMap from source forge :
<a href="http://sourceforge.net/projects/gmod/files/"
class="external free"
rel="nofollow">http://sourceforge.net/projects/gmod/files/</a>

## Configuration

### How do I configure CMap?

### How do I configure CMap so that when someone does mouse over a feature, it shows the name, beginning position and end position?

The "area_code" section of each feature_type (or map_type) declaration
in the configuration file will allow you to modify the behavior of the
features(or maps).

The "area_code" section is where you can define Perl code that is
executed during feature (or map) drawing. It allows you to specify a few
things about the area box over the feature (or map).

There are three variables that are useful to dynamically set;

\$code - Holds the javascript to be associate with the feature (or map)
and is useful for creating mouse over effects and the like.

\$alt - Holds the text that will be displayed in a little pop-up box
when you hover over a feature (or map). This is specifically what you
want to modify in your case.

\$url - Holds the url that the feature will point to.

In the following example the \$code variable is set so mousing over the
feature will give the feature name in the status bar. The \$alt is set
to popup the feature name with the start and stop positions (as you
wanted) and the \$url will point to google.

     <feature_type read>
       feature_type_acc read
       feature_type Read
       area_code <<EOF
       $code=sprintf("onMouseOver=\"window.status='%s';return true\"", $feature->{'feature_name'});
       $alt =sprintf("%s: %s-%s",$feature->{'feature_name'}, $feature->{'feature_start'},$feature->{'feature_stop'});
       $url=sprintf("www.google.com/search?q=%s",$feature->{'feature_name'});
     EOF
     </feature_type>

More information can be found in the <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/cmap/trunk/docs/ADMINISTRATION.pod"
class="external text" rel="nofollow">ADMINISTRATION.pod</a>
documentation that comes with the CMap distribution.

### How do I configure CMap to include an attribute value in the mouse over pop-up for a feature or map?

Attributes aren't as easily accessed as other fields (for speed
reasons). To get at them, you have to write a Perl code in the config
file that accesses the database through the sql() object.

In the area_code portion of the feature/map type, the sql object can be
accessed using \$self-\>sql(). The resulting object has methods that
interact with the database. For more information about the methods that
can be called execute "perldoc Bio%253A%253AGMOD::CMap::Data::Generic" on the
command line. In this instance, we want to use get_attributes() to read
through the attributes and look for the one to display.

Here is an example of how to do this:

     <feature_type int-phen>
     feature_type_acc int-phen
     feature_type Pnterpolated Phenotype
     area_code <<EOF
         # The following uses the CMap sql() method to get at the
         # Generic.pm object.  This object queries the database.
         # In this case we are getting attributes.
         # For more information:
         #   perldoc Bio%253A%253AGMOD::CMap::Data::Generic
         my $conf_attributes = $self->sql->get_attributes(
             object_type => 'feature',
             object_id   => $feature->{'feature_id'},
         );

         # Now create a string that will be attached to the description
         my $conf_desc = ;

         # Cycle through all available attributes.
         # get_attributes returns an arrayref.
         foreach my $conf_attr ( @{ $conf_attributes | [] } ) {

             # Look for the attribute that we are interested in
             if ( $conf_attr->{'attribute_name'} eq 'Description' ) {
                 $conf_desc .= $conf_attr->{'attribute_name'} . ":"
                     . $conf_attr->{'attribute_value'} . " ";
             }
         }

         # attach it to the $alt value in whatever format you like
         $alt = $feature->{'feature_name'} . " " . $conf_desc;
     EOF
     </feature_type>

## Administration

### How can I password protect some data sources while leaving other data sources open in the same CMap installation?

The easiest way to do this is to use two different cmap cgi scripts.
They can either be renamed (cmap and cmap_password for example) or
placed into subdirectories of the cgi-bin directory (cmap1/cmap and
cmap2/cmap).

(Incidentally, this is how you run CMap on two different web servers on
the same machine).

1.  Create a second cmap.conf directory somewhere else in the file
    system (that the web server has access to).
2.  Create two different cmap cgi scripts each one specifying a
    different config directory.
3.  Password protect one cgi script (using your web server).
4.  Modify the cmap home page (cmap/index.hml) to link to the new cgi
    scripts rather than the original (all the other links generated by
    CMap will be correct).

The caveat to this is that you will have to administer them separately.
You will have to supply the config directory to cmap_admin.pl when
administering the non-default data_sources. (cmap_admin.pl -c
/path/to/different/cmap.conf).

The following are notes from a CMap administrator for using the
installer to help perform this task which were sent to the CMap mailing
list. (edited for display and reprinted by permission)

1.  Edit CMapBuilder.pm and change the line

    my \$to_cgi = catfile( \$self-\>notes('CGIBIN'), 'cmap' );

    into

    my \$to_cgi = catfile( \$self-\>notes('CGIBIN'), 'cmap-1' );
2.  perl Build.PL PREFIX=/var/www/cmap CONF=/etc/cmap/cmap-1.conf
    CGIBIN=/usr/lib/cgi-bin/ WEB_DOCUMENT_ROOT=/var/www
    HTDOCS=/var/www/cmap

    ./Build

    ./Build install
3.  Make a copy of index.html (say, cmap-1.html)
4.  Edit cmap-1.html and replace all the occurrences of /cgi-bin/cmap by
    /cgi-bin/cmap-1

    The first CMap db will be available at
    www.mysite.org/cmap/cmap-1.html.

    Then, for each additional data source:

    - make a new conf directory (e.g., mkdir /etc/cmap/cmap-2.conf);
    - go through step 1-2 (where any occurrence of 'cmap-1' is replaced
      by 'cmap-2'), but \*without\* installing.
    - Rename htdocs/index.html into, say, cmap-2.html and copy it into
      /var/www/cmap.
    - Rename cgi-bin/cmap into 'cmap-2' and copy it into the default
      cgi-bin directory (/usr/lib/cgi-bin in this example). Make it
      executable.
    - Perform step 4, with 'cmap-1' replaced by 'cmap-2'.
5.  At the end, remove index.html or, even better, replace it with a
    welcome page. Now, you can password protect different data sources
    independently.

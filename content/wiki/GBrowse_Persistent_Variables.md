---
title: "GBrowse Persistent Variables"
---
# GBrowse Persistent Variables

[GBrowse](/wiki/GBrowse.1) uses a few persistent variables to store
data for a user. The following is an explanation of the structure of the
commonly-used ones:

  Session](#Session)
- [State](#State)
- [Querying the
  State Variable](#Querying_the_State_Variable)
- [Globals](#Globals)

# Session

**\$session** is a blessed Browser2::Session object containing
information regarding the current user's session. It contains the
following key-\>value pairs:

- - **pid** *\[number\]* - The process ID number of the session.
  - **lockdir** *\[string\]* - The directory path holding the lock
    information.
  - **locktype** *\[string\]* - The type of lock used.
  - **lockobj** *\[hash\]* - The blessed <a
    href="http://search.cpan.org/~bbb/File-NFSLock-1.20/lib/File/NFSLock.pm"
    class="external text" rel="nofollow">File::NFSLock</a> object,
    containing details of the session.
  - **session** *\[hash\]* - A blessed
    <a href="http://search.cpan.org/~sherzodr/CGI-Session-3.95/Session.pm"
    class="external text" rel="nofollow">CGI::Session</a> object
    containing the session. The only data we need to worry about is in:
    - **\_DATA** *\[hash\]* - Holds all the stored session data, with
      the data source name as the key.
      -  *\[hash\]* -
        - **plugins** *\[hash\]* - A collection of data stored by
          individual plugins, collected with the plugin name as a key.
        - **page_settings** *\[hash\]* - The page settings, as stored in
          \$state

# State

**\$state** is a large hash containing information regarding the current
configured state of the browser (hence the name). It contains the
following key-\>value pairs:

- - **width** *\[string\]* - The width of the final image, in pixels, as
    set on the preferences tab.
  - **source** *\[string\]* - The current data source name.
  - **ks** *\[string\]* - ?
  - **tracks** *\[array\]* - An array of the labels of all the tracks
    for the
  - **userid** *\[string\]* - The currently-logged-in user's ID,
    corresponding to the main GBrowse user database.
  - **uploadid** *\[string\]* - The currently-logged-in user's uploads
    ID, corresponding to the folder containing their uploaded files.
  - **seg_max** *\[number\]* - The upper bound of the region currently
    being viewed; the right side of the image, unless flipped.
  - **seg_min** *\[number\]* - The lower bound of the region currently
    being viewed; the left side of the image, unless flipped.
  - **flip** *\[boolean\]* - True if the genome view has been flipped
    horizontally from the default left-to-right method.
  - **show_tooltips** *\[boolean\]* - Whether or not to show the helper
    tooltips in the main browser.
  - **valid_region** *\[boolean\]* - Whether the region requested is
    valid, or not. If not, the karotype is shown.
  - **uploads** *\[hash\]* - Contains all uploaded (not imported) files
    as keys, the values are arrays containing: \["uploaded file's name",
    "?"\]
  - **track_collapsed** *\[hash\]* - ? "between"
  - **region_size** *\[number\]* - The size (in base pairs) of the
    region being viewed.
  - **max segment** *\[number\]* - ? 5000000
  - **head** *\[boolean\]* - ? 1
  - **grid** *\[boolean\]* - Whether or not to display the grid behind
    the rendered images
  - **features** *\[hash\]* - All the features available; the feature
    name is the key and the value is another hash containing 3 flags:
    - **visible** *\[boolean\]* - Whether or not the feature is visible
      in the browser display.
    - **options** *\[boolean\]* - ? 0
    - **limit** *\[boolean\]* - ? 0
  - **version** *\[number\]* - ? 100
  - **stop** *\[number\]* - ? 203999
  - **ref** *\[string\]* - The named region being displayed (?)
  - **name** *\[string\]* - The displayed name of the region (as seen in
    the "Landmark or Region" input field), "chrI:98000..203999" for
    example.
  - **v** *\[number\]* - ? 2
  - **subtracks** *\[hash\]* - ? {}
  - **ins** *\[boolean\]* - ? 1
  - **stp** *\[boolean\]* - ? 1
  - **sk** *\[string\]* - ? "sorted"
  - **section_visible** *\[hash\]* - A hash containing each section as a
    key and a boolean flag indicating whether a section is visible
    (true) or not (false).
  - **cache** *\[boolean\]* - Whether or not to cache the rendered
    images.
  - **start** *\[number\]* - 98000'

# Querying the State Variable

To query the value of your state variables, copy and paste the [Named
Subroutines](/wiki/GBrowse_2.0_HOWTO#Named_Subroutine_References)
below to a file called init_code.conf.

``` de1
init_code=
    my $t = -1;
    my $toString;
    sub queryVariables {
        my @arg  = @_;
        $t++;
        for(my $i=0; $i<@arg; $i++) {
            if( ref($arg[$i]) eq "HASH" ) {
                my %hash = %{$arg[$i]};
                foreach my $key ( keys %hash ) {
                    if( ref(\$hash{$key}) eq "SCALAR" ) {
                        $toString .= "\t"x$t."HASH key: $key\tvalue: $hash{$key}\n";
                    } else {
                        $toString .= "\t"x$t."HASH key: $key\tvalue: ".ref($hash{$key})."\n";
                        queryVariables( $hash{$key} );
                        $t--;
                    }
                }
            } elsif( ref($arg[$i]) eq "ARRAY" ) {
                my @array = @{$arg[$i]};
                for(my $j=0; $j<@array; $j++){
                    if( ref(\$array[$j]) eq "SCALAR" ) {
                        $toString .= "\t"x$t."ARRAY element[$j]: $array[$j]\n";
                    } else {
                        $toString .= "\t"x$t."ARRAY element[$j]: ".ref($array[$j])."\n";
                        queryVariables( @array );
                        $t--;
                    }
                }
            }
        }
        return $toString;
    }
    sub queryStateVariables {
        my $stateVariables = queryVariables( @_ );
        $stateVariables = "<pre>\n".$stateVariables."</pre>n";
        return $stateVariables;
    }
```


In your GBrowse.conf file, use the include directive to import the named
subroutines, by including the init_code.conf file in the \[GENERAL\]
section of the configuration file. Add a reference to the named
subroutine queryStateVariables, assigning the return value to one of the
html variables.

Displaying the values of the \$state variable

    #include "path/to/init_code.conf"

    # Various places where you can insert your own HTML -- see configuration docs
    html1 =
    html2 =
    html3 = \&queryStateVariables
    html4 =
    html5 =
    html6 =

After refreshing GBrowse, you should see the values of the state hash
and the values of any other hashes or arrays that have been referenced.

Querying the state variable should be helpful in creating other
subroutines to do more specific things. After you are finished querying
the contents of the state variable, you can remove the reference to the
subroutine so that the main GBrowse page appears normally.

# Globals

**\$globals** is essentially an object containing the
<a href="/wiki/GBrowse_Configuration_HOWTO" class="mw-redirect"
title="GBrowse Configuration HOWTO">GBrowse.conf</a> file.

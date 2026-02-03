---
title: "GBrowse Program Structure"
---
# GBrowse Program Structure

This page gives a basic overview of how [GBrowse](GBrowse.1 "GBrowse")
has been organized and programmed, and is intended for developers to get
a feel for the structure of the program so they can become more
comfortable adding features to it or modifying it for their own needs.
Help is always available via the
<a href="GMOD_Mailing_Lists#GMOD_Components" class="external text"
rel="nofollow">mailing list</a>, or on other sections of the GMOD wiki.

  Structure</span>](#Program_Structure)
  - [The AJAX
    Pipeline](#The_AJAX_Pipeline)
- [Normal
  Operations](#Normal_Operations)
- [Modules](#Modules)
- [State
  Information](#State_Information)
  - [Globals](#Globals)
  - [Session](#Session)
  - [State](#State)

## Program Structure

GBrowse is split into two parts, an HTML/CSS/Javascript frontend and a
Perl backend.

The backend is built as a series of modules in the
<a href="http://search.cpan.org/dist/GBrowse/" class="external text"
rel="nofollow">Bio::Graphics::Browser2 package</a>, it acts as a
convenient, graphical, front-end to using the
<a href="http://search.cpan.org/dist/Bio-Graphics/"
class="external text" rel="nofollow">Bio::Graphics</a> library.
Bio::Graphics can load libraries of features on a genome and render
images to display sections of the genome showing those features, but it
can only be called via a Perl script or larger program. GBrowse
automates the calling process and gives it a GUI so that more data (or a
different section of the genome) can be requested by clicking a button.
In addition to the backend, there is an optional database to hold named
users & sessions, uploaded files, and sharing information.

The frontend is a set of Javascript and CSS files which determine the
look and feel, as well as the control events, of the GUI. The main HTML
is rendered through the Perl
<a href="http://search.cpan.org/dist/CGI.pm/" class="external text"
rel="nofollow">CGI</a> module and simply returned as the HTTP request;
there's no formal HTML file that determines the markup. Each section of
HTML has a subroutine in Render\HTML.pm that will generate it.

### The AJAX Pipeline

Some Javascript events require data from the database, or need to
perform actions on the database. For the most part, they will send AJAX
requests to the current script with an “action” parameter. This gets
sent through to Action.pm, which calls the corresponding function (so an
action of “update_coordinates” will call the ACTION_update_coordinates()
subroutine), and performs whatever it needs to do. Most functions will
be called and the corresponding sections of the HTML will be re-rendered
and updated with update_sections() rather than send back individual
values to be processed and inserted by Javascript.

## Normal Operations

Most operations go through the gbrowse script, included in the cgi-bin.
For each request, the script creates a new Browser2.pm object, opens the
globals, then creates a new HTML.pm object and runs the run() function
(inherited from Render). Render-\>run() is what controls the main page –
it will send actions to Action.pm, rendering requests to HTML.pm, etc.

Render acts as a central hub for the program, it creates the objects
which act as interfaces to the various parts of the program.
UserTracks.pm controls the custom data the user can upload, Session.pm
works with the current user's session, I18n.pm controls the
internationalization, etc. All of these objects are initialized by
Render.pm and can be accessed through it.

Some objects also need to be constructed outside of Render.pm; things
like UserDB.pm, which deals with registered users, are called through
another script, gbrowse_login, which doesn't go through the work of
creating a whole new Render object.

## Modules

The modules which make up GBrowse are contained in the **lib** directory
in the SVN. They are as follows:

- **Action** (Bio::Graphics::Browser2::Action) - The Perl side of all
  AJAX requests. Each subroutine corresponds to the "action" parameter
  called in the AJAX request.
- **AuthorizedFeatureFile**
  (Bio::Graphics::Browser2::AuthorizedFeatureFile) - Adds HTTP
  authorization features to FeatureFiles.
- **CachedTrack** (Bio::Graphics::Browser2::CachedTrack) - Defines a
  Bio::Graphics::Browser2::Track option that manages the caching of
  track images and imagemaps.
- **DataBase** (Bio::Graphics::Browser2::DataBase) - Maintains a cache
  of database handles to improve performance on in-memory databases and
  other databases that have a relatively slow startup time.
- **DataLoader** (Bio::Graphics::Browser2::DataLoader) - An interface
  for managing files or URLs containing data and converting them into
  new databases for easier access. A full list of adaptors is available
  [here](GBrowse_Adaptors "GBrowse Adaptors").
  - **bam** (Bio::Graphics::Browser2::DataLoader::bam) - A loader for
    the BAM half of the [SAM/BAM file format](Glossary#BAM "Glossary").
  - **bed** (Bio::Graphics::Browser2::DataLoader::bed) - A loader for
    the [BED file
    format](GBrowse/Uploading_Wiggle_Tracks#Wiggle_.28BED.29 "GBrowse/Uploading Wiggle Tracks").
  - **bigwig** (Bio::Graphics::Browser2::DataLoader::bigwig) - A loader
    for the <a href="http://search.cpan.org/perldoc?Bio::DB::BigWig"
    class="external text" rel="nofollow">BigWig file format</a>
  - **featurefile** (Bio::Graphics::Browser2::DataLoader::featurefile) -
    A loader for <a
    href="http://search.cpan.org/~birney/bioperl-1.2.3/Bio/Graphics/FeatureFile.pm"
    class="external text" rel="nofollow">Bio::Graphics Feature Files</a>.
  - **generic** (Bio::Graphics::Browser2::DataLoader::generic) - A
    generic loader module.
  - **gff** (Bio::Graphics::Browser2::DataLoader::gff) - A loader for
    the [GFF#GFF3](GFF#GFF3 "GFF") file format.
  - **gff3** (Bio::Graphics::Browser2::DataLoader::gff3) - A loader for
    the [GFF3](GFF3 "GFF3") file format.
  - **sam** (Bio::Graphics::Browser2::DataLoader::sam) - A loader for
    the SAM half of the [SAM/BAM file format](Glossary#BAM "Glossary").
  - **wiggle** (Bio::Graphics::Browser2::DataLoader::wiggle) - A loader
    for the [Wiggle file
    format](GBrowse/Uploading_Wiggle_Tracks#Wiggle_tracks "GBrowse/Uploading Wiggle Tracks").
- **DataSource** (Bio::Graphics::Browser2::DataSource) - An interface
  for managing a data source, since GBrowse can work with a few (see the
  "Data Sources" drop-down menu on the main page)
- **ExternalData** (Bio::Graphics::Browser2::ExternalData) - A
  collection of utilities for working with non-FeatureFile data sets.
- **GFFhelper** (Bio::Graphics::Browser2::GFFhelper) - A helper module
  so plugins can handle GFF files more easily.
- **I18n** (Bio::Graphics::Browser2::Il8n) - Controls GBrowse's
  internationalization settings
- **Markup** (Bio::Graphics::Browser2::Markup) - Marks up a string with
  HTML cascading stylesheet styles in such a way that intersecting
  regions contain the union of the two intersecting styles.
- **OptionPick** (Bio::Graphics::Browser2::OptionPick) - An object to
  choose colour options (for tracks?)
- **PadAlignment** (Bio::Graphics::Browser2::PadAlignment) - A module to
  print out aligned raw sequence files in a padded, easily-readable
  format.
- **Plugin** (Bio::Graphics::Browser2::Plugin) - A base class for
  plugins.
- **PluginSet** (Bio::Graphics::Browser2::PluginSet) - Describes the API
  for using plugins.
- **Realign** (Bio::Graphics::Browser2::Realign) - A module to perform
  Smith-Waterman alignments on sequence data.
- **Region** (Bio::Graphics::Browser2::Region) - A module to enable easy
  fetching/manipulation of regions.
- **RegionSearch** (Bio::Graphics::Browser2::RegionSearch) - A module to
  search through multiple databases for feature matches.
- **RemoteSet** (Bio::Graphics::Browser2::RemoteSet) - An API for
  handling a set of remote annotation sources
- **Render** (Bio::Graphics::Browser2::Render) - An interface to any
  non-HTML rendering code.
  - **HTML** (Bio::Graphics::Browser2::Render::HTML) - Renders the HTML
    content and markup. Very important since GBrowse is HTML-based.
- **RenderPanels** (Bio::Graphics::Browser2::RenderPanels) - Interface
  for drawing and saving the panels which graphically show each track.
- **Session** (Bio::Graphics::Browser2::Session) - Controls the session
  and persistent variables.
- **Shellwords** (Bio::Graphics::Browser2::Shellwords) - A shell for
  Text::ParseWords::shellwords.
- **SubtrackTable** (Bio::Graphics::Browser2::SubtrackTable) - A module
  for creating an HTML table out of a track's subtracks.
- **TrackDumper** (Bio::Graphics::Browser2::TrackDumper) - A plugin to
  dump the data of a section of a track.
- **UserDB** (Bio::Graphics::Browser2::UserDB) - Manages all operations
  involving the user accounts database (both GBrowse users and users who
  use their OpenIDs to log in) and the uploads database.
- **UserTracks** (Bio::Graphics::Browser2::UserTracks) - Manages a
  user's uploaded tracks & files, permissions, etc.
  - **Database** (Bio::Graphics::Browser2::UserTracks::Database) - A
    database-backed system for managing uploaded tracks & files.
  - **Filesystem** (Bio::Graphics::Browser2::UserTracks::Filesystem) - A
    file system-backed system for managing uploaded tracks & files.
- **Util** (Bio::Graphics::Browser2::Util) - A library of generally
  useful utilities.

## State Information

There are a few variables available internally which describe three
levels of the current "state" of GBrowse. The are as follows:

### Globals

Globals is a Browser2.pm object, and it loads information pertaining to
the state of Gbrowse's setup on the computer it's running in from the
Gbrowse.conf file and stores it in easily-accessible methods. It doesn't
change between users or page reloads. A full description of what each
setting does can be found at \<configuration file page\>.

### Session

Session is a Browser2::Session object, and it keeps user-specific
information that is to be kept for every time the user logs in, such as
the username, whether or not it's private, the plugin settings, and a
copy of the state (as described below.)

### State

The state or page settings object is the current “state” of the browser
for the specific user – which tracks are on/off, added/removed, etc. It
contains mainly user interface settings, things that would not heavily
interfere with a user's experience if they couldn't be retrieved for
whatever reason.

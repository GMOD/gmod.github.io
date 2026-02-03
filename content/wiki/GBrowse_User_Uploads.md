---
title: "GBrowse User Uploads"
---
# GBrowse User Uploads

[GBrowse](/wiki/GBrowse.1) allows users to supplement the database
with their own data as Custom Tracks in a variety of file formats
including BAM, SAM, GFF, GFF3, BedLoader, and more. Users can upload
data files of their own, link remote data files from a URL, or create an
entirely new track right in the browser window. Additionally, GBrowse
version 2.20 and above can be set up to allow users to share files
between each other, or make them part of a community repository of
available tracks.

The custom tracks system can run with no additional tools in a basic
mode, or use a more advanced mode that requires a database but allows
more flexible sharing. It has been tested using
<a href="http://www.sqlite.org/" class="external text"
rel="nofollow">SQLite</a> and
<a href="http://www.mysql.com/" class="external text"
rel="nofollow">MySQL</a> as databases, though it should be possible to
use others.

  Display](#Display)
- [Basic Custom
  Tracks](#Basic_Custom_Tracks)
  - [Adding
    Custom Tracks](#Adding_Custom_Tracks)
    - [Uploaded Tracks](#Uploaded_Tracks)
    - [Remote
      Tracks/URLs](#Remote_Tracks.2FURLs)
    - [Created Tracks](#Created_Tracks)
- [Advanced
  Custom Tracks](#Advanced_Custom_Tracks)
  - [Permissions](#Permissions)
    - [Private](#Private)
    - [Casual](#Casual)
    - [Group](#Group)
    - [Public/Community](#Public.2FCommunity)
- [Setup](#Setup)
  - [To use
    SQLite](#To_use_SQLite)
  - [To use
    MySQL](#To_use_MySQL)
  - [User
    Accounts Flag](#User_Accounts_Flag)
- [Database
  Schema](#Database_Schema)
  - [Uploads](#Uploads)
  - [Sharing](#Sharing)
  - [DBInfo](#DBInfo)

## Display

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/58/Custom_track.png" width="1471" height="96"
alt="Custom track.png" /> This is the custom track's display under
the advanced uploads system - the basic uploads system omits the
"sharing" section on the right. The background colour is different for
each type of file; standard uploads are blue, remote files are green,
shared files are red, and public files are grey (more on the permissions
and types of files below). The title of the file is on the top left -
clicking on it will allow you to edit the title. A short description of
the file is underneath the title, and is also similarly editable. To the
right of the description is a listing of all the tracks contained within
the original uploaded file, along with the options you have to
manipulate it, such as deleting it, removing it from your session, or
adding it if it's not already in it.

Below the description is a listing of the source files pertaining to
this track, including the original uploaded file and the configuration
file which controls how it it is displayed by the main GBrowse window.
It also shows some basic information, including the size of the file and
the time it was last modified.

To the right of the source file listing is the sharing section (only
available in GBrowse versions 2.20 and up which have been configured to
allow more flexible sharing). It shows the current permissions, current
users of the file, and gives you options to control the sharing
further - adding/removing users, and the sharing link.

## Basic Custom Tracks

Upon first installation, GBrowse is configured to allow a simple custom
track system, allowing users to upload and view their own custom tracks
which are stored on the server running GBrowse. It does not require an
additional tools or programs.

### Adding Custom Tracks

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f6/Custom_tracks.png" width="453"
height="252" alt="Custom tracks.png" />

To upload a file, navigate to the "Custom Tracks" tab (or "Upload and
Share Tracks" tab, in versions prior to GBrowse 2.20) and click on the
appropriate link on the bottom for the source of the data you wish to
add as a custom track.

All tracks can be edited manually in the browser by clicking the
**\[edit\]** link corresponding to the source file you wish to modify. A
text box will drop down where you can make your changes, then click
"Submit" to save your changes (or cancel to discard them).

#### Uploaded Tracks

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/28/Upload.png" width="378" height="70"
alt="Upload.png" />

Click on "Choose File" to browse for the file you wish to upload. Click
"Upload" to start the upload, or "Remove" to remove the upload box or
cancel. The file will upload to the server and the listing will refresh
once it's finished. If you have a track containing the same name as an
existing track in your session, the file name will be made unique to not
conflict. However, if you wish to overwrite the file you already have,
just check off the box beside "If this file exists, overwrite it" and
the old file will be overwritten.

#### Remote Tracks/URLs

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ee/Import.png" width="373" height="53"
alt="Import.png" />

Paste your URL into the text box provided and click "Import" to start
the upload. The file will be mirrored (copied) to a local version to
avoid having to get it from the remote server every time. If you know
the file has changed at the remote location, click the **\[reload\]**
link beside the source file and it will be re-mirrored and updated. If
you upload the same URL twice, if you have an existing custom track from
that URL it will be overwritten (since this would happen on a reload
anyways).

#### Created Tracks

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/9e/Create.png" width="509" height="200"
alt="Create.png" />

To create a new custom track, just start typing information in the text
box that drops down, using one of the supported file formats. Once you
click "Upload," GBrowse will attempt to guess which type of file you've
created and load it.

To delete a custom track, just click the trash-can icon beside it and it
will be deleted and removed from your session.

## Advanced Custom Tracks

By specifying a database, GBrowse administrators can give users the
option to share files between users, as well as have add their tracks to
a community tracks repository which is available to all users. More
information for admins about adding this capability can be found in the
Setup section below.

### Permissions

Sharing works on the basis that every file now has a *permissions*
setting, a kind of sharing policy that specifies exactly who can access
this file. There are four main policies which you can choose to set your
custom tracks to, so that other users may be allowed to add them to
their sessions.

#### Private

Private sharing is the most basic setting, it only allows the owner to
use that track.

#### Casual

Casual sharing is a simple way to share your tracks with other users, by
providing you with a sharing link that you can send to other users. If a
user visits that link while they are logged in, it is added to their
session. It is not, however, part of the community tracks repository,
and users cannot find it without the link. Custom track owners can see
who is currently using their track in the sharing section of their
track's listing under the Custom Tracks tab, and remove any users who
may have obtained the link accidentally.

#### Group

Group sharing is a secure way for an owner to share a track with a
specific user. Under the track's sharing section in the Custom Tracks
tab, simply enter the username or user ID of any user you wish to share
the file to and hit Enter. That user will have the track automatically
added to their session so they can use it. Additionally, the track's
owner can see who is part of the group of users the track is shared to,
and can remove a user at any time. Users can also remove the track from
their session by pressing the **\[X\]** link.

#### Public/Community

Public or community tracks are kept in a separate section of the site,
under the Community Tracks tab. There you can search for a file by name,
title, description, or by entering the username or ID of a specific user
you wish to search for. Once you have found a track you wish to add to
your session, you can click the **\[Add\]** link to add it. Community
tracks may also be shared via a sharing link, which can be obtained by
clicking the sharing icon on the track in the main browser tab.

## Setup

This section outlines the process required for administrators to
configure GBrowse to allow custom tracks. For basic user uploads are all
set up upon the first installation, everything you need to use them is
on the "Custom Tracks" tab. For advanced sharing, you will need to
install the
<a href="http://search.cpan.org/~gbarr/libnet-1.22/Net/SMTP.pm"
class="external text" rel="nofollow">Net::SMTP</a> and
<a href="http://search.cpan.org/~nanis/Crypt-SSLeay-0.58/lib/Net/SSL.pm"
class="external text" rel="nofollow">Net::SSL</a> modules from
<a href="http://search.cpan.org/" class="external text"
rel="nofollow">CPAN</a> onto the server running GBrowse. OpenID login
will also need the <a
href="http://search.cpan.org/~mart/Net-OpenID-Consumer-1.03/lib/Net/OpenID/Consumer.pm"
class="external text" rel="nofollow">Net::OpenID::Consumer</a> module -
OpenID is optional in GBrowse 2.20 or later.

The custom tracks system is linked to the user accounts system, it uses
the same configuration settings and database - turning on one will turn
on the other.

### To use SQLite

SQLite doesn't require much setup, you just need to decide on a location
to store the database file.

To configure your GBrowse.conf file to use a SQLite database, uncomment
(remove the preceding \#) the line that starts with "user_account_db"
(without quotes), or add this section if it is not there. Specify the
location of the .sqlite file to be used. Remember to grant permissions
for GBrowse to read and write to this file. As well, due to the design
of SQLite, you will have to grant permissions for GBrowse to write to
the folder *holding* the .sqlite file, as SQLite creates a temporary
file in that folder before any writes are made, and needs the
permissions to do so.

    # Path to the database -- you will need to create this database and grant all
    # privileges on it to the indicated user.
    # user_account_db        = DBI:SQLite:/path/to/your/database.sqlite

### To use MySQL

For MySQL, ensure that the MySQL server is up and running, and that you
have the administrator username and password handy. You'll also need the
name of the user you want to connect with; the default value is
"gbrowse" for both username and password, but you can specify your own
if you wish.

To configure your GBrowse.conf file to use a MySQL database, uncomment
(remove the preceding \#), or add if it's not there, this line (for
"user_account_db") and specify the connection details as indicated.
Change the user and/or password fields as needed.

    # user_account_db        = DBI:mysql:gbrowse_login;user=gbrowse;password=gbrowse

### User Accounts Flag

Once the configuration option has been set, the "user accounts" switch
to enable the user database must be turned on (set from 0 to 1).

    ####### User Account Registration Database ######
    # If "user accounts" is true, then we will try to use
    # a user registration database
    user accounts          = 0

## Database Schema

In versions of GBrowse equal to or above 2.20 that are set up for
advanced sharing, the relationships between the files are stored in a
database. Its schema is as follows:

### Uploads

This table holds all the metadata for every custom or community track.

| Field | Type | Description |
|----|----|----|
| trackid | varchar(32) not null PRIMARY key" | A unique 32-character hexadecimal ID that refers to this specific track. |
| userid | integer not null" | The user ID of the user that uploaded this file. |
| path | text | The file path or URL to the file. |
| title | text | The human-readable title of the file. |
| description | text | A description of the file. |
| imported | boolean not null | Whether the file was imported from an external source, or uploaded. |
| creation_date | datetime not null | The time the track was created. |
| modification_date | datetime | The last time the track was modified. |
| sharing_policy | ENUM('private', 'public', 'group', 'casual') not null | The sharing policy of the track. |
| public_count | int | The number of public users. |
| data_source | text | The GBrowse data source that the track belongs to. |

### Sharing

This table holds all sharing relationships between files and users other
then their owners. Each time a user shares a file with a user, or adds a
public file to their session, a new record is kept in this table to
store that relationship. Not the public flag - public and shared files
are kept separate, to avoid contamination between the two share types.

| Field   | Type                 | Description |
|---------|----------------------|--------------------------------------------|
| trackid | varchar(32) not null | The unique ID of the track to be shared. |
| userid | integer not null | The unique ID of the user to be shared to. |
| public | boolean | Whether the relationship is |

### DBInfo

In addition to the uploads tables, this table stores the version number
of the current schema. It is used for upgrading and keeping track of the
schema version.

| Field | Type | Description |
|----|----|----|
| schema_version | int(10) not null UNIQUE | The version number of the current database schema. |

---
title: "Using AWS S3 For JBrowse"
---




<span id="top"></span>




# <span dir="auto">Using AWS S3 For JBrowse</span>










## Contents



- [<span class="tocnumber">1</span> <span class="toctext">Why use S3 for
  JBbrowse?</span>](#Why_use_S3_for_JBbrowse.3F)
- [<span class="tocnumber">2</span> <span class="toctext">Setting it up
  with management
  scripts</span>](#Setting_it_up_with_management_scripts)
  - [<span class="tocnumber">2.1</span>
    <span class="toctext">upload_to_S3.pl</span>](#upload_to_S3.pl)
  - [<span class="tocnumber">2.2</span>
    <span class="toctext">upload_jbrowse_static.pl</span>](#upload_jbrowse_static.pl)
- [<span class="tocnumber">3</span> <span class="toctext">S3 for all of
  JBrowse</span>](#S3_for_all_of_JBrowse)
  - [<span class="tocnumber">3.1</span> <span class="toctext">Build
    pattern</span>](#Build_pattern)
- [<span class="tocnumber">4</span> <span class="toctext">Storing just
  track data on S3</span>](#Storing_just_track_data_on_S3)



## <span id="Why_use_S3_for_JBbrowse.3F" class="mw-headline">Why use S3 for JBbrowse?</span>

<a href="https://aws.amazon.com/s3/" class="external text"
rel="nofollow">Amazon Web Services’ S3</a> object storage service can be
configured to store [JBrowse](JBrowse.1 "JBrowse") data or to serve a
full [JBrowse](JBrowse.1 "JBrowse") instance. It’s possible, depending
on usage patterns, that operating a JBrowse instance from an S3 store
could provide a significant savings over operating an EC2 instance for
the sole purpose of running JBrowse (as opposed to putting JBrowse on a
machine that is already doing other things). Storing data in S3
generally costs about a quarter of what disk space costs on an
EBS-backed EC2 instance, and you don’t have to “over allocate” to make
sure you have enough disk space like you’d need to do on an EC2
instance. While data transfer rates for EC2 and S3 are the same, S3 has
an added fee for http GETs. While this is a pretty small amount (on the
order of half a penny per 10,000 GETs), they can add up, since a typical
JBrowse view has many GETs, to obtain the JavaScript and CSS files to
operate JBrowse and many GETs for data, since a typical single track
view may require several json files. On the other hand, tracks that are
backed by a binary indexed file (BAM, BigWig, tabix) will require only
one GET per track per view, since each view is a single range request to
get the data, regardless of the width of the view. These sorts of
details will obviously vary by the JBrowse instance and would require
careful planning and tracking of billing to make sure costs don’t get
out of hand.

For the commands here to work, you must install the
<a href="https://aws.amazon.com/cli/" class="external text"
rel="nofollow">AWS command line interface</a> and have it properly
configured with keys that will allow the movement of data into S3.

## <span id="Setting_it_up_with_management_scripts" class="mw-headline">Setting it up with management scripts</span>

We wrote two management scripts to make setting up JBrowse on S3 easier
for a related project. The scripts are in <a
href="https://github.com/alliance-genome/jbrowse-config/tree/master/scripts"
class="external text" rel="nofollow">GitHub for the Alliance of Genome
Resources project</a>. There are two scripts:

### <span id="upload_to_S3.pl" class="mw-headline">upload_to_S3.pl</span>

This script copies the data associated with tracks to S3. Specifically,
it copies the tracks/, names/, and seq/ directories, as well as
trackList.json and tracks.conf. It assumes that the track and names
files have been compressed, though there is a command line option to
tell it that the files aren't compressed (but why wouldn't they be?).
The options are:

- --aws \<path\> The path to the aws command line tool
- --bucket \<name\> The name of the S3 bucket
- --local \<path\> The path on the local machine to the data directory
- --remote \<path\> the path in S3 where the files will go (note that
  there should not be a trailing slash)
- --notcompressed to indicate that the track and names files are not
  compressed (but why aren't they?)
- --cors to indicate that CORS should be set to allow public access of
  the data
- --create to create the S3 bucket before uploading data to it.

A few notes:

1.  Setting up will be easier if you upload the track data with CORS
    turned on, and then edit your local JBrowse instance to use the S3
    bucket for its data. That way you can verify that the data are all
    in the right place and everything is working before continuing on.
    If you will configure JBrowse to serve it's JavaScript and html
    files out of the same bucket, you can turn CORS off after everything
    is configured and working. See
    [\#Storing_just_track_data_on_S3](#Storing_just_track_data_on_S3)
    below for setting CORS with the `aws s3api` command.
2.  This script will copy all data with the ACL (read permission) set to
    "public-read"; this is required for running a website from S3.
3.  The script will also create a "dummy" index.html file for S3 to be
    configured to serve files via a web service. If you configure
    JBrowse to be served from the same bucket, this dummy file will be
    overwritten by JBrowse's index.html file.

### <span id="upload_jbrowse_static.pl" class="mw-headline">upload_jbrowse_static.pl</span>

Options:

- --aws \<path\> Path to the aws command line tool
- --bucket \<name\> Name of the S3 bucket
- --local \<path\> Path to the local JBrowse instance that is being
  copied to S3
- --cors
- --create
- --delete-existing
- --no-cache

Notes:

1.  No remote option
2.  CORS
3.  no-cache

## <span id="S3_for_all_of_JBrowse" class="mw-headline">S3 for all of JBrowse</span>

Since JBowse is entirely a client side application and is only serving
static content (CSS, JavaScript, json and binary files), S3 can be
configured to be the JBrowse server. Similar caveats apply for this use
of S3 as for just storing your track data, but the GET fees are an even
bigger consideration (because there are more GETs per view), where those
fees will depend quite a bit on your community's usage patterns.

### <span id="Build_pattern" class="mw-headline">Build pattern</span>

To use S3 as the JBrowse server, you'll have to build on another machine
and then transfer the files to S3 after everything is configured
correctly. Assuming you'll be using compressed json files for you track
data, you'll have to transfer your jbrowse source files separately from
your track data because if you specify that the Content-Encoding is gzip
for the normal HTML, JavaScript and CSS files, browsers downloading the
data will misinterpret the downloaded files (as a result of incorrect
headers) and result in JBrowse not functioning.

The first step in creating a S3-powered JBrowse instance is to get
JBrowse working on a “normal” server with at least some of the data and
configuration in place to make sure it works. Once that is the case,
create an S3 bucket and issue a command like this:

     aws s3 cp --exclude tracks --recursive --acl public-read jbrowse/ s3://bucketname

where jbrowse is the name of the directory that contains the top level
JBrowse directory (the one with the index.html file in it) and
bucketname is the name of the bucket created to hold JBrowse. The
--exclude tracks portion is there to prevent the gzip-compressed jsonz
files from being uploaded without their Content-Encoding attribute being
correctly set. After executing this command, the index.html file will be
in what will become the document root when webserving is turned on.

Next, any compressed json (jsonz) files need to be copied with their
Content-Encoding attribute set. It is also important to make sure the
directories go in the right place relative to the rest of JBrowse. For
instance, if your tracks directory in in jbrowse/data/tracks, the
command would look like this (if issued from the same place as the above
copy):

     aws s3 cp --recursive --acl public-read --content-encoding gzip jbrowse/data/tracks s3://bucketname/data/tracks #DOUBLE CHECK THIS!

Finally, set the website index file as above:

     aws s3 website s3://bucketname --index-document index.html

This is telling S3 that the index.html file copied in the s3 cp command
is to be treated as the index file when serving content as a web page.
JBrowse will be accessible from a URL like

     http://bucketname.s3-website-us-east-1.amazonaws.com/

That’s all that’s required to run JBrowse from S3--the two additional
steps that are used when just storing JBrowse data on S3 (modifying the
urlTemplate attribute in the track configurations and setting CORS) are
not required since JBrowse files are all coming from the same server.

## <span id="Storing_just_track_data_on_S3" class="mw-headline">Storing just track data on S3</span>

When data are copied to S3, it needs to be made publicly readable as
well as setting the Content-Encoding metadata to “gzip” for compressed
json files (because if you’re storing json files, it makes sense for
them to be compressed to cut down on storage fees). The S3 bucket must
also be configured as a website and be configured with CORS. Here is a
brief outline of what you need to do.

Using the aws command line tool, recursively copy the track data for a
track, using a command like this:

     aws s3 cp --recursive --acl public-read --content-encoding gzip local-directory s3://bucketname

Where local-directory is a directory containing files and
subdirectories. At the top level there should be a file called
index.html, though the contents of that file do not matter. The last
argument of the command, s3://bucketname is the name of an S3 bucket
that already exists.

While I haven’t tested with tabix-indexed files like VCF or indexed
GFF3, I am pretty sure you don’t want to include the --content-encoding
flag when transferring them. I have tested with BAM and BigWig files,
and they definitely should not have the --content-encoding flag as it
will cause problems with the range requests. As a result, the command
for transferring these sorts of indexed files should look something like
this:

     aws s3 cp --recursive --acl public-read  binary_directory s3://bucketname/WormBase/worm/tracks/binary_directory 

Where binary_directory is the local directory containing binary indexed
files, which can have subdirectories.

Next, the S3 bucket has to be configured to operate as a website. Use
this aws command to accomplish this:

     aws s3 website s3://bucketname --index-document index.html

Here, the contents of the index.html file don’t matter but the file is
required, so you could put a brief comment about the data being served..

Finally, the bucket needs to configured to allow Cross Origin Resource
Sharing (CORS). Below is a simple command to do this. Note that this
configuration will allow any website to access the track data (which
could result in higher transfer and GET fees). If you want to restrict
it to just the website you control, replace the \* in the AllowedOrigins
entry with the url of your server. Also note that the first argument of
the aws command is slightly different that previous commands, using
“s3api” rather than “s3”:

     aws s3api put-bucket-cors --bucket bucketname --cors-configuration '{"CORSRules": [{"AllowedOrigins": ["*"],"AllowedHeaders": ["*" ],"AllowedMethods": ["GET"],"MaxAgeSeconds": 3000}]}'

After S3 is configured, you need to modify your JBrowse track
configuration to find the track data on S3. Before modifying
trackList.json, you need to understand how to write S3 website URLs.
They look like this:

     http://bucketname.s3-website-us-east-1.amazonaws.com/...

Where the first part of the domain name is the bucket name, and the
“us-east-1” has to be replaced with the AWS region your bucket is in.

A typical JBrowse trackList.json has a urlTemplate parameter that looks
like this:

     "urlTemplate" : "tracks/Curated_Genes/{refseq}/trackData.jsonz"

which is a relative URL. We’ll change it to be an absolute url that
points at our new S3 bucket:

     "urlTemplate":"http://bucketname.s3-website-us-east-1.amazonaws.com/WormBase/worm/tracks/Curated_Genes/{refseq}/trackData.jsonz"

After making this change to your trackList.json file, a reload of
JBrowse will have it pulling track data from S3.




[Category](Special%253ACategories "Special%253ACategories"):








## Navigation menu









### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>




### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Using_AWS_S3_For_JBrowse"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 21:12 on 4 May
  2017.</span>
<!-- - <span id="footer-info-viewcount">15,846 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





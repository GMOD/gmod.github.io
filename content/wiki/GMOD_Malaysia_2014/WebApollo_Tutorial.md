---
title: "GMOD Malaysia 2014/WebApollo Tutorial"
---
# GMOD Malaysia 2014/WebApollo Tutorial


This [WebApollo](../WebApollo.1 "WebApollo") tutorial was presented by
[Scott Cain](../User%253AScott "User%253AScott") and [User%253AMichael
Campbell](../User%253AMichael_Campbell "User%253AMichael Campbell") at [GMOD
Malaysia 2014](../GMOD_Malaysia_2014.1 "GMOD Malaysia 2014"), February
2014.

The most recent WebApollo tutorial can be found at the
<a href="../WebApollo_Tutorial" class="mw-redirect"
title="WebApollo Tutorial">WebApollo Tutorial</a> page.

This tutorial uses the AWS AMI ' ***named '*** in the '

.

These are the steps I took to install WebApollo on the prebuilt AWS
image. Some steps need only be performed once, such as installing the
custom valves in Tomcat or installing BLAT, to ensure that the system is
ready. These steps will be denoted with an asterisk (\*).

Note: These notes follow along with the general WebApollo installation
guide (). The guide below details the steps I used to set up the GMOD
Summer School 2013 AMI.

For more information about using WebApollo, please see the user guide,
located here: <a
href="http://genomearchitect.org/webapollo/docs/webapollo_user_guide.pdf"
class="external free"
rel="nofollow">http://genomearchitect.org/webapollo/docs/webapollo_user_guide.pdf</a>

  


  Prerequisites](#Prerequisites)
- [Database
  Setup](#Database_Setup)
- [Update Tomcat
  for WebApollo](#Update_Tomcat_for_WebApollo)
- [Deploy
  WebApollo](#Deploy_WebApollo)
- [Data
  Processing and JBrowse
  setup](#Data_Processing_and_JBrowse_setup)
- [Data
  Loading](#Data_Loading)
- [Final
  WebApollo configuration](#Final_WebApollo_configuration)
- [Restart
  Tomcat](#Restart_Tomcat)
- [View your
  WebApollo instance](#View_your_WebApollo_instance)
- [Note on track
  styling](#Note_on_track_styling)


## Prerequisites

- \* Install Tomcat7\*
- \* Install BLAT/verify location\*
- \* PostgreSQL is installed and configured\*
- \* Download WebApollo (and sample data)\*
     mkdir ~/dataHome/WebApollo2
     cd ~/dataHome/WebApollo2
     wget  https://apollo-web.googlecode.com/files/WebApollo-2013-05-16.tgz
     wget  http://genomearchitect.org/webapollo/data/pyu_data.tgz
     tar -xvzf WebApollo-2013-05-16.tgz
     tar -xvzf pyu_data.tgz

## Database Setup

- Create PostgreSQL user with proper permissions for WebApollo to use
    $ sudo su postgres 
    $ createuser -P web_apollo_users_admin 
    Enter password for new role:  
    Enter it again:  
    Shall the new role be a superuser? (y/n) n 
    Shall the new role be allowed to create databases? (y/n) y 
    Shall the new role be allowed to create more new roles? (y/n) n 

- Create a database for managing the WebApollo users
    $ createdb -U web_apollo_users_admin web_apollo_users
    $ exit

- Populate the database with the WebApollo User schema
     cd /data/dataHome/WebApollo2/WebApollo-2013-05-16/tools/user 
     psql -U web_apollo_users_admin web_apollo_users < \
      user_database_postgresql.sql 

- Create a user with access to WebApollo
     ./add_user.pl -D web_apollo_users -U web_apollo_users_admin -P \
      web_apollo_users_admin -u web_apollo_admin -p web_apollo_admin 

- The database is ready and has an initial user, which we will use as an
  administrator.
- We now need to add in the sequences and grant permissions to the user
  we just created.
     cd /data/dataHome/WebApollo2/WebApollo-2013-05-16/tools/user
     mkdir /data/dataHome/WebApollo2/pyu_data/scratch/
     ./extract_seqids_from_fasta.pl -p Annotations- \
     -i /data/dataHome/WebApollo2/pyu_data/scf1117875582023.fa \
     -o /data/dataHome/WebApollo2/pyu_data/scratch/seqids.txt

- Add those ids to the user database.
     cd /data/dataHome/WebApollo2/WebApollo-2013-05-16/tools/user
     ./add_tracks.pl -D web_apollo_users -U web_apollo_users_admin \
     -P web_apollo_users_admin -t /data/dataHome/WebApollo2/pyu_data/scratch/seqids.txt

- Now that we have created the user and have loaded the annotation track
  ids, we’ll need to give the user
- permissions to access the sequence. We’ll have the all permissions
  (read, write, publish, user manager).
- We’ll use the set_track_permissions.pl script in the same directory.
  We’ll need to provide the script a list
- of genomic sequence ids, like in the previous step.
     cd /data/dataHome/WebApollo2/WebApollo-2013-05-16/tools/user
     ./set_track_permissions.pl -D web_apollo_users \
      –U web_apollo_users_admin -P web_apollo_users_admin -a \
      -u web_apollo_admin -t /data/dataHome/WebApollo2/pyu_data/scratch/seqids.txt

## Update Tomcat for WebApollo

- \* Install the WebApollo custom valves in the Tomcat7 lib directory\*
     sudo cp \
      ~/dataHome/WebApollo2/WebApollo-2013-05-16/tomcat/custom-valves.jar \
      /usr/share/tomcat7/lib/

- \* Update the Tomcat7 server.xml to include the WebApollo error
  reporting VALVE\*
- Add errorReportValveClass="org.bbop.apollo.web.ErrorReportValve" as an
  attribute to the existing \<Host\> element in:
  /var/lib/tomcat7/conf/server.xml
- The final file should look like the example below:
    $ less /var/lib/tomcat7/conf/server.xml
    <Host name="localhost" appBase="webapps" 
          unpackWARs="true" autoDeploy="true" 
          errorReportValveClass="org.bbop.apollo.web.ErrorReportValve">
    </Host>

  

- At this point the server should be ready for WebApollo.

## Deploy WebApollo

- Create the location for the new instance
     sudo mkdir /var/lib/tomcat7/webapps/WebApollo2
     cd /var/lib/tomcat7/webapps/WebApollo2

  

- Deploy servlet
     sudo jar xvf ~/dataHome/WebApollo2/WebApollo-2013-05-16/war/WebApollo.war 

- Change ownership of the base WebApollo directory
     sudo mkdir /var/lib/tomcat7/webapps/WebApollo2/tmp
     sudo chown tomcat7:tomcat7 /var/lib/tomcat7/webapps/WebApollo2/tmp

- Tomcat will create a tmp directory to hold exported GFF3, and needs
  permission to create and modify the contents of that directory.
- Once the servlet is deployed we need to configure JBrowse and load the
  data.
- Once JBrowse and BLAT are set up and configured, we will use this
  information to finish configuring WebApollo.

## Data Processing and JBrowse setup

- Create ancillary directories for the new instance
     cd /data/dataHome/WebApollo2
     mkdir Pyu Pyu/Blat Pyu/Blat/tmp Pyu/Annotations Pyu/data 

- Change ownership to user tomcat7
     sudo chown -R tomcat7:tomcat7 /data/dataHome/WebApollo2/Pyu/Annotations
     sudo chown -R tomcat7:tomcat7 /data/dataHome/WebApollo2/Pyu/Blat/tmp

- Set up the JBrowse instance
     cd /var/lib/tomcat7/webapps/WebApollo2/jbrowse 

- Create a symbolic link to the large disk where the browser data will
  be stored
     sudo ln -s /data/dataHome/WebApollo2/Pyu/data/ .

- To make loading easier, make another link to the original data
  directory
     sudo ln -s /data/dataHome/WebApollo2/pyu_data .

  

- WebApollo uses two special tracks, one to display annotations, and one
  for sequence alterations. We need to copy those from the original
  downloaded location to the data directory
     cp /data/dataHome/WebApollo2/WebApollo-2013-05-16/json/* ./data/

  

- Process the data in preparation for loading
     cd /var/lib/tomcat7/webapps/WebApollo2/jbrowse/pyu_data
     mkdir scratch/split_gff

- This script splits the Maker output GFF3 file into separate files
  based on the source
     ~/dataHome/WebApollo2/WebApollo-2013-05-16/tools/data/split_gff_by_source.pl -i scf1117875582023.gff \
    -d scratch/split_gff

- Set up the BLAT database
     cd /data/dataHome/WebApollo2/Pyu/Blat
     ln -s ../../pyu_data/scf1117875582023.fa
     faToTwoBit scf1117875582023.fa Pyu.2bit

## Data Loading

- Load the reference sequence(s) and evidence tracks.
- Note: This example uses the results from Maker and simulated BAM and
  BigWig files.
- Depending on the data you use in your project, these commands will be
  different.
- Make the scripts in bin/ executable
     cd /var/lib/tomcat7/webapps/WebApollo2/jbrowse
     sudo chmod +x bin/*

- Load the reference sequence(s)
     bin/prepare-refseqs.pl --fasta pyu_data/scf1117875582023.fa 

- Load the Maker track
    bin/flatfile-to-json.pl --gff pyu_data/scratch/split_gff/maker.gff \
    --arrowheadClass trellis-arrowhead --getSubfeatures \
    --subfeatureClasses '{"wholeCDS": null, "CDS":"brightgreen-80pct", "UTR": "darkgreen-60pct", "exon":"container-100pct"}' \
    --cssClass container-16px --type mRNA --trackLabel maker \
    --webApollo --renderClassName gray-center-20pct

  

- This is a bash script to automate loading the non-Maker tracks. You
  can either paste it into the command prompt or use it to build a shell
  script.
    for i in $(ls pyu_data/scratch/split_gff/*.gff | grep -v maker); do
       j=$(basename $i)
       j=${j/.gff/}
       echo "Processing $j"
       bin/flatfile-to-json.pl --gff $i --arrowheadClass webapollo-arrowhead \
       --getSubfeatures --subfeatureClasses "{\"match_part\": \"darkblue-80pct\"}" \
       --cssClass container-10px --trackLabel $j \
       --webApollo --renderClassName gray-center-20pct
     done

  

    ### Output
    #Processing blastn
    #Processing blastx
    #Processing est2genome
    #Processing protein2genome
    #Processing repeatmasker
    #Processing repeatrunner
    #Processing snap_masked

- populate the name hash to generate a searchable list of names
     bin/generate-names.pl

- Prepare the BAM data for loading
     mkdir data/bam
     cp pyu_data/*.bam* data/bam

- Load the BAM track
     bin/add_bam_track.pl --bam_url bam/simulated-sorted.bam   --label \
     simulated_bam --key "simulated BAM"

- Prepare the BigWig data for loading
     mkdir data/bigwig
     cp pyu_data/*.bw data/bigwig/

- Load the BigWig track
     bin/add_bw_track.pl --bw_url bigwig/simulated-sorted.coverage.bw \
     --label simulated_bw --key "simulated BigWig"  

- The data for this instance should now be all loaded.

## Final WebApollo configuration

- Edit the config.xml file for this instance
- Proper configuration requires us to set several sections of this file
  to work with our project.
    sudo chown ubuntu:ubuntu *

    <datastore_directory>ENTER_DATASTORE_DIRECTORY_HERE</datastore_directory>

- For this instance, we need to set it to:
    <datastore_directory>/data/dataHome/WebApollo2/Pyu/Annotations</datastore_directory>

- Next, edit the user section to connect this instance to the database
  back end. The database will handle
- user accounts, including login authentication and account permissions.
     <url>ENTER_USER_DATABASE_JDBC_URL</url>   

- For this instance, we need to set it to:
    <url>jdbc:postgresql://localhost/web_apollo_users</url>

  

     <username>ENTER_USER_DATABASE_USERNAME</username>

- For this instance, we need to set it to:
    <username>web_apollo_users_admin</username>

  

     <password>ENTER_USER_DATABASE_PASSWORD</password>

- For this instance, we need to set it to:
    <password>web_apollo_users_admin</password>

  

     <refseqs>ENTER_PATH_TO_REFSEQS_JSON_FILE</refseqs>

- For this instance, we need to set it to:
    <refseqs>/var/lib/tomcat7/webapps/WebApollo2/jbrowse/data/refSeqs.json</refseqs>

  

    <organism>ENTER_ORGANISM</organism>

- For this instance, we need to set it to:
    <organism>Pythium ultimum</organism>

  

    <sequence_type>ENTER_CVTERM_FOR_SEQUENCE</sequence_type> 

- This is formatted “CV:term”, and may change depending on your
  reference assembly.
    <sequence_type>sequence:contig</sequence_type> 

  

- Edit the blat_config.xml file for this instance
    <blat_bin>ENTER_PATH_TO_BLAT_BINARY</blat_bin>

- For this instance, we need to set it to:
    <blat_bin>/opt/bin/blat</blat_bin>

  

     <tmp_dir>ENTER_PATH_FOR_TEMPORARY_DATA</tmp_dir>

- For this instance, we need to set it to:
    <tmp_dir>/data/dataHome/WebApollo2/Pyu/Blat/tmp</tmp_dir>

  

    <database>ENTER_PATH_TO_BLAT_DATABASE</database>

- For this instance, we need to set it to:
    <database>/data/dataHome/WebApollo2/Pyu/Blat/Pyu.2bit</database>

  

    <blat_options>ENTER_ANY_BLAT_OPTIONS</blat_options> 

- For this instance, we need to set it to:
    <blat_options>-minScore=100 -minIdentity=60</blat_options>

## Restart Tomcat

- The WebApollo instance should be set up now.
- Tomcat will need to be restarted for WebApollo to display properly.
     sudo service tomcat7 restart

## View your WebApollo instance

- You may view your instance by pointing your browser to
    http://YOUR _HOST:8080/WebApollo2

- To view the site in JBrowse mode use this link format:
    http://YOUR _HOST:8080/WebApollo2/jbrowse

## Note on track styling

There are several pre-defined track styles included with the WebApollo
release. If you'd like to use an included style, replace the subfeature
section with the style name:

    whatever-80pct
    green-80pct 
    blue-80pct 
    purple-80pct 
    springgreen-80pct 
    blueviolet-80pct 
    mediumpurple-80pct 
    orange-80pct 
    darkorange-60pct

For example, to style a match type track with light green, adjust the
load command like this:

    --subfeatureClasses "{\"match_part\": \"darkblue-80pct\"}" 

Becomes:

    --subfeatureClasses "{\"match_part\": \"springgreen-80pct\"}"

  
These styles are located in the custom_track_styles.css file:

    jbrowse/plugins/WebApollo2/css/custom_track_styles.css

You can also edit the styles after loading. The information on track
styles are located in

    jbrowse/data/trackList.json


[Categories](../Special%253ACategories "Special%253ACategories"):

- [Tutorials](../Category%253ATutorials "Category%253ATutorials")


<span class="smwfactboxhead">Facts about
"<span class="swmfactboxheadbrowse">[GMOD Malaysia 2014/WebApollo
Tutorial](../Special%253ABrowse/GMOD-20Malaysia-202014-2FWebApollo-20Tutorial "Special%253ABrowse/GMOD-20Malaysia-202014-2FWebApollo-20Tutorial")</span>"</span>

|  |  |
|----|----|
| [Has topic](../Property%253AHas_topic "Property:Has topic") | [WebApollo](../WebApollo.1 "WebApollo") <span class="smwsearch">[+](../Special%253ASearchByProperty/Has-20topic/WebApollo "Special%253ASearchByProperty/Has-20topic/WebApollo")</span> |

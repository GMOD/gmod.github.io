---
title: "Running a GBrowse2 render farm"
---
# Running a GBrowse2 render farm

[GBrowse 2](/wiki/Category%3AGBrowse_2) can be configured
to use one or more "render slave" daemons. A render slave is a small
Perl process that runs in the background, processing requests to render
GBrowse tracks. By distributing several render slaves across one or more
computers, you can spread out the work of generating GBrowse pages,
thereby achieving improved performance. A slave can be attached to a
particular track, a particular set of tracks, or to all tracks. In
addition, you may assign multiple slaves to tracks, in which case the
load will be distributed across each slave in a round-robin fashion.

  Introduction](#Introduction)
- [Common
  Configurations](#Common_Configurations)
- [Slave
  Setup](#Slave_Setup)
  - [Installing
    the GBrowse Slave
    Software](#Installing_the_GBrowse_Slave_Software)
  - [Running
    the Render Slave Daemon](#Running_the_Render_Slave_Daemon)
- [Master
  Setup](#Master_Setup)
  - [Using
    \[TRACK DEFAULTS\]](#Using_.5BTRACK_DEFAULTS.5D)
  - [The
    slave_preload.conf file](#The_slave_preload.conf_file)
- [Troubleshooting](#Troubleshooting)

## Introduction

Configuration of a render slave is minimal. All the datasource-specific
information is stored in the central GBrowse script (known as the
"master" GBrowse) and sent across the wire to the render slave.
Configuration of the master GBrowse is also quite simple, and requires
just an extra line or two in its configuration files.

*The main limitations on render slaves is that a slave needs access to
the database underlying any track that it is asked to render.* If you
run slaves on multiple hosts, then each host must have access to the
relevant databases. For relational database backends, such as MySQL, you
will need to grant access permissions for each host. For file-based
database backends, such as the BerkeleyDB and in-memory databases, the
database files must be replicated among the hosts, or else mounted on a
common filesystem such as NFS. An additional limitation is that all
plugins and uploaded files will be rendered on the master, and cannot be
offloaded to render slaves.

## Common Configurations

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td>

Figure 4:Multiple servers with private databases

</td>
</tr>
</tbody>
</table>

Figures 1 through 4 illustrate common render slave configurations. In
each of these configurations, we assume that your data source has three
underlying databases: a "scaffold" database that contains basic
chromosome information and the DNA sequence, for use by any plugins
running on the master, and two "annotation" databases that contain
feature tracks.

[Figure 1](/wiki/File:Renderfarm_1.png) illustrates a
simple case in which the master and slave processes are all running on
the same machine and all databases are locally accessible. This
configuration makes sense on a multiprocessor or multicore system that
can take advantage of parallel processes. The only special configuration
needed for this arrangement is to activate GBrowse's renderfarm support
(as described in [Initial Setup](#Initial_Setup) and to launch one or
more slave processes at machine startup time.

[Figure 2](/wiki/File:Renderfarm_2.png) illustrates a
master server and two slave servers, all located on the same LAN. Each
server runs a single GBrowse slave process; however it is possible to
launch multiple processes for a possible performance boost. The three
databases are located on a single NFS-mounted volume, so that the master
server and the two slave servers have direct access to them. The host
for this volume could be the master server, one of the slave servers, or
a dedicated NFS server somewhere on the LAN.

[Figure 3](/wiki/File:Renderfarm_3.png) illustrates
almost the same configuration as the previous one, except that instead
of an NFS-mounted filesystem, the databases reside on a relational
database (e.g. MySQL) server which is accessed via the network.

[Figure 4](/wiki/File:Renderfarm_4.png) illustrates a
case in which the master and slave servers do not share databases. In
this case, each machine has access to a private local database file or
relational database server.

Which configuration is best for you depends on your needs. For small
renderfarms, a shared disk or database server is easy and effective. For
large renderfarms, you may encounter resource contention as the slave
servers all attempt to access the same files. In this case, it makes
more sense to give each slave its own database copy.

Many other configurations are possible, including distributing the work
across the Internet. However, there is no particular authentication or
authorization mechanism built into the slaves, so it is recommended that
they be run on a protected LAN.

## Slave Setup

To set up a GBrowse renderfarm, you will need to install and configure
slaves on each physical server you plan to use, arrange for the slaves
to launch at boot time, and configure the master server to use the
slaves.

### Installing the GBrowse Slave Software

The GBrowse render slave is a small perl script named *gbrowse_slave*.
Most of its functionality is contained in various Perl modules that are
part of the GBrowse core distribution. On the master server, when you
install GBrowse using **./Build install**, gbrowse_slave will be
installed automatically to Perl's default binary directory, usually
*/usr/local/bin*. For the master, no additional software installation is
needed.

On machines destined to be slave servers, you will probably not want to
install the full GBrowse distribution, because this includes
configuration files, sample databases, javascript libraries and other
elements that are not needed. For these machines, the build and install
procedure is as follows:

    % cd Generic-Genome-Browser
    % perl Build.PL
    % ./Build test  (optional)
    % sudo ./Build install_slave

The last step, which should be performed as root, will install the
required Perl libraries, manual pages and gbrowse_slave script, as well
as the init support scripts needed to launch gbrowse_slave at startup
time. Running the tests is optional, but it does ensure that all
prerequisites are installed and working properly. The slave requires all
the same prerequisites as the master server, including Bio::Perl, GD,
CGI::Session, JSON, etc. However, an Apache server is **not** needed to
run a slave.



### Running the Render Slave Daemon

The slave usually runs as a daemon, listening on a designated server
port and logging its output to a log file. You may run it by hand using
an invocation like the following:

    /usr/local/bin/gbrowse_slave --verbose=3 --log=`pwd`/slave.log --pid=`pwd`/slave.pid --port=8100

This will launch the slave with maximum (level 3) verbosity, write its
output to the file *slave.log*, leave its process ID in the file named
*slave.pid* and listen for incoming connections on port 8100. If it
launches successfully, the slave.log and slave.pid files will be created
in the current directory and the log file will contain lines like the
following:

    [Thu Jan 22 17:58:45 2009] [info]   [pid=8128]  GBrowse render slave starting on port 8100
    [Thu Jan 22 17:58:45 2009] [debug]  [pid=8128]  Waiting for connection...

To kill the server, run the following command:

    % /usr/local/bin/gbrowse_slave -k --pid=`pwd`/slave.pid

A more convenient way to start and stop the slave is using its init
script, which was installed during **./Build install_slave**. This init
script is located in /etc/init.d/gbrowse-slave, and works on a variety
of Linux distributions (it has not yet been tested on MacOSX - please
edit this if you are able to confirm that it works or doesn't). The
script will not work with Windows as it requires the bash shell.

To start the slave
    sudo /etc/init.d/gbrowse-slave start

If successful, you will see a message that three slave renderers have
been started on ports 8101, 8102 and 8103. The slaves will log their
activities to /var/log/gbrowse/gbrowse_slave, and write their process
IDs to /var/run/gbrowse/

To stop the slave
    sudo /etc/init.d/gbrowse-slave stop

The number of slave servers to launch, the network ports they listen on,
and the location of their log and pid files are controlled by a defaults
file located in */etc/default/gbrowse-slave*. This file looks like this:

     #!/bin/sh

     DAEMON=/usr/local/bin/gbrowse_slave
     USER=www-data
     PRELOAD=/etc/gbrowse2/slave_preload.conf
     RUNDIR=/var/run/gbrowse
     LOGDIR=/var/log/gbrowse
     PORT="8101 8102 8103"
     VERBOSITY=3
     NICE=0

Adjust this file as needed to meet your preferences. **DAEMON** gives
the path to the gbrowse_slave script. **USER** indicates which user
account to run under. If you run the slave daemon on the same machine
used by the master, then this should be set to the same user as the one
the Apache daemon uses, as they share directories. **PRELOAD**, an
optional argument, gives the path to a file of in-memory databases for
the render slave to load at startup time. **RUNDIR** and **LOGDIR**
indicate the directories containing the slave's PID and log files,
respectively. **PORT** is a space-delimited list of ports to listen on.
The init script will launch one slave for each port. **VERBOSITY**
controls the verbosity of the log file, and ranges from 0 (fatal errors
only) to 3 (verbose informational logging). Lastly, **NICE** sets the
daemon nice level, and ranges from 0 (normal priority) to 20 (very low
priority). Adjust this if you find that slave processes are interfering
with other processes on the machine.

To arrange for the init script to run at system boot time, simply create
a symbolic link from the script to the appropriate /etc/rc.\* directory.
For example, if the machine usually runs at runlevel 2 (which you can
determine using the *runlevel* command), then run the following
commands:

    % cd /etc/rc2.d
    % sudo ln -s ../init.d/gbrowse-slave S99gbrowse-slave

You may prefer to use your distribution's GUI for configuring startup
services.

## Master Setup

Once the slaves are configured and running, you need to tell the master
GBrowse server about them. There are two configuration options that
control this: **renderfarm** and **remote renderer**.

The **renderfarm** option is placed in the \[GENERAL\] section of either
the main GBrowse.conf configuration file, or the \[GENERAL\] section of
one or more datasource-specific configuration files. Set this option to
a true value (non-zero) to activate slave rendering support:

    [GENERAL]
    ...other options...
    renderfarm = 1
    ...

It is safe to set renderfarm to 1 even for a datasource that does not
use slaves. It is most often used as a convenient way to disable remote
rendering during debugging and troubleshooting.

Place the **remote renderer** option into datasource-specific \[TRACK\]
sections to enable remote rendering for that track. Here is a simple
example:

    # in a datasource-specific config file, such as yeast_renderfarm.conf
    [Genes]
    feature         = gene
    database        = volvox_annotations
    remote renderer = http://slavehost1.example.org:8101
    glyph           = gene
    bgcolor         = yellow
    key             = Protein-coding genes

    [tRNAs]
    feature         = tRNA
    database        = volvox_annotations
    remote renderer = http://slavehost2.example.org:8101
    glyph           = generic
    bgcolor         = lightgray
    height          = 6
    key             = tRNAs

This defines two tracks named Genes and tRNAs respectively. The Genes
track fetches features of type "gene" from the database
"volvox_annotations". This database is defined in a configuration stanza
named \[volvox_annotations:database\] as usual. The rendering task is
passed off to the render slave running on port 8101 on the host
*slavehost1.example.org*. The rest of the stanza is as usual, and
contains options for selecting the glyph, color, height and key of the
rendered feature.

The tRNAs track is similar, except that it uses the render slave running
on port 8101 of *slavehost2.example.org*.

The format of the **remote renderer** option is a space-delimited list
of one or more slave addresses. Slaves are addressed using ordinary HTTP
URLs. The hostname and port number parts of the URL are significant. The
path part of the URL (e.g. /path/to/index.html) is not needed and is
ignored if present. If you list multiple render slaves, then requests
will be distributed across them in a round-robin fashion. For example:

    remote renderer = http://slavehost1.example.org:8101 http://slavehost1.example.org:8102 http://slavehost2.example.org:8101

This will distribute requests across the two slave processes running on
slavehost1 at ports 8101 and 8102, and across the slave running on
slavehost2 port 8101. If one of the slave servers goes down, the master
will note this and mark it temporarily unavailable for use. This
provides a simple failover facility.

Note that the database named "volvox_annotations" must be available to
the two slave servers. If it is a file-based database, such as one
created using the "memory" adaptor of Bio::DB::SeqFeature::Store or
Bio::DB::GFF, then the directory the database is located in must be
available to the slave server at the path indicated in the
\[volvox_annotations:database\] stanza. If the database is available on
a network-connected relational database server, then the slave must have
access privileges and the RDBMS hostname, username and password
credentials indicated in the database configuration stanza must be
appropriate for the slave.

### Using \[TRACK DEFAULTS\]

In many cases you will wish to use the \[TRACK DEFAULTS\] stanza to
assign a set of slaves to all tracks by default:

    [TRACK DEFAULTS]
    remote renderer = http://localhost:8101  http://localhost:8102
                      http://slavehost1:8101 http://slavehost2:8101
    database        = volvox_annotations

This make two slaves running on the local machine and two additional
slaves running on slavehost1 and slavehost2 the defaults. It also makes
"volvox_annotations" the default database for all tracks. If you wish
you can override the choice of slaves for individual tracks by placing
"remote renderer" option in those tracks' stanzas. Use a value of "none"
or "local" to turn off slave rendering for a particular track:

    [TRANSL]
    remote renderer = none
    global feature = 1
    glyph          = translation
    database       = chromosomes

### The slave_preload.conf file

If you are relying on in-memory databases, you may wish to have them
preloaded at slave startup time. This avoids the overhead of parsing and
storing the in-memory database with each slave request. Note that
preloading databases is usually unnecessary for relational databases, as
the overhead for creating and tearing down a network connection to the
database server is usually minimal.

The slave_preload.conf file is located in the gbrowse configuration
directory, typically /etc/gbrowse2. It consists of a series of database
stanzas that follow the same format as the stanzas in the data source
configuration file. For example:

    [yeast12:database]
    db_adaptor    = Bio::DB::SeqFeature::Store
    db_args       = -adaptor memory
                    -dir    /var/www/gbrowse2/databases/yeast_chr1+2

    [scaffolds:database]
    db_adaptor    = Bio::DB::SeqFeature::Store
    db_args       = -adaptor memory
                    -dir    /var/www/gbrowse2/databases/yeast_scaffolds

You can name the stanzas the same as you name them in the data source
configuration file (\[yeast12:database\]) or leave off the :database
part (\[yeast12\]). In fact, the stanza name isn't significant; the
slave uses the **db_adaptor** and **db_args** options to match up
preloaded databases with the database in the request, so you can name
the stanzas \[db1\], \[db2\], or whatever you like.

You are encouraged to experiment with preloading databases or not to see
whether performance improves on your system.

## Troubleshooting

Slaves write diagnostic messages to a log file usually located in
/var/log/gbrowse/gbrowse_slave. Error messages will be written to this
location. During troubleshooting you may wish to increase VERBOSITY
option in the /etc/default/gbrowse-slave file to its maximum level of 3.

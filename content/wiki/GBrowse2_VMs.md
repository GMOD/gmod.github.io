---
title: "GBrowse2 VMs"
---
# GBrowse2 VMs

 Virtual Machines</span>](#GBrowse2_Virtual_Machines)
 - [Getting
 Started with the VirtualBox
 VM](#Getting_Started_with_the_VirtualBox_VM)
 - [User
 Accounts](#User_Accounts)
 - [Editing Network
 Settings](#Editing_Network_Settings)
 - [Enabling SSH](#Enabling_SSH)
 - [Expanding
 Storage](#Expanding_Storage)
 - [Getting
 Started with the EC2 VM](#Getting_Started_with_the_EC2_VM)
 - [Logging into the GBrowse EC2
 VM](#Logging_into_the_GBrowse_EC2_VM)
 - [Using
 the Load Balancing
 Scripts](#Using_the_Load_Balancing_Scripts)
 - [Expanding Database Storage on the GBrowse
 EC2 VM](#Expanding_Database_Storage_on_the_GBrowse_EC2_VM)
 - [Administration common to both VirtualBox and
 EC2
 VMs](#Administration_common_to_both_VirtualBox_and_EC2_VMs)
 - [Configuring
 Tracks](#Configuring_Tracks)
 - [Filesystem
 Layout](#Filesystem_Layout)
 - [Adding
 New Databases](#Adding_New_Databases)
 - [The
 gbrowse_clean.pl Script](#The_gbrowse_clean.pl_Script)
 - [Admin
 mode](#Admin_mode)

# GBrowse2 Virtual Machines

Port Forwarding Settings

By default, the NAT interface will take network requests targeted to the
host machine's port 8081 to the guest VM's port 80. This allows the host
machine to act as a GBrowse server for other physical machines on the
local LAN and/or Internet. You may modify this if you wish in the
following way. From the VirtualBox GUI, select the GBrowse VM, and then
double-click on the *Network* setting in the details panel. This will
bring up a dialog box that has tabs for each of the two network adapters
attached to the VM. Select *Adapter 1*, which is the NAT adapter, and
then open up the *Advanced* section. Click on *Port Forwarding* to open
up the Port Forwarding definitions. You may add new forwarding rules by
clicking on the *Plus* icon.

In the example shown on the right, the first rule is the default
forwarding of host port 8081 to guest port 80. In addition, we have
added a second rule that forwards host's port 80 itself to guest port
80. This allows you and others to access GBrowse without specifying
the :8081 port. Note, however, that you must start VirtualBox with root
privileges in order to successfully forward port 80 and any others below
1024.

#### Enabling SSH

The VirtualBox VM does not run an SSH server by default, however you can
enable it easily by running this command from Administrator's
command-line shell.

 sudo apt-get install openssh-server

You can then ssh into the guest by using its host-only network
interface. You can look up the network interface from within the virtual
machine's desktop by right clicking on the Network icon (pie-wedge icon
in the upper right of the menu bar), and selecting *Connection
Information=\>Wired connection 2*. Alternatively, you can look it up
from the command-line of the host machine using *VBoxManage*:

 $ VBoxManage guestproperty get "Growse 2.XX, VirtualBox Edition" "/VirtualBox/GuestInfo/Net/1/V4/IP"
 Value: 192.168.56.101

You can now ssh in using the address you just got:

 ssh admin@192.168.56.101

### Expanding Storage

All the GBrowse databases are stored on a separate logical volume
mounted at /opt/gbrowse. This volume grows dynamically up to 50 GB. If
you run out of space, you can easily add more storage. First halt the
virtual machine. Using the VirtualBox GUI, select the GBrowse VM, click
on *Settings*, and then select *Storage*. In the *Storage Tree* panel,
select *SATA Controller* and click on the *Add Hard Disk* icon. When
prompted, choose *Create new disk* and then use the wizard to create a
virtual disk with the size and characteristics you desire.

Now launch the VM. The new disk you added will appear as a new
unpartitioned disk drive device named /dev/sdc (or /dev/sdd if you've
done this once before). Do not partition or format this disk. Instead,
use the Logical Volume Manager to extend the logical /opt/gbrowse volume
onto this disk via the following series of commands:

 sudo pvcreate /dev/sdc
 sudo vgextend volumes /dev/sdc
 sudo lvextend -l +100%FREE /dev/volumes/gbrowse
 sudo resize2fs /dev/volumes/gbrowse

/opt/gbrowse will now be increased by the size of the disk you just
added.

## Getting Started with the EC2 VM

To start a GBrowse server within the Amazon Elastic Compute Cloud (EC2),
you will need to have an Amazon Web Services account and to be familiar
with the process of configuring and launching Amazon Machine Images
(AMIs. A good getting started guide can be found <a
href="http://docs.amazonwebservices.com/AWSEC2/latest/GettingStartedGuide/GetStartedLinux.html"
class="external text" rel="nofollow">here</a>.

GMOD provides GBrowse AMIs in a small number of availability regions;
this list will grow with time. Choose the region you prefer, and click
on one of the links below:

**GBrowse 2.54, us-east-1:** <a
href="https://console.aws.amazon.com/ec2/home?region=us-east-1#launchAmi=ami-93e46cfa#launchAmi=ami-93e46cfa"
class="external text" rel="nofollow">ami-93e46cfa</a>

**GBrowse 2.54, us-west-2:** <a
href="https://console.aws.amazon.com/ec2/home?region=us-west-2#launchAmi=ami-c04fc4f0#launchAmi=ami-c04fc4f0"
class="external text" rel="nofollow">ami-c04fc4f0</a>

**GBrowse 2.50, us-east-1:** <a
href="https://console.aws.amazon.com/ec2/home?region=us-east-1#launchAmi=ami-4914a220#launchAmi=ami-4914a220"
class="external text" rel="nofollow">ami-4914a220</a>

**GBrowse 2.50, us-west-2:** <a
href="https://console.aws.amazon.com/ec2/home?region=us-west-2#launchAmi=ami-449a1474#launchAmi=ami-449a1474"
class="external text" rel="nofollow">ami-449a1474</a>

Alternatively you may use the Amazon Console to search for public images
matching the name "GBrowse\*" in order to find images in your preferred
region (there may not be any).

Clicking on one of the AMIs listed above will start an instance launch
wizard. Here is guidance on how to configure the instance:

Instance Type
GBrowse will run even on the tiny *t1.micro* instance type, but this is
only recommended for the purposes of kicking the tires. For production
use, we recommend *m1.medium* or larger. High-CPU and high I/O
performance instance types generally provide better performance than
high-memory instances.
Key Pair
Use your default SSH keypair.
Firewall
Use or create a security group that allows both incoming SSH and HTTP
connections. The former will allow you to log into the GBrowse server
for administrative purposes, while the latter gives you access to the
GBrowse web application.

Once you are satisfied with the settings, launch the instance and watch
the Amazon Console until it enters *Running* state. At this point,
record the instance's public DNS name from the information provided on
the console, and paste this DNS name into a web browser. You will be
taken to the GBrowse welcome page, which offers links to documentation
and bare-bones starter genome databases.

### Logging into the GBrowse EC2 VM

The administrative user for the GBrowse EC2 VM has a password-less
account named "admin", which can only be accessed via an SSH key. To log
into the instance, invoke ssh with your AWS keypair identity file and
the "admin" username:

 ssh -i /path/to/aws_private_key.pem admin@ec2-XX-XX-XX-XX.compute-1.amazonaws.com

This will give you a command-line shell on the GBrowse server. To run
any command as root, you may use *sudo* without providing a password.

### Using the Load Balancing Scripts

You may take advantage of Amazon's spot instances to load balance
GBrowse at modest cost. The two scripts needed are:

gbrowse_sync_aws_slave.pl
This script will synchronize the databases on the master VM to a data
snapshot that can be accessed by the load balancing slave machines.

gbrowse_aws_balancer.pl
This script runs the balancer daemon on the master VM. It monitors load
on the master instance and launches slave instances to handle increased
load.

Configuration information for these two scripts is maintained in a
common file named /opt/gbrowse/etc/aws_balancer.conf. This file controls
the number of spot instances for launch for different load levels, the
size and memory capacity of the spot instances, and the maximum hourly
price you are willing to pay for a spot instance.

There is also an init script located at
/opt/gbrowse/etc/init.d/gbrowse-aws-balancer that launches and
configures the balancer daemon. It is controlled by the configuration
file /opt/gbrowse/etc/default/gbrowse-aws-balancer.

Some setup is required to use the load balancer. For details see [Load
Balancing GBrowse2 with AWS Spot
Instances](/wiki/Load_Balancing_GBrowse2_with_AWS_Spot_Instances)
or run:

 perldoc gbrowse_aws_balancer.pl

### Expanding Database Storage on the GBrowse EC2 VM

All GBrowse databases are stored in a logical volume mounted at
/opt/gbrowse. The default volume is only 10 Gb in size, but you can
easily expand it while logged into the GBrowse server by running
*gbrowse_grow_cloud_vol.pl* and providing the number of gigabytes to
expand it by. For example, this command increases the volume by an
additional 40 GB:

 gbrowse_grow_cloud_vol.pl 40

This works by allocating a new EBS volume, attaching it to the server
instance, adding it to the logical volume manager group, and then
resizing the /opt/gbrowse filesystem. Volumes added in this way have
their "delete on termination" flag set, so the data will disappear when
you terminate the instance, unless you snapshot the volume or create a
new AMI to hold your local modifications.

## Administration common to both VirtualBox and EC2 VMs

This section discusses configuration and administration tasks that are
common for both the VirtualBox and EC2 virtual machines.

### Configuring Tracks

The process of loading data and configuring tracks is described well in
detail in the [GBrowse 2.0
HOWTO](/wiki/GBrowse_2.0_HOWTO), and the [GBrowse NGS
Tutorial](/wiki/GBrowse_NGS_Tutorial) (for BAM and SAM
next generation sequencing data). There are also several step-by-step
tutorials located on the [GBrowse
Tutorial](/wiki/GBrowse_Tutorial) page. All tutorials will
work on the VMs, except that the layout of the GBrowse's data and
configuration files is slightly different from those in the tutorial.
For example, the main GBrowse configuration file is located at
/opt/gbrowse/etc/GBrowse.conf, instead of /etc/gbrowse2/GBrowse.conf.
The VM filesystem layout is described in the next section.

### Filesystem Layout

The filesystem layout of both VMs is similar. The root filesystem at "/"
consists of a generic Ubuntu bootable disk. Almost all GBrowse-related
software has been installed in /opt/gbrowse:

/opt/gbrowse/etc
GBrowse configuration files, including GBrowse.conf and datasource .conf
files.
/opt/gbrowse/databases
GBrowse databases
/opt/gbrowse/htdocs
GBrowse Javascript and static HTML files.
/opt/gbrowse/bin
Various command-line tools from the GBrowse and BioPerl distributions.
/opt/gbrowse/lib
Perl and non-Perl libraries used by GBrowse.

The system PATH includes /opt/gbrowse/bin, and the PERL5LIB environment
variable is
/opt/gbrowse/lib/perl:/opt/gbrowse/lib/perl5:/opt/gbrowse/share/perl.

### Adding New Databases

You can add new databases in the way described in [GBrowse 2.0
HOWTO](/wiki/GBrowse_2.0_HOWTO) and [GBrowse
Tutorial](/wiki/GBrowse_Tutorial). However, there is also a
new command-line tool called *gbrowse_import_ucsc_db.pl* that will
initialize starter databases from information held in the UCSC Genome
Browser. It is run this way:

 gbrowse_import_ucsc_db.pl hg19 'H. sapiens genome (hg19), genes and DNA'

The first argument is the UCSC genome build name, such as *hg19*. The
second is the description to attach to the new database. This
description will appear in the GBrowse datasources menu. When this
script is run, it will fetch the DNA, genes and non-coding RNA
annotations for the indicated data source and create a bare-bones
configuration file for the data source. You can then tweak the
configuration file and add to it.

### The gbrowse_clean.pl Script

On both VMs there is a daily cron job that runs under the www-data user.
This cronjob runs gbrowse_clean.pl to remove old cache files as well as
uploads that haven't been accessed in a minimum number of days
(controlled by the "expire uploads" option in GBrowse.conf). The script
will log its run time actions to the file
/etc/gbrowse2/gbrowse_clean.log.

You may disable gbrowse_clean.pl by running:

 sudo crontab -u www-data -e

This will open up a text editor. Simply comment out the line that runs
gbrowse_clean.pl.

### Admin mode

Both VMs come with a preinstalled GBrowse administrator user. When the
administrator is logged into the browser using the *Log in / create
account* link in the upper right of the GBrowse main window, all tracks
uploaded by this user will be publicly visible. The username and
password for this user are:

 username: admin
 password: gbrowse

If you make the VM publicly accessible, you are advised to change the
password by selecting *My Account* and then *Change Password* after you
initially log in. You may also use the command-line tool
*gbrowse_set_admin_passwd.pl* to change the password from a server
shell.

To administer the embedded MySQL server, please use the user account
"root" and the password "gbrowse". To change the MySQL root password,
use the **mysqladmin password** command.

**Important note:** The GBrowse "admin" user is separate from the
"admin" user used to log into the server command-line shell. On the
Amazon edition, "admin" has no password and must use an SSH key to log
in. On the VirtualBox edition, "admin" has the default password of
"gbrowse". If you change the web interface password, you will not change
the shell login password; this must be done separately.

---
title: "GMOD in a Box/Updating"
---
# GMOD in a Box/Updating

To update from one version of GMOD in a Box to another, follow these
steps:

1\. For the old version of GMOD in a Box (GiaB), identify file for the
data partition. For GiaB 2.04, that file will probably be called "GMOD
in a Box 2.04-disk2.vmdk".

2\. Make a copy of this file and rename it if you like. Move it into the
new GiaB's folder.

3\. Start VirtualBox; if you haven't done so already, import the new
version of GiaB.

4\. Open the settings for the instance. Choose the Storage tab.

5\. Right click on the "Controller: SATA", select "Add Hard Disk", click
the "Choose existing disk" button, add the new disk file and click OK to
save the settings.

5a. If you would like to resize the data disk, see the [GMOD in a
Box/Resizing a VirtualBox
Disk](/wiki/Resizing_a_VirtualBox_Disk)

6\. Start the instance and log in.

7\. In the guest (GMOD in a Box) machine, type `sudo fdisk -l |grep sd`
to identify the device name of the new disk. If you aren't sure which
one it is, you can type `df -h` to see what devices are already mounted,
and the new one is the one not on that list. /dev/sda is the root
partition; the new partition will be something like /dev/sdb1 or
/dev/sdc1.

8\. Shut down any services that rely on the data in the data partition:

    sudo /etc/init.d/apache2 stop
    sudo /etc/init.d/postgresql stop
    sudo /etc/init.d/tomcat7 stop

9\. Unmount the old data partition and mount the new one (assuming the
device name is /dev/sdc):

    sudo umount /data
    sudo mount -v -t ext4 /dev/sdc1 /data

Verify that the drive was correctly mounted by doing "ls /data".

9\. Run the update script: sudo
~/GMODintheCloud/gmod_update_data_partiion.pl. This will add any files
that the new version of GiaB requires.

10\. Restart the services stopped above:

    sudo /etc/init.d/apache2 start
    sudo /etc/init.d/postgresql start
    sudo /etc/init.d/tomcat7 start

11\. After verifying that the services (GBrowse, JBrowse, WebApollo and
Tripal) are working correctly, edit /etc/fstab to make sure the new
partition mounts at the /data mount point when the machine reboots. Do
this by changing the line that has the old device name (like /dev/sdb)
to the new device name (like /dev/sdc).

12\. To verify that everything is working correctly, reboot the
instance.

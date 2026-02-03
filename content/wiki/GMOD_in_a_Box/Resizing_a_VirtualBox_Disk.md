---
title: "GMOD in a Box/Resizing a VirtualBox Disk"
---
# GMOD in a Box/Resizing a VirtualBox Disk

**Important Note: The actions below could potentially result in the data
partition getting corrupted. Always do these activities on a copy of the
data drive file.**

## For GMOD in a Box before 2.05

To resize the data disk in GiaB 2.04, we have to change the type of disk
it is, since the one that shipped with 2.04 doesn't support resizing
(after 2.04, we changed to the type that supported resizing). To change
the type, Identify the file for the data disk on the host machine; for
2.04, it is probably "GMOD in a Box 2.04-disk2.vmdk". Run this command
on that file:

     VBoxManage clonehd GMOD\ in\ a\ Box\ 2.04-disk2.vmdk GMOD\ in\ a\ Box\ 2.05-data-disk.vdi --format VDI --variant Standard

This creates a VDI file that we can resize.

## For Resizing a VDI file

To resize, run this command on the host machine on the disk that you
want to resize:

     VBoxManage modifyhd GMOD\ in\ a\ Box\ 2.05-data-disk.vdi --resize 10000

where the "10000" is the number of megabytes of the resized disk (so
this is approximately 10GB). Now you can continue with adding this disk
to the GMOD in a Box instance. Now the disk is bigger, but the file
system doesn't know about it yet. By far, the easiest way to resize the
file system is to reboot the instance using the <a
href="https://sourceforge.net/projects/gparted/files/gparted-live-stable/0.16.2-11/%7CGParted"
class="external text" rel="nofollow">live disk, which can be downloaded
from SourceForge</a>. You need the iso for amd64 (GMOD in a Box is a 64
bit machine).

Once you've downloaded the iso, shutdown the GMOD in a Box instance if
it is running. Open the settings for the machine and attach the resized
database file to the GMOD in a Box instance using the directions in the
[GMOD in a Box/Updating](Updating "GMOD in a Box/Updating") page. Then,
in the same Storage tab, right click on "Controller:IDE", select "Add
CD/DVD Device", click the "Choose Disk" and then find the downloaded iso
and click OK.

Press start to boot the instance using the GParted live CD iso. Answer
the questions about language, keyboard and starting in the graphical
environment (generally accepting the defaults is fine).

In the window that results, the GParted utility should be running. In
the upper right corner of the utility, select the resized disk from drop
down menu (/dev/sda will probably be selected initially). Click on the
line that has ext4 under "File System" and then click "Resize/Move". In
the window that results, click and drag the black triangle to make the
file system take up the entire disk. Click the "Resize/Move" button to
save and then the "Apply" button to make it permanent. Select Quit from
the GParted menu in the upper left of the window. Right click on the
desktop and select "exit" then "exit-shutdown menu" from the pop up
menu, and select shutdown in the resulting window. Press enter to
continue shutting down. Open the storage settings and remove the GParted
CD iso from the ISO controller.

Now you can restart the GMOD in a Box instance and continue with
mounting the new data drive as described in the [GMOD in a
Box/Updating](Updating "GMOD in a Box/Updating") page.





<span id="top"></span>




# <span dir="auto">GMOD in a Box/Resizing a VirtualBox Disk</span>









**Important Note: The actions below could potentially result in the data
partition getting corrupted. Always do these activities on a copy of the
data drive file.**

## <span id="For_GMOD_in_a_Box_before_2.05" class="mw-headline">For GMOD in a Box before 2.05</span>

To resize the data disk in GiaB 2.04, we have to change the type of disk
it is, since the one that shipped with 2.04 doesn't support resizing
(after 2.04, we changed to the type that supported resizing). To change
the type, Identify the file for the data disk on the host machine; for
2.04, it is probably "GMOD in a Box 2.04-disk2.vmdk". Run this command
on that file:

     VBoxManage clonehd GMOD\ in\ a\ Box\ 2.04-disk2.vmdk GMOD\ in\ a\ Box\ 2.05-data-disk.vdi --format VDI --variant Standard

This creates a VDI file that we can resize.

## <span id="For_Resizing_a_VDI_file" class="mw-headline">For Resizing a VDI file</span>

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








## Navigation menu







<a href="../Main_Page"
style="background-image: url(../../images/GMOD-cogs.png);"
title="Visit the main page"></a>


### Navigation



- <span id="n-GMOD-Home">[GMOD Home](../Main_Page)</span>
- <span id="n-Software">[Software](../GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](../Categories)</span>
- <span id="n-View-all-pages">[View all
  pages](../Special:AllPages)</span>




### Documentation



- <span id="n-Overview">[Overview](../Overview)</span>
- <span id="n-FAQs">[FAQs](../Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](../Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](../Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](../GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](../Training_and_Outreach)</span>
- <span id="n-Support">[Support](../Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](../GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](../Meetings)</span>
- <span id="n-Calendar">[Calendar](../Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/GMOD_in_a_Box-2FResizing_a_VirtualBox_Disk"
  rel="smw-browse">Browse properties</a></span>



- <span id="footer-info-lastmod">Last updated at 03:31 on 12 December
  2013.</span>
<!-- - <span id="footer-info-viewcount">7,687 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->









<span id="top"></span>




# <span dir="auto">Cloud/Updating</span>









To update from one version of GMOD in the Cloud to another, follow these
steps:

1\. For the old version of GMOD in the Cloud (GitC), identify the volume
that is mounted in /data. Typically, you can find this information by
looking at the information page for the current instance, locating the
Block Devices section and clicking on the device name of the /data
partition (typically sdf but certainly "higher" than sda. Clicking on
the name of the partition will create a window with information about
the volume in it. Note the EBS ID.

2\. In the Volumes section of the AWS Console, locate the old GitC
volume. Right click on it and select Create Snapshot. While not
necessary, it's not a bad idea to stop the instance unmount the
partition before creating the snapshot. Give it a name that will make it
easier to find.

3\. In the Snapshot section of the AWS Console, locate the snapshot you
just created, right click on it and select Create Volume from the menu.
In the resulting image, configure the volume the way you want it to be.
Volume type should be Standard; adjust the size of the partition if you
want to (if you do adjust the size, see <a
href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#recognize-expanded-volume-linux#recognize-expanded-volume-linux"
class="external text" rel="nofollow">this guide from Amazon for
adjusting the size in the OS</a>, and set the availability zone to be
the same as the new instance of GitC.

3b. If you haven't done so already, create a new instance of the desired
version of GitC.

4\. Back in the Volumes section, identify the volume you just created
(you should be able to tell which one it is by the fact that it is
available and has a recent time created). Right click on the volume, and
select Attach Volume. Select the new GitC instance from the drop down
menu and note the device name (it should be something like /dev/sdg).
Click Yes, Attach.

5\. Start or restart (restart may not be necessary) the instance of the
new version of GitC and log in to the command line.

6\. Type "sudo fdisk -l" to verify that the new drive is attached (but
not yet mounted), and note the device name (it may differ slightly from
what the AWS Console says; for example, the console might say sdg, where
as the operating system may say xvdg but they both end in "dg" so you
know it's the same thing).

7\. Shutdown services that depend on data on the /data partition.
Notably, this includes apache, postgresql and tomcat7:

     sudo /etc/init.d/apache2 stop
     sudo /etc/init.d/postgresql stop
     sudo /etc/init.d/tomcat7 stop

8\. Unmount the old data partion and mount the new one:

     sudo umount /data
     sudo mount -v -t ext4 /dev/xvdg /data

Verify that the drive was correctly mounted by doing "ls /data".

9\. Run the update script: sudo
~/GMODintheCloud/gmod_update_data_partiion.pl. This will add any files
that the new version of GitC requires.

10\. Restart the services stopped above:

     sudo /etc/init.d/apache2 start
     sudo /etc/init.d/postgresql start
     sudo /etc/init.d/tomcat7 start

11\. After verifying that the services (GBrowse, JBrowse, WebApollo and
Tripal) are working correctly, edit /etc/fstab to make sure the new
partition mounts at the /data mount point when the machine reboots. Do
this by changing the line that has the old device name (like /dev/xvdf)
to the new device name (like /dev/xvdg).

12\. To verify that everything is working correctly, reboot the
instance.








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

- <span id="t-smwbrowselink"><a href="../Special%253ABrowse/Cloud-2FUpdating" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:49 on 5 December
  2013.</span>
<!-- - <span id="footer-info-viewcount">11,265 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





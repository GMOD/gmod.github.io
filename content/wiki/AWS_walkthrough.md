---
title: "AWS walkthrough"
---
# AWS walkthrough


This is a click-by-click walkthrough of how to get a GMOD machine image
up and running using Amazon's cloud services.


  Amazon</span>](#Registering_on_Amazon)
- [Amazon Web
  Services: Registration](#Amazon_Web_Services:_Registration)
- [Credit Where
  Credit's Due](#Credit_Where_Credit.27s_Due)
- [Your First
  Instance](#Your_First_Instance)
  - [Launch an
    Instance](#Launch_an_Instance)
  - [Setting Up
    Security Post-Launch](#Setting_Up_Security_Post-Launch)
- [Working in the
  Cloud](#Working_in_the_Cloud)
  - [Instance
    Access](#Instance_Access)
- [Leaving the
  Cloud](#Leaving_the_Cloud)
  - [Shutting
    Down](#Shutting_Down)
  - [Volume
    Deletion](#Volume_Deletion)


## Registering on Amazon

## Amazon Web Services: Registration

Start off at <a href="http://aws.amazon.com" class="external text"
rel="nofollow">aws.amazon.com</a>

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/98/Screen_shot_2012-08-25_at_10.38.41.png/750px-Screen_shot_2012-08-25_at_10.38.41.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/98/Screen_shot_2012-08-25_at_10.38.41.png/1125px-Screen_shot_2012-08-25_at_10.38.41.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/98/Screen_shot_2012-08-25_at_10.38.41.png 2x"
width="750" height="482" alt="Amazon Web Services welcome screen" />

  
Log in with your regular Amazon account (if you don't have an Amazon
account, you'll need to create one)

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f7/Screen_shot_2012-08-25_at_10.39.02.png/750px-Screen_shot_2012-08-25_at_10.39.02.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f7/Screen_shot_2012-08-25_at_10.39.02.png/1125px-Screen_shot_2012-08-25_at_10.39.02.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f7/Screen_shot_2012-08-25_at_10.39.02.png 2x"
width="750" height="482" alt="Amazon Web Services login" />

  
Theoretically Amazon already knows this stuff, but you have to enter it
all again...

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/eb/Screen_shot_2012-08-25_at_10.40.59.png/750px-Screen_shot_2012-08-25_at_10.40.59.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/eb/Screen_shot_2012-08-25_at_10.40.59.png/1125px-Screen_shot_2012-08-25_at_10.40.59.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/eb/Screen_shot_2012-08-25_at_10.40.59.png 2x"
width="750" height="482" alt="AWS login" />

  
You'll need to enter your credit card information to pay for your cloud
usage; GMOD has a grant from AWS to allow users a certain amount of
compute credit.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/15/Screen_shot_2012-08-25_at_10.46.17.png/750px-Screen_shot_2012-08-25_at_10.46.17.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/15/Screen_shot_2012-08-25_at_10.46.17.png/1125px-Screen_shot_2012-08-25_at_10.46.17.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/15/Screen_shot_2012-08-25_at_10.46.17.png 2x"
width="750" height="482" alt="AWS login" />

  
Amazon's billing system requires phone verification. Once you have done
this, you'll get this confirmation screen:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/ee/Screen_shot_2012-08-25_at_10.46.48.png/750px-Screen_shot_2012-08-25_at_10.46.48.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/ee/Screen_shot_2012-08-25_at_10.46.48.png/1125px-Screen_shot_2012-08-25_at_10.46.48.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/ee/Screen_shot_2012-08-25_at_10.46.48.png 2x"
width="750" height="482" alt="AWS login" />

  

## Credit Where Credit's Due

If you have a voucher for free compute credit, you can apply it at
<a href="http://aws.amazon.com/awscredits" class="external free"
rel="nofollow">http://aws.amazon.com/awscredits</a>.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/cc/Screen_shot_2012-08-25_at_10.58.30.png/750px-Screen_shot_2012-08-25_at_10.58.30.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/cc/Screen_shot_2012-08-25_at_10.58.30.png/1125px-Screen_shot_2012-08-25_at_10.58.30.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/cc/Screen_shot_2012-08-25_at_10.58.30.png 2x"
width="750" height="482" alt="AWS credit applied - woohoo!" />

## Your First Instance

### Launch an Instance

Return to the
<a href="http://aws.amazon.com" class="external text" rel="nofollow">AWS
home page</a> (confusingly, the "sign up" link is still present and
there's no indication that you're logged in). Select the **AWS
Management Console** link under **My Account/Console**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/83/Screen_shot_2012-08-25_at_11.02.47.png/750px-Screen_shot_2012-08-25_at_11.02.47.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/83/Screen_shot_2012-08-25_at_11.02.47.png/1125px-Screen_shot_2012-08-25_at_11.02.47.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/83/Screen_shot_2012-08-25_at_11.02.47.png 2x"
width="750" height="482" alt="Accessing the console" />

  
This takes you to the console. Click on **EC2** to access cloud
computing services.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/29/Screen_shot_2012-08-25_at_11.03.24.png/750px-Screen_shot_2012-08-25_at_11.03.24.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/29/Screen_shot_2012-08-25_at_11.03.24.png/1125px-Screen_shot_2012-08-25_at_11.03.24.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/29/Screen_shot_2012-08-25_at_11.03.24.png 2x"
width="750" height="482" alt="Console screen" />

  
At present, GMOD in the Cloud 1.3 is only available in the US East area.
You may need to change the setting in the **Navigation** section on the
left.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/70/Screen_shot_2012-08-25_at_11.05.34.png/750px-Screen_shot_2012-08-25_at_11.05.34.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/70/Screen_shot_2012-08-25_at_11.05.34.png/1125px-Screen_shot_2012-08-25_at_11.05.34.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/70/Screen_shot_2012-08-25_at_11.05.34.png 2x"
width="750" height="482" alt="Regions" />

  
Once you have set the region, you can search for the AMI you want.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/82/Screen_shot_2012-08-25_at_11.24.57.png/750px-Screen_shot_2012-08-25_at_11.24.57.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/82/Screen_shot_2012-08-25_at_11.24.57.png/1125px-Screen_shot_2012-08-25_at_11.24.57.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/82/Screen_shot_2012-08-25_at_11.24.57.png 2x"
width="750" height="482" alt="Getting ready for launch" />

  
Click on **AMIs** in the left-hand menu to view or search for Amazon
Machine Images, AMIs. You can find the GMOD image by searching **public
images**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/b6/Screen_shot_2012-08-25_at_11.26.12.png/750px-Screen_shot_2012-08-25_at_11.26.12.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/b6/Screen_shot_2012-08-25_at_11.26.12.png/1125px-Screen_shot_2012-08-25_at_11.26.12.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b6/Screen_shot_2012-08-25_at_11.26.12.png 2x"
width="750" height="482" alt="Search public AMIs" />

  
A search for *gmod* brings up a number of AMIs; choose the most recent
GMOD in the Cloud image (1.3 as of August 2012).

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/89/Screen_shot_2012-08-25_at_11.27.32.png/750px-Screen_shot_2012-08-25_at_11.27.32.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/89/Screen_shot_2012-08-25_at_11.27.32.png/1125px-Screen_shot_2012-08-25_at_11.27.32.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/89/Screen_shot_2012-08-25_at_11.27.32.png 2x"
width="750" height="482" alt="Find your cloud" />

  
Right-clicking on the AMI of your choice brings up a contextual menu;
choose **Launch Instance** to create your instance.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/76/Screen_shot_2012-08-25_at_11.27.45.png/750px-Screen_shot_2012-08-25_at_11.27.45.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/76/Screen_shot_2012-08-25_at_11.27.45.png/1125px-Screen_shot_2012-08-25_at_11.27.45.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/76/Screen_shot_2012-08-25_at_11.27.45.png 2x"
width="750" height="482" alt="Context: launch!" />

  
There are a number of options for your instance. You can choose the
capabilities of your cloud computer; in this case, only the lowest spec
computer is available for users of the free services. The defaults are
fine for our purposes.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/92/Screen_shot_2012-08-25_at_11.28.43.png/750px-Screen_shot_2012-08-25_at_11.28.43.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/9/92/Screen_shot_2012-08-25_at_11.28.43.png/1125px-Screen_shot_2012-08-25_at_11.28.43.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/9/92/Screen_shot_2012-08-25_at_11.28.43.png 2x"
width="750" height="482" alt="AMI options, I" />

  
<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/4f/Screen_shot_2012-08-25_at_11.32.39.png/750px-Screen_shot_2012-08-25_at_11.32.39.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/4/4f/Screen_shot_2012-08-25_at_11.32.39.png/1125px-Screen_shot_2012-08-25_at_11.32.39.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/4/4f/Screen_shot_2012-08-25_at_11.32.39.png 2x"
width="750" height="482" alt="AMI options, II" />

  
You can add information for your instance in the form of key-value
pairs. Give your instance a name by adding 'Name' to the key field and
an appropriate name in the value field.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/cb/Screen_shot_2012-08-25_at_11.33.51.png/750px-Screen_shot_2012-08-25_at_11.33.51.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/cb/Screen_shot_2012-08-25_at_11.33.51.png/1125px-Screen_shot_2012-08-25_at_11.33.51.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/cb/Screen_shot_2012-08-25_at_11.33.51.png 2x"
width="750" height="482" alt="Name your AMI" />

  
To be able to access your AMI, you'll need to create a key pair. Choose
a key word and Amazon will generate a private key for you.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/51/Screen_shot_2012-08-25_at_11.34.27.png/750px-Screen_shot_2012-08-25_at_11.34.27.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/51/Screen_shot_2012-08-25_at_11.34.27.png/1125px-Screen_shot_2012-08-25_at_11.34.27.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/51/Screen_shot_2012-08-25_at_11.34.27.png 2x"
width="750" height="482" alt="Create a key pair" />

  
Save this to disk for later use.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1e/Screen_shot_2012-08-25_at_11.34.48.png/750px-Screen_shot_2012-08-25_at_11.34.48.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1e/Screen_shot_2012-08-25_at_11.34.48.png/1125px-Screen_shot_2012-08-25_at_11.34.48.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/1e/Screen_shot_2012-08-25_at_11.34.48.png 2x"
width="750" height="482" alt="Saving your private key" />

  
You can now configure the security options for your instance. These
settings will allow you to access the AMI using various protocols.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/68/Screen_shot_2012-08-25_at_11.35.42.png/750px-Screen_shot_2012-08-25_at_11.35.42.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/68/Screen_shot_2012-08-25_at_11.35.42.png/1125px-Screen_shot_2012-08-25_at_11.35.42.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/68/Screen_shot_2012-08-25_at_11.35.42.png 2x"
width="750" height="482" alt="Security!!" />

  
The default settings do not allow any access, but we want to use SSH
(secure shell) and HTTP (standard browser-based web protocol) to get
into our instance. To do this, create a new security group; give it a
name and a description.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/71/Screen_shot_2012-08-25_at_15.21.18.png/750px-Screen_shot_2012-08-25_at_15.21.18.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/71/Screen_shot_2012-08-25_at_15.21.18.png/1125px-Screen_shot_2012-08-25_at_15.21.18.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/71/Screen_shot_2012-08-25_at_15.21.18.png 2x"
width="750" height="482" alt="Adding a new security setting" />

  
You can then add the two kinds of connections that we want to allow.
Choose **SSH** from the drop-down menu. The **source** field dictates
the IP addresses that can contact the instance using SSH. Unless you
need to restrict access to certain IP addresses, this can be left as is.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/b5/Screen_shot_2012-08-25_at_15.21.35.png/750px-Screen_shot_2012-08-25_at_15.21.35.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/b5/Screen_shot_2012-08-25_at_15.21.35.png/1125px-Screen_shot_2012-08-25_at_15.21.35.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/b5/Screen_shot_2012-08-25_at_15.21.35.png 2x"
width="750" height="482" alt="Adding SSH access" />

  
Use **Add rule** to create another rule for HTTP access. Once again,
choose **HTTP** from the drop-down menu and leave the source field as it
is.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/2d/Screen_shot_2012-08-25_at_15.22.18.png/750px-Screen_shot_2012-08-25_at_15.22.18.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/2d/Screen_shot_2012-08-25_at_15.22.18.png/1125px-Screen_shot_2012-08-25_at_15.22.18.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/2d/Screen_shot_2012-08-25_at_15.22.18.png 2x"
width="750" height="482" alt="Adding HTTP access" />

  
With the security settings done, we can check over our options; if all
looks well, click launch!

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/30/Screen_shot_2012-08-25_at_11.36.06.png/750px-Screen_shot_2012-08-25_at_11.36.06.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/30/Screen_shot_2012-08-25_at_11.36.06.png/1125px-Screen_shot_2012-08-25_at_11.36.06.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/30/Screen_shot_2012-08-25_at_11.36.06.png 2x"
width="750" height="482" alt="Are we finally ready to go?" />

  
Houston, we have blast off!

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/23/Screen_shot_2012-08-25_at_11.36.25.png/750px-Screen_shot_2012-08-25_at_11.36.25.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/23/Screen_shot_2012-08-25_at_11.36.25.png/1125px-Screen_shot_2012-08-25_at_11.36.25.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/23/Screen_shot_2012-08-25_at_11.36.25.png 2x"
width="750" height="482" alt="Blast off!" />

### Setting Up Security Post-Launch

AMI also allows you to set the security and access options for your
instances after you've launched them (security settings can be changed
on the fly). We want to set up GMOD in the cloud for SSH and HTTP access
(for securely accessing the instance and for web access). Click on
**Security Groups**, highlight the default security setting, and click
on **Incoming** to view the connections that are allowed. The default
settings are very restrictive, with no incoming HTTP or SSH connections
permitted.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/eb/Screen_shot_2012-08-25_at_11.37.35.png/750px-Screen_shot_2012-08-25_at_11.37.35.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/eb/Screen_shot_2012-08-25_at_11.37.35.png/1125px-Screen_shot_2012-08-25_at_11.37.35.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/eb/Screen_shot_2012-08-25_at_11.37.35.png 2x"
width="750" height="482" alt="Setting securities" />

  
Add SSH access by choosing **SSH** from the dropdown menu. Do not
specify the source unless you wish to limit the IP addresses from which
you can ssh to your instance. Click **Add rule**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/24/Screen_shot_2012-08-25_at_11.38.51.png/750px-Screen_shot_2012-08-25_at_11.38.51.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/24/Screen_shot_2012-08-25_at_11.38.51.png/1125px-Screen_shot_2012-08-25_at_11.38.51.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/24/Screen_shot_2012-08-25_at_11.38.51.png 2x"
width="750" height="482" alt="Adding ssh" />

  
We also need to access the instance by http (i.e. using a web browser).
Add this rule by choosing **HTTP** from the dropdown menu and leaving
the source blank. Click **Apply rule changes** to save these rules.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/bb/Screen_shot_2012-08-25_at_11.39.40.png/750px-Screen_shot_2012-08-25_at_11.39.40.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/bb/Screen_shot_2012-08-25_at_11.39.40.png/1125px-Screen_shot_2012-08-25_at_11.39.40.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/bb/Screen_shot_2012-08-25_at_11.39.40.png 2x"
width="750" height="482" alt="Adding and saving changes" />

## Working in the Cloud

### Instance Access

We can now test out our instance. Clicking on **Instances** shows us the
list of all the instances we have running.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/25/Screen_shot_2012-08-25_at_11.40.52.png/750px-Screen_shot_2012-08-25_at_11.40.52.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/2/25/Screen_shot_2012-08-25_at_11.40.52.png/1125px-Screen_shot_2012-08-25_at_11.40.52.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/25/Screen_shot_2012-08-25_at_11.40.52.png 2x"
width="750" height="482" alt="Instances window" />

  
Go to the instance and right-click to bring up a contextual menu. Choose
**Connect**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f5/Screen_shot_2012-08-25_at_11.41.56.png/750px-Screen_shot_2012-08-25_at_11.41.56.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/f/f5/Screen_shot_2012-08-25_at_11.41.56.png/1125px-Screen_shot_2012-08-25_at_11.41.56.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/f/f5/Screen_shot_2012-08-25_at_11.41.56.png 2x"
width="750" height="482" alt="Contextual menu for the instance" />

  
We can test the HTTP connection using the information from the dialogue
box that comes up. Copy the public DNS address, found under the open
heading **Connect from your browser using the Java SSH Client (Java
Required)**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/02/Screen_shot_2012-08-25_at_11.42.44.png/750px-Screen_shot_2012-08-25_at_11.42.44.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/02/Screen_shot_2012-08-25_at_11.42.44.png/1125px-Screen_shot_2012-08-25_at_11.42.44.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/02/Screen_shot_2012-08-25_at_11.42.44.png 2x"
width="750" height="482" alt="Getting the DNS address" />

  
Open that address in a new browser window. If everything has gone
correctly, you should see the following screen:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1f/Screen_shot_2012-08-25_at_11.43.52.png/750px-Screen_shot_2012-08-25_at_11.43.52.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/1f/Screen_shot_2012-08-25_at_11.43.52.png/1125px-Screen_shot_2012-08-25_at_11.43.52.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/1f/Screen_shot_2012-08-25_at_11.43.52.png 2x"
width="750" height="482" alt="GMOD in the Cloud... it worked!!" />

  
Now let's check the SSH connection. You can do this through your browser
using the built-in Java client. You will need to change the user name to
**ubuntu** and set the private key path to the location where you saved
the private key that was generated earlier. Click **Launch SSH Client**
to get connected.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/ce/Screen_shot_2012-08-25_at_11.50.53.png/750px-Screen_shot_2012-08-25_at_11.50.53.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/ce/Screen_shot_2012-08-25_at_11.50.53.png/1125px-Screen_shot_2012-08-25_at_11.50.53.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/ce/Screen_shot_2012-08-25_at_11.50.53.png 2x"
width="750" height="482" alt="Browser-based SSH" />

  
Most bioinformaticists worth their salt prefer a nice command line
option, so click on **Connect with a standalone SSH client** to view the
connection information. The first task is to change the file access
permissions on the downloaded private key file.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/cf/Screen_shot_2012-08-25_at_11.57.05.png/750px-Screen_shot_2012-08-25_at_11.57.05.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/cf/Screen_shot_2012-08-25_at_11.57.05.png/1125px-Screen_shot_2012-08-25_at_11.57.05.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/cf/Screen_shot_2012-08-25_at_11.57.05.png 2x"
width="750" height="482" alt="Changing key file permissions" />

  
As with the Java browser-based SSH client, you'll need to change the
user name from **root** to **ubuntu**. Copy the command given,
substituting in the correct path to your private key file and the user
name **ubuntu**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e9/Screen_shot_2012-08-25_at_11.57.18.png/750px-Screen_shot_2012-08-25_at_11.57.18.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/e/e9/Screen_shot_2012-08-25_at_11.57.18.png/1125px-Screen_shot_2012-08-25_at_11.57.18.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/e/e9/Screen_shot_2012-08-25_at_11.57.18.png 2x"
width="750" height="482" alt="Command line command" />

  
If all goes well, you should log in to the server and get a welcome
message:

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/07/Screen_shot_2012-08-25_at_11.48.56.png/750px-Screen_shot_2012-08-25_at_11.48.56.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/0/07/Screen_shot_2012-08-25_at_11.48.56.png/1125px-Screen_shot_2012-08-25_at_11.48.56.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/0/07/Screen_shot_2012-08-25_at_11.48.56.png 2x"
width="750" height="482" alt="Logged in!" />

  

## Leaving the Cloud

Now that the instance is up and running, what can we do with it? Let's
shut it down again! This can be achieved in a number of different ways,
depending on what we want to happen to the server once we've stopped it.

**Stop** an instance: instance shuts down; changes are saved; instance
stays in list of instances.

**Terminate** an instance: instance shuts down; changes discarded;
instance removed from list of instances.

Using `sudo /sbin/shudown`: depends on the configuration; for GMOD in
the Cloud, the default is the **stop** behaviour above.

Unless you have a reserved IP address for your instance, you will lose
the IP address associated with your GMOD in the Cloud installation when
you stop the machine.

  

### Shutting Down

To stop an instance from the command line, type the following:

     sudo /sbin/shutdown now

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/50/Screen_shot_2012-08-25_at_11.59.27.png/750px-Screen_shot_2012-08-25_at_11.59.27.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/50/Screen_shot_2012-08-25_at_11.59.27.png/1125px-Screen_shot_2012-08-25_at_11.59.27.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/50/Screen_shot_2012-08-25_at_11.59.27.png 2x"
width="750" height="482" alt="Shut down" />

  
Your instance will start shutting down and your connection with be
terminated.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/60/Screen_shot_2012-08-25_at_11.59.40.png/750px-Screen_shot_2012-08-25_at_11.59.40.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/6/60/Screen_shot_2012-08-25_at_11.59.40.png/1125px-Screen_shot_2012-08-25_at_11.59.40.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/6/60/Screen_shot_2012-08-25_at_11.59.40.png 2x"
width="750" height="482" alt="Terminating..." />

  
If you return to the **Instances** window in your browser, your instance
will change to the status **stopped**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/36/Screen_shot_2012-08-25_at_12.40.52.png/750px-Screen_shot_2012-08-25_at_12.40.52.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/3/36/Screen_shot_2012-08-25_at_12.40.52.png/1125px-Screen_shot_2012-08-25_at_12.40.52.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/36/Screen_shot_2012-08-25_at_12.40.52.png 2x"
width="750" height="482" alt="Instance stopped" />

### Volume Deletion

Every GMOD in the Cloud instance uses two volumes (disks), one for
applications and the other for data.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/ba/16.55.png/750px-16.55.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/b/ba/16.55.png/1125px-16.55.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/b/ba/16.55.png 2x"
width="750" height="409" alt="Volumes with a running machine" />

  
As these screenshot suggest, only the **Root** volume is deleted when
you shut down your AMI.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/8/86/12.40.png/750px-12.40.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/86/12.40.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/8/86/12.40.png 2x"
width="750" height="520" alt="Volume setup" />

  
Amazon charges for data storage, so unless you need to keep the data on
the Amazon servers, it is best to transfer the data elsewhere and delete
the volume.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/73/16.58.56.png/750px-16.58.56.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/73/16.58.56.png/1125px-16.58.56.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/73/16.58.56.png 2x"
width="750" height="409" alt="Terminate dialog box" />

  
Terminate your instance by choosing **Terminate** from **Instance
Actions** or by right-/command-clicking on the instance name and
selecting **Terminate** from the menu.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/76/16.59.17.png/750px-16.59.17.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/7/76/16.59.17.png/1125px-16.59.17.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/7/76/16.59.17.png 2x"
width="750" height="409" alt="Termination..." />

  
When the instance has terminated, click on **Volumes**. The Root volume
has been deleted but EBS volume remains. Its status is available as it
is no longer in use by the instance.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/5a/17.00.13.png/750px-17.00.13.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/5/5a/17.00.13.png/1125px-17.00.13.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/5/5a/17.00.13.png 2x"
width="750" height="409" alt="Volume remaining" />

  
To delete the volume, select it and either choose **Delete volume** or
right-/command-click on the volume name and select **Delete**.

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/cb/17.00.22.png/750px-17.00.22.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/c/cb/17.00.22.png/1125px-17.00.22.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/c/cb/17.00.22.png 2x"
width="750" height="409" alt="Deletion" />

  
All done!

<img
src="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/18/17.04.00.png/750px-17.04.00.png"
srcset="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/thumb/1/18/17.04.00.png/1125px-17.04.00.png 1.5x, https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/1/18/17.04.00.png 2x"
width="750" height="409" alt="Tabula rasa" />

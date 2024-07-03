<div id="mw-page-base" class="noprint">

</div>

<div id="mw-head-base" class="noprint">

</div>

<div id="content" class="mw-body" role="main">

<span id="top"></span>

<div id="mw-js-message" style="display:none;">

</div>



# <span dir="auto">GMOD Cloud Tutorial</span>

<div id="bodyContent">

<div id="siteSub">

From GMOD

</div>

<div id="contentSub">

</div>

<div id="jump-to-nav" class="mw-jump">

Jump to: [navigation](#mw-navigation), [search](#p-search)

</div>

<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">

See also the [AWS walkthrough](AWS_walkthrough "AWS walkthrough"), a
screenshot guide to registering with Amazon Web Services, setting up a
GMOD in the Cloud instance, connecting to it using SSH, and shutting
down.

  

<div id="toc" class="toc">

<div id="toctitle">

## Contents

</div>

- [<span class="tocnumber">1</span> <span class="toctext">Amazon Web
  Services</span>](#Amazon_Web_Services)
- [<span class="tocnumber">2</span> <span class="toctext">Amazon Web
  Services: Registration</span>](#Amazon_Web_Services:_Registration)
- [<span class="tocnumber">3</span> <span class="toctext">Credit Where
  Credit's Due</span>](#Credit_Where_Credit.27s_Due)
- [<span class="tocnumber">4</span> <span class="toctext">Finding and
  Starting a GMOD Cloud
  AMI</span>](#Finding_and_Starting_a_GMOD_Cloud_AMI)
  - [<span class="tocnumber">4.1</span> <span class="toctext">Launch an
    Instance</span>](#Launch_an_Instance)
  - [<span class="tocnumber">4.2</span> <span class="toctext">Directory
    Structure</span>](#Directory_Structure)
- [<span class="tocnumber">5</span> <span class="toctext">Interacting
  with the Server</span>](#Interacting_with_the_Server)
  - [<span class="tocnumber">5.1</span> <span class="toctext">Logging
    in</span>](#Logging_in)
  - [<span class="tocnumber">5.2</span> <span class="toctext">Instance
    Access</span>](#Instance_Access)
  - [<span class="tocnumber">5.3</span> <span class="toctext">Resizing
    your data partition</span>](#Resizing_your_data_partition)
- [<span class="tocnumber">6</span> <span class="toctext">Working with
  the GMOD Software on the
  Server</span>](#Working_with_the_GMOD_Software_on_the_Server)
  - [<span class="tocnumber">6.1</span> <span class="toctext">Loading
    Data into Chado</span>](#Loading_Data_into_Chado)
  - [<span class="tocnumber">6.2</span>
    <span class="toctext">Configuring
    GBrowse</span>](#Configuring_GBrowse)
  - [<span class="tocnumber">6.3</span> <span class="toctext">Getting
    Data into JBrowse</span>](#Getting_Data_into_JBrowse)
  - [<span class="tocnumber">6.4</span>
    <span class="toctext">Configuring
    Tripal</span>](#Configuring_Tripal)
- [<span class="tocnumber">7</span> <span class="toctext">Leaving the
  Cloud</span>](#Leaving_the_Cloud)
  - [<span class="tocnumber">7.1</span> <span class="toctext">Shutting
    Down</span>](#Shutting_Down)
  - [<span class="tocnumber">7.2</span> <span class="toctext">Getting
    your data off the Cloud</span>](#Getting_your_data_off_the_Cloud)
  - [<span class="tocnumber">7.3</span> <span class="toctext">Volume
    Deletion</span>](#Volume_Deletion)

</div>

## <span id="Amazon_Web_Services" class="mw-headline">Amazon Web Services</span>

Amazon has a set of guides for
<a href="http://aws.amazon.com/documentation/gettingstarted/"
class="external text" rel="nofollow">getting started with Amazon Web
Services</a>. At a minimum, we recommend reading <a
href="http://docs.amazonwebservices.com/gettingstarted/latest/awsgsg-intro"
class="external text" rel="nofollow">Getting Started with AWS</a> and <a
href="http://docs.amazonwebservices.com/gettingstarted/latest/awsgsg-freetier/"
class="external text" rel="nofollow">Getting Started with AWS Free Usage
Tier</a>.

You will need to create an AWS account, regardless of whether you
already have an Amazon account. The following screenshots take you
through the registration process step by step.

[Skip down to the next section](#Finding_and_Starting_a_GMOD_Cloud_AMI)

## <span id="Amazon_Web_Services:_Registration" class="mw-headline">Amazon Web Services: Registration</span>

Start off at <a href="http://aws.amazon.com" class="external text"
rel="nofollow">aws.amazon.com</a>

<a href="File:Screen_shot_2012-08-25_at_10.38.41.png" class="image"
title="Amazon Web Services welcome screen"><img
src="../mediawiki/images/thumb/9/98/Screen_shot_2012-08-25_at_10.38.41.png/750px-Screen_shot_2012-08-25_at_10.38.41.png"
srcset="../mediawiki/images/thumb/9/98/Screen_shot_2012-08-25_at_10.38.41.png/1125px-Screen_shot_2012-08-25_at_10.38.41.png 1.5x, ../mediawiki/images/9/98/Screen_shot_2012-08-25_at_10.38.41.png 2x"
width="750" height="482" alt="Amazon Web Services welcome screen" /></a>

  
Log in with your regular Amazon account (if you don't have an Amazon
account, you'll need to create one)

<a href="File:Screen_shot_2012-08-25_at_10.39.02.png" class="image"
title="Amazon Web Services login"><img
src="../mediawiki/images/thumb/f/f7/Screen_shot_2012-08-25_at_10.39.02.png/750px-Screen_shot_2012-08-25_at_10.39.02.png"
srcset="../mediawiki/images/thumb/f/f7/Screen_shot_2012-08-25_at_10.39.02.png/1125px-Screen_shot_2012-08-25_at_10.39.02.png 1.5x, ../mediawiki/images/f/f7/Screen_shot_2012-08-25_at_10.39.02.png 2x"
width="750" height="482" alt="Amazon Web Services login" /></a>

  
Theoretically Amazon already knows this stuff, but you have to enter it
all again...

<a href="File:Screen_shot_2012-08-25_at_10.40.59.png" class="image"
title="AWS login"><img
src="../mediawiki/images/thumb/e/eb/Screen_shot_2012-08-25_at_10.40.59.png/750px-Screen_shot_2012-08-25_at_10.40.59.png"
srcset="../mediawiki/images/thumb/e/eb/Screen_shot_2012-08-25_at_10.40.59.png/1125px-Screen_shot_2012-08-25_at_10.40.59.png 1.5x, ../mediawiki/images/e/eb/Screen_shot_2012-08-25_at_10.40.59.png 2x"
width="750" height="482" alt="AWS login" /></a>

  
You'll need to enter your credit card information to pay for your cloud
usage; GMOD has a grant from AWS to allow users a certain amount of
compute credit.

<a href="File:Screen_shot_2012-08-25_at_10.46.17.png" class="image"
title="AWS login"><img
src="../mediawiki/images/thumb/1/15/Screen_shot_2012-08-25_at_10.46.17.png/750px-Screen_shot_2012-08-25_at_10.46.17.png"
srcset="../mediawiki/images/thumb/1/15/Screen_shot_2012-08-25_at_10.46.17.png/1125px-Screen_shot_2012-08-25_at_10.46.17.png 1.5x, ../mediawiki/images/1/15/Screen_shot_2012-08-25_at_10.46.17.png 2x"
width="750" height="482" alt="AWS login" /></a>

  
Amazon's billing system requires phone verification. Once you have done
this, you'll get this confirmation screen:

<a href="File:Screen_shot_2012-08-25_at_10.46.48.png" class="image"
title="AWS login"><img
src="../mediawiki/images/thumb/e/ee/Screen_shot_2012-08-25_at_10.46.48.png/750px-Screen_shot_2012-08-25_at_10.46.48.png"
srcset="../mediawiki/images/thumb/e/ee/Screen_shot_2012-08-25_at_10.46.48.png/1125px-Screen_shot_2012-08-25_at_10.46.48.png 1.5x, ../mediawiki/images/e/ee/Screen_shot_2012-08-25_at_10.46.48.png 2x"
width="750" height="482" alt="AWS login" /></a>

  

## <span id="Credit_Where_Credit.27s_Due" class="mw-headline">Credit Where Credit's Due</span>

If you have a voucher for free compute credit, you can apply it at
<a href="http://aws.amazon.com/awscredits" class="external free"
rel="nofollow">http://aws.amazon.com/awscredits</a>.

<a href="File:Screen_shot_2012-08-25_at_10.58.30.png" class="image"
title="AWS credit applied - woohoo!"><img
src="../mediawiki/images/thumb/c/cc/Screen_shot_2012-08-25_at_10.58.30.png/750px-Screen_shot_2012-08-25_at_10.58.30.png"
srcset="../mediawiki/images/thumb/c/cc/Screen_shot_2012-08-25_at_10.58.30.png/1125px-Screen_shot_2012-08-25_at_10.58.30.png 1.5x, ../mediawiki/images/c/cc/Screen_shot_2012-08-25_at_10.58.30.png 2x"
width="750" height="482" alt="AWS credit applied - woohoo!" /></a>

  

## <span id="Finding_and_Starting_a_GMOD_Cloud_AMI" class="mw-headline">Finding and Starting a GMOD Cloud AMI</span>

The next job is to find and launch a GMOD in the Cloud instance. The
current GMOD in the Cloud instance is as follows:

- Amazon AMI ID: ami-a9d7f9c0 (in the US East-Virgina zone);
- Name: **GMOD in the Cloud 2.05**

(as of December 16, 2013)

Read on for text instructions, [skip down to the screenshot
guide](#Starting_Your_Instance), or [skip to the next
section](#Directory_Structure).

To find it in Amazon's management page, go to **AMIs** section under
**Images** in the EC2 Management Console. Search public images for that
ID or "GMOD in the Cloud" and right or control click on the most recent
version. This will bring up a menu; select **launch image** from this
menu. You will be presented with a pop up window to configure the image.
You can accept all of the defaults unless you really want a more
powerful machine. If not, select the "micro" instance, which, if you
don't have any other micro instances available, and you're still new to
AWS, will be free for a year. For a more powerful machine, select
something else. Press continue.

In the next window, you should be able to accept all of the defaults.
Press continue.

In the next window, you might want to give your instance a name so you
can easily identify it later. You could try something like "first GMOD
in the Cloud instance". Press continue.

In the next window, you are asked to provide or create a key pair so
that you may remotely log in. If you don't already have one, select
**Create key pair**. Give it a name and down load the key pair. Remember
where you downloaded it to, because you'll need it later to log into
your machine. Press continue.

Next you'll be asked to configure the firewall. You'll need access on
ports 22 (ssh) and 80 (http) If there is a "default" option, you can
probably accept it. If not, select **Create new security group** and
select **SSH** and **HTTP** from the drop down list, clicking "add rule"
for each. Give it a useful name like "default". Press continue and close
until your instance gets created.

### <span id="Launch_an_Instance" class="mw-headline">Launch an Instance</span>

Return to the
<a href="http://aws.amazon.com" class="external text" rel="nofollow">AWS
home page</a> (confusingly, the "sign up" link is still present and
there's no indication that you're logged in). Select the **AWS
Management Console** link under **My Account/Console**.

<a href="File:Screen_shot_2012-08-25_at_11.02.47.png" class="image"
title="Accessing the console"><img
src="../mediawiki/images/thumb/8/83/Screen_shot_2012-08-25_at_11.02.47.png/750px-Screen_shot_2012-08-25_at_11.02.47.png"
srcset="../mediawiki/images/thumb/8/83/Screen_shot_2012-08-25_at_11.02.47.png/1125px-Screen_shot_2012-08-25_at_11.02.47.png 1.5x, ../mediawiki/images/8/83/Screen_shot_2012-08-25_at_11.02.47.png 2x"
width="750" height="482" alt="Accessing the console" /></a>

  
This takes you to the console. Click on **EC2** to access cloud
computing services.

<a href="File:Screen_shot_2012-08-25_at_11.03.24.png" class="image"
title="Console screen"><img
src="../mediawiki/images/thumb/2/29/Screen_shot_2012-08-25_at_11.03.24.png/750px-Screen_shot_2012-08-25_at_11.03.24.png"
srcset="../mediawiki/images/thumb/2/29/Screen_shot_2012-08-25_at_11.03.24.png/1125px-Screen_shot_2012-08-25_at_11.03.24.png 1.5x, ../mediawiki/images/2/29/Screen_shot_2012-08-25_at_11.03.24.png 2x"
width="750" height="482" alt="Console screen" /></a>

  
At present, GMOD in the Cloud 1.3 is only available in the US East area.
You may need to change the setting in the **Navigation** section on the
left.

<a href="File:Screen_shot_2012-08-25_at_11.05.34.png" class="image"
title="Regions"><img
src="../mediawiki/images/thumb/7/70/Screen_shot_2012-08-25_at_11.05.34.png/750px-Screen_shot_2012-08-25_at_11.05.34.png"
srcset="../mediawiki/images/thumb/7/70/Screen_shot_2012-08-25_at_11.05.34.png/1125px-Screen_shot_2012-08-25_at_11.05.34.png 1.5x, ../mediawiki/images/7/70/Screen_shot_2012-08-25_at_11.05.34.png 2x"
width="750" height="482" alt="Regions" /></a>

  
Once you have set the region, you can search for the AMI you want.

<a href="File:Screen_shot_2012-08-25_at_11.24.57.png" class="image"
title="Getting ready for launch"><img
src="../mediawiki/images/thumb/8/82/Screen_shot_2012-08-25_at_11.24.57.png/750px-Screen_shot_2012-08-25_at_11.24.57.png"
srcset="../mediawiki/images/thumb/8/82/Screen_shot_2012-08-25_at_11.24.57.png/1125px-Screen_shot_2012-08-25_at_11.24.57.png 1.5x, ../mediawiki/images/8/82/Screen_shot_2012-08-25_at_11.24.57.png 2x"
width="750" height="482" alt="Getting ready for launch" /></a>

  
Click on **AMIs** in the left-hand menu to view or search for Amazon
Machine Images, AMIs. You can find the GMOD image by searching **public
images**.

<a href="File:Screen_shot_2012-08-25_at_11.26.12.png" class="image"
title="Search public AMIs"><img
src="../mediawiki/images/thumb/b/b6/Screen_shot_2012-08-25_at_11.26.12.png/750px-Screen_shot_2012-08-25_at_11.26.12.png"
srcset="../mediawiki/images/thumb/b/b6/Screen_shot_2012-08-25_at_11.26.12.png/1125px-Screen_shot_2012-08-25_at_11.26.12.png 1.5x, ../mediawiki/images/b/b6/Screen_shot_2012-08-25_at_11.26.12.png 2x"
width="750" height="482" alt="Search public AMIs" /></a>

  
A search for *gmod* brings up a number of AMIs; choose the most recent
GMOD in the Cloud image (1.3 as of August 2012).

<a href="File:Screen_shot_2012-08-25_at_11.27.32.png" class="image"
title="Find your cloud"><img
src="../mediawiki/images/thumb/8/89/Screen_shot_2012-08-25_at_11.27.32.png/750px-Screen_shot_2012-08-25_at_11.27.32.png"
srcset="../mediawiki/images/thumb/8/89/Screen_shot_2012-08-25_at_11.27.32.png/1125px-Screen_shot_2012-08-25_at_11.27.32.png 1.5x, ../mediawiki/images/8/89/Screen_shot_2012-08-25_at_11.27.32.png 2x"
width="750" height="482" alt="Find your cloud" /></a>

  
Right-clicking on the AMI of your choice brings up a contextual menu;
choose **Launch Instance** to create your instance.

<a href="File:Screen_shot_2012-08-25_at_11.27.45.png" class="image"
title="Context: launch!"><img
src="../mediawiki/images/thumb/7/76/Screen_shot_2012-08-25_at_11.27.45.png/750px-Screen_shot_2012-08-25_at_11.27.45.png"
srcset="../mediawiki/images/thumb/7/76/Screen_shot_2012-08-25_at_11.27.45.png/1125px-Screen_shot_2012-08-25_at_11.27.45.png 1.5x, ../mediawiki/images/7/76/Screen_shot_2012-08-25_at_11.27.45.png 2x"
width="750" height="482" alt="Context: launch!" /></a>

  
There are a number of options for your instance. You can choose the
capabilities of your cloud computer; in this case, only the lowest spec
computer is available for users of the free services. The defaults are
fine for our purposes.

<a href="File:Screen_shot_2012-08-25_at_11.28.43.png" class="image"
title="AMI options, I"><img
src="../mediawiki/images/thumb/9/92/Screen_shot_2012-08-25_at_11.28.43.png/750px-Screen_shot_2012-08-25_at_11.28.43.png"
srcset="../mediawiki/images/thumb/9/92/Screen_shot_2012-08-25_at_11.28.43.png/1125px-Screen_shot_2012-08-25_at_11.28.43.png 1.5x, ../mediawiki/images/9/92/Screen_shot_2012-08-25_at_11.28.43.png 2x"
width="750" height="482" alt="AMI options, I" /></a>

  
<a href="File:Screen_shot_2012-08-25_at_11.32.39.png" class="image"
title="AMI options, II"><img
src="../mediawiki/images/thumb/4/4f/Screen_shot_2012-08-25_at_11.32.39.png/750px-Screen_shot_2012-08-25_at_11.32.39.png"
srcset="../mediawiki/images/thumb/4/4f/Screen_shot_2012-08-25_at_11.32.39.png/1125px-Screen_shot_2012-08-25_at_11.32.39.png 1.5x, ../mediawiki/images/4/4f/Screen_shot_2012-08-25_at_11.32.39.png 2x"
width="750" height="482" alt="AMI options, II" /></a>

  
You can add information for your instance in the form of key-value
pairs. Give your instance a name by adding 'Name' to the key field and
an appropriate name in the value field.

<a href="File:Screen_shot_2012-08-25_at_11.33.51.png" class="image"
title="Name your AMI"><img
src="../mediawiki/images/thumb/c/cb/Screen_shot_2012-08-25_at_11.33.51.png/750px-Screen_shot_2012-08-25_at_11.33.51.png"
srcset="../mediawiki/images/thumb/c/cb/Screen_shot_2012-08-25_at_11.33.51.png/1125px-Screen_shot_2012-08-25_at_11.33.51.png 1.5x, ../mediawiki/images/c/cb/Screen_shot_2012-08-25_at_11.33.51.png 2x"
width="750" height="482" alt="Name your AMI" /></a>

  
To be able to access your AMI, you'll need to create a key pair. Choose
a key word and Amazon will generate a private key for you.

<a href="File:Screen_shot_2012-08-25_at_11.34.27.png" class="image"
title="Create a key pair"><img
src="../mediawiki/images/thumb/5/51/Screen_shot_2012-08-25_at_11.34.27.png/750px-Screen_shot_2012-08-25_at_11.34.27.png"
srcset="../mediawiki/images/thumb/5/51/Screen_shot_2012-08-25_at_11.34.27.png/1125px-Screen_shot_2012-08-25_at_11.34.27.png 1.5x, ../mediawiki/images/5/51/Screen_shot_2012-08-25_at_11.34.27.png 2x"
width="750" height="482" alt="Create a key pair" /></a>

  
Save this to disk for later use.

<a href="File:Screen_shot_2012-08-25_at_11.34.48.png" class="image"
title="Saving your private key"><img
src="../mediawiki/images/thumb/1/1e/Screen_shot_2012-08-25_at_11.34.48.png/750px-Screen_shot_2012-08-25_at_11.34.48.png"
srcset="../mediawiki/images/thumb/1/1e/Screen_shot_2012-08-25_at_11.34.48.png/1125px-Screen_shot_2012-08-25_at_11.34.48.png 1.5x, ../mediawiki/images/1/1e/Screen_shot_2012-08-25_at_11.34.48.png 2x"
width="750" height="482" alt="Saving your private key" /></a>

  
You can now configure the security options for your instance. These
settings will allow you to access the AMI using various protocols.

<a href="File:Screen_shot_2012-08-25_at_11.35.42.png" class="image"
title="Security!!"><img
src="../mediawiki/images/thumb/6/68/Screen_shot_2012-08-25_at_11.35.42.png/750px-Screen_shot_2012-08-25_at_11.35.42.png"
srcset="../mediawiki/images/thumb/6/68/Screen_shot_2012-08-25_at_11.35.42.png/1125px-Screen_shot_2012-08-25_at_11.35.42.png 1.5x, ../mediawiki/images/6/68/Screen_shot_2012-08-25_at_11.35.42.png 2x"
width="750" height="482" alt="Security!!" /></a>

  
The default settings do not allow any access, but we want to use SSH
(secure shell) and HTTP (standard browser-based web protocol) to get
into our instance. To do this, create a new security group; give it a
name and a description.

<a href="File:Screen_shot_2012-08-25_at_15.21.18.png" class="image"
title="Adding a new security setting"><img
src="../mediawiki/images/thumb/7/71/Screen_shot_2012-08-25_at_15.21.18.png/750px-Screen_shot_2012-08-25_at_15.21.18.png"
srcset="../mediawiki/images/thumb/7/71/Screen_shot_2012-08-25_at_15.21.18.png/1125px-Screen_shot_2012-08-25_at_15.21.18.png 1.5x, ../mediawiki/images/7/71/Screen_shot_2012-08-25_at_15.21.18.png 2x"
width="750" height="482" alt="Adding a new security setting" /></a>

  
You can then add the two kinds of connections that we want to allow.
Choose **SSH** from the drop-down menu. The **source** field dictates
the IP addresses that can contact the instance using SSH. Unless you
need to restrict access to certain IP addresses, this can be left as is.

<a href="File:Screen_shot_2012-08-25_at_15.21.35.png" class="image"
title="Adding SSH access"><img
src="../mediawiki/images/thumb/b/b5/Screen_shot_2012-08-25_at_15.21.35.png/750px-Screen_shot_2012-08-25_at_15.21.35.png"
srcset="../mediawiki/images/thumb/b/b5/Screen_shot_2012-08-25_at_15.21.35.png/1125px-Screen_shot_2012-08-25_at_15.21.35.png 1.5x, ../mediawiki/images/b/b5/Screen_shot_2012-08-25_at_15.21.35.png 2x"
width="750" height="482" alt="Adding SSH access" /></a>

  
Use **Add rule** to create another rule for HTTP access. Once again,
choose **HTTP** from the drop-down menu and leave the source field as it
is.

<a href="File:Screen_shot_2012-08-25_at_15.22.18.png" class="image"
title="Adding HTTP access"><img
src="../mediawiki/images/thumb/2/2d/Screen_shot_2012-08-25_at_15.22.18.png/750px-Screen_shot_2012-08-25_at_15.22.18.png"
srcset="../mediawiki/images/thumb/2/2d/Screen_shot_2012-08-25_at_15.22.18.png/1125px-Screen_shot_2012-08-25_at_15.22.18.png 1.5x, ../mediawiki/images/2/2d/Screen_shot_2012-08-25_at_15.22.18.png 2x"
width="750" height="482" alt="Adding HTTP access" /></a>

  
With the security settings done, we can check over our options; if all
looks well, click launch!

<a href="File:Screen_shot_2012-08-25_at_11.36.06.png" class="image"
title="Are we finally ready to go?"><img
src="../mediawiki/images/thumb/3/30/Screen_shot_2012-08-25_at_11.36.06.png/750px-Screen_shot_2012-08-25_at_11.36.06.png"
srcset="../mediawiki/images/thumb/3/30/Screen_shot_2012-08-25_at_11.36.06.png/1125px-Screen_shot_2012-08-25_at_11.36.06.png 1.5x, ../mediawiki/images/3/30/Screen_shot_2012-08-25_at_11.36.06.png 2x"
width="750" height="482" alt="Are we finally ready to go?" /></a>

  
Houston, we have blast off!

<a href="File:Screen_shot_2012-08-25_at_11.36.25.png" class="image"
title="Blast off!"><img
src="../mediawiki/images/thumb/2/23/Screen_shot_2012-08-25_at_11.36.25.png/750px-Screen_shot_2012-08-25_at_11.36.25.png"
srcset="../mediawiki/images/thumb/2/23/Screen_shot_2012-08-25_at_11.36.25.png/1125px-Screen_shot_2012-08-25_at_11.36.25.png 1.5x, ../mediawiki/images/2/23/Screen_shot_2012-08-25_at_11.36.25.png 2x"
width="750" height="482" alt="Blast off!" /></a>

### <span id="Directory_Structure" class="mw-headline">Directory Structure</span>

When you log into your GMOD Cloud instance, you will be in the ubuntu
user's home directory, /home/ubuntu, which is part of the root partition
of the machine, and so, if you save anything in this directory, it will
be deleted when you move to a new version of the GMOD Cloud. To save
items from one machine to the next, it must be saved on your EBS
partition, and to make that easier from the home directory, we've put in
a link to the /data partition in the home directory named "dataHome", so
you can "cd /home/ubuntu/dataHome" or "cd ~/dataHome" to save files in a
convenient spot relative to your home directory. Already in this
dataHome directory is a file called "bashrc" which is automatically
included in your .bashrc when you log in, so if you have changes you'd
like to make to your shell environment, you can add those changes here.

There are several other directories that are on the /data partition so
they will be saved when you go to a new instance as well. These are:

|  |  |
|----|----|
| /data/etc/gbrowse | The config directory for GBrowse. |
| /data/etc/postgresql | The config directory for PostgreSQL |
| /data/opt | A good place to install any other software you want to use |
| /data/var/lib/gbrowse | Other GBrowse files that might be modifed on your instance, including user session data and flat file databases. |
| /data/var/lib/postgresql | Files for the PostgreSQL database |
| /data/var/www/.htaccess | The htaccess file for the main Drupal site |
| /data/var/www/jbrowse/data | All of the data files needed for running JBrowse |
| /data/var/www/sites/default | Site-specific files and directories for Drupal; modules and themes go here (though Tripal is in /var/www/sites/all) |

In all instances, the original files and directories where moved to the
/data partition and replaced with symlinks to their new locations. Note
that changes made to files in any other locations will be lost. If you
find that you must have other files or directories saved, please send an
email to gmod-devel@lists.sourceforge.net to request that symlinks be
added to future releases.

## <span id="Interacting_with_the_Server" class="mw-headline">Interacting with the Server</span>

### <span id="Logging_in" class="mw-headline">Logging in</span>

Amazon provides a web-based command line client for interacting with
your instance, but you may prefer to use a client on your own computer.

The Amazon documentation includes <a
href="http://docs.amazonwebservices.com/AWSEC2/latest/GettingStartedGuide/ConnectToInstanceLinux.html"
class="external text" rel="nofollow">instructions on connecting to an
EC2 machine</a>; note that rather than "root" or "ec2-user", you need to
use "ubuntu" as the user name, so an ssh command would typically looks
something like this:

     ssh -i my_key.pem ubuntu@ec2-184-72-204-112.compute-1.amazonaws.com

The following screenshots walk you through logging into an AMI using a
command line tool. [Skip to the next
section](#Resizing_your_data_partition)

### <span id="Instance_Access" class="mw-headline">Instance Access</span>

We can now test out our instance. Clicking on **Instances** shows us the
list of all the instances we have running.

<a href="File:Screen_shot_2012-08-25_at_11.40.52.png" class="image"
title="Instances window"><img
src="../mediawiki/images/thumb/2/25/Screen_shot_2012-08-25_at_11.40.52.png/750px-Screen_shot_2012-08-25_at_11.40.52.png"
srcset="../mediawiki/images/thumb/2/25/Screen_shot_2012-08-25_at_11.40.52.png/1125px-Screen_shot_2012-08-25_at_11.40.52.png 1.5x, ../mediawiki/images/2/25/Screen_shot_2012-08-25_at_11.40.52.png 2x"
width="750" height="482" alt="Instances window" /></a>

  
Go to the instance and right-click to bring up a contextual menu. Choose
**Connect**.

<a href="File:Screen_shot_2012-08-25_at_11.41.56.png" class="image"
title="Contextual menu for the instance"><img
src="../mediawiki/images/thumb/f/f5/Screen_shot_2012-08-25_at_11.41.56.png/750px-Screen_shot_2012-08-25_at_11.41.56.png"
srcset="../mediawiki/images/thumb/f/f5/Screen_shot_2012-08-25_at_11.41.56.png/1125px-Screen_shot_2012-08-25_at_11.41.56.png 1.5x, ../mediawiki/images/f/f5/Screen_shot_2012-08-25_at_11.41.56.png 2x"
width="750" height="482" alt="Contextual menu for the instance" /></a>

  
We can test the HTTP connection using the information from the dialogue
box that comes up. Copy the public DNS address, found under the open
heading **Connect from your browser using the Java SSH Client (Java
Required)**.

<a href="File:Screen_shot_2012-08-25_at_11.42.44.png" class="image"
title="Getting the DNS address"><img
src="../mediawiki/images/thumb/0/02/Screen_shot_2012-08-25_at_11.42.44.png/750px-Screen_shot_2012-08-25_at_11.42.44.png"
srcset="../mediawiki/images/thumb/0/02/Screen_shot_2012-08-25_at_11.42.44.png/1125px-Screen_shot_2012-08-25_at_11.42.44.png 1.5x, ../mediawiki/images/0/02/Screen_shot_2012-08-25_at_11.42.44.png 2x"
width="750" height="482" alt="Getting the DNS address" /></a>

  
Open that address in a new browser window. If everything has gone
correctly, you should see the following screen:

<a href="File:Screen_shot_2012-08-25_at_11.43.52.png" class="image"
title="GMOD in the Cloud... it worked!!"><img
src="../mediawiki/images/thumb/1/1f/Screen_shot_2012-08-25_at_11.43.52.png/750px-Screen_shot_2012-08-25_at_11.43.52.png"
srcset="../mediawiki/images/thumb/1/1f/Screen_shot_2012-08-25_at_11.43.52.png/1125px-Screen_shot_2012-08-25_at_11.43.52.png 1.5x, ../mediawiki/images/1/1f/Screen_shot_2012-08-25_at_11.43.52.png 2x"
width="750" height="482" alt="GMOD in the Cloud... it worked!!" /></a>

  
Now let's check the SSH connection. You can do this through your browser
using the built-in Java client. You will need to change the user name to
**ubuntu** and set the private key path to the location where you saved
the private key that was generated earlier. Click **Launch SSH Client**
to get connected.

<a href="File:Screen_shot_2012-08-25_at_11.50.53.png" class="image"
title="Browser-based SSH"><img
src="../mediawiki/images/thumb/c/ce/Screen_shot_2012-08-25_at_11.50.53.png/750px-Screen_shot_2012-08-25_at_11.50.53.png"
srcset="../mediawiki/images/thumb/c/ce/Screen_shot_2012-08-25_at_11.50.53.png/1125px-Screen_shot_2012-08-25_at_11.50.53.png 1.5x, ../mediawiki/images/c/ce/Screen_shot_2012-08-25_at_11.50.53.png 2x"
width="750" height="482" alt="Browser-based SSH" /></a>

  
Most bioinformaticists worth their salt prefer a nice command line
option, so click on **Connect with a standalone SSH client** to view the
connection information. The first task is to change the file access
permissions on the downloaded private key file.

<a href="File:Screen_shot_2012-08-25_at_11.57.05.png" class="image"
title="Changing key file permissions"><img
src="../mediawiki/images/thumb/c/cf/Screen_shot_2012-08-25_at_11.57.05.png/750px-Screen_shot_2012-08-25_at_11.57.05.png"
srcset="../mediawiki/images/thumb/c/cf/Screen_shot_2012-08-25_at_11.57.05.png/1125px-Screen_shot_2012-08-25_at_11.57.05.png 1.5x, ../mediawiki/images/c/cf/Screen_shot_2012-08-25_at_11.57.05.png 2x"
width="750" height="482" alt="Changing key file permissions" /></a>

  
As with the Java browser-based SSH client, you'll need to change the
user name from **root** to **ubuntu**. Copy the command given,
substituting in the correct path to your private key file and the user
name **ubuntu**.

<a href="File:Screen_shot_2012-08-25_at_11.57.18.png" class="image"
title="Command line command"><img
src="../mediawiki/images/thumb/e/e9/Screen_shot_2012-08-25_at_11.57.18.png/750px-Screen_shot_2012-08-25_at_11.57.18.png"
srcset="../mediawiki/images/thumb/e/e9/Screen_shot_2012-08-25_at_11.57.18.png/1125px-Screen_shot_2012-08-25_at_11.57.18.png 1.5x, ../mediawiki/images/e/e9/Screen_shot_2012-08-25_at_11.57.18.png 2x"
width="750" height="482" alt="Command line command" /></a>

  
If all goes well, you should log in to the server and get a welcome
message:

<a href="File:Screen_shot_2012-08-25_at_11.48.56.png" class="image"
title="Logged in!"><img
src="../mediawiki/images/thumb/0/07/Screen_shot_2012-08-25_at_11.48.56.png/750px-Screen_shot_2012-08-25_at_11.48.56.png"
srcset="../mediawiki/images/thumb/0/07/Screen_shot_2012-08-25_at_11.48.56.png/1125px-Screen_shot_2012-08-25_at_11.48.56.png 1.5x, ../mediawiki/images/0/07/Screen_shot_2012-08-25_at_11.48.56.png 2x"
width="750" height="482" alt="Logged in!" /></a>

### <span id="Resizing_your_data_partition" class="mw-headline">Resizing your data partition</span>

For the moment,
<a href="http://tomotvos.ca/cloud/how-to-resize-an-aws-volume/"
class="external text" rel="nofollow">this tutorial</a> is a good guide
to resizing EBS partitions on EC2 machines.

  

  

## <span id="Working_with_the_GMOD_Software_on_the_Server" class="mw-headline">Working with the GMOD Software on the Server</span>

### <span id="Loading_Data_into_Chado" class="mw-headline">Loading Data into Chado</span>

### <span id="Configuring_GBrowse" class="mw-headline">Configuring GBrowse</span>

### <span id="Getting_Data_into_JBrowse" class="mw-headline">Getting Data into JBrowse</span>

### <span id="Configuring_Tripal" class="mw-headline">Configuring Tripal</span>

## <span id="Leaving_the_Cloud" class="mw-headline">Leaving the Cloud</span>

Once you have finished working on your GMOD in the Cloud instance, you
should remove your data and shut it down (instances can be left running,
but be aware that this may be costing you money). This can be achieved
in a number of different ways, depending on what we want to happen to
the server once we've stopped it.

**Stop** an instance: instance shuts down; changes are saved; instance
stays in list of instances.

**Terminate** an instance: instance shuts down; changes discarded;
instance removed from list of instances.

Using `sudo /sbin/shudown`: depends on the configuration; for GMOD in
the Cloud, the default is the **stop** behaviour above.

Unless you have a reserved IP address for your instance, you will lose
the IP address associated with your GMOD in the Cloud installation when
you stop the machine.

  

### <span id="Shutting_Down" class="mw-headline">Shutting Down</span>

To stop an instance from the command line, type the following:

     sudo /sbin/shutdown now

<a href="File:Screen_shot_2012-08-25_at_11.59.27.png" class="image"
title="Shut down"><img
src="../mediawiki/images/thumb/5/50/Screen_shot_2012-08-25_at_11.59.27.png/750px-Screen_shot_2012-08-25_at_11.59.27.png"
srcset="../mediawiki/images/thumb/5/50/Screen_shot_2012-08-25_at_11.59.27.png/1125px-Screen_shot_2012-08-25_at_11.59.27.png 1.5x, ../mediawiki/images/5/50/Screen_shot_2012-08-25_at_11.59.27.png 2x"
width="750" height="482" alt="Shut down" /></a>

  
Your instance will start shutting down and your connection with be
terminated.

<a href="File:Screen_shot_2012-08-25_at_11.59.40.png" class="image"
title="Terminating..."><img
src="../mediawiki/images/thumb/6/60/Screen_shot_2012-08-25_at_11.59.40.png/750px-Screen_shot_2012-08-25_at_11.59.40.png"
srcset="../mediawiki/images/thumb/6/60/Screen_shot_2012-08-25_at_11.59.40.png/1125px-Screen_shot_2012-08-25_at_11.59.40.png 1.5x, ../mediawiki/images/6/60/Screen_shot_2012-08-25_at_11.59.40.png 2x"
width="750" height="482" alt="Terminating..." /></a>

  
If you return to the **Instances** window in your browser, your instance
will change to the status **stopped**.

<a href="File:Screen_shot_2012-08-25_at_12.40.52.png" class="image"
title="Instance stopped"><img
src="../mediawiki/images/thumb/3/36/Screen_shot_2012-08-25_at_12.40.52.png/750px-Screen_shot_2012-08-25_at_12.40.52.png"
srcset="../mediawiki/images/thumb/3/36/Screen_shot_2012-08-25_at_12.40.52.png/1125px-Screen_shot_2012-08-25_at_12.40.52.png 1.5x, ../mediawiki/images/3/36/Screen_shot_2012-08-25_at_12.40.52.png 2x"
width="750" height="482" alt="Instance stopped" /></a>

### <span id="Getting_your_data_off_the_Cloud" class="mw-headline">Getting your data off the Cloud</span>

To archive, compress, and securely transfer directory DIR to remote host
HOST without writing the archive to your localhost:

     $ tar -cjvf - DIR | ssh HOST 'cat > DIR.tar.bz2' 

or, using pax:

     $ pax -w DIR | bzip2 | ssh HOST 'cat > DIR.tar.bz2' 

You can also decompress/untar the archive on-the-fly on the remote host
as well (note that the "v" option was omitted from the first tar command
to avoid echoing each file twice):

     $ tar -cjf - DIR | ssh HOST 'tar -xjvf -' 

The default SSH2 cipher, 3des, is somewhat slow; if the data transfer is
occurring over a high-speed network, a faster SSH cipher (e.g.,
blowfish-cbc or arcfour256) may speed up the transfer:

     $ tar -cjvf - DIR | ssh -o 'Ciphers blowfish-cbc' HOST 'cat > DIR.tar.bz2'

*Thanks to Nathan Weeks for these tips*

  

### <span id="Volume_Deletion" class="mw-headline">Volume Deletion</span>

Every GMOD in the Cloud instance uses two volumes (disks), one for
applications and the other for data.

<a href="File:16.55.png" class="image"
title="Volumes with a running machine"><img
src="../mediawiki/images/thumb/b/ba/16.55.png/750px-16.55.png"
srcset="../mediawiki/images/thumb/b/ba/16.55.png/1125px-16.55.png 1.5x, ../mediawiki/images/b/ba/16.55.png 2x"
width="750" height="409" alt="Volumes with a running machine" /></a>

  
As these screenshot suggest, only the **Root** volume is deleted when
you shut down your AMI.

<a href="File:12.40.png" class="image" title="Volume setup"><img
src="../mediawiki/images/thumb/8/86/12.40.png/750px-12.40.png"
srcset="../mediawiki/images/8/86/12.40.png 1.5x, ../mediawiki/images/8/86/12.40.png 2x"
width="750" height="520" alt="Volume setup" /></a>

  
Amazon charges for data storage, so unless you need to keep the data on
the Amazon servers, it is best to transfer the data elsewhere and delete
the volume.

<a href="File:16.58.56.png" class="image"
title="Terminate dialog box"><img
src="../mediawiki/images/thumb/7/73/16.58.56.png/750px-16.58.56.png"
srcset="../mediawiki/images/thumb/7/73/16.58.56.png/1125px-16.58.56.png 1.5x, ../mediawiki/images/7/73/16.58.56.png 2x"
width="750" height="409" alt="Terminate dialog box" /></a>

  
Terminate your instance by choosing **Terminate** from **Instance
Actions** or by right-/command-clicking on the instance name and
selecting **Terminate** from the menu.

<a href="File:16.59.17.png" class="image" title="Termination..."><img
src="../mediawiki/images/thumb/7/76/16.59.17.png/750px-16.59.17.png"
srcset="../mediawiki/images/thumb/7/76/16.59.17.png/1125px-16.59.17.png 1.5x, ../mediawiki/images/7/76/16.59.17.png 2x"
width="750" height="409" alt="Termination..." /></a>

  
When the instance has terminated, click on **Volumes**. The Root volume
has been deleted but EBS volume remains. Its status is available as it
is no longer in use by the instance.

<a href="File:17.00.13.png" class="image" title="Volume remaining"><img
src="../mediawiki/images/thumb/5/5a/17.00.13.png/750px-17.00.13.png"
srcset="../mediawiki/images/thumb/5/5a/17.00.13.png/1125px-17.00.13.png 1.5x, ../mediawiki/images/5/5a/17.00.13.png 2x"
width="750" height="409" alt="Volume remaining" /></a>

  
To delete the volume, select it and either choose **Delete volume** or
right-/command-click on the volume name and select **Delete**.

<a href="File:17.00.22.png" class="image" title="Deletion"><img
src="../mediawiki/images/thumb/c/cb/17.00.22.png/750px-17.00.22.png"
srcset="../mediawiki/images/thumb/c/cb/17.00.22.png/1125px-17.00.22.png 1.5x, ../mediawiki/images/c/cb/17.00.22.png 2x"
width="750" height="409" alt="Deletion" /></a>

  
All done!

<a href="File:17.04.00.png" class="image" title="Tabula rasa"><img
src="../mediawiki/images/thumb/1/18/17.04.00.png/750px-17.04.00.png"
srcset="../mediawiki/images/thumb/1/18/17.04.00.png/1125px-17.04.00.png 1.5x, ../mediawiki/images/1/18/17.04.00.png 2x"
width="750" height="409" alt="Tabula rasa" /></a>

</div>

<div class="printfooter">

Retrieved from
"<http://gmod.org/mediawiki/index.php?title=GMOD_Cloud_Tutorial&oldid=21713>"

</div>

<div id="catlinks" class="catlinks">

<div id="mw-normal-catlinks" class="mw-normal-catlinks">

[Categories](Special%3ACategories "Special%3ACategories"):

- [GMOD in the
  Cloud](Category%3AGMOD_in_the_Cloud "Category%3AGMOD in the Cloud")
- [Tutorials](Category%3ATutorials "Category%3ATutorials")

</div>

</div>

<div class="visualClear">

</div>

</div>

</div>

<div id="mw-navigation">

## Navigation menu

<div id="mw-head">



<div id="left-navigation">

<div id="p-namespaces" class="vectorTabs" role="navigation"
aria-labelledby="p-namespaces-label">

### Namespaces


- <span id="ca-talk"><a
  href="http://gmod.org/mediawiki/index.php?title=Talk:GMOD_Cloud_Tutorial&amp;action=edit&amp;redlink=1"
  accesskey="t"
  title="Discussion about the content page [t]">Discussion</a></span>

</div>

<div id="p-variants" class="vectorMenu emptyPortlet" role="navigation"
aria-labelledby="p-variants-label">

### 

### Variants[](#)

<div class="menu">

</div>

</div>

</div>





</div>

</div>

</div>

<div id="mw-panel">

<div id="p-logo" role="banner">

<a href="Main_Page"
style="background-image: url(../images/GMOD-cogs.png);"
title="Visit the main page"></a>

</div>

<div id="p-Navigation" class="portal" role="navigation"
aria-labelledby="p-Navigation-label">

### Navigation

<div class="body">

- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>

</div>

</div>

<div id="p-Documentation" class="portal" role="navigation"
aria-labelledby="p-Documentation-label">

### Documentation

<div class="body">

- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%3AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%3AHOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>

</div>

</div>

<div id="p-Community" class="portal" role="navigation"
aria-labelledby="p-Community-label">

### Community

<div class="body">

- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>

</div>

</div>

<div id="p-tb" class="portal" role="navigation"
aria-labelledby="p-tb-label">

### Tools

<div class="body">


- <span id="t-smwbrowselink"><a href="Special%3ABrowse/GMOD_Cloud_Tutorial" rel="smw-browse">Browse
  properties</a></span>


</div>

</div>

</div>

</div>

<div id="footer" role="contentinfo">

- <span id="footer-info-lastmod">Last updated at 01:26 on 13 September
  2012.</span>
<!-- - <span id="footer-info-viewcount">45,179 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->

- <span id="footer-places-about">[About
  GMOD](GMOD%3AAbout "GMOD%3AAbout")</span>

<!-- -->






</div>

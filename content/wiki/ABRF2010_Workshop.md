---
title: "ABRF2010 Workshop"
---
# ABRF2010 Workshop

<table style="vertical-align: middle; border: 2px solid #A6A6BC"
data-cellpadding="10">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td>

<a href="http://www.abrf2010.org/" rel="nofollow" title="ABRF 2010">

You have your own JBrowse instance on the server:

<a href="http://abrf2010.jbrowse.org/~profilename/"
class="external free"
rel="nofollow">http://abrf2010.jbrowse.org/~profilename/</a>

SSH into the ABRF jbrowse machine:
<span style="font-size: large; font-family: monospace">abrf2010.jbrowse.org</span>

User%253A your profile name from the morning session

Password: abrf_HTS

    ssh profilename@abrf2010.jbrowse.org

Copy your GFF file from this morning to this machine:

    wget --http-user=abrf_workshop --http-password=abrf_HTS http://abrf.cgrb.oregonstate.edu/UserData/mitch/finaloutput-cashx_18887.dir/finaloutput-cashx.gff

OR

    cp ~mitch/finaloutput-cashx.gff ~/

Go into your JBrowse installation:

    cd public_html

Add the GFF file to your JBrowse instance:

    bin/flatfile-to-json.pl --gff2 ~mitch/finaloutput-cashx.gff --tracklabel "ABRF_Test" --key "ABRF Test" --cssclass feature3

## Conference Talk

**Seeing the Forest and the Trees: Visualizing Next Generation Sequence
Data**, by [Mitch Skinner](User%253AMitchSkinner "User%253AMitchSkinner")

Part of the Session _Tools to Facilitate Management, Analysis and
Visualization of 2nd Generation Sequencing Data_

3:45pm - 5:00pm, Monday, March 22

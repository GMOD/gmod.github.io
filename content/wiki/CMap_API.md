---
title: "CMap API"
---
# CMap API

Note: This document was generated from a POD formatted document checked
in at <a
href="http://gmod.svn.sourceforge.net/viewvc/gmod/cmap/trunk/docs/CMAP_API.pod"
class="external text" rel="nofollow">SourceForge</a>. Editing will not
result in long term changes.

 API</span>](#CMap_API)
- [VERSION](#VERSION)
- [Introduction](#Introduction)
- [Overview](#Overview)
- [Important
 Notes](#Important_Notes)
 - [Accession
 IDs](#Accession_IDs)
 - [Purge the
 Cache](#Purge_the_Cache)
 - [Inside
 a Program](#Inside_a_Program)
 - [Command line](#Command_line)
 - [Cache
 Level](#Cache_Level)
 - [CMap
 Assembly Editor Plug-ins](#CMap_Assembly_Editor_Plug-ins)
- [Importing
 Data](#Importing_Data)
 - [Creating a
 Species](#Creating_a_Species)
 - [Returns
 species_id](#Returns_species_id)
 - [Parameters](#Parameters)
 - [Creating a
 Map Set](#Creating_a_Map_Set)
 - [Returns
 map_set_id](#Returns_map_set_id)
 - [Parameters](#Parameters_2)
 - [Creating a
 Map](#Creating_a_Map)
 - [Returns map_id](#Returns_map_id)
 - [Parameters](#Parameters_3)
 - [Creating a
 Features](#Creating_a_Features)
 - [Returns
 feature_id](#Returns_feature_id)
 - [Parameters](#Parameters_4)
 - [Creating a
 Correspondence](#Creating_a_Correspondence)
 - [Returns
 feature_correspondence_id](#Returns_feature_correspondence_id)
 - [Threshold](#Threshold)
 - [Parameters](#Parameters_5)
 - [Creating
 an Attribute](#Creating_an_Attribute)
 - [Returns 1](#Returns_1)
 - [Parameters](#Parameters_6)
 - [Creating
 an External Reference](#Creating_an_External_Reference)
 - [Returns 1](#Returns_1_2)
 - [Parameters](#Parameters_7)
 - [Creating a
 Map to Feature Link](#Creating_a_Map_to_Feature_Link)
 - [Returns 1](#Returns_1_3)
 - [Parameters](#Parameters_8)
- [Querying the
 CMap Database](#Querying_the_CMap_Database)
 - [Getting
 Species Information](#Getting_Species_Information)
 - [Parameters](#Parameters_9)
 - [Structure
 Returned](#Structure_Returned)
 - [Getting
 Map Set Information](#Getting_Map_Set_Information)
 - [Parameters](#Parameters_10)
 - [Structure
 Returned](#Structure_Returned_2)
 - [See
 also](#See_also)
 - [Getting
 Map Information](#Getting_Map_Information)
 - [Parameters](#Parameters_11)
 - [Structure
 Returned](#Structure_Returned_3)
 - [See
 also](#See_also_2)
 - [Getting
 Feature Information](#Getting_Feature_Information)
 - [Parameters](#Parameters_12)
 - [Structure
 Returned](#Structure_Returned_4)
 - [See
 also](#See_also_3)
 - [Getting
 Correspondence
 Information](#Getting_Correspondence_Information)
 - [Parameters](#Parameters_13)
 - [Structure
 Returned](#Structure_Returned_5)
 - [See
 also](#See_also_4)
 - [Getting
 Attribute Information](#Getting_Attribute_Information)
 - [Parameters](#Parameters_14)
 - [Structure
 Returned](#Structure_Returned_6)
 - [Getting
 External Reference
 Information](#Getting_External_Reference_Information)
 - [Parameters](#Parameters_15)
 - [Structure
 Returned](#Structure_Returned_7)
 - [Getting
 Map to Feature
 Information](#Getting_Map_to_Feature_Information)
 - [Parameters](#Parameters_16)
 - [Structure
 Returned](#Structure_Returned_8)
 - [Final
 information](#Final_information)
- [Questions or
 Comments](#Questions_or_Comments)
- [AUTHOR](#AUTHOR)

## CMap API

CMap Application Programming Interface

## VERSION

\$Revision: 1.1 \$

This document was written for the upcoming CMap 1.0 release. It
corresponds to code that is in CVS at the time off commit. It may not be
applicable to older versions.

## Introduction

This document is intended to help you interface with the CMap database
using the CMap API. As CMap is written in Perl, that is the language
used to interface with it.

## Overview

There are two types of interaction between your program and the CMap
database; "Importing Data" and "Querying the CMap Database". Each type
of interaction is performed in its own way.

Importing data requires the use of a Bio%253A%253AGMOD::CMap::Admin object.
Creating this will be described in the "Importing Data" section.

Querying the CMap database is done through the use of an object returned
by the sql() method, which any CMap module has access to.

## Important Notes

### Accession IDs

All the accession id columns in the CMap tables act the same. They are
all character fields, so they will accept any combination of numbers and
letters you care to use. Please don't use spaces or characters outside
the ranges "a-z," "A-Z," "0-9" or dashes ("-") as this will likely only
cause you headaches. It is also not necessary to explicitly assign any
accession IDs. While they \*are\* required by the database, there is
code in place to ensure that the accession ID is set to the primary ID
of the record if the accession ID is empty. Once your accession IDs have
been established and publicized, they should never change.

Also, it is best to avoid strictly numeric accession ids since the
automatic accessions are numeric and this can cause conflicts.

### Purge the Cache

After changing information in the database (or a config file), the query
cache needs to be purged. Not doing so, often results in a mix of old
and new information being displayed, which can be confusing.

You can purge the cache inside a script or use the command line.

#### Inside a Program

Purging inside your program is simple. Use a Bio%253A%253AGMOD::CMap::Admin
object (see "Importing Data" for creating this object) to call the
purge_cache method.

 $admin->purge_cache( );

A cache level can be specified. See the section below on cache levels
for more information.

 $admin->purge_cache( $cache_level );

#### Command line

To purge the cache on the command line use cmap/bin/cmap_admin.pl. You
can either use the menu system or by command line:

 $ cmap_admin.pl [-d data_source] [--cache_level level] --action purge_query_cache

#### Cache Level

There are four layers of the cache. This is to keep data from being
unnecessarily purged. For instance when a correpspondence is added, no
map data is changed, so only the correspondence information should be
purged.

When one layer is purged all of the layers below it are purged.

\- Cache Level 1 Purge All
Purge all when a map set or species has been added or modified. A change
to map sets or species has potential to impact all of the data.

\- Cache Level 2 (purge map info on down)
Level 2 should be purged when map information is changed.

\- Cache Level 3 (purge feature info on down)
Level 3 should be purged when feature information is changed.

\- Cache Level 4 (purge correspondence info on down)
Level 4 should be purged when correspondence information is changed.

### CMap Assembly Editor Plug-ins

It is important to note that if you are writing a plug-in for
[CMAE](/wiki/CMAE), the methods described in this section will only
work if the data is stored locally. If the data access is remote, you
must use the methods in `AppData.pm`. There will be further
documentation written on this topic.

## Importing Data

To create data in the CMap database, a CMap admin object needs to be
created. In the following example, \$data_source stores the data source
name that identifies which configuration file to use.

 use Bio%253A%253AGMOD::CMap::Admin;

 my $data_source = 'CMAP_DEMO';
 my $cmap_admin
 = Bio%253A%253AGMOD::CMap::Admin->new( data_source => $data_source, );

### Creating a Species

 my $species_id = $admin->species_create(
 species_full_name => $species_full_name,
 species_common_name => $species_common_name,
 display_order => $display_order,
 species_acc => $species_acc,
 );

#### Returns species_id

#### Parameters

\- species_full_name (Required)
Full name of the species, such as "Homo Sapiens".

\- species_common_name (Required)
Short name of the species, such as "Human".

\- display_order
The number representing where in the order that this species will be
displayed in species lists.

\- species_acc
See "Accession IDs" for more information about accession IDs.

### Creating a Map Set

 my $map_set_id = $admin->map_set_create(
 map_set_name => $map_set_name,
 map_set_acc => $map_set_acc,
 map_type_acc => $map_type_acc,
 width => $width,
 is_relational_map => $is_relational_map,
 published_on => $published_on,
 map_set_short_name => $map_set_short_name,
 display_order => $display_order,
 species_id => $species_id,
 color => $color,
 shape => $shape,
 );

#### Returns map_set_id

#### Parameters

\- map_set_name (Required)
Name of the map set being created

\- map_set_acc (Required)
See "Accession IDs" for more information about accession IDs.

\- map_type_acc (Required)
The accession id of a map type that is defined in the config file.

\- species_id (Required)
The species ID that this map set belongs to. This can be retrieved after
creating the species, "Creating a Species" or by querying the database
for the species id, "Getting Species Information".

\- width
Pixel width of the map

\- is_relational_map
Relational Maps do not show up in the initial map selection lists since
they are only used in relation to another map.

\- published_on
Data the map set was published

\- map_set_short_name
Shorter name for the map set

\- display_order
The number representing where in the order that this map set will be
displayed in map set lists.

\- color
The color of the maps

\- shape
The shape of the maps. This can be "I-beam", "box" or "dumbbell".

### Creating a Map

 my $map_id = $admin->map_create(
 map_name => $map_name,
 map_set_id => $map_set_id,
 map_acc => $map_acc,
 map_start => $map_start,
 map_stop => $map_stop,
 display_order => $display_order,
 );

#### Returns map_id

#### Parameters

\- map_name (Required)
Name of the map being created

\- map_set_id (Required)
The map set ID that this map set belongs to. This can be retrieved after
creating the map set, "Creating a Map Set" or by querying the database
for the map set id, "Getting Map Set Information".

\- map_acc
See "Accession IDs" for more information about accession IDs.

\- map_start (Required)
Beginning point of the map.

\- map_stop (Required)
End point of the map.

\- display_order
The number representing where in the order that this map will be
displayed in map lists.

### Creating a Features

 my $feature_id = $admin->feature_create(
 map_id => $map_id,
 feature_name => $feature_name,
 feature_acc => $feature_acc,
 feature_start => $feature_start,
 feature_stop => $feature_stop,
 is_landmark => $is_landmark,
 feature_type_acc => $feature_type_acc,
 direction => $direction,
 #gclass => $gclass, # not likely to be used
 );

#### Returns feature_id

#### Parameters

\- map_id (Required)
The map ID that this map belongs to. This can be retrieved after
creating the map "Creating a Map" or by querying the database for the
map id, "Getting Map Information".

\- feature_name (Required)
The name of the feature

\- feature_acc
See "Accession IDs" for more information about accession IDs.

\- feature_start (Required)
Location on the map where this feature begins.

\- feature_stop
Location on the map where this feature ends. This will be set to
feature_start if not given.

\- is_landmark
Declares the feature to be a landmark.

\- feature_type_acc (Required)
The accession id of a feature type that is defined in the config file.

\- direction
The direction the feature points in relation to the map.

\- gclass
The gclass that the feature will have. This only relates to using CMap
integrated with GBrowse and should not be used otherwise.

### Creating a Correspondence

 my $feature_correspondence_id = $admin->feature_correspondence_create(
 feature_id1 => $feature_id1,
 feature_id2 => $feature_id2,
 feature_acc1 => $feature_acc1,
 feature_acc2 => $feature_acc2,
 is_enabled => $is_enabled,
 evidence_type_acc => $evidence_type_acc, # Alt: correspondence_evidence
 score => $score, # used in conjunction with evidence_type_acc
 feature_correspondence_acc => $feature_correspondence_acc,
 );

#### Returns feature_correspondence_id

#### Threshold

In an effort so speed up import of correspondences, correspondences can
be queued. When the number in the queue breaks a threshold, those
correspondences are then added into the database. Supplying a
"threshold" value to this method will enable that feature. From
experience, a good threshold is between 100 and 1000 but feel free to
play around with it.

To finish creating the correspondences in the queue, simply run the
method again with no arguments.

 $admin->feature_correspondence_create();

#### Parameters

\- feature_id1 (Required unless feature_acc1 is given)
The feature_id of the first feature in the correspondence.

\- feature_id2 (Required unless feature_acc2 is given)
The feature_id of the second feature in the correspondence.

\- feature_acc1 (Required unless feature_id1 is given)
The feature_acc of the first feature in the correspondence.

\- feature_acc2 (Required unless feature_id2 is given)
The feature_acc of the second feature in the correspondence.

\- is_enabled

\- evidence_type_acc (Required unless correspondence_evidence is given)
The accession id of a evidence type that is defined in the config file.

\- score
The score can be used if evidence_type_acc is being used, otherwise it
is stored in the correspondence_evidence object.

\- correspondence_evidence (Required unless evidence_typ_acc is given)
List of evidence hashes that correspond to the evidence types that this
correspondence should have. The hashes must have a "evidence_type_acc"
key. It can also have a "score" value.

 my $evidences = [
 { evidence_type_acc => $evidence_type_acc,
 score => $score,
 },
 ];

\- feature_correspondence_acc
See "Accession IDs" for more information about accession IDs.

\- threshold
See the Threshold section above.

### Creating an Attribute

 $admin->attribute_create(
 object_id => $object_id,
 attribute_name => $attribute_name,
 attribute_value => $attribute_value,
 object_type => $object_type,
 display_order => $display_order,
 is_public => $is_public,
 );

See also \$admin-\>set_attribute() for a slightly faster (but more
complicated) version.

#### Returns 1

#### Parameters

\- object_id (Required)
The primary key of the object.

\- attribute_name (Required)
The name of this attribute

\- attribute_value (Required)
The value stored in this attribute

\- object_type (Required)
The type of object being attributed, such as map, feature, map_set, etc.

\- display_order
The number representing where in the order that this attribute will be
displayed in attribute lists.

\- is_public
If 1 (default), the attribute will be displayed on the CMap web page.

### Creating an External Reference

 $admin->xref_create(
 object_id => $object_id,
 xref_name => $xref_name,
 xref_url => $xref_url,
 object_type => $object_type,
 display_order => $display_order,
 is_public => $is_public,
 );

See also \$admin-\>set_xref() for a slightly faster (but more
complicated) version.

#### Returns 1

#### Parameters

\- object_id (Required)
The primary key of the object.

\- xref_name (Required)
The name of this xref

\- xref_url (Required)
The url stored in this xref

\- object_type (Required)
The type of object being xrefd, such as map, feature, map_set, etc.

\- display_order
The number representing where in the order that this xref will be
displayed in xref lists.

### Creating a Map to Feature Link

 $admin->map_to_feature_create(
 feature_id => $feature_id,
 feature_acc => $feature_acc,
 map_id => $map_id,
 map_acc => $map_acc,
 );

#### Returns 1

#### Parameters

\- map_id (Required unless map_acc is given)
Identifier of the map to be linked.

\- map_acc (Required unless map_id is given)
Accession of the map to be linked.

\- feature_id (Required unless feature_acc is given)
Identifier of the feature to be linked.

\- feature_acc (Required unless feature_id is given)
Accession of the feature to be linked.

## Querying the CMap Database

To query the data, another object is needed which we will call the
\$sql_object. The \$sql_object can be created from any CMap object. For
the following examble, we'll use the \$cmap_admin object from the
"Importing Data" section.

 my $sql_object = $cmap_admin->sql();

When you have the \$sql_object, you can then call any of the methods in
Bio/GMOD/CMap/Data/Generic.pm.

### Getting Species Information

 my $species = $sql_object->get_species();

#### Parameters

The parameters narrow down search results or provide direction for the
results.

If no parameters are provided, it will return all species in the
database.

\- Species ID (species_id)

\- List of Species Accessions (species_accs)

\- Boolean
is this a relational map (is_relational_map) :

\- Boolean
Is this enabled (is_enabled) :

#### Structure Returned

 [ { species_id => $species_id,
 species_acc => $species_acc,
 species_common_name => $species_common_name,
 species_full_name => $species_full_name,
 display_order => $display_order,
 },
 ]

### Getting Map Set Information

 my $map_sets = $sql_object->get_map_sets();

#### Parameters

The parameters narrow down search results or provide direction for the
results.

If no parameters are provided, it will return all map sets in the
database.

\- Species ID (species_id)

\- List of Species IDs (species_ids)

\- Species Accession (species_acc)

\- Map Set ID (map_set_id)

\- List of Map Set IDs (map_set_ids)

\- Map Set Accession (map_set_acc)

\- List of Map Set Accessions (map_set_accs)

\- Map Type Accession (map_type_acc)

\- Boolean
is this a relational map (is_relational_map) :

\- Boolean
Is this enabled (is_enabled) :

\- Boolean count_maps (count_maps)
Add a map count to the return object

#### Structure Returned

 [ { map_set_id => $map_set_id,
 map_set_acc => $map_set_acc,
 map_set_name => $map_set_name,
 map_set_short_name => $map_set_short_name,
 map_type_acc => $map_type_acc,
 published_on => $published_on,
 is_enabled => $is_enabled,
 is_relational_map => $is_relational_map,
 map_units => $map_units,
 map_set_display_order => $map_set_display_order,
 shape => $shape,
 color => $color,
 width => $width,
 species_id => $species_id,
 species_acc => $species_acc,
 species_common_name => $species_common_name,
 species_full_name => $species_full_name,
 species_display_order => $species_display_order,
 map_type => $map_type,
 map_type_display_order => $map_type_display_order,
 epoch_published_on => $epoch_published_on,
 map_count => $map_count, # (Only if count_maps is specified)
 },
 ]

#### See also

The get_map_sets_simple by executing "perldoc
Bio%253A%253AGMOD::CMap::Data::Generic";

### Getting Map Information

 my $maps = $sql_object->get_maps();

#### Parameters

The parameters narrow down search results or provide direction for the
results.

If no parameters are provided, it will return all maps in the database.

\- Map ID (map_id)

\- List of Map IDs (map_ids)

\- List of Map Accessions (map_accs)

\- Map Set ID (map_set_id)

\- Map Set Accession (map_set_acc)

\- List of Map Set Accessions (map_set_accs)

\- Map Name (map_name)

\- Map Length (map_length)

\- Map Type Accession (map_type_acc)

\- Species Accession (species_acc)

\- Boolean
is this a relational map (is_relational_map) :

\- Boolean
Is this enabled (is_enabled) :

\- Boolean count_features (count_features)
Add a feature count to the return object

#### Structure Returned

 [ { map_id => $map_id,
 map_acc => $map_acc,
 map_name => $map_name,
 map_start => $map_start,
 map_stop => $map_stop,
 display_order => $display_order,
 map_set_id => $map_set_id,
 map_set_acc => $map_set_acc,
 map_set_name => $map_set_name,
 map_set_short_name => $map_set_short_name,
 published_on => $published_on,
 shape => $shape,
 width => $width,
 color => $color,
 map_type_acc => $map_type_acc,
 map_units => $map_units,
 is_relational_map => $is_relational_map,
 species_id => $species_id,
 species_acc => $species_acc,
 species_common_name => $species_common_name,
 species_full_name => $species_full_name,
 map_type_display_order => $map_type_display_order,
 map_type => $map_type,
 epoch_published_on => $epoch_published_on,
 default_shape => $default_shape,
 default_color => $default_color,
 default_width => $default_width,
 feature_count =>
 $feature_count, # (Only if count_features is specified)
 },
 ]

#### See also

The get_maps_simple by executing "perldoc
Bio%253A%253AGMOD::CMap::Data::Generic";

### Getting Feature Information

 my $features = $sql_object->get_features();

#### Parameters

The parameters narrow down search results or provide direction for the
results.

Identifiers that are more specific are used instead of more general ids.
For instance, if a feature_id and a map_id are specified, only the
feature_id will be used because the map_id is a more broad search.

If no parameters are provided, it will return all features in the
database.

\- Feature ID (feature_id)

\- Feature Accession (feature_acc)

\- Feature Name (feature_name)

\- Map ID (map_id)

\- map_acc (map_acc)

\- Map Set ID (map_set_id)

\- List of Map Set IDs (map_set_ids)

\- feature_start (feature_start)

\- feature_stop (feature_stop)

\- Direction (direction)

\- Allowed feature types (feature_type_accs)

\- Species ID (species_id)

\- List of Species IDs (species_ids)

\- List of Species Accessions (species_accs)

\- Map Start and Map Stop (map_start,map_stop)
These must both be defined in order to to be used. If defined the method
will return only features that overlap that region.

\- Aliases get own rows (aliases_get_rows)
Value that dictates if aliases that match get there own rows. This is
mostly useful for feature_name searches.

\- Don't get aliases (ignore_aliases)
Value that dictates if aliases are ignored. The default is to get
aliases.

#### Structure Returned

 [ { feature_id => $feature_id,
 feature_acc => $feature_acc,
 feature_type_acc => $feature_type_acc,
 feature_type => $feature_type,
 feature_name => $feature_name,
 feature_start => $feature_start,
 feature_stop => $feature_stop,
 direction => $direction,
 map_id => $map_id,
 is_landmark => $is_landmark,
 map_acc => $map_acc,
 map_name => $map_name,
 map_start => $map_start,
 map_stop => $map_stop,
 map_set_id => $map_set_id,
 map_set_acc => $map_set_acc,
 map_set_name => $map_set_name,
 map_set_short_name => $map_set_short_name,
 is_relational_map => $is_relational_map,
 map_type_acc => $map_type_acc,
 map_type => $map_type,
 map_units => $map_units,
 species_id => $species_id,
 species_acc => $species_acc,
 species_common_name => $species_common_name,
 feature_type => $feature_type,
 default_rank => $default_rank,
 aliases => $aliases, # a list of aliases (Unless $aliases_get_rows
 #or $ignore_aliases are specified),
 },
 ]

#### See also

The get_features_simple by executing "perldoc
Bio%253A%253AGMOD::CMap::Data::Generic";

### Getting Correspondence Information

 my $correspondences = $sql_object->get_feature_correspondence_details()

#### Parameters

The parameters narrow down search results or provide direction for the
results.

Note: If not supplying evidence type information, the
disregard_evidence_type parameter must be set to true, otherwise, no
data will be returned.

\- feature_correspondence_id (feature_correspondence_id)

\- feature_id1 (feature_id1)

\- feature_id2 (feature_id2)

\- map_set_id2 (map_set_id2)

\- map_set_acc2 (map_set_acc2)

\- map_id1 (map_id1)

\- map_id2 (map_id2)

\- map_acc2 (map_acc2)

\- disregard_evidence_type (disregard_evidence_type)
If not supplying evidence type information, the disregard_evidence_type
parameter must be set to true, otherwise, no data will be returned.

\- Included Evidence Types Accessions (included_evidence_type_accs)

\- Ev. types that must be less than score (less_evidence_type_accs)

\- Ev. types that must be greater than score (greater_evidence_type_accs)

\- Scores for comparing to evidence types (evidence_type_score)

#### Structure Returned

 [ { feature_name2 => $feature_name2,
 feature_id2 => $feature_id2,
 feature_id2 => $feature_id2,
 feature_acc1 => $feature_acc1,
 feature_acc2 => $feature_acc2,
 feature_start2 => $feature_start2,
 feature_stop2 => $feature_stop2,
 feature_type_acc2 => $feature_type_acc2,
 map_id2 => $map_id2,
 map_acc2 => $map_acc2,
 map_name2 => $map_name2,
 map_display_order2 => $map_display_order2,
 map_set_id2 => $map_set_id2,
 map_set_acc2 => $map_set_acc2,
 map_set_short_name2 => $map_set_short_name2,
 ms_display_order2 => $ms_display_order2,
 published_on2 => $published_on2,
 map_type_acc2 => $map_type_acc2,
 map_units2 => $map_units2,
 species_common_name2 => $species_common_name2,
 species_display_order2 => $species_display_order2,
 feature_correspondence_id => $feature_correspondence_id,
 feature_correspondence_acc => $feature_correspondence_acc,
 is_enabled => $is_enabled,
 evidence_type_acc => $evidence_type_acc,
 map_type2 => $map_type2,
 feature_type2 => $feature_type2,
 evidence_type => $evidence_type,
 },
 ]

#### See also

The get_feature_correspondences_simple by executing "perldoc
Bio%253A%253AGMOD::CMap::Data::Generic";

### Getting Attribute Information

 my $attributes = $sql_object->get_attributes();

#### Parameters

The parameters narrow down search results or provide direction for the
results.

If no parameters are provided, it will return all features in the
database.

\- Object type such as feature or map_set (object_type)

\- Object ID (object_id)

\- attribute_id (attribute_id)

\- is_public (is_public)

\- attribute_name (attribute_name)

\- attribute_value (attribute_value)

\- Order by clause (order_by)

\- Get All Flag (get_all)
Boolean value. If set to 1, return all without regard to whether
object_id is null. This will allow retrieval of attributes given
generally to all of a type.Specifying an object_id overrides this.

#### Structure Returned

 [ { attribute_id => $attribute_id,
 object_id => $object_id,
 table_name => $table_name,
 display_order => $display_order,
 is_public => $is_public,
 attribute_name => $attribute_name,
 attribute_value => $attribute_value,
 object_type => $object_type,
 },
 ]

### Getting External Reference Information

 my $xrefs = $sql_object->get_xrefs();

#### Parameters

The parameters narrow down search results or provide direction for the
results.

If no parameters are provided, it will return all features in the
database.

\- Object type such as feature or map_set (object_type)

\- Object ID (object_id)

\- xref_id (xref_id)

\- xref_name (xref_name)

\- xref_url (xref_url)

\- Order by clause (order_by)

#### Structure Returned

 [ { xref_id => $xref_id,
 object_id => $object_id,
 display_order => $display_order,
 xref_name => $xref_name,
 xref_url => $xref_url,
 object_type => $object_type,
 },
 ]

### Getting Map to Feature Information

 my $map_to_features = $sql_object->get_map_to_features()

#### Parameters

The parameters narrow down search results or provide direction for the
results.

If no parameters are provided, it will return all features in the
database.

\- Map ID (map_id)

\- Map Accession (map_acc)

\- Feature ID (feature_id)

\- Feature Accession (feature_acc)

#### Structure Returned

 [ { map_id => $map_id,
 map_acc => $map_acc,
 feature_id => $feature_id,
 feature_acc => $feature_acc,
 },
 ]

### Final information

For more information about the methods available, execute "perldoc
Bio%253A%253AGMOD::CMap::Data::Generic" on the command line.

## Questions or Comments

Contact the CMap list, gmod-cmap@lists.sourceforge.net with your
questions or comments.

You can also leave a bug report for CMap at the SourceForge site for
GMOD,
<a href="http://sourceforge.net/projects/gmod/" class="external free"

## AUTHOR

Ben Faga, faga@cshl.edu

Copyright (c) 2007 Cold Spring Harbor Laboratory

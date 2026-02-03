---
title: "Load ncbi taxonomy"
---
# Load ncbi taxonomy

`load_ncbi_taxonomy.pl` is a perl script for loading NCBI taxonomy trees
in the
[**`phylotree`**](/wiki/Chado_Phylogeny_Module#Table:_phylotree)[phylotree
table](/wiki/Chado_Phylogeny_Module#Table:_phylotree).
This script was contributed by [Naama
Menda](/wiki/User%3ANaamaMenda) at
<a href="http://www.sgn.cornell.edu/" class="external text"
rel="nofollow">Sol Genomics Network (SGN)</a> led by Lukas Mueller.

## Where to find it

### gmod 1.1

In the 1.1 release,load_ncbi_taxonomy.pl is installed with other scripts
with the distribution and will typically go in /usr/bin or
/usr/local/bin.

## Command line options

- `-H hostname` for database \[required if `-g` isn't used\]
- `-D database name</t> [required if <tt>-g` isn't used\]
- `-g GMOD database profile name` (can provide host and DB name)
  Default: `default`
- `-p phylotree name` (optional - defaults to `NCBI taxonomy tree`. You
  want to set this if you plan to load more than one tree)
- `-i input file` - list of taxonomy ids to be stored (optional- without
  this the entire NCBI taxonomy will be loaded)
- `-v` verbose output
- `-t` trial mode. Don't perform any store operations at all. (trial
  mode cannot test inserting associated data for new terms)

For storing phylonodes a new phylotree will be stored with the name
'NCBI taxonomy tree'. Each organism will get a phylonode id and will be
stored in a tmp table, since each phylonode (except for the root) has a
parent_phylonode_id, which is an internal foreign key. Next each
phylonode will get a left and right indexes, which are calculated by
walking down the entire tree structure (see article by Aaron Mackey: <a
href="http://www.oreillynet.com/pub/a/network/2002/11/27/bioconf.html?page=2"
class="external free"
rel="nofollow">http://www.oreillynet.com/pub/a/network/2002/11/27/bioconf.html?page=2</a>).
Only after each phylonode will have calculated indexes, the phylonode
table will be populated from the tmp table.

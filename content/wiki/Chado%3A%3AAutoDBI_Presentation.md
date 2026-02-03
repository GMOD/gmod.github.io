---
title: "Chado%253A%253AAutoDBI Presentation"
---
# Chado%253A%253AAutoDBI Presentation


This Wiki section is an edited version of
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/3/34/AutoDBI.pdf" class="internal"
title="AutoDBI.pdf">Brian O'Connor's presentation</a>.


  Turnkey</span>](#Relation_to_Turnkey)
- [Technical
  Overview](#Technical_Overview)
- [Project
  Overview](#Project_Overview)
- [Technical
  Overview](#Technical_Overview_2)
- [Technical
  Overview](#Technical_Overview_3)
- [Technical
  Overview](#Technical_Overview_4)
- [Technical
  Overview](#Technical_Overview_5)
- [Technical
  Overview](#Technical_Overview_6)
- [Technical
  Overview](#Technical_Overview_7)
- [Problem
  1](#Problem_1)
- [Problem
  2](#Problem_2)
- [Problems 3,
  4, & 5](#Problems_3.2C_4.2C_.26_5)
- [Things
  Chado%253A%253AAutoDBI does well](#Things_Chado%253A%253AAutoDBI_does_well)
- [For More
  Information](#For_More_Information)


##### Relation to Turnkey

Turnkey is a package that auto-generates Web sites given a relational
schema, based on SQL::Translator

- Turnkey authors: Allen Day, Scott Cain, Brian O'Connor
- Turnkey and Chado%253A%253AAutoDBI objects are essentially the same

##### Technical Overview

- Code Generation

##### Project Overview

Convert SQL Queries/Inserts/Deletes -\> Object Calls


``` de1
  INSERT INTO feature (organism_id, name)
                                  VALUES (1, 'foo');
```


To:


``` de1
    my $feature = Turnkey::Model::Feature->find_or_create({
                       organism_id => $organism,
                   name => 'xfile', uniquename => 'xfile',
                   type_id => $mrna_cvterm,
                   is_analysis => 'f', is_obsolete => 'f'
                   });
```


##### Technical Overview

- Database connection: use a base class
- Set up base object and connect, then create a *table object* to access
  primary key.
- Class::DBI can find and insert records into other table, based on
  foreign key.


``` de1
use base qw(Class::DBI::Pg);
 
my ($dsn, $name, $pass);
$dsn = "dbi:Pg:host=localhost;dbname=chado;port=5432";
$name = "postgres";
$pass = "";
 
Turnkey::Model::DBI->set_db('Main', $dsn, $name, $pass, {AutoCommit => 1});
```


##### Technical Overview

- Basic [ORM](Glossary#ORM "Glossary") Object: Feature


``` de1
package Turnkey::Model::Feature;
use base 'Turnkey::Model::DBI';
 
Turnkey::Model::Feature->set_up_table('feature');
 
#
# Primary key accessors
#
 
sub id { shift->feature_id }
sub feature { shift->feature_id }
```


- data field accessors by Class::Accessor

##### Technical Overview

- Basic ORM Object: Feature
  - has_a


``` de1
#
# has_a
#
Turnkey::Model::Feature->has_a( type_id => "Turnkey::Model::Cvterm" );
sub cvterm { return shift->type_id; }
```


- Basic ORM Object: Feature
  - has_many


``` de1
#
# has_many
#
Turnkey::Model::Feature->has_many('feature_synonym_feature_id', 
           'Turnkey::Model::Feature_Synonym' => 'feature_id');
sub feature_synonyms { return shift->feature_synonym_feature_id; }
 
Turnkey::Model::Feature->has_many('featureprop_feature_id', 
           'Turnkey::Model::Featureprop' => 'feature_id');
sub featureprops { return shift->featureprop_feature_id; }
```


- Can traverse tables, such as going from FEATURE to FEATUREPROP
  - Tell base object that the *table object* has_a() or has_many() keys
    corresponding to some key in other *table object*

##### Technical Overview

- Basic ORM Object: Feature
  - skipping linker tables for has_many


``` de1
# skip over feature_synonym table
#
# method 1
#
sub synonyms { my $self = shift; return map $_->synonym_id, $self->feature_synonyms; }
#
# method 2
#
Turnkey::Model::Feature->has_many( synonyms2 =>
                      ['Turnkey::Model::Feature_Synonym' => 'synonym_id']);
```


##### Technical Overview

- Transactions
  - Chado%253A%253AAutoDBI supports transactions, and one can wrap the
    transaction in an eval()


``` de1
  sub do_transaction {
    my $class = shift;
    my ( $code ) = @_;
    # Turn off AutoCommit for this scope.
    # A commit will occur at the exit of this block automatically,
    # when the local AutoCommit goes out of scope.
    local $class->db_Main->{ AutoCommit };
 
    # Execute the required code inside the transaction.
    eval { $code->() };
    if ( $@ ) {
      my $commit_error = $@;
      eval { $class->dbi_rollback }; # might also die!
      die $commit_error;
    }
  }
```


##### Technical Overview

- Lazy Loading
  - One can either do automated creation of objects or explicitly
    dictate which fields are incorporated into object


``` de1
Turnkey::Model::Feature->columns( Primary => qw/feature_id/ );
Turnkey::Model::Feature->columns( Essential => qw/name organism_id type_id/ );
Turnkey::Model::Feature->columns( Others => qw/residues .../ );
```


Typically:


``` de1
Turnkey::Model::Feature->set_up_table('feature');
```


##### Problem 1

- Create Feature & Add Description


``` de1
# now create mRNA feature
 
my $feature = Turnkey::Model::Feature->find_or_create({
                       organism_id => $organism,
                   name => 'xfile', uniquename => 'xfile',
                   type_id => $mrna_cvterm,
                   is_analysis => 'f', is_obsolete => 'f'
                   });
 
# create description
 
my $featureprop = Turnkey::Model::Featureprop->find_or_create({
                           value => 'A test gene for GMOD meeting',
                           feature_id => $feature,
                   type_id => $note_cvterm,
                   });
```


##### Problem 2

- Retrieve a Feature via Searching
  - Search using strings or identifiers, a search will return an
    iterator object


``` de1
# objects for global use
 
# the organism for our new feature
my $organism = Turnkey::Model::Organism->search(abbreviation => "S.cerevisiae")->next;
 
# the cvterm for a "Note"
my $note_cvterm = Turnkey::Model::Cvterm->retrieve(2);
 
# searching name by wildcard
 
my @results = Turnkey::Model::Feature->search_like(name => 'x-%');
```


##### Problems 3, 4, & 5

- Update a Feature


``` de1
# update the xfile gene name
 
$feature->name("x-file");
$feature->update();
```


- Delete a Feature


``` de1
# now delete the x-file feature
 
$feature->delete();
```


##### Things Chado%253A%253AAutoDBI does well

- Easy to use
- Easy to port
- Use with other DBs
  - Both Oracle and Postgres used currently
- Autogenerated via Turnkey
- find_or_create method
- Performance is not as bad as you might guess
  - Due to Lazy loading
  - Even whole genome operations are feasible

Note that speed is relative: one can find bad performance using the
wrong SQL and Chado%253A%253AAutoDBI approach will be speedier.

  

##### For More Information

- Class::DBI
  - <a href="http://www.class-dbi.com" class="external free"
    rel="nofollow">http://www.class-dbi.com</a>
  - <a href="http://search.cpan.org" class="external free"
    rel="nofollow">http://search.cpan.org</a>
- Turnkey
  - <a href="http://turnkey.sf.net" class="external free"
    rel="nofollow">http://turnkey.sf.net</a>
- Biopackages
  - <a href="http://biopackages.net" class="external free"
    rel="nofollow">http://biopackages.net</a>

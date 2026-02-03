---
title: "Bio GMOD GenericGenePage"
---
# Bio GMOD GenericGenePage

Bio%253A%253AGMOD::GenericGenePage is an abstract
[Perl](/wiki/Glossary#Perl) class that provides a render_xml method
to crete [Common Gene Page](/wiki/Common_Gene_Page)
[XML](/wiki/Glossary#XML), but does not fetch the data. In order to
effectively use this module, you need to subclass it and implement all
of the methods that are listed under ABSTRACT CLASSES below for your
database. These abstract methods are responsible for providing
Bio%253A%253AGMOD::GenericGenePage with the data to create the XML.

There are two example implementations included with this module.
Bio%253A%253AGMOD::GenericGenePage::Chado is a simple implementation for a Chado
database populated with *S. cerevisiae* data obtained from
[SGD](/wiki/Category%253ASGD) as GFF3. Currently, the output of
this implementation can be seen at

<a href="http://gmod.org/cgi-bin/gbrowse/chado_yeast/"
class="external free"
rel="nofollow">http://gmod.org/cgi-bin/gbrowse/chado_yeast/</a>

and by clicking on any of the genes (red arrows).

The other implementation, CXGN::Phenome::GenericGenePage, is from [SGN,
the Sol Genomics Network](/wiki/Category%253ASGN). The XML they
provide can be seen by clicking on the "Download GMOD XML" link on any
of there locus pages; for example, this one:

<a href="http://sgn.cornell.edu/phenome/locus_display.pl?locus_id=1238"
class="external free"
rel="nofollow">http://sgn.cornell.edu/phenome/locus_display.pl?locus_id=1238</a>

For more information see
<a href="/wiki/Bio_GMOD_GenericGenePage" class="external free"
rel="nofollow">http://gmod.org/wiki/Bio_GMOD_GenericGenePage</a> or
contact Scott Cain, scain@cpan.org.

While there is no example CGI included in this distribution that show
how this module can be used, that could be included in future
distribution if there is interest in it.

## FlyBase implementation

<a
href="http://flybase.org/genome/Drosophila_melanogaster/current/genepage/FBgn0000490"
class="external free"
rel="nofollow">http://flybase.org/genome/Drosophila_melanogaster/current/genepage/FBgn0000490</a>

## EcoliWiki implementation

The EcoliWiki implementation is written as a REST-like service in PHP.

<a href="http://ecoliwiki.net/rest/gmod_gene.php/gene_symbol/pfkA"
class="external free"
rel="nofollow">http://ecoliwiki.net/rest/gmod_gene.php/gene_symbol/pfkA</a>

See the discussion page for issues arising.

# Abstract Classes

Methods below should be overridden by each GenericGenePage
implementation.



     name
         Usage: my $name = $genepage->name();
         Desc : get the string name of this gene
         Args : none
         Ret  : string gene name, e.g. 'Pax6'
         Side Effects: none

     accessions
         Usage: my @accessions = $genepage->accessions();
         Desc : get a list of local accession values
         Args : none
         Ret  : a list of local accessions
         Side Effects: none
       Note that these are the accessions that are used by the MOD providing
       the information, not accessions in external databases like GenBank.

     data_provider
         Usage: my $data_provider = $genepage->data_provider();
         Desc : The name of the data providing authority (ie, WormBase, SGD, etc)
         Args : none
         Ret  : string, name of the data provider
         Side Effects: none

     synonyms
         Usage: my @syn = $genepage->synonyms();
         Desc : get a list of synonyms for this gene
         Args : none
         Ret : list of strings,
               e.g. (  '1500038E17Rik',
                       'AEY11',
                       'Dey',
                       "Dickie's small eye",
                       'Gsfaey11',
                       'Pax-6',
                    )
         Side Effects: none

     map_locations
         Usage: my @locs = $genepage->map_locations()
         Desc : get a list of known map locations for this gene
         Args : none
         Ret  : list of map locations, each a hashref as:
                {  map_name => string map name,
                   chromosome => string chromosome name,
                   marker     => (optional) associated marker name,
                   position   => numerical position on the map,
                   units      => map units, either 'cm', for centimorgans,
                                 or 'b', for bases
                }
         Side Effects: none

     ontology_terms
         Usage: my @terms = $genepage->ontology_terms();
         Desc : get a list of ontology terms
         Args : none
         Ret  : hash-style list as:
                  termname => human-readable description,
         Side Effects: none
         Example:
            my %terms = $genepage->ontology_terms()
            # and %terms is now
            (  GO:0016711 => 'F:flavonoid 3'-monooxygenase activity',
               ...
            )
       Note that the value in that has is the the concatenation of F:, B: or C:
       for molecular_function, biological_process, or cellular_component GO
       terms respectively. If the term does not belong to GO, there is no
       prepended identifier.

     dbxrefs
         Usage: my @dbxrefs = $genepage->dbxrefs();
         Desc : get a list of database cross-references for info related to this gene
         Args : none
         Ret  : list of strings, like type:id e.g. ('PFAM:00012')
         Side Effects: none

     comments
         Usage: my @comments = $genepage->comments();
         Desc : get a list of comments with types
         Args : none
         Ret  : a hash of comment=>type, where type is optional (empty string)
         Side Effects: none

     literature_references
         Usage: my @refs = $genepage->lit_refs();
         Desc : get a list of literature references for this gene
         Args : none
         Ret  : list of literature reference identifiers, as type:id,
                like ('PMID:0023423',...)
         Side Effects: none

     summary_text
         Usage: my $summary = $page->summary_text();
         Desc : get a text string of plain-English summary text for this gene
         Args : none
         Ret  : string of summary text
         Side Effects: none

     organism
         Usage: my $species_info = $genepage->organism
         Desc : get a handful of species-related information
         Args : none
         Ret  : hashref as:
                { ncbi_taxon_id => ncbi taxon id, (e.g. 3702),
                  binomial      => e.g. 'Arabidopsis thaliana',
                  common        => e.g. 'Mouse-ear cress',
                }
         Side Effects: none

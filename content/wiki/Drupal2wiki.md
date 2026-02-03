---
title: "Drupal2wiki"
---
# Drupal2wiki


Perl script written by Eric Just to
copy Drupal nodes to a MediaWiki:


``` de1
#!/usr/bin/perl -w
 
use strict;
use WWW::Mechanize;
use HTML::TreeBuilder::XPath;
use HTML::WikiConverter;
use Data::Dumper;
 
my $mech = WWW::Mechanize->new();
 
my $wiki_url = "http://wiki.gmod.org/index.php";
 
my @urls = qw (
http://www.gmod.org/face_caucus_apidb_user_studies_and_impact_on_development
http://www.gmod.org/face_caucus_sgn_associating_solanaceae_loci_with_phenotype
http://www.gmod.org/face_caucus_ucsc_user_interface_issues_challenges_in_a_many_organism_database
http://www.gmod.org/january_2007_meeting
http://www.gmod.org/nih_2002_workshop_on_model_organism_databases
http://www.gmod.org/user-interface-caucus
http://www.gmod.org/mod_user_interfaces_outline_of_topics
http://www.gmod.org/mod_user_interfaces_sample_of_several_mod_top_level_functions
);
 
 
foreach my $url_to_convert (@urls) {
 
   $mech->get( $url_to_convert );
 
   warn "could not get page: $url_to_convert" unless $mech->success();
   next unless $mech->success();
 
   my $tree= new HTML::TreeBuilder::XPath();
   $tree->parse( $mech->content() );
 
   #Get title
   my $title = $tree->findvalue( '//h1[@class="title"]')->value();
   if ( !$title ) {
      $title = $tree->findvalue( '//title')->value();
      $title =~ s/ [|].+//g;
   }
   die "could not parse title" if !$title;
 
   # delete navigation links for now
   my $nav_node = $tree->findnodes( '//div[@id="main"]//div[@class="nav"]')->[0];
   $nav_node->delete() if $nav_node;
 
   # delete submitted span
   my $submitted_nodes = $tree->findnodes( '//span[@class="submitted"]');
   map { $_->delete() } @$submitted_nodes;
 
   # delete drupal links section
   my $links_nodes = $tree->findnodes( '//div[@class="links"]');
   map { $_->delete() } @$links_nodes;
 
   my $content_nodes = $tree->findnodes( '//div[@id="main"]//div[@class="content"]');
 
   my $count = 0;
 
   # wiki page text
   my $wiki_text;
   foreach my $node ( @{$content_nodes} ) {
       my $html = $node->as_HTML();
       $html =~ s/ style="{?([^}"]+)}?"//g; # "
 
       # convert to wikimedia format
       my $wc = new HTML::WikiConverter( dialect => 'MediaWiki' );
       my $converted_text = $wc->html2wiki( $html );
 
       # strip out leftover div tags
       $converted_text =~ s/<\/?div[^>]*>//g;
 
       # Now all internal links (not starting with http)
       # change [some link]
       # to:  [[some link]]
       # change [?q=node/71 GBrowse] into [[GBrowse]]
       $converted_text =~ s/\[(?!http)([^\s]*) ([^\]]+)\]/[[$2]]/g;
 
       # append node to new wiki page text
       $wiki_text .= $converted_text."\n";
   }
 
    # now simply find or create the page
    # and paste wiki text into edit box,  
    # submit the form, and there's your new page!
    my $url = $wiki_url."?title=".$title."&action=edit";
    eval {
       warn $url;
       $mech->get($url);
       die unless ($mech->success);
 
       $mech->submit_form(
            form_number => 1,
            fields      => { wpTextbox1 => $wiki_text},
        );
       die unless ($mech->success);
    };
    if($@) {
        print "An error occurred : ".$@."\n";
    }
    else {
       print "converted $title\n";
    }
}
```


[Category](Special%253ACategories "Special%253ACategories"):

- [Wiki Tools](Category%253AWiki_Tools "Category%253AWiki Tools")

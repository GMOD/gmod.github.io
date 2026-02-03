---
title: "Print-wiki-tables"
---




<span id="top"></span>




# <span dir="auto">Print-wiki-tables</span>











The process described on this page is obsolete. The process described on
[Chado Schema Documentation
HOWTO](Chado_Schema_Documentation_HOWTO "Chado Schema Documentation HOWTO")
is the the current one. This page should be deleted once the new process
has been fully adopted.




``` de1
#!/usr/bin/perl -w
=head1 NAME
 
print-wiki-tables.pl
 
=head1 SYNOPSIS
 
Examples:
 
  >print-wiki-tables.pl -m cv > cv.wiki
 
or
 
  >print-wiki-tables.pl -all > allmodules.wiki
 
=head1 DESCRIPTION
 
The postgresql_autodoc script will create an HTML schema diagram. For example:
 
 >postgresql_autodoc -f chado -u user -d chado --password=passwd -l .
 
This creates a "chado.html" file when the argument to "-f" is set to "chado" as
in the example above. The HTML can be customized by modifying the
html.tmpl file from the postgresql_autodoc package. Use the "-l" argument
if you need to tell postgresql_autodoc where your custom html.tmpl file is.
 
The script prints out Wiki text for the tables in these modules, taken
from chado.html. Run this script in the same directory as "chado.html" and
pass the script the name of one or more Chado modules.
 
=cut
 
my $tables = {
companalysis => [qw(
analysis
analysisfeature
analysisprop)],
contact => [qw(
contact
contact_relationship)],
cv => [qw(
cv
cvprop
cvterm
cvterm_dbxref
cvterm_relationship
cvtermpath
cvtermprop
cvtermsynonym
dbxrefprop)],
expression => [qw(
eimage
expression
expression_cvterm
expression_image
expression_pub
feature_expression)],
general => [qw(
db
dbxref
project
tableinfo)],
genetic => [qw(
environment
environment_cvterm
feature_genotype
genotype
phendesc
phenotype_comparison
phenstatement)],
library => [qw(
library
library_cvterm
library_feature
library_pub
library_synonym
libraryprop)],
map => [qw(
featuremap
featuremap_pub
featurepos
featurerange)],
organism => [qw(
organism
organism_dbxref
organismprop)],
phenotype => [qw(
feature_phenotype
phenotype
phenotypeprop
phenotype_cvterm)],
phylogeny => [qw(
phylonode
phylonode_dbxref
phylonode_organism
phylonode_pub
phylonode_relationship
phylonodeprop
phylotree
phylotree_pub)],
 
</pub => [qw(
pub
pub_dbxref
pub_relationship
pubauthor
pubprop)],
mage => [qw(
acquisition
acquisition_relationship
acquisitionprop
arraydesign
arraydesignprop
assay
assay_biomaterial
assay_project
assayprop
biomaterial
biomaterial_dbxref
biomaterial_relationship
biomaterial_treatment
biomaterialprop
channel
control
element
element_relationship
elementresult
elementresult_relationship
magedocumentation
mageml
protocol
protocolparam
quantification
quantification_relationship
quantificationprop
study
study_assay
studydesign
studydesignprop
studyfactor
studyfactorvalue
treatment)],
sequence => [qw(
feature
feature_cvterm
feature_cvterm_dbxref
feature_cvterm_pub
feature_cvtermprop
feature_dbxref
feature_pub
feature_pubprop
feature_relationship
feature_relationship_pub
feature_relationshipprop
feature_relationshipprop_pub
feature_synonym
featureloc
featureloc_pub
featureprop
featureprop_pub
synonym)],
stock => [qw(
stock
stock_cvterm
stock_dbxref
stock_genotype
stock_pub
stock_relationship
stock_relationship_pub
stockcollection
stockcollection_stock
stockcollectionprop
stockprop
stockprop_pub)],
www => [qw(
wwwuser
wwwuser_author
wwwuser_cvterm
wwwuser_expression
wwwuser_feature
wwwuser_genotype
wwwuser_interaction
wwwuser_organism
wwwuser_phenotype
wwwuser_project
wwwuser_pub
wwwuserrelationship)],
natural_diversity => [qw(
nd_geolocation
nd_experiment
nd_experiment_project
nd_experimentprop
nd_experiment_pub
nd_geolocationprop
nd_protocol
nd_reagent
nd_protocol_reagent
nd_protocolprop
nd_experiment_stock
nd_experiment_protocol
nd_experiment_phenotype
nd_experiment_genotype
nd_reagent_relationship
nd_reagentprop
nd_experiment_stockprop
nd_experiment_stock_dbxref
nd_experiment_dbxref
nd_experiment_contact
)],
};
 
my ($help,@modules,$all);
 
GetOptions( "m=s" => \@modules,
            "h"   => \$help,
                           "all" => \$all );
@modules = split(/,/,join(',',@modules));
@modules = keys %$tables if ($all);
 
usage() if ($help || !@modules);
 
my $file = "chado.html";
 
my $wc = HTML::WikiConverter->new(dialect => 'MediaWiki');
 
my $html = extract($file);
 
my $wikitext = $wc->html2wiki($html);
 
my @tables = split /^(?===\s*Table:.+)/m, $wikitext;
 
for my $module (@modules) {
        print "No such module: $module\n" if (!exists $tables->{$module});
        for my $table (@tables) {
                for my $tablename ( @{$tables->{$module}} ) {
                        print "$table\n\n" if ($table =~ /\+\s+public.$tablename\s+Structure/);
                }
        }
}
 
sub extract {
        my $file = shift;
        local $/ = undef;
        open MYIN, $file;
        my $str = <MYIN>;
        $str;
}
 
sub usage {
        exec('perldoc',$0);
        exit(0);
}
 
__END__
```





[Category](Special%253ACategories "Special%253ACategories"):

- [Wiki Tools](Category%253AWiki_Tools "Category%253AWiki Tools")






## Navigation menu









### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>




### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/Print-2Dwiki-2Dtables" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 20:05 on 8 October
  2012.</span>
<!-- - <span id="footer-info-viewcount">15,890 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->





package Bio::Graphics::Browser2::Plugin::STRAnnotator;
use strict;
use Bio::Graphics::Browser2::Plugin;
use CGI qw(:standard *table);

use vars '$VERSION','@ISA';
$VERSION = '0.0';

@ISA = qw(Bio::Graphics::Browser2::Plugin);

sub name { "Short Tandem Repeats" }

sub description {
  p("This plugin finds and displays Short Tandem Repeats.");
}

sub type { 'annotator' }

sub init{
}

sub config_defaults {
  { min_repeat => 5 };
}

sub reconfigure {
  my $self = shift;
  my $current_config = $self->configuration;
  my $defaults       = $self->config_defaults;
  
  my $mr = $self->config_param('min_repeat');
  $current_config->{min_repeat} = ($mr >= 2) ? $mr : $defaults->{min_repeat};
}

sub configure_form {
  my $self = shift;
  my $current_config = $self->configuration;
  
  return table( TR( th( "Minimum Repeat: " ), 
                    td( textfield(-name      => $self->config_name('min_repeat'),
                                  -value     => $current_config->{min_repeat},
                                  -size      => 12,
                                  -maxlength => 4) ),
                  )
              );
}

sub annotate {
  my $self      = shift;
  my $segment   = shift;
  my $abs_start = $segment->start;
  my $ref       = $segment->seq_id;
  my $dna       = $segment->seq;
  $dna          = $dna->seq if ref $dna;
  $dna          =~ tr/[a-z]/[A-Z]/;
  my $min       = $self->configuration->{min_repeat} - 1;

  ## add feature type
  my $feature_list = $self->new_feature_list;

  my @colors = qw/red orange yellow green blue purple turquoise/;
  $feature_list->add_type('STR' => { glyph   => 'segments',
                                     key     => 'Short Tandem Repeats',
                                     bgcolor => sub{ $colors[shift->attributes('color')%@colors]; },
                                     fgcolor => sub{ $colors[shift->attributes('color')%@colors]; },
                                     height  => 8,
                                     label   => sub{ my %a = shift->attributes(); "$a{seq}($a{count})";},
                                     bump    => 0,
                                   });

  ## find STR's
  my $color = 0;
  while ( $dna =~ /([ACTG]{2,5})\1{$min,}/g ) {
    # skip if all same nucleotide
    my $t = $&;
    for my $n qw/A C T G/ {
      goto SKIP if ($t=~s/$n/$n/g) == length $t;
    }

    my $start = $abs_start + (length $`);
    my $stop  = $start + (length $&) - 1;
    my $count = (length $&)/(length $1);
    my %attr = ( 'seq'   => $1,
                 'count' => $count,
                 'color' => $color,
               );
               
    my $feature = Bio::Graphics::Feature->new( -start      => $start,
                                               -stop       => $stop,
                                               -ref        => $ref,
                                               -name       => "$1($count)",
                                               -type       => 'STR',
                                               -attributes => \%attr,
                                             );
    $feature_list->add_feature($feature => 'STR');

    SKIP:
    $color++;
  }

  return $feature_list;
}

1;

__END__

=head1 NAME

Bio::Graphics::Browser2::Plugin::STRAnnotator - Display Short Tandem Repeats

=head1 SYNOPSIS

In the appropriate gbrowse configuration file:

 plugins = STRAnnotator

=head1 DESCRIPTION

This plugin finds and displays Short Tandem Repeats in the current viewing window.

=head1 BUGS

None known yet

=head1 SEE ALSO

L<Bio::Graphics::Browser2::Plugin>

=head1 AUTHOR

Joseph Bullard E<lt>jtb4478@rit.eduE<gt>.

=cut

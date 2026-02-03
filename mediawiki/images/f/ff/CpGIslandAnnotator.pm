package Bio::Graphics::Browser2::Plugin::CpGIslandAnnotator;
use strict;
use Bio::Graphics::Browser2::Plugin;
use CGI qw(:standard *table);

use vars '$VERSION','@ISA';
$VERSION = '1.0';

@ISA = qw(Bio::Graphics::Browser2::Plugin);

sub name { "CpG Islands" }

sub description {
  p("This plugin calculates and displays the ratio of observed/expected CG ".
    "dimers over a user specified interval (default 400bp).");
}

sub type { 'annotator' }

sub init{
}

sub config_defaults {
  return { window_size => 400  };
}

sub reconfigure {
  my $self = shift;
  my $current_config = $self->configuration;
  my $defaults       = $self->config_defaults;

  my $ws = $self->config_param('window_size');
  if ($ws >= 50 && $ws <= 2000) {
    $current_config->{window_size} = $ws;
  } else {
    $current_config->{window_size} = $defaults->{window_size};
  }
}

sub configure_form {
  my $self = shift;
  my $current_config = $self->configuration;

  return table( TR( th( "Window Size: " ), 
		    td( textfield(-name      => $self->config_name('window_size'),
				  -value     => $current_config->{window_size},
				  -size      => 12,
				  -maxlength => 4) )
		  )
	      );
}

sub annotate {
  my $self    = shift;
  my $segment = shift;
  my $window  = $self->configuration->{window_size};
  my $start   = $segment->start;
  my $ref     = $segment->seq_id;
  my $dna     = $segment->seq;
  $dna        = $dna->seq if ref $dna;
  $dna        =~ tr/[a-z]/[A-Z]/;
  my $length  = length $dna;

  #####
  ## Add feature types
  my $feature_list = $self->new_feature_list;

  my $cg = sub{ ($_[0]>.9) ? 'red'   : ($_[0]>.8) ? 'orange' : ($_[0]>.7) ? 'yellow' : 
		($_[0]>.6) ? 'green' : ($_[0]>.3) ? 'blue'   : 'white'; };

  $feature_list->add_type("CpGIslands" =>{ glyph   => 'segments',
					   key     => 'CpG Islands',
					   bgcolor => sub{ $cg->(shift->attributes('RATIO')); },
					   fgcolor => sub{ $cg->(shift->attributes('RATIO')); },
					   height  => sub{ sprintf("%3.0f", shift->attributes('OBSERVED')); },
					   label   => sub{ ($length < 10001) ? sprintf("%5.2f", shift->attributes('RATIO')) : 0 ; },
					   bump    => 0,
					 });

  #####
  ## Find dimer info
  my $window_start = $window - $start%$window;
 
  for (my $i=$window_start; $i<$length; $i+=$window) {
    my $subseq = substr($dna, $i, $window);
    my %attr = ProcessSeq($subseq);
    next unless $attr{RATIO};

    my $feature = Bio::Graphics::Feature->new(  -start      => $start+$i,
						-stop       => $start+$i+$window,
						-ref        => $ref,
						-name       =>  "<br><b>Ratio: $attr{RATIO}".
								"<br>Observed: $attr{OBSERVED}".
								"<br>Expected: ".int($attr{EXPECTED}+.5).
								"</b><br>",
						-type       => "CpGIslands",
						-attributes => \%attr);
    $feature_list->add_feature($feature => 'CpGIslands');
  }

  return $feature_list;
}

sub ProcessSeq {
  my $seq = shift;
  my $len = length $seq;
  my %counts;

  $counts{OBSERVED}++ while $seq=~/CG/g;
  $counts{OBSERVED} ||= 0;

  my $C = $seq=~tr/C/C/;
  my $G = $seq=~tr/G/G/;
  $counts{EXPECTED} = sprintf("%3.5f", $C*$G/$len);
  return %counts if $counts{EXPECTED} == 0;

  $counts{RATIO} = sprintf("%3.5f", $counts{OBSERVED}/$counts{EXPECTED});

  return %counts;
}

1;

__END__

=head1 NAME

Bio::Graphics::Browser2::Plugin::CpGPluginAnnotator - Display CpG Island observed/expected ratios

=head1 SYNOPSIS

In the appropriate gbrowse configuration file:

 plugins = CpGPluginAnnotator

=head1 DESCRIPTION

This plugin displays the ratio of observed/expected for CG dimers over a user-specified
interval (default 400 bp). The coloring of the features is based on the ratio, with red
being the highest range and blue the lowest. The height is equal to number of CG dimers
actually observed.

=head1 BUGS

None known yet

=head1 SEE ALSO

L<Bio::Graphics::Browser2::Plugin>

=head1 AUTHOR

Joseph Bullard E<lt>jtb4478@rit.eduE<gt>.

=cut

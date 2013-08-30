use strict;
use warnings;
use Data::Dumper;

my %dna_strings = ();

open(FIN, '<', 'rosalind_cons.txt');

my $key = undef;
while (<FIN>) {
  chomp($_);
  if ($_ =~ /^>/) {
  $key = $_;
    $key =~ s/>//;
  }
  elsif ($key) {
    if (!defined $dna_strings{$key}) {
        $dna_strings{$key} = "";
    }
    $dna_strings{$key} .= $_;
  }
}

close(FIN);


my %profile = get_profile();
print "---Consensus---\n";
print get_consensus(\%profile)  . "\n";

print "---Profile---\n";
for my $key ('A', 'C', 'G', 'T') {
    print $key . ": ";
    my $letter_profile = $profile{$key};
    for (my $i = 0; $i < @{$letter_profile}; ++$i) {
        print $letter_profile->[$i] . " ";
    }
    print "\n";
}

#
# Find the profile of the given dna strings.
#
sub get_profile {
  my ($j) = @_;

  my %profile = ();
  for my $key (keys(%dna_strings)) {
    my $dna = $dna_strings{$key};
    for (my $i = 0; $i < length($dna); ++$i) {
      my $letter = substr($dna, $i, 1);
      # Init the profile line for the given letter with zeros if it does not exist.
      if (!defined $profile{$letter}) {
        $profile{$letter} = [];
        for (my $l = 0; $l < length($dna); ++$l) {
          $profile{$letter}[$l] = 0;
        }
      }

      $profile{$letter}[$i] = $profile{$letter}[$i] + 1;
    }
  }

  return %profile;
}

sub get_consensus {
    my ($profile) = @_;

    my $len = scalar @{$profile->{'A'}};
    my $keys = keys %{$profile};
    my $consensus = "";

    for (my $i = 0; $i < $len; ++$i) {
        my $max_key = "";
        my $max_count = 0;
        for my $key (keys %{$profile}) {
            if ($profile->{$key}[$i] > $max_count) {
                $max_key = $key;
                $max_count = $profile->{$key}[$i];
            }
        }
        $consensus .= $max_key;
    }

    return $consensus;
}
use strict;
use warnings;

my $dna1 = undef;
my $dna2 = undef;

open(FIN, "<", 'rosalind_hamm.txt');
while (<FIN>) {
  chomp($_);
  if (!defined $dna1) {
    $dna1 = $_;
  }
  else {
    $dna2 = $_;
  }
}
close(FIN);

print "Hamming distance " . compute_hamming_distance($dna1, $dna2);
print "\n";

sub compute_hamming_distance {
  my ($d1, $d2) = @_;
  my $len = length($d1);

  my $mutations = 0;
  for my $i (0 .. $len) {
    my $d1_str = substr($d1, $i, 1);
    my $d2_str = substr($d2, $i, 1);
    $mutations += 1 if ($d1_str ne $d2_str);
  }
  return $mutations;
}

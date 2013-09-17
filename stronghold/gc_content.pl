use strict;
use warnings;
use Data::Dumper;

open(FIN, "<", 'rosalind_gc.txt');
# Hash keyed by FASTA key with dna sequence as the value.
my %dna = ();
my $id = undef;
while (<FIN>) {
  chomp($_);
  if ($_ =~ />/) {
    $id = $_;
    $id =~ s/>//;
  }
  else {
    if (!defined $dna{$id}) {
      $dna{$id} = "";
    }
    $dna{$id} .= $_;
  }
}
close(FIN);
print Dumper(\%dna);

my $max_gc = 0;
my $max_gc_fasta = "";
for my $seq (keys %dna) {
  my $gc = calc_gc_content($dna{$seq});
  if ($gc > $max_gc) {
    $max_gc = $gc;
    $max_gc_fasta = $seq;
  }
  print $seq . " " . $dna{$seq} . " value " . calc_gc_content($dna{$seq}) . "\n";
}

print "FASTA: " . $max_gc_fasta . ", GC: " . $max_gc . "\n";

# Calculate GC content of the dna sequence.
sub calc_gc_content {
  my ($sequence) = @_;
  
  my $count = 0;  
  my $len = length($sequence);
  for my $pos (0 .. $len) {
    my $gact = substr($sequence, $pos, 1); 
    if ($gact =~ /G|C/) {
      $count += 1;
    } 
  }

  return $count / $len;
}

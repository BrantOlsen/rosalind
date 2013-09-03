use strict;
use warnings;

my $dna_s = "GCCATCTGCAGACCTCTGCAGTTCTGCAGTCTGCAGCTCTGCAGAGGGTCTGCAGTCTGCAGATTTCTGCAGGTCTGCAGGCGTCTGCAGTCTGCAGCGTATCTGCAGTCTCCGTTCTCTGCAGTCTGCAGCTCTGCAGTGATCGTGTCTGCAGTGGGTCTCTGCAGTCTGCAGTGGTCTGCAGTTCTGCAGATACGTCTGCAGACTCTGCAGATCTGCAGGTCTGCAGTCTGCAGTCTGCAGTCTGCAGTCTGCAGATTCCCAGATCTGCAGTCTGCAGTCTGCAGTCTGCAGCAATCTGCAGGCCGTTCATCTGCAGTTCTGCAGGCTCTGCAGCATCTGCAGCCTCTGCAGTCTTCTGCAGCATCTGCAGCTCTGCAGATCTGCAGAGACAACTCTGCAGCGTCTGCAGGTCTGCAGGATCTGCAGATATTAGTCTGCAGGTCTGCAGTCTGCAGTCTGCAGTCTGCAGAGTCTGCAGAGCGTATCTGCAGCTGCGTCTGCAGTTCAGTCTGCAGCCCCATCTGCAGCTAGTTGTTGTCTGCAGGCTCTGCAGATCTGCAGCGCTCTGCAGATTCTGCAGTCTGCAGCGTCTGCAGCTCTGCAGCTCTACTCTGCAGGCTGGCGCGGATCTGCAGTTACTTCTGCAGCTTCTGCAGGATTTCTGCAGCTTCTGCAGTCTGCAGTCTGCAGTCTGCAGGTTCTGCAGTCTGCAGCTCTGCAGCTATCTGCAGTCTGCAGTTCGCATCGGTCTGCAGGGCGATGTCTGCAGTTCTGCAGATTCTGCAGTCTGCAGCTCTGCAGATCTGCAGTCTGCAGTCTGCAG";
my $dna_t = "TCTGCAGTC";
my $dna_t_len = length($dna_t);
my $dna_s_len = length($dna_s);

for (my $i = 0; $i < $dna_s_len; ++$i) {
  last if ($i + $dna_t_len > $dna_s_len);

  my $sub = substr($dna_s, $i, $dna_t_len);
  if ($sub eq $dna_t) {
    print $i+1 . " ";
  }
}
print "\n";
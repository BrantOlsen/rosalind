open(FIN, "<", 'rosalind_rna.txt');
while (<FIN>) {
  my $dna = $_;
  $dna =~ s/T/U/g;
  print $dna . "\n";
}
close(FIN);

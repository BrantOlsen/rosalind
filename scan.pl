open(FIN, "<", 'rosalind_dna.txt');
while (<FIN>) {
  my $dna = $_;
  print $dna . "\n";
  my $acount = $dna =~ tr/A//;
  my $gcount = $dna =~ tr/G//;
  my $ccount = $dna =~ tr/C//;
  my $tcount = $dna =~ tr/T//;
  print $acount . "\n";
  print $ccount . "\n";
  print $gcount . "\n";
  print $tcount . "\n";
}
close(FIN);

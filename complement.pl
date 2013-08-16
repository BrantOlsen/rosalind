open(FIN, "<", 'rosalind_revc.txt');
while (<FIN>) {
  my $dna = $_;
  my $comp = "";
  my $len = length($dna);
  for my $pos (0 .. $len) {
    my $symbol = substr($dna, $pos, 1); 
    if ($symbol =~ /A/) {
      $symbol = "T";
    }
    elsif ($symbol =~ /T/) {
      $symbol = "A";
    }
    elsif ($symbol =~ /G/) {
      $symbol = "C";
    }
    elsif ($symbol =~ /C/) {
      $symbol = "G";
    }
    $comp = $symbol . $comp;
  }
  print "COMP = " . $comp . "\n";
  print "ORIG = " . $dna . "\n";
}
close(FIN);

use warnings;

my $number_of_months = 5;
my $litter_size = 3;
my $rabbits = 2;
my $baby_rabbits = 0;
my @babies = (0, 0);

for my $n (1 .. $number_of_months) {
  $rabbits = $rabbits + $babies[0];
  $babies[0] = $babies[1];
  $babies[1] = 0;

  my $multiplier = $rabbits / 2;
  if ($rabbits % 2 == 1) {
    $multiplier = ($rabbits - 1) / 2;
  } 

  $babies[1] = $multiplier * $litter_size * 2; 
  print $rabbits . " in " . $n . " months with " . $babies[0] . " babies and " . $babies[1] . "\n";
  print "array " . join(",", @babies) . "\n";
  
}

print "Rabbit pairs " . $rabbits/2 . "\n";
$rabbits = $rabbits + $babies[0] + $babies[1];
print "Pairs " . $rabbits/2;
print "\n";



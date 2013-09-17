use warnings;

my $age_limit = 3;
my $number_of_months = 6;
my $litter_size = 3;

my @rabbits;
for my $age (0 .. $age_limit) {
  $rabbits[$age] = 0;
}
$rabbits[2] = 2;

for my $n (1 .. $number_of_months) {
  print "Before: " . join(", ", @rabbits) . "\n";
  $count = count(\@rabbits, $age_limit);
  
  # all the babies aged, do not count the dead ones.
  for my $age_index (1 .. $age_limit+1) {
    $rabbits[$age_limit+1 - $age_index] = $rabbits[$age_limit+1 - $age_index - 1];
  }
  # youngest have grown up.
  $rabbits[0] = 0;

  my $multiplier = $count / 2;
  if ($count % 2 == 1) {
    $multiplier = ($count - 1) / 2;
  } 

  $rabbits[0] = $multiplier * $litter_size * 2;
  print "After: " . join(", ", @rabbits) . "\n";
}

sub count {
  my $rabbits = shift;
  my $age_limit = shift;
  
  $count = 0;
  for my $age (2 .. $age_limit) {
    $count = $count + $rabbits->[$age];
  }
  return $count;
}



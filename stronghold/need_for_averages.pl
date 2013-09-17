use strict;
use warnings;
use Data::Dumper;

my $dataset = "19053 17676 18821 18973 16334 16944";
my @couples = split(' ', $dataset);
my $offspring_count = 2;

my $prob = $couples[0] * $offspring_count;
$prob += $couples[1] * $offspring_count;
$prob += $couples[2] * $offspring_count;
$prob += $couples[3] * $offspring_count * 3/4;
$prob += $couples[4] * $offspring_count * 1/2;
$prob += $couples[5] * $offspring_count * 0;

print $prob . "\n";
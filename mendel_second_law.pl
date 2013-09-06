use strict;
use warnings;
use Data::Dumper;

my $k = 2;
my $N = 1;

my $tom = "Aa Bb";
my $num_children = 2;
my %children_a = ('AA' => $num_children, 'Aa' => 2 * $num_children, 'aa' => $num_children);
my $total_possible = 1;

    print Dumper(\%children_a);
# Loop through the generations starting at the second one.
for (my $i = 0; $i < $k - 1; ++$i) {
    my $AA = $children_a{'AA'};
    my $Aa = $children_a{'Aa'};
    my $aa = $children_a{'aa'};

    $children_a{'AA'} = $AA * 2 * $num_children + $Aa * $num_children;
    $children_a{'Aa'} = $AA * 2 * $num_children + $Aa * 2 * $num_children;
    $children_a{'aa'} = $Aa * $num_children + $aa * 2 * $num_children;

    print Dumper(\%children_a);
}
$total_possible = $children_a{'AA'} + $children_a{'Aa'} + $children_a{'aa'};

print "Total possible = " . $total_possible . "\n";
print Dumper(\%children_a);
my $chance_for_tom = $children_a{'Aa'} / $total_possible;

print $chance_for_tom . "\n";
print $chance_for_tom * $chance_for_tom . "\n";

print "Should be .684\n";
use strict;
use warnings;

# Homozygous for dominant factor.
my $k = 30;
# Heterozygous
my $m = 18;
# Homozygous for recessive factor.
my $n = 15;
my $total_pop = $k + $m + $n;

my $dom_chance = compute_dom_count(1, $k-1, $m, $n) * $k / $total_pop;
my $het_chance = compute_dom_count(.5, $k, $m-1, $n) * $m / $total_pop;
my $rec_chance = compute_dom_count(0, $k, $m, $n-1) * $n / $total_pop;
print "Dom: " . $dom_chance . "\n";
print "Het: " . $het_chance . "\n";
print "Rec: " . $rec_chance . "\n";
print "Chance for dom: " . ($dom_chance + $het_chance + $rec_chance) . "\n";

#
# $parent - 1, .5, or 0
#
sub compute_dom_count {
    my ($parent, $k, $m, $n) = @_;

    my $total = 0;
    my $dom_count = 0;

    # homozygous dom
    $total += 4 * $k;
    $dom_count += 4 * $k;
    print "p:" . $parent . ", count=" . $dom_count . ", total=" . $total . "\n";

    # heterozygous dom
    $total += 4 * $m;
    if ($parent == 1) {
        $dom_count += 4 * $m;
    }
    elsif ($parent == .5) {
        $dom_count += 3 * $m;
    }
    elsif ($parent == 0) {
        $dom_count += 2 * $m;
    }
    print "p:" . $parent . ", count=" . $dom_count . ", total=" . $total . "\n";

    # homozygous rec
    $total += 4 * $n;
    if ($parent == 1) {
        $dom_count += 4 * $n;
    }
    elsif ($parent == .5) {
        $dom_count += 2 * $n;
    }
    print "p:" . $parent . ", count=" . $dom_count . ", total=" . $total . "\n";

    # Final chance for dom given the parent.
    return $dom_count / $total;
}
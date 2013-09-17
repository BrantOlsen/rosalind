use strict;
use warnings;
use Data::Dumper;

open(FIN, "<", "rosalind_tran.txt");
my $key1 = <FIN>;
my $key2 = undef;
my $s1 = "";
my $s2 = "";
while (<FIN>) {
    chomp($_);
    if ($_ =~ />/) {
        $key2 = $_;
    }
    elsif (! defined $key2) {
        $s1 .= $_;
    }
    else {
        $s2 .= $_;
    }
}
close(FIN);

print "s1 = " . $s1 . "\n";
print "s2 = " . $s2 . "\n";

my @dna1 = split("", $s1);
my @dna2 = split("", $s2);

my $transition_count = 0;
my $transversion_count = 0;
my $match = 0;
for (my $i = 0; $i < @dna1; ++$i) {
    if (isTransition($dna1[$i], $dna2[$i])) {
        $transition_count += 1;
    }
    elsif (isTransversion($dna1[$i], $dna2[$i])) {
        $transversion_count += 1;
    }
    if ($dna1[$i] eq $dna2[$i]) {
        $match += 1;
    }
}
print "transition = " . $transition_count . "\n";
print "transversion = " . $transversion_count . "\n";
print $transition_count / $transversion_count . "\n";
print $transversion_count / $transition_count . "\n";

sub isTransition {
    my ($a, $b) = @_;

    if ($a eq "A" && $b eq "G") {
        return 1;
    }
    if ($a eq "G" && $b eq "A") {
        return 1;
    }
    if ($a eq "C" && $b eq "T") {
        return 1;
    }
    if ($a eq "T" && $b eq "C") {
        return 1;
    }

    return 0;
}

sub isTransversion {
    my ($a, $b) = @_;

    if ($a eq "A" && $b eq "C") {
        return 1;
    }
    if ($a eq "C" && $b eq "A") {
        return 1;
    }
    if ($a eq "A" && $b eq "T") {
        return 1;
    }
    if ($a eq "T" && $b eq "A") {
        return 1;
    }
    if ($a eq "C" && $b eq "G") {
        return 1;
    }
    if ($a eq "G" && $b eq "C") {
        return 1;
    }
    if ($a eq "G" && $b eq "T") {
        return 1;
    }
    if ($a eq "T" && $b eq "G") {
        return 1;
    }

    return 0;
}
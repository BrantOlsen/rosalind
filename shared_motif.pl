use strict;
use warnings;
use Data::Dumper;

open(FIN, "<", "rosalind_lcsm.txt");
my %dna = ();
my $key = "";
while (<FIN>) {
    chomp($_);
    if ($_ =~ /^>/) {
        $key = $_;
        $key =~ s/>//;
        $dna{$key} = "";
    }
    else {
        $dna{$key} .= $_;
    }
}

close(FIN);

my $first_dna = $dna{$key};
my $longest_common = "";
for (my $i = 0; $i < length $first_dna; ++$i) {
    my $no_match = 0;
    for (my $k = 2; $i + $k < length $first_dna && $no_match == 0; ++$k) {
        my $sub = substr($first_dna, $i, $k);
        print "Checking " . $sub . "\n";
        for my $sample (keys %dna) {
            if (index($dna{$sample}, $sub) == -1) {
                print "No match for " . $sample . " with " . $sub . "\n";
                $no_match = 1;
            }
        }
        if ($no_match == 0 && length $longest_common < length $sub) {
            $longest_common = $sub;
        }
    }
}
print "\nLCS: " . $longest_common . "\n";
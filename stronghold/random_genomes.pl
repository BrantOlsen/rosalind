use strict;
use warnings;
use Data::Dumper;

my %dna_strings = ();

open(FIN, '<', 'rosalind_ran.txt');

my $dna_str = undef;
my @probs = [];
while (<FIN>) {
    chomp($_);
    if (!defined $dna_str) {
        $dna_str = $_;
    }
    else {
        @probs = split(' ', $_);
    }
}

close(FIN);

my @dna = split('', $dna_str);

for my $k (@probs) {
    my $prob = 0;
    for my $acgt (@dna) {
        if ($acgt =~ /A|T/) {
            $prob += log10(at_prob($k));
        }
        else {
            $prob += log10(gc_prob($k));
        }
    }
    print sprintf("%.3f ", $prob);
}

print "\n-5.737 -5.217 -5.263 -5.360 -5.958 -6.628 -7.009" . "\n";

sub at_prob {
    my $gc_content = shift;
    return (1 - $gc_content) / 2;
}

sub gc_prob {
    my $gc_content = shift;
    return $gc_content / 2;
}

sub log10 {
    my $n = shift;
    return log($n) / log(10);
}
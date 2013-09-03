use strict;
use warnings;
use Data::Dumper;

open(FIN, "<", 'rosalind_splc.txt');
my %dna = ();
my $dna_key = undef;
my $key = "";
while (<FIN>) {
    chomp($_);
    if ($_ =~ /^>/) {
        $key = $_;
        $key =~ s/>//;
        $dna{$key} = "";
        if (!defined $dna_key) {
            $dna_key = $key;
        }
    }
    else {
        $dna{$key} .= $_;
    }
}
close(FIN);

for my $k (keys %dna) {
    if ($k ne $dna_key) {
        my $intron = $dna{$k};
        $dna{$dna_key} =~ s/$intron//g;
    }
}
my $exon = $dna{$dna_key};
# To RNA from DNA.
$exon =~ s/T/U/g;
# To Protein from RNA.
my %rna_condon_table = (
'UUU' => 'F', 'CUU' => 'L', 'AUU' => 'I',
'GUU' => 'V', 'UUC' => 'F', 'CUC' => 'L',
'AUC' => 'I', 'GUC' => 'V', 'UUA' => 'L',
'CUA' => 'L', 'AUA' => 'I', 'GUA' => 'V', 'UUG' => 'L',
'CCG' => 'P', 'ACG' => 'T', 'GCG' => 'A',
'UAU' => 'Y', 'CAU' => 'H', 'AAU' => 'N', 'GAU' => 'D',
'UAC' => 'Y', 'CAC' => 'H', 'AAC' => 'N', 'GAC' => 'D',
'UAA' => 'Stop', 'CAA' => 'Q', 'AAA' => 'K', 'GAA' => 'E',
'UAG' => 'Stop', 'CAG' => 'Q', 'AAG' => 'K', 'GAG' => 'E',
'UGU' => 'C', 'CGU' => 'R', 'AGU' => 'S', 'GGU' => 'G',
'UGC' => 'C', 'CGC' => 'R', 'AGC' => 'S', 'GGC' => 'G',
'UGA' => 'Stop', 'CGA' => 'R', 'AGA' => 'R', 'GGA' => 'G',
'UGG' => 'W', 'CGG' => 'R', 'AGG' => 'R', 'GGG' => 'G',
'CUG' => 'L', 'AUG' => 'M','GUG' => 'V',
'UCU' => 'S', 'CCU' => 'P', 'ACU' => 'T', 'GCU' => 'A',
'UCC' => 'S', 'CCC' => 'P', 'ACC' => 'T', 'GCC' => 'A',
'UCA' => 'S', 'CCA' => 'P', 'ACA' => 'T', 'GCA' => 'A',
'UCG' => 'S',
);
my $protein = "";
for (my $i = 0; $i < length($exon); $i = $i + 3) {
    my $sub = substr($exon, $i, 3);
    my $prot = $rna_condon_table{$sub};

    last if ($prot eq 'Stop');
    $protein .= $prot;
}
print $protein . "\n";
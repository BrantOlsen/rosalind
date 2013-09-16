use strict;
use warnings;
use Data::Dumper;

my $n = 5;

my @terms = (1..$n);
my $len = $n-1;
my @a = (0..$len);
my $count = 0;
genperm();
print $count . "\n";

# http://www.perlmonks.org/?node_id=24270
sub genperm {
    no warnings 'recursion';
    print join(" ",@terms[@a]),"\n";
    ++$count;

    my ($k,$j) = ($len-1,$len);
    $k-- while ($k>=0 and $a[$k]>$a[$k+1]);
    return(0) if ($k<0);
    $j--    while ($a[$k]>$a[$j]);
    swap($j,$k++); $j=$len;
    swap($j--,$k++) while ($j>$k);

    genperm();
}

sub swap {
    my ($i,$j) = @_; my $t = $a[$i];
    ($a[$i],$a[$j]) = ($a[$j],$t);
}
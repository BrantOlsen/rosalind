use strict;
use warnings;
use Bio::DB::GenBank;
use Bio::DB::Query::GenBank;

my $query = '"Aulacomya"[Organism] AND ("2008/06/24"[PDAT] : "2012/05/20"[PDAT])';
my $query_obj = Bio::DB::Query::GenBank->new(-db => 'nucleotide',
                                             -query => $query
                                             );
print "Count is " . $query_obj->count . "\n";

my $gb = Bio::DB::GenBank->new();
my $stream = $gb->get_Stream_by_query($query_obj);

my $count = 0;
while (my $seq = $stream->next_seq) {
    # do something with the sequence object
    print $seq->display_id, "\t", $seq->length, "\t", $seq->get_dates(),  "\n";
    ++$count;
}
print $count ." nucleotide genbank entries found.\n";
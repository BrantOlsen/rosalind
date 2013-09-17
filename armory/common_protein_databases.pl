#
# There is a bug in the SwissProt web page that is causing redirects
# which are not handled by the library. Need a bug fix in BioPerl for this.
#
use strict;
use warnings;
use Bio::DB::SwissProt;
use Bio::DB::GenBank;

my $db_obj = Bio::DB::GenBank->new;
my $seq_obj = $db_obj->get_Seq_by_acc("J01673");
print $seq_obj->desc() ."\n";

#my $uniprot_url = "http://www.uniprot.org/uniprot/H3SRW3";
#my $swiss_prot_url = "http://www.uniprot.org/uniprot/H3SRW3.txt";
my $protein_id = "H3SRW3";
my $other_id = "SYG_UREU1";
#my $sp = Bio::DB::SwissProt->new();
#my $seq = $sp->get_Seq_by_id('KPY1_ECOLI');
my $expasy = Bio::DB::SwissProt->new('-servertype' => 'expasy',
                                     '-hostlocation' => 'us');
my $seq = $expasy->get_Seq_by_acc($protein_id);;

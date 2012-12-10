#!/usr/bin/perl

use lib ".";
use AMOS::ParseFasta;

my $file = $ARGV[0];

open(IN, $ARGV[0]) || die ("cannot open $ARGV[0]: $!\n");

my $pf = new AMOS::ParseFasta(\*IN);

while (my ($head, $data) = $pf->getRecord()){
  print "$head ", length($data), "\n";
}

close(IN);

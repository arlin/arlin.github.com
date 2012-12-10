#!/usr/bin/perl

#use strict;

my $filename = $ARGV[0];
open(IN, $filename) || die ("Cannot open $filename: $!\n");

while (<IN>){
  $line = $_
  chomp $line;

  my @fields = split("\t", $line);

  print sprintf("Query: %s\nReference: %s\nPercent identity: %.2f\n", 
$fields[0], $fields[1], $fields[2]);
}
exit(0);

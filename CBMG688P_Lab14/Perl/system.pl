#!/usr/bin/perl

my $file = $ARGV[0];

open(IN, "grep '>' $file |") || die ("Cannot grep $file: $!\n");

while (<IN>){
  my $name = $_;
  $name =~ s/^>//;  # replace > with nothing
  $name =~ /^(\S+)/; # match first non-whitespace 
  $name = $1;

  print "$name\n";
}

close(IN);
exit(0);


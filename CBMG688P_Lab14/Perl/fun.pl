#!/usr/bin/perl


print max(3,7), "\n";

exit(0);

sub max()
{
  my $a = $_[0];
  my $b = $_[1];
  
  if ($a >= $b){
   return $a;
  } else {
   return $b;
  }
}

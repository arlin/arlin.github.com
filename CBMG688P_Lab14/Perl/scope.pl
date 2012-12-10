#!/usr/bin/perl

my $name = "Mihai";

print $name, "\n";

{
	$name = "Bob";
	print $name, "\n";
}

print $name, "\n";

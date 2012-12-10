my @array = (7, 2 , 15, 18, 23);

print "Num elements = $#array + 1\n";
print "Num elements = ", $#array + 1, "\n";

print "element 3 = $array[3]\n";

print "Array = ", join(" ", @array), "\n";

push @array, 5;

print "Num elements = ", $#array + 1, " last = $array[$#array]\n";

print "Array = ", join(" ", @array), "\n";

$array[3] = 1000;

print "element 3 = $array[3]\n";

print "Array = ", join(" ", @array), "\n";

@increasing = sort {$a <=> $b} @array;
@decreasing = sort {$b <=> $a} @array;

print "Increasing array = ", join(" ", @increasing), "\n";
print "Decreasing array = ", join(" ", @decreasing), "\n";

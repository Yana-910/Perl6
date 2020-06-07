#!/usr/bin/perl6

my $file1="file1.txt";
my $file2="file2.txt";

my %list1;
my %list2;

for $file1.IO.lines -> $line
{
	my ($a, $b) = $line.split(/\s/);
	%list1.push($a => $b); 
}

for $file2.IO.lines -> $line
{
	my ($a, $b) = $line.split(/\s/);
	%list2.push($a => $b);
}

say "Name\tAge\tTelephone";
say "-------------------------";

for keys(%list1) -> $k
{
	if ( %list2{$k} )
	{
		say "$k\t%list1{$k}\t%list2{$k}";
	}
	else
	{
		say "$k\t%list1{$k}\t---";
	}
}

for keys(%list2) -> $k
{
   if ( ! %list1{$k} )
   {
		say "$k\t---\t%list2{$k}";
   }
}
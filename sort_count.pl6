#!/usr/bin/perl6

my $access_file="access.log";
my @lines = $access_file.IO.lines;;
my @lines_sorted = @lines.sort;

my @Result;
my $last_ip="";
my $count_ip=0;

for @lines_sorted -> $i
{
	if ( $i ~~ / (\d ** 1..3) ** 4 % '.' / ) 
	{
		my $ip=$/;

		if ( $last_ip ne $ip)
		{
			if ($last_ip ne "") 
			{
				@Result.push($count_ip~"\t"~$last_ip);
			}
			$last_ip = $ip;
			$count_ip = 1;
		}
		else
		{
			$count_ip++;
		}
	}
}
if ($last_ip ne "") 
{
	@Result.push($count_ip~"\t"~$last_ip);
}

sub naturally ($a)
{
    $a.lc.subst(/(\d+)/, -> $/ { 0 ~ $0.chars.chr ~ $0 }, :g) ~ "\x0" ~ $a
}

@Result = @Result.sort: { .&naturally };
my @Result_sort = @Result.reverse;

loop (my $i = 0; $i < 10; $i++)
{
	say @Result_sort[$i];
}
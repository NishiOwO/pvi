#!/usr/bin/env perl
# $Id$
if(@ARGV < 1){
	die;
}

my $lic = "";
open(LIC, "<", "LICENSE") or die;
while(<LIC>){
	$lic = $lic . " * " . $_;
}
close(LIC);

foreach my $f (@ARGV){
	my $inlic = 0;
	my $t = "";
	open(IN, "<", $f) or die;
	while(<IN>){
		my $l = $_;
		$l =~ s/\r?\n$//g;
		if($l eq "/*-"){
			$inlic = 1;
			$t = $t . "/*-\n" . $lic . " */\n";
		}elsif($l eq " */"){
			$inlic = 0;
		}elsif(!$inlic){
			$t = $t . $l . "\n";
		}
	}
	close(IN);

	open(OUT, ">", $f) or die;
	print OUT $t;
	close(OUT);
}

#!/usr/bin/env perl
# $Id$
if(@ARGV < 1){
	die;
}

my $licwidth = 76;

my $lic = "";
open(IN, "<", "LICENSE") or die;
while(<IN>){
	my $l = $_;
	$l =~ s/\r?\n$//g;
	$lic = $lic . " * " . $l . (" " x ($licwidth - length($l) - 2)) . "*\n";
}
close(IN);

my $contact = "";

open(IN, "<", "CONTACT") or die;
while(<IN>){
	my $l = $_;
	$l =~ s/\r?\n$//g;
	$contact = $contact . " * " . $l . (" " x ($licwidth - length($l) - 2)) . "*\n";
}
close(IN);

foreach my $f (@ARGV){
	my $inlic = 0;
	my $t = "";
	open(IN, "<", $f) or die;
	while(<IN>){
		my $l = $_;
		$l =~ s/\r?\n$//g;
		if(($l eq "/*-") || ($l =~ /\/\*{3,}/)){
			$inlic = 1;
			$t = $t . "/*" . ("*" x $licwidth) . "\n";
			$t = $t . $lic;
			$t = $t . " *" . ("*" x $licwidth) . "\n";
			$t = $t . $contact;
			$t = $t . " *" . ("*" x $licwidth) . "/\n";
		}elsif($inlic && (($l eq " */") || ($l =~ / \*{3,}\//))){
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

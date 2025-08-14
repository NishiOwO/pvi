#!/usr/bin/env perl
# $Id$
open(OUT, ">", "mk/depend.mk");
print OUT ('# $Id$' . "\n");

opendir(D, "src");
my @dir = readdir(D);
closedir(D);

foreach my $dirname (@dir){
	if(!($dirname =~ /\.c$/)){
		next;
	}
	my $objname = $dirname;

	$objname =~ s/\.c$/.o/;

	print OUT ("src/$objname: src/$dirname include/common.h include/machdep.h config.h\n");
}

close(OUT);

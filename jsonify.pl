#!/usr/bin/perl -w


#open the input file specified in the command line
open IN, "<", $ARGV[0] || die "Input file could not be opened. Please check spelling, path and location.";

#open a file handle to write out to
open OUT, ">", "output.json" || die "Cannot create output file. Please check directory permissions.";

my @tmp_arr = <IN>;

#We no longer need the input file
close IN;

#Here is wher the actual conversion happens
#Each replacement operation converts an xml tag to its JSON equivalent.
foreach $i (@tmp_arr) {
	$i =~ s/<string>/: /g;
	$i =~ s/<\/string>//g;
	$i =~ s/<key>|<\/key>/"/g;
	$i =~ s/<false\/>/: false/g;
	$i =~ s/<true\/>/: true/g;
	$i =~ s/<integer>/: /g;
	$i =~ s/<\/integer>//g;
	$i =~ s/<dict>/{/g;
	$i =~ s/<\/dict>/}/g;
	$i =~ s/<array>/[/g;
	$i =~ s/<\/array>/]/g;
	$i =~ s/\s\+:/:/g;
	$i =~ s/\n:/ :/g;
}

#writeout
foreach (@tmp_arr) {
	print OUT "$_";
}

close OUT;

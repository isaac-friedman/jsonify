#!/usr/bin/perl -w


# Welcome to version 2.0 of jsonify in which I 
# scrap the confusing regexen and write something
# quick and easy-to-follow because this is going
# into use.

use strict;

#necessary libraries
use Mac::PropertyList qw( :all);
use JSON::XS;

print "Imports correctly. \n";

open my($IN), "<", $ARGV[0] || die "Input file could not be opened. Please check spelling, path and location.";
print "Filehandle opened. \n";
#parse the plist into a perl data structure.
my $data = parse_plist_fh($IN)->as_perl;
close IN;

print "conversion performed. \n";

my $jsonData = encode_json($data);

open OUT, ">", "output.json" || die "Cannot create output file. Please check directory permissions.";

print OUT $jsonData;

close OUT;

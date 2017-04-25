#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;
use DateTime;

my $input;
while(<>) {
    $input .= $_;
}


my $now = DateTime->now();

foreach my $line (split /\n/, $input) {
    chomp $line;
    my ($date_string, $bin_details) = split /\s+/, $line, 2;
    my ($bin_mday, $bin_mon, $bin_year) = split /\//, $date_string;
    my $bin_date = DateTime->new(year => $bin_year, month => $bin_mon, day => $bin_mday);
    if($bin_date > $now) {
        $bin_details =~ s/Refuse Bin for Non-Recycling/rubbish/;
        $bin_details =~ s/Blue-Topped Bin for Recycling/recycling/;
        my $time_left = $bin_date->delta_days($now);
        my $days_left = $time_left->in_units("days");
        if($days_left == 1) {
            print "Tomorrow the " . $bin_details . " will be collected\n";
        } else {
            my $dow = $bin_date->day_name();
            print "In $days_left days ($dow) the " . $bin_details . " will be collected\n";
        }
        
    }
}



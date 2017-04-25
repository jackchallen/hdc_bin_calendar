#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;
use HTML::TokeParser;

#This slightly pointless-looking hack is to accommodate the fact that HTML::TokeParser doesn't seem to like
# working on <>, so it doesn't work as a pipeline *AND* on commandline args.
my $html;
while (<>) {
    $html .= $_;
}

my $p = HTML::TokeParser->new(\$html);


my @bin_days;

while (defined(my $t = $p->get_tag("table"))) {
    my $column_offset = 0;
    my @table_row;

    while (defined(my $te = $p->get_tag("tr", "/tr", "th", "td"))) {
    my $text = $p->get_text;
        if($te->[0] eq "/tr") {
            push @bin_days, [@table_row] if(scalar @table_row);
            @table_row = ();
        } else {
            push @table_row, $text if($text);
        }
        #print Dumper($te);
    }
}

#print Dumper(\@bin_days);
foreach my $collection (@bin_days) {
    my $text_day  = $collection->[0];
    my $text_date = $collection->[1];
    my $text_bin  = $collection->[2];
    next unless($text_day and $text_date and $text_bin);
    next if($text_day eq "DAY");
    my ($mday, $mon_num, $year) = split "/", $text_date;
    print $text_date, " ", $text_bin, "\n";
}

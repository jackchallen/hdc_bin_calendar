# hdc_bin_calendar
Simple method for getting Horsham District Council's Bin (recycling/rubbish/refuse) calendars into plaintext

# How to use

Firstly you need your Universal Property Reference (which might be provided by
West Sussex County Council [WSCC] rather than HDC), which is available on the
personalised bin calendar homepage, either by reading the HTML source or
sniffing the HTTP headers.

Then,

        ./1_get_calendar.sh XXXXX | ./2_extract_calendar.pl | ./3_relative_day_collections.pl

Where XXXXX is your Universal Property Reference Number (UPRN) available from
this webpage:

<https://www.horsham.gov.uk/bins/bin_calendars>




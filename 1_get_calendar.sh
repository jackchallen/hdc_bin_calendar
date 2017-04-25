#!/bin/bash

UPRN=$1
if [ "zzz${UPRN}" = "zzz" ] ; then
    echo "$0 UPRN" >&2
    echo " Where UPRN is your Universal Property Reference Number from your council"
    exit 1
fi

curl -d uprn=${UPRN} https://satellite.horsham.gov.uk/environment/refuse/cal_details.asp 2>/dev/null

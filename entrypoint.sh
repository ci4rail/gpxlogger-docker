#!/bin/bash

set -o errexit   # abort on nonzero exitstatus
set -o pipefail  # don't hide errors within pipes


while true; do
    filename=track-$(date +%Y-%m-%d-%H:%M:%S).gpx
    /usr/bin/gpxlogger "$@" >/out/${filename} & loggerpid=`echo $!`
    echo "started /usr/bin/gpxlogger -r "$@", pid ${loggerpid}"
    sleep 300
    kill $loggerpid
    echo "stopped gpxlogger pid ${loggerpid}"
done
#!/bin/bash

logfile="/home/scripts/logs/fuse-rename-tv.sh.log"

if pidof -o %PPID -x "fuse-rename-tv.sh"; then
echo "$(date "+%d.%m.%Y %T") EXIT: fuse-rename-tv.sh already running."
exit 1
fi

find /home/plex/fuse-tv/ -type f ! -name '*p.*' | while read line; do
oldPath=tv-gd:${line#/home/plex/fuse-tv}
if ! res="`exiftool -b "$line" -ImageHeight`"; then continue; fi
newPath="${oldPath/\./ HDTV-${res}p.}"
echo "$(date "+%d.%m.%Y %T") RENAMED $oldPath, ADDED HDTV-${res}p" | tee -a "$logfile"
rclone moveto "$oldPath" "$newPath" | tee -a "$logfile"
done
exit

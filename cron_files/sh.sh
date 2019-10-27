#!/bin/bash


logfile="/home/scripts/logs/fuse-rename-tv.sh.log"


find /home/plex/fuse-tv/ -type f -name '*956p.*' | while read line; do
oldPath=tv-gd:${line#/home/plex/fuse-tv}
#if ! res="`exiftool -b "$line" -ImageHeight`"; then continue; fi
newPath="${oldPath/956p/1080p}"
echo "$(date "+%d.%m.%Y %T") RENAMED $oldPath, FIXED 956p to 1080p" | tee -a "$logfile"
rclone moveto "$oldPath" "$newPath"
done
exit


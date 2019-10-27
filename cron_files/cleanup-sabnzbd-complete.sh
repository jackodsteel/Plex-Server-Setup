SAB_DIR="/home/qbman/sabnzbd/complete/"

find $SAB_DIR -mindepth 1 -type d -mtime +5 -exec rm -rv {} \;
find $SAB_DIR -mindepth 1 -type d -name "*\.[0-9]" -exec rm -rv {} \;
find $SAB_DIR -mindepth 1 -type d -empty -delete

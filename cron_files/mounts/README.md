These scripts manage the mounting of Google Drive based media storage,
and the merging of the remote content with local content to enable seamless read/write as if it is all one folder.

Currently used folder structure:

/merged contains the combined remote and local content for access by programs such as Sonarr/Radarr/Plex/Sabnzbd/Deluge.

```
/merged:
	/torrents
	/sabnzbd
	/tv
	/movies
```

Below are the current mounts being used. The first three are rclone mounts.

We have two encrypted folders in the Google Drive using different encryption keys,
so initally we mount the whole GoogleDrive to /mnt/googledrive using rclone.

We then run two more rclone mounts using the "crypt" functionality to decrypt the movies and TV shows into /mnt/data.

We then use mergerfs to create the /merged folder that combines the previously mounted Google Drive hosted movies and TV shows with local versions which are located in /data.

Note: All media related folders including downloads for usenet and torrents must also be in the /merged directory as otherwise the download clients will need to perform a full move instead of being able to use hardlinks.


Mounts:
* Google Drive ->  /mnt/googledrive via rclone
* Encrypted M ->  /mnt/data/movies via rclone
* Encrypted TV -> /mnt/data/tv via rclone
* Merged /mnt/data and /data -> /merged via mergerfs

Files:
* mount-rclone-drive.cron mounts the entire Google Drive to /mnt/googledrive
* mount-crypt Is a generic mounting script for rclone crypt mounts used by mount-m and mount-tv
* mount-m.cron mounts the rclone crypt for movies
* mount-tv.cron mounts the rclone crypt for TV shows
* mount-merge.cron handles the /mnt/data and /data merge using mergerfs


All files are expected to be run regularly using cron which can be setup as follows:

Make script executable with: `chmod +x {SCRIPT_FILE}`
Add script to crontab by typing crontab -e and entering the line below
```
* * * * * {SCRIPT_FILE} >/dev/null 2>&1
```
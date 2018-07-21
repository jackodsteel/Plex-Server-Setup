# Plex-Server-Setup
All configurations and information to replicate my Plex server

## Read only setup:

#### Plexdrive to host the main Google Drive
https://github.com/dweidenfeld/plexdrive

* Configs:

Supplied in configs folder as .plexdrive (with private keys removed)    
Default location is /root/

#### Rclone to decrypt the directories
https://rclone.org/downloads/

* Configs:

Supplied in configs folder as rclone (with private keys removed)    
Default location is /root/.config/

### Steps:
1. Install PlexDrive and Rclone
2. Copy config files to correct directories
3. Currently setup using cron, maybe should switch to systemd
4. Download cron files and set them to run on start and every few minutes, the required cron files are:    
  * `mountplexdrive.cron`    
  * `mount-m.cron`    
  * `mount-tv.cron`

5. Install Plex, link movies and tv to their respective mount locations which are specified in the cron files. They are by default /home/plex/m-gd and /home/plex/tv-gd
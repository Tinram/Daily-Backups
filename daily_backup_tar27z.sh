#!/bin/sh

# File:         daily_backup_tar27z.sh
# Description:  Simple backup of present day file changes (including hidden files) using TAR and 7-Zip
# Usage:        Place in highest directory to be backed-up; chmod 700
# Copyright:    Martin Latter, June 2014
# Version:      0.02
# License:      GNU GPL version 3.0 (GPL v3); http://www.gnu.org/licenses/gpl.html
# Link:         https://github.com/Tinram/Daily-Backups.git


find . -type f -mtime -1 -fprint FL.txt
NOW="backup_"$(date +"%Y%m%d")
tar cf - --files-from=FL.txt | 7za a -si -pP@55w0rd -mx=7 -md64m -ms=1m -mmt=on -mhe=on $NOW.tar.7z
mv $NOW.tar.7z /mnt/server_path # change destination path
rm FL.txt

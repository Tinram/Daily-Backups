#!/bin/sh

# Usage:        Place in highest directory to be backed-up; chmod 700.
# Copyright:    Martin Latter, June 2014
# Version:      0.01
# License:      GNU GPL version 3.0 (GPL v3); http://www.gnu.org/licenses/gpl.html
# Link:         https://github.com/Tinram/Daily-Backups.git


find . -type f -mtime -1 -fprint fl.txt
NOW="db_"$(date +"%Y%m%d")
tar cf - --files-from=fl.txt | 7za a -si -pPa55Word -mx=7 -md64m -ms=1m -mmt=on -mhe=on $NOW.tar.7z
mv $NOW.tar.7z /mnt/server_path
rm fl.txt

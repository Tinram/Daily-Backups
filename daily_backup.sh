#!/bin/sh

# File:           daily_backup.sh
#
# Description:    Backup using 7-Zip of 1. date range of file changes until today, or 2. today's file changes.
#                 Hidden files are excluded.
#                 Avoids the temporary ~/.cache unprotected file with TAR opening.
#
# Usage:          Place this file in the topmost directory to be backed-up.
#                 Change PASSWORD
#                 chmod 700 daily_backup.sh
#                 ./daily_backup.sh
#                 ./daily_backup.sh 2018-03-01
#
# Execution       1. enter startdate as first switch parameter in format YYYY-MM-DD, e.g. ./daily_backup.sh 2018-03-01
#                 2. call without ./daily_backup.sh
#                    which prompts for startdate: enter date, else hit ENTER for just today's files.
#
# Copyright:      Martin Latter, 11/09/2014
# Version:        0.03, rv. 28/03/18
# License:        GNU GPL version 3.0 (GPL v3); http://www.gnu.org/licenses/gpl.html
# Link:           https://github.com/Tinram/Daily-Backups.git


## CONFIGURATION ####
PASSWORD='P@55w0rd'
FILELIST=FL.txt
#####################


STARTDATE=$1
ENDDATE=$(date -d "+1 day" +"%Y-%m-%d") # MUST BE DAY +1


if [ -z "$1" ]; then
	echo 'enter start date (YYYY-MM-DD) or ENTER for just today'
	read response
	if [ -z $response ]; then # if blank = today
		STARTDATE=$(date +"%Y%m%d")
	else
		STARTDATE=$response # else = date range
	fi
fi


# DATE RANGE
find . -type d -path '*/\.*' -prune -o -not -name '.*' -type f -newermt $STARTDATE ! -newermt $ENDDATE -fprintf $FILELIST '%P\n'

NOW="backup_"$(date +"%Y%m%d")

7za a -p$PASSWORD -t7z -mx=7 -md64m -ms=4m -mmt=on -mhe=on $NOW.7z @FL.txt

rm $FILELIST

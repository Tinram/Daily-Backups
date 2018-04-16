
# Daily Backups

## Purpose

Backup daily changes to files using the [7-Zip](http://7-Zip.org) application, which offers high data compression and strong data encryption.


## OS Support

+ [Linux](#linux)
+ [Windows](#windows)


<a id="linux"></a>
## Linux

Install 7-Zip (*p7zip* or *p7zip-full*)

e.g. for Debian-based distros: `sudo apt-get install p7zip-full`

----

### *daily_backup_tar27z.sh*

+ TAR/7-Zip compressed amd encrypted backup of current day file changes.
+ Includes hidden files and retains file ownership.
+ Automatically move created *.tar.7z* file to another location, such as an external drive.

#### Usage

+ Place *daily_backup_tar27z.sh* in the topmost directory to be backed-up.
+ Change `P@55w0rd` (in `-pP@55w0rd`) to something better.
+ Change `/mnt/server_path` to the destination location.
+ `chmod 700 daily_backup_tar27z.sh`
+ Execute directly `./daily_backup_tar27z.sh` or add to cron.

----

### *daily_backup.sh*

+ 7-Zip compressed and encrypted backup of:
    + date range of file changes until today, or
    + files changed on current date.
+ Hidden files are excluded.
+ File ownership not retained, only file permissions.
+ *.7z* file remains in directory where created.

#### Usage

+ Place *daily_backup.sh* in the topmost directory to be backed-up.
+ Change PASSWORD value to something longer and more complex than `P@55w0rd`
+ `chmod 700 daily_backup.sh`

#### Execute

1. `./daily_backup.sh`
2. `./daily_backup.sh 2018-03-01`

1 -- Prompts for the startdate: enter date in the format YYYY-MM-DD, or hit ENTER for just today's files.

2 -- Startdate is the first switch parameter.


<a id="windows"></a>
## Windows

The batch script *daily\_backup.bat* copies all files residing in two directories that have changed on the current day, compresses them into a single password-protected *.7z* file, copies this file to an external drive, and deletes the temporary files.

*(This is not a backup solution – merely an assistive one, e.g. run just before the end of a day's work.)*

+ Download and install [7-Zip](http://7-Zip.org).
+ Clone / download this repo.
+ Edit *daily\_backup.bat* in a text editor.
+ Change the password (*P@55w0rd*) to something more secure (line 18).
+ If you have not installed 7-Zip into its default installation directory (*C:\Program Files\7-Zip*) on your PC, change this path (line 17) (*C:\Program Files (x86)\7-Zip* for the 32-bit 7-Zip version on 64-bit Windows).
+ Create a temporary directory on your hard drive for copied files: *C:\t-backup*
+ Change the path(s) of the directories that require backing up (at present, the script copies all files changed in two locations: *C:\temp* and *C:\Documents and Settings\John.Doe\My Documents\reference*).
+ Change the backup location directory path (*\\ServerName\Users\John.Doe\dbs*) – ideally this should be an external drive / network location (line 20). If the external drive is mapped, the path may be as simple as e.g. *H:\backup*
+ Move the batch file to your chosen directory location, then add it to Windows Scheduled Tasks (in Control Panel) and set the time you wish the script to run (e.g. 17:25 every day).
+ Thoroughly test your batch file (for testing, you need at least one file that has been created / changed today in the scanned directories; double click on the batch file in Windows Explorer to execute it) to make sure it runs without errors (test in command prompt window) and a *.7z* file appears in your backup location.
+ When finalised, `@echo off` added at the start of the script will suppress the output of the command-line window at run time (if you find this distracting).
+ Large files placed in the scanned directories may result in a large *.7z* file in the backup location – some file types such as PNGs will not compress.
+ If you are running a 'pro' Windows version, encrypt the .bat file (right click > Properties > Advanced > Encrypt Contents... > OK) to make it more difficult for snoopers to view the password of your *.7z* backup files.
+ On Windows 7+, this script will need to be run as administrator, else access will not be permitted to the 7-Zip directory within *Program Files*.
+ The script searches for UK-style filestamps. If US filestamps (MM/DD/YYYY) are required, you will need to change the date format in lines 8, 9, and 10 of the batch script.


## License

Scripts are released under the [GPL v.3](https://www.gnu.org/licenses/gpl-3.0.html).

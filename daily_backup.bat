
REM Copyright:    Martin Latter, September 2007
REM Version:      0.3
REM License:      GNU GPL version 3.0 (GPL v3); http://www.gnu.org/licenses/gpl.html
REM Link:         https://github.com/Tinram/Daily-Backups.git


SET dates="db_%date:~6,6%-%date:~3,2%-%date:~0,2%"
SET dates2=%date:~3,2%-%date:~0,2%-%date:~6,6%
SET dates3=db_%date:~6,6%-%date:~3,2%-%date:~0,2%

IF EXIST "c:\t-backup\%dates%" (RD /s /q "c:\t-backup\%dates%")

XCOPY "c:\temp" "c:\t-backup\%dates%" /s /i /D:%dates2%
XCOPY "c:\documents and settings\john.doe\my documents\reference" "c:\t-backup\%dates%" /s /i /D:%dates2%

CD c:\program files\7-Zip
7z a %dates%.7z -t7z -mx=7 -md64M -ms=1m -mmt=on -mhe=on -pPa55Word "C:\t-backup\%dates%\*"

MOVE %dates3%.7z \\ServerName\users\john.doe\dbs

RD c:\t-backup\%dates3% /s /q

@echo off

rem SETTING DATE
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

rem SETTING VARIABLES

set "netadd=192.168.168.xx"

set "net_path=Q:\\%netadd%\aaaaaaa /user:%USERNAME%"

set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
set "log_path=C:\Users\%USERNAME%\log"
set "full_log_path=%log_path%\%fullstamp%_full.log"

IF NOT EXIST %log_path% mkdir %log_path%

echo Starting full backup > %full_log_path%
echo Mounting net directory: %net_path% >> %full_log_path%
net use %net_path%
echo Starting copy >> %full_log_path%
ROBOCOPY "c:\Users\%USERNAME%\Documents\File di Outlook" "Q:\bksett1\posta" /MIR >> %full_log_path%
echo Unmounting net directory >> %full_log_path%
net use Q: /delete
echo All done. >> %full_log_path%
pause
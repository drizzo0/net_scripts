set "user= "
set "netadd=192.168.168.xx"

@echo off

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"


echo Starting full backup > C:\Users\%user%\log\%fullstamp%_full.log
echo Mounting net directory >> C:\Users\%user%\log\%fullstamp%_full.log
net use Q:\\%netadd%\aaaaaaa /user:%user%
echo Starting copy >> C:\Users\%user%\log\%fullstamp%_full.log
ROBOCOPY "c:\Users\%user$\Documents\File di Outlook" "Q:\bksett1\posta" /MIR >> C:\Users\%user%\log\%fullstamp%_full.log
echo Unmounting net directory >> C:\Users\%user%\log\%fullstamp%_full.log
net use Q: /delete
echo All done. >> C:\Users\%user%\log\%fullstamp%_full.log
pause
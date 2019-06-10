@echo off

set "netadd=192.168.168.xx"
set "password=password"
set "user=USERNAME"

set "net_path=Q:\\%netadd%\aaaaaaa /user:%user% %password%"
set "source_path=c:\Users\%USERNAME%\Documents\File di Outlook"
set "dest_path=Q:\bksett1\posta"

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
set "log_path=%dest_path%\logs"
set "full_log_path=%log_path%\%fullstamp%_full.log"

IF NOT EXIST %log_path% mkdir %log_path%

net use %net_path%
ROBOCOPY %source_path% %dest_path% >> %full_log_path%
net use Q: /delete
pause

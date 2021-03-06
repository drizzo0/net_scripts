@echo off

set "log_path=C:\Users\%USERNAME%\log\"

echo Starting log cleaner.
echo Check log folder

IF EXIST %log_path% GOTO log_exists ELSE GOTO log_not_exists

:log_not_exists
echo Log folder does not exists.
pause
exit

:log_exists
echo Log folder exists.
rmdir /S /Q %log_path%
echo Checking if log folder were deleted.
IF EXIST %log_path% GOTO log_exists
echo Log folder deleted.
echo All done.
pause
exit
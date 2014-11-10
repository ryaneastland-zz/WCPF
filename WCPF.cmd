@echo off
color 2
:start
echo NOTE: MAKE SURE YOU RUN THIS AS ADMINISTRATOR OTHERWISE IT WON'T WORK!!!!!!!!
echo This is a quick little script I made to fix any problem that is caused by the windows user profile being corrupt.
echo First enter the username of the user with the broken profile.
set /p profile= Username of broken profile: 
echo Make sure you run these stages in order otherwise you may break even more things.
echo Stage 1. Stage one will backup and remove the old corrupt profile.
echo Stage 2. Stage two will restore the data from the broken profile.
echo Stage 3. Stage three will remove the backup don't do this unless you know stage 2 worked.
echo NOTE: IF YOU ARE ASKED IF YOU WANT TO DO SOMETHING OR NOT DURING ANY STAGE SELECT Y
set /p stage= Which stage are you up to 1/2/3?
if %stage% == 1 goto onecheck
if %stage% == 2 goto twocheck
if %stage% == 3 goto threecheck
:onecheck
set /p stage1= Are you sure you're up to stage 1 (y/n)?
if %stage1% == y goto one
if %stage1% == n goto start
:twocheck
set /p stage2= Are you sure you're up to stage 2 (y/n)?
if %stage2% == y goto two
if %stage2% == n goto start
:threecheck
set /p stage3= Are you sure you're up to stage 3 (y/n)?
if %stage3% == y goto three
if %stage3% == n goto start
:one
cls
mkdir %systemdrive%\users\old.%profile%
xcopy %systemdrive%\users\%profile%\* %systemdrive%\users\old.%profile%\ /s /i /H
rd /S %systemdrive%\users\%profile%
pause
exit
:two
cls
del %systemdrive%\users\old.%profile%\Ntuser.*
del %systemdrive%\users\old.%profile%\Ntuser.dat.*
xcopy %systemdrive%\users\old.%profile%\* %systemdrive%\users\%profile%\ /s /i
pause
exit
:three
cls
rd /S %systemdrive%\users\old.%profile%
pause
exit
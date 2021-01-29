@echo off
mode 54,15
title MyCity -- v1.0.0 (MultiPlayer)
color E

start Writter.cmd
:: Settings
cd C:\Users\%username%\AppData\Roaming

mkdir $mycity
cd $mycity
mkdir $mp
cd $mp

set user=%username%
set domain=city.%random%
set readTimeout=3
set ConnectionInfo=0
goto menu

:menu
cls
echo +---------------------  MyCity  ---------------------+
echo.
echo.
echo.
echo 1 - Create Server
echo 2 - Connect to Server
set /p menu= 
if %menu%==1 goto ServerCreate
if %menu%==2 goto ServerConnect

:ServerCreate
echo +---------------------  MyCity  ---------------------+
echo.
echo.
echo.
echo Creating server as %user% to domain %domain%
echo %user% > host.txt
echo %domain% > domain.txt
echo %username% -- Connected to this server > .core
set /a ConnectionInfo=1
goto Host

:Host
cls
for /f "Delims=" %%a in (.core) do (
    set Message=%%a
)
echo %Message%
goto Host
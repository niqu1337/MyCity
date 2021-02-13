@echo off
cd C:\Users\%username%\AppData\Roaming
mkdir $mycity
cd $mycity
mode 54,15
color E

title MyCity -- v3.0.5
echo x=msgbox("Can't initialize action. You playing this game too wrong!", 0+16, "MyCity ERROR") > error.vbs

set housePrice=250
set apartmentPrice=850
set villaPrice=1250
goto startup
	
:game
	echo %cash% > cash.ini
	echo %level% > level.ini
	echo %citizens% > citizens.ini

	echo %countH% > houses.ini
	echo %countA% > apartments.ini
	echo %countV% > villas.ini

	cls
	echo +---------------------  MyCity  ---------------------+
	echo CASH: %cash%  -  LEVEL: %level%
	echo HOUSES: %countH%  -  VILLAS: %countV%
	echo APARTMENS: %countA%  -  CITIZENS: %citizens%
	echo +----------------------------------------------------+
	echo.
	echo.
	echo.
	echo 1 - Build mode
	echo 2 - Hire staff
	echo 3 - Goto work
	echo.
	echo 4 - Exit And Save
	set /p SelectGame= 
	if %SelectGame%==1 goto BuildMode
	if %SelectGame%==2 goto HireMode
	if %SelectGame%==3 goto WorkMode
	if %SelectGame%==4 goto Exit
	goto error

:BuildMode
    cls
    echo 1 - Build House (250$)
    echo 2 - Build Apartment (850$)
    echo 3 - Build Villa (1250$)
    echo 4 - Exit build mode
    set /p SelectBuild= 
    if %SelectBuild%==1 goto BuildHouse
    if %SelectBuild%==2 goto BuildApartment
    if %SelectBuild%==3 goto BuildVilla
    if %SelectBuild%==4 goto game
    goto error

:HireMode
	cls
	echo 1 - Hire Police man
	echo 2 - Hire Firefighter
	echo 3 - Hire Paramedic
	echo 4 - Hire Emergency call operator
	echo 5 - Exit hire mode
	set /p SelectHire= 
	if %SelectHire%==1 goto HirePolice
	if %SelectHire%==2 goto HireFire
	if %SelectHire%==3 goto HireMedic
	if %SelectHire%==4 goto HireOperator
	if %SelectHire%==5 goto game
	goto error

:WorkMode
	cls
	echo 1 - Work in Mc Donald's
	echo 2 - Rob ATM
	echo 3 - Work as 911 Operator
	echo 4 - Exit work mode
	set /p SelectWork= 
	if %SelectWork%==1 goto MCDonalds
	if %SelectWork%==2 goto ATM
	if %SelectWork%==2 goto Operator
	if %SelectWork%==4 goto game
	goto error



:BuildHouse
	cls
	echo Building house... (wait 3 sec)
	ping -n 3 localhost > nul
	set /a cash=cash-housePrice
	set /a countH=countH+1
	set /a citizens=citizens+4
	echo House Builded!
	echo Your houses %countH%
	echo Your cash %cash%
	goto game

:BuildApartment
	cls
	echo Building apartment... (wait 5 sec)
	ping -n 5 localhost > nul
	set /a cash=cash-apartmentPrice
	set /a countA=countA+1
	set /a citizens=citizens+28
	echo Apartment Builded!
	echo Your apartments %countH%
	echo Your cash %cash%
	goto game

:BuildVilla
	cls
	echo Building villa... (wait 8 sec)
	ping -n 8 localhost > nul
	set /a cash=cash-villaPrice
	set /a countV=countV+1
	set /a citizens=citizens+58
	echo Villa Builded!
	echo Your villas %countH%
	echo Your cash %cash%
	goto game



:HirePolice
	cls
	set /a timeout=(%random% %%18)
	if timeout==0 goto HirePolice
	echo Finding police man... (wait %timeout% sec)
	ping -n %timeout% localhost > nul
	
	set /a citizens=citizens+1
	echo Finded new police man!
	ping -n 3 localhost > nul
	goto game

:HireFire
	cls
	set /a timeout=(%random% %%24)
	if timeout==0 goto HireFire
	echo Finding firefighter... (wait %timeout% sec)
	ping -n %timeout% localhost > nul
	
	set /a citizens=citizens+1
	echo Finded new firefighter!
	ping -n 3 localhost > nul
	goto game

:HireMedic
	cls
	set /a timeout=(%random% %%28)
	if timeout==0 goto HireMedic
	echo Finding paramedic... (wait %timeout% sec)
	ping -n %timeout% localhost > nul
	
	set /a citizens=citizens+1
	echo Finded new paramedic!
	ping -n 3 localhost > nul
	goto game

:HireOperator
	cls
	set /a timeout=(%random% %%30)
	if timeout==0 goto HireOperator
	echo Finding operator... (wait %timeout% sec)
	ping -n %timeout% localhost > nul
	
	set /a citizens=citizens+1
	echo Finded new operator!
	ping -n 3 localhost > nul
	goto game



:MCDonalds
	cls
	if MCDONALDS==0 goto McDonalds
	echo Working in McDonalds... (wait 8 sec)
	ping -n 8 localhost > nul
	
	set /a earnedCash=(%random% %%80)
	if earnedCash==0 goto MCDonalds
	set /a cash=cash+earnedCash
	echo You earned %earnedCash%!
	ping -n 3 localhost > nul
	goto game

:Operator
	cls
	echo In MyCity-v3.2!
	timeout 10 >>nul
	goto game

:ATM
	cls
	if ATM==0 goto ATM
	echo Robbing atm... (wait 18 sec)
	ping -n 18 localhost > nul
	
	set /a roll=(%random% %%3)
	if roll==0 goto ATM
	if roll==1 goto ATMOK
	if roll==2 goto ATMBAD

		:ATMOK
		set /a earnedCash=(%random% %%300)
		if earnedCash==0 goto ATMOK
		set /a cash=cash+earnedCash
		echo You earned %earnedCash%!
		ping -n 3 localhost > nul
		goto game
		
		:ATMBAD
		set /a lostCash=(%random% %%600)
		if lostCash==0 goto ATMBAD
		set /a cash=cash+lostCash
		echo You lost %lostCash%!
		ping -n 3 localhost > nul
		goto game
		


:LottoMode
	cls
	echo In MyCity-v3.2.1!
	timeout 10 >>nul
	goto game

:CreateSave
	cls
	echo Enter your player name
	set /p "plrName=>> "
	
	cls
	echo Enter your city name
	set /p "cityName=>> "
	
	echo %plrName% > .player
	echo %cityName% > .city
	
	echo 250 > cash.ini
	echo 1 > level.ini
	echo 0 > citizens.ini
	
	echo 0 > houses.ini
	echo 0 > apartments.ini
	echo 0 > villas.ini
	goto LoadSave

:LoadSave
	for /f "Delims=" %%a in (.player) do (
	set plrName=%%a
	)
	echo %plrName%
	
	for /f "Delims=" %%a in (.city) do (
	set cityName=%%a
	)
	echo %cityName%
	
	for /f "Delims=" %%a in (cash.ini) do (
	set cash=%%a
	)
	echo %cash%
	
	for /f "Delims=" %%a in (level.ini) do (
	set level=%%a
	)
	echo %level%
	
	for /f "Delims=" %%a in (citizens.ini) do (
	set citizens=%%a
	)
	echo %citizens%
	
	for /f "Delims=" %%a in (houses.ini) do (
	set countH=%%a
	)
	echo %countH%
	
	for /f "Delims=" %%a in (apartments.ini) do (
	set countA=%%a
	)
	echo %countA%
	
	for /f "Delims=" %%a in (villas.ini) do (
	set countV=%%a
	)
	echo %countV%
	
	goto game
	
:startup
	cls
    echo +---------------------  MyCity  ---------------------+
	echo.
	echo.
	echo.
	echo 1 - Play on new save
	echo 2 - Load last save
		set /p SelectStartup= 
		if %SelectStartup%==1 goto CreateSave
		if %SelectStartup%==2 goto LoadSave
		goto error

:error
	start error.vbs
	exit

:Exit
echo %cash% > cash.ini
echo %level% > level.ini
echo %citizens% > citizens.ini

echo %countH% > houses.ini
echo %countA% > apartments.ini
echo %countV% > villas.ini
exit

:: MyCity Made By niqu_#1337
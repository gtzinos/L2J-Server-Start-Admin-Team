@echo off
REM ~ Admin - Team - SAFORS ~ 
REM Contact
REM Skype: geotzinos
REM Email: geotzinos@gmail.com
title  ~ Admin - Team - SAFORS ~
SET CONTACT="Email : geotzinos@gmail.com"
REM Set your Login Server Path (WITHOUT FILE NAME !!!)
SET LoginServerPath="C:\Users\George\Desktop\l2\L2 Regenaration\loginserver\"
REM Set your Game Server Path (WITHOUT FILE NAME !!!)
SET GameServerPath="C:\Users\George\Desktop\l2\L2 Regenaration\gameserver\"
REM Set your Lineage II Server Path (WITHOUT FILE NAME !!!)
SET LineageFolderPath="C:\Program Files\Lineage II\Localhost\"
REM SET After Login Server start Delay
SET LoginServerDelay=5
REM SET After Game Server start Delay
SET GameServerDelay=45
 

IF EXIST %LoginServerPath% ( 
	chdir /d %LoginServerPath%
	IF NOT EXIST startLoginServer.bat (	
		ECHO We can't find file name startLoginServer.bat into %LoginServerPath% ! ! !
		goto error
	)
	start "" startLoginServer.bat
	ECHO Login Server started ! ! !
	TIMEOUT %LoginServerDelay%
	goto gameserver
) ELSE (
	ECHO We can't find folder path %LoginServerPath%  ! ! !
    goto error
)

:gameserver

IF EXIST %GameServerPath% (
	chdir /d %GameServerPath%
	IF NOT EXIST startGameServer.bat (	
		ECHO We can't find file name startGameServer.bat into %GameServerPath%  ! ! !
		goto error
	)
	start "" startGameServer.bat
	ECHO Game Server started ! ! !
	TIMEOUT %GameServerDelay%
	goto l2
) ELSE (
	ECHO We can't find folder path  %GameServerPath% ! ! !
    goto error
)

:l2

IF EXIST %LineageFolderPath% (
	chdir /d "%LineageFolderPath%"
	IF NOT EXIST l2.exe (	
		ECHO We can't find file name l2.exe into %LineageFolderPath% ! ! !
	)
	start "" l2.exe
	ECHO L2 Client started ! ! !	
	goto started
) ELSE (
	ECHO We can't find folder path  %LineageFolderPath% ! ! !
    goto error
)

:started
echo Have a nice game SAFOR admin ! ! !
goto exit

:error
echo.
echo Terminated abnormally
echo Send you bug to : %CONTACT%
echo.
goto exit
:exit
pause
exit
REM MAIN PAUSE FOR ANOTHER ERROR MESSAGES
pause
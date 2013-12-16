@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION 
 REM 作者：Findyou
 REM 时间：2013.11.22
 SET C_PATH=%CD%
 FOR %%I IN (*.apk) DO (
     ECHO [反编译 %%I]
     ECHO --------------------------------
     REM 检查文件夹，如果已存在则先删除
     SET SRT=%%I
	 IF EXIST "!SRT:~0,-4!_src" (
	 ECHO [检查存在目标文件夹] 
	 ECHO [删除!SRT:~0,-4!_src]
	 RD /S /Q !SRT:~0,-4!_src
 )
	 ECHO [反编译开始...]
	 ECHO -------------------------------
	 ECHO apktool d !SRT! !SRT:~0,-4!_src
	 ECHO -------------------------------
	 CD %C_PATH%\apktool
	 CALL apktool.bat d %C_PATH%\!SRT! %C_PATH%\!SRT:~0,-4!_src
	 REM CALL apktool.bat d !SRT! !SRT:~0,-4!_src
	 ECHO -------------------------------
	 ECHO [反编译完成]
	 ECHO.
  )
 PAUSE
 @ECHO ON
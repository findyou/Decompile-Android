@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION 
 REM ���ߣ�Findyou
 REM ʱ�䣺2013.11.22
 SET C_PATH=%CD%
 FOR %%I IN (*.apk) DO (
     ECHO [������ %%I]
     ECHO --------------------------------
     REM ����ļ��У�����Ѵ�������ɾ��
     SET SRT=%%I
	 IF EXIST "!SRT:~0,-4!_src" (
	 ECHO [������Ŀ���ļ���] 
	 ECHO [ɾ��!SRT:~0,-4!_src]
	 RD /S /Q !SRT:~0,-4!_src
 )
	 ECHO [�����뿪ʼ...]
	 ECHO -------------------------------
	 ECHO apktool d !SRT! !SRT:~0,-4!_src
	 ECHO -------------------------------
	 CD %C_PATH%\apktool
	 CALL apktool.bat d %C_PATH%\!SRT! %C_PATH%\!SRT:~0,-4!_src
	 REM CALL apktool.bat d !SRT! !SRT:~0,-4!_src
	 ECHO -------------------------------
	 ECHO [���������]
	 ECHO.
  )
 PAUSE
 @ECHO ON
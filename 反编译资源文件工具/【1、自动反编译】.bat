@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
COLOR 4D
CLS
ECHO ########################
ECHO #    ��������BAT��     #
ECHO #      ����:Findyou    #     
ECHO #   ʱ�䣺2013-11-22   #
ECHO ########################
ECHO. 
SET C_PATH=%CD%
ECHO [��ǰĿ¼��APK�ļ��б�:]
ECHO -------------------------------
SET number=0
FOR /F "delims=" %%a in ('dir /a-d/b *.apk') do (
    SET /a number+=1
    SET software!number!=%%a
	ECHO !number!.��%%a��
)
ECHO -------------------------------
ECHO.

:Choose
SET input=1
SET /P input=[����Ҫ������APK���(Ĭ��:1)] 
FOR /L %%a IN (1,1,!number!) DO (
    IF %input% equ %%a GOTO Decompilation
)
GOTO Choose

:Decompilation
SET srt=!software%input%!
CD %C_PATH%
ECHO [��ѡ����] %input%
ECHO.
ECHO [���...]
ECHO -------------------------------
IF EXIST %srt:~0,-4%_src (
	ECHO [����%srt:~0,-4%_src�ļ���,ɾ��?]
	RD /S %srt:~0,-4%_src
	IF EXIST %srt:~0,-4%_src (
		ECHO.
		ECHO [��������ֹ] & GOTO End
	)
)
IF EXIST %srt% (
	ECHO [������...]
	ECHO.
	ECHO [�����뿪ʼ...]
	CD %C_PATH%\apktool
	ECHO -------------------------------
	ECHO apktool d %srt% %srt:~0,-4%_src
	ECHO -------------------------------
	apktool d %C_PATH%\%srt% %C_PATH%\%srt:~0,-4%_src
	ECHO -------------------------------
	ECHO [���������]
	ECHO.
	PAUSE
)

:End
ECHO [End]
ECHO.
PAUSE

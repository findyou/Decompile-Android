@ECHO OFF&SETLOCAL ENABLEDELAYEDEXPANSION
COLOR 4D
CLS
ECHO ########################
ECHO #    ���Զ������      #
ECHO #      ����:Findyou    #     
ECHO #   ʱ�䣺2013-11-22   #
ECHO ########################
ECHO. 
SET C_PATH=%CD%
ECHO [��ǰĿ¼�ļ����б�:]
ECHO -------------------------------
SET number=0
FOR /F "delims=" %%a IN ('DIR /AD/B *_src') DO (
	SET /a number+=1	
    SET software!number!=%%a
	ECHO !number!.%%a
)
ECHO -------------------------------
ECHO.

:Choose
SET input=1
SET /P input=[���뷴����Դ���ļ������(Ĭ��:1)] 
FOR /L %%a IN (1,1,!number!) DO (
    IF %input% equ %%a GOTO Checkfile
)
GOTO Choose

:Checkfile
ECHO [��ѡ����] %input%
ECHO.
ECHO [���...]
SET srt=!software%input%!
IF EXIST %srt%.apk ( SET /p choice=[����"%srt%.apk",�Ƿ�ɾ����y/n] )
IF "%choice%"=="n" GOTO End
IF EXIST %srt%.apk ( GOTO Delfile ) else ( GOTO Bale )

:Delfile
ECHO [��ѡ����] y
ECHO [ɾ����%srt%.apk...]
DEL %srt%.apk

:Bale
REM SET srt=!software%input%!
ECHO [������...]
CD %C_PATH%
ECHO.
ECHO [�����ʼ...]
IF EXIST %srt% (
	ECHO [ִ�д������...]
	CD %C_PATH%\apktool
	ECHO apktool b %srt% %srt%.apk
	ECHO -------------------------------
	apktool b %C_PATH%\%srt% %C_PATH%\%srt%.apk
	ECHO -------------------------------
	ECHO [������...]
	ECHO.
	PAUSE
)

:End
ECHO [��ֹ���]
ECHO.
PAUSE

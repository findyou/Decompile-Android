@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
COLOR 4D
CLS
ECHO ########################
ECHO #    【反编译BAT】     #
ECHO #      作者:Findyou    #     
ECHO #   时间：2013-11-22   #
ECHO ########################
ECHO. 
SET C_PATH=%CD%
ECHO [当前目录下APK文件列表:]
ECHO -------------------------------
SET number=0
FOR /F "delims=" %%a in ('dir /a-d/b *.apk') do (
    SET /a number+=1
    SET software!number!=%%a
	ECHO !number!.【%%a】
)
ECHO -------------------------------
ECHO.

:Choose
SET input=1
SET /P input=[输入要反编译APK序号(默认:1)] 
FOR /L %%a IN (1,1,!number!) DO (
    IF %input% equ %%a GOTO Decompilation
)
GOTO Choose

:Decompilation
SET srt=!software%input%!
CD %C_PATH%
ECHO [您选择了] %input%
ECHO.
ECHO [检查...]
ECHO -------------------------------
IF EXIST %srt:~0,-4%_src (
	ECHO [存在%srt:~0,-4%_src文件夹,删除?]
	RD /S %srt:~0,-4%_src
	IF EXIST %srt:~0,-4%_src (
		ECHO.
		ECHO [反编译终止] & GOTO End
	)
)
IF EXIST %srt% (
	ECHO [检查完成...]
	ECHO.
	ECHO [反编译开始...]
	CD %C_PATH%\apktool
	ECHO -------------------------------
	ECHO apktool d %srt% %srt:~0,-4%_src
	ECHO -------------------------------
	apktool d %C_PATH%\%srt% %C_PATH%\%srt:~0,-4%_src
	ECHO -------------------------------
	ECHO [反编译完成]
	ECHO.
	PAUSE
)

:End
ECHO [End]
ECHO.
PAUSE

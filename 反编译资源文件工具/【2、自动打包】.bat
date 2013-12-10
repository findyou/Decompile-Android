@ECHO OFF&SETLOCAL ENABLEDELAYEDEXPANSION
COLOR 4D
CLS
ECHO ########################
ECHO #    【自动打包】      #
ECHO #      作者:Findyou    #     
ECHO #   时间：2013-11-22   #
ECHO ########################
ECHO. 
SET C_PATH=%CD%
ECHO [当前目录文件夹列表:]
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
SET /P input=[输入反编译源码文件夹序号(默认:1)] 
FOR /L %%a IN (1,1,!number!) DO (
    IF %input% equ %%a GOTO Checkfile
)
GOTO Choose

:Checkfile
ECHO [您选择了] %input%
ECHO.
ECHO [检查...]
SET srt=!software%input%!
IF EXIST %srt%.apk ( SET /p choice=[存在"%srt%.apk",是否删除？y/n] )
IF "%choice%"=="n" GOTO End
IF EXIST %srt%.apk ( GOTO Delfile ) else ( GOTO Bale )

:Delfile
ECHO [您选择了] y
ECHO [删除旧%srt%.apk...]
DEL %srt%.apk

:Bale
REM SET srt=!software%input%!
ECHO [检查完成...]
CD %C_PATH%
ECHO.
ECHO [打包开始...]
IF EXIST %srt% (
	ECHO [执行打包命令...]
	CD %C_PATH%\apktool
	ECHO apktool b %srt% %srt%.apk
	ECHO -------------------------------
	apktool b %C_PATH%\%srt% %C_PATH%\%srt%.apk
	ECHO -------------------------------
	ECHO [打包完成...]
	ECHO.
	PAUSE
)

:End
ECHO [终止打包]
ECHO.
PAUSE

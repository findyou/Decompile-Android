@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION 
 REM 作者：Findyou
 REM 时间：2013.12.09
 REM Dex2jar工具目录名
 SET DEX2JAR_NAME=dex2jar-0.0.9.15
 SET C_PATH=%CD%
 FOR %%I IN (*.apk) DO (
     ECHO. 反编译 %%I
	 ECHO --------------------------------     
     ECHO. 创建与APK同名的临时文件夹
     REM 创建文件夹，如果已存在则先删除
	 SET SRT=%%I
     RD /S /Q 【%%I】
	 DEL !SRT:~0,-4!-dex2jar.jar
     MD 【%%I】
     REM 复制反编译的apk文件到同名的文件夹中
	 ECHO. 复制需反编译APK至临时文件夹
     COPY %%I 【%%I】
	 REM 进入同名的文件夹
     CD 【%%I】
	 ECHO. 解压APK %%I
     REM 解压APK文件
     JAR -xvf %%I
	 
	 SET SRT=%%I
	 REM 重命名文件
	 REN classes.dex !SRT:~0,-4!.dex
     REM 移动dex到Dex2jar文件夹中
	 ECHO 移动Dex文件到Dex工具目录中
	 MOVE !SRT:~0,-4!.dex ../%DEX2JAR_NAME%
     REM 删除复制到临时文件夹中的APK文件	 
	 CD ..
	 REM 删除同名文件夹
     RD /S /Q 【%%I】
	 REM 进入Dex2jar文件夹
	 CD %DEX2JAR_NAME%
	 REM 执行反编译
	 CALL d2j-dex2jar.bat !SRT:~0,-4!.dex	 
	 
	 REM 删除DEX文件
	 DEL *.dex
	 REM 拷贝文件到源APK目录
	 ECHO 移动!SRT:~0,-4!-dex2jar.jar 到源APK目录
	 MOVE *-dex2jar.jar ../
     ECHO [反编译完成]
	 ECHO --------------------------------
     ECHO.	 
	 CD %C_PATH%
 )
 PAUSE
 @ECHO ON
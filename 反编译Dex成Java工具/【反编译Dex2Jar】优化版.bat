@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
 REM ���ߣ�Findyou
 REM ʱ�䣺2013.12.09
 REM Dex2jar����Ŀ¼��
 SET DEX2JAR_NAME=dex2jar-0.0.9.15
 SET C_PATH=%CD%
 FOR %%I IN (*.apk) DO (
     ECHO [������ %%I]
     ECHO ================================
     REM ECHO --------------------------------
     ECHO [������APKͬ������ʱ�ļ���]
     REM �����ļ��У�����Ѵ�������ɾ��
     SET SRT=%%I
     RD /S /Q %%I_temp 2>nul
     DEL !SRT:~0,-4!-dex2jar.jar 2>nul
     MD %%I_temp
     REM ���Ʒ������apk�ļ���ͬ�����ļ�����
     ECHO [�����跴����APK����ʱ�ļ���]
     COPY %%I %%I_temp 1>nul
	 
     REM ����ͬ�����ļ���
     CD %%I_temp
     ECHO [��ѹAPK: %%I]
     JAR -xf %%I
	 
     SET SRT=%%I
     REM �������ļ�
     REN classes.dex !SRT:~0,-4!.dex
     REM �ƶ�dex��Dex2jar�ļ�����
     ECHO [�ƶ�Dex�ļ���Dex����Ŀ¼��]
     MOVE !SRT:~0,-4!.dex ../%DEX2JAR_NAME%
     REM ����Dex2jar�ļ���
     CD %C_PATH%\%DEX2JAR_NAME%
     ECHO [ִ�з�����]
     CALL d2j-dex2jar.bat !SRT:~0,-4!.dex

     ECHO [�ƶ�!SRT:~0,-4!-dex2jar.jar ��ԴAPKĿ¼]
     MOVE *-dex2jar.jar ../  1>nul
     
     ECHO [ɾ����ʱ�ļ�]
     CD %C_PATH%
     DEL %DEX2JAR_NAME%\*.dex
     RD /S /Q %%I_temp   
     ECHO [���������]
     ECHO --------------------------------
     ECHO.
 )
 PAUSE
 @ECHO ON
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION 
 REM ���ߣ�Findyou
 REM ʱ�䣺2013.12.09
 REM Dex2jar����Ŀ¼��
 SET DEX2JAR_NAME=dex2jar-0.0.9.15
 SET C_PATH=%CD%
 FOR %%I IN (*.apk) DO (
     ECHO. ������ %%I
	 ECHO --------------------------------     
     ECHO. ������APKͬ������ʱ�ļ���
     REM �����ļ��У�����Ѵ�������ɾ��
	 SET SRT=%%I
     RD /S /Q ��%%I��
	 DEL !SRT:~0,-4!-dex2jar.jar
     MD ��%%I��
     REM ���Ʒ������apk�ļ���ͬ�����ļ�����
	 ECHO. �����跴����APK����ʱ�ļ���
     COPY %%I ��%%I��
	 REM ����ͬ�����ļ���
     CD ��%%I��
	 ECHO. ��ѹAPK %%I
     REM ��ѹAPK�ļ�
     JAR -xvf %%I
	 
	 SET SRT=%%I
	 REM �������ļ�
	 REN classes.dex !SRT:~0,-4!.dex
     REM �ƶ�dex��Dex2jar�ļ�����
	 ECHO �ƶ�Dex�ļ���Dex����Ŀ¼��
	 MOVE !SRT:~0,-4!.dex ../%DEX2JAR_NAME%
     REM ɾ�����Ƶ���ʱ�ļ����е�APK�ļ�	 
	 CD ..
	 REM ɾ��ͬ���ļ���
     RD /S /Q ��%%I��
	 REM ����Dex2jar�ļ���
	 CD %DEX2JAR_NAME%
	 REM ִ�з�����
	 CALL d2j-dex2jar.bat !SRT:~0,-4!.dex	 
	 
	 REM ɾ��DEX�ļ�
	 DEL *.dex
	 REM �����ļ���ԴAPKĿ¼
	 ECHO �ƶ�!SRT:~0,-4!-dex2jar.jar ��ԴAPKĿ¼
	 MOVE *-dex2jar.jar ../
     ECHO [���������]
	 ECHO --------------------------------
     ECHO.	 
	 CD %C_PATH%
 )
 PAUSE
 @ECHO ON
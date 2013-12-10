@ECHO OFF
 REM ����:Findyou
 REM ʱ��:2013.12.09
 REM key������
 SET KEYSTORE_NAME=debug.keystore
 REM key�ı���
 SET KEYSTORE_ALIAS=androiddebugkey
 REM key������
 SET KEYSTORE_STOREPASS=android
 SET KEYSTORE_KEYPASS=android
 REM ��ʱ�ļ�������ʱ�ļ�����
 SET TEMP_PREFIX=temp_
 REM ��ǩ����apk�ļ���ǰ׺
 SET RE-SIGNED=Re-signed_
 FOR %%I IN (*.apk) DO (
  ECHO [��ǩ�� %%I]
     ECHO [������APKͬ�����ļ���]
     REM �����ļ��У�����Ѵ�������ɾ��
     RD /S /Q ��%%I��
     MD ��%%I��\%TEMP_PREFIX%
     REM ������Ҫ����ǩ����apk�ļ�����ʱ�ļ�����
     COPY %%I ��%%I��\%TEMP_PREFIX%
	 REM ����key��APKͬ���ļ�����
     COPY %KEYSTORE_NAME% ��%%I��
	 REM ������ʱ�ļ���
     CD ��%%I��\%TEMP_PREFIX%

  REM ��ѹAPK�ļ�
     JAR -xvf %%I
     REM ɾ�����Ƶ���ʱ�ļ����е�APK�ļ�
     DEL %%I
     REM ɾ��MANIFEST
     RD /S /Q META-INF

  REM ����ѹ����apk�ļ�
     ECHO [���´����APK]
	 JAR -cvf ../%TEMP_PREFIX%%%I ./
	 CD ..

  ECHO [JARSIGNER %%I]
     REM ��APK������ǩ��
     JARSIGNER -VERBOSE -KEYSTORE %KEYSTORE_NAME% -STOREPASS %KEYSTORE_STOREPASS% %TEMP_PREFIX%%%I %KEYSTORE_ALIAS% -KEYPASS %KEYSTORE_KEYPASS%
  
     ECHO [ɾ��JARSIGNER��ʱ�ļ�]
     RD /S /Q %TEMP_PREFIX%
	 REM ɾ��ͬ���ļ����и��Ƶ�debug.keystore
     DEL %KEYSTORE_NAME%
  
  ECHO [ZIPALIGN %%I]
     REM ʹ��android��zipalign���߶�apk�ļ������Ż�
     ZIPALIGN -v 4 %TEMP_PREFIX%%%I %RE-SIGNED%%%I
     REM ���apk�ļ��Ƿ��Ż�
     ZIPALIGN -c -v 4 %RE-SIGNED%%%I
     ECHO [ɾ��ZIPALIGN��ʱ�ļ�]
     REM ɾ���Ż�ǰ��APK�ļ��������Ż����APK
     DEL %TEMP_PREFIX%%%I
     CD ..
	 ECHO [��ǩ�����]  %RE-SIGNED%%%I
	 ECHO.
 )
 PAUSE
 @ECHO ON
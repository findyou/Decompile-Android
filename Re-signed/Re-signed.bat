@ECHO OFF
 REM 作者:Findyou
 REM 时间:2013.12.09
 REM key的名称
 SET KEYSTORE_NAME=debug.keystore
 REM key的别名
 SET KEYSTORE_ALIAS=androiddebugkey
 REM key的密码
 SET KEYSTORE_STOREPASS=android
 SET KEYSTORE_KEYPASS=android
 REM 临时文件名或临时文件夹名
 SET TEMP_PREFIX=temp_
 REM 重签名后apk文件名前缀
 SET RE-SIGNED=Re-signed_
 FOR %%I IN (*.apk) DO (
  ECHO [重签名 %%I]
     ECHO [创建与APK同名的文件夹]
     REM 创建文件夹，如果已存在则先删除
     RD /S /Q 【%%I】
     MD 【%%I】\%TEMP_PREFIX%
     REM 复制需要重新签名的apk文件到临时文件夹中
     COPY %%I 【%%I】\%TEMP_PREFIX%
	 REM 复制key到APK同名文件夹中
     COPY %KEYSTORE_NAME% 【%%I】
	 REM 进入临时文件夹
     CD 【%%I】\%TEMP_PREFIX%

  REM 解压APK文件
     JAR -xvf %%I
     REM 删除复制到临时文件夹中的APK文件
     DEL %%I
     REM 删除MANIFEST
     RD /S /Q META-INF

  REM 重新压缩成apk文件
     ECHO [重新打包成APK]
	 JAR -cvf ../%TEMP_PREFIX%%%I ./
	 CD ..

  ECHO [JARSIGNER %%I]
     REM 对APK包重新签名
     JARSIGNER -VERBOSE -KEYSTORE %KEYSTORE_NAME% -STOREPASS %KEYSTORE_STOREPASS% %TEMP_PREFIX%%%I %KEYSTORE_ALIAS% -KEYPASS %KEYSTORE_KEYPASS%
  
     ECHO [删除JARSIGNER临时文件]
     RD /S /Q %TEMP_PREFIX%
	 REM 删除同名文件夹中复制的debug.keystore
     DEL %KEYSTORE_NAME%
  
  ECHO [ZIPALIGN %%I]
     REM 使用android的zipalign工具对apk文件进行优化
     ZIPALIGN -v 4 %TEMP_PREFIX%%%I %RE-SIGNED%%%I
     REM 检查apk文件是否被优化
     ZIPALIGN -c -v 4 %RE-SIGNED%%%I
     ECHO [删除ZIPALIGN临时文件]
     REM 删除优化前的APK文件，保留优化后的APK
     DEL %TEMP_PREFIX%%%I
     CD ..
	 ECHO [重签名完成]  %RE-SIGNED%%%I
	 ECHO.
 )
 PAUSE
 @ECHO ON
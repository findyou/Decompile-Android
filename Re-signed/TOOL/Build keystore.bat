@ECHO OFF
COLOR 4D
ECHO ============================================================
ECHO #                ���ֹ�����debug.keystore��                #
ECHO #              ����:Findyou ʱ�䣺2013-11-22               #
ECHO ============================================================
ECHO. 
ECHO [ʾ��]
ECHO  -------------------------------
ECHO # ����keystore����: android     #
ECHO # ����������������ʲô��        #
ECHO #   [Unknown]��  Android Debug  #
ECHO # ������֯��λ������ʲô��      #
ECHO #   [Unknown]��  Android        #
ECHO # ������֯������ʲô��          #
ECHO #   [Unknown]��  Android        #
ECHO # �����ڵĳ��л�����������ʲô��#
ECHO #   [Unknown]��  ShenZhen       #
ECHO # �����ڵ��ݻ�ʡ��������ʲô��  #
ECHO #   [Unknown]��  GuangDong      #
ECHO # �õ�λ������ĸ���Ҵ�����ʲô  #
ECHO #   [Unknown]��  CN             #
ECHO  -------------------------------
ECHO. 
ECHO [���...]
IF EXIST debug.keystore ( GOTO Delfile ) else ( GOTO Create_file )

:Delfile
SET /p choice=[����debug.keystore,�Ƿ�ɾ����(Ĭ��ɾ��) y/n]
IF "%choice%"=="n" ECHO [�˳�����ǩ��] & GOTO Ending
ECHO [ɾ����keystore...]
DEL debug.keystore

:Create_file
ECHO [��ʼ�����µ�keystore...]
ECHO -------------------------------
KEYTOOL -genkey -v -keystore debug.keystore -alias androiddebugkey -keyalg RSA -validity 10000

:Ending
ECHO [End]
ECHO.
PAUSE
@ECHO OFF
COLOR 4D
ECHO ============================================================
ECHO #                【手工生成debug.keystore】                #
ECHO #              作者:Findyou 时间：2013-11-22               #
ECHO ============================================================
ECHO. 
ECHO [示例]
ECHO  -------------------------------
ECHO # 输入keystore密码: android     #
ECHO # 您的名字与姓氏是什么？        #
ECHO #   [Unknown]：  Android Debug  #
ECHO # 您的组织单位名称是什么？      #
ECHO #   [Unknown]：  Android        #
ECHO # 您的组织名称是什么？          #
ECHO #   [Unknown]：  Android        #
ECHO # 您所在的城市或区域名称是什么？#
ECHO #   [Unknown]：  ShenZhen       #
ECHO # 您所在的州或省份名称是什么？  #
ECHO #   [Unknown]：  GuangDong      #
ECHO # 该单位的两字母国家代码是什么  #
ECHO #   [Unknown]：  CN             #
ECHO  -------------------------------
ECHO. 
ECHO [检查...]
IF EXIST debug.keystore ( GOTO Delfile ) else ( GOTO Create_file )

:Delfile
SET /p choice=[存在debug.keystore,是否删除？(默认删除) y/n]
IF "%choice%"=="n" ECHO [退出生成签名] & GOTO Ending
ECHO [删除旧keystore...]
DEL debug.keystore

:Create_file
ECHO [开始生成新的keystore...]
ECHO -------------------------------
KEYTOOL -genkey -v -keystore debug.keystore -alias androiddebugkey -keyalg RSA -validity 10000

:Ending
ECHO [End]
ECHO.
PAUSE
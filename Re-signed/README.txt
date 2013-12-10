一、BAT介绍
作者：Findyou
时间：2013-12-09

功能：主要为APK重签名


二、操作步骤
==========================================================
1.拷贝debug.keystore到[当前目录]
2.拷贝需要重签名的APK到[当前目录]
3.运行Re-signed.bat重签名文件
==========================================================
结果：
a.生成与文件同名的文件夹
b.同名文件夹下Re-signed_XXX.apk为重签名后的apk


三、说明
1).[当前目录]  Re-signed.bat所在的目录
2).debug.keystore签名文件
拷贝路径:C:\Documents and Settings\用户名\.android\debug.keystore
如果没有，请用TOOL\Build keystore.bat 手动生成后，拷贝[当前目录]

注意：
前提有JDK，并配置好路径
文件名必须为：debug.keystore
别名必须为：androiddebugkey
密码必须为：android
否则需要自己修改Re-signed.bat文件

例：
如果不用Build keystore.bat脚本，手工签命令
CMD>keytool -genkey -v -keystore debug.keystore -alias androiddebugkey -keyalg RSA -validity 10000

输入keystore密码: android
您的名字与姓氏是什么？   
  [Unknown]：  Android Debug
您的组织单位名称是什么？ 
  [Unknown]：  Android   
您的组织名称是什么？     
  [Unknown]：  Android   
您所在的城市或区域名称是什么？
  [Unknown]：  ShenZhen  
您所在的州或省份名称是什么？
  [Unknown]：  GuangDong 
该单位的两字母国家代码是什么？
  [Unknown]：  CN
  

四、日志
2013-12-09 创建BAT，网络搜索总结完成，感谢强大的Google、度娘
2013-12-10 重新整理格式，统一作者名字


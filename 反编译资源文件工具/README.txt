一、BAT介绍
作者：Findyou
时间：2013-11-22

功能：【1、自动反编译】.bat   自动将当前目录中的APK全部反编译
功能：【1、自动反编译】.bat   将已反编译修改的*-src文件夹打包成APK

二、基本步骤
==========================================================
1.反编译         【1、自动反编译】.bat 
2.修改后，打包   【3、自动打包】.bat
3.重签名          Re-signed 工具
==========================================================


三、说明：
1.主要反编译XML等资源文件       ->汉化必备
2.可以重新打包成APK             ->需要重新签名

注意：
1).反编译的文件夹名不要重命名

apktool 1.5工具网络获取
http://code.google.com/p/android-apktool/downloads/list

命令：
反编译
apktool d %path%\findyou.apk %path%\findyou_src

打包
apktool b %path%\findyou_src %path%\findyou_src.apk 


四、日志
2013-11-22  创建BAT文件
2013-12-10  优化代码结构，统一格式

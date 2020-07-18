@echo off
if exist version.txt (set /p uv=<version.txt) else (echo 未发现version.txt，视为未安装，正在安装&getraw&set /p version=<version.txt&goto Update)
:login
set passworld=%random%
set /p input=您此次请求的验证码为:%passworld%,请输入验证码：
if "%input%"=="%passworld%" (echo.验证有效 开始验证设备是否联网) else (echo.验证码输入错误 请重试&goto login)
ipconfig|findstr "媒体状态" > 网络.txt
set /p web=<网络.txt
if "%web%"=="" (echo true&set networklink=true) else (echo false&set networklink=false)
del 网络.txt
set web=<nul
if "%networklink%"=="true" (echo.设备已连接至互联网 即将开始检验更新&timeout 2&cls)
if "%networklink%"=="false" (echo.设备未连接至互联网 请链接网络后重试&timeout 5&exit)
getraw
set /p version=<version.txt
if "%uv%" lss "%version%" (
echo.%uv%>version.txt
echo 发现更新的版本，是否更新？取消则退出&pause
goto Update
)
if not "%uv%" lss "%version%" (
echo.当前版本已是最新版本 无需更新
echo.%uv%>version.txt
timeout 10
exit
)
:Update
wget https://codeload.github.com/ArsiIksait/-/zip/master
del .wget-hsts
ren master master.zip
7z X master.zip
del master.zip
copy /y --master\version.txt %cd%
copy /y --master\Error_reporter.bat %cd%
copy /y --master\批量重命名文件.bat %cd%
rd /s /q --master
set /p dv=<version.txt
echo.
if "%dv%"=="%version%" (echo.更新成功!) else (echo 更新失败,请手动更新!&timeout 5&start https://github.com/ArsiIksait/-)
timeout 10
exit
@echo off&title 批量重命名文件&color 0b&set filenumber=0&set success=0&set fail=0&Setlocal EnableDelayedExpansion
set sharepath=%cd%
echo 请复制文件对照关系
timeout 60
set /p a=防误触，按回车继续
set a=<nul
mshta "javascript:var s=clipboardData.getData('text');if(s)new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(s);close();"|more >inputSQLdate.txt
echo 即将开始重命名&timeout 5
for /f "tokens=1,2 delims=," %%i in (inputSQLdate.txt) do (
echo.%date%-%time%:将%%i重命名为%%j
set /a filenumber+=1
if not exist %%i (
set /a fail+=1
call Error_reporter bug "%Date%-%Time% 错误!fail!将%%i重命名为%%j时出错!未找到重命前的文件"
)
ren %sharepath%\%%i %%j
if exist %%j (
set /a success+=1
call Error_reporter unbug "%Date%-%Time% 成功!success!:将%%i重命名为%%j时成功 已重命名成功"
)
if not exist %%j (
set /a fail+=1
set /a success-=1
call Error_reporter bug "%Date%-%Time%:错误!fail!:将%%i重命名为%%j时出错!未找到重命名后的文件,重命名失败"
)
)
call Error_reporter unbug --------------------------------------------------------------------
call Error_reporter unbug "%Date%-%Time%错误汇报结束 成功!success!个 失败!fail!个 总!filenumber!个文件"
call Error_reporter end
echo.%date%-%time%:重命名完成 成功!success!个 失败!fail!个 总!filenumber!个文件
del inputSQLdate.txt
start Error_reporter.html
timeout 10
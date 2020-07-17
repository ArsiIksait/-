@echo off
ipconfig|findstr "箪悶彜蓑" > 利大.txt
set /p web=<利大.txt
if "%web%"=="" (echo true) else (echo false)
del 利大.txt
set web=<nul
goto :eof
@echo off
ipconfig|findstr "ý��״̬" > ����.txt
set /p web=<����.txt
if "%web%"=="" (echo true) else (echo false)
del ����.txt
set web=<nul
goto :eof
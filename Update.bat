@echo off
if exist version.txt (set /p uv=<version.txt) else (echo δ����version.txt����Ϊδ��װ�����ڰ�װ&getraw&set /p version=<version.txt&goto Update)
:login
set passworld=%random%
set /p input=���˴��������֤��Ϊ:%passworld%,��������֤�룺
if "%input%"=="%passworld%" (echo.��֤��Ч ��ʼ��֤�豸�Ƿ�����) else (echo.��֤��������� ������&goto login)
ipconfig|findstr "ý��״̬" > ����.txt
set /p web=<����.txt
if "%web%"=="" (echo true&set networklink=true) else (echo false&set networklink=false)
del ����.txt
set web=<nul
if "%networklink%"=="true" (echo.�豸�������������� ������ʼ�������&timeout 2&cls)
if "%networklink%"=="false" (echo.�豸δ������������ ���������������&timeout 5&exit)
getraw
set /p version=<version.txt
if "%uv%" lss "%version%" (
echo.%uv%>version.txt
echo ���ָ��µİ汾���Ƿ���£�ȡ�����˳�&pause
goto Update
)
if not "%uv%" lss "%version%" (
echo.��ǰ�汾�������°汾 �������
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
copy /y --master\�����������ļ�.bat %cd%
rd /s /q --master
set /p dv=<version.txt
echo.
if "%dv%"=="%version%" (echo.���³ɹ�!) else (echo ����ʧ��,���ֶ�����!&timeout 5&start https://github.com/ArsiIksait/-)
timeout 10
exit
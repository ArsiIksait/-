@echo off&title �����������ļ�&color 0b&set filenumber=0&set success=0&set fail=0&Setlocal EnableDelayedExpansion
set /p sharepath=������Ҫ���������ļ����ڵ��ļ��У�
copy Error_reporter.bat %sharepath% <nul
cd %sharepath%
echo �븴���ļ����չ�ϵ
timeout 60
set /p a=���󴥣����س�����
set a=<nul
mshta "javascript:var s=clipboardData.getData('text');if(s)new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(s);close();"|more >inputSQLdate.txt
echo ������ʼ������&timeout 5
for /f "tokens=1,2 delims=," %%i in (inputSQLdate.txt) do (
echo.%date%-%time%:��%%i������Ϊ%%j
set /a filenumber+=1
if not exist %%i (
set /a fail+=1
call Error_reporter bug "%Date%-%Time% ����!fail!��%%i������Ϊ%%jʱ����!δ�ҵ�����ǰ���ļ�"
)
ren %sharepath%\%%i %%j
if exist %%j (
set /a success+=1
call Error_reporter unbug "%Date%-%Time% �ɹ�!success!:��%%i������Ϊ%%jʱ�ɹ� ���������ɹ�"
)
if not exist %%j (
set /a fail+=1
set /a success-=1
call Error_reporter bug "%Date%-%Time%:����!fail!:��%%i������Ϊ%%jʱ����!δ�ҵ�����������ļ�,������ʧ��"
)
)
call Error_reporter unbug --------------------------------------------------------------------
call Error_reporter unbug "%Date%-%Time%����㱨���� �ɹ�!success!�� ʧ��!fail!�� ��!filenumber!���ļ�"
call Error_reporter end
echo.%date%-%time%:��������� �ɹ�!success!�� ʧ��!fail!�� ��!filenumber!���ļ�
del inputSQLdate.txt
del Error_reporter.bat
start Error_reporter.html
ping 127.0.0.1 -n 5 >nul
del Error_reporter.html
timeout 10
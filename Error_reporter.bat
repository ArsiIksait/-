@echo off
if exist runing.txt (goto :ADD)
(
echo.^<!DOCTYPE HTML^>
echo.^<html^>
echo.^<head^>
echo.	^<title^>Error reporter^</title^>
echo.	^<meta http-equiv="Content-Type" content="text/html; charset=ANSI" /^>
echo.	^<meta name="description" content="MADE BY ArsiIksait" /^>
echo.^</head^>
echo.^<body^>
echo.	^<div style="text-align: center"^>^<h1^>^<div style="color: #57faff"^>Error reporter^</div^>^</h1^>^</div^>
echo.^<i^>^<div style="text-align: left"^>^<div style="color: #49ac84"^>%Date%-%Time%-Reporters:^</div^>^</div^>^</i^>
echo.^<ol^>
)>Error_reporter.html
:ADD
if %1==bug (
(
echo.	^<div style="text-align: left"^>^<div style="color: #f53d19"^>%2^</div^>^</div^>
)>>Error_reporter.html
)
if %1==unbug (
(
echo.	^<div style="text-align: left"^>^<div style="color: #55ad89"^>%2^</div^>^</div^>
)>>Error_reporter.html
)
if %1==end (goto :END)
if not exist runing.txt (cd.>runing.txt)
goto :eof
:END
(
echo.^</ol^>
echo.^</body^>
echo.^</html^>
)>>Error_reporter.html
del runing.txt
goto :eof
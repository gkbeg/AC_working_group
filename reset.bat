@echo off

:: Closes Chrome ::
taskkill /F /IM chrome.exe /T

:: Set Paths :: 
set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\
set Documents=C:\Users\%USERNAME%\Documents\
set Desktop=C:\Users\%USERNAME%\Desktop\
set Pictures=C:\Users\%USERNAME%\Pictures\
set Downloads=C:\Users\%USERNAME%\Downloads\

del /q /s /f "%Documents%"
del /q /s /f "%Desktop%"
del /q /s /f "%Pictures%"
del /q /s /f "%Downloads%"

:: Delete Files ::
echo Clearing Chrome Data ... 
:: del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Google\Chrome\Default\History"
del /q /s /f "%ChromeDir%"
rd /s /q "%ChromeDir%"

echo Clearing the Recycle Bin...
powershell.exe -ExecutionPolicy Bypass -Command "Clear-RecycleBin -Force"2>NUL
echo Recycle Bin cleared.

del /F /Q %APPDATA%\Microsoft\Windows\Recent\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*

:: Restart Explorer ::
taskkill /f /im explorer.exe
start explorer.exe

:: Volume Down to 0 ::
    :: Creates Temporary JavaScript File ::
echo var oShell = new ActiveXObject("WScript.Shell"); >> vd.js
set "line=for (var i=0; i<50; i++){"
setlocal EnableDelayedExpansion
(
echo !line! 
) >> vd.js
echo oShell.SendKeys(String.fromCharCode(0xAE)); >> vd.js
echo } >> vd.js
     :: Run JavaScript ::
timeout /t 1
cscript /e:jscript vd.js
timeout /t 1
     :: Deletes Temporary JavaScript File ::
del /F/ Q vd.js

:: Change Laptop Lid Close Setting: Do Nothing
:: Note: Power Scheme = 'Balanced'
     :: Plugged In
powercfg /setACvalueIndex scheme_current sub_buttons lidAction 0
     :: On Battery
powercfg /setDCvalueIndex scheme_current sub_buttons lidAction 0
     :: Activate (x 2, otherwise it is not reliable)
powercfg /setActive scheme_current
powercfg /setActive scheme_current




:: Opens Chrome to URL in Maximized Mode
if exist "%localappdata%\google\chrome\application\chrome.exe" set file_found="yes" 
if not exist "%localappdata%\google\chrome\application\chrome.exe" set file_found="no" 
if %file_found%=="yes" set chrome_exe="%localappdata%\google\chrome\application\chrome.exe"

if exist "%programfiles%\google\chrome\application\chrome.exe" set file_found="yes" 
if not exist "%programfiles%\google\chrome\application\chrome.exe" set file_found="no" 
if %file_found%=="yes" set chrome_exe="%programfiles%\google\chrome\application\chrome.exe"

if exist "%programfiles(x86)%\google\chrome\application\chrome.exe" set file_found="yes" 
if not exist "%programfiles(x86)%\google\chrome\application\chrome.exe" set file_found="no" 
if %file_found%=="yes" set chrome_exe="%programfiles(x86)%\google\chrome\application\chrome.exe" 


start "" %chrome_exe% --start-maximized <URL>
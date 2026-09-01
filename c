@echo off
curl ip.me > %USERPROFILE%\ic.txt
echo %TIME% >> %APPDATA%\Blorb\logs.txt
echo Hello from batch >> "%USERPROFILE%\AppData\Local\Temp\batchtest.txt"

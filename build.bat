@echo off

mkdir tmp
mkdir 7za
cd tmp

:: download dependencies
curl https://www.7-zip.org/a/7za920.zip --ssl-revoke-best-effort -L -o 7za.zip
curl https://7-zip.org/a/7z2107-x64.exe --ssl-revoke-best-effort -L -o 7zip.exe
curl https://github.com/PowerShell/Win32-OpenSSH/releases/download/V8.6.0.0p1-Beta/OpenSSH-Win64.zip --ssl-revoke-best-effort -L -o openssh.zip
curl https://sourceforge.net/projects/vcxsrv/files/latest/download --ssl-revoke-best-effort -L -o vcxsrv.exe

:: use 7za to unzip 7zip (because the standalone cannot unpack vcxsrv)
cd ../7za
tar -xf ../tmp/7za.zip
cd ..
7za\7za.exe x -o7zip tmp\7zip.exe

:: extract openssh
7za\7za.exe x tmp\openssh.zip
ren OpenSSH-Win64 openssh

:: extract vcxsrv
7zip\7z.exe x -ovcxsrv tmp\vcxsrv.exe
rmdir /S /Q vcxsrv\$PLUGINSDIR

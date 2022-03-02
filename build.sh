#!/bin/sh

# install tools
sudo apt-get update
sudo apt-get install -y curl p7zip-full

# download dependencies
curl -L -o /tmp/openssh.zip https://github.com/PowerShell/Win32-OpenSSH/releases/download/V8.6.0.0p1-Beta/OpenSSH-Win64.zip
curl -L -o /tmp/vcxsrv.exe https://sourceforge.net/projects/vcxsrv/files/latest/download

# extract openssh
7z x /tmp/openssh.zip
mv OpenSSH-Win64 openssh

# extract vcxsrv
7z x -ovcxsrv /tmp/vcxsrv.exe
rm -rf ./vcxsrv/\$PLUGINSDIR/
rm -rf ./vcxsrv/fonts/

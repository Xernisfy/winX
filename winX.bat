@ECHO OFF

IF "%1" == "" TYPE help.txt & GOTO :EOF

TASKLIST | FINDSTR vcxsrv.exe >NUL|| START /B "" vcxsrv\vcxsrv.exe -ac -wgl -compositewm -notrayicon -dpi auto -multiwindow -clipboard -primary
SET DISPLAY=localhost:0.0
openssh\ssh.exe -Y %1

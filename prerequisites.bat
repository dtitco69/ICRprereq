@echo off
::Display warning message
echo Warning! MUST RUN WITH ADMINISTRATOR PRIVILAGES!! This file will disable and stop Windows Firewall and Action Centre from starting, your PC will reboot for the changes to be fully applied.
pause

::Test If script has Admin Priviledges/is elevated
AT > NUL
IF %ERRORLEVEL% EQU 0 (
ECHO you are Administrator
) ELSE (
ECHO you are NOT Administrator. Exiting...
PING 127.0.0.1 > NUL 2>&1
EXIT /B 1
)

echo Only continue if you are sure
pause

::Stop and disable windows firewall
net stop MpsSvc
REG add "HKLM\SYSTEM\CurrentControlSet\services\MpsSvc" /v Start /t REG_DWORD /d 4 /f

::disable action center Health
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /f /v HideSCAHealth /t REG_SZ /d 1


echo Press 'Enter' To restart your PC
pause
shutdown -r -t 00
